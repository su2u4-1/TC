#ifndef TC_MEM_H
#define TC_MEM_H

#include "tc_lib.h"

void** mem_blocks = NULL;
size_t mem_block_count = 0;

void* tc_malloc(size_t size);
void* tc_realloc(void* ptr, size_t size);

#endif  // TC_MEM_H
