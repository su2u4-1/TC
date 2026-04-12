#ifndef PARSER_H
#define PARSER_H

#include "object.h"

// public functions
Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]);

#endif  // PARSER_H
