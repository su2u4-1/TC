#include "file.h"

/*
All the functions implemented here are temporary and will be replaced by formal implementations in the future.
*/
// TODO: implement file handle functions, and complete struct File

File* create_file(string path) {
    File* file = create_struct(File);
    file->path = path;
    return file;
}

string read_source_code(File* file, size_t* size) {
    FILE* open_file = fopen(file->path, "r");
    if (open_file == NULL) {
        fprintf(stderr, "[fill Error] Cannot open file: %s\n", file->path);
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
