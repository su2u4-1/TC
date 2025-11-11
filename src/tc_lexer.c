#include "tc_lexer.h"

#include "tc_err.h"
#include "tc_mem.h"

static Token get_identifier_token(const char* source, int* index, int line_number) {
    Array* char_buffer = arr_init(sizeof(char), 16);
    char c = source[(*index) - 1];
    while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_' || ('0' <= c && c <= '9')) {
        arr_push(char_buffer, &c);
        c = source[(*index)++];
    }
    --*index;
    char* string = (char*)arr_get_all(char_buffer);
    string[char_buffer->length] = '\0';
    arr_free(char_buffer);
    for (int i = 0; i < tc_keywords_count; i++) {
        if (strcmp(string, tc_keywords[i]) == 0) {
            return (Token){TOKEN_KEYWORD, string, line_number};
        }
    }
    return (Token){TOKEN_IDENTIFIER, string, line_number};
}

static Token get_number_token(const char* source, int* index, int line_number) {
    Array* char_buffer = arr_init(sizeof(char), 16);
    char c = source[(*index) - 1];
    while ('0' <= c && c <= '9') {
        arr_push(char_buffer, &c);
        c = source[(*index)++];
    }
    if (c == '.') {
        arr_push(char_buffer, &c);
        c = source[(*index)++];
        while ('0' <= c && c <= '9') {
            arr_push(char_buffer, &c);
            c = source[(*index)++];
        }
        --*index;
        char* string = (char*)arr_get_all(char_buffer);
        string[char_buffer->length] = '\0';
        arr_free(char_buffer);
        return (Token){TOKEN_FLOAT, string, line_number};
    }
    --*index;
    char* string = (char*)arr_get_all(char_buffer);
    string[char_buffer->length] = '\0';
    arr_free(char_buffer);
    return (Token){TOKEN_INTEGER, string, line_number};
}

static Token get_string_token(const char* source, int* index, int line_number) {
    Array* char_buffer = arr_init(sizeof(char), 64);
    char c = source[(*index)++];
    while (c != '"') {
        if (c == '\0' || c == '\n') {
            tcerr_unclosed_string(line_number);
        }
        arr_push(char_buffer, &c);
        c = source[(*index)++];
    }
    char* string;
    if (char_buffer->length == 0) {
        string = (char*)tc_malloc(1);
        string[0] = '\0';
    } else {
        string = (char*)arr_get_all(char_buffer);
        string[char_buffer->length] = '\0';
    }
    arr_free(char_buffer);
    return (Token){TOKEN_STRING, string, line_number};
}

static Token get_comment_token(const char* source, int* index, int* line_number, int multi_line) {
    Array* char_buffer = arr_init(sizeof(char), 64);
    ++*index;
    char c = source[(*index)++];
    int start_line = *line_number;
    while (!multi_line && c != '\n') {
        if (c == '\0') {
            tcerr_unclosed_comment(*line_number);
        }
        arr_push(char_buffer, &c);
        c = source[(*index)++];
    }
    if (!multi_line && c == '\n') {
        ++*line_number;
    }
    while (multi_line && (c != '/' || char_buffer->length == 0 || *(char*)arr_get_item(char_buffer, -1) != '*')) {
        if (c == '\n') {
            ++*line_number;
        } else if (c == '\0') {
            tcerr_unclosed_comment(*line_number);
        }
        arr_push(char_buffer, &c);
        c = source[(*index)++];
    }
    if (multi_line) {
        if (char_buffer->length >= 2 && *(char*)arr_get_item(char_buffer, -1) == '*') {
            char_buffer->length--;
        }
    }
    char* string = (char*)arr_get_all(char_buffer);
    string[char_buffer->length] = '\0';
    arr_free(char_buffer);
    return (Token){TOKEN_COMMENT, string, start_line};
}

static int is_symbol_char(char c) {
    const char* symbols = "(){},!.[]\";_+-*/%=!<>&|";
    for (int i = 0; symbols[i] != '\0'; i++) {
        if (c == symbols[i]) {
            return 1;
        }
    }
    return 0;
}

static int is_symbol(char c1, char c2) {
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

static Token get_symbol_token(const char* source, int* index, int line_number) {
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

static Token get_next_token(const char* source, int* index, int* line_number) {
    while (1) {
        if (source[*index] == '\0') {
            return (Token){TOKEN_EOF, NULL, *line_number};
        } else {
            char c = source[(*index)++];
            if (c == '\n') {
                (*line_number)++;
            } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
                return get_identifier_token(source, index, *line_number);
            } else if ('0' <= c && c <= '9') {
                return get_number_token(source, index, *line_number);
            } else if (c == '"') {
                return get_string_token(source, index, *line_number);
            } else if (c == '/' && source[*index] == '/') {
                return get_comment_token(source, index, line_number, 0);
            } else if (c == '/' && source[*index] == '*') {
                return get_comment_token(source, index, line_number, 1);
            } else if (is_symbol_char(c)) {
                return get_symbol_token(source, index, *line_number);
            } else if (isspace(c)) {
                // Skip whitespace
            } else {
#ifdef DEBUG
                printf("[debug]: Unknown character '%c' at line %d\n", c, *line_number);
#endif
            }
        }
    }
}

Token* lexer(const char* source) {
    int source_index = 0;
    int line_number = 1;
    Array* token_array = arr_init(sizeof(Token), 16);
    while (1) {
        Token token = get_next_token(source, &source_index, &line_number);
        arr_push(token_array, &token);
        if (token.type == TOKEN_EOF) {
            break;
        }
    }
    Token* tokens = (Token*)arr_get_all(token_array);
    arr_free(token_array);
    return tokens;
}

static char* handle_newlines(char* str) {
    Array* char_buffer = arr_init(sizeof(char), 64);
    for (size_t i = 0; str[i] != '\0'; i++) {
        if (str[i] == '\n' || str[i] == '\t') {
            // char_buffer->length--;
            char* newline_str = str[i] == '\n' ? "\\n" : "\\t";
#ifdef DEBUG
            printf("[debug]: Handling newline/tab in comment: replacing with %s\n", newline_str);
#endif
            for (size_t j = 0; newline_str[j] != '\0'; j++) {
                arr_push(char_buffer, &newline_str[j]);
            }
#ifdef DEBUG
            printf("[debug]: Now char_buffer: %s\n", (char*)arr_get_all(char_buffer));
#endif
        } else if (str[i] != '\r') {
            arr_push(char_buffer, &str[i]);
        }
    }
    char* new_str = (char*)arr_get_all(char_buffer);
    new_str[char_buffer->length] = '\0';
    arr_free(char_buffer);
    return new_str;
}

static char* output_token(Token token) {
    const char* type_str;
    switch (token.type) {
        case TOKEN_EOF:
            type_str = "(eof)       ";
            break;
        case TOKEN_IDENTIFIER:
            type_str = "(identifier)";
            break;
        case TOKEN_KEYWORD:
            type_str = "(keyword)   ";
            break;
        case TOKEN_SYMBOL:
            type_str = "(symbol)    ";
            break;
        case TOKEN_INTEGER:
            type_str = "(integer)   ";
            break;
        case TOKEN_FLOAT:
            type_str = "(float)     ";
            break;
        case TOKEN_STRING:
            type_str = "(string)    ";
            break;
        case TOKEN_COMMENT:
            type_str = "(comment)   ";
            break;
        default:
            type_str = "(unknown)   ";
            break;
    }
    char* content = token.content ? token.content : "";
    if (content && token.type == TOKEN_COMMENT) {
        content = handle_newlines(content);
    }
    size_t buffer_size = (size_t)snprintf(NULL, 0, "%d%s: %s : \"%s\"", token.line, token.line < 10 ? " " : "", type_str, content);
    char* buffer = (char*)tc_malloc(buffer_size + 1);
    if (buffer) {
        sprintf(buffer, "%d%s: %s : \"%s\"", token.line, token.line < 10 ? " " : "", type_str, content);
    }
    return buffer;
}

void output_lexer_result(Token* tokens, const char* output_file) {
    FILE* file = fopen(output_file, "w");
    if (file == NULL) {
        tcerr_file_open_error(output_file);
    }
    for (int i = 0;; i++) {
        Token token = tokens[i];
        char* token_str = output_token(token);
        fprintf(file, "%s\n", token_str);
        tc_free(token_str);
        if (token.type == TOKEN_EOF) {
            break;
        }
    }
    fclose(file);
}
