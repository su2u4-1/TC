#ifndef TC_PARSER_H
#define TC_PARSER_H

#include "tc_lexer.h"
#include "tc_lib.h"

typedef struct Node {
    char* value;
    struct Node** children;
    size_t child_count;
} Node;

Node* tc_parser(const char* filename, Token* tokens, size_t token_count);

#endif  // TC_PARSER_H
