#ifndef HELPER_H
#define HELPER_H

#include "lexer.h"
#include "lib.h"
#include "parser.h"

#define OUT(x, is_last, ...) indention(outfile, indent + x, is_last), fprintf(outfile, __VA_ARGS__)

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
void indention(FILE* out, size_t indent, bool is_last);

// token helper functions
// `Token* get_next_token(Lexer* lexer)`
offset(Token*) next_token(offset(Lexer*) lexer);
// `Token* peek_current_token(void)`
offset(Token*) peek_current_token(void);
// `Token* peek_next_token(Lexer* lexer)`
offset(Token*) peek_token(offset(Lexer*) lexer);

// operator helper functions
// `OperatorType string_to_operator(string str)`
OperatorType string_to_operator(string str);
// `int operator_precedence(string op)`
int operator_precedence(OperatorType op);
// `string operator_to_string(OperatorType op)`
string operator_to_string(OperatorType op);

// global variables
extern offset(Token*) token;
extern Token* token_ptr;
extern offset(Token*) current_token;
extern bool in_function;
extern bool in_method;
extern bool in_loop;
extern bool indent_has_next[256];

#endif  // HELPER_H
