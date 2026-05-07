#ifndef FILE_H
#define FILE_H

#include "lib.h"

typedef struct File {
    string path;
} File;

File* create_file(string path);

#endif  // FILE_H
