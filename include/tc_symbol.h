#ifndef TC_SYMBOL_H
#define TC_SYMBOL_H

#include "tc_lib.h"
#include "tc_mem.h"

/*
SymbolTable {
    kind: literal["global", "class", "function", "block"],
    parent: SymbolTable*,
    symbols: list[symbol],
}
Symbol {
    kind: literal["variable", "function", "class", "argument", "attribute"],
    name: string,
    type: union[Type* | Class* | Function*],
}
Type {
    name: string,
}
Class {
    name: string,
    attributes: list[Symbol],
    methods: list[Symbol],
}
Function {
    name: string,
    return_type: Type*,
    parameters: list[Symbol],
}
*/

typedef enum {
    GLOBAL_SYMBOL_TABLE,
    CLASS_SYMBOL_TABLE,
    FUNCTION_SYMBOL_TABLE,
    BLOCK_SYMBOL_TABLE
} SymbolTableType;

typedef enum {
    VARIABLE_SYMBOL,
    FUNCTION_SYMBOL,
    CLASS_SYMBOL,
    ARGUMENT_SYMBOL,
    ATTRIBUTE_SYMBOL
} SymbolType;

typedef struct {
    char* name;
} Type;

typedef struct {
    char* name;
    Array* attributes;  // Array of Symbol*
    Array* methods;     // Array of Symbol*
} Class;

typedef struct {
    char* name;
    Type* return_type;
    Array* parameters;  // Array of Symbol*
} Function;

typedef union {
    Type type;
    Class class;
    Function function;
} SymbolTypeUnion;

typedef struct {
    SymbolTableType kind;
    struct SymbolTable* parent;
    Array* symbols;  // Array of Symbol*
} SymbolTable;

typedef struct {
    SymbolType kind;
    char* name;
    SymbolTypeUnion* type;  // Can point to Type*, Class*, or Function*
} Symbol;

SymbolTable* symbol_table_init(SymbolTableType kind, struct SymbolTable* parent);
Symbol* symbol_init(SymbolType kind, const char* name, SymbolTypeUnion* type);

#endif  // TC_SYMBOL_H
