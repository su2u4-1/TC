#include "lexer.h"

#include "lib.h"

static void push_TokenList(TokenList* list, Token* token) {
#ifdef DEBUG
    printf("push token: Type %d, Lexeme '%s'\n", token->type, offset_to_ptr(token->lexeme));
#endif
    static TokenList* end = NULL;
    if (list->next == NULL && list->token == NULL) {
        list->token = token;
        end = list;
        return;
    }
    TokenList* newNode = (TokenList*)alloc_memory(sizeof(TokenList));
    newNode->token = token;
    if (end != NULL && end->next == NULL) {
        end->next = newNode;
    } else {
        TokenList* current = list;
        while (current->next != NULL)
            current = current->next;
        current->next = newNode;
    }
    end = newNode;
}

static Token* create_token(TokenType type, offset lexeme, size_t line, size_t column) {
    Token* token = (Token*)alloc_memory(sizeof(Token));
    token->type = type;
    token->lexeme = lexeme;
    token->line = line;
    token->column = column;
    return token;
}

static void lexer_error(const char* message, size_t line, size_t column) {
    fprintf(stderr, "Lexer Error at Line %zu, Column %zu: %s\n", line + 1, column + 1, message);
}

TokenList* lexer(string source) {
#ifdef DEBUG
    printf("Starting lexer...\n");
#endif
    TokenList* tokens = (TokenList*)alloc_memory(sizeof(TokenList));
    char c = ' ', p = ' ';
    size_t line = 0, i = 0, column = 0;
    for (i = 0; p != '\0'; ++i, ++column) {
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
#ifdef DEBUG
    printf("Lexer finished.\n");
#endif
    return tokens;
}
