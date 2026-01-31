// #include "file.h"
#include <assert.h>
#include <stddef.h>
#include <stdio.h>

#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#define PLATFORM 1  // WINDOWS
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 2  // LINUX
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 3  // MACOS
#else
#define PLATFORM 0  // UNKNOWN
#endif

#if PLATFORM == 1  // WINDOWS

#if defined(_MSC_VER)
#include <direct.h>
#else  // MinGW
#include <unistd.h>
#endif

#elif PLATFORM == 2 || PLATFORM == 3
#include <unistd.h>
#endif

static char* get_cwd(void) {
#if PLATFORM == 1  // WINDOWS

#if defined(_MSC_VER)
    return _getcwd(NULL, 0);
#else  // MinGW
    return getcwd(NULL, 0);
#endif

#elif PLATFORM == 2 || PLATFORM == 3
    return getcwd(NULL, 0);
#else
    return NULL;
#endif
}

int main(void) {
    char* cwd = get_cwd();
    if (cwd == NULL) {
        printf("Error: Unable to get current working directory.\n");
        return 1;
    }
    printf("Current Working Directory: %s\n", cwd);

    return 0;
}
