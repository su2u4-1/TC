#ifndef HELPER_H
#define HELPER_H

#include "lexer.h"
#include "lib.h"
#include "parser.h"

#define OUT(x, is_last, ...) indention(outfile, indent + x, is_last, parser), fprintf(outfile, __VA_ARGS__)

typedef struct Parser {
    bool in_function;
    bool in_method;
    bool in_loop;
    char indent_has_next[32];
} Parser;

// list helper functions
// `list<void*> create_list()`
list() create_list(void);
// `Node* create_node(void* content)`
offset(Node*) create_node(offset() content);
// `void list_append(list<void*>* list, void* item)`
void list_append(list() list, offset() item);
// `list<void*> list_copy(list<void*>* original)`
list() list_copy(list() original);
// `void* list_pop(list<void*>* list)`
offset() list_pop(list() lst);

// parser helper functions
// `Name* create_name(string name, NameType kind, (Name* | Scope*) info, Scope* scope)`
offset(Name*) create_name(string name, NameType kind, offset(Name* | Scope*) info, offset(Scope*) scope);
// `Scope* create_scope(offset(Scope*) parent)`
offset(Scope*) create_scope(offset(Scope*) parent);
// `Name* search(Scope* scope, string name)`
offset(Name*) search(offset(Scope*) scope, string name);
// `bool is_builtin_type(string type)`
bool is_builtin_type(string type);
// `bool is_type(Name* type, Scope* scope)`
bool is_type(offset(Name*) type);
// `size_t parser_error(const char* message, offset(Token*) token)`
size_t parser_error(const char* message, offset(Token*) token);
// `void out_indent(FILE* out, size_t indent)`
void indention(FILE* out, size_t indent, bool is_last, offset(Parser*) parser);
// `Parser* create_parser()`
offset(Parser*) create_parser(void);
// `Name* parse_import_std(Name* import_name, Scope* scope)`
offset(Name*) parse_import_std(offset(Name*) import_name, offset(Scope*) scope);

// operator helper functions
// `OperatorType string_to_operator(string str)`
OperatorType string_to_operator(string str);
// `int operator_precedence(string op)`
int operator_precedence(OperatorType op);
// `string operator_to_string(OperatorType op)`
string operator_to_string(OperatorType op);

#endif  // HELPER_H
