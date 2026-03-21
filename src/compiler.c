#include "compiler.h"

#include "file.h"
#include "helper.h"
#include "lexer.h"

string read_source(FILE* file, size_t* length) {
    fseek(file, 0, SEEK_END);
    *length = (size_t)ftell(file);
    fseek(file, 0, SEEK_SET);

    string source = create_string("", *length + 1);
    size_t bytes_read = fread(source, 1, *length, file);
    source[bytes_read] = '\0';
    *length = bytes_read;

    for (size_t i = 0; i < *length; ++i) {
        if (source[i] == '\r' || source[i] == '\t')
            source[i] = ' ';
    }
    return source;
}
void output_one_token(FILE* file, Token* token) {
    if (token->type == EOF_TOKEN) {
        fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
        return;
    } else if (token->type == IDENTIFIER)
        fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == INTEGER)
        fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == FLOAT)
        fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == STRING)
        fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == SYMBOL)
        fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == KEYWORD)
        fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == COMMENT)
        fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    for (size_t i = 0; i < strlen(token->lexeme); ++i) {
        char c = token->lexeme[i];
        if (c == '\0')
            fputs("\\0", file);
        else if (c == '\n')
            fputs("\\n", file);
        else if (c == '\t')
            fputs("\\t", file);
        else if (c == '\r')
            fputs("\\r", file);
        else
            fputc(c, file);
    }
    fprintf(file, "'\n");
}
void output_token(FILE* file, Lexer* lexer) {
    for (Token* current = get_next_token(lexer, false); current != 0; current = get_next_token(lexer, false)) {
        output_one_token(file, current);
        if (current->type == EOF_TOKEN)
            break;
    }
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
    Code* ast_root = parse_code(lexer, builtin_scope, parser);
    output_code(ast_root, file, 0, parser);
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
void parse_file(const string name, bool o_token, bool o_ast) {
    File* file = create_file(name);
    string filename = get_full_path(file);
    size_t length = 0;
    FILE* source_file = fopen(filename, "r");
    if (source_file == NULL) {
        fprintf(stderr, "Error opening file: %s", filename);
        return;
    }
    string source = read_source(source_file, &length);
    fclose(source_file);
    Lexer* lexer = create_lexer(source, length);
    if (o_token) {
        change_file_extension(file, create_string(".token", 6));
        string out_token_name = get_full_path(file);
        FILE* out_token_file = fopen(out_token_name, "w");
        if (out_token_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_token_name);
        else {
            output_token(out_token_file, lexer);
            fclose(out_token_file);
        }
    }
    reset_lexer(lexer);
    Parser* parser = create_parser();
    if (o_ast) {
        change_file_extension(file, create_string(".ast", 4));
        string out_ast_name = get_full_path(file);
        FILE* out_ast_file = fopen(out_ast_name, "w");
        if (out_ast_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_ast_name);
        else {
            output_ast(out_ast_file, lexer, parser);
            fclose(out_ast_file);
        }
    }
}
