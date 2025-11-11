#ifndef TC_FILE_H
#define TC_FILE_H

#include "tc_lib.h"
#include "tc_mem.h"

typedef struct Path {
    char* path;
    char** components;
    char* file_name;
    char* extension;
    size_t length;
} Path;

Path* path_init(const char* path);
void path_windows(Path* p);
void path_linux(Path* p);
void path_change_extension(Path* p, const char* new_ext);
void path_change_file_name(Path* p, const char* new_name);

#endif  // TC_FILE_H
