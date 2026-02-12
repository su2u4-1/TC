#ifndef LEXER_H
#define LEXER_H

#include "lib.h"

typedef enum TokenType {
    EOF_TOKEN,
    IDENTIFIER,
    INTEGER,
    FLOAT,
    STRING,
    SYMBOL,
    KEYWORD,
    COMMENT
} TokenType;

typedef struct Token {
    string lexeme;
    size_t line, column;
    TokenType type;
} Token;

typedef struct Lexer {
    string source;
    size_t position;
    size_t length;
    size_t line;
    size_t column;
    Token* peeked_token;
    size_t peeked_position;
    size_t peeked_line;
    size_t peeked_column;
    Token* current_token;
} Lexer;

Lexer* create_lexer(string source, size_t length);
Token* get_next_token(Lexer* lexer, bool skip_comment);
Token* peek_next_token(Lexer* lexer, bool skip_comment);
void reset_lexer(Lexer* lexer);
Token* peek_current_token(Lexer* lexer);

#endif  // LEXER_H
