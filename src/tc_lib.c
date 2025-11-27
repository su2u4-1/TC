#include "tc_lib.h"

#include "tc_mem.h"

char* tc_keywords[21];
int tc_keywords_count = 21;

char* tc_symbols[31];
int tc_symbols_count = 31;

void tc_lib_init(void) {
    const char* kws[] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void"};
    for (int i = 0; i < 21; i++)
        tc_keywords[i] = intern(kws[i]);

    const char* syms[] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", "\"", ";", "_", "+", "-", "*", "/", "%", "==", "!=", "<", ">", "<=", ">=", "&&", "||", "=", "+=", "-=", "*=", "/=", "%="};
    for (int i = 0; i < 31; i++)
        tc_symbols[i] = intern(syms[i]);
}

typedef struct LinkListItem {
    char* value;
    struct LinkListItem* next;
} LinkListItem;

static LinkListItem* internal_string_table = NULL;

char* intern(const char* s) {
    if (!s)
        return NULL;
    LinkListItem* current = internal_string_table;
    while (current != NULL) {
        if (current->value == s)
            return current->value;
        current = current->next;
    }
    current = internal_string_table;
    while (current != NULL) {
        if (strcmp(current->value, s) == 0)
            return current->value;
        current = current->next;
    }
    char* copied;
    size_t len = strlen(s);
    copied = (char*)tc_malloc(len + 1);
    strncpy(copied, s, len + 1);
    LinkListItem* new_item = (LinkListItem*)tc_malloc(sizeof(LinkListItem));
    new_item->value = copied;
    new_item->next = internal_string_table;
    internal_string_table = new_item;
    return copied;
}

char* tc_strcpy(const char* s) {
    if (!s)
        return NULL;
    return intern(s);
}

char* tc_strncpy(const char* s, size_t n) {
    if (!s)
        return NULL;
    char* buf = (char*)tc_malloc(n + 1);
    strncpy(buf, s, n);
    buf[n] = '\0';
    char* interned = intern(buf);
    tc_free(buf);
    return interned;
}

bool tc_strcmp(const char* s1, const char* s2) {
    // TODO
    return strcmp(s1, s2) == 0;
}
