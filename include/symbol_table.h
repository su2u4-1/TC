#ifndef SYMBOL_TABLE_H
#define SYMBOL_TABLE_H

#include "lib.h"

typedef enum SymbolType {
    SYMBOL_TYPE,
    SYMBOL_VARIABLE,
    SYMBOL_FUNCTION,
    SYMBOL_CLASS,
    SYMBOL_METHOD,
    SYMBOL_ATTRIBUTE,
    SYMBOL_PARAMETER,
} SymbolType;

typedef struct Symbol Symbol;
typedef struct Function Function;
typedef struct Method Method;
typedef struct Class Class;
struct Symbol {
    string name;
    /*
    attribute, parameter, variable: type
    function, method: return type
    type(if is container): element type
    type(otherwise): NULL
    class: NULL
    */
    Symbol* type;
    SymbolType kind;
    string id;
    union {
        Function* function;  // for function
        Method* method;      // for method
        Class* class;        // for class
        size_t offset;       // for variable, attribute, parameter
        void* other;         // for type, always NULL
    } info;
    SymbolTable* table;
};

typedef enum SymbolTableType {
    SYMBOL_TABLE_GLOBAL,
    SYMBOL_TABLE_FUNCTION,
    SYMBOL_TABLE_CLASS,
    SYMBOL_TABLE_METHOD,
    SYMBOL_TABLE_BLOCK,
} SymbolTableType;

typedef struct SymbolTable SymbolTable;
struct SymbolTable {
    SymbolTable* parent;
    SymbolTableType type;
    list(Symbol*) symbols;
};

Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table);
SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent);
Symbol* search_symbol(SymbolTable* table, string name, bool compare_kind, SymbolType compare_kind_value, Symbol* compare_type);
void init_symbol(void);

#endif  // SYMBOL_TABLE_H
