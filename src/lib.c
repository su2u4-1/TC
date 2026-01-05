#include "lib.h"

#include <string.h>

char* memory = NULL;
static size_t memorySize = 1048576;
static size_t memoryUsed = 0;
static char* memoryEnd = NULL;
bool initialized = false;

string keywordList[21] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void"};
size_t keywordCount = 21;

StringList* allStrings = NULL;

static void increase_memory_size(void) {
    memorySize *= 2;
    memory = (char*)realloc(memory, memorySize);
    if (memory == NULL) {
        char* newMemory = (char*)malloc(memorySize);
        for (size_t i = 0; i < memoryUsed; i++)
            newMemory[i] = memory[i];
        free(memory);
        memory = newMemory;
    }
}

void init(void) {
    if (initialized) return;
    if (memory == NULL)
        memory = (char*)malloc(memorySize);
    initialized = true;
    for (size_t i = 0; i < keywordCount; ++i)
        keywordList[i] = create_string(keywordList[i], strlen(keywordList[i]));
}

string create_string(const char* data, size_t length) {
    if (!initialized) init();
    if (data == NULL || length == 0) return NULL;

    StringList* current = allStrings;
    string existing = NULL;
    while (current != NULL) {
        if (current->length == length && strncmp(current->str, data, length) == 0)
            existing = current->str;
        current = current->next;
    }

    if (existing != NULL)
        return existing;
    if (memoryUsed + length >= memorySize)
        increase_memory_size();

    string str = &memory[memoryUsed];
    strncpy(str, data, length);
    str[length] = '\0';
    memoryUsed += length + 1;

    StringList* newString = (StringList*)alloc_memory(sizeof(StringList));
    newString->str = str;
    newString->length = length;
    newString->next = allStrings;
    allStrings = newString;

    return str;
}

void* alloc_memory(size_t size) {
    if (!initialized) init();
#ifdef COMPUTE_MEM_BLOCK
    memoryUsed += sizeof(size_t) + sizeof(char*);
#endif
    if (memoryUsed + size >= memorySize)
        increase_memory_size();
    char* ptr = &memory[memoryUsed];
#ifdef COMPUTE_MEM_BLOCK
    memcpy(&memory[memoryUsed - sizeof(char*) - sizeof(size_t)], &size, sizeof(size_t));
    memcpy(&memory[memoryUsed - sizeof(char*)], &memoryEnd, sizeof(char*));
#endif
    memoryUsed += size;
    memoryEnd = ptr;
    return ptr;
}

bool is_keyword(const string str) {
    if (!initialized) init();
    for (size_t i = 0; i < keywordCount; ++i)
        if (string_equal(str, keywordList[i]))
            return true;
    return false;
}

static int string_compare_count[3] = {0, 0, 0};

bool string_equal(const string a, const string b) {
    ++string_compare_count[0];
    if ((size_t)(a - memory) < memoryUsed && (size_t)(b - memory) < memoryUsed) return a == b;
    ++string_compare_count[1];
    if (a == NULL || b == NULL) return false;
    ++string_compare_count[2];
    return strcmp(a, b) == 0;
}

char* get_info(void) {
    char* info = (char*)malloc(256);
    size_t stringCount = 0;
    StringList* current = allStrings;
    while (current != NULL) {
        stringCount++;
        current = current->next;
    }
    size_t memoryBlockCount = 0;
#ifdef COMPUTE_MEM_BLOCK
    char* ptr = memoryEnd;
    while (ptr != NULL && ptr > memory) {
        memoryBlockCount++;
        ptr -= sizeof(char*);
        memcpy(&ptr, ptr, sizeof(char*));
    }
    memoryUsed -= memoryBlockCount * (sizeof(size_t) + sizeof(char*));
#endif
    sprintf(info, "Platform: %d, Memory Used: %zu bytes, stringCount: %zu, string compare count: %d %d %d\n    Memory Block Count: %zu, Increased memory consumption: %zu", PLATFORM, memoryUsed, stringCount, string_compare_count[0], string_compare_count[1], string_compare_count[2], memoryBlockCount, memoryBlockCount * (sizeof(size_t) + sizeof(char*)));
    return info;
}
