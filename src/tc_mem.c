#include "tc_mem.h"

#include "tc_err.h"

static size_t mem_block_index = 0;
static size_t mem_block_length = 16;
static void** mem_blocks = NULL;

static void mem_init(void) {
    mem_blocks = (void**)malloc(sizeof(void*) * mem_block_length);
}

static void mem_blocks_add(void* ptr) {
    if (mem_block_index >= mem_block_length) {
        mem_block_length *= 2;
        void* temp = realloc(mem_blocks, sizeof(void*) * mem_block_length);
        if (temp == NULL) {
            tcerr_alloc();
        }
        mem_blocks = (void**)temp;
    }
    mem_blocks[mem_block_index++] = ptr;
}

void tc_free_all_memory(void) {
    if (mem_blocks != NULL) {
        for (size_t i = 0; i < mem_block_index; i++) {
            if (mem_blocks[i] != NULL) {
                free(mem_blocks[i]);
            }
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
    if (size <= 0) {
#ifdef DEBUG
        printf("[debug]: Attempted to allocate zero or negative bytes\n");
#endif
        return NULL;
    }
    void* ptr = malloc(size);
    if (ptr == NULL) {
        tcerr_alloc();
    }
    mem_blocks_add(ptr);
    return ptr;
}

void* tc_realloc(void* ptr, size_t size) {
    if (size <= 0) {
#ifdef DEBUG
        printf("[debug]: Attempted to reallocate zero or negative bytes\n");
#endif
        return NULL;
    }
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
            return new_ptr;
        }
    }
    printf("[debug]: Attempted to realloc untracked memory\n");
    mem_blocks_add(new_ptr);
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
    printf("[debug]: Attempted to free untracked memory\n");
}

Array* arr_init(size_t item_size, size_t initial_length) {
    Array* arr = (Array*)tc_malloc(sizeof(Array));
    arr->items = tc_malloc(item_size * initial_length);
    arr->length = 0;
    arr->length_max = initial_length;
    arr->item_size = item_size;
    return arr;
}

void arr_push(Array* arr, void* item) {
    if (arr->length >= arr->length_max) {
        arr->length_max *= 2;
        arr->items = tc_realloc(arr->items, arr->item_size * arr->length_max);
    }
    memcpy((char*)arr->items + arr->length * arr->item_size, item, arr->item_size);
    arr->length++;
}

void arr_free(Array* arr) {
    tc_free(arr->items);
    tc_free(arr);
}

void* arr_get_all(Array* arr) {
    if (arr->length == 0) {
        return NULL;
    }
    void* block = tc_malloc(arr->item_size * arr->length + 1);
    memcpy(block, arr->items, arr->item_size * arr->length);
    return block;
}

void* arr_get_item(Array* arr, int index) {
    if (index >= (int)arr->length) {
        printf("[debug]: Attempted to access out-of-bounds array index\n");
        return NULL;
    }
    size_t _index;
    if (index < 0) {
        index = -index;
        if ((size_t)index > arr->length) {
            printf("[debug]: Attempted to access out-of-bounds array index\n");
            return NULL;
        }
        _index = arr->length - (size_t)index;
    } else {
        _index = (size_t)index;
    }
    return (char*)arr->items + _index * arr->item_size;
}
