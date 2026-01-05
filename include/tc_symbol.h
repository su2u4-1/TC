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
    type: Symbol*,
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

typedef struct Symbol {
    char* name;
    SymbolKind kind;
    struct Symbol* type;
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

void tc_symbol_init(void);
SymbolTable* symbol_table_init(SymbolTable* parent, const char* name);
Symbol* symbol_init(const char* name, SymbolKind kind, Symbol* type);
Symbol* symbol_table_get_symbol(SymbolTable* table, const char* name);
void symbol_table_add_symbol(SymbolTable* table, Symbol* symbol);
void symbol_table_free(SymbolTable* table);

extern Symbol* type_int;
extern Symbol* type_float;
extern Symbol* type_string;
extern Symbol* type_bool;
extern Symbol* type_void;

#endif  // TC_SYMBOL_H
