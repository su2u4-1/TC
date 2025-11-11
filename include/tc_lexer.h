#ifndef TC_LEXER_H
#define TC_LEXER_H

#include "tc_lib.h"

typedef enum TokenType {
    TOKEN_EOF,
    TOKEN_IDENTIFIER,
    TOKEN_KEYWORD,
    TOKEN_SYMBOL,
    TOKEN_INTEGER,
    TOKEN_FLOAT,
    TOKEN_STRING,
    TOKEN_COMMENT
} TokenType;

typedef struct Token {
    TokenType type;

    char* content;
    int line;
} Token;

Token* lexer(const char* source);
void output_lexer_result(Token* tokens, const char* output_file);

#endif  // TC_LEXER_H
