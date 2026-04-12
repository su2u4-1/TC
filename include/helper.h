#ifndef HELPER_H
#define HELPER_H

#include "object.h"

#define ast_output(x, is_last, ...) indention(outfile, indent + x, is_last, indent_has_next), fprintf(outfile, __VA_ARGS__)
#define tac_output(x, ...) indention_tac(outfile, x), fprintf(outfile, __VA_ARGS__)
#define is_builtin_type(type) (string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD))
#define parser_error(message, token, file_name) fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message)
#define make_method_name(class_name, method_name) string_splice("%s.%s", class_name, method_name)

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
void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]);
void indention_tac(FILE* out, size_t indent);
Parser* create_parser(File* file);
Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file);

// operator helper functions
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);

#endif  // HELPER_H
