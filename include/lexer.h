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
    TokenType type;
    offset lexeme;
    size_t line, column;
} Token;

typedef struct Lexer {
    offset source;
    size_t position;
    size_t length;
    size_t line;
    size_t column;
} Lexer;

// `Lexer* create_lexer(string source, size_t length)`
offset_ptr(Lexer*) create_lexer(string source, size_t length);
// `Token* get_next_token(Lexer* lexer)`
offset_ptr(Token*) get_next_token(offset_ptr(Lexer*) lexer);

#endif  // LEXER_H
