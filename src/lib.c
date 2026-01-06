#include "lib.h"

#include <string.h>

char* memory = NULL;
static size_t memorySize = 1024;  // 1 KB
static size_t memoryUsed = 0;
static char* memoryEnd = NULL;
bool initialized = false;

static const char* keywordStrings[21] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void"};
offset keywordList[21] = {0};
size_t keywordCount = 21;

StringList* allStrings = NULL;

static void increase_memory_size(void) {
    char* oldMemory = memory;
    memorySize *= 2;
    char* newMemory = (char*)realloc(memory, memorySize);
#ifdef DEBUG
    printf("Use realloc to increase memory size to %zu bytes\n", memorySize);
#endif
    if (newMemory == NULL) {
        newMemory = (char*)malloc(memorySize);
#ifdef DEBUG
        printf("Use malloc to increase memory size to %zu bytes\n", memorySize);
#endif
        if (newMemory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            exit(1);
        }
        memcpy(newMemory, oldMemory, memoryUsed);
        free(oldMemory);
    }
    memory = newMemory;
}

void init(void) {
    if (initialized) return;
    if (memory == NULL)
        memory = (char*)malloc(memorySize);
    initialized = true;
    for (size_t i = 0; i < keywordCount; ++i)
        keywordList[i] = create_string(keywordStrings[i], strlen(keywordStrings[i]));
}

offset create_string(const char* data, size_t length) {
    if (!initialized) init();
    if (data == NULL || length == 0) return 0;

    StringList* current = allStrings;
    offset existing = 0;
    while (current != NULL) {
        if (current->length == length && strncmp(offset_to_ptr(current->str), data, length) == 0)
            existing = current->str;
        current = current->next;
    }

    if (existing != 0)
        return existing;
    if (memoryUsed + length >= memorySize)
        increase_memory_size();

    offset off = memoryUsed;
    string str = &memory[memoryUsed];
    strncpy(str, data, length);
    str[length] = '\0';
    memoryUsed += length + 1;

    StringList* newString = (StringList*)alloc_memory(sizeof(StringList));
    newString->str = off;
    newString->length = length;
    newString->next = allStrings;
    allStrings = newString;

    return off;
}

static size_t memoryBlockCount = 0;

void* alloc_memory(size_t size) {
    if (!initialized) init();
    if (memoryUsed + size >= memorySize)
        increase_memory_size();
    char* ptr = &memory[memoryUsed];
    memoryUsed += size;
    memoryEnd = ptr;
    ++memoryBlockCount;
    return ptr;
}

bool is_keyword(const offset str) {
    if (!initialized) init();
    for (size_t i = 0; i < keywordCount; ++i)
        if (string_equal(str, keywordList[i]))
            return true;
    return false;
}

static int string_compare_count[3] = {0, 0, 0};

bool string_equal(const offset a, const offset b) {
    ++string_compare_count[0];
    if (a < memoryUsed && b < memoryUsed) return a == b;
    --string_compare_count[0];
    ++string_compare_count[1];
    if (a == 0 || b == 0) return false;
    --string_compare_count[1];
    ++string_compare_count[2];
    return strcmp(offset_to_ptr(a), offset_to_ptr(b)) == 0;
}

char* get_info(void) {
    char* info = (char*)malloc(256);
    size_t stringCount = 0;
    StringList* current = allStrings;
    while (current != NULL) {
        stringCount++;
        current = current->next;
    }
    sprintf(info, "Platform: %d, Memory Used: %zu bytes, stringCount: %zu, string compare count: %d %d %d, Memory Block Count: %zu", PLATFORM, memoryUsed, stringCount, string_compare_count[0], string_compare_count[1], string_compare_count[2], memoryBlockCount);
    return info;
}

string offset_to_ptr(offset off) {
    return memory + off;
}

offset ptr_to_offset(string ptr) {
    if (ptr < memory || ptr >= memory + memoryUsed) {
        fprintf(stderr, "Error: ptr_to_offset received invalid pointer: ptr - memory: %lu\n", ptr - memory);
        return 0;
    }
    return (offset)(ptr - memory);
}
