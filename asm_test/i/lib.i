#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
typedef char* string;
typedef size_t* pointer;
typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    MemoryBlock* next;
    pointer block;
};
typedef struct StringList StringList;
struct StringList {
    string str;
    size_t length;
    StringList* next;
};
extern string keywordList[22];
extern string symbolList[30];
extern MemoryBlock* struct_memory;
extern MemoryBlock* string_memory;
extern char initialized;
extern StringList* all_string_list;
extern string DEFAULT_INIT_NAME;
extern string DEFAULT_CONSTRUCTOR_NAME;
extern string IMPORT_KEYWORD;
extern string FROM_KEYWORD;
extern string FUNC_KEYWORD;
extern string CLASS_KEYWORD;
extern string METHOD_KEYWORD;
extern string SELF_KEYWORD;
extern string IF_KEYWORD;
extern string ELIF_KEYWORD;
extern string ELSE_KEYWORD;
extern string WHILE_KEYWORD;
extern string FOR_KEYWORD;
extern string TRUE_KEYWORD;
extern string FALSE_KEYWORD;
extern string RETURN_KEYWORD;
extern string BREAK_KEYWORD;
extern string CONTINUE_KEYWORD;
extern string INT_KEYWORD;
extern string FLOAT_KEYWORD;
extern string STRING_KEYWORD;
extern string BOOL_KEYWORD;
extern string VOID_KEYWORD;
extern string VAR_KEYWORD;
extern string L_PAREN_SYMBOL;
extern string R_PAREN_SYMBOL;
extern string L_BRACE_SYMBOL;
extern string R_BRACE_SYMBOL;
extern string COMMA_SYMBOL;
extern string NOT_SYMBOL;
extern string DOT_SYMBOL;
extern string L_BRACKET_SYMBOL;
extern string R_BRACKET_SYMBOL;
extern string SEMICOLON_SYMBOL;
extern string UNDERLINE_SYMBOL;
extern string ADD_SYMBOL;
extern string SUB_SYMBOL;
extern string MUL_SYMBOL;
extern string DIV_SYMBOL;
extern string MOD_SYMBOL;
extern string LT_SYMBOL;
extern string GT_SYMBOL;
extern string ASSIGN_SYMBOL;
extern string EQ_SYMBOL;
extern string NE_SYMBOL;
extern string LE_SYMBOL;
extern string GE_SYMBOL;
extern string ADD_ASSIGN_SYMBOL;
extern string SUB_ASSIGN_SYMBOL;
extern string MUL_ASSIGN_SYMBOL;
extern string DIV_ASSIGN_SYMBOL;
extern string MOD_ASSIGN_SYMBOL;
extern string AND_SYMBOL;
extern string OR_SYMBOL;
typedef struct SymbolTable SymbolTable;
typedef struct Symbol Symbol;
extern Symbol* name_void;
extern Symbol* name_int;
extern Symbol* name_float;
extern Symbol* name_string;
extern Symbol* name_bool;
extern SymbolTable* builtin_scope;
string create_string_not_check(const char* data, size_t length);
string create_string(const char* data, size_t length);
pointer alloc_memory(size_t size);
char is_keyword(const string str);
char string_equal(string a, string b);
string get_info(void);
static const char* keywordStrings[22] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var"};
string keywordList[22] = {0};
static const char* symbolStrings[30] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
string symbolList[30] = {0};
MemoryBlock* struct_memory = NULL;
MemoryBlock* string_memory = NULL;
char initialized = 0;
StringList* all_string_list = NULL;
string DEFAULT_INIT_NAME = NULL;
string DEFAULT_CONSTRUCTOR_NAME = NULL;
string IMPORT_KEYWORD = NULL;
string FROM_KEYWORD = NULL;
string FUNC_KEYWORD = NULL;
string CLASS_KEYWORD = NULL;
string METHOD_KEYWORD = NULL;
string SELF_KEYWORD = NULL;
string IF_KEYWORD = NULL;
string ELIF_KEYWORD = NULL;
string ELSE_KEYWORD = NULL;
string WHILE_KEYWORD = NULL;
string FOR_KEYWORD = NULL;
string TRUE_KEYWORD = NULL;
string FALSE_KEYWORD = NULL;
string RETURN_KEYWORD = NULL;
string BREAK_KEYWORD = NULL;
string CONTINUE_KEYWORD = NULL;
string INT_KEYWORD = NULL;
string FLOAT_KEYWORD = NULL;
string STRING_KEYWORD = NULL;
string BOOL_KEYWORD = NULL;
string VOID_KEYWORD = NULL;
string VAR_KEYWORD = NULL;
string L_PAREN_SYMBOL = NULL;
string R_PAREN_SYMBOL = NULL;
string L_BRACE_SYMBOL = NULL;
string R_BRACE_SYMBOL = NULL;
string COMMA_SYMBOL = NULL;
string NOT_SYMBOL = NULL;
string DOT_SYMBOL = NULL;
string L_BRACKET_SYMBOL = NULL;
string R_BRACKET_SYMBOL = NULL;
string SEMICOLON_SYMBOL = NULL;
string UNDERLINE_SYMBOL = NULL;
string ADD_SYMBOL = NULL;
string SUB_SYMBOL = NULL;
string MUL_SYMBOL = NULL;
string DIV_SYMBOL = NULL;
string MOD_SYMBOL = NULL;
string LT_SYMBOL = NULL;
string GT_SYMBOL = NULL;
string ASSIGN_SYMBOL = NULL;
string EQ_SYMBOL = NULL;
string NE_SYMBOL = NULL;
string LE_SYMBOL = NULL;
string GE_SYMBOL = NULL;
string ADD_ASSIGN_SYMBOL = NULL;
string SUB_ASSIGN_SYMBOL = NULL;
string MUL_ASSIGN_SYMBOL = NULL;
string DIV_ASSIGN_SYMBOL = NULL;
string MOD_ASSIGN_SYMBOL = NULL;
string AND_SYMBOL = NULL;
string OR_SYMBOL = NULL;
Symbol* name_void = NULL;
Symbol* name_int = NULL;
Symbol* name_float = NULL;
Symbol* name_string = NULL;
Symbol* name_bool = NULL;
SymbolTable* builtin_scope = NULL;
static size_t struct_memory_used = 0;
static size_t string_memory_used = 0;
static size_t struct_memory_count = 0;
static size_t string_memory_count = 0;
static void init(void);
static void increase_memory_size(char for_struct) {
    MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
    if (new_block == NULL) {
        fprintf(stderr, "Fatal: Cannot allocate memory\n");
        MemoryBlock* current = string_memory;
        while (current != NULL) {
            MemoryBlock* next = current->next;
            free(current->block);
            free(current);
            current = next;
        }
        initialized = 0;
        exit(1);
    }
    new_block->block = (pointer)malloc(1024);
    new_block->size = 1024;
    new_block->used = 0;
    new_block->next = NULL;
    if (for_struct) {
        struct_memory_used += struct_memory->used;
        new_block->next = struct_memory;
        struct_memory = new_block;
        struct_memory_count += 1024;
    } else {
        string_memory_used += string_memory->used;
        new_block->next = string_memory;
        string_memory = new_block;
        string_memory_count += 1024;
    }
}
static string alloc_big_memory(size_t size) {
    string_memory_count += size;
    string_memory_used += size;
    char* block = (char*)malloc(size);
    fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
    if (block == NULL) {
        fprintf(stderr, "Fatal: Cannot allocate memory\n");
        exit(1);
    }
    return block;
}
static string create_string_check(const char* data, size_t length, char check) {
    if (!initialized) init();
    if (data == NULL || length == 0) return 0;
    if (check) {
        StringList* current = all_string_list;
        string existing = NULL;
        while (current != NULL) {
            if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
                existing = current->str;
            current = current->next;
        }
        if (existing != NULL)
            return existing;
    }
    char* str;
    if (length >= 1024 - 1)
        str = alloc_big_memory(length + 1);
    else {
        if (string_memory->used + length >= string_memory->size)
            increase_memory_size(0);
        str = &((char*)(string_memory->block))[string_memory->used];
        string_memory->used += length + 1;
    }
    strncpy(str, data, length);
    str[length] = '\0';
    StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
    new_str->str = str;
    new_str->length = length;
    new_str->next = all_string_list;
    all_string_list = new_str;
    return str;
}
string create_string_not_check(const char* data, size_t length) {
    return create_string_check(data, length, 0);
}
string create_string(const char* data, size_t length) {
    return create_string_check(data, length, 1);
}
void init(void) {
    if (initialized) return;
    if (struct_memory == NULL) {
        struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (struct_memory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            initialized = 0;
            exit(1);
        }
        struct_memory->block = (size_t*)malloc(1024);
        struct_memory->size = 1024;
        struct_memory->used = 0;
        struct_memory->next = NULL;
        struct_memory_count = 1024;
    }
    if (string_memory == NULL) {
        string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (string_memory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            initialized = 0;
            exit(1);
        }
        string_memory->block = (pointer)malloc(1024);
        string_memory->size = 1024;
        string_memory->used = 0;
        string_memory->next = NULL;
        string_memory_count = 1024;
    }
    initialized = 1;
    for (size_t i = 0; i < 22; ++i)
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
    for (size_t i = 0; i < 30; ++i)
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
    DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
    DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
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
    VAR_KEYWORD = keywordList[21];
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
pointer alloc_memory(size_t size) {
    if (!initialized) init();
    size = (size + sizeof(size_t) - 1) & ~(sizeof(size_t) - 1);
    if (struct_memory->used + size >= struct_memory->size)
        increase_memory_size(1);
    assert(struct_memory->used % sizeof(size_t) == 0);
    size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
    struct_memory->used += size;
    ++memoryBlockCount;
    return ptr;
}
char is_keyword(const string str) {
    if (!initialized) init();
    for (size_t i = 0; i < 22; ++i)
        if (string_equal(str, keywordList[i]))
            return 1;
    return 0;
}
inline char string_equal(string a, string b) {
    return a == b;
}
string get_info(void) {
    size_t stringCount = 0;
    StringList* current = all_string_list;
    while (current != NULL) {
        stringCount++;
        current = current->next;
    }
    string struct_memory_used_str = create_string_check("", 48, 0);
    sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
    string string_memory_used_str = create_string_check("", 48, 0);
    sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
    string info = (string)create_string_check("", 240, 0);
    sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", 2, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
    return info;
}
