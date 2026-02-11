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

// `char* get_cwd(void)`
char* get_cwd(void);
// `File* create_file(const string path)`
offset(File*) create_file(const string path);
// `string absolute_path(string path)`
string absolute_path(string path);
// `string get_file_name(const File* path)`
string get_file_name(offset(File*) path);
// `string get_file_extension(const File* path)`
string get_file_extension(offset(File*) path);
// `string get_file_dir(const File* path)`
string get_file_dir(offset(File*) path);
// `string get_full_path(const File* path)`
string get_full_path(offset(File*) path);
// `void change_file_extension(File* file, const string new_extension)`
void change_file_extension(offset(File*) file, const string new_extension);
// `void change_file_name(File* file, const string new_name)`
void change_file_name(offset(File*) file, const string new_name);
// `void normalize_path(File* file)`
void normalize_path(offset(File*) file);

#endif  // FILE_H
