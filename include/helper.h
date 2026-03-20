#ifndef HELPER_H
#define HELPER_H

#include "parser.h"

#define OUT(x, is_last, ...) indention(outfile, indent + x, is_last, parser), fprintf(outfile, __VA_ARGS__)

typedef struct Parser {
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

// parser helper functions
Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope);
Scope* create_scope(Scope* parent);
Name* search_name(Scope* scope, string name);
bool is_builtin_type(string type);
void parser_error(const string message, Token* token);
void indention(FILE* out, size_t indent, bool is_last, Parser* parser);
Parser* create_parser(void);
Name* parse_import_file(string import_name, string source, Scope* scope);

// operator helper functions
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);

#endif  // HELPER_H
