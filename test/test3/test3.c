#include "../../include/tc_file.h"

static char* path[37] = {
    "D:\\test\\test.c",
    "D:\\.\\test.c",
    "D:\\test\\..\\test.c",
    "D:\\..\\test.c",
    "D:\\test\\test",
    "D:\\test\\.c",
    "D:\\test\\",
    "D:\\test",
    "/test/test.c",
    "/./test.c",
    "/test/../test.c",
    "/../test.c",
    "/test/test",
    "/test/.c",
    "/test/",
    "/test",
    "test/test.c",
    "./test.c",
    "test/../test.c",
    "../test.c",
    "test/test",
    "test/.c",
    "test/",
    "test",
    "./test/test.c",
    "././test.c",
    "./test/../test.c",
    "./../test.c",
    "./test/test",
    "./test/.c",
    "./test/",
    "./test",
    "D:/./",
    "/",
    "./",
    ".././a",
    "",
};

int main(void) {
    for (int i = 0; i < 37; ++i) {
        printf("Original: '%s'\n", path[i]);
        Path* p1 = path_init(path[i]);
        Path* p2 = path_init(path[i]);
        printf("Initialized: '%s'\nddd: '%s', '%s', '%s'\n", p1->path, p1->header, p1->file_name, p1->extension);
        path_normalize_windows(p1);
        printf("Normalized (Windows): '%s'\nddd: '%s', '%s', '%s'\n", p1->path, p1->header, p1->file_name, p1->extension);
        path_normalize_linux(p2);
        printf("Normalized (Linux): '%s'\nddd: '%s', '%s', '%s'\n", p2->path, p2->header, p2->file_name, p2->extension);
        path_free(p1);
        path_free(p2);
        printf("---------------\n");
    }
    return 0;
}
