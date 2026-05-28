#ifndef OUTPUT_H
#define OUTPUT_H

#include "ast.h"

#define OUT(indent, format, ...) fprintf(out, "%*s" format, ((int)indent) * 4, "", ##__VA_ARGS__)

void print_ast(AST* ast, FILE* out);
void remove_trailing_comma(FILE* out);
void print_symbol_table(SymbolTable* table, FILE* out);

#endif  // OUTPUT_H
