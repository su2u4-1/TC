#include "file.h"

#if PLATFORM == 1
#include <direct.h>  // MSVC
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
#include <unistd.h>  // MinGW or LINUX or MACOS
#endif

char* get_cwd(void) {
#if PLATFORM == 1
    return _getcwd(NULL, 0);  // MSVC
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
    return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
#else
    return NULL;  // Unknown platform
#endif
}

offset(File*) create_file(const string path) {
    offset(File*) file = alloc_memory(sizeof(File));
    File* file_ptr = (File*)offset_to_ptr(file);
    file_ptr->path = absolute_path(path);
    normalize_path(file);
    return file;
}

string absolute_path(string path) {
    char* path_cstr = string_to_cstr(path);
    size_t path_len = strlen(path_cstr);
    for (size_t i = 0; i < path_len; i++) {
        if (path_cstr[i] == '\\') path_cstr[i] = '/';
        if (i > 1 && path_cstr[i] == '/' && path_cstr[i - 1] == '.' && path_cstr[i - 2] == '/') {
            memmove(path_cstr + i - 1, path_cstr + i + 1, path_len - i);
            path_len -= 2;
            i -= 2;
        }
        if (i > 0 && path_cstr[i] == '/' && path_cstr[i - 1] == '/') {
            memmove(path_cstr + i, path_cstr + i + 1, path_len - i);
            path_len--;
            i--;
        }
    }
#if PLATFORM == 1
    if (path_len > 1 && (path_cstr[0] >= 'A' && path_cstr[0] <= 'Z') && path_cstr[1] == ':') {
        return path;
    }
#else
    if (path_len > 0 && path_cstr[0] == '/') {
        return path;
    }
#endif
    char* cwd = get_cwd();
    if (cwd == NULL)
        return path;
    size_t total_len = strlen(cwd) + 1 + path_len + 1;
    char* abs_path = string_to_cstr(alloc_memory(total_len));
    sprintf(abs_path, "%s/%s", cwd, path_cstr);
    free(cwd);
    return create_string(abs_path, total_len);
}

string get_file_name(offset(File*) path) {
    return ((File*)offset_to_ptr(path))->name;
}

string get_file_extension(offset(File*) path) {
    return ((File*)offset_to_ptr(path))->extension;
}

string get_file_dir(offset(File*) path) {
    File* file_ptr = (File*)offset_to_ptr(path);
    if (file_ptr->dirs == 0) return 0;

    // Calculate total length needed
    size_t total_len = 0;
    offset(StrNode*) current = file_ptr->dirs;
    size_t node_count = 0;

    while (current != 0) {
        StrNode* node_ptr = (StrNode*)offset_to_ptr(current);
        if (node_ptr->next != 0) {  // Not the last element (which is the filename)
            size_t dir_len = strlen(string_to_cstr(node_ptr->dir));
            total_len += dir_len;
            node_count++;
        }
        current = node_ptr->next;
    }

    if (node_count == 0) return 0;

    // Add space for separators (but not after root '/' or drive letter)
    if (node_count > 1) {
        total_len += (node_count - 1);
    }

    // Build the directory path
    char* dir_path = string_to_cstr(alloc_memory(total_len + 1));
    dir_path[0] = '\0';

    current = file_ptr->dirs;
    bool first = true;
    while (current != 0) {
        StrNode* node_ptr = (StrNode*)offset_to_ptr(current);
        if (node_ptr->next != 0) {  // Not the last element
            char* dir_cstr = string_to_cstr(node_ptr->dir);
            if (!first && strcmp(dir_cstr, "/") != 0) {
                // Add separator before non-root components
                if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/') {
                    strcat(dir_path, "/");
                }
            }
            strcat(dir_path, dir_cstr);
            first = false;
        }
        current = node_ptr->next;
    }

    return create_string(dir_path, strlen(dir_path));
}

string get_full_path(offset(File*) path) {
    return ((File*)offset_to_ptr(path))->path;
}

void change_file_extension(offset(File*) file, const string new_extension) {
    File* file_ptr = (File*)offset_to_ptr(file);
    file_ptr->extension = new_extension;

    // Rebuild the full path
    string dir = get_file_dir(file);
    char* dir_cstr = dir != 0 ? string_to_cstr(dir) : "";
    char* name_cstr = string_to_cstr(file_ptr->name);
    char* ext_cstr = new_extension != 0 ? string_to_cstr(new_extension) : "";

    size_t path_len = strlen(dir_cstr) + 1 + strlen(name_cstr);
    if (new_extension != 0) path_len += strlen(ext_cstr);

    char* new_path = string_to_cstr(alloc_memory(path_len + 1));
    if (dir != 0 && strlen(dir_cstr) > 0) {
        sprintf(new_path, "%s/%s", dir_cstr, name_cstr);
    } else {
        sprintf(new_path, "%s", name_cstr);
    }

    if (new_extension != 0) {
        strcat(new_path, string_to_cstr(new_extension));
    }

    file_ptr->path = create_string(new_path, strlen(new_path));
}

void change_file_name(offset(File*) file, const string new_name) {
    File* file_ptr = (File*)offset_to_ptr(file);
    file_ptr->name = new_name;

    // Update the last node in dirs list
    if (file_ptr->dirs != 0) {
        offset(StrNode*) current = file_ptr->dirs;

        while (current != 0) {
            StrNode* node_ptr = (StrNode*)offset_to_ptr(current);
            if (node_ptr->next == 0) {
                // This is the last node - update it
                char* name_cstr = string_to_cstr(new_name);
                char* ext_cstr = file_ptr->extension != 0 ? string_to_cstr(file_ptr->extension) : "";
                size_t full_name_len = strlen(name_cstr);
                if (file_ptr->extension != 0) full_name_len += strlen(ext_cstr);

                char* full_name = string_to_cstr(alloc_memory(full_name_len + 1));
                sprintf(full_name, "%s%s", name_cstr, ext_cstr);
                node_ptr->dir = create_string(full_name, strlen(full_name));
                break;
            }
            current = node_ptr->next;
        }
    }

    // Rebuild the full path
    string dir = get_file_dir(file);
    char* dir_cstr = dir != 0 ? string_to_cstr(dir) : "";
    char* name_cstr = string_to_cstr(new_name);
    char* ext_cstr = file_ptr->extension != 0 ? string_to_cstr(file_ptr->extension) : "";

    size_t path_len = strlen(dir_cstr) + 1 + strlen(name_cstr);
    if (file_ptr->extension != 0) path_len += strlen(ext_cstr);

    char* new_path = string_to_cstr(alloc_memory(path_len + 1));
    if (dir != 0 && strlen(dir_cstr) > 0) {
        sprintf(new_path, "%s/%s%s", dir_cstr, name_cstr, ext_cstr);
    } else {
        sprintf(new_path, "%s%s", name_cstr, ext_cstr);
    }

    file_ptr->path = create_string(new_path, strlen(new_path));
}

void normalize_path(offset(File*) file) {
    File* file_ptr = (File*)offset_to_ptr(file);
    char* original_path = string_to_cstr(file_ptr->path);
    size_t path_len = strlen(original_path);

    // Make a copy to work with
    char* path_copy = (char*)malloc(path_len + 1);
    strcpy(path_copy, original_path);

    offset(StrNode*) dirs_head = 0;
    offset(StrNode*) dirs_tail = 0;

    size_t start = 0;

#if PLATFORM == 1
    // Handle Windows drive letter (e.g., "C:")
    if (path_len > 1 && ((path_copy[0] >= 'A' && path_copy[0] <= 'Z') || (path_copy[0] >= 'a' && path_copy[0] <= 'z')) && path_copy[1] == ':') {
        offset(StrNode*) node = alloc_memory(sizeof(StrNode));
        StrNode* node_ptr = (StrNode*)offset_to_ptr(node);
        node_ptr->dir = create_string(path_copy, 2);
        node_ptr->next = 0;

        dirs_head = node;
        dirs_tail = node;
        start = 2;
        if (start < path_len && path_copy[start] == '/') start++;
    }
#else
    // Handle Unix absolute path
    if (path_len > 0 && path_copy[0] == '/') {
        offset(StrNode*) node = alloc_memory(sizeof(StrNode));
        StrNode* node_ptr = (StrNode*)offset_to_ptr(node);
        node_ptr->dir = create_string("/", 1);
        node_ptr->next = 0;

        dirs_head = node;
        dirs_tail = node;
        start = 1;
    }
#endif

    // Split path by '/' and process each component
    size_t i = start;
    while (i <= path_len) {
        if (i == path_len || path_copy[i] == '/') {
            if (i > start) {
                size_t comp_len = i - start;
                char component[256];
                strncpy(component, path_copy + start, comp_len);
                component[comp_len] = '\0';

                if (strcmp(component, ".") == 0) {
                    // Skip current directory
                } else if (strcmp(component, "..") == 0) {
                    // Go up one directory
                    if (dirs_tail != 0 && dirs_tail != dirs_head) {
                        StrNode* tail_ptr = (StrNode*)offset_to_ptr(dirs_tail);
                        char* tail_dir = string_to_cstr(tail_ptr->dir);

                        // Don't collapse ".." if the last component is also ".."
                        if (strcmp(tail_dir, "..") == 0) {
                            offset(StrNode*) node = alloc_memory(sizeof(StrNode));
                            StrNode* node_ptr = (StrNode*)offset_to_ptr(node);
                            node_ptr->dir = create_string("..", 2);
                            node_ptr->next = 0;
                            tail_ptr->next = node;
                            dirs_tail = node;
                        } else {
                            // Remove the last directory
                            offset(StrNode*) prev = dirs_head;
                            while (prev != 0 && ((StrNode*)offset_to_ptr(prev))->next != dirs_tail) {
                                prev = ((StrNode*)offset_to_ptr(prev))->next;
                            }
                            if (prev != 0) {
                                ((StrNode*)offset_to_ptr(prev))->next = 0;
                                dirs_tail = prev;
                            }
                        }
                    } else if (dirs_head == 0) {
                        // No directories yet, add ".."
                        offset(StrNode*) node = alloc_memory(sizeof(StrNode));
                        StrNode* node_ptr = (StrNode*)offset_to_ptr(node);
                        node_ptr->dir = create_string("..", 2);
                        node_ptr->next = 0;
                        dirs_head = node;
                        dirs_tail = node;
                    }
                } else if (strlen(component) > 0) {
                    // Regular directory or file
                    offset(StrNode*) node = alloc_memory(sizeof(StrNode));
                    StrNode* node_ptr = (StrNode*)offset_to_ptr(node);
                    node_ptr->dir = create_string(component, comp_len);
                    node_ptr->next = 0;

                    if (dirs_tail != 0) {
                        ((StrNode*)offset_to_ptr(dirs_tail))->next = node;
                    }
                    dirs_tail = node;
                    if (dirs_head == 0) dirs_head = node;
                }
            }
            start = i + 1;
        }
        i++;
    }

    free(path_copy);

    // Set the dirs list
    file_ptr = (File*)offset_to_ptr(file);
    file_ptr->dirs = dirs_head;

    // Extract filename and extension from the last node
    if (dirs_tail != 0) {
        StrNode* tail_ptr = (StrNode*)offset_to_ptr(dirs_tail);
        char* last_component = string_to_cstr(tail_ptr->dir);
        char* dot = strrchr(last_component, '.');

        if (dot != NULL && dot != last_component) {
            // Has extension
            size_t name_len = (size_t)(dot - last_component);
            file_ptr->name = create_string(last_component, name_len);
            file_ptr->extension = create_string(dot, strlen(dot));
        } else {
            // No extension
            file_ptr->name = tail_ptr->dir;
            file_ptr->extension = 0;
        }
    } else {
        file_ptr->name = 0;
        file_ptr->extension = 0;
    }

    // Rebuild the full path
    size_t full_path_len = 0;
    offset(StrNode*) current = dirs_head;
    size_t node_count = 0;

    while (current != 0) {
        StrNode* node_ptr = (StrNode*)offset_to_ptr(current);
        char* dir_cstr = string_to_cstr(node_ptr->dir);
        full_path_len += strlen(dir_cstr);
        node_count++;
        current = node_ptr->next;
    }

    // Add space for separators between components
    if (node_count > 1) {
        full_path_len += (node_count - 1);
    }

    char* full_path_cstr = string_to_cstr(alloc_memory(full_path_len + 1));
    full_path_cstr[0] = '\0';

    current = dirs_head;
    bool is_first = true;
    while (current != 0) {
        StrNode* node_ptr = (StrNode*)offset_to_ptr(current);
        char* dir_cstr = string_to_cstr(node_ptr->dir);

        if (!is_first && strcmp(dir_cstr, "/") != 0) {
            // Add separator before non-root components
            if (strlen(full_path_cstr) > 0 && full_path_cstr[strlen(full_path_cstr) - 1] != '/') {
                strcat(full_path_cstr, "/");
            }
        }
        strcat(full_path_cstr, dir_cstr);
        is_first = false;
        current = node_ptr->next;
    }

    file_ptr->path = create_string(full_path_cstr, strlen(full_path_cstr));
}
