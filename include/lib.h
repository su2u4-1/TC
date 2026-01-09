#ifndef LIB_H
#define LIB_H

// #define DEBUG
#define bool int
#define true 1
#define false 0
#define string size_t
#define offset(type) size_t
#define ALIGN_SIZE (size_t)8

#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#define PLATFORM 1  // WINDOWS
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 2  // LINUX
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 3  // MACOS
#else
#define PLATFORM 0  // UNKNOWN
#endif

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct StringList {
    string str;
    size_t length;
    offset(StringList*) next;
} StringList;

extern char* memory;
extern string keywordList[21];
extern size_t keywordCount;
extern bool initialized;
extern offset(StringList*) allStrings;

// `void init(void)`
void init(void);
// `string create_string(const char* data, size_t length)`
string create_string(const char* data, size_t length);
// `size_t alloc_memory(size_t size)`
size_t alloc_memory(size_t size);
// `bool is_keyword(const string str)`
bool is_keyword(const string str);
// `bool string_equal(string a, string b)`
bool string_equal(string a, string b);
// `string get_info(void)`
string get_info(void);
// `char* offset_to_str(string str)`
char* string_to_char_ptr(string str);
// `size_t* offset_to_ptr(string off)`
size_t* offset_to_ptr(offset() off);
// `string ptr_to_offset(string ptr)`
string char_ptr_to_string(char* ptr);

#endif  // LIB_H
