#include "symbol_table.h"

Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info) {
    static size_t symbol_count = 0;
    Symbol* symbol = (Symbol*)alloc_memory(sizeof(Symbol), true);
    symbol->name = name;
    symbol->type = type;
    symbol->kind = kind;
    char* kind_str = "unknown";
    switch (kind) {
        case SYMBOL_TYPE:
            kind_str = "type";
            break;
        case SYMBOL_VARIABLE:
            kind_str = "variable";
            break;
        case SYMBOL_FUNCTION:
            kind_str = "function";
            break;
        case SYMBOL_CLASS:
            kind_str = "class";
            break;
        case SYMBOL_METHOD:
            kind_str = "method";
            break;
        case SYMBOL_ATTRIBUTE:
            kind_str = "attribute";
            break;
        case SYMBOL_PARAMETER:
            kind_str = "parameter";
            break;
        default:
            break;
    }
    symbol->id = string_splice("%s_%zu(%s)", kind_str, symbol_count++, name);
    symbol->info.other = info;
    return symbol;
}

SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent) {
    SymbolTable* table = (SymbolTable*)alloc_memory(sizeof(SymbolTable), true);
    table->parent = parent;
    table->type = type;
    table->symbols = list_create();
    return table;
}
