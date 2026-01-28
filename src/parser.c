#include "parser.h"

#include "create.h"
#include "helper.h"
#include "lexer.h"

// parser functions
// `static Import* parse_import(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Import*) parse_import(offset(Lexer*) lexer, offset(Scope*) now_scope);
// `static Function* parse_function(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Function*) parse_function(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static Method* parse_method(Lexer* lexer, Scope* now_scope, Name* class_name, Parser* parser)`
static offset(Method*) parse_method(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Name*) class_name, offset(Parser*) parser);
// `static Class* parse_class(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Class*) parse_class(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static Variable* parse_variable(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Variable*) parse_variable(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static Statement* parse_statement(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Statement*) parse_statement(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static If* parse_if(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(If*) parse_if(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static For* parse_for(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(For*) parse_for(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static While* parse_while(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(While*) parse_while(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static Expression* parse_expression(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Expression*) parse_expression(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static Primary* parse_primary(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(Primary*) parse_primary(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);
// `static VariableAccess* parse_variable_access(Lexer* lexer, Scope* now_scope, Parser* parser)`
static offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser);

static offset(Name*) name_void = 0;
static offset(Name*) name_int = 0;
static offset(Name*) name_float = 0;
static offset(Name*) name_string = 0;
static offset(Name*) name_bool = 0;

offset(Code*) parse_code(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_code\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    list(CodeMember*) members = create_list();
    offset(Scope*) global_scope = create_scope(now_scope);
    name_void = create_name(VOID_KEYWORD, NAME_TYPE, 0, global_scope);
    name_int = create_name(INT_KEYWORD, NAME_TYPE, 0, global_scope);
    name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, 0, global_scope);
    name_string = create_name(STRING_KEYWORD, NAME_TYPE, 0, global_scope);
    name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, 0, global_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token != 0 && token_ptr->type != EOF_TOKEN) {
        if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
            offset(Import*) import = parse_import(lexer, global_scope);
            if (import == 0)
                parser_error("Failed to parse import statement", token);
            list_append(members, create_code_member(CODE_IMPORT, import));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
            offset(Function*) function = parse_function(lexer, global_scope, parser);
            if (function == 0)
                parser_error("Failed to parse function declaration", token);
            list_append(members, create_code_member(CODE_FUNCTION, function));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
            offset(Class*) class_ = parse_class(lexer, global_scope, parser);
            if (class_ == 0)
                parser_error("Failed to parse class declaration", token);
            list_append(members, create_code_member(CODE_CLASS, class_));
        } else
            parser_error("Unexpected token in code member", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    return create_code(members, global_scope);
}
offset(Import*) parse_import(offset(Lexer*) lexer, offset(Scope*) now_scope) {
#ifdef DEBUG
    fprintf(stderr, "into parse_import\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected identifier after 'import'", token);
    string import_name = token_ptr->lexeme;
    string source = 0;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != STRING)
            return parser_error("Expected string literal after 'from'", token);
        source = token_ptr->lexeme;
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        return parser_error("Expected ';' at end of import statement", token);
    offset(Name*) name;
    if (strcmp(string_to_cstr(source), "std") == 0) {
        name = parse_import_std(import_name, now_scope);
        if (name == 0)
            name = create_name(import_name, NAME_VARIABLE, name_void, now_scope);
    } else
        name = create_name(import_name, NAME_VARIABLE, name_void, now_scope);
    return create_import(name, source);
}
offset(Function*) parse_function(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_function\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    offset(Scope*) function_scope = create_scope(now_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        return parser_error("Expected function return type after 'func'", token);
    offset(Name*) return_type = search(now_scope, token_ptr->lexeme);
    if (return_type == 0)
        return parser_error("Unknown function return type", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected function name after return type", token);
    offset(Name*) name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, now_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after function name", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    list(Variable*) parameters = create_list();
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        offset(Variable*) parameter = parse_variable(lexer, function_scope, parser);
        if (parameter == 0)
            parser_error("Failed to parse function parameter", token);
        else if (((Variable*)offset_to_ptr(parameter))->value != 0)
            parser_error("Function parameters cannot have default values", token);
        else
            list_append(parameters, parameter);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
        } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) return parser_error("Expected ',' or ')' after function parameter", token);
    }
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start function body", token);
    list(Statement*) body = create_list();
    ((Parser*)offset_to_ptr(parser))->in_function = true;
    bool have_return = false;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer, function_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse function body statement", token);
        else if (have_return)
            parser_error("Unreachable code after return statement", token);
        if (((Statement*)offset_to_ptr(statement))->type == RETURN_STATEMENT)
            have_return = true;
        list_append(body, statement);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    ((Parser*)offset_to_ptr(parser))->in_function = false;
    if (!have_return && !string_equal(return_type, VOID_KEYWORD))
        parser_error("Function missing return statement", token);
    return create_function(name, return_type, parameters, body, function_scope);
}
offset(Method*) parse_method(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Name*) class_name, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_method\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    offset(Scope*) method_scope = create_scope(now_scope);
    offset(Name*) self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, method_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        return parser_error("Expected method return type after 'method'", token);
    offset(Name*) return_type = search(now_scope, token_ptr->lexeme);
    if (return_type == 0)
        return parser_error("Unknown return type for method", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected method name after return type", token);
    offset(Name*) name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, now_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after method name", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
        parser_error("Expected 'self' as first parameter of method", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    list(Variable*) parameters = create_list();
    list_append(parameters, create_variable(class_name, self, 0));
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
        } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
        else return parser_error("Expected ',' or ')' after method parameter", token);
        offset(Variable*) parameter = parse_variable(lexer, method_scope, parser);
        if (parameter == 0)
            parser_error("Failed to parse method parameter", token);
        else if (((Variable*)offset_to_ptr(parameter))->value != 0)
            parser_error("Method parameters cannot have default values", token);
        else
            list_append(parameters, parameter);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start method body", token);
    list(Statement*) body = create_list();
    ((Parser*)offset_to_ptr(parser))->in_function = true;
    ((Parser*)offset_to_ptr(parser))->in_method = true;
    bool have_return = false;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer, method_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse method body statement", token);
        else if (have_return)
            parser_error("Unreachable code after return statement", token);
        if (((Statement*)offset_to_ptr(statement))->type == RETURN_STATEMENT)
            have_return = true;
        list_append(body, statement);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    ((Parser*)offset_to_ptr(parser))->in_function = false;
    ((Parser*)offset_to_ptr(parser))->in_method = false;
    if (!have_return && return_type != name_void)
        parser_error("Method missing return statement", token);
    return create_method(name, return_type, parameters, body, method_scope);
}
offset(Class*) parse_class(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_class\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    offset(Scope*) class_scope = create_scope(now_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected class name after 'class'", token);
    offset(Name*) name = create_name(token_ptr->lexeme, NAME_CLASS, class_scope, now_scope);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start class body", token);
    list(ClassMember*) members = create_list();
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
            offset(Method*) method = parse_method(lexer, class_scope, name, parser);
            if (method == 0)
                parser_error("Failed to parse class method", token);
            list_append(members, create_class_member(CLASS_METHOD, method));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            offset(Variable*) variable = parse_variable(lexer, class_scope, parser);
            if (variable == 0)
                parser_error("Failed to parse class variable", token);
            list_append(members, create_class_member(CLASS_VARIABLE, variable));
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
                parser_error("Expected ';' after class variable declaration", token);
        } else
            parser_error("Unexpected token in class member", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    return create_class(name, members, class_scope);
}
offset(Variable*) parse_variable(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_variable\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = peek_current_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        return parser_error("Expected variable type", token);
    offset(Name*) type = search(now_scope, token_ptr->lexeme);
    if (type != 0) {
        Name* type_ptr = (Name*)offset_to_ptr(type);
        if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
            parser_error("Expected a type for variable declaration", token);
    } else
        parser_error("Unknown variable type", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        parser_error("Expected variable name", token);
    offset(Name*) name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, now_scope);
    offset(Expression*) value = 0;
    token = peek_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
        token = get_next_token(lexer, true);  // consume '='
        token_ptr = (Token*)offset_to_ptr(token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        value = parse_expression(lexer, now_scope, parser);
        if (value == 0)
            parser_error("Failed to parse variable initializer", token);
    }
    return create_variable(type, name, value);
}
offset(Statement*) parse_statement(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_statement\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = peek_current_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) statement = 0;
    if (token_ptr->type == KEYWORD) {
        if (string_equal(token_ptr->lexeme, IF_KEYWORD))
            return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser));
        else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
            return create_statement(FOR_STATEMENT, parse_for(lexer, now_scope, parser));
        else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
            return create_statement(WHILE_STATEMENT, parse_while(lexer, now_scope, parser));
        else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            get_next_token(lexer, true);
            statement = create_statement(VARIABLE_STATEMENT, parse_variable(lexer, now_scope, parser));
        } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            statement = create_statement(RETURN_STATEMENT, parse_expression(lexer, now_scope, parser));
        } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
            if (!(((Parser*)offset_to_ptr(parser))->in_loop))
                return parser_error("Cannot use 'break' outside of a loop", token);
            statement = create_statement(BREAK_STATEMENT, 0);
        } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
            if (!(((Parser*)offset_to_ptr(parser))->in_loop))
                return parser_error("Cannot use 'continue' outside of a loop", token);
            statement = create_statement(CONTINUE_STATEMENT, 0);
        } else
            statement = create_statement(EXPRESSION_STATEMENT, parse_expression(lexer, now_scope, parser));
    } else
        statement = create_statement(EXPRESSION_STATEMENT, parse_expression(lexer, now_scope, parser));
    token = peek_current_token(lexer);
    if (statement == 0)
        parser_error("Failed to parse statement", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' after statement", token);
    return statement;
}
offset(If*) parse_if(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_if\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'if'", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Expression*) condition = parse_expression(lexer, now_scope, parser);
    if (condition == 0)
        parser_error("Failed to parse if condition", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after if condition", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start if body", token);
    list(Statement*) body = create_list();
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer, now_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse if body statement", token);
        list_append(body, statement);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    list(ElseIf*) else_if = create_list();
    list(Statement*) else_body = create_list();
    token = peek_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
        token = get_next_token(lexer, true);  // consume 'elif'
        token_ptr = (Token*)offset_to_ptr(token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
            return parser_error("Expected '(' after 'elif'", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        offset(Expression*) elif_condition = parse_expression(lexer, now_scope, parser);
        if (elif_condition == 0)
            parser_error("Failed to parse else-if condition", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ')' after else-if condition", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
            return parser_error("Expected '{' to start else-if body", token);
        list(Statement*) elif_body = create_list();
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
            offset(Statement*) statement = parse_statement(lexer, now_scope, parser);
            if (statement == 0)
                parser_error("Failed to parse else-if body statement", token);
            list_append(elif_body, statement);
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
        }
        list_append(else_if, create_else_if(elif_condition, elif_body));
        token = peek_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
        token = get_next_token(lexer, true);  // consume 'else'
        token_ptr = (Token*)offset_to_ptr(token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
            return parser_error("Expected '{' to start else body", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
            offset(Statement*) statement = parse_statement(lexer, now_scope, parser);
            if (statement == 0)
                parser_error("Failed to parse else body statement", token);
            list_append(else_body, statement);
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
        }
    }
    token = peek_current_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    return create_if(condition, body, else_if, else_body);
}
offset(For*) parse_for(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_for\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'for'", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Variable*) initializer = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        initializer = parse_variable(lexer, now_scope, parser);
        if (initializer == 0)
            parser_error("Failed to parse for loop initializer", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        return parser_error("Expected ';' after for loop initializer", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Expression*) condition = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        condition = parse_expression(lexer, now_scope, parser);
        if (condition == 0)
            parser_error("Failed to parse for loop condition", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        return parser_error("Expected ';' after for loop condition", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Expression*) increment = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        increment = parse_expression(lexer, now_scope, parser);
        if (increment == 0)
            parser_error("Failed to parse for loop increment", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after for loop increment", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start for loop body", token);
    list(Statement*) body = create_list();
    ((Parser*)offset_to_ptr(parser))->in_loop = true;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer, now_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse for loop body statement", token);
        list_append(body, statement);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    ((Parser*)offset_to_ptr(parser))->in_loop = false;
    return create_for(initializer, condition, increment, body);
}
offset(While*) parse_while(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_while\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'while'", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Expression*) condition = parse_expression(lexer, now_scope, parser);
    if (condition == 0)
        parser_error("Failed to parse while condition", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after while condition", token);
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start while body", token);
    list(Statement*) body = create_list();
    ((Parser*)offset_to_ptr(parser))->in_loop = true;
    token = get_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer, now_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse while body statement", token);
        list_append(body, statement);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    ((Parser*)offset_to_ptr(parser))->in_loop = false;
    return create_while(condition, body);
}
static offset(Expression*) parse_expr_prec(offset(Lexer*) lexer, offset(Expression*) left, int min_prec, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_expr_prec\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = peek_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type == SYMBOL) {
        OperatorType op = string_to_operator(token_ptr->lexeme);
        int op_prec = operator_precedence(op);
        if (op == OP_NONE || op_prec < min_prec)
            break;
        token = get_next_token(lexer, true);  // consume operator
        token_ptr = (Token*)offset_to_ptr(token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        offset(Primary*) right_primary = parse_primary(lexer, now_scope, parser);
        if (right_primary == 0)
            return parser_error("Failed to parse right operand", token);
        offset(Expression*) right = create_expression(OP_NONE, right_primary, 0);
        token = peek_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        while (token_ptr->type == SYMBOL) {
            OperatorType next_op = string_to_operator(token_ptr->lexeme);
            int next_prec = operator_precedence(next_op);
            if (next_op == OP_NONE || next_prec <= op_prec)
                break;
            right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
            if (right == 0)
                return 0;
            token = peek_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
        }
        left = create_expression(op, left, right);
        token = peek_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    token = peek_current_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    return left;
}
offset(Expression*) parse_expression(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_expression\n");
#endif
    offset(Primary*) left_primary = parse_primary(lexer, now_scope, parser);
    if (left_primary == 0)
        return parser_error("Failed to parse expression primary", peek_current_token(lexer));
    return parse_expr_prec(lexer, create_expression(OP_NONE, left_primary, 0), 0, now_scope, parser);
}
offset(Primary*) parse_primary(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_primary\n");
#endif
    offset(Token*) token = 0;
    Token* token_ptr = NULL;
    token = peek_current_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    PrimaryType type;
    offset(string | Expression * | Primary * | VariableAccess*) value = 0;
    if (token_ptr->type == INTEGER) {
        type = PRIM_INTEGER;
        value = token_ptr->lexeme;
    } else if (token_ptr->type == FLOAT) {
        type = PRIM_FLOAT;
        value = token_ptr->lexeme;
    } else if (token_ptr->type == STRING) {
        type = PRIM_STRING;
        value = token_ptr->lexeme;
    } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
        type = PRIM_TRUE;
        value = token_ptr->lexeme;
    } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
        type = PRIM_FALSE;
        value = token_ptr->lexeme;
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        type = PRIM_EXPRESSION;
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        value = parse_expression(lexer, now_scope, parser);
        if (value == 0)
            return parser_error("Failed to parse parenthesized expression", token);
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ')' after expression", token);
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
        type = PRIM_NOT_OPERAND;
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        value = parse_primary(lexer, now_scope, parser);
        if (value == 0)
            return parser_error("Failed to parse operand of unary '!'", token);
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
        type = PRIM_NEG_OPERAND;
        token = get_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
        value = parse_primary(lexer, now_scope, parser);
        if (value == 0)
            return parser_error("Failed to parse operand of unary '-'", token);
    } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((Parser*)offset_to_ptr(parser))->in_method)) {
        type = PRIM_VARIABLE_ACCESS;
        value = parse_variable_access(lexer, now_scope, parser);
        if (value == 0)
            return parser_error("Failed to parse variable access", token);
    } else
        return parser_error("Unexpected token in primary expression", token);
    return create_primary(type, value);
}
offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer, offset(Scope*) now_scope, offset(Parser*) parser) {
#ifdef DEBUG
    fprintf(stderr, "into parse_variable_access\n");
#endif
    offset(Token*) token = peek_current_token(lexer);
    Token* token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD)))
        return parser_error("Expected variable name in variable access", token);
    offset(Name*) current_type = 0;
    offset(Name*) base_name = 0;
    offset(Scope*) var_scope = 0;
    Name* base_name_ptr = NULL;
    base_name = search(now_scope, token_ptr->lexeme);
    offset(VariableAccess*) base = create_variable_access(VAR_NAME, 0, base_name);
    token = peek_next_token(lexer, true);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type == SYMBOL) {
        if (base_name != 0) {
            base_name_ptr = (Name*)offset_to_ptr(base_name);
            if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
                current_type = base_name_ptr->info.type;
            else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
                current_type = base_name;
        }
        if (var_scope == 0 && current_type != 0) {
            Name* type_ptr = (Name*)offset_to_ptr(current_type);
            if (type_ptr->kind == NAME_CLASS)
                var_scope = type_ptr->info.scope;
        }
        if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
            token = get_next_token(lexer, true);  // consume '('
            token_ptr = (Token*)offset_to_ptr(token);
            if (base_name == 0)
                parser_error("Cannot call undefined variable", token);
            base_name_ptr = (Name*)offset_to_ptr(base_name);
            if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
                parser_error("Cannot call non-function variable", token);
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            list(Expression*) args = create_list();
            while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
                offset(Expression*) arg = parse_expression(lexer, now_scope, parser);
                if (arg == 0)
                    parser_error("Failed to parse function call argument", token);
                list_append(args, arg);
                token = get_next_token(lexer, true);
                token_ptr = (Token*)offset_to_ptr(token);
                if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
                    token = get_next_token(lexer, true);
                    token_ptr = (Token*)offset_to_ptr(token);
                } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) return parser_error("Expected ',' or ')' after function call argument", token);
            }
            base = create_variable_access(VAR_FUNC_CALL, base, args);
            base_name = base_name_ptr->info.type;
            current_type = 0;
            var_scope = 0;
        } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
            token = get_next_token(lexer, true);  // consume '['
            token_ptr = (Token*)offset_to_ptr(token);
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            offset(Expression*) index = parse_expression(lexer, now_scope, parser);
            if (index == 0)
                parser_error("Failed to parse sequence index", token);
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL))
                return parser_error("Expected ']' after sequence index", token);
            base = create_variable_access(VAR_GET_SEQ, base, index);
        } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
            token = get_next_token(lexer, true);  // consume '.'
            token_ptr = (Token*)offset_to_ptr(token);
            token = get_next_token(lexer, true);
            token_ptr = (Token*)offset_to_ptr(token);
            if (var_scope == 0)
                return parser_error("Cannot access attribute without a valid scope", token);
            if (token_ptr->type != IDENTIFIER)
                return parser_error("Expected attribute name after '.'", token);
            base_name = search(var_scope, token_ptr->lexeme);
            if (base_name == 0)
                return parser_error("Unknown attribute name", token);
            base = create_variable_access(VAR_GET_ATTR, base, base_name);
            current_type = 0;
            var_scope = 0;
        } else
            break;
        token = peek_next_token(lexer, true);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    return base;
}
