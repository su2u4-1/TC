#include "tc_parser.h"

#include "tc_err.h"
#include "tc_lexer.h"
#include "tc_mem.h"
#include "tc_type.h"

/*
code = {"root", [import, function, class, ...], n}
import = {"import", [module_name, module_path], 2}
    module_name = {module_name, NULL, 0}
    module_path = {module_path or "", NULL, 0}
function = {"function", [type, function_name, parameter_list, body], 4}
    function_name = {function_name, NULL, 0}
    body = {"body", [statement, ...], n}
method = {"method", [type, method_name, parameter_list, body], 4}
    method_name = {method_name, NULL, 0}
    body = {"body", [statement, ...], n}
class = {"class", [class_name, class_member, ...], n}
    class_name = {class_name, NULL, 0}
    class_member = variable_declaration | method
parameter_list = {"parameter_list", [variable_declaration, ...], n}
type = {type_name, NULL, 0}
variable_declaration = {"variable_declaration", [type, identifier, expression], 3}
    identifier = {identifier_name, NULL, 0}
if_statement
while_statement = {"while_statement", [condition, body], 2}
    condition = expression
    body = {"body", [statement, ...], n}
for_statement = {"for_statement", [initialization, condition, increment, body], 4}
    initialization = variable_declaration | expression | empty
    condition = expression | empty
    increment = expression | empty
    body = {"body", [statement, ...], n}
    empty = {"empty", NULL, 0}
expression
term
variable_access
function_call
get_attribute
get_sequence
argument_list
literal
integer
float
string
boolean
return_statement
break_statement
continue_statement
builtin_type
identifier
operator
*/

static Node parser_code(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_import(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_class(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_method(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_function(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_type(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_return_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_if_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_while_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_for_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_variable_declaration(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_expression(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_break_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node parser_continue_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);

static Token* get_next_token(Token* tokens, size_t* current_index, size_t token_count) {
    if (*current_index >= token_count) {
#ifdef DEBUG
        printf("[debug] in get_next_token: not get any token, current_index: %zu, token_count: %zu\n", *current_index, token_count);
#endif
        return NULL;
    }
    return &tokens[(*current_index)++];
}

static Token* get_current_token(Token* tokens, size_t current_index, size_t token_count) {
    if (current_index <= 0 || current_index > token_count) {
#ifdef DEBUG
        printf("[debug] in get_current_token: not get any token, current_index: %zu, token_count: %zu\n", *current_index, token_count);
#endif
        return NULL;
    }
    return &tokens[current_index - 1];
}

static int token_cmp(const Token* token, TokenType type, const char* content) {
    if (token != NULL && token->type == type && (content == NULL || strcmp(token->content, content) == 0)) {
        return 1;
    }
    return 0;
}

static int token_is_type(const Token* token) {
    char** types = (char**)arr_get_all(tc_type);
    for (size_t i = 0; i < 5; i++) {
        if (token_cmp(token, TOKEN_KEYWORD, types[i])) {
            return 1;
        }
    }
    for (size_t i = 5; i < tc_type->length; i++) {
        if (token_cmp(token, TOKEN_IDENTIFIER, types[i])) {
            return 1;
        }
    }
    return 0;
}

static Node parser_break_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
}

static Node parser_continue_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
}

static Node parser_return_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
}

static Node parser_if_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
}

static Node parser_while_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node condition_node = parser_expression(filename, current_index, tokens, token_count);
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Array* buffer = arr_init(sizeof(Node*), 16);
    current_token = get_next_token(tokens, current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, "}")) {
        Node statement_node;
        // variable_declaration ";" | if_statement | while_statement | for_statement | expression ";" | ";" | return_statement ;
        if (token_cmp(current_token, TOKEN_KEYWORD, "return")) {
            statement_node = parser_return_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "if")) {
            statement_node = parser_if_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "while")) {
            statement_node = parser_while_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "for")) {
            statement_node = parser_for_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, "break")) {
            statement_node = parser_break_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, "continue")) {
            statement_node = parser_continue_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ";")) {
            // empty statement
        } else if (token_is_type(current_token)) {
            statement_node = parser_variable_declaration(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else {
            statement_node = parser_expression(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        }
        arr_push(buffer, &statement_node);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node body_node = {"body", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    Node while_statement_node = {"while_statement", (Node**)tc_malloc(sizeof(Node*) * 2), 2};
    while_statement_node.children[0] = &condition_node;
    while_statement_node.children[1] = &body_node;
    return while_statement_node;
}

static Node parser_for_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node initialization_node = {"empty", NULL, 0};
    if (token_is_type(current_token)) {
        initialization_node = parser_variable_declaration(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    } else if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        initialization_node = parser_expression(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node condition_node = {"empty", NULL, 0};
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        condition_node = parser_expression(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node increment_node = {"empty", NULL, 0};
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        increment_node = parser_expression(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Array* buffer = arr_init(sizeof(Node*), 16);
    current_token = get_next_token(tokens, current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, "}")) {
        Node statement_node;
        // variable_declaration ";" | if_statement | while_statement | for_statement | expression ";" | ";" | return_statement ;
        if (token_cmp(current_token, TOKEN_KEYWORD, "return")) {
            statement_node = parser_return_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "if")) {
            statement_node = parser_if_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "while")) {
            statement_node = parser_while_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "for")) {
            statement_node = parser_for_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, "break")) {
            statement_node = parser_break_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, "continue")) {
            statement_node = parser_continue_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ";")) {
            // empty statement
        } else if (token_is_type(current_token)) {
            statement_node = parser_variable_declaration(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else {
            statement_node = parser_expression(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        }
        arr_push(buffer, &statement_node);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node body_node = {"body", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    Node for_statement_node = {"for_statement", (Node**)tc_malloc(sizeof(Node*) * 4), 4};
    for_statement_node.children[0] = &initialization_node;
    for_statement_node.children[1] = &condition_node;
    for_statement_node.children[2] = &increment_node;
    for_statement_node.children[3] = &body_node;
    return for_statement_node;
}

static Node parser_expression(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
}

static Node parser_variable_declaration(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Node type_node = parser_type(filename, current_index, tokens, token_count);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    Node identifier_node;
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        identifier_node.value = current_token->content;
        identifier_node.children = NULL;
        identifier_node.child_count = 0;
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node expression_node = {"empty", NULL, 0};
    if (token_cmp(current_token, TOKEN_SYMBOL, "=")) {
        current_token = get_next_token(tokens, current_index, token_count);
        expression_node = parser_expression(filename, current_index, tokens, token_count);
    } else {
        --*current_index;
    }
    Node variable_declaration_node = {"variable_declaration", (Node**)tc_malloc(sizeof(Node*) * 3), 3};
    variable_declaration_node.children[0] = &type_node;
    variable_declaration_node.children[1] = &identifier_node;
    variable_declaration_node.children[2] = &expression_node;
    return variable_declaration_node;
}

static Node parser_type(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Token* current_token = get_current_token(tokens, *current_index, token_count);
    if (!token_is_type(current_token)) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Node type_node = {current_token->content, NULL, 0};
    return type_node;
}

static Node parser_parameter_list(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_current_token(tokens, *current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        Node parameter_node = parser_variable_declaration(filename, current_index, tokens, token_count);
        arr_push(buffer, &parameter_node);
        current_token = get_next_token(tokens, current_index, token_count);
        if (token_cmp(current_token, TOKEN_SYMBOL, ",")) {
            current_token = get_next_token(tokens, current_index, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ")")) {
            break;
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
    }
    Node parameter_list_node = {"parameter_list", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    return parameter_list_node;
}

static Node parser_import(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Token* current_token = get_next_token(tokens, current_index, token_count);
    char* module_name = "";
    char* module_path = "empty";
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        module_name = current_token->content;
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_SYMBOL, "from")) {
        current_token = get_next_token(tokens, current_index, token_count);
        if (token_cmp(current_token, TOKEN_STRING, NULL)) {
            module_path = current_token->content;
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Node import_node = {"import", (Node**)tc_malloc(sizeof(Node*) * 2), 2};
    Node module_name_node = {module_name, NULL, 0};
    Node module_path_node = {module_path, NULL, 0};
    import_node.children[0] = &module_name_node;
    import_node.children[1] = &module_path_node;
    return import_node;
}

static Node parser_function(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Token* current_token = get_next_token(tokens, current_index, token_count);
    Node return_type_node, function_name_node;
    if (token_is_type(current_token)) {
        return_type_node = parser_type(filename, current_index, tokens, token_count);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        function_name_node.value = current_token->content;
        function_name_node.children = NULL;
        function_name_node.child_count = 0;
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node parameter_list_node = parser_parameter_list(filename, current_index, tokens, token_count);
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Array* buffer = arr_init(sizeof(Node*), 16);
    current_token = get_next_token(tokens, current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, "}")) {
        Node statement_node;
        // variable_declaration ";" | if_statement | while_statement | for_statement | expression ";" | ";" | return_statement ;
        if (token_cmp(current_token, TOKEN_KEYWORD, "return")) {
            statement_node = parser_return_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "if")) {
            statement_node = parser_if_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "while")) {
            statement_node = parser_while_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "for")) {
            statement_node = parser_for_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ";")) {
            // empty statement
        } else if (token_is_type(current_token)) {
            statement_node = parser_variable_declaration(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else {
            statement_node = parser_expression(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        }
        arr_push(buffer, &statement_node);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node body_node = {"body", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    Node function_node = {"function", (Node**)tc_malloc(sizeof(Node*) * 4), 4};
    function_node.children[0] = &return_type_node;
    function_node.children[1] = &function_name_node;
    function_node.children[2] = &parameter_list_node;
    function_node.children[3] = &body_node;
    return function_node;
}

static Node parser_method(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Node return_type_node, method_name_node;
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (token_is_type(current_token)) {
        return_type_node = parser_type(filename, current_index, tokens, token_count);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        method_name_node.value = current_token->content;
        method_name_node.children = NULL;
        method_name_node.child_count = 0;
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_KEYWORD, "self")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Node parameter_list_node = {"parameter_list", NULL, 0};
    if (token_cmp(current_token, TOKEN_SYMBOL, ",")) {
        current_token = get_next_token(tokens, current_index, token_count);
        parameter_list_node = parser_parameter_list(filename, current_index, tokens, token_count);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, "}")) {
        Node statement_node;
        // variable_declaration ";" | if_statement | while_statement | for_statement | expression ";" | ";" | return_statement ;
        if (token_cmp(current_token, TOKEN_KEYWORD, "return")) {
            statement_node = parser_return_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "if")) {
            statement_node = parser_if_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "while")) {
            statement_node = parser_while_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "for")) {
            statement_node = parser_for_statement(filename, current_index, tokens, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ";")) {
            // empty statement
        } else if (token_is_type(current_token)) {
            statement_node = parser_variable_declaration(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else {
            statement_node = parser_expression(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        }
        arr_push(buffer, &statement_node);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node body_node = {"body", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    Node method_node = {"method", (Node**)tc_malloc(sizeof(Node*) * 4), 4};
    method_node.children[0] = &return_type_node;
    method_node.children[1] = &method_name_node;
    method_node.children[2] = &parameter_list_node;
    method_node.children[3] = &body_node;
    return method_node;
}

static Node parser_class(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        Node class_name = {current_token->content, NULL, 0};
        arr_push(buffer, &class_name);
        arr_push(tc_type, &current_token->content);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, "}")) {
        Node class_member_node;
        if (token_is_type(current_token)) {
            class_member_node = parser_variable_declaration(filename, current_index, tokens, token_count);
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "method")) {
            class_member_node = parser_method(filename, current_index, tokens, token_count);
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        arr_push(buffer, &class_member_node);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node class_node = {"class", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    return class_node;
}

static Node parser_code(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    while (current_token->type != TOKEN_EOF) {
        if (token_cmp(current_token, TOKEN_KEYWORD, "import")) {
            Node node = parser_import(filename, current_index, tokens, token_count);
            arr_push(buffer, &node);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "func")) {
            Node node = parser_function(filename, current_index, tokens, token_count);
            arr_push(buffer, &node);
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "class")) {
            Node node = parser_class(filename, current_index, tokens, token_count);
            arr_push(buffer, &node);
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        get_next_token(tokens, current_index, token_count);
    }
    Node root = {"root", (Node**)arr_get_all(buffer), buffer->length};
    arr_free(buffer);
    return root;
}

Node tc_parser(const char* filename, Token* tokens, size_t token_count) {
    size_t current_index = 0;
    return parser_code(filename, &current_index, tokens, token_count);
}
