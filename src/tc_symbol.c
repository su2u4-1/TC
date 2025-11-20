#include "tc_symbol.h"

SymbolTable* symbol_table_init(SymbolTableType kind, struct SymbolTable* parent) {
    SymbolTable* table = (SymbolTable*)tc_malloc(sizeof(SymbolTable));
    table->kind = kind;
    table->symbols = arr_init(sizeof(Symbol*), 16);
    table->parent = parent;
    return table;
}

Symbol* symbol_init(SymbolType kind, const char* name, SymbolTypeUnion* type) {
    Symbol* symbol = (Symbol*)tc_malloc(sizeof(Symbol));
    symbol->kind = kind;
    symbol->name = (char*)tc_malloc(strlen(name) + 1);
    strcpy(symbol->name, name);
    // if kind == CLASS_SYMBOL, type points to Class*
    // if kind == FUNCTION_SYMBOL, type points to Function*
    // if kind == VARIABLE_SYMBOL or ARGUMENT_SYMBOL or ATTRIBUTE_SYMBOL, type points to Type*
    symbol->type = type;
    return symbol;
}
