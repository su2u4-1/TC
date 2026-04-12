#ifndef LEXER_H
#define LEXER_H

#include "object.h"

Lexer* create_lexer(string source, size_t length, string filename);
Token* get_next_token(Lexer* lexer, bool skip_comment);
Token* peek_next_token(Lexer* lexer, bool skip_comment);
void reset_lexer(Lexer* lexer);
Token* peek_current_token(Lexer* lexer);

#endif  // LEXER_H
