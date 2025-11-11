#ifndef TC_LIB_H
#define TC_LIB_H

// #define DEBUG

#if defined(_WIN32) || defined(_WIN64)
#define PLATFORM_WINDOWS
#elif defined(__linux__)
#define PLATFORM_LINUX
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM_MACOS
#else
#define PLATFORM_WINDOWS
// #define PLATFORM_UNKNOWN
#endif

#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char* tc_keywords[];
extern int tc_keywords_count;

extern char* tc_symbols[];
extern int tc_symbols_count;

#endif  // TC_LIB_H
