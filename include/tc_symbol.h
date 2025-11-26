#ifndef TC_SYMBOL_H
#define TC_SYMBOL_H

#include <sys/cdefs.h>

#include "tc_lib.h"
#include "tc_mem.h"

/*
SymbolTable {
    kind: literal["global", "class", "function", "block"],
    parent: SymbolTable*,
}
Symbol {
    name: string,
}
*/

typedef struct SymbolTable {
    struct SymbolTable* parent;
} SymbolTable;

typedef struct {
    char* name;
} Symbol;

SymbolTable* symbol_table_init(SymbolTable* parent);
Symbol* symbol_init(const char* name);

#endif  // TC_SYMBOL_H
