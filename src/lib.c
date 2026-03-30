#include "lib.h"

static const char* keywordStrings[keywordCount] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var"};
string keywordList[keywordCount] = {0};
static const char* symbolStrings[symbolCount] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
string symbolList[symbolCount] = {0};

MemoryBlock* struct_memory = NULL;
MemoryBlock* string_memory = NULL;
bool initialized = false;

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

static void increase_memory_size(bool for_struct) {
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
        initialized = false;
        exit(1);
    }
    new_block->block = (pointer)malloc(defaultMemorySize);
    new_block->size = defaultMemorySize;
    new_block->used = 0;
    new_block->next = NULL;
    if (for_struct) {
        struct_memory_used += struct_memory->used;
        new_block->next = struct_memory;
        struct_memory = new_block;
        struct_memory_count += defaultMemorySize;
    } else {
        string_memory_used += string_memory->used;
        new_block->next = string_memory;
        string_memory = new_block;
        string_memory_count += defaultMemorySize;
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

static string create_string_check(const char* data, size_t length, bool check) {
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
    if (length >= defaultMemorySize - 1)
        str = alloc_big_memory(length + 1);
    else {
        if (string_memory->used + length >= string_memory->size)
            increase_memory_size(false);
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
    return create_string_check(data, length, false);
}

string create_string(const char* data, size_t length) {
    return create_string_check(data, length, true);
}

void init(void) {
    if (initialized) return;
    if (struct_memory == NULL) {
        struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (struct_memory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            initialized = false;
            exit(1);
        }
        struct_memory->block = (size_t*)malloc(defaultMemorySize);
        struct_memory->size = defaultMemorySize;
        struct_memory->used = 0;
        struct_memory->next = NULL;
        struct_memory_count = defaultMemorySize;
    }
    if (string_memory == NULL) {
        string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (string_memory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            initialized = false;
            exit(1);
        }
        string_memory->block = (pointer)malloc(defaultMemorySize);
        string_memory->size = defaultMemorySize;
        string_memory->used = 0;
        string_memory->next = NULL;
        string_memory_count = defaultMemorySize;
    }
    initialized = true;
    for (size_t i = 0; i < keywordCount; ++i)
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
    for (size_t i = 0; i < symbolCount; ++i)
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
    DEFAULT_INIT_NAME = create_string_check("init", 4, false);
    DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, false);
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
    size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
    if (struct_memory->used + size >= struct_memory->size)
        increase_memory_size(true);
    assert(struct_memory->used % ALIGN_SIZE == 0);
    size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
    struct_memory->used += size;
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

inline bool string_equal(string a, string b) {
    return a == b;
}

string get_info(void) {
    size_t stringCount = 0;
    StringList* current = all_string_list;
    while (current != NULL) {
        stringCount++;
        current = current->next;
    }
    // max: 47 char
    string struct_memory_used_str = create_string_check("", 48, false);
    sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
    // max: 47 char
    string string_memory_used_str = create_string_check("", 48, false);
    sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
    // max: 239 char
    string info = (string)create_string_check("", 240, false);
    sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", PLATFORM, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
    return info;
}
