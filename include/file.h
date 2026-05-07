#ifndef FILE_H
#define FILE_H

#include "lib.h"

typedef struct File {
    string path;
} File;

File* create_file(string path);
string read_source_code(File* file, size_t* size);
string file_full_path(File* file);
string change_extension(File* file, const char* new_extension);

#endif  // FILE_H
