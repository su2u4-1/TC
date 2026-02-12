#ifndef COMPILER_H
#define COMPILER_H

#include "lib.h"

#define MAX_FILENAME_SIZE 1024

typedef struct Lexer Lexer;
typedef struct Parser Parser;
void string_append(char* dest, const size_t dest_length, const char* src, const char* new);
char* read_source(FILE* file, size_t* length);
void output_token(FILE* file, offset(Lexer*) lexer);
void output_ast(FILE* file, offset(Lexer*) lexer, offset(Parser*) parser);
void parse_file(const char* filename, bool o_token, bool o_ast);

#endif  // COMPILER_H
