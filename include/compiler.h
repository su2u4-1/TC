#ifndef COMPILER_H
#define COMPILER_H

#include "lib.h"

typedef struct Token Token;
typedef struct Lexer Lexer;
typedef struct TAC TAC;
typedef struct Code Code;
string read_source(FILE* file, size_t* length);
void output_one_token(FILE* file, Token* token);
void output_token(FILE* file, Lexer* lexer);
void output_ast(FILE* file, Code* ast);
void output_tac(FILE* file, TAC* tac);
void parse_file(const string name, bool o_token, bool o_ast, bool o_tac);

#endif  // COMPILER_H
