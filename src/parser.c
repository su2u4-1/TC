#include "parser.h"

#include "create.h"
#include "helper.h"
#include "lexer.h"
#include "lib.h"

// parser functions
static Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser);
static Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser);

Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 0 Starting parse_code\n");
    if (builtin_scope == NULL) {
        builtin_scope = create_symbol_table(NULL);
        name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
    }
    if (now_scope == NULL)
        now_scope = builtin_scope;
    Token* token = NULL;
    list(CodeMember*) members = create_list();
    SymbolTable* global_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, true);
    while (token != NULL && token->type != EOF_TOKEN) {
        if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
            Import* import = parse_import(lexer, global_scope, parser);
            if (import == NULL)
                parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
        } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
            Function* function = parse_function(lexer, global_scope, parser);
            if (function == NULL)
                parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
        } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
            Class* class = parse_class(lexer, global_scope, parser);
            if (class == NULL)
                parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
        } else
            parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, true);
    }
    // printf("[DEBUG] 1 Finished parse_code\n");
    return create_code(members, global_scope);
}
Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 2 Starting parse_import\n");
    Token* token = NULL;
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 3 Finished parse_import with error\n");
        return NULL;
    }
    string import_name = token->lexeme;
    string source = NULL;
    token = get_next_token(lexer, true);
    if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
        token = get_next_token(lexer, true);
        if (token->type != STRING) {
            parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 4 Finished parse_import with error\n");
            return NULL;
        }
        source = token->lexeme;
        token = get_next_token(lexer, true);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 5 Finished parse_import with error\n");
        return NULL;
    }
    Symbol* name;
    name = parse_import_file(import_name, source, now_scope, parser->source_file);
    if (name == NULL) {
        fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
        name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
    }
    // printf("[DEBUG] 6 Finished parse_import\n");
    return create_import(name, source);
}
Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 7 Starting parse_function\n");
    Token* token = NULL;
    SymbolTable* function_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
        parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 8 Finished parse_function with error\n");
        return NULL;
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == NULL) {
        parser_error("Unknown function return type", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 9 Finished parse_function with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER) {
        parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 10 Finished parse_function with error\n");
        return NULL;
    }
    Function* function = (Function*)alloc_memory(sizeof(Function));
    function->function_scope = function_scope;
    Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 11 Finished parse_function with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    list(Variable*) parameters = create_list();
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        Variable* parameter = parse_variable(lexer, function_scope, parser);
        if (parameter == NULL)
            parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
        else if (parameter->value != NULL)
            parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, true);
        if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, true);
        } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 12 Finished parse_function with error\n");
            return NULL;
        }
    }
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 13 Finished parse_function with error\n");
        return NULL;
    }
    list(Statement*) body = create_list();
    parser->in_function = true;
    bool have_return = false;
    token = get_next_token(lexer, true);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, function_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
        else if (have_return)
            parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
        if (statement != NULL && statement->type == RETURN_STATEMENT)
            have_return = true;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, true);
    }
    parser->in_function = false;
    if (!have_return && return_type != name_void)
        parser_error("Function missing return statement", token, get_full_path(parser->source_file));
    // printf("[DEBUG] 14 Finished parse_function\n");
    return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
}
Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser) {
    // printf("[DEBUG] 15 Starting parse_method\n");
    Token* token = NULL;
    SymbolTable* method_scope = create_symbol_table(now_scope);
    Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
        parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 16 Finished parse_method with error\n");
        return NULL;
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == NULL) {
        parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 17 Finished parse_method with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER) {
        parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 18 Finished parse_method with error\n");
        return NULL;
    }
    Method* method = (Method*)alloc_memory(sizeof(Method));
    method->method_scope = method_scope;
    Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 19 Finished parse_method with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
        parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, true);
    list(Variable*) parameters = create_list();
    list_append(parameters, (pointer)create_variable(class_name, self, NULL));
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, true);
        } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
        else {
            parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
            return NULL;
        }
        Variable* parameter = parse_variable(lexer, method_scope, parser);
        if (parameter == NULL)
            parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
        else if (parameter->value != NULL)
            parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, true);
    }
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 20 Finished parse_method with error\n");
        return NULL;
    }
    list(Statement*) body = create_list();
    parser->in_function = true;
    parser->in_method = true;
    bool have_return = false;
    token = get_next_token(lexer, true);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, method_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
        else if (have_return)
            parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
        if (statement != NULL && statement->type == RETURN_STATEMENT)
            have_return = true;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, true);
    }
    parser->in_function = false;
    parser->in_method = false;
    if (!have_return && return_type != name_void)
        parser_error("Method missing return statement", token, get_full_path(parser->source_file));
    // printf("[DEBUG] 21 Finished parse_method\n");
    return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
}
Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 22 Starting parse_class\n");
    Token* token = NULL;
    SymbolTable* class_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER) {
        parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 23 Finished parse_class with error\n");
        return NULL;
    }
    Class* class = (Class*)alloc_memory(sizeof(Class));
    class->class_scope = class_scope;
    Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 24 Finished parse_class with error\n");
        return NULL;
    }
    list(ClassMember*) members = create_list();
    token = get_next_token(lexer, true);
    size_t size = 0;
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
            Method* method = parse_method(lexer, class_scope, name, parser);
            if (method == NULL)
                parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
        } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
            token = get_next_token(lexer, true);
            Variable* variable = parse_variable(lexer, class_scope, parser);
            if (variable == NULL)
                parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
            ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
            list_append(members, (pointer)member);
            if (member->type == CLASS_VARIABLE) {
                Symbol* type = member->content.variable->type;
                if (type == name_int || type == name_float || type == name_string)
                    size += 8;
                else if (type == name_bool || type == name_void)
                    size += 1;
                else if (type->kind == SYMBOL_CLASS)
                    size += 8;  // pointer to object
                else
                    fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
            }
            token = get_next_token(lexer, true);
            if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
                parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
        } else
            parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, true);
    }
    string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
    Symbol* init = search_name_use_strcmp(class_scope, init_name);
    if (init == NULL) {
        Method* method = (Method*)alloc_memory(sizeof(Method));
        method->method_scope = create_symbol_table(class_scope);
        init = create_symbol(init_name, SYMBOL_METHOD, name, method);
        list(Variable*) parameters = create_list();
        Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
        list_append(parameters, (pointer)create_variable(name, self, NULL));
        list(Statement*) body = create_list();
        list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
        create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
        list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
    }
    if (init->kind != SYMBOL_METHOD)
        parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
    string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
    Method* method = (Method*)alloc_memory(sizeof(Method));
    method->method_scope = create_symbol_table(class_scope);
    Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
    list(Variable*) parameters = create_list();
    Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
    list_append(parameters, (pointer)create_variable(name, self, NULL));
    list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
    Variable* param;
    while ((param = (Variable*)list_pop(init_params)) != NULL) {
        if (string_equal(param->name->name, SELF_KEYWORD)) continue;
        list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
    }
    list(statement*) body = create_list();
    list(ClassMember*) ms = list_copy(members);
    ClassMember* mb;
    while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
        if (mb->type == CLASS_VARIABLE) {
            Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
            Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
            list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
        }
    }
    list(Expression*) args = create_list();
    list(Variable*) params = list_copy(parameters);
    while ((param = (Variable*)list_pop(params)) != NULL)
        list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
    list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
    create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
    list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
    // printf("[DEBUG] 25 Finished parse_class\n");
    return create_class_use_ptr(class, name, members, class_scope, size);
}
Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 26 Starting parse_variable\n");
    Token* token = NULL;
    token = peek_current_token(lexer);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
        parser_error("Expected variable type", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 27 Finished parse_variable with error\n");
        return NULL;
    }
    Symbol* type = search_name(now_scope, token->lexeme);
    if (type != NULL) {
        Symbol* type_ptr = type;
        if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
            parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
    } else
        parser_error("Unknown variable type", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, true);
    if (token->type != IDENTIFIER)
        parser_error("Expected variable name", token, get_full_path(parser->source_file));
    Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
    Expression* value = NULL;
    token = peek_next_token(lexer, true);
    if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
        token = get_next_token(lexer, true);  // consume '='
        token = get_next_token(lexer, true);
        value = parse_expression(lexer, now_scope, parser);
        if (value == NULL)
            parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
    }
    // printf("[DEBUG] 28 Finished parse_variable\n");
    return create_variable(type, name, value);
}
Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 29 Starting parse_statement\n");
    Token* token = NULL;
    token = peek_current_token(lexer);
    Statement* statement = NULL;
    if (token->type == KEYWORD) {
        if (string_equal(token->lexeme, IF_KEYWORD))
            return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
        else if (string_equal(token->lexeme, FOR_KEYWORD))
            return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
        else if (string_equal(token->lexeme, WHILE_KEYWORD))
            return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
        else if (string_equal(token->lexeme, VAR_KEYWORD)) {
            get_next_token(lexer, true);
            statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
        } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
            token = get_next_token(lexer, true);
            if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
                // printf("[DEBUG] 30 Finished parse_statement\n");
                return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
            }
            statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
        } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
            if (!parser->in_loop) {
                parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
                // printf("[DEBUG] 31 Finished parse_statement with error\n");
                return NULL;
            }
            statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
            if (!parser->in_loop) {
                parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
                // printf("[DEBUG] 32 Finished parse_statement with error\n");
                return NULL;
            }
            statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else
            statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    } else
        statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    token = peek_current_token(lexer);
    if (statement == NULL)
        parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
    // printf("[DEBUG] 33 Finished parse_statement\n");
    return statement;
}
If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 34 Starting parse_if\n");
    Token* token = NULL;
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 35 Finished parse_if with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == NULL)
        parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 36 Finished parse_if with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 37 Finished parse_if with error\n");
        return NULL;
    }
    list(Statement*) body = create_list();
    token = get_next_token(lexer, true);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, true);
    }
    list(ElseIf*) else_if = create_list();
    list(Statement*) else_body = create_list();
    token = peek_next_token(lexer, true);
    while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
        token = get_next_token(lexer, true);  // consume 'elif'
        token = get_next_token(lexer, true);
        if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
            parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 38 Finished parse_if with error\n");
            return NULL;
        }
        token = get_next_token(lexer, true);
        Expression* elif_condition = parse_expression(lexer, now_scope, parser);
        if (elif_condition == NULL)
            parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, true);
        if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 39 Finished parse_if with error\n");
            return NULL;
        }
        token = get_next_token(lexer, true);
        if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
            parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 40 Finished parse_if with error\n");
            return NULL;
        }
        list(Statement*) elif_body = create_list();
        token = get_next_token(lexer, true);
        while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == NULL)
                parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
            list_append(elif_body, (pointer)statement);
            token = get_next_token(lexer, true);
        }
        list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
        token = peek_next_token(lexer, true);
    }
    if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
        token = get_next_token(lexer, true);  // consume 'else'
        token = get_next_token(lexer, true);
        if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
            parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 41 Finished parse_if with error\n");
            return NULL;
        }
        token = get_next_token(lexer, true);
        while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == NULL)
                parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
            list_append(else_body, (pointer)statement);
            token = get_next_token(lexer, true);
        }
    }
    token = peek_current_token(lexer);
    // printf("[DEBUG] 42 Finished parse_if\n");
    return create_if(condition, body, else_if, else_body);
}
For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 43 Starting parse_for\n");
    Token* token = NULL;
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 44 Finished parse_for with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    Variable* initializer = NULL;
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        initializer = parse_variable(lexer, now_scope, parser);
        if (initializer == NULL)
            parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, true);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 45 Finished parse_for with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    Expression* condition = NULL;
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        condition = parse_expression(lexer, now_scope, parser);
        if (condition == NULL)
            parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, true);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 46 Finished parse_for with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    Expression* increment = NULL;
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        increment = parse_expression(lexer, now_scope, parser);
        if (increment == NULL)
            parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, true);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 47 Finished parse_for with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 48 Finished parse_for with error\n");
        return NULL;
    }
    list(Statement*) body = create_list();
    parser->in_loop = true;
    token = get_next_token(lexer, true);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, true);
    }
    parser->in_loop = false;
    // printf("[DEBUG] 49 Finished parse_for\n");
    return create_for(initializer, condition, increment, body);
}
While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 50 Starting parse_while\n");
    Token* token = NULL;
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 51 Finished parse_while with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == NULL)
        parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 52 Finished parse_while with error\n");
        return NULL;
    }
    token = get_next_token(lexer, true);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 53 Finished parse_while with error\n");
        return NULL;
    }
    list(Statement*) body = create_list();
    parser->in_loop = true;
    token = get_next_token(lexer, true);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, true);
    }
    parser->in_loop = false;
    // printf("[DEBUG] 54 Finished parse_while\n");
    return create_while(condition, body);
}
static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 55 Starting parse_expr_prec\n");
    Token* token = NULL;
    token = peek_next_token(lexer, true);
    while (token->type == SYMBOL) {
        OperatorType op = string_to_operator(token->lexeme);
        int op_prec = operator_precedence(op);
        if (op == OP_NONE || op_prec < min_prec)
            break;
        token = get_next_token(lexer, true);  // consume operator
        token = get_next_token(lexer, true);
        Primary* right_primary = parse_primary(lexer, now_scope, parser);
        if (right_primary == NULL) {
            parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 56 Finished parse_expr_prec with error\n");
            return NULL;
        }
        Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
        token = peek_next_token(lexer, true);
        while (token->type == SYMBOL) {
            OperatorType next_op = string_to_operator(token->lexeme);
            int next_prec = operator_precedence(next_op);
            if (next_op == OP_NONE || next_prec <= op_prec)
                break;
            right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
            if (right == NULL) {
                // printf("[DEBUG] 57 Finished parse_expr_prec with error\n");
                return NULL;
            }
            token = peek_next_token(lexer, true);
        }
        expr_left = create_expression(op, expr_left, NULL, right);
        token = peek_next_token(lexer, true);
    }
    token = peek_current_token(lexer);
    // printf("[DEBUG] 58 Finished parse_expr_prec\n");
    return expr_left;
}
Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 59 Starting parse_expression\n");
    Primary* left_primary = parse_primary(lexer, now_scope, parser);
    if (left_primary == NULL) {
        parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
        // printf("[DEBUG] 60 Finished parse_expression with error\n");
        return NULL;
    }
    // printf("[DEBUG] 61 Finished parse_expression\n");
    return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
}
Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 62 Starting parse_primary\n");
    Token* token = NULL;
    token = peek_current_token(lexer);
    PrimaryType type;
    string str_value = NULL;
    Expression* expr_value = NULL;
    Primary* prim_value = NULL;
    VariableAccess* variable_value = NULL;
    if (token->type == INTEGER) {
        type = PRIM_INTEGER;
        str_value = token->lexeme;
    } else if (token->type == FLOAT) {
        type = PRIM_FLOAT;
        str_value = token->lexeme;
    } else if (token->type == STRING) {
        type = PRIM_STRING;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
        type = PRIM_TRUE;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
        type = PRIM_FALSE;
        str_value = token->lexeme;
    } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        type = PRIM_EXPRESSION;
        token = get_next_token(lexer, true);
        expr_value = parse_expression(lexer, now_scope, parser);
        if (expr_value == NULL) {
            parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 63 Finished parse_primary with error\n");
            return NULL;
        }
        token = get_next_token(lexer, true);
        if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 64 Finished parse_primary with error\n");
            return NULL;
        }
    } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
        type = PRIM_NOT_OPERAND;
        token = get_next_token(lexer, true);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == NULL) {
            parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 65 Finished parse_primary with error\n");
            return NULL;
        }
    } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
        type = PRIM_NEG_OPERAND;
        token = get_next_token(lexer, true);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == NULL) {
            parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 66 Finished parse_primary with error\n");
            return NULL;
        }
    } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
        type = PRIM_VARIABLE_ACCESS;
        variable_value = parse_variable_access(lexer, now_scope, parser);
        if (variable_value == NULL) {
            parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
            // printf("[DEBUG] 67 Finished parse_primary with error\n");
            return NULL;
        }
    } else {
        parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 68 Finished parse_primary with error\n");
        return NULL;
    }
    // printf("[DEBUG] 69 Finished parse_primary\n");
    return create_primary(type, str_value, expr_value, prim_value, variable_value);
}
VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    // printf("[DEBUG] 70 Starting parse_variable_access\n");
    Token* token = peek_current_token(lexer);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
        parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
        // printf("[DEBUG] 71 Finished parse_variable_access with error\n");
        return NULL;
    }
    Symbol* current_type = NULL;
    Symbol* base_name = NULL;
    SymbolTable* var_scope = NULL;
    base_name = search_name(now_scope, token->lexeme);
    VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
    token = peek_next_token(lexer, true);
    while (token->type == SYMBOL) {
        if (base_name != NULL) {
            current_type = base_name;     // class or type
            if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
                current_type = base_name->type;
        }
        if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
            var_scope = current_type->ast_node.class->class_scope;
        if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
            token = get_next_token(lexer, true);  // consume '('
            if (base_name == NULL)
                parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
            else if (base_name->kind == SYMBOL_CLASS) {
                string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
                base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
                base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
            }
            if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
                parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
            token = get_next_token(lexer, true);
            list(Expression*) args = create_list();
            while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
                Expression* arg = parse_expression(lexer, now_scope, parser);
                if (arg == NULL)
                    parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
                list_append(args, (pointer)arg);
                token = get_next_token(lexer, true);
                if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
                    token = get_next_token(lexer, true);
                else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
                    parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
                    // printf("[DEBUG] 72 Finished parse_variable_access with error\n");
                    return NULL;
                }
            }
            base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
            base_name = base_name->type;
            current_type = NULL;
            var_scope = NULL;
            if (base_name->kind == SYMBOL_CLASS)
                var_scope = base_name->ast_node.class->class_scope;
        } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
            token = get_next_token(lexer, true);  // consume '['
            token = get_next_token(lexer, true);
            Expression* index = parse_expression(lexer, now_scope, parser);
            if (index == NULL)
                parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
            token = get_next_token(lexer, true);
            if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
                parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
                // printf("[DEBUG] 73 Finished parse_variable_access with error\n");
                return NULL;
            }
            base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
        } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
            token = get_next_token(lexer, true);  // consume '.'
            token = get_next_token(lexer, true);
            if (var_scope == NULL) {
                parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
                // printf("[DEBUG] 74 Finished parse_variable_access with error\n");
                return NULL;
            }
            if (token->type != IDENTIFIER) {
                parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
                // printf("[DEBUG] 75 Finished parse_variable_access with error\n");
                return NULL;
            }
            base_name = search_name(var_scope, token->lexeme);
            if (base_name == NULL) {
                string class_name = NULL;
                if (current_type != NULL) {
                    if (current_type->kind == SYMBOL_CLASS)
                        class_name = current_type->name;
                    else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
                        class_name = current_type->type->name;
                }
                string name = make_method_name(class_name, token->lexeme);
                base_name = search_name_use_strcmp(var_scope, name);
            }
            if (base_name == NULL) {
                parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
                // printf("[DEBUG] 76 Finished parse_variable_access with error\n");
                return NULL;
            }
            base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
            current_type = NULL;
            var_scope = NULL;
        } else
            break;
        token = peek_next_token(lexer, true);
    }
    // printf("[DEBUG] 77 Finished parse_variable_access\n");
    return base;
}
