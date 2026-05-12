#include "symbol_table.h"

Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table) {
    static size_t symbol_count = 0;
    Symbol* symbol = search_symbol(table, name, true, kind, type);
    if (symbol != NULL) {
        if (symbol->kind == kind && symbol->type == type) {
            return symbol;
        } else if (symbol->table == table) {
            fprintf(stderr, "[symbol_table Error] at <create_symbol> Symbol '%s' already exists in the current scope\n", name);
            return NULL;
        } else {
            fprintf(stderr, "[symbol_table Warning] at <create_symbol> Symbol '%s' already exists in an outer scope, but with a different type or kind. Creating a new symbol in the current scope.\n", name);
        }
    }
    symbol = create_struct(Symbol);
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
    symbol->table = table;
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

Symbol* search_symbol(SymbolTable* table, string name, bool compare_kind, SymbolType compare_kind_value, Symbol* compare_type) {
    for (int stage = 0; stage < 3; stage++) {
        for (SymbolTable* current = table; current != NULL; current = current->parent) {
            for (ListNode* node = current->symbols->head; node != NULL; node = node->next) {
                Symbol* symbol = (Symbol*)node->data;
                if (symbol->name != name) continue;
                bool match = false;
                switch (stage) {
                    case 0:
                        match = (!compare_kind || symbol->kind == compare_kind_value) && (compare_type == NULL || symbol->type == compare_type);
                        break;
                    case 1:
                        match = (compare_type == NULL || symbol->type == compare_type);
                        break;
                    case 2:
                        match = true;
                        break;
                    default: break;
                }
                if (match) return symbol;
            }
        }
        if (stage == 0 && !compare_kind && compare_type == NULL)
            break;
        if (stage == 1 && compare_type == NULL)
            break;
    }
    return NULL;
}
