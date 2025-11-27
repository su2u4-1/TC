#include "tc_symbol.h"

SymbolTable* symbol_table_init(SymbolTable* parent, const char* name) {
    SymbolTable* table = (SymbolTable*)tc_malloc(sizeof(SymbolTable));
    table->parent = parent;
    table->name = tc_strcpy(name);
    table->symbols = NULL;
    return table;
}

Symbol* symbol_init(const char* name, const char* type) {
    Symbol* symbol = (Symbol*)tc_malloc(sizeof(Symbol));
    symbol->name = tc_strcpy(name);
    symbol->type = tc_strcpy(type);
    return symbol;
}

Symbol* symbol_table_get_symbol(SymbolTable* table, const char* name) {
    LinkListItem* current = table->symbols;
    while (current != NULL) {
        if (tc_strcmp(current->key, name)) {
            return current->value;
        }
        current = current->next;
    }
    return NULL;
}

void symbol_table_add_symbol(SymbolTable* table, Symbol* symbol) {
    if (table->symbols == NULL) {
        table->symbols = (LinkListItem*)tc_malloc(sizeof(LinkListItem));
        table->symbols->key = tc_strcpy(symbol->name);
        table->symbols->value = symbol;
        table->symbols->next = NULL;
        return;
    }
    LinkListItem* current = table->symbols;
    while (current->next != NULL) {
        current = current->next;
    }
    LinkListItem* new_item = (LinkListItem*)tc_malloc(sizeof(LinkListItem));
    new_item->key = tc_strcpy(symbol->name);
    new_item->value = symbol;
    new_item->next = NULL;
    current->next = new_item;
}

void symbol_table_free(SymbolTable* table) {
    if (table) {
        LinkListItem* current = table->symbols;
        while (current != NULL) {
            LinkListItem* next = current->next;
            tc_free(current->key);
            tc_free(current->value->name);
            tc_free(current->value->type);
            tc_free(current->value);
            tc_free(current);
            current = next;
        }
        tc_free(table->name);
        tc_free(table);
    }
}
