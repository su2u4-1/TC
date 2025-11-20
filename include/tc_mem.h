#ifndef TC_MEM_H
#define TC_MEM_H

#include "tc_lib.h"

void tc_free_all_memory(void);
void* tc_malloc(size_t size);
void* tc_realloc(void* ptr, size_t size);
void tc_free(void* ptr);

typedef struct {
    void* items;
    size_t length;
    size_t length_max;
    size_t item_size;
} Array;

Array* arr_init(size_t item_size, size_t initial_length);
void arr_push(Array* arr, void* item);
void arr_free(Array* arr);
void* arr_get_all(Array* arr);
void* arr_get_item(Array* arr, int index);

#endif  // TC_MEM_H
