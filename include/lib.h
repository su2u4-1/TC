#ifndef LIB_H
#define LIB_H

// #define DEBUG

#define bool int
#define true 1
#define false 0

#if defined(_WIN32) || defined(_WIN64)
#define PLATFORM 1  // WINDOWS
#elif defined(__linux__)
#define PLATFORM 2  // LINUX
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 3  // MACOS
#else
#define PLATFORM 0  // UNKNOWN
#endif

#include <stdio.h>

#endif  // LIB_H
