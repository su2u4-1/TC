#include "parser.h"

#include "create.h"
#include "helper.h"

// parser functions
// `static Code* parse_code(Lexer* lexer)`
static offset(Code*) parse_code(offset(Lexer*) lexer);
// `static Import* parse_import(Lexer* lexer)`
static offset(Import*) parse_import(offset(Lexer*) lexer);
// `static Function* parse_function(Lexer* lexer)`
static offset(Function*) parse_function(offset(Lexer*) lexer);
// `static Method* parse_method(Lexer* lexer)`
static offset(Method*) parse_method(offset(Lexer*) lexer);
// `static Class* parse_class(Lexer* lexer)`
static offset(Class*) parse_class(offset(Lexer*) lexer);
// `static Variable* parse_variable(Lexer* lexer)`
static offset(Variable*) parse_variable(offset(Lexer*) lexer);
// `static Statement* parse_statement(Lexer* lexer)`
static offset(Statement*) parse_statement(offset(Lexer*) lexer);
// `static If* parse_if(Lexer* lexer)`
static offset(If*) parse_if(offset(Lexer*) lexer);
// `static For* parse_for(Lexer* lexer)`
static offset(For*) parse_for(offset(Lexer*) lexer);
// `static While* parse_while(Lexer* lexer)`
static offset(While*) parse_while(offset(Lexer*) lexer);
// `static Expression* parse_expression(Lexer* lexer)`
static offset(Expression*) parse_expression(offset(Lexer*) lexer);
// `static Primary* parse_primary(Lexer* lexer)`
static offset(Primary*) parse_primary(offset(Lexer*) lexer);
// `static VariableAccess* parse_variable_access(Lexer* lexer)`
static offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer);

offset(Code*) parse_code(offset(Lexer*) lexer) {
    list(CodeMember*) members = create_list();
    offset(Scope*) global_scope = create_scope(0);
    next_token(lexer);
    while (token != 0 && token_ptr->type != EOF_TOKEN) {
        if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
            offset(Import*) import = parse_import(lexer);
            if (import == 0)
                parser_error("Failed to parse import statement", token);
            list_append(members, create_code_member(CODE_IMPORT, import));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
            offset(Function*) function = parse_function(lexer);
            if (function == 0)
                parser_error("Failed to parse function declaration", token);
            list_append(members, create_code_member(CODE_FUNCTION, function));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
            offset(Class*) class_ = parse_class(lexer);
            if (class_ == 0)
                parser_error("Failed to parse class declaration", token);
            list_append(members, create_code_member(CODE_CLASS, class_));
        } else
            parser_error("Unexpected token in code member", token);
        next_token(lexer);
    }
    return create_code(members, global_scope);
}
offset(Import*) parse_import(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected identifier after 'import'", token);
    string name = token_ptr->lexeme;
    string source = 0;
    next_token(lexer);
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
        next_token(lexer);
        if (token_ptr->type != STRING)
            return parser_error("Expected string literal after 'from'", token);
        source = token_ptr->lexeme;
        next_token(lexer);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        return parser_error("Expected ';' at end of import statement", token);
    return create_import(name, source);
}
offset(Function*) parse_function(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        return parser_error("Expected function return type after 'func'", token);
    string return_type = token_ptr->lexeme;
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected function name after return type", token);
    string name = token_ptr->lexeme;
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after function name", token);
    next_token(lexer);
    list(Variable*) parameters = create_list();
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        offset(Variable*) parameter = parse_variable(lexer);
        if (parameter == 0)
            parser_error("Failed to parse function parameter", token);
        else if (((Variable*)offset_to_ptr(parameter))->value != 0)
            parser_error("Function parameters cannot have default values", token);
        else
            list_append(parameters, parameter);
        next_token(lexer);
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL))
            next_token(lexer);
        else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ',' or ')' after function parameter", token);
    }
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start function body", token);
    list(Statement*) body = create_list();
    offset(Scope*) function_scope = create_scope(0);
    in_function = true;
    bool have_return = false;
    next_token(lexer);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer);
        if (statement == 0)
            parser_error("Failed to parse function body statement", token);
        else if (have_return)
            parser_error("Unreachable code after return statement", token);
        if (((Statement*)offset_to_ptr(statement))->type == RETURN_STATEMENT)
            have_return = true;
        list_append(body, statement);
        next_token(lexer);
    }
    in_function = false;
    if (!have_return && !string_equal(return_type, VOID_KEYWORD))
        parser_error("Function missing return statement", token);
    return create_function(name, return_type, parameters, body, function_scope);
}
offset(Method*) parse_method(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        return parser_error("Expected method return type after 'method'", token);
    string return_type = token_ptr->lexeme;
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected method name after return type", token);
    string name = token_ptr->lexeme;
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after method name", token);
    next_token(lexer);
    if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
        parser_error("Expected 'self' as first parameter of method", token);
    next_token(lexer);
    list(Variable*) parameters = create_list();
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL))
            next_token(lexer);
        else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            break;
        else
            return parser_error("Expected ',' or ')' after method parameter", token);
        offset(Variable*) parameter = parse_variable(lexer);
        if (parameter == 0)
            parser_error("Failed to parse method parameter", token);
        else if (((Variable*)offset_to_ptr(parameter))->value != 0)
            parser_error("Method parameters cannot have default values", token);
        else
            list_append(parameters, parameter);
        next_token(lexer);
    }
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start method body", token);
    list(Statement*) body = create_list();
    offset(Scope*) method_scope = create_scope(0);
    in_function = true;
    in_method = true;
    bool have_return = false;
    next_token(lexer);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer);
        if (statement == 0)
            parser_error("Failed to parse method body statement", token);
        else if (have_return)
            parser_error("Unreachable code after return statement", token);
        if (((Statement*)offset_to_ptr(statement))->type == RETURN_STATEMENT)
            have_return = true;
        list_append(body, statement);
        next_token(lexer);
    }
    in_function = false;
    in_method = false;
    if (!have_return && !string_equal(return_type, VOID_KEYWORD))
        parser_error("Method missing return statement", token);
    return create_method(name, return_type, parameters, body, method_scope);
}
offset(Class*) parse_class(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected class name after 'class'", token);
    string name = token_ptr->lexeme;
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start class body", token);
    list(ClassMember*) members = create_list();
    offset(Scope*) class_scope = create_scope(0);
    next_token(lexer);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
            offset(Method*) method = parse_method(lexer);
            if (method == 0)
                parser_error("Failed to parse class method", token);
            list_append(members, create_class_member(CLASS_METHOD, method));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            next_token(lexer);
            offset(Variable*) variable = parse_variable(lexer);
            if (variable == 0)
                parser_error("Failed to parse class variable", token);
            list_append(members, create_class_member(CLASS_VARIABLE, variable));
            next_token(lexer);
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
                parser_error("Expected ';' after class variable declaration", token);
        } else
            parser_error("Unexpected token in class member", token);
        next_token(lexer);
    }
    return create_class(name, members, class_scope);
}
offset(Variable*) parse_variable(offset(Lexer*) lexer) {
    peek_current_token();
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        return parser_error("Expected variable type", token);
    string type = token_ptr->lexeme;
    next_token(lexer);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected variable name", token);
    string name = token_ptr->lexeme;
    offset(Expression*) value = 0;
    peek_token(lexer);
    if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
        next_token(lexer);  // consume '='
        next_token(lexer);
        value = parse_expression(lexer);
        if (value == 0)
            parser_error("Failed to parse variable initializer", token);
    }
    return create_variable(type, name, value);
}
offset(Statement*) parse_statement(offset(Lexer*) lexer) {
    peek_current_token();
    offset(Statement*) statement = 0;
    if (token_ptr->type == KEYWORD) {
        if (string_equal(token_ptr->lexeme, IF_KEYWORD))
            return create_statement(IF_STATEMENT, parse_if(lexer));
        else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
            return create_statement(FOR_STATEMENT, parse_for(lexer));
        else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
            return create_statement(WHILE_STATEMENT, parse_while(lexer));
        else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            next_token(lexer);
            statement = create_statement(VARIABLE_STATEMENT, parse_variable(lexer));
        } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
            next_token(lexer);
            statement = create_statement(RETURN_STATEMENT, parse_expression(lexer));
        } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
            if (!in_loop)
                return parser_error("Cannot use 'break' outside of a loop", token);
            statement = create_statement(BREAK_STATEMENT, 0);
        } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
            if (!in_loop)
                return parser_error("Cannot use 'continue' outside of a loop", token);
            statement = create_statement(CONTINUE_STATEMENT, 0);
        } else
            statement = create_statement(EXPRESSION_STATEMENT, parse_expression(lexer));
    } else
        statement = create_statement(EXPRESSION_STATEMENT, parse_expression(lexer));
    if (statement == 0)
        parser_error("Failed to parse statement", token);
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' after statement", token);
    return statement;
}
offset(If*) parse_if(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'if'", token);
    next_token(lexer);
    offset(Expression*) condition = parse_expression(lexer);
    if (condition == 0)
        parser_error("Failed to parse if condition", token);
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after if condition", token);
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start if body", token);
    list(Statement*) body = create_list();
    next_token(lexer);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer);
        if (statement == 0)
            parser_error("Failed to parse if body statement", token);
        list_append(body, statement);
        next_token(lexer);
    }
    list(ElseIf*) else_if = create_list();
    list(Statement*) else_body = create_list();
    peek_token(lexer);
    while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
        next_token(lexer);  // consume 'elif'
        next_token(lexer);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
            return parser_error("Expected '(' after 'elif'", token);
        next_token(lexer);
        offset(Expression*) elif_condition = parse_expression(lexer);
        if (elif_condition == 0)
            parser_error("Failed to parse else-if condition", token);
        next_token(lexer);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ')' after else-if condition", token);
        next_token(lexer);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
            return parser_error("Expected '{' to start else-if body", token);
        list(Statement*) elif_body = create_list();
        next_token(lexer);
        while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
            offset(Statement*) statement = parse_statement(lexer);
            if (statement == 0)
                parser_error("Failed to parse else-if body statement", token);
            list_append(elif_body, statement);
            next_token(lexer);
        }
        list_append(else_if, create_else_if(elif_condition, elif_body));
        peek_token(lexer);
    }
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
        next_token(lexer);  // consume 'else'
        next_token(lexer);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
            return parser_error("Expected '{' to start else body", token);
        next_token(lexer);
        while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
            offset(Statement*) statement = parse_statement(lexer);
            if (statement == 0)
                parser_error("Failed to parse else body statement", token);
            list_append(else_body, statement);
            next_token(lexer);
        }
    }
    peek_current_token();
    return create_if(condition, body, else_if, else_body);
}
offset(For*) parse_for(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'for'", token);
    next_token(lexer);
    offset(Variable*) initializer = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        initializer = parse_variable(lexer);
        if (initializer == 0)
            parser_error("Failed to parse for loop initializer", token);
        next_token(lexer);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        return parser_error("Expected ';' after for loop initializer", token);
    next_token(lexer);
    offset(Expression*) condition = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        condition = parse_expression(lexer);
        if (condition == 0)
            parser_error("Failed to parse for loop condition", token);
        next_token(lexer);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        return parser_error("Expected ';' after for loop condition", token);
    next_token(lexer);
    offset(Expression*) increment = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        increment = parse_expression(lexer);
        if (increment == 0)
            parser_error("Failed to parse for loop increment", token);
        next_token(lexer);
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after for loop increment", token);
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start for loop body", token);
    list(Statement*) body = create_list();
    in_loop = true;
    next_token(lexer);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer);
        if (statement == 0)
            parser_error("Failed to parse for loop body statement", token);
        list_append(body, statement);
        next_token(lexer);
    }
    in_loop = false;
    return create_for(initializer, condition, increment, body);
}
offset(While*) parse_while(offset(Lexer*) lexer) {
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'while'", token);
    next_token(lexer);
    offset(Expression*) condition = parse_expression(lexer);
    if (condition == 0)
        parser_error("Failed to parse while condition", token);
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after while condition", token);
    next_token(lexer);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start while body", token);
    list(Statement*) body = create_list();
    in_loop = true;
    next_token(lexer);
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) statement = parse_statement(lexer);
        if (statement == 0)
            parser_error("Failed to parse while body statement", token);
        list_append(body, statement);
        next_token(lexer);
    }
    in_loop = false;
    return create_while(condition, body);
}
static offset(Expression*) parse_expr_prec(offset(Lexer*) lexer, offset(Expression*) left, int min_prec) {
    while ((void)(peek_token(lexer)), token_ptr->type == SYMBOL) {
        OperatorType op = string_to_operator(token_ptr->lexeme);
        int op_prec = operator_precedence(op);
        if (op == OP_NONE || op_prec < min_prec)
            break;
        next_token(lexer);  // consume operator
        next_token(lexer);
        offset(Primary*) right_primary = parse_primary(lexer);
        if (right_primary == 0)
            return parser_error("Failed to parse right operand", token);
        offset(Expression*) right = create_expression(OP_NONE, right_primary, 0);
        while ((void)(peek_token(lexer)), token_ptr->type == SYMBOL) {
            OperatorType next_op = string_to_operator(token_ptr->lexeme);
            int next_prec = operator_precedence(next_op);
            if (next_op == OP_NONE || next_prec <= op_prec)
                break;
            right = parse_expr_prec(lexer, right, next_prec);
            if (right == 0)
                return 0;
        }
        left = create_expression(op, left, right);
    }
    peek_current_token();
    return left;
}
offset(Expression*) parse_expression(offset(Lexer*) lexer) {
    offset(Primary*) left_primary = parse_primary(lexer);
    if (left_primary == 0)
        return parser_error("Failed to parse expression primary", token);
    return parse_expr_prec(lexer, create_expression(OP_NONE, left_primary, 0), 0);
}
offset(Primary*) parse_primary(offset(Lexer*) lexer) {
    peek_current_token();
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
        next_token(lexer);
        value = parse_expression(lexer);
        if (value == 0)
            return parser_error("Failed to parse parenthesized expression", token);
        next_token(lexer);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ')' after expression", token);
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
        type = PRIM_NOT_OPERAND;
        next_token(lexer);
        value = parse_primary(lexer);
        if (value == 0)
            return parser_error("Failed to parse operand of unary '!'", token);
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
        type = PRIM_NEG_OPERAND;
        next_token(lexer);
        value = parse_primary(lexer);
        if (value == 0)
            return parser_error("Failed to parse operand of unary '-'", token);
    } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
        type = PRIM_VARIABLE_ACCESS;
        value = parse_variable_access(lexer);
        if (value == 0)
            return parser_error("Failed to parse variable access", token);
    } else
        return parser_error("Unexpected token in primary expression", token);
    return create_primary(type, value);
}
offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer) {
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD)))
        return parser_error("Expected variable name in variable access", token);
    offset(VariableAccess*) base = create_variable_access(VAR_NAME, 0, token_ptr->lexeme);
    peek_token(lexer);
    while (token_ptr->type == SYMBOL) {
        if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
            next_token(lexer);  // consume '('
            next_token(lexer);
            list(Expression*) args = create_list();
            while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
                offset(Expression*) arg = parse_expression(lexer);
                if (arg == 0)
                    parser_error("Failed to parse function call argument", token);
                list_append(args, arg);
                next_token(lexer);
                if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL))
                    next_token(lexer);
                else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
                    return parser_error("Expected ',' or ')' after function call argument", token);
            }
            base = create_variable_access(VAR_FUNC_CALL, base, args);
        } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
            next_token(lexer);  // consume '['
            next_token(lexer);
            offset(Expression*) index = parse_expression(lexer);
            if (index == 0)
                parser_error("Failed to parse sequence index", token);
            next_token(lexer);
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL))
                return parser_error("Expected ']' after sequence index", token);
            base = create_variable_access(VAR_GET_SEQ, base, index);
        } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
            next_token(lexer);  // consume '.'
            next_token(lexer);
            if (token_ptr->type != IDENTIFIER)
                return parser_error("Expected attribute name after '.'", token);
            base = create_variable_access(VAR_GET_ATTR, base, token_ptr->lexeme);
        } else
            break;
        peek_token(lexer);
    }
    return base;
}

// public functions
offset(Code*) parser(offset(Lexer*) lexer) {
    return parse_code(lexer);
}
