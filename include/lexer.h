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
    offset_ptr(Token*) token;
    offset_ptr(TokenLinkList*) next;
} TokenList;

offset_ptr(TokenList*) lexer(string source);

#endif  // LEXER_H
