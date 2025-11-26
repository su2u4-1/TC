#include "tc_symbol.h"

SymbolTable* symbol_table_init(SymbolTable* parent) {
    SymbolTable* table = (SymbolTable*)tc_malloc(sizeof(SymbolTable));
    table->parent = parent;
    return table;
}

Symbol* symbol_init(const char* name) {
    Symbol* symbol = (Symbol*)tc_malloc(sizeof(Symbol));
    symbol->name = (char*)tc_malloc(strlen(name) + 1);
    strcpy(symbol->name, name);
    symbol->name[strlen(name)] = '\0';
    return symbol;
}
