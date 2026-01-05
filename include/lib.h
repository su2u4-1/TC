#ifndef LIB_H
#define LIB_H

// #define DEBUG
// #define COMPUTE_MEM_BLOCK
#define bool int
#define true 1
#define false 0
#define string char*

#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#define PLATFORM 1  // WINDOWS
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 2  // LINUX
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 3  // MACOS
#else
#define PLATFORM 0  // UNKNOWN
#endif

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct StringList {
    string str;
    size_t length;
    struct StringList* next;
} StringList;

extern char* memory;
extern string keywordList[21];
extern size_t keywordCount;
extern bool initialized;
extern StringList* allStrings;

void init(void);
string create_string(const char* data, size_t length);
void* alloc_memory(size_t size);
bool is_keyword(const string str);
bool string_equal(const string a, const string b);
char* get_info(void);

#endif  // LIB_H
