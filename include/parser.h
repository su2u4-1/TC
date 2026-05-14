#ifndef PARSER_H
#define PARSER_H

#include "ast.h"
#include "lexer.h"

typedef struct Parser {
    Lexer* lexer;
    list(AST*) import_files;
    File* file;
    Method* current_method;
    Function* current_function;
    Class* current_class;
} Parser;

Parser* create_parser(Lexer* lexer);
AST* parse_code(Parser* parser);

#endif  // PARSER_H
