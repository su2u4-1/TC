#include "lexer.h"

static bool is_keyword(string str) {
    for (size_t i = 0; i < keywordCount; ++i) {
        if (str == keywordList[i]) {
            return true;
        }
    }
    return false;
}

#define is_digit(c) ((c) >= '0' && (c) <= '9')
#define is_alphabet(c) ((c) >= 'a' && (c) <= 'z') || ((c) >= 'A' && (c) <= 'Z')
#define lexer_error(message, line, column, filename) fprintf(stderr, "[lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message)

static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
    Token* token = create_struct(Token);
    token->type = type;
    if (type == TOKEN_IDENTIFIER && is_keyword(lexeme)) {
        token->type = TOKEN_KEYWORD;
    }
    if (type == TOKEN_SPECIAL && !is_special(lexeme)) {
        return NULL;
    }
    token->lexeme = lexeme;
    token->line = line;
    token->column = column;
    return token;
}

static Token* get_token(Lexer* lexer) {
    while (true) {
        char c = lexer->source_code[lexer->pos++];
        lexer->column++;
        if (c == '\0') {
            return create_token(TOKEN_EOF, NULL, lexer->line, lexer->column);
        } else if (c == ' ' || c == '\t' || c == '\r') {
            continue;
        } else if (c == '\n') {
            lexer->line++;
            lexer->column = 0;
            continue;
        } else if (is_alphabet(c) || c == '_' || c == '$') {
            bool is_special = (c == '$');
            size_t start = lexer->pos - 1;
            size_t column_start = lexer->column - 1;
            while (is_alphabet(c) || is_digit(c) || c == '_') {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            }
            lexer->pos -= 1;
            lexer->column -= 1;
            string content = create_string(&lexer->source_code[start], lexer->pos - start);
            if (is_special) {
                Token* token = create_token(TOKEN_SPECIAL, content, lexer->line, column_start);
                if (token == NULL) {
                    lexer_error("Invalid special method", lexer->line, column_start, file_full_path(lexer->source_path));
                    return create_token(TOKEN_IDENTIFIER, content, lexer->line, column_start);
                }
                return token;
            }
            return create_token(TOKEN_IDENTIFIER, content, lexer->line, column_start);
        } else if (is_digit(c)) {
            size_t start = lexer->pos - 1;
            size_t column_start = lexer->column - 1;
            while (is_digit(c)) {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            }
            TokenType type = TOKEN_INTEGER;
            char p = lexer->source_code[lexer->pos];
            if (c == '.' && (is_digit(p))) {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
                while (is_digit(c)) {
                    c = lexer->source_code[lexer->pos++];
                    lexer->column++;
                }
                type = TOKEN_FLOAT;
            }
            lexer->pos -= 1;
            lexer->column -= 1;
            return create_token(type, create_string(&lexer->source_code[start], lexer->pos - start), lexer->line, column_start);
        } else if (c == '"') {
            size_t start = lexer->pos;
            size_t column_start = lexer->column - 1;
            c = lexer->source_code[lexer->pos++];
            lexer->column++;
            while (c != '"' && c != '\0' && c != '\n') {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            }
            if (c != '"') {
                lexer_error("Unterminated string literal", lexer->line, start - 1, file_full_path(lexer->source_path));
                if (c == '\n') {
                    lexer->line++;
                    lexer->column = 0;
                }
            }
            if (lexer->pos - start == 1) {
                return create_token(TOKEN_STRING, create_string("\0", 1), lexer->line, column_start);
            }
            return create_token(TOKEN_STRING, create_string(&lexer->source_code[start], lexer->pos - start - 1), lexer->line, column_start);
        } else {
            char p = lexer->source_code[lexer->pos];
            if (c == '/' && p == '/') {
                size_t start = lexer->pos + 1;
                size_t column_start = lexer->column - 1;
                while (c != '\n' && c != '\0') {
                    c = lexer->source_code[lexer->pos++];
                    lexer->column++;
                }
                lexer->pos -= 1;
                lexer->column -= 1;
                return create_token(TOKEN_COMMENT, create_string(&lexer->source_code[start], lexer->pos - start), lexer->line, column_start);
            } else if (c == '/' && p == '*') {
                size_t start = lexer->pos + 1;
                size_t column_start = lexer->column - 1;
                size_t line_start = lexer->line;
                while (!(c == '*' && p == '/')) {
                    c = lexer->source_code[lexer->pos++];
                    lexer->column++;
                    p = lexer->source_code[lexer->pos];
                    if (c == '\n') {
                        lexer->line++;
                        lexer->column = 0;
                    }
                    if (p == '\0') {
                        break;
                    }
                    assert(c != '\0');
                }
                if (p == '\0') {
                    if (c == '\0') {
                        lexer->pos -= 1;
                        lexer->column -= 1;
                    }
                    lexer_error("Unterminated comment", lexer->line, start, file_full_path(lexer->source_path));
                    return create_token(TOKEN_COMMENT, create_string(&lexer->source_code[start], lexer->pos - start), line_start, column_start);
                }
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
                return create_token(TOKEN_COMMENT, create_string(&lexer->source_code[start], lexer->pos - start - 2), line_start, column_start);
            } else if (c == '=' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_EQ, lexer->line, lexer->column - 2);
            } else if (c == '!' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_NE, lexer->line, lexer->column - 2);
            } else if (c == '<' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_LE, lexer->line, lexer->column - 2);
            } else if (c == '>' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_GE, lexer->line, lexer->column - 2);
            } else if (c == '+' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_ADD_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '-' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_SUB_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '*' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_MUL_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '/' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_DIV_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '%' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_MOD_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '&' && p == '&') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_AND, lexer->line, lexer->column - 2);
            } else if (c == '|' && p == '|') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_OR, lexer->line, lexer->column - 2);
            } else if (c == '(') {
                return create_token(TOKEN_SYMBOL, SYMBOL_L_PAREN, lexer->line, lexer->column - 1);
            } else if (c == ')') {
                return create_token(TOKEN_SYMBOL, SYMBOL_R_PAREN, lexer->line, lexer->column - 1);
            } else if (c == '{') {
                return create_token(TOKEN_SYMBOL, SYMBOL_L_BRACE, lexer->line, lexer->column - 1);
            } else if (c == '}') {
                return create_token(TOKEN_SYMBOL, SYMBOL_R_BRACE, lexer->line, lexer->column - 1);
            } else if (c == ',') {
                return create_token(TOKEN_SYMBOL, SYMBOL_COMMA, lexer->line, lexer->column - 1);
            } else if (c == '!') {
                return create_token(TOKEN_SYMBOL, SYMBOL_NOT, lexer->line, lexer->column - 1);
            } else if (c == '.') {
                return create_token(TOKEN_SYMBOL, SYMBOL_DOT, lexer->line, lexer->column - 1);
            } else if (c == '[') {
                return create_token(TOKEN_SYMBOL, SYMBOL_L_BRACKET, lexer->line, lexer->column - 1);
            } else if (c == ']') {
                return create_token(TOKEN_SYMBOL, SYMBOL_R_BRACKET, lexer->line, lexer->column - 1);
            } else if (c == ';') {
                return create_token(TOKEN_SYMBOL, SYMBOL_SEMICOLON, lexer->line, lexer->column - 1);
            } else if (c == '_') {
                return create_token(TOKEN_SYMBOL, SYMBOL_UNDERLINE, lexer->line, lexer->column - 1);
            } else if (c == '+') {
                return create_token(TOKEN_SYMBOL, SYMBOL_ADD, lexer->line, lexer->column - 1);
            } else if (c == '-') {
                return create_token(TOKEN_SYMBOL, SYMBOL_SUB, lexer->line, lexer->column - 1);
            } else if (c == '*') {
                return create_token(TOKEN_SYMBOL, SYMBOL_MUL, lexer->line, lexer->column - 1);
            } else if (c == '/') {
                return create_token(TOKEN_SYMBOL, SYMBOL_DIV, lexer->line, lexer->column - 1);
            } else if (c == '%') {
                return create_token(TOKEN_SYMBOL, SYMBOL_MOD, lexer->line, lexer->column - 1);
            } else if (c == '<') {
                return create_token(TOKEN_SYMBOL, SYMBOL_LT, lexer->line, lexer->column - 1);
            } else if (c == '>') {
                return create_token(TOKEN_SYMBOL, SYMBOL_GT, lexer->line, lexer->column - 1);
            } else if (c == '=') {
                return create_token(TOKEN_SYMBOL, SYMBOL_ASSIGN, lexer->line, lexer->column - 1);
            } else {
                lexer_error("Unexpected character", lexer->line, lexer->column - 1, file_full_path(lexer->source_path));
                return create_token(TOKEN_EOF, NULL, 0, 0);
            }
        }
    }
}

Token* get_next_token(Lexer* lexer) {
    if (lexer->next_token != NULL) {
        lexer->current_token = lexer->next_token;
    } else {
        do {
            lexer->current_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->current_token->type == TOKEN_COMMENT);
    }
    lexer->next_token = NULL;
    return lexer->current_token;
}
Token* peek_next_token(Lexer* lexer) {
    if (lexer->next_token == NULL) {
        do {
            lexer->next_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->next_token->type == TOKEN_COMMENT);
    }
    return lexer->next_token;
}
Token* get_current_token(Lexer* lexer) {
    if (lexer->current_token == NULL) {
        do {
            lexer->current_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->current_token->type == TOKEN_COMMENT);
    }
    return lexer->current_token;
}

Lexer* create_lexer(File* source_path) {
    Lexer* lexer = create_struct(Lexer);
    lexer->source_path = source_path;
    lexer->source_code = read_source_code(source_path, &lexer->size);
    lexer->line = 0;
    lexer->column = 0;
    lexer->pos = 0;
    lexer->current_token = NULL;
    lexer->next_token = NULL;
    return lexer;
}

void output_tokens(Lexer* lexer, File* output_path) {
    FILE* file = fopen(change_extension(output_path, ".lex"), "w");
    for (Token* token = get_next_token(lexer); token != NULL; token = get_next_token(lexer)) {
        output_one_token(token, file, true);
        if (token->type == TOKEN_EOF) break;
    }
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
    fclose(file);
}

void output_one_token(Token* token, FILE* file, bool is_lexer_mode) {
    if (is_lexer_mode) {
        switch (token->type) {
            case TOKEN_EOF: fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1); return;
            case TOKEN_IDENTIFIER: fputs("Token(Type: identifier,  ", file); break;
            case TOKEN_INTEGER: fputs("Token(Type: integer,     ", file); break;
            case TOKEN_FLOAT: fputs("Token(Type: float,       ", file); break;
            case TOKEN_STRING: fputs("Token(Type: string,      ", file); break;
            case TOKEN_SYMBOL: fputs("Token(Type: symbol,      ", file); break;
            case TOKEN_KEYWORD: fputs("Token(Type: keyword,     ", file); break;
            case TOKEN_COMMENT: fputs("Token(Type: comment,     ", file); break;
            case TOKEN_SPECIAL: fputs("Token(Type: special,     ", file); break;
            default: fprintf(file, "Token(Type: unknown,     Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1); return;
        }
        fprintf(file, "Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    } else {
        switch (token->type) {
            case TOKEN_EOF: fprintf(file, "(EOF, %zu, %zu, '')\n", token->line + 1, token->column + 1); return;
            case TOKEN_IDENTIFIER: fputs("(identifier, ", file); break;
            case TOKEN_INTEGER: fputs("(integer, ", file); break;
            case TOKEN_FLOAT: fputs("(float, ", file); break;
            case TOKEN_STRING: fputs("(string, ", file); break;
            case TOKEN_SYMBOL: fputs("(symbol, ", file); break;
            case TOKEN_KEYWORD: fputs("(keyword, ", file); break;
            case TOKEN_COMMENT: fputs("(comment, ", file); break;
            case TOKEN_SPECIAL: fputs("(special, ", file); break;
            default: fprintf(file, "(unknown, %zu, %zu, '')\n", token->line + 1, token->column + 1); return;
        }
        fprintf(file, "%zu, %zu, '", token->line + 1, token->column + 1);
    }
    if (token->lexeme == NULL) {
        fprintf(file, "(null)'\n");
    } else {
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
    }
    if (is_lexer_mode) {
        fputs("'\n", file);
    } else {
        fputs("')\n", file);
    }
}
