#ifndef TC_MEM_H
#define TC_MEM_H

#include "tc_lib.h"

extern void** mem_blocks;

void tc_free_all_memory(void);
void* tc_malloc(size_t size);
void* tc_realloc(void* ptr, size_t size);

#endif  // TC_MEM_H
