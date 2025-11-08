#include "tc_mem.h"

#include "tc_err.h"

size_t mem_block_index = 0;
size_t mem_block_length = 16;
void** mem_blocks = NULL;

static void mem_init(void) {
    mem_blocks = (void**)malloc(sizeof(void*) * mem_block_length);
}

void tc_free_all_memory(void) {
    if (mem_blocks != NULL) {
        for (size_t i = 0; i < mem_block_index; i++) {
            free(mem_blocks[i]);
        }
        free(mem_blocks);
    }
    mem_blocks = NULL;
    mem_block_index = 0;
    mem_block_length = 16;
}

void* tc_malloc(size_t size) {
    if (mem_blocks == NULL) {
        mem_init();
    }
    void* ptr = malloc(size);
    if (ptr == NULL) {
        tcerr_alloc();
    }
    if (mem_block_index >= mem_block_length) {
        mem_block_length *= 2;
        void* temp = realloc(mem_blocks, sizeof(void*) * mem_block_length);
        if (temp == NULL) {
            tcerr_alloc();
        }
        mem_blocks = (void**)temp;
    }
    mem_blocks[mem_block_index++] = ptr;
    return ptr;
}

void* tc_realloc(void* ptr, size_t size) {
    if (ptr == NULL) {
        return tc_malloc(size);
    }
    if (mem_blocks == NULL) {
        mem_init();
    }
    void* new_ptr = realloc(ptr, size);
    if (new_ptr == NULL) {
        tcerr_alloc();
    }
    for (size_t i = 0; i < mem_block_index; i++) {
        if (mem_blocks[i] == ptr) {
            mem_blocks[i] = new_ptr;
            break;
        }
    }
    return new_ptr;
}

void tc_free(void* ptr) {
    if (ptr == NULL) {
        return;
    }
    for (size_t i = 0; i < mem_block_index; i++) {
        if (mem_blocks[i] == ptr) {
            free(mem_blocks[i]);
            mem_blocks[i] = mem_blocks[--mem_block_index];
            return;
        }
    }
    free(ptr);
    printf("warning: Attempted to free untracked memory\n");
}
