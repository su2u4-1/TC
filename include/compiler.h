#ifndef COMPILER_H
#define COMPILER_H

#include "lib.h"

typedef struct Lexer Lexer;
typedef struct Parser Parser;
string read_source(FILE* file, size_t* length);
void output_token(FILE* file, Lexer* lexer);
void output_ast(FILE* file, Lexer* lexer, Parser* parser);
void parse_file(const string name, bool o_token, bool o_ast);

#endif  // COMPILER_H
