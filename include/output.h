#ifndef OUTPUT_H
#define OUTPUT_H

#include "ast.h"

#define OUT(indent, format, ...) fprintf(out, "%*s" format, ((int)indent) * 4, "", ##__VA_ARGS__)
#define foreach(type, item, list) for (type item = (type)list_pop_front(list); item != NULL; item = (type)list_pop_front(list))

void print_ast(AST* ast, FILE* out);
void remove_trailing_comma(FILE* out);

#endif  // OUTPUT_H
