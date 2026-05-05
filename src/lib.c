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
    StringTable* table = (StringTable*)alloc_memory(sizeof(StringTable), true);
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
    StringNode* node = (StringNode*)alloc_memory(sizeof(StringNode), true);
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

void init(void) {
    if (string_memory == NULL)
        string_memory = create_memory_block(DEFAULT_MEMORY_SIZE);
    if (struct_memory == NULL)
        struct_memory = create_memory_block(DEFAULT_MEMORY_SIZE);
    if (string_table == NULL)
        string_table = create_string_table(1024);
}

string create_string(const char* str, size_t len) {
    return create_string_check(str, len, true);
}

pointer alloc_memory(size_t size, bool is_struct) {
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
