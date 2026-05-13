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
    bool parse_import;  // if an import file is being parsed, skip the statement parsing and ensure that the import is only done once
} Parser;

Parser* create_parser(Lexer* lexer);
AST* parse_code(Parser* parser);

#endif  // PARSER_H
