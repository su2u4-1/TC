#ifndef LIB_H
#define LIB_H

// #define DEBUG
#define bool int
#define true 1
#define false 0
#define string char*
#define offset size_t

// 簡化 offset 操作的輔助宏（如果未來改用 offset 系統）
#define PTR(off) (offset_to_ptr(off))
#define OFF(ptr) (ptr_to_offset(ptr))
#define ALLOC(type) ((type*)alloc_memory(sizeof(type)))
#define ALLOC_ARR(type, n) ((type*)alloc_memory(sizeof(type) * (n)))

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
    offset str;
    size_t length;
    struct StringList* next;
} StringList;

extern char* memory;
extern offset keywordList[21];
extern size_t keywordCount;
extern bool initialized;
extern StringList* allStrings;

void init(void);
offset create_string(const char* data, size_t length);
void* alloc_memory(size_t size);
bool is_keyword(const offset str);
bool string_equal(const offset a, const offset b);
offset get_info(void);
string offset_to_ptr(offset off);
offset ptr_to_offset(string ptr);

#endif  // LIB_H
