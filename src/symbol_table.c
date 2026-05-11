#include "symbol_table.h"

Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table) {
    static size_t symbol_count = 0;
    Symbol* symbol = create_struct(Symbol);
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
    if (table != NULL) {
        list_append(table->symbols, (pointer)symbol);
    }
    return symbol;
}

SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent) {
    SymbolTable* table = create_struct(SymbolTable);
    table->parent = parent;
    table->type = type;
    table->symbols = list_create();
    return table;
}

void init_symbol(void) {
    global_symbol_table = create_symbol_table(SYMBOL_TABLE_GLOBAL, NULL);
    symbol_int = create_symbol(KEYWORD_INT, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
    symbol_float = create_symbol(KEYWORD_FLOAT, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
    symbol_string = create_symbol(KEYWORD_STRING, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
    symbol_bool = create_symbol(KEYWORD_BOOL, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
    symbol_void = create_symbol(KEYWORD_VOID, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
    symbol_pointer = create_symbol(KEYWORD_POINTER, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
    symbol_const = create_symbol(KEYWORD_CONST, NULL, SYMBOL_TYPE, NULL, global_symbol_table);
}
