#include "parser.h"

#include "ast.h"
#include "lexer.h"
#include "lib.h"

#define parser_error(message, token) fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s\n", file_full_path(parser->file), token->line + 1, token->column + 1, message)

Parser* create_parser(Lexer* lexer) {
    lexer->skip_comment = true;
    Parser* parser = create_struct(Parser);
    parser->lexer = lexer;
    parser->import_files = list_create();
    parser->file = lexer->source_path;
    parser->parse_import = false;
    return parser;
}

static CodeMember* create_code_member(CodeMemberType type, pointer member);
static Import* parse_import(Parser* parser);
static Class* parse_class(Parser* parser);
static Function* parse_function(Parser* parser);

AST* parse_code(Parser* parser) {
    AST* ast = create_struct(AST);
    ast->members = list_create();
    ast->file = parser->file;
    Token* token = get_next_token(parser->lexer);
    while (token != NULL && token->type != TOKEN_EOF) {
        if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IMPORT) {
            list_append(ast->members, (pointer)create_code_member(CODE_IMPORT, (pointer)parse_import(parser)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CLASS) {
            list_append(ast->members, (pointer)create_code_member(CODE_CLASS, (pointer)parse_class(parser)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FUNC) {
            list_append(ast->members, (pointer)create_code_member(CODE_FUNCTION, (pointer)parse_function(parser)));
        } else {
            parser_error("Unexpected token", token);
        }
    }
    return ast;
}

CodeMember* create_code_member(CodeMemberType type, pointer member) {
    CodeMember* code_member = create_struct(CodeMember);
    code_member->type = type;
    switch (type) {
        case CODE_FUNCTION:
            code_member->member.function = (Function*)member;
            break;
        case CODE_CLASS:
            code_member->member.class = (Class*)member;
            break;
        case CODE_IMPORT:
            code_member->member.import = (Import*)member;
            break;
        default:
            code_member->member.class = NULL;
            break;
    }
    return code_member;
}

Import* parse_import(Parser* parser) {
    Import* import = create_struct(Import);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token);
        return NULL;
    }
    import->name = create_symbol(token->lexeme, NULL, SYMBOL_VARIABLE, NULL);
    token = get_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
        import->path = NULL;
        return import;
    }
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_FROM) {
        parser_error("Expected 'from' after import name", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_STRING) {
        parser_error("Expected string literal after 'from'", token);
        return NULL;
    }
    import->path = token->lexeme;
    return import;
}

static Method* parse_method(Parser* parser);
static list(Variable*) parse_variable(Parser* parser);

Class* parse_class(Parser* parser) {
    Class* class = create_struct(Class);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after 'class'", token);
        return NULL;
    }
    class->name = create_symbol(token->lexeme, NULL, SYMBOL_CLASS, (pointer)class);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' after class name", token);
        return NULL;
    }
    while (true) {
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_R_BRACE) {
            break;
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_METHOD) {
            list_append(class->members, (pointer)create_code_member(CLASS_METHOD, (pointer)parse_method(parser)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
            list(Variable*) vars = parse_variable(parser);
            while (!list_empty(vars)) {
                list_append(class->members, (pointer)create_code_member(CLASS_ATTRIBUTE, list_pop_front(vars)));
            }
        } else {
            parser_error("Unexpected token in class body", token);
        }
    }
    return class;
}

#define is_builtin_type(token) (token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))
static Symbol* parse_type(Parser* parser);
static Statement* parse_statement(Parser* parser);

Function* parse_function(Parser* parser) {
    Function* function = create_struct(Function);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected identifier or type after 'func'", token);
        return NULL;
    }
    function->type = parse_type(parser);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after function return type", token);
        return NULL;
    }
    function->name = create_symbol(token->lexeme, NULL, SYMBOL_FUNCTION, (pointer)function);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after function name", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Unexpected token in parameter list", token);
            return NULL;
        }
        Symbol* param_type = parse_type(parser);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            parser_error("Expected identifier in parameter list", token);
            return NULL;
        }
        list_append(function->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, NULL));
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ',' or ')' in parameter list", token);
            return NULL;
        }
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start function body", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser);
        if (stmt == NULL) {
            parser_error("Unexpected token in function body", token);
            return NULL;
        }
        if (stmt->type == STATEMENT_DECLARE) {
            list(Variable*) vars = stmt->statement.declare;
            while (!list_empty(vars)) {
                list_append(function->body, (pointer)list_pop_front(vars));
            }
        } else {
            list_append(function->body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return function;
}

Method* parse_method(Parser* parser) {
    Method* method = create_struct(Method);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected identifier or type after 'method'", token);
        return NULL;
    }
    method->type = parse_type(parser);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && token->type != TOKEN_SPECIAL) {
        parser_error("Expected identifier after method return type", token);
        return NULL;
    }
    method->name = create_symbol(token->lexeme, NULL, SYMBOL_FUNCTION, (pointer)method);
    if (token->type == TOKEN_SPECIAL) {
        if (!is_special(token->lexeme)) {
            parser_error("Invalid special method", token);
            return NULL;
        }
        method->special = true;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after method name", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Unexpected token in parameter list", token);
            return NULL;
        }
        Symbol* param_type = parse_type(parser);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            parser_error("Expected identifier in parameter list", token);
            return NULL;
        }
        list_append(method->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, NULL));
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ',' or ')' in parameter list", token);
            return NULL;
        }
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start method body", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser);
        if (stmt == NULL) {
            parser_error("Unexpected token in method body", token);
            return NULL;
        }
        if (stmt->type == STATEMENT_DECLARE) {
            list(Variable*) vars = stmt->statement.declare;
            while (!list_empty(vars)) {
                list_append(method->body, (pointer)list_pop_front(vars));
            }
        } else {
            list_append(method->body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return method;
}

static Expression* parse_expression_prec(Parser* parser, int min_precedence);
#define parse_expression(parser) parse_expression_prec(parser, 1)

list(Variable*) parse_variable(Parser* parser) {
    list(Variable*) vars = list_create();
    Symbol* type = parse_type(parser);
    Token* token;
    while ((token = get_next_token(parser->lexer))->type == TOKEN_IDENTIFIER) {
        Variable* var = create_struct(Variable);
        var->var = create_symbol(token->lexeme, type, SYMBOL_VARIABLE, NULL);
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_ASSIGN) {
            get_next_token(parser->lexer);  // consume '='
            var->initializer = parse_expression(parser);
            list_append(vars, (pointer)var);
            token = get_next_token(parser->lexer);
        }
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            continue;
        } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
            break;
        } else {
            parser_error("Expected ',' or ';' after variable declaration", token);
            break;
        }
    }
    return vars;
}

Symbol* parse_type(Parser* parser) {
    Symbol* type;
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected type", token);
        return NULL;
    }
    if (token->type == TOKEN_KEYWORD) {
        if (token->lexeme == KEYWORD_INT) {
            type = symbol_int;
        } else if (token->lexeme == KEYWORD_FLOAT) {
            type = symbol_float;
        } else if (token->lexeme == KEYWORD_STRING) {
            type = symbol_string;
        } else if (token->lexeme == KEYWORD_BOOL) {
            type = symbol_bool;
        } else if (token->lexeme == KEYWORD_VOID) {
            type = symbol_void;
        } else if (token->lexeme == KEYWORD_POINTER) {
            type = symbol_pointer;
        } else if (token->lexeme == KEYWORD_CONST) {
            type = symbol_const;
        } else {
            parser_error("Unknown built-in type", token);
            type = NULL;
        }
    } else if (token->type == TOKEN_IDENTIFIER) {
        type = create_symbol(token->lexeme, NULL, SYMBOL_TYPE, NULL);
    } else {
        parser_error("Unexpected token when parsing type", token);
        type = NULL;
    }
    token = peek_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_LT) {
        get_next_token(parser->lexer);  // consume '<'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Expected type in container type", token);
            return NULL;
        }
        Symbol* element_type = parse_type(parser);
        if (element_type == NULL) {
            return NULL;
        }
        type->type = element_type;
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_GT) {
            parser_error("Expected '>' after container type", token);
            return NULL;
        }
    }
    return type;
}

static If* parse_if(Parser* parser);
static For* parse_for(Parser* parser);
static While* parse_while(Parser* parser);

Statement* parse_statement(Parser* parser) {
    Statement* stmt = create_struct(Statement);
    Token* token = get_next_token(parser->lexer);
    bool check_semicolon = true;
    if (token->type != TOKEN_KEYWORD && token->lexeme == KEYWORD_IF) {
        stmt->type = STATEMENT_IF;
        stmt->statement.if_ = parse_if(parser);
        check_semicolon = false;
    } else if (token->type != TOKEN_KEYWORD && token->lexeme == KEYWORD_FOR) {
        stmt->type = STATEMENT_FOR;
        stmt->statement.for_ = parse_for(parser);
        check_semicolon = false;
    } else if (token->type != TOKEN_KEYWORD && token->lexeme == KEYWORD_WHILE) {
        stmt->type = STATEMENT_WHILE;
        stmt->statement.while_ = parse_while(parser);
        check_semicolon = false;
    } else if (token->type != TOKEN_KEYWORD && token->lexeme == KEYWORD_RETURN) {
        stmt->type = STATEMENT_RETURN;
        get_next_token(parser->lexer);  // consume 'return'
        stmt->statement.return_ = parse_expression(parser);
    } else if (token->type != TOKEN_KEYWORD && token->lexeme == KEYWORD_BREAK) {
        stmt->type = STATEMENT_BREAK;
        stmt->statement.break_ = NULL;
    } else if (token->type != TOKEN_KEYWORD && token->lexeme == KEYWORD_CONTINUE) {
        stmt->type = STATEMENT_CONTINUE;
        stmt->statement.continue_ = NULL;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        stmt->type = STATEMENT_DECLARE;
        stmt->statement.declare = parse_variable(parser);
    } else {
        stmt->type = STATEMENT_EXPRESSION;
        stmt->statement.expression = parse_expression(parser);
    }
    if (check_semicolon) {
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
            parser_error("Expected ';' after statement", token);
            return NULL;
        }
    }
    return stmt;
}

If* parse_if(Parser* parser) {
    If* if_ = create_struct(If);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'if'", token);
        return NULL;
    }
    get_next_token(parser->lexer);  // consume '('
    if_->condition = parse_expression(parser);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        parser_error("Expected ')' after if condition", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start if body", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser);
        if (stmt == NULL) {
            parser_error("Unexpected token in if body", token);
            return NULL;
        }
        if (stmt->type == STATEMENT_DECLARE) {
            list(Variable*) vars = stmt->statement.declare;
            while (!list_empty(vars)) {
                list_append(if_->body, (pointer)list_pop_front(vars));
            }
        } else {
            list_append(if_->body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELIF) {
        If* elif = create_struct(If);
        get_next_token(parser->lexer);  // consume 'elif'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
            parser_error("Expected '(' after 'elif'", token);
            return NULL;
        }
        elif->condition = parse_expression(parser);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ')' after elif condition", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
            parser_error("Expected '{' to start elif body", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
            Statement* stmt = parse_statement(parser);
            if (stmt == NULL) {
                parser_error("Unexpected token in elif body", token);
                return NULL;
            }
            if (stmt->type == STATEMENT_DECLARE) {
                list(Variable*) vars = stmt->statement.declare;
                while (!list_empty(vars)) {
                    list_append(elif->body, (pointer)list_pop_front(vars));
                }
            } else {
                list_append(elif->body, (pointer)stmt);
            }
            token = get_next_token(parser->lexer);
        }
        list_append(if_->elif_list, (pointer)elif);
        token = peek_next_token(parser->lexer);
    }
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELSE) {
        get_next_token(parser->lexer);  // consume 'else'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
            parser_error("Expected '{' to start else body", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
            Statement* stmt = parse_statement(parser);
            if (stmt == NULL) {
                parser_error("Unexpected token in else body", token);
                return NULL;
            }
            if (stmt->type == STATEMENT_DECLARE) {
                list(Variable*) vars = stmt->statement.declare;
                while (!list_empty(vars)) {
                    list_append(if_->else_body, (pointer)list_pop_front(vars));
                }
            } else {
                list_append(if_->else_body, (pointer)stmt);
            }
            token = get_next_token(parser->lexer);
        }
    }
    return if_;
}

For* parse_for(Parser* parser) {
    For* for_ = create_struct(For);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'for'", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        list(Variable*) vars = parse_variable(parser);
        if (vars == NULL || vars->head == NULL || vars->head != vars->tail) {
            parser_error("Expected exactly one variable declaration in for loop initializer", token);
            return NULL;
        }
        for_->init.decl = (Variable*)vars->head->data;
        token = get_next_token(parser->lexer);
    } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->init.expr = parse_expression(parser);
        if (for_->init.expr == NULL) {
            parser_error("Expected expression in for loop initializer", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->condition = parse_expression(parser);
        if (for_->condition == NULL) {
            parser_error("Expected expression in for loop condition", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        parser_error("Expected ';' after for loop condition", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        for_->increment = parse_expression(parser);
        if (for_->increment == NULL) {
            parser_error("Expected expression in for loop increment", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        parser_error("Expected ')' after for loop increment", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start for loop body", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser);
        if (stmt == NULL) {
            parser_error("Unexpected token in for loop body", token);
            return NULL;
        }
        if (stmt->type == STATEMENT_DECLARE) {
            list(Variable*) vars = stmt->statement.declare;
            while (!list_empty(vars)) {
                list_append(for_->body, (pointer)list_pop_front(vars));
            }
        } else {
            list_append(for_->body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return for_;
}

While* parse_while(Parser* parser) {
    While* while_ = create_struct(While);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'while'", token);
        return NULL;
    }
    get_next_token(parser->lexer);
    while_->condition = parse_expression(parser);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        parser_error("Expected ')' after while condition", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start while body", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser);
        if (stmt == NULL) {
            parser_error("Unexpected token in while body", token);
            return NULL;
        }
        if (stmt->type == STATEMENT_DECLARE) {
            list(Variable*) vars = stmt->statement.declare;
            while (!list_empty(vars)) {
                list_append(while_->body, (pointer)list_pop_front(vars));
            }
        } else {
            list_append(while_->body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return while_;
}

static Primary* parse_primary(Parser* parser);
static int operator_precedence(OperatorType op) {
    switch (op) {
        case OP_ASSIGN:      // =
        case OP_ADD_ASSIGN:  // +=
        case OP_SUB_ASSIGN:  // -=
        case OP_MUL_ASSIGN:  // *=
        case OP_DIV_ASSIGN:  // /=
        case OP_MOD_ASSIGN:  // %=
            return 1;
        case OP_AND:  // &&
        case OP_OR:   // ||
            return 2;
        case OP_EQ:  // ==
        case OP_NE:  // !=
        case OP_LT:  // <
        case OP_GT:  // >
        case OP_LE:  // <=
        case OP_GE:  // >=
            return 3;
        case OP_ADD:  // +
        case OP_SUB:  // -
            return 4;
        case OP_MUL:  // *
        case OP_DIV:  // /
        case OP_MOD:  // %
            return 5;
        case OP_NONE:
        default:
            return 0;
    }
}
static OperatorType operator(string lexeme) {
    if (lexeme == SYMBOL_ADD) return OP_ADD;
    else if (lexeme == SYMBOL_SUB) return OP_SUB;
    else if (lexeme == SYMBOL_MUL) return OP_MUL;
    else if (lexeme == SYMBOL_DIV) return OP_DIV;
    else if (lexeme == SYMBOL_MOD) return OP_MOD;
    else if (lexeme == SYMBOL_ASSIGN) return OP_ASSIGN;
    else if (lexeme == SYMBOL_EQ) return OP_EQ;
    else if (lexeme == SYMBOL_NE) return OP_NE;
    else if (lexeme == SYMBOL_LT) return OP_LT;
    else if (lexeme == SYMBOL_GT) return OP_GT;
    else if (lexeme == SYMBOL_LE) return OP_LE;
    else if (lexeme == SYMBOL_GE) return OP_GE;
    else if (lexeme == SYMBOL_ADD_ASSIGN) return OP_ADD_ASSIGN;
    else if (lexeme == SYMBOL_SUB_ASSIGN) return OP_SUB_ASSIGN;
    else if (lexeme == SYMBOL_MUL_ASSIGN) return OP_MUL_ASSIGN;
    else if (lexeme == SYMBOL_DIV_ASSIGN) return OP_DIV_ASSIGN;
    else if (lexeme == SYMBOL_MOD_ASSIGN) return OP_MOD_ASSIGN;
    else if (lexeme == SYMBOL_AND) return OP_AND;
    else if (lexeme == SYMBOL_OR) return OP_OR;
    else return OP_NONE;
}
#define is_right_associative(op) (op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN)
Expression* parse_expression_prec(Parser* parser, int minp) {
    // parse first operand
    Expression* left = create_struct(Expression);
    left->left.unary = parse_primary(parser);
    if (left->left.unary == NULL) {
        parser_error("Expected expression", get_current_token(parser->lexer));
        return NULL;
    }
    left->right = NULL;
    left->op = OP_NONE;
    // check if the operator exists and its precedence
    OperatorType op = OP_NONE;
    int p = 0;
    Token* token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_SYMBOL && (op = operator(token->lexeme)) != OP_NONE && (p = operator_precedence(op)) >= minp) {
        get_next_token(parser->lexer);  // consume operator
        // parse scond operand
        Expression* expr = create_struct(Expression);
        expr->right = parse_expression_prec(parser, p + (is_right_associative(op) ? 0 : 1));
        if (expr->right == NULL) {
            parser_error("Expected expression after operator", token);
            return NULL;
        }
        // create new expression node
        expr->left.binary = left;
        expr->op = op;
        left = expr;
        token = peek_next_token(parser->lexer);
    }
    return left;
}

static VariableAccess* parse_variable_access(Parser* parser);

Primary* parse_primary(Parser* parser) {
    Primary* primary = create_struct(Primary);
    Token* token = get_current_token(parser->lexer);
    if (token->type == TOKEN_INTEGER) {
        primary->value.literal = token->lexeme;
        primary->type = PRIMARY_INT;
    } else if (token->type == TOKEN_FLOAT) {
        primary->value.literal = token->lexeme;
        primary->type = PRIMARY_FLOAT;
    } else if (token->type == TOKEN_STRING) {
        primary->value.literal = token->lexeme;
        primary->type = PRIMARY_STRING;
    } else if (token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_TRUE || token->lexeme == KEYWORD_FALSE)) {
        primary->value.literal = token->lexeme;
        primary->type = PRIMARY_BOOL;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_NOT) {
        get_next_token(parser->lexer);  // consume '!'
        primary->value.not = parse_primary(parser);
        if (primary->value.not == NULL) {
            parser_error("Expected expression after '!'", token);
            return NULL;
        }
        primary->type = PRIMARY_NOT;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SUB) {
        get_next_token(parser->lexer);  // consume '-'
        primary->value.neg = parse_primary(parser);
        if (primary->value.neg == NULL) {
            parser_error("Expected expression after '-'", token);
            return NULL;
        }
        primary->type = PRIMARY_NEG;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_L_PAREN) {
        get_next_token(parser->lexer);  // consume '('
        primary->value.exp = parse_expression(parser);
        if (primary->value.exp == NULL) {
            parser_error("Expected expression after '('", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ')' after expression", token);
            return NULL;
        }
    } else if (token->type == TOKEN_IDENTIFIER || (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_SELF)) {
        primary->value.var_access = parse_variable_access(parser);
        if (primary->value.var_access == NULL) {
            parser_error("Expected variable access", token);
            return NULL;
        }
        primary->type = PRIMARY_VAR_ACCESS;
    } else {
        parser_error("Unexpected token in expression", token);
        return NULL;
    }
    return primary;
}

VariableAccess* parse_variable_access(Parser* parser) {
    VariableAccess* var_access = create_struct(VariableAccess);
    return var_access;
}
