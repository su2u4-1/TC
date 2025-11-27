#include "tc_file.h"

#include <string.h>

#include "tc_mem.h"

static void path_rebuild(Path* p) {
    size_t total_len = 0;
    if (p->header && p->header[0] != '\0') {
        total_len += strlen(p->header);
    }
    total_len++;  // for '/'

    for (size_t i = 0; i < p->components->length; ++i) {
        char* component = *(char**)arr_get_item(p->components, (int)i);
        if (component && component[0] != '\0') {
            total_len += strlen(component) + 1;  // +1 for '/'
        }
    }
    total_len++;  // for '/'

    if (p->file_name && p->file_name[0] != '\0') {
        if (total_len > 0 && p->path[total_len - 1] != '/') total_len++;
        total_len += strlen(p->file_name);
    }
    if (p->extension && p->extension[0] != '\0') {
        total_len += strlen(p->extension) + 1;  // +1 for '.'
    }

    tc_free(p->path);
    p->path = (char*)tc_malloc(total_len + 1);
    p->path[0] = '\0';

    if (p->header && p->header[0] != '\0') {
        strcpy(p->path, p->header);
    }
    strcat(p->path, "/");

    for (size_t i = 0; i < p->components->length; ++i) {
        char* component = *(char**)arr_get_item(p->components, (int)i);
        if (component && component[0] != '\0') {
            if (p->path[0] != '\0' && p->path[strlen(p->path) - 1] != '/') {
                strcat(p->path, "/");
            }
            strcat(p->path, component);
        }
    }
    if (p->path[0] != '\0' && p->path[strlen(p->path) - 1] != '/') {
        strcat(p->path, "/");
    }

    if (p->file_name && p->file_name[0] != '\0') {
        if (p->path[0] != '\0' && p->path[strlen(p->path) - 1] != '/') {
            strcat(p->path, "/");
        }
        strcat(p->path, p->file_name);
    }

    if (p->extension && p->extension[0] != '\0') {
        strcat(p->path, ".");
        strcat(p->path, p->extension);
    }
}

Path* path_init(const char* path) {
    Path* p = (Path*)tc_malloc(sizeof(Path));
    p->path = tc_strcpy(path);
    for (char* c = p->path; *c; ++c) {
        if (*c == '\\') *c = '/';
    }

    char* temp_path = tc_strcpy(p->path);
    char* rest = temp_path;

    char* first_slash = strchr(rest, '/');
    if (first_slash) {
        p->header = tc_strncpy(rest, (size_t)(first_slash - rest));
        rest = first_slash + 1;
    } else {
        p->header = tc_strcpy("");
        rest = temp_path;
    }

    char* last_slash = strrchr(rest, '/');
    char* components_str;
    if (last_slash) {
        components_str = tc_strncpy(rest, (size_t)(last_slash - rest));
        p->file_name = tc_strcpy(last_slash + 1);
    } else {
        components_str = tc_strcpy("");
        p->file_name = tc_strcpy(rest);
    }

    p->components = arr_init(sizeof(char*), 8);
    if (components_str[0] != '\0') {
        char* component = strtok(components_str, "/");
        while (component) {
            char* comp_dup = tc_strcpy(component);
            arr_push(p->components, &comp_dup);
            component = strtok(NULL, "/");
        }
    }

    if (p->header[0] == '\0' && p->path[0] == '/') {
        tc_free(p->header);
        p->header = tc_strcpy("/");
    }

    char* dot = strrchr(p->file_name, '.');
    if (dot && dot != p->file_name) {
        p->extension = tc_strcpy(dot + 1);
        *dot = '\0';
    } else {
        p->extension = tc_strcpy("");
    }

    tc_free(temp_path);
    tc_free(components_str);
    return p;
}

static void path_normalize_windows(Path* p) {
    if (tc_strcmp(p->header, "")) {
        tc_free(p->header);
        p->header = tc_strcpy(".");
    } else if (tc_strcmp(p->header, "/")) {
        tc_free(p->header);
        p->header = tc_strcpy("C:");
    } else if (strlen(p->header) == 2 && isalpha(p->header[0]) && !isalpha(p->header[1])) {
        char new_header[3] = {(char)toupper(p->header[0]), ':', '\0'};
        tc_free(p->header);
        p->header = tc_strcpy(new_header);
    } else if (strlen(p->header) == 2 && isalpha(p->header[1]) && !isalpha(p->header[0])) {
        char new_header[3] = {(char)toupper(p->header[1]), ':', '\0'};
        tc_free(p->header);
        p->header = tc_strcpy(new_header);
    } else if (strlen(p->header) == 1 && isalpha(p->header[0])) {
        char new_header[3] = {(char)toupper(p->header[0]), ':', '\0'};
        tc_free(p->header);
        p->header = tc_strcpy(new_header);
    }
    path_rebuild(p);
}

static void path_normalize_linux(Path* p) {
    if (tc_strcmp(p->header, "")) {
        tc_free(p->header);
        p->header = tc_strcpy(".");
    } else if (tc_strcmp(p->header, "/")) {
        tc_free(p->header);
        p->header = tc_strcpy("");
    } else if (strlen(p->header) == 2 && isalpha(p->header[0]) && !isalpha(p->header[1])) {
        char new_header[3] = {'/', (char)tolower(p->header[0]), '\0'};
        tc_free(p->header);
        p->header = tc_strcpy(new_header);
    } else if (strlen(p->header) == 2 && isalpha(p->header[1]) && !isalpha(p->header[0])) {
        char new_header[3] = {'/', (char)tolower(p->header[1]), '\0'};
        tc_free(p->header);
        p->header = tc_strcpy(new_header);
    } else if (strlen(p->header) == 1 && isalpha(p->header[0])) {
        char new_header[3] = {'/', (char)tolower(p->header[0]), '\0'};
        tc_free(p->header);
        p->header = tc_strcpy(new_header);
    }
    path_rebuild(p);
}

void path_normalize(Path* p) {
    Array* normalized_components = arr_init(sizeof(char*), p->components->length);
    for (size_t i = 0; i < p->components->length; i++) {
        char* component = *(char**)arr_get_item(p->components, (int)i);
        if (tc_strcmp(component, ".")) {
            continue;
        } else if (tc_strcmp(component, "..")) {
            if (normalized_components->length > 0) {
                char* to_free = *(char**)arr_get_item(normalized_components, (int)(normalized_components->length - 1));
                tc_free(to_free);
                normalized_components->length--;
            }
        } else {
            char* comp_dup = tc_strcpy(component);
            arr_push(normalized_components, &comp_dup);
        }
    }

    for (size_t i = 0; i < p->components->length; i++) {
        tc_free(*(char**)arr_get_item(p->components, (int)i));
    }
    arr_free(p->components);
    p->components = normalized_components;
    path_rebuild(p);
#ifdef PLATFORM_WINDOWS
    path_normalize_windows(p);
#elif defined(PLATFORM_LINUX) || defined(PLATFORM_MACOS)
    path_normalize_linux(p);
#endif
}

void path_change_extension(Path* p, const char* new_ext) {
    tc_free(p->extension);
    if (new_ext[0] == '.') {
        p->extension = tc_strcpy(new_ext + 1);
    } else {
        p->extension = tc_strcpy(new_ext);
    }
    path_rebuild(p);
}

void path_change_file_name(Path* p, const char* new_name, bool replace_extension) {
    if (replace_extension) {
        const char* dot = strrchr(new_name, '.');
        if (dot && dot != new_name) {
            tc_free(p->file_name);
            p->file_name = tc_strncpy(new_name, (size_t)(dot - new_name));
            tc_free(p->extension);
            p->extension = tc_strcpy(dot + 1);
        } else {
            tc_free(p->file_name);
            p->file_name = tc_strcpy(new_name);
        }
    } else {
        tc_free(p->file_name);
        p->file_name = tc_strcpy(new_name);
    }
    path_rebuild(p);
}

void path_free(Path* p) {
    if (!p) return;
    tc_free(p->components);
    tc_free(p->header);
    tc_free(p->file_name);
    tc_free(p->extension);
    tc_free(p->path);
    tc_free(p);
}
