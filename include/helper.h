#ifndef HELPER_H
#define HELPER_H

#include "file.h"
#include "parser.h"

#define ast_output(x, is_last, ...) indention(outfile, indent + x, is_last, parser), fprintf(outfile, __VA_ARGS__)

typedef struct Parser {
    File* source_file;
    bool in_function;
    bool in_method;
    bool in_loop;
    char indent_has_next[32];
} Parser;

typedef struct Token Token;

// list helper functions
list() create_list(void);
void list_append(list() list, pointer item);
list() list_copy(list() original);
pointer list_pop(list() list);
pointer list_pop_back(list() list);
bool list_is_empty(list() list);

// parser helper functions
Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node);
SymbolTable* create_symbol_table(SymbolTable* parent);
Symbol* search_name(SymbolTable* scope, string name);
bool is_builtin_type(string type);
void parser_error(const string message, Token* token, string file_name);
void indention(FILE* out, size_t indent, bool is_last, Parser* parser);
Parser* create_parser(File* file);
Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file);
string make_method_name(string class_name, string method_name);

// operator helper functions
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);

#endif  // HELPER_H
