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

typedef struct TokenLinkList {
    Token* token;
    struct TokenLinkList* next;
} TokenList;

TokenList* lexer(string source);

#endif  // LEXER_H
