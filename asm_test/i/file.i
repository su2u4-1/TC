#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
typedef char* string;
typedef size_t* pointer;
typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    MemoryBlock* next;
    pointer block;
};
typedef struct StringList StringList;
struct StringList {
    string str;
    size_t length;
    StringList* next;
};
extern string keywordList[22];
extern string symbolList[30];
extern MemoryBlock* struct_memory;
extern MemoryBlock* string_memory;
extern char initialized;
extern StringList* all_string_list;
extern string IMPORT_KEYWORD;
extern string FROM_KEYWORD;
extern string FUNC_KEYWORD;
extern string CLASS_KEYWORD;
extern string METHOD_KEYWORD;
extern string SELF_KEYWORD;
extern string IF_KEYWORD;
extern string ELIF_KEYWORD;
extern string ELSE_KEYWORD;
extern string WHILE_KEYWORD;
extern string FOR_KEYWORD;
extern string TRUE_KEYWORD;
extern string FALSE_KEYWORD;
extern string RETURN_KEYWORD;
extern string BREAK_KEYWORD;
extern string CONTINUE_KEYWORD;
extern string INT_KEYWORD;
extern string FLOAT_KEYWORD;
extern string STRING_KEYWORD;
extern string BOOL_KEYWORD;
extern string VOID_KEYWORD;
extern string VAR_KEYWORD;
extern string L_PAREN_SYMBOL;
extern string R_PAREN_SYMBOL;
extern string L_BRACE_SYMBOL;
extern string R_BRACE_SYMBOL;
extern string COMMA_SYMBOL;
extern string NOT_SYMBOL;
extern string DOT_SYMBOL;
extern string L_BRACKET_SYMBOL;
extern string R_BRACKET_SYMBOL;
extern string SEMICOLON_SYMBOL;
extern string UNDERLINE_SYMBOL;
extern string ADD_SYMBOL;
extern string SUB_SYMBOL;
extern string MUL_SYMBOL;
extern string DIV_SYMBOL;
extern string MOD_SYMBOL;
extern string LT_SYMBOL;
extern string GT_SYMBOL;
extern string ASSIGN_SYMBOL;
extern string EQ_SYMBOL;
extern string NE_SYMBOL;
extern string LE_SYMBOL;
extern string GE_SYMBOL;
extern string ADD_ASSIGN_SYMBOL;
extern string SUB_ASSIGN_SYMBOL;
extern string MUL_ASSIGN_SYMBOL;
extern string DIV_ASSIGN_SYMBOL;
extern string MOD_ASSIGN_SYMBOL;
extern string AND_SYMBOL;
extern string OR_SYMBOL;
typedef struct Name Name;
typedef struct Scope Scope;
extern Name* name_void;
extern Name* name_int;
extern Name* name_float;
extern Name* name_string;
extern Name* name_bool;
extern Scope* builtin_scope;
void init(void);
string create_string(const char* data, size_t length);
pointer alloc_memory(size_t size);
char is_keyword(const string str);
char string_equal(string a, string b);
string get_info(void);
typedef struct StrNode StrNode;
struct StrNode {
    string dir;
    StrNode* next;
};
typedef struct File {
    StrNode* dirs;
    string extension;
    string name;
    string path;
} File;
string get_cwd(void);
File* create_file(const string path);
string absolute_path(string path);
string get_file_name(File* path);
string get_file_extension(File* path);
string get_file_dir(File* path);
string get_full_path(File* path);
void change_file_extension(File* file, const string new_extension);
void change_file_name(File* file, const string new_name);
void normalize_path(File* file);
string get_cwd(void) {
    return getcwd(NULL, 0);
}
File* create_file(const string path) {
    File* file = (File*)alloc_memory(sizeof(File));
    file->path = absolute_path(path);
    normalize_path(file);
    return file;
}
string absolute_path(string path) {
    size_t path_len = strlen(path);
    for (size_t i = 0; i < path_len; i++) {
        if (path[i] == '\\') path[i] = '/';
        if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
            memmove(path + i - 1, path + i + 1, path_len - i);
            path_len -= 2;
            i -= 2;
        }
        if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
            memmove(path + i, path + i + 1, path_len - i);
            path_len--;
            i--;
        }
    }
    if (path_len > 0 && path[0] == '/')
        return path;
    string cwd = get_cwd();
    if (cwd == NULL)
        return path;
    size_t total_len = strlen(cwd) + 1 + path_len + 1;
    string abs_path = create_string("", total_len);
    sprintf(abs_path, "%s/%s", cwd, path);
    free(cwd);
    return create_string(abs_path, total_len);
}
string get_file_name(File* path) {
    return path->name;
}
string get_file_extension(File* path) {
    return path->extension;
}
string get_file_dir(File* path) {
    if (path->dirs == 0) return 0;
    size_t total_len = 0;
    size_t node_count = 0;
    StrNode* current = path->dirs;
    while (current != 0) {
        if (current->next != 0) {
            size_t dir_len = strlen((current->dir));
            total_len += dir_len;
            node_count++;
        }
        current = current->next;
    }
    if (node_count == 0) return 0;
    if (node_count > 1)
        total_len += node_count - 1;
    string dir_path = create_string("", total_len + 1);
    dir_path[0] = '\0';
    current = path->dirs;
    char first = 1;
    while (current != 0) {
        if (current->next != 0) {
            if (!first && strcmp(current->dir, "/") != 0)
                if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
                    strcat(dir_path, "/");
            strcat(dir_path, current->dir);
            first = 0;
        }
        current = current->next;
    }
    return create_string(dir_path, strlen(dir_path));
}
string get_full_path(File* path) {
    return path->path;
}
void change_file_extension(File* file, const string new_extension) {
    file->extension = new_extension;
    string dir = get_file_dir(file);
    string dir_cstr = dir != NULL ? dir : "";
    string ext_cstr = new_extension != NULL ? new_extension : "";
    size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
    if (new_extension != 0) path_len += strlen(ext_cstr);
    string new_path = create_string("", path_len + 1);
    if (dir != 0 && strlen(dir_cstr) > 0)
        sprintf(new_path, "%s/%s", dir_cstr, file->name);
    else
        sprintf(new_path, "%s", file->name);
    if (new_extension != 0)
        strcat(new_path, new_extension);
    file->path = create_string(new_path, strlen(new_path));
}
void change_file_name(File* file, const string new_name) {
    file->name = new_name;
    if (file->dirs != 0) {
        StrNode* current = file->dirs;
        while (current != 0) {
            if (current->next == 0) {
                string ext_cstr = file->extension != NULL ? file->extension : "";
                size_t full_name_len = strlen(new_name);
                if (file->extension != 0) full_name_len += strlen(ext_cstr);
                string full_name = create_string("", full_name_len + 1);
                sprintf(full_name, "%s%s", new_name, ext_cstr);
                current->dir = create_string(full_name, strlen(full_name));
                break;
            }
            current = current->next;
        }
    }
    string dir = get_file_dir(file);
    string dir_cstr = dir != NULL ? dir : "";
    string ext_cstr = file->extension != 0 ? (file->extension) : "";
    size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
    if (file->extension != 0) path_len += strlen(ext_cstr);
    string new_path = create_string("", path_len + 1);
    if (dir != NULL && strlen(dir_cstr) > 0)
        sprintf(new_path, "%s/%s%s", dir_cstr, new_name, ext_cstr);
    else
        sprintf(new_path, "%s%s", new_name, ext_cstr);
    file->path = create_string(new_path, strlen(new_path));
}
void normalize_path(File* file) {
    size_t path_len = strlen(file->path);
    string path_copy = create_string("", path_len + 1);
    strcpy(path_copy, file->path);
    StrNode* dirs_head = 0;
    StrNode* dirs_tail = 0;
    size_t start = 0;
    if (path_len > 0 && path_copy[0] == '/') {
        StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
        node->dir = create_string("/", 1);
        node->next = 0;
        dirs_head = node;
        dirs_tail = node;
        start = 1;
    }
    size_t i = start;
    while (i <= path_len) {
        if (i == path_len || path_copy[i] == '/') {
            if (i > start) {
                size_t comp_len = i - start;
                char component[256];
                strncpy(component, path_copy + start, comp_len);
                component[comp_len] = '\0';
                if (strcmp(component, ".") == 0) {
                } else if (strcmp(component, "..") == 0) {
                    if (dirs_tail != 0 && dirs_tail != dirs_head) {
                        if (strcmp(dirs_tail->dir, "..") == 0) {
                            StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                            node->dir = create_string("..", 2);
                            node->next = 0;
                            dirs_tail->next = node;
                            dirs_tail = node;
                        } else {
                            StrNode* prev = dirs_head;
                            while (prev != 0 && prev->next != dirs_tail)
                                prev = prev->next;
                            if (prev != 0) {
                                prev->next = 0;
                                dirs_tail = prev;
                            }
                        }
                    } else if (dirs_head == 0) {
                        StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                        node->dir = create_string("..", 2);
                        node->next = 0;
                        dirs_head = node;
                        dirs_tail = node;
                    }
                } else if (strlen(component) > 0) {
                    StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                    node->dir = create_string(component, comp_len);
                    node->next = 0;
                    if (dirs_tail != 0)
                        (dirs_tail)->next = node;
                    dirs_tail = node;
                    if (dirs_head == 0) dirs_head = node;
                }
            }
            start = i + 1;
        }
        i++;
    }
    file->dirs = dirs_head;
    if (dirs_tail != 0) {
        string dot = strrchr(dirs_tail->dir, '.');
        if (dot != NULL && dot != dirs_tail->dir) {
            size_t name_len = (size_t)(dot - dirs_tail->dir);
            file->name = create_string(dirs_tail->dir, name_len);
            file->extension = create_string(dot, strlen(dot));
        } else {
            file->name = dirs_tail->dir;
            file->extension = 0;
        }
    } else {
        file->name = 0;
        file->extension = 0;
    }
    size_t full_path_len = 0;
    StrNode* current = dirs_head;
    size_t node_count = 0;
    while (current != 0) {
        full_path_len += strlen(current->dir);
        node_count++;
        current = current->next;
    }
    if (node_count > 1)
        full_path_len += (node_count - 1);
    string full_path = create_string("", full_path_len + 1);
    full_path[0] = '\0';
    current = dirs_head;
    char is_first = 1;
    while (current != 0) {
        if (!is_first && strcmp(current->dir, "/") != 0) {
            if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
                strcat(full_path, "/");
            }
        }
        strcat(full_path, current->dir);
        is_first = 0;
        current = current->next;
    }
    file->path = create_string(full_path, strlen(full_path));
}
