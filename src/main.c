#include "lexer.h"
#include "lib.h"

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

    string source = offset_to_str(alloc_memory(length + 1));
    fread(source, 1, length, file);
    source[length] = '\0';
    fclose(file);

    offset_ptr(TokenList*) tokens = lexer(source);

    char outfilename[256];
    sprintf(outfilename, "%s.token", filename);
    FILE* outfile = fopen(outfilename, "w");
    if (outfile == NULL) {
        fprintf(stderr, "Error opening file: %s\n", outfilename);
        return 1;
    }

    for (offset_ptr(TokenList*) current = tokens; current != 0; current = ((TokenList*)offset_to_ptr(current))->next) {
        Token* token = (Token*)offset_to_ptr(((TokenList*)offset_to_ptr(current))->token);
        if (token->type == EOF_TOKEN) {
            fprintf(outfile, "Token(Type: EOF,        Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
            break;
        } else if (token->type == IDENTIFIER)
            fprintf(outfile, "Token(Type: identifier, Line: ");
        else if (token->type == INTEGER)
            fprintf(outfile, "Token(Type: integer,    Line: ");
        else if (token->type == FLOAT)
            fprintf(outfile, "Token(Type: float,      Line: ");
        else if (token->type == STRING)
            fprintf(outfile, "Token(Type: string,     Line: ");
        else if (token->type == SYMBOL)
            fprintf(outfile, "Token(Type: symbol,     Line: ");
        else if (token->type == KEYWORD)
            fprintf(outfile, "Token(Type: keyword,    Line: ");
        else if (token->type == COMMENT)
            fprintf(outfile, "Token(Type: comment,    Line: ");
        fprintf(outfile, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
        string lexeme_ptr = offset_to_str(token->lexeme);
        for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
            char c = lexeme_ptr[i];
            if (c == '\0')
                fprintf(outfile, "\\0");
            else if (c == '\n')
                fprintf(outfile, "\\n");
            else if (c == '\t')
                fprintf(outfile, "\\t");
            else if (c == '\r')
                fprintf(outfile, "\\r");
            else
                fprintf(outfile, "%c", c);
        }
        fprintf(outfile, "' (%zu)\n", token->lexeme);
    }
    fprintf(outfile, "\ninfo by lib:\n    %s\n", offset_to_str(get_info()));
    fclose(outfile);

    return 0;
}
