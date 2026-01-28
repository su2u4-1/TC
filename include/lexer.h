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
    string lexeme;
    size_t line, column;
} Token;

typedef struct Lexer {
    string source;
    size_t position;
    size_t length;
    size_t line;
    size_t column;
    offset(Token*) peeked_token;
    size_t peeked_position;
    size_t peeked_line;
    size_t peeked_column;
    offset(Token*) current_token;
} Lexer;

// `Lexer* create_lexer(string source, size_t length)`
offset(Lexer*) create_lexer(char* source, size_t length);
// `Token* get_next_token(Lexer* lexer)`
offset(Token*) get_next_token(offset(Lexer*) lexer, bool skip_comment);
// `Token* peek_next_token(Lexer* lexer)`
offset(Token*) peek_next_token(offset(Lexer*) lexer, bool skip_comment);
// `void reset_lexer(Lexer* lexer)`
void reset_lexer(offset(Lexer*) lexer);
// `Token* peek_current_token(Lexer* lexer)`
offset(Token*) peek_current_token(offset(Lexer*) lexer);

#endif  // LEXER_H
