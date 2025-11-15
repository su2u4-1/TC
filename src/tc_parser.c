#include "tc_parser.h"

#include <string.h>

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
    body = statements
method = {"method", [type, method_name, parameter_list, body], 4}
    method_name = {method_name, NULL, 0}
    body = statements
class = {"class", [class_name, class_member, ...], n}
    class_name = {class_name, NULL, 0}
    class_member = variable_declaration | method
parameter_list = {"parameter_list", [variable_declaration, ...], n}
type = {type_name, NULL, 0}
variable_declaration = {"variable_declaration", [type, identifier, initializer], 3}
    identifier = {identifier_name, NULL, 0}
    initializer = expression | empty
    empty = {"empty", NULL, 0}
if_statement = {"if_statement", [condition, body, elif_statement_condition, elif_statement_body, else_statement_body], 2 + 2*m + e}
    condition = expression
    body = statements
    elif_statement_condition = expression
    elif_statement_body = statements
    else_statement_body = statements
while_statement = {"while_statement", [condition, body], 2}
    condition = expression
    body = statements
for_statement = {"for_statement", [initialization, condition, increment, body], 4}
    initialization = variable_declaration | expression | empty
    condition = expression | empty
    increment = expression | empty
    body = statements
    empty = {"empty", NULL, 0}
break_statement = {"break_statement", NULL, 0}
continue_statement = {"continue_statement", NULL, 0}
return_statement = {"return_statement", [expression], 1}
    expression = expression | empty
    empty = {"empty", NULL, 0}
statements = {"statements", [statement, ...], n}
    statement = variable_declaration ";" | if_statement | while_statement | for_statement | expression ";" | ";" ;
    if loop_level > 0:
        | break_statement
        | continue_statement
    if in_function:
        | return_statement
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

static int loop_level = 0;
static bool in_function = false;

static Node* parser_code(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_import(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_class(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_method(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_function(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_type(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_return_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_if_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_while_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_for_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_variable_declaration(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_expression(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_break_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_continue_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count);
static Node* parser_statements(const char* filename, size_t* current_indx, Token* tokens, size_t token_count);

static Node* node_make(const char* value, size_t child_count) {
    Node* node = (Node*)tc_malloc(sizeof(Node));
    node->value = value;
    node->child_count = child_count;
    if (child_count > 0) {
        node->children = (Node**)tc_malloc(sizeof(Node*) * child_count);
        memset(node->children, 0, sizeof(Node*) * child_count);
    } else {
        node->children = NULL;
    }
    return node;
}

static Node* node_make_with_children(const char* value, Node** children, size_t child_count) {
    Node* node = node_make(value, child_count);
    if (children && child_count > 0) {
        for (size_t i = 0; i < child_count; i++) node->children[i] = children[i];
    }
    return node;
}

static void node_free(Node* node) {
    if (node) {
        if (node->children) {
            for (size_t i = 0; i < node->child_count; i++) {
                node_free(node->children[i]);
            }
            tc_free(node->children);
        }
        tc_free(node);
    }
}

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

static Node* parser_break_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    if (loop_level <= 0) {
        Token* current_token = get_current_token(tokens, *current_index, token_count);
        tcerr_loop_error(filename, current_token->line, "break statement used outside of loop");
    }
    return node_make("break_statement", 0);
}

static Node* parser_continue_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    if (loop_level <= 0) {
        Token* current_token = get_current_token(tokens, *current_index, token_count);
        tcerr_loop_error(filename, current_token->line, "continue statement used outside of loop");
    }
    return node_make("continue_statement", 0);
}

static Node* parser_return_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Node* expression_node = node_make("empty", 0);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        node_free(expression_node);
        expression_node = parser_expression(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Node* return_statement_node = node_make("return_statement", 1);
    return_statement_node->children[0] = expression_node;
    return return_statement_node;
}

static Node* parser_statements(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, "}")) {
        // variable_declaration ";" | if_statement | while_statement | for_statement | expression ";" | ";" | return_statement ;
        if (in_function && token_cmp(current_token, TOKEN_KEYWORD, "return")) {
            arr_push(buffer, parser_return_statement(filename, current_index, tokens, token_count));
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "if")) {
            arr_push(buffer, parser_if_statement(filename, current_index, tokens, token_count));
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "while")) {
            arr_push(buffer, parser_while_statement(filename, current_index, tokens, token_count));
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "for")) {
            arr_push(buffer, parser_for_statement(filename, current_index, tokens, token_count));
        } else if (loop_level > 0 && token_cmp(current_token, TOKEN_SYMBOL, "break")) {
            arr_push(buffer, parser_break_statement(filename, current_index, tokens, token_count));
        } else if (loop_level > 0 && token_cmp(current_token, TOKEN_SYMBOL, "continue")) {
            arr_push(buffer, parser_continue_statement(filename, current_index, tokens, token_count));
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ";")) {
            // empty statement
        } else if (token_is_type(current_token)) {
            arr_push(buffer, parser_variable_declaration(filename, current_index, tokens, token_count));
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else {
            arr_push(buffer, parser_expression(filename, current_index, tokens, token_count));
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        }
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node* body_node = node_make_with_children("statements", (Node**)arr_get_all(buffer), buffer->length);
    arr_free(buffer);
    return body_node;
}

static Node* parser_if_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    arr_push(buffer, parser_expression(filename, current_index, tokens, token_count));
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    arr_push(buffer, parser_statements(filename, current_index, tokens, token_count));
    current_token = get_next_token(tokens, current_index, token_count);
    while (token_cmp(current_token, TOKEN_KEYWORD, "elif")) {
        current_token = get_next_token(tokens, current_index, token_count);
        if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        current_token = get_next_token(tokens, current_index, token_count);
        arr_push(buffer, parser_expression(filename, current_index, tokens, token_count));
        current_token = get_next_token(tokens, current_index, token_count);
        if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        current_token = get_next_token(tokens, current_index, token_count);
        if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        arr_push(buffer, parser_statements(filename, current_index, tokens, token_count));
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (token_cmp(current_token, TOKEN_KEYWORD, "else")) {
        current_token = get_next_token(tokens, current_index, token_count);
        if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        arr_push(buffer, parser_statements(filename, current_index, tokens, token_count));
    } else {
        --*current_index;
    }
    Node* if_statement_node = node_make_with_children("if_statement", (Node**)arr_get_all(buffer), buffer->length);
    arr_free(buffer);
    return if_statement_node;
}

static Node* parser_while_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    int current_loop = loop_level++;
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node* condition_node = parser_expression(filename, current_index, tokens, token_count);
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Node* body_node = parser_statements(filename, current_index, tokens, token_count);
    Node* while_statement_node = node_make("while_statement", 2);
    while_statement_node->children[0] = condition_node;
    while_statement_node->children[1] = body_node;
    --loop_level;
    if (loop_level < 0 || loop_level != current_loop) {
        tcerr_loop_error(filename, current_token->line, "loop level mismatch in parser_while_statement");
    }
    return while_statement_node;
}

static Node* parser_for_statement(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    int current_loop = loop_level++;
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node* initialization_node = node_make("empty", 0);
    if (token_is_type(current_token)) {
        node_free(initialization_node);
        initialization_node = parser_variable_declaration(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    } else if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        node_free(initialization_node);
        initialization_node = parser_expression(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node* condition_node = node_make("empty", 0);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        node_free(condition_node);
        condition_node = parser_expression(filename, current_index, tokens, token_count);
        current_token = get_next_token(tokens, current_index, token_count);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node* increment_node = node_make("empty", 0);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        node_free(increment_node);
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
    Node* body_node = parser_statements(filename, current_index, tokens, token_count);
    Node* for_statement_node = node_make("for_statement", 4);
    for_statement_node->children[0] = initialization_node;
    for_statement_node->children[1] = condition_node;
    for_statement_node->children[2] = increment_node;
    for_statement_node->children[3] = body_node;
    --loop_level;
    if (loop_level < 0 || loop_level != current_loop) {
        tcerr_loop_error(filename, current_token->line, "loop level mismatch in parser_for_statement");
    }
    return for_statement_node;
}

static Node* parser_expression(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    return NULL;  // TODO
}

static Node* parser_variable_declaration(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Node* type_node = parser_type(filename, current_index, tokens, token_count);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    Node* identifier_node = NULL;
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        identifier_node = node_make(current_token->content, 0);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node* expression_node = node_make("empty", 0);
    if (token_cmp(current_token, TOKEN_SYMBOL, "=")) {
        current_token = get_next_token(tokens, current_index, token_count);
        node_free(expression_node);
        expression_node = parser_expression(filename, current_index, tokens, token_count);
    } else {
        --*current_index;
    }
    Node* variable_declaration_node = node_make("variable_declaration", 3);
    variable_declaration_node->children[0] = type_node;
    variable_declaration_node->children[1] = identifier_node;
    variable_declaration_node->children[2] = expression_node;
    return variable_declaration_node;
}

static Node* parser_type(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Token* current_token = get_current_token(tokens, *current_index, token_count);
    if (!token_is_type(current_token)) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    return node_make(current_token->content, 0);
}

static Node* parser_parameter_list(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_current_token(tokens, *current_index, token_count);
    while (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        arr_push(buffer, parser_variable_declaration(filename, current_index, tokens, token_count));
        current_token = get_next_token(tokens, current_index, token_count);
        if (token_cmp(current_token, TOKEN_SYMBOL, ",")) {
            current_token = get_next_token(tokens, current_index, token_count);
        } else if (token_cmp(current_token, TOKEN_SYMBOL, ")")) {
            break;
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
    }
    Node* parameter_list_node = node_make_with_children("parameter_list", (Node**)arr_get_all(buffer), buffer->length);
    arr_free(buffer);
    return parameter_list_node;
}

static Node* parser_import(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
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
    Node* import_node = node_make("import", 2);
    Node* module_name_node = node_make(module_name, 0);
    Node* module_path_node = node_make(module_path, 0);
    import_node->children[0] = module_name_node;
    import_node->children[1] = module_path_node;
    return import_node;
}

static Node* parser_function(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    in_function = true;
    Token* current_token = get_next_token(tokens, current_index, token_count);
    Node* return_type_node = NULL;
    Node* function_name_node = NULL;
    if (token_is_type(current_token)) {
        return_type_node = parser_type(filename, current_index, tokens, token_count);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        function_name_node = node_make(current_token->content, 0);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, "(")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    Node* parameter_list_node = parser_parameter_list(filename, current_index, tokens, token_count);
    current_token = get_next_token(tokens, current_index, token_count);
    if (!token_cmp(current_token, TOKEN_SYMBOL, ")")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    if (!token_cmp(current_token, TOKEN_SYMBOL, "{")) {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    Node* body_node = parser_statements(filename, current_index, tokens, token_count);
    Node* function_node = node_make("function", 4);
    function_node->children[0] = return_type_node;
    function_node->children[1] = function_name_node;
    function_node->children[2] = parameter_list_node;
    function_node->children[3] = body_node;
    in_function = false;
    return function_node;
}

static Node* parser_method(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    in_function = true;
    Node* return_type_node = NULL;
    Node* method_name_node = NULL;
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (token_is_type(current_token)) {
        return_type_node = parser_type(filename, current_index, tokens, token_count);
    } else {
        tcerr_unexpected_token(filename, current_token->line, current_token->content);
    }
    current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        method_name_node = node_make(current_token->content, 0);
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
    Node* parameter_list_node = node_make("parameter_list", 0);
    if (token_cmp(current_token, TOKEN_SYMBOL, ",")) {
        current_token = get_next_token(tokens, current_index, token_count);
        node_free(parameter_list_node);
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
    Node* body_node = parser_statements(filename, current_index, tokens, token_count);
    Node* method_node = node_make("method", 4);
    method_node->children[0] = return_type_node;
    method_node->children[1] = method_name_node;
    method_node->children[2] = parameter_list_node;
    method_node->children[3] = body_node;
    in_function = false;
    return method_node;
}

static Node* parser_class(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    if (token_cmp(current_token, TOKEN_IDENTIFIER, NULL)) {
        arr_push(buffer, node_make(current_token->content, 0));
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
        if (token_is_type(current_token)) {
            arr_push(buffer, parser_variable_declaration(filename, current_index, tokens, token_count));
            current_token = get_next_token(tokens, current_index, token_count);
            if (!token_cmp(current_token, TOKEN_SYMBOL, ";")) {
                tcerr_unexpected_token(filename, current_token->line, current_token->content);
            }
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "method")) {
            arr_push(buffer, parser_method(filename, current_index, tokens, token_count));
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        current_token = get_next_token(tokens, current_index, token_count);
    }
    Node* class_node = node_make_with_children("class", (Node**)arr_get_all(buffer), buffer->length);
    arr_free(buffer);
    return class_node;
}

static Node* parser_code(const char* filename, size_t* current_index, Token* tokens, size_t token_count) {
    Array* buffer = arr_init(sizeof(Node*), 16);
    Token* current_token = get_next_token(tokens, current_index, token_count);
    while (current_token->type != TOKEN_EOF) {
        if (token_cmp(current_token, TOKEN_KEYWORD, "import")) {
            arr_push(buffer, parser_import(filename, current_index, tokens, token_count));
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "func")) {
            arr_push(buffer, parser_function(filename, current_index, tokens, token_count));
        } else if (token_cmp(current_token, TOKEN_KEYWORD, "class")) {
            arr_push(buffer, parser_class(filename, current_index, tokens, token_count));
        } else {
            tcerr_unexpected_token(filename, current_token->line, current_token->content);
        }
        get_next_token(tokens, current_index, token_count);
    }
    Node* root = node_make_with_children("root", (Node**)arr_get_all(buffer), buffer->length);
    arr_free(buffer);
    return root;
}

Node* tc_parser(const char* filename, Token* tokens, size_t token_count) {
    size_t current_index = 0;
    return parser_code(filename, &current_index, tokens, token_count);
}
