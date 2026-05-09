#include "lib.h"

MemoryBlock* string_memory = NULL;
MemoryBlock* struct_memory = NULL;

static size_t malloc_allocated = 0;
static size_t string_count = 0;
static StringTable* string_table = NULL;

static void free_all_memory(void) {
    MemoryBlock* block = string_memory;
    while (block != NULL) {
        MemoryBlock* next = block->next;
        free(block->data);
        free(block);
        block = next;
    }
    string_memory = NULL;
    block = struct_memory;
    while (block != NULL) {
        MemoryBlock* next = block->next;
        free(block->data);
        free(block);
        block = next;
    }
    struct_memory = NULL;
}

static MemoryBlock* create_memory_block(size_t size) {
    MemoryBlock* block = malloc(sizeof(MemoryBlock));
    if (block == NULL) {
        fprintf(stderr, "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n");
        free_all_memory();
        abort();
    }
    malloc_allocated += sizeof(MemoryBlock);
    block->size = size;
    block->used = 0;
    block->data = malloc(size);
    if (block->data == NULL) {
        fprintf(stderr, "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n");
        free(block);
        free_all_memory();
        abort();
    }
    malloc_allocated += size;
    block->next = NULL;
    return block;
}

static void increase_memory(MemoryBlock** block, size_t additional_size) {
    MemoryBlock* new_block = create_memory_block((*block)->size + additional_size);
    new_block->next = *block;
    *block = new_block;
}

static StringTable* create_string_table(size_t capacity) {
    StringTable* table = create_struct(StringTable);
    table->capacity = capacity;
    table->count = 0;
    table->buckets = calloc(capacity, sizeof(StringNode*));
    return table;
}

// FNV-1a hash function
static size_t hash(const char* str, size_t len) {
    size_t hash_value = 2166136261;
    for (size_t i = 0; i < len; i++) {
        hash_value ^= (unsigned char)str[i];
        hash_value *= 16777619;
    }
    return hash_value;
}

static string create_string_check(const char* str, size_t len, bool check) {
    size_t hash_value = hash(str, len);
    size_t index = hash_value % string_table->capacity;
    if (check) {
        StringNode* current = string_table->buckets[index];
        while (current != NULL) {
            if (current->size == len && current->hash == hash_value && strncmp(current->value, str, len) == 0)
                return current->value;
            current = current->next;
        }
    }
    StringNode* node = create_struct(StringNode);
    node->size = len;
    node->hash = hash_value;
    node->next = string_table->buckets[index];
    node->value = (string)alloc_memory(len + 1, false);
    memcpy(node->value, str, len);
    node->value[len] = '\0';
    string_table->buckets[index] = node;
    string_table->count++;
    string_count++;
    return node->value;
}

static void init_constant(void);
void init(void) {
    if (string_memory == NULL)
        string_memory = create_memory_block(DEFAULT_MEMORY_SIZE);
    if (struct_memory == NULL)
        struct_memory = create_memory_block(DEFAULT_MEMORY_SIZE);
    if (string_table == NULL)
        string_table = create_string_table(1024);
    init_constant();
}

string create_string(const char* str, size_t len) {
    return create_string_check(str, len, true);
}

pointer alloc_memory(size_t size, bool is_struct) {
    if (size >= DEFAULT_MEMORY_SIZE) {
        pointer ptr = malloc(size);
        if (ptr == NULL) {
            fprintf(stderr, "[lib Fatal] at <alloc_memory>: Cannot allocate memory\n");
            free(ptr);
            free_all_memory();
            abort();
        }
        malloc_allocated += size;
        return ptr;
    }
    MemoryBlock* block = string_memory;
    if (is_struct) {
        block = struct_memory;
        size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
    }
    while (block != NULL) {
        if (block->size - block->used >= size) {
            pointer ptr = (void*)(block->data + block->used);
            if (is_struct)
                assert((uintptr_t)ptr % ALIGN_SIZE == 0);
            if (block->size - block->used >= size) {
                block->used += size;
                return ptr;
            }
        }
        block = block->next;
    }
    if (is_struct)
        increase_memory(&struct_memory, size);
    else
        increase_memory(&string_memory, size);
    return alloc_memory(size, is_struct);
}

string string_splice(string format, ...) {
#include <stdarg.h>
    va_list args;
    va_start(args, format);
    int length = vsnprintf(NULL, 0, format, args);
    va_end(args);
    if (length <= 0) {
        fprintf(stderr, "[lib Error] at <string_splice>: Failed to format string\n");
        return NULL;
    }
    char* name = malloc((size_t)length + 1);
    if (name == NULL) {
        fprintf(stderr, "[lib Fatal] at <string_splice>: Cannot allocate memory\n");
        free_all_memory();
        abort();
    }
    va_start(args, format);
    vsnprintf(name, (size_t)length + 1, format, args);
    va_end(args);
    string result = create_string(name, (size_t)length);
    free(name);
    return result;
}

string get_info(void) {
    size_t used_memory_count = 0;
    size_t total_memory_count = 0;
    size_t memory_block_count = 0;
    MemoryBlock* block = struct_memory;
    while (block != NULL) {
        used_memory_count += block->used;
        total_memory_count += block->size;
        ++memory_block_count;
        block = block->next;
    }
    string struct_info = string_splice("struct memory: [used/total: %zu/%zu, blocks: %zu]", used_memory_count, total_memory_count, memory_block_count);
    used_memory_count = 0;
    total_memory_count = 0;
    memory_block_count = 0;
    block = string_memory;
    while (block != NULL) {
        used_memory_count += block->used;
        total_memory_count += block->size;
        ++memory_block_count;
        block = block->next;
    }
    string string_info = string_splice("string memory: [used/total: %zu/%zu, blocks: %zu]", used_memory_count, total_memory_count, memory_block_count);
    return string_splice("platform: %d, malloc allocated: %zu, %s, %s", PLATFORM, malloc_allocated, string_info, struct_info);
}

static const char* keywordStrings[keywordCount] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var", "pointer", "const"};
string keywordList[keywordCount] = {0};
static const char* symbolStrings[symbolCount] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
string symbolList[symbolCount] = {0};
static const char* specialStrings[specialCount] = {"$init", "$to_int", "$to_float", "$to_string", "$to_bool", "$add", "$sub", "$mul", "$div", "$mod", "$eq", "$lt", "$gt", "$and", "$or", "$not", "$neg"};
string specialList[specialCount] = {0};

string KEYWORD_IMPORT = NULL;
string KEYWORD_FROM = NULL;
string KEYWORD_FUNC = NULL;
string KEYWORD_CLASS = NULL;
string KEYWORD_METHOD = NULL;
string KEYWORD_SELF = NULL;
string KEYWORD_IF = NULL;
string KEYWORD_ELIF = NULL;
string KEYWORD_ELSE = NULL;
string KEYWORD_WHILE = NULL;
string KEYWORD_FOR = NULL;
string KEYWORD_TRUE = NULL;
string KEYWORD_FALSE = NULL;
string KEYWORD_RETURN = NULL;
string KEYWORD_BREAK = NULL;
string KEYWORD_CONTINUE = NULL;
string KEYWORD_INT = NULL;
string KEYWORD_FLOAT = NULL;
string KEYWORD_STRING = NULL;
string KEYWORD_BOOL = NULL;
string KEYWORD_VOID = NULL;
string KEYWORD_VAR = NULL;
string KEYWORD_POINTER = NULL;
string KEYWORD_CONST = NULL;
string SYMBOL_L_PAREN = NULL;
string SYMBOL_R_PAREN = NULL;
string SYMBOL_L_BRACE = NULL;
string SYMBOL_R_BRACE = NULL;
string SYMBOL_COMMA = NULL;
string SYMBOL_NOT = NULL;
string SYMBOL_DOT = NULL;
string SYMBOL_L_BRACKET = NULL;
string SYMBOL_R_BRACKET = NULL;
string SYMBOL_SEMICOLON = NULL;
string SYMBOL_UNDERLINE = NULL;
string SYMBOL_ADD = NULL;
string SYMBOL_SUB = NULL;
string SYMBOL_MUL = NULL;
string SYMBOL_DIV = NULL;
string SYMBOL_MOD = NULL;
string SYMBOL_LT = NULL;
string SYMBOL_GT = NULL;
string SYMBOL_ASSIGN = NULL;
string SYMBOL_EQ = NULL;
string SYMBOL_NE = NULL;
string SYMBOL_LE = NULL;
string SYMBOL_GE = NULL;
string SYMBOL_ADD_ASSIGN = NULL;
string SYMBOL_SUB_ASSIGN = NULL;
string SYMBOL_MUL_ASSIGN = NULL;
string SYMBOL_DIV_ASSIGN = NULL;
string SYMBOL_MOD_ASSIGN = NULL;
string SYMBOL_AND = NULL;
string SYMBOL_OR = NULL;
string SPECIAL_INIT = NULL;
string SPECIAL_TO_INT = NULL;
string SPECIAL_TO_FLOAT = NULL;
string SPECIAL_TO_STRING = NULL;
string SPECIAL_TO_BOOL = NULL;
string SPECIAL_ADD = NULL;
string SPECIAL_SUB = NULL;
string SPECIAL_MUL = NULL;
string SPECIAL_DIV = NULL;
string SPECIAL_MOD = NULL;
string SPECIAL_EQ = NULL;
string SPECIAL_LT = NULL;
string SPECIAL_GT = NULL;
string SPECIAL_AND = NULL;
string SPECIAL_OR = NULL;
string SPECIAL_NOT = NULL;
string SPECIAL_NEG = NULL;
Symbol* symbol_int = NULL;
Symbol* symbol_float = NULL;
Symbol* symbol_string = NULL;
Symbol* symbol_bool = NULL;
Symbol* symbol_void = NULL;
Symbol* symbol_pointer = NULL;
Symbol* symbol_const = NULL;

static void init_constant(void) {
    for (size_t i = 0; i < keywordCount; ++i) {
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
    }
    KEYWORD_IMPORT = keywordList[0];
    KEYWORD_FROM = keywordList[1];
    KEYWORD_FUNC = keywordList[2];
    KEYWORD_CLASS = keywordList[3];
    KEYWORD_METHOD = keywordList[4];
    KEYWORD_SELF = keywordList[5];
    KEYWORD_IF = keywordList[6];
    KEYWORD_ELIF = keywordList[7];
    KEYWORD_ELSE = keywordList[8];
    KEYWORD_WHILE = keywordList[9];
    KEYWORD_FOR = keywordList[10];
    KEYWORD_TRUE = keywordList[11];
    KEYWORD_FALSE = keywordList[12];
    KEYWORD_RETURN = keywordList[13];
    KEYWORD_BREAK = keywordList[14];
    KEYWORD_CONTINUE = keywordList[15];
    KEYWORD_INT = keywordList[16];
    KEYWORD_FLOAT = keywordList[17];
    KEYWORD_STRING = keywordList[18];
    KEYWORD_BOOL = keywordList[19];
    KEYWORD_VOID = keywordList[20];
    KEYWORD_VAR = keywordList[21];
    KEYWORD_POINTER = keywordList[22];
    KEYWORD_CONST = keywordList[23];
    for (size_t i = 0; i < symbolCount; ++i) {
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
    }
    SYMBOL_L_PAREN = symbolList[0];
    SYMBOL_R_PAREN = symbolList[1];
    SYMBOL_L_BRACE = symbolList[2];
    SYMBOL_R_BRACE = symbolList[3];
    SYMBOL_COMMA = symbolList[4];
    SYMBOL_NOT = symbolList[5];
    SYMBOL_DOT = symbolList[6];
    SYMBOL_L_BRACKET = symbolList[7];
    SYMBOL_R_BRACKET = symbolList[8];
    SYMBOL_SEMICOLON = symbolList[9];
    SYMBOL_UNDERLINE = symbolList[10];
    SYMBOL_ADD = symbolList[11];
    SYMBOL_SUB = symbolList[12];
    SYMBOL_MUL = symbolList[13];
    SYMBOL_DIV = symbolList[14];
    SYMBOL_MOD = symbolList[15];
    SYMBOL_LT = symbolList[16];
    SYMBOL_GT = symbolList[17];
    SYMBOL_ASSIGN = symbolList[18];
    SYMBOL_EQ = symbolList[19];
    SYMBOL_NE = symbolList[20];
    SYMBOL_LE = symbolList[21];
    SYMBOL_GE = symbolList[22];
    SYMBOL_ADD_ASSIGN = symbolList[23];
    SYMBOL_SUB_ASSIGN = symbolList[24];
    SYMBOL_MUL_ASSIGN = symbolList[25];
    SYMBOL_DIV_ASSIGN = symbolList[26];
    SYMBOL_MOD_ASSIGN = symbolList[27];
    SYMBOL_AND = symbolList[28];
    SYMBOL_OR = symbolList[29];
    for (size_t i = 0; i < specialCount; ++i) {
        specialList[i] = create_string_check(specialStrings[i], strlen(specialStrings[i]), false);
    }
    SPECIAL_INIT = specialList[0];
    SPECIAL_TO_INT = specialList[1];
    SPECIAL_TO_FLOAT = specialList[2];
    SPECIAL_TO_STRING = specialList[3];
    SPECIAL_TO_BOOL = specialList[4];
    SPECIAL_ADD = specialList[5];
    SPECIAL_SUB = specialList[6];
    SPECIAL_MUL = specialList[7];
    SPECIAL_DIV = specialList[8];
    SPECIAL_MOD = specialList[9];
    SPECIAL_EQ = specialList[10];
    SPECIAL_LT = specialList[11];
    SPECIAL_GT = specialList[12];
    SPECIAL_AND = specialList[13];
    SPECIAL_OR = specialList[14];
    SPECIAL_NOT = specialList[15];
    SPECIAL_NEG = specialList[16];
}

List* list_create(void) {
    List* self = create_struct(List);
    self->head = NULL;
    self->tail = NULL;
    return self;
}
void list_append(List* self, pointer value) {
    if (self == NULL) {
        fprintf(stderr, "[lib Fatal] at <list_append>: List is NULL\n");
        abort();
    }
    ListNode* node = create_struct(ListNode);
    node->data = value;
    node->next = NULL;
    if (self->tail == NULL) {
        self->head = node;
        self->tail = node;
    } else {
        self->tail->next = node;
        self->tail = node;
    }
}
pointer list_pop_front(List* self) {
    if (list_empty(self)) {
        fprintf(stderr, "[lib Fatal] at <list_pop_front>: List is empty\n");
        abort();
    }
    pointer value = self->head->data;
    self->head = self->head->next;
    if (self->head == NULL) {
        self->tail = NULL;
    }
    return value;
}
pointer list_pop_back(List* self) {
    if (list_empty(self)) {
        fprintf(stderr, "[lib Fatal] at <list_pop_back>: List is empty\n");
        abort();
    }
    pointer value = self->tail->data;
    if (self->head == self->tail) {
        self->head = NULL;
        self->tail = NULL;
    } else {
        ListNode* previous = self->head;
        while (previous->next != self->tail) {
            previous = previous->next;
        }
        previous->next = NULL;
        self->tail = previous;
    }
    return value;
}

bool is_special(string str) {
    for (size_t i = 0; i < specialCount; ++i) {
        if (str == specialList[i]) {
            return true;
        }
    }
    return false;
}
