#include "lexer.h"

#include "lib.h"

static void push_TokenList(offset_ptr(TokenList*) list, offset_ptr(Token*) token) {
    static offset_ptr(TokenList*) end = 0;
    TokenList* list_ptr = (TokenList*)offset_to_ptr(list);
    if (list_ptr->next == 0 && list_ptr->token == 0) {
        list_ptr->token = token;
        end = list;
        return;
    }
    offset_ptr(TokenList*) newNode = alloc_memory(sizeof(TokenList));
    ((TokenList*)offset_to_ptr(newNode))->token = token;
    TokenList* current = list_ptr;
    if (end != 0)
        current = (TokenList*)offset_to_ptr(end);
    while (current->next != 0)
        current = (TokenList*)offset_to_ptr(current->next);
    current->next = newNode;
    end = newNode;
}

static offset_ptr(Token*) create_token(TokenType type, offset lexeme, size_t line, size_t column) {
    offset_ptr(Token*) token = alloc_memory(sizeof(Token));
    Token* token_ptr = (Token*)offset_to_ptr(token);
    token_ptr->type = type;
    token_ptr->lexeme = lexeme;
    token_ptr->line = line;
    token_ptr->column = column;
    return token;
}

static void lexer_error(const char* message, size_t line, size_t column) {
    fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
}

offset_ptr(TokenList*) lexer(string source) {
    offset_ptr(TokenList*) tokens = alloc_memory(sizeof(TokenList));
    char c = ' ', p = ' ';
    size_t line = 0, i = 0, column = 0;
    for (i = 0; p != '\0' && c != '\0'; ++i, ++column) {
        p = source[i + 1];
        c = source[i];
        if (c == ' ' || c == '\t' || c == '\r') {
            continue;
        } else if (c == '\n') {
            ++line;
            column = 0;
        } else if ('0' <= c && c <= '9') {
            size_t start = i;
            while ('0' <= c && c <= '9') {
                c = source[++i];
                ++column;
            }
            TokenType type = INTEGER;
            if (c == '.') {
                c = source[++i];
                ++column;
                while ('0' <= c && c <= '9') {
                    c = source[++i];
                    ++column;
                }
                type = FLOAT;
            }
            push_TokenList(tokens, create_token(type, create_string(&source[start], i - start), line, start));
            --i;
            --column;
        } else if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_') {
            size_t start = i;
            while ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9') || c == '_') {
                c = source[++i];
                ++column;
            }
            offset content = create_string(&source[start], i - start);
            if (is_keyword(content))
                push_TokenList(tokens, create_token(KEYWORD, content, line, start));
            else
                push_TokenList(tokens, create_token(IDENTIFIER, content, line, start));
            --i;
            --column;
        } else if (c == '=' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("==", 2), line, column));
            ++i;
            ++column;
        } else if (c == '!' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("!=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '<' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("<=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '>' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string(">=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '+' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("+=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '-' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("-=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '*' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("*=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '/' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("/=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '%' && p == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("%=", 2), line, column));
            ++i;
            ++column;
        } else if (c == '&' && p == '&') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("&&", 2), line, column));
            ++i;
            ++column;
        } else if (c == '|' && p == '|') {
            push_TokenList(tokens, create_token(SYMBOL, create_string("||", 2), line, column));
            ++i;
            ++column;
        } else if (c == '/' && p == '/') {
            size_t start = i;
            while (c != '\n' && c != '\0') {
                c = source[++i];
                ++column;
            }
            push_TokenList(tokens, create_token(COMMENT, create_string(&source[start], i - start), line, column));
            --i;
            --column;
        } else if (c == '/' && p == '*') {
            size_t start = i;
            while (!(c == '*' && p == '/')) {
                c = source[++i];
                ++column;
                p = source[i + 1];
                if (c == '\n') {
                    ++line;
                    column = 0;
                }
                if (c == '\0') break;
            }
            if (c == '\0') {
                --i;
                push_TokenList(tokens, create_token(COMMENT, create_string(&source[start], i - start), line, start));
                lexer_error("Unterminated comment", line, start);
                break;
            }
            i += 2;
            push_TokenList(tokens, create_token(COMMENT, create_string(&source[start], i - start), line, start));
            --i;
            --column;
        } else if (c == '(' || c == ')' || c == '{' || c == '}' || c == ',' || c == '!' || c == '.' || c == '[' || c == ']' || c == '\'' || c == ';' || c == '_' || c == '+' || c == '-' || c == '*' || c == '/' || c == '%' || c == '<' || c == '>' || c == '=') {
            push_TokenList(tokens, create_token(SYMBOL, create_string(&source[i], 1), line, column));
        } else if (c == '"') {
            size_t start = i;
            c = source[++i];
            ++column;
            while (c != '"' && c != '\0' && c != '\n') {
                c = source[++i];
                ++column;
            }
            if (c == '"') {
                ++i;
                ++column;
                push_TokenList(tokens, create_token(STRING, create_string(&source[start + 1], i - start - 2), line, start));
            } else {
                lexer_error("Unterminated string literal", line, start);
                push_TokenList(tokens, create_token(STRING, create_string(&source[start + 1], i - start - 1), line, start));
            }
        } else {
            lexer_error("Unexpected character", line, column);
        }
    }
    push_TokenList(tokens, create_token(EOF_TOKEN, 0, line, column));
    return tokens;
}
