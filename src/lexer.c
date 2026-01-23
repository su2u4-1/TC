#include "lexer.h"

#include "lib.h"

offset(Lexer*) create_lexer(char* source, size_t length) {
    offset(Lexer*) lexer = alloc_memory(sizeof(Lexer));
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    lexer_ptr->source = char_ptr_to_string(source);
    lexer_ptr->position = 0;
    lexer_ptr->length = length;
    lexer_ptr->line = 0;
    lexer_ptr->column = 0;
    lexer_ptr->peeked_token = 0;
    lexer_ptr->peeked_position = 0;
    lexer_ptr->peeked_line = 0;
    lexer_ptr->peeked_column = 0;
    return lexer;
}

static offset(Token*) create_token(TokenType type, string lexeme, size_t line, size_t column) {
    offset(Token*) token = alloc_memory(sizeof(Token));
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

static char get_current_char(offset(Lexer*) lexer) {
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    char* source = string_to_char_ptr(lexer_ptr->source);
    if (lexer_ptr->position >= lexer_ptr->length)
        return '\0';
    lexer_ptr->column++;
    return source[lexer_ptr->position++];
}

static char peek_next_char(offset(Lexer*) lexer) {
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    char* source = string_to_char_ptr(lexer_ptr->source);
    if (lexer_ptr->position >= lexer_ptr->length)
        return '\0';
    return source[lexer_ptr->position];
}

static void newline(offset(Lexer*) lexer) {
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    lexer_ptr->line++;
    lexer_ptr->column = 0;
}

static void move_position(offset(Lexer*) lexer, int count) {
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    if (count >= 0) {
        lexer_ptr->position += (size_t)count;
        lexer_ptr->column += (size_t)count;
    } else {
        lexer_ptr->position -= (size_t)(-count);
        lexer_ptr->column -= (size_t)(-count);
    }
}

offset(Token*) get_next_token(offset(Lexer*) lexer) {
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    if (lexer_ptr->peeked_token != 0) {
        offset(Token*) cached_token = lexer_ptr->peeked_token;
        lexer_ptr->position = lexer_ptr->peeked_position;
        lexer_ptr->line = lexer_ptr->peeked_line;
        lexer_ptr->column = lexer_ptr->peeked_column;
        lexer_ptr->peeked_token = 0;
        return cached_token;
    }
    char c = get_current_char(lexer);
    if (c == '\0')
        return create_token(EOF_TOKEN, 0, lexer_ptr->line, lexer_ptr->column);
    else if (c == ' ' || c == '\t' || c == '\r')
        return get_next_token(lexer);
    else if (c == '\n') {
        newline(lexer);
        return get_next_token(lexer);
    } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
        size_t start = lexer_ptr->position - 1;
        size_t column_start = lexer_ptr->column - 1;
        while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
            c = get_current_char(lexer);
        move_position(lexer, -1);
        string content = create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start);
        if (is_keyword(content))
            return create_token(KEYWORD, content, lexer_ptr->line, column_start);
        else
            return create_token(IDENTIFIER, content, lexer_ptr->line, column_start);
    } else if ('0' <= c && c <= '9') {
        size_t start = lexer_ptr->position - 1;
        size_t column_start = lexer_ptr->column - 1;
        while ('0' <= c && c <= '9')
            c = get_current_char(lexer);
        TokenType type = INTEGER;
        char p = peek_next_char(lexer);
        if (c == '.' && ('0' <= p && p <= '9')) {
            c = get_current_char(lexer);
            while ('0' <= c && c <= '9')
                c = get_current_char(lexer);
            type = FLOAT;
        }
        move_position(lexer, -1);
        return create_token(type, create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start), lexer_ptr->line, column_start);
    } else if (c == '"') {
        size_t start = lexer_ptr->position;
        size_t column_start = lexer_ptr->column - 1;
        c = get_current_char(lexer);
        while (c != '"' && c != '\0' && c != '\n')
            c = get_current_char(lexer);
        if (c != '"') {
            lexer_error("Unterminated string literal", lexer_ptr->line, start - 1);
            if (c == '\n') newline(lexer);
            return create_token(STRING, create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start - 1), lexer_ptr->line, column_start);
        }
        return create_token(STRING, create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start - 1), lexer_ptr->line, column_start);
    } else {
        char p = peek_next_char(lexer);
        if (c == '/' && p == '/') {
            size_t start = lexer_ptr->position + 1;
            size_t column_start = lexer_ptr->column - 1;
            while (c != '\n' && c != '\0')
                c = get_current_char(lexer);
            move_position(lexer, -1);
            return create_token(COMMENT, create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start), lexer_ptr->line, column_start);
        } else if (c == '/' && p == '*') {
            size_t start = lexer_ptr->position + 1;
            size_t column_start = lexer_ptr->column - 1;
            while (!(c == '*' && p == '/')) {
                c = get_current_char(lexer);
                p = peek_next_char(lexer);
                if (c == '\n') newline(lexer);
                if (p == '\0') break;
                assert(c != '\0');
            }
            if (p == '\0') {
                if (c == '\0') move_position(lexer, -1);
                lexer_error("Unterminated comment", lexer_ptr->line, start);
                return create_token(COMMENT, create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start), lexer_ptr->line, column_start);
            }
            c = get_current_char(lexer);
            return create_token(COMMENT, create_string(&string_to_char_ptr(lexer_ptr->source)[start], lexer_ptr->position - start - 2), lexer_ptr->line, column_start);
        } else if (c == '=' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, EQ_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '!' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, NE_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '<' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, LE_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '>' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, GE_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '+' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '-' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '*' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '/' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '%' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '&' && p == '&') {
            get_current_char(lexer);
            return create_token(SYMBOL, AND_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '|' && p == '|') {
            get_current_char(lexer);
            return create_token(SYMBOL, OR_SYMBOL, lexer_ptr->line, lexer_ptr->column - 2);
        } else if (c == '(')
            return create_token(SYMBOL, L_PAREN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == ')')
            return create_token(SYMBOL, R_PAREN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '{')
            return create_token(SYMBOL, L_BRACE_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '}')
            return create_token(SYMBOL, R_BRACE_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == ',')
            return create_token(SYMBOL, COMMA_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '!')
            return create_token(SYMBOL, NOT_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '.')
            return create_token(SYMBOL, DOT_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '[')
            return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == ']')
            return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == ';')
            return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '_')
            return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '+')
            return create_token(SYMBOL, ADD_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '-')
            return create_token(SYMBOL, SUB_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '*')
            return create_token(SYMBOL, MUL_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '/')
            return create_token(SYMBOL, DIV_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '%')
            return create_token(SYMBOL, MOD_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '<')
            return create_token(SYMBOL, LT_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '>')
            return create_token(SYMBOL, GT_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else if (c == '=')
            return create_token(SYMBOL, ASSIGN_SYMBOL, lexer_ptr->line, lexer_ptr->column - 1);
        else {
            lexer_error("Unexpected character", lexer_ptr->line, lexer_ptr->column - 1);
            return create_token(EOF_TOKEN, 0, 0, 0);
        }
    }
}

offset(Token*) peek_next_token(offset(Lexer*) lexer) {
    Lexer* lexer_ptr = (Lexer*)offset_to_ptr(lexer);
    if (lexer_ptr->peeked_token != 0)
        return lexer_ptr->peeked_token;
    size_t saved_position = lexer_ptr->position;
    size_t saved_line = lexer_ptr->line;
    size_t saved_column = lexer_ptr->column;
    offset(Token*) token = get_next_token(lexer);
    lexer_ptr->peeked_position = lexer_ptr->position;
    lexer_ptr->peeked_line = lexer_ptr->line;
    lexer_ptr->peeked_column = lexer_ptr->column;
    lexer_ptr->position = saved_position;
    lexer_ptr->line = saved_line;
    lexer_ptr->column = saved_column;
    lexer_ptr->peeked_token = token;
    return token;
}
