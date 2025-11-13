#include "tc_file.h"

#include "tc_mem.h"

Path* path_init(const char* path) {
    Path* p = (Path*)tc_malloc(sizeof(Path));
    p->path = (char*)tc_malloc(strlen(path) + 1);
    strcpy(p->path, path);
    for (size_t i = 0; i < strlen(p->path); i++) {
        if (p->path[i] == '\\') {
            p->path[i] = '/';
        }
    }
    int have_name = 1;
    if (p->path[strlen(p->path) - 1] == '/') {
        have_name = 0;
    }
    char* tp = (char*)tc_malloc(strlen(path) + 1);
    strcpy(tp, p->path);
    Array* components = arr_init(sizeof(char**), 4);
    char* token = strtok(tp, "/");
    while (token != NULL) {
        char* comp = (char*)tc_malloc(strlen(token) + 1);
        strcpy(comp, token);
        arr_push(components, &comp);
        token = strtok(NULL, "/");
    }
    if (!have_name) {
        char* placeholder = (char*)tc_malloc(1);
        placeholder = "";
        arr_push(components, &placeholder);
    }
#ifdef DEBUG
    printf("[debug](tc_file): tp: '%s'\n", tp);
    char** co = (char**)arr_get_all(components);
    for (size_t i = 0; i < components->length; i++) {
        printf("'%s', ", co[i]);
    }
    printf("\n[debug](tc_file): token: '%s'\n\n", token);
#endif
    tc_free(tp);
    char* file = ((char**)arr_get_all(components))[components->length - 1];
    char* last_dot = strrchr(file, '.');
    char* ext = "";
    if (last_dot != NULL) {
        size_t len = strlen(last_dot);
        ext = (char*)tc_malloc(len + 1);
        strncpy(ext, last_dot, len);
        ext[len] = '\0';
    }
    free(last_dot);
    size_t len = strlen(file) - strlen(ext);
    char* file_name = (char*)tc_malloc(len + 1);
    strncpy(file_name, file, len);
    file_name[len] = '\0';
    --components->length;
    arr_push(components, &file_name);
    arr_push(components, &ext);
    p->components = (char**)arr_get_all(components);
    p->length = components->length;
    p->extension = (char*)tc_malloc(strlen(ext) + 1);
    strcpy(p->extension, ext);
    p->file_name = (char*)tc_malloc(strlen(file_name) + 1);
    strcpy(p->file_name, file_name);
    tc_free(components);
#ifdef DEBUG
    printf("[debug](tc_file): in path_init extension: '%s'\n", p->extension);
    printf("[debug](tc_file): in path_init file name: '%s'\n", p->file_name);
    for (size_t i = 0; i < p->length; i++) {
        printf("'%s', ", p->components[i]);
    }
    printf("{%s}\n", p->path);
    printf("[debug](tc_file): exit path_init()\n");
#endif
    return p;
}

static void path_both(Path* p, size_t index) {
#ifdef DEBUG
    printf("[debug](tc_file): call path_both()\n");
#endif
    for (size_t i = 1; i < p->length - 1; i++) {
        strcpy(p->path + index, "/");
        ++index;
        strncpy(p->path + index, p->components[i], strlen(p->components[i]));
        index += strlen(p->components[i]);
    }
    char* ext = p->components[p->length - 1];
    if (strlen(ext) <= 1) {
        ext = "";
        return;
    }
    if (ext[0] != '.') {
        tc_realloc(ext, strlen(ext) + 2);
        memmove(ext + 1, ext, strlen(ext) + 1);
        ext[0] = '.';
    }
    strncpy(p->path + index, ext, strlen(ext));
    index += strlen(ext);
    p->path[index] = '\0';
#ifdef DEBUG
    printf("[debug] in path_both extension: '%s'\n", p->extension);
    printf("[debug] in path_both file name: '%s'\n", p->file_name);
    for (size_t i = 0; i < p->length; i++) {
        printf("'%s', ", p->components[i]);
    }
    printf("{%s}\n", p->path);
    printf("[debug](tc_file): exit path_both()\n");
#endif
}

void path_windows(Path* p) {
#ifdef DEBUG
    printf("[debug](tc_file): call path_windows()\n");
#endif
    size_t index = 0;
    if (strlen(p->components[0]) == 2 && p->components[0][1] == ':' && isalpha(p->components[0][0])) {
        p->components[0][0] = (char)toupper(p->components[0][0]);
        strncpy(p->path + index, p->components[0], 2);
        index += 2;
    } else if (strlen(p->components[0]) == 1 && isalpha(p->components[0][0])) {
        tc_realloc(p->components[0], 3);
        p->components[0][0] = (char)toupper(p->components[0][0]);
        p->components[0][1] = ':';
        p->components[0][2] = '\0';
        strncpy(p->path + index, p->components[0], 2);
        index += 2;
    } else {
        strncpy(p->path + index, p->components[0], strlen(p->components[0]));
        index += strlen(p->components[0]);
    }
    path_both(p, index);
#ifdef DEBUG
    printf("[debug](tc_file): in path_windows extension: '%s'\n", p->extension);
    printf("[debug](tc_file): in path_windows file name: '%s'\n", p->file_name);
    for (size_t i = 0; i < p->length; i++) {
        printf("'%s', ", p->components[i]);
    }
    printf("{%s}\n", p->path);
    printf("\n[debug](tc_file): exit path_windows()\n");
#endif
}

void path_linux(Path* p) {
#ifdef DEBUG
    printf("[debug](tc_file): call path_linux()\n");
#endif
    size_t index = 0;
    if (strlen(p->components[0]) == 2 && p->components[0][1] == ':' && isalpha(p->components[0][0])) {
        p->path[index++] = '/';
        p->path[index++] = (char)tolower(p->components[0][0]);
    } else if (strlen(p->components[0]) == 1 && isalpha(p->components[0][0])) {
        p->path[index++] = '/';
        p->path[index++] = (char)tolower(p->components[0][0]);
    } else {
        strncpy(p->path + index, p->components[0], strlen(p->components[0]));
    }
    path_both(p, index);
#ifdef DEBUG
    printf("[debug](tc_file): in path_linux extension: '%s'\n", p->extension);
    printf("[debug](tc_file): in path_linux file name: '%s'\n", p->file_name);
    for (size_t i = 0; i < p->length; i++) {
        printf("'%s', ", p->components[i]);
    }
    printf("{%s}\n", p->path);
    printf("[debug](tc_file): exit path_linux()\n");
#endif
}

void path_change_extension(Path* p, const char* new_ext) {
#ifdef DEBUG
    printf("[debug](tc_file): call path_change_extension()\n");
#endif
    char* old_ext = p->components[p->length - 1];
    size_t old_ext_len = strlen(old_ext);
    size_t new_ext_len = strlen(new_ext);
    if (new_ext[0] != '.') {
        new_ext_len += 1;
    }
    size_t path_len = strlen(p->path);
    size_t new_path_len = path_len - old_ext_len + new_ext_len;
    tc_realloc(p->path, new_path_len + 1);
    p->path[new_path_len] = '\0';
    strncpy(p->path + path_len - old_ext_len, new_ext, new_ext_len);
    // tc_free(old_ext);
    p->components[p->length - 1] = (char*)tc_malloc(new_ext_len + 1);
    if (new_ext[0] != '.') {
        p->components[p->length - 1][0] = '.';
        strcpy(p->components[p->length - 1] + 1, new_ext);
    } else {
        strcpy(p->components[p->length - 1], new_ext);
    }
#ifdef DEBUG
    printf("[debug](tc_file): in path_change_extension extension: '%s'\n", p->extension);
    printf("[debug](tc_file): in path_change_extension file name: '%s'\n", p->file_name);
    for (size_t i = 0; i < p->length; i++) {
        printf("'%s', ", p->components[i]);
    }
    printf("{%s}\n", p->path);
    printf("[debug](tc_file): exit path_change_extension()\n");
#endif
}

void path_change_file_name(Path* p, const char* new_name) {
#ifdef DEBUG
    printf("[debug](tc_file): call path_change_file_name()\n");
#endif
    char* old_name = p->components[p->length - 2];
    size_t old_name_len = strlen(old_name);
    size_t new_name_len = strlen(new_name);
    size_t path_len = strlen(p->path);
    size_t new_path_len = path_len - old_name_len + new_name_len;
    tc_realloc(p->path, new_path_len + 1);
    p->path[new_path_len] = '\0';
    strncpy(p->path + path_len - old_name_len, new_name, new_name_len);
    tc_free(old_name);
    p->components[p->length - 2] = (char*)tc_malloc(new_name_len + 1);
    strcpy(p->components[p->length - 2], new_name);
#ifdef DEBUG
    printf("[debug](tc_file): path_change_file_name extension: '%s'\n", p->extension);
    printf("[debug](tc_file): path_change_file_name file name: '%s'\n", p->file_name);
    for (size_t i = 0; i < p->length; i++) {
        printf("'%s', ", p->components[i]);
    }
    printf("{%s}\n", p->path);
    printf("[debug](tc_file): exit path_change_file_name()\n");
#endif
}
