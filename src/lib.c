#include "lib.h"

#include <stddef.h>
#include <string.h>

char* memory = NULL;
static size_t memorySize = 1024;  // 1 KB
static size_t memoryUsed = 0;
bool initialized = false;

static const char* keywordStrings[keywordCount] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void"};
string keywordList[keywordCount] = {0};
static const char* symbolStrings[symbolCount] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
string symbolList[symbolCount] = {0};

offset(StringList*) allStrings = 0;

static void increase_memory_size(void) {
    char* oldMemory = memory;
    memorySize *= 2;
    memory = (char*)realloc(memory, memorySize);
    if (memory == NULL) {
        fprintf(stderr, "Fatal: Cannot allocate memory\n");
        free(oldMemory);
        exit(1);
    }
}

static string create_string_check(const char* data, size_t length, bool check) {
    if (!initialized) init();
    if (data == NULL || length == 0) return 0;
    if (check) {
        StringList* current = (StringList*)offset_to_ptr(allStrings);
        string existing = 0;
        while (current != NULL) {
            if (current->length == length && current->str != 0 && strncmp(string_to_char_ptr(current->str), data, length) == 0)
                existing = current->str;
            current = (StringList*)offset_to_ptr(current->next);
        }
        if (existing != 0)
            return existing;
    }
    if (memoryUsed + length >= memorySize)
        increase_memory_size();
    string off = memoryUsed;
    char* str = &memory[memoryUsed];
    strncpy(str, data, length);
    str[length] = '\0';
    memoryUsed += length + 1;
    offset(StringList*) newString = alloc_memory(sizeof(StringList));
    StringList* ptr = (StringList*)offset_to_ptr(newString);
    ptr->str = off;
    ptr->length = length;
    ptr->next = allStrings;
    allStrings = newString;

    return off;
}

static string create_string_not_check(const char* data, size_t length) {
    return create_string_check(data, length, false);
}

string create_string(const char* data, size_t length) {
    return create_string_check(data, length, true);
}

void init(void) {
    if (initialized) return;
    if (memory == NULL)
        memory = (char*)malloc(memorySize);
    initialized = true;
    for (size_t i = 0; i < keywordCount; ++i)
        keywordList[i] = create_string_not_check(keywordStrings[i], strlen(keywordStrings[i]));
    for (size_t i = 0; i < symbolCount; ++i)
        symbolList[i] = create_string_not_check(symbolStrings[i], strlen(symbolStrings[i]));
    IMPORT_KEYWORD = keywordList[0];
    FROM_KEYWORD = keywordList[1];
    FUNC_KEYWORD = keywordList[2];
    CLASS_KEYWORD = keywordList[3];
    METHOD_KEYWORD = keywordList[4];
    SELF_KEYWORD = keywordList[5];
    IF_KEYWORD = keywordList[6];
    ELIF_KEYWORD = keywordList[7];
    ELSE_KEYWORD = keywordList[8];
    WHILE_KEYWORD = keywordList[9];
    FOR_KEYWORD = keywordList[10];
    TRUE_KEYWORD = keywordList[11];
    FALSE_KEYWORD = keywordList[12];
    RETURN_KEYWORD = keywordList[13];
    BREAK_KEYWORD = keywordList[14];
    CONTINUE_KEYWORD = keywordList[15];
    INT_KEYWORD = keywordList[16];
    FLOAT_KEYWORD = keywordList[17];
    STRING_KEYWORD = keywordList[18];
    BOOL_KEYWORD = keywordList[19];
    VOID_KEYWORD = keywordList[20];
    L_PAREN_SYMBOL = symbolList[0];
    R_PAREN_SYMBOL = symbolList[1];
    L_BRACE_SYMBOL = symbolList[2];
    R_BRACE_SYMBOL = symbolList[3];
    COMMA_SYMBOL = symbolList[4];
    NOT_SYMBOL = symbolList[5];
    DOT_SYMBOL = symbolList[6];
    L_BRACKET_SYMBOL = symbolList[7];
    R_BRACKET_SYMBOL = symbolList[8];
    SEMICOLON_SYMBOL = symbolList[9];
    UNDERLINE_SYMBOL = symbolList[10];
    ADD_SYMBOL = symbolList[11];
    SUB_SYMBOL = symbolList[12];
    MUL_SYMBOL = symbolList[13];
    DIV_SYMBOL = symbolList[14];
    MOD_SYMBOL = symbolList[15];
    LT_SYMBOL = symbolList[16];
    GT_SYMBOL = symbolList[17];
    ASSIGN_SYMBOL = symbolList[18];
    EQ_SYMBOL = symbolList[19];
    NE_SYMBOL = symbolList[20];
    LE_SYMBOL = symbolList[21];
    GE_SYMBOL = symbolList[22];
    ADD_ASSIGN_SYMBOL = symbolList[23];
    SUB_ASSIGN_SYMBOL = symbolList[24];
    MUL_ASSIGN_SYMBOL = symbolList[25];
    DIV_ASSIGN_SYMBOL = symbolList[26];
    MOD_ASSIGN_SYMBOL = symbolList[27];
    AND_SYMBOL = symbolList[28];
    OR_SYMBOL = symbolList[29];
}

static size_t memoryBlockCount = 0;

size_t alloc_memory(size_t size) {
    if (!initialized) init();
    if (memoryUsed + size >= memorySize)
        increase_memory_size();
    size_t ptr = memoryUsed = (memoryUsed + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
    memoryUsed += size;
    ++memoryBlockCount;
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

bool string_equal(string a, string b) {
    ++string_compare_count[0];
    if (a < memoryUsed && b < memoryUsed) return a == b;
    --string_compare_count[0];
    ++string_compare_count[1];
    if (a == 0 || b == 0) return false;
    --string_compare_count[1];
    ++string_compare_count[2];
    return strcmp(string_to_char_ptr(a), string_to_char_ptr(b)) == 0;
}

string get_info(void) {
    string info = (string)create_string_not_check("", 192);
    size_t stringCount = 0;
    StringList* current = (StringList*)offset_to_ptr(allStrings);
    while (current != NULL) {
        stringCount++;
        current = (StringList*)offset_to_ptr(current->next);
    }
    sprintf(string_to_char_ptr(info), "Platform: %d, Memory Used: %zu bytes, stringCount: %zu, string compare count: %d %d %d, Memory Block Count: %zu", PLATFORM, memoryUsed, stringCount, string_compare_count[0], string_compare_count[1], string_compare_count[2], memoryBlockCount);
    return info;
}

char* string_to_char_ptr(string str) {
    if (str <= 0 || str >= memoryUsed) return NULL;
    return memory + str;
}

size_t* offset_to_ptr(offset() off) {
    if (off <= 0 || off >= memoryUsed) return NULL;
    return (size_t*)(void*)(memory + off);
}

string char_ptr_to_string(char* ptr) {
    if (ptr < memory || ptr >= memory + memoryUsed) {
        fprintf(stderr, "Error: ptr_to_string received invalid pointer: ptr - memory: %lu\n", ptr - memory);
        return 0;
    }
    return (string)(ptr - memory);
}
