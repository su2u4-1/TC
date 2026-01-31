#ifndef FILE_H
#define FILE_H

#include "lib.h"

typedef struct StrNode {
    string dir;
    offset(StrNode*) next;
} StrNode;

typedef struct File {
    offset(StrNode*) dirs;
    string extension;
    string name;
    string path;
} File;

char* get_cwd(void);
offset(File*) create_file(File* file, const string path);
void normalize_path(string path, string* out_path);
string get_file_name(offset(File*) path);
string get_file_extension(offset(File*) path);
string get_file_dir(offset(File*) path);
string get_full_path(offset(File*) path);
void change_file_extension(offset(File*) file, const string new_extension);
void change_file_name(offset(File*) file, const string new_name);
void absolute_path(File* file);

#endif  // FILE_H
