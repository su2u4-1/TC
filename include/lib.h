#ifndef LIB_H
#define LIB_H

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// TODO: let std_path be determined by the environment
#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#ifdef _MSC_VER
#define PLATFORM 1  // MSVC
#define std_path "D:/TC/std/"
#else
#define PLATFORM 2  // MinGW
#define std_path "D:/TC/std/"
#endif
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 3  // LINUX
#define std_path "/home/su2u4/code/TC/std/"
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 4  // MACOS
#define std_path "NOT SUPPORTED"
#else
#define PLATFORM 0  // UNKNOWN
#define std_path "NOT SUPPORTED"
#endif

#if PLATFORM == 1
#include <direct.h>  // MSVC
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
#include <unistd.h>  // MinGW or LINUX or MACOS
#endif

#define bool char
#define true 1
#define false 0
typedef char* string;
typedef size_t* pointer;

#define DEFAULT_MEMORY_SIZE 1024
#define ALIGN_SIZE sizeof(size_t)

typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    char* data;
    MemoryBlock* next;
};
typedef struct StringNode StringNode;
struct StringNode {
    size_t size;
    size_t hash;
    StringNode* next;
    string value;
};

typedef struct {
    StringNode** buckets;
    size_t capacity;
    size_t count;
} StringTable;

extern MemoryBlock* string_memory;
extern MemoryBlock* struct_memory;

void init(void);
string create_string(const char* str, size_t len);
pointer alloc_memory(size_t size, bool is_struct);
string string_splice(string format, ...);
string get_info(void);

#endif  // LIB_H
