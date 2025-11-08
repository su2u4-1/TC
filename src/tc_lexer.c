#include "tc_lexer.h"

#include "tc_mem.h"

Token get_identifier_token(const char* source, int* index, int line_number) {
    int buf_length = 256;
    int buf_index = 0;
    char* buffer = (char*)tc_malloc(sizeof(char) * buf_length);
    char c = source[(*index) - 1];
    while ('a' <= c && c <= 'z' || 'A' <= c && c <= 'Z' || c == '_' || '0' <= c && c <= '9') {
        buffer[buf_index++] = c;
        if (buf_index >= buf_length) {
            buf_length *= 2;
            buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_length);
        }
        c = source[(*index)++];
    }
    --*index;
    buffer[buf_index] = '\0';
    for (int i = 0; i < tc_keywords_count; i++) {
        if (strcmp(buffer, tc_keywords[i]) == 0) {
            return (Token){TOKEN_KEYWORD, buffer, line_number};
        }
    }
    return (Token){TOKEN_IDENTIFIER, buffer, line_number};
}

Token get_number_token(const char* source, int* index, int line_number) {
    int buf_length = 256;
    int buf_index = 0;
    char* buffer = (char*)tc_malloc(sizeof(char) * buf_length);
    char c = source[(*index) - 1];
    while ('0' <= c && c <= '9') {
        buffer[buf_index++] = c;
        if (buf_index >= buf_length) {
            buf_length *= 2;
            buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_length);
        }
        c = source[(*index)++];
    }
    --*index;
    if (c == '.') {
        c = source[(*index)++];
        while ('0' <= c && c <= '9') {
            buffer[buf_index++] = c;
            if (buf_index >= buf_length) {
                buf_length *= 2;
                buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_length);
            }
            c = source[(*index)++];
        }
        --*index;
        buffer[buf_index++] = '\0';
        buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_index);
        return (Token){TOKEN_FLOAT, buffer, line_number};
    }
    buffer[buf_index++] = '\0';
    buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_index);
    return (Token){TOKEN_INTEGER, buffer, line_number};
}

Token get_string_token(const char* source, int* index, int line_number) {
    int buf_length = 256;
    int buf_index = 0;
    char* buffer = (char*)tc_malloc(sizeof(char) * buf_length);
    char c = source[(*index) - 1];
    while (c != '"') {
        buffer[buf_index++] = c;
        if (buf_index >= buf_length) {
            buf_length *= 2;
            buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_length);
        }
        c = source[(*index)++];
    }
    --*index;
    buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_index);
    return (Token){TOKEN_STRING, buffer, line_number};
}

Token get_comment_token(const char* source, int* index, int line_number, int multi_line) {
    int buf_length = 256;
    int buf_index = 0;
    char* buffer = (char*)tc_malloc(sizeof(char) * buf_length);
    char c = source[(*index) - 1];
    while (!multi_line && c != '\n') {
        buffer[buf_index++] = c;
        if (buf_index >= buf_length) {
            buf_length *= 2;
            buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_length);
        }
        c = source[(*index)++];
    }
    while (multi_line && (c != '/' || buffer[buf_index - 1] != '*')) {
        buffer[buf_index++] = c;
        if (buf_index >= buf_length) {
            buf_length *= 2;
            buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_length);
        }
        c = source[(*index)++];
    }
    --*index;
    buffer = (char*)tc_realloc(buffer, sizeof(char) * buf_index);
    return (Token){TOKEN_COMMENT, buffer, line_number};
}

int is_symbol_char(char c) {
    const char* symbols = "(){},!.[]\";_+-*/%=!<>&|";
    for (int i = 0; symbols[i] != '\0'; i++) {
        if (c == symbols[i]) {
            return 1;
        }
    }
    return 0;
}

int is_symbol(char c1, char c2) {
    if (!is_symbol_char(c2)) {
        return 0;
    }
    for (int i = 0; i < tc_symbols_count; i++) {
        if (tc_symbols[i][0] == c1 && tc_symbols[i][1] == c2) {
            return 1;
        }
    }
    return 0;
}

Token get_symbol_token(const char* source, int* index, int line_number) {
    char* buffer = (char*)tc_malloc(sizeof(char) * 3);
    buffer[0] = source[(*index) - 1];
    buffer[1] = source[*index];
    buffer[2] = '\0';
    if (is_symbol(buffer[0], buffer[1])) {
        ++*index;
        return (Token){TOKEN_SYMBOL, buffer, line_number};
    }
    buffer[1] = '\0';
    return (Token){TOKEN_SYMBOL, buffer, line_number};
}

Token get_next_token(const char* source, int* index, int* line_number) {
    while (1) {
        if (source[*index] == '\0') {
            return (Token){TOKEN_EOF, NULL, *line_number};
        } else {
            char c = source[(*index)++];
            if (c == '\n') {
                (*line_number)++;
            } else if ('a' <= c && c <= 'z' || 'A' <= c && c <= 'Z' || c == '_') {
                return get_identifier_token(source, index, *line_number);
            } else if ('0' <= c && c <= '9') {
                return get_number_token(source, index, *line_number);
            } else if (c == '"') {
                return get_string_token(source, index, *line_number);
            } else if (c == '/' && source[*index] == '/') {
                return get_comment_token(source, index, *line_number, 0);
            } else if (c == '/' && source[*index] == '*') {
                return get_comment_token(source, index, *line_number, 1);
            } else if (is_symbol_char(c)) {
                return get_symbol_token(source, index, *line_number);
            } else if (isspace(c)) {
                // Skip whitespace
            }
        }
    }
}

Token* lexer(const char* source) {
    int source_index = 0;
    int list_index = 0;
    int list_length = 16;
    int line_number = 1;
    Token* tokens = (Token*)tc_malloc(sizeof(Token) * list_length);
    while (1) {
        Token token = get_next_token(source, &source_index, &line_number);
        if (list_index >= list_length) {
            list_length *= 2;
            tokens = (Token*)tc_realloc(tokens, sizeof(Token) * list_length);
        }
        tokens[list_index++] = token;
        if (token.type == TOKEN_EOF) {
            break;
        }
    }
    return tokens;
}
