#ifndef TC_SYMBOL_H
#define TC_SYMBOL_H

#include <sys/cdefs.h>

#include "tc_lib.h"
#include "tc_mem.h"

/*
SymbolTable {
    kind: enum[GLOBAL_SYMBOL_TABLE, CLASS_SYMBOL_TABLE, FUNCTION_SYMBOL_TABLE, BLOCK_SYMBOL_TABLE],
    parent: SymbolTable*,
    name: string or NULL,  // if kind is CLASS_SYMBOL_TABLE or FUNCTION_SYMBOL_TABLE, name is required
    symbols: LinkListItem*,  // map[string, Symbol*]
}
LinkListItem {
    key: string,
    value: Symbol*,
    next: LinkListItem*,
}
Symbol {
    name: string,
    kind: enum[VARIABLE_SYMBOL, FUNCTION_SYMBOL, CLASS_SYMBOL, PARAMETER_SYMBOL],
    type: string,
}
*/

typedef enum {
    GLOBAL_SYMBOL_TABLE,
    CLASS_SYMBOL_TABLE,
    FUNCTION_SYMBOL_TABLE,
    BLOCK_SYMBOL_TABLE,
} SymbolTableKind;

typedef enum {
    VARIABLE_SYMBOL,
    FUNCTION_SYMBOL,
    CLASS_SYMBOL,
    PARAMETER_SYMBOL,
} SymbolKind;

typedef struct {
    char* name;
    SymbolKind kind;
    char* type;
} Symbol;

typedef struct LinkListItem {
    char* key;
    Symbol* value;
    struct LinkListItem* next;
} LinkListItem;

typedef struct SymbolTable {
    SymbolTableKind kind;
    struct SymbolTable* parent;
    char* name;
    LinkListItem* symbols;
} SymbolTable;

SymbolTable* symbol_table_init(SymbolTable* parent, const char* name);
Symbol* symbol_init(const char* name, const char* type);
Symbol* symbol_table_get_symbol(SymbolTable* table, const char* name);
void symbol_table_add_symbol(SymbolTable* table, Symbol* symbol);
void symbol_table_free(SymbolTable* table);

#endif  // TC_SYMBOL_H
