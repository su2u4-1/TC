#include "file.h"

/*
All the functions implemented here are temporary and will be replaced by formal implementations in the future.
*/
// TODO: implement file handle functions, and complete struct File

static string get_cwd(void) {
#if PLATFORM == 1
    return _getcwd(NULL, 0);  // MSVC
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
    return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
#else
    return NULL;  // Unknown platform
#endif
}

static string normalization(string path) {
    if (path == NULL || path[0] == '\0') {
        return NULL;
    }

    string cwd = NULL;
#if PLATFORM == 1 || PLATFORM == 2
    bool path_has_drive = ((path[0] >= 'A' && path[0] <= 'Z') || (path[0] >= 'a' && path[0] <= 'z')) && path[1] == ':';
    bool path_is_absolute = path[0] == '/' || path[0] == '\\' || (path_has_drive && (path[2] == '/' || path[2] == '\\'));
#else
    bool path_is_absolute = path[0] == '/';
#endif
    if (!path_is_absolute) {
        cwd = get_cwd();
    }

    const char* sources[2];
    size_t source_count = 0;
    if (cwd != NULL) {
        sources[source_count++] = cwd;
    }
    sources[source_count++] = path;

    size_t capacity = strlen(path) + (cwd != NULL ? strlen(cwd) : 0) + 2;
    char* normalized = (char*)alloc_memory(capacity + 1, false);
    if (normalized == NULL) {
        if (cwd != NULL) {
            free(cwd);
        }
        return path;
    }

    size_t* checkpoints = (size_t*)alloc_memory((capacity + 1) * sizeof(size_t), false);
    if (checkpoints == NULL) {
        if (cwd != NULL) {
            free(cwd);
        }
        return path;
    }

    size_t out_len = 0;
    size_t depth = 0;
    size_t prefix_depth = 0;
    bool absolute_result = false;

    for (size_t source_index = 0; source_index < source_count; ++source_index) {
        const char* source = sources[source_index];
        size_t i = 0;

        if (source_index == 0) {
#if PLATFORM == 1 || PLATFORM == 2
            if (((source[0] >= 'A' && source[0] <= 'Z') || (source[0] >= 'a' && source[0] <= 'z')) && source[1] == ':') {
                normalized[out_len++] = source[0];
                normalized[out_len++] = ':';
                absolute_result = true;
                if (source[2] == '/' || source[2] == '\\') {
                    normalized[out_len++] = '/';
                    i = 3;
                } else {
                    i = 2;
                }
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
            } else if (source[0] == '/' || source[0] == '\\') {
                normalized[out_len++] = '/';
                absolute_result = true;
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
                while (source[i] == '/' || source[i] == '\\') {
                    ++i;
                }
            }
#else
            if (source[0] == '/') {
                normalized[out_len++] = '/';
                absolute_result = true;
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
                while (source[i] == '/') {
                    ++i;
                }
            }
#endif
        }

        while (source[i] != '\0') {
            while (source[i] == '/' || source[i] == '\\') {
                ++i;
            }
            size_t start = i;
            while (source[i] != '\0' && source[i] != '/' && source[i] != '\\') {
                ++i;
            }
            size_t seg_len = i - start;
            if (seg_len == 0) {
                break;
            }
            if (seg_len == 1 && source[start] == '.') {
                continue;
            }
            if (seg_len == 2 && source[start] == '.' && source[start + 1] == '.') {
                if (depth > prefix_depth) {
                    size_t last_start;
                    if (depth == 1) {
                        last_start = prefix_depth > 0 ? out_len : 0;
                    } else {
                        last_start = checkpoints[depth - 2] + 1;
                    }
                    size_t last_len = checkpoints[depth - 1] - last_start;
                    if (!(last_len == 2 && normalized[last_start] == '.' && normalized[last_start + 1] == '.')) {
                        if (depth == 1) {
                            out_len = 0;
                        } else {
                            out_len = checkpoints[depth - 2];
                        }
                        --depth;
                        continue;
                    }
                }
                if (!absolute_result) {
                    if (out_len > 0 && normalized[out_len - 1] != '/') {
                        normalized[out_len++] = '/';
                    }
                    normalized[out_len++] = '.';
                    normalized[out_len++] = '.';
                    checkpoints[depth++] = out_len;
                }
                continue;
            }
            if (out_len > 0 && normalized[out_len - 1] != '/') {
                normalized[out_len++] = '/';
            }
            memcpy(normalized + out_len, source + start, seg_len);
            out_len += seg_len;
            checkpoints[depth++] = out_len;
        }
    }

    if (out_len == 0) {
        normalized[out_len++] = '.';
    }
    normalized[out_len] = '\0';

    string result = create_string(normalized, out_len);
    if (cwd != NULL) {
        free(cwd);
    }
    return result;
}

File* create_file(string path) {
    File* file = create_struct(File);
    file->path = normalization(path);
    return file;
}

string read_source_code(File* file, size_t* size) {
    FILE* open_file = fopen(file->path, "r");
    if (open_file == NULL) {
        fprintf(stderr, "[fill Error] at <read_source_code> Cannot open file: %s\n", file->path);
        return NULL;
    }
    fseek(open_file, 0, SEEK_END);
    *size = (size_t)ftell(open_file);
    fseek(open_file, 0, SEEK_SET);
    string content = (string)alloc_memory(*size, false);
    size_t len = fread(content, 1, *size, open_file);
    for (size_t i = len; i < *size; ++i) {
        content[i] = '\0';
    }
    *size = len;
    fclose(open_file);
    return content;
}

string file_full_path(File* file) {
    return file->path;
}

string change_extension(File* file, const char* new_extension) {
    string path = file->path;
    size_t len = strlen(path);
    size_t i = len;
    while (i > 0 && path[i - 1] != '.' && path[i - 1] != '/' && path[i - 1] != '\\') {
        --i;
    }
    if (i == 0 || path[i - 1] == '/' || path[i - 1] == '\\') {
        return string_splice("%s%s", path, new_extension);
    } else {
        return string_splice("%.*s%s", (int)(i - 1), path, new_extension);
    }
}

string file_dir_path(File* file) {
    string path = file->path;
    size_t len = strlen(path);
    while (len > 0 && path[len - 1] != '/' && path[len - 1] != '\\') {
        --len;
    }
    if (len == 0) {
        return ".";
    } else {
        return create_string(path, len - 1);
    }
}
