#include "tc_file.h"

#include <string.h>

#include "tc_mem.h"

static char* str_dup_n(const char* s, size_t n) {
    if (!s) return NULL;
    char* d = (char*)tc_malloc(n + 1);
    strncpy(d, s, n);
    d[n] = '\0';
    return d;
}

static char* str_dup(const char* s) {
    if (!s) return NULL;
    return str_dup_n(s, strlen(s));
}

static void path_rebuild(Path* p) {
    size_t total_len = 0;
    if (p->header && p->header[0] != '\0') {
        total_len += strlen(p->header);
    }

    for (size_t i = 0; i < p->components->length; ++i) {
        char* component = *(char**)arr_get_item(p->components, (int)i);
        if (component && component[0] != '\0') {
            total_len += strlen(component) + 1;  // +1 for '/'
        }
    }

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

    for (size_t i = 0; i < p->components->length; ++i) {
        char* component = *(char**)arr_get_item(p->components, (int)i);
        if (component && component[0] != '\0') {
            if (p->path[0] != '\0' && p->path[strlen(p->path) - 1] != '/') {
                strcat(p->path, "/");
            }
            strcat(p->path, component);
        }
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
    p->path = str_dup(path);
    for (char* c = p->path; *c; ++c) {
        if (*c == '\\') *c = '/';
    }

    char* temp_path = str_dup(p->path);
    char* rest = temp_path;

    char* first_slash = strchr(rest, '/');
    if (first_slash) {
        p->header = str_dup_n(rest, (size_t)(first_slash - rest));
        rest = first_slash + 1;
    } else {
        p->header = str_dup("");
        rest = temp_path;
    }

    char* last_slash = strrchr(rest, '/');
    char* components_str;
    if (last_slash) {
        components_str = str_dup_n(rest, (size_t)(last_slash - rest));
        p->file_name = str_dup(last_slash + 1);
    } else {
        components_str = str_dup("");
        p->file_name = str_dup(rest);
    }

    p->components = arr_init(sizeof(char*), 8);
    if (components_str[0] != '\0') {
        char* component = strtok(components_str, "/");
        while (component) {
            char* comp_dup = str_dup(component);
            arr_push(p->components, &comp_dup);
            component = strtok(NULL, "/");
        }
    }

    if (p->header[0] == '\0' && p->path[0] == '/') {
        tc_free(p->header);
        p->header = str_dup("/");
    }

    char* dot = strrchr(p->file_name, '.');
    if (dot && dot != p->file_name) {
        p->extension = str_dup(dot + 1);
        *dot = '\0';
    } else {
        p->extension = str_dup("");
    }

    tc_free(temp_path);
    tc_free(components_str);
    return p;
}

static void path_normalize(Path* p) {
    Array* normalized_components = arr_init(sizeof(char*), p->components->length);
    for (size_t i = 0; i < p->components->length; i++) {
        char* component = *(char**)arr_get_item(p->components, (int)i);
        if (strcmp(component, ".") == 0) {
            continue;
        } else if (strcmp(component, "..") == 0) {
            if (normalized_components->length > 0) {
                char* to_free = *(char**)arr_get_item(normalized_components, (int)(normalized_components->length - 1));
                tc_free(to_free);
                normalized_components->length--;
            }
        } else {
            char* comp_dup = str_dup(component);
            arr_push(normalized_components, &comp_dup);
        }
    }

    for (size_t i = 0; i < p->components->length; i++) {
        tc_free(*(char**)arr_get_item(p->components, (int)i));
    }
    arr_free(p->components);
    p->components = normalized_components;
    path_rebuild(p);
}

void path_normalize_windows(Path* p) {
    path_normalize(p);
    size_t header_len = strlen(p->header);
    if (header_len == 1 && isalpha(p->header[0])) {
        char new_header[3] = {(char)toupper(p->header[0]), ':', '\0'};
        tc_free(p->header);
        p->header = str_dup(new_header);
    } else if (header_len == 2 && p->header[1] == ':' && isalpha(p->header[0])) {
        p->header[0] = (char)toupper(p->header[0]);
    } else if (strcmp(p->header, "") == 0) {
        tc_free(p->header);
        p->header = str_dup(".");
    } else if (strcmp(p->header, "/") == 0) {
        tc_free(p->header);
        p->header = str_dup("C:");
    }
    path_rebuild(p);
}

void path_normalize_linux(Path* p) {
    path_normalize(p);
    if (strlen(p->header) > 0 && strcmp(p->header, "/") != 0) {
        char* new_header = (char*)tc_malloc(strlen(p->header) + 2);
        sprintf(new_header, "/%s", p->header);
        for (char* c = new_header; *c; ++c) *c = (char)tolower((unsigned char)*c);
        tc_free(p->header);
        p->header = new_header;
    } else if (strcmp(p->header, "") == 0) {
        tc_free(p->header);
        p->header = str_dup(".");
    }
    path_rebuild(p);
}

void path_change_extension(Path* p, const char* new_ext) {
    tc_free(p->extension);
    if (new_ext[0] == '.') {
        p->extension = str_dup(new_ext + 1);
    } else {
        p->extension = str_dup(new_ext);
    }
    path_rebuild(p);
}

void path_change_file_name(Path* p, const char* new_name, bool replace_extension) {
    if (replace_extension) {
        const char* dot = strrchr(new_name, '.');
        if (dot && dot != new_name) {
            tc_free(p->file_name);
            p->file_name = str_dup_n(new_name, (size_t)(dot - new_name));
            tc_free(p->extension);
            p->extension = str_dup(dot + 1);
        } else {
            tc_free(p->file_name);
            p->file_name = str_dup(new_name);
        }
    } else {
        tc_free(p->file_name);
        p->file_name = str_dup(new_name);
    }
    path_rebuild(p);
}
