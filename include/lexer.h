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
    TOKEN_COMMENT,
    TOKEN_EOF,
    TOKEN_SPECIAL,
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
    size_t pos;
    size_t size;
    string source_code;
    Token* current_token;
    Token* next_token;
    bool skip_comment;
} Lexer;

Token* get_next_token(Lexer* lexer);
Token* peek_next_token(Lexer* lexer);
Token* get_current_token(Lexer* lexer);
Lexer* create_lexer(File* source_path);
void output_tokens(Lexer* lexer, File* output_path);
void output_one_token(Token* token, FILE* file, bool is_lexer_mode);

#endif  // LEXER_H
