#ifndef LEXER_H
#define LEXER_H

#include "file.h"

typedef enum {
    TOKEN_IDENTIFIER,
    TOKEN_INTEGER,
    TOKEN_FLOAT,
    TOKEN_STRING,
    TOKEN_SYMBOL,
    TOKEN_KEYWORD,
    TOKEN_EOF,
} TokenType;

typedef struct Token {
    TokenType type;
    string lexeme;
    size_t line;
    size_t column;
} Token;

typedef struct Lexer {
    File* source_path;
    size_t line;
    size_t column;
    size_t position;
    string source_code;
    Token* next_token;
    Token* current_token;
    Token* prev_token;
} Lexer;

Token* get_next_token(Lexer* lexer);
Lexer* create_lexer(File* source_path);
void output_tokens(Lexer* lexer, File* output_path);

#endif  // LEXER_H
