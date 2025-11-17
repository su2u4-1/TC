#ifndef TC_FILE_H
#define TC_FILE_H

#include "tc_lib.h"
#include "tc_mem.h"

typedef struct Path {
    char* path;
    char* header;
    Array* components;
    char* file_name;
    char* extension;
} Path;

Path* path_init(const char* path);
void path_normalize_windows(Path* p);
void path_normalize_linux(Path* p);
void path_change_extension(Path* p, const char* new_ext);
void path_change_file_name(Path* p, const char* new_name, bool replace_extension);
void path_free(Path* p);

#endif  // TC_FILE_H
