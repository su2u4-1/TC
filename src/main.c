#include "lexer.h"
#include "lib.h"
#include "parser.h"

int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    const char* filename = argv[1];

    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        fprintf(stderr, "Error opening file: %s\n", filename);
        return 1;
    }

    fseek(file, 0, SEEK_END);
    size_t length = (size_t)ftell(file);
    fseek(file, 0, SEEK_SET);

    char* source = string_to_char_ptr(alloc_memory(length + 1));
    fread(source, 1, length, file);
    source[length] = '\0';
    fclose(file);

    // test lexer
    offset(Lexer*) lexer = create_lexer(source, length);
    char out_token_name[256];
    sprintf(out_token_name, "%s.token", filename);
    FILE* out_token = fopen(out_token_name, "w");
    if (out_token == NULL) {
        fprintf(stderr, "Error opening file: %s\n", out_token_name);
        return 1;
    }

    for (offset(Token*) current = get_next_token(lexer); current != 0; current = get_next_token(lexer)) {
        Token* token = (Token*)offset_to_ptr(current);
        if (token->type == EOF_TOKEN) {
            fprintf(out_token, "Token(Type: EOF,        Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
            break;
        } else if (token->type == IDENTIFIER)
            fprintf(out_token, "Token(Type: identifier, Line: ");
        else if (token->type == INTEGER)
            fprintf(out_token, "Token(Type: integer,    Line: ");
        else if (token->type == FLOAT)
            fprintf(out_token, "Token(Type: float,      Line: ");
        else if (token->type == STRING)
            fprintf(out_token, "Token(Type: string,     Line: ");
        else if (token->type == SYMBOL)
            fprintf(out_token, "Token(Type: symbol,     Line: ");
        else if (token->type == KEYWORD)
            fprintf(out_token, "Token(Type: keyword,    Line: ");
        else if (token->type == COMMENT)
            fprintf(out_token, "Token(Type: comment,    Line: ");
        fprintf(out_token, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
        char* lexeme_ptr = string_to_char_ptr(token->lexeme);
        for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
            char c = lexeme_ptr[i];
            if (c == '\0')
                fprintf(out_token, "\\0");
            else if (c == '\n')
                fprintf(out_token, "\\n");
            else if (c == '\t')
                fprintf(out_token, "\\t");
            else if (c == '\r')
                fprintf(out_token, "\\r");
            else
                fprintf(out_token, "%c", c);
        }
        fprintf(out_token, "' (%zu)\n", token->lexeme);
    }
    fprintf(out_token, "\ninfo by lib:\n    %s\n", string_to_char_ptr(get_info()));
    fclose(out_token);

    // test parser
    char out_ast_name[256];
    sprintf(out_ast_name, "%s.ast", filename);
    FILE* out_ast = fopen(out_ast_name, "w");
    if (out_ast == NULL) {
        fprintf(stderr, "Error opening file: %s\n", out_ast_name);
        return 1;
    }
    lexer = create_lexer(source, length);
    offset(Code*) ast_root = parser(lexer);
    output_ast(ast_root, out_ast, 0);
    fprintf(out_ast, "\ninfo by lib:\n    %s\n", string_to_char_ptr(get_info()));
    fclose(out_ast);

    return 0;
}
