#include "parser.h"

#include "output.h"
#include "symbol_table.h"

#define parser_error(message, token)                                                                                                  \
    fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, message); \
    output_one_token(token, stderr, false)

Parser* create_parser(Lexer* lexer) {
    lexer->skip_comment = true;
    Parser* parser = create_struct(Parser);
    parser->lexer = lexer;
    parser->import_files = list_create();
    parser->file = lexer->source_path;
    return parser;
}

static CodeMember* create_code_member(CodeMemberType type, pointer member);
static Import* parse_import(Parser* parser, SymbolTable* table, AST* ast);
static Class* parse_class(Parser* parser, SymbolTable* table);
static Function* parse_function(Parser* parser, SymbolTable* table);

AST* parse_code(Parser* parser) {
    AST* ast = create_struct(AST);
    ast->members = list_create();
    ast->file = parser->file;
    Token* token = get_next_token(parser->lexer);
    ast->table = create_symbol_table(SYMBOL_TABLE_GLOBAL, global_symbol_table);
    while (token != NULL && token->type != TOKEN_EOF) {
        if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IMPORT) {
            list_append(ast->members, (pointer)create_code_member(CODE_IMPORT, (pointer)parse_import(parser, ast->table, ast)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CLASS) {
            list_append(ast->members, (pointer)create_code_member(CODE_CLASS, (pointer)parse_class(parser, ast->table)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FUNC) {
            list_append(ast->members, (pointer)create_code_member(CODE_FUNCTION, (pointer)parse_function(parser, ast->table)));
        } else {
            parser_error("Unexpected token", token);
        }
        token = get_next_token(parser->lexer);
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

static Symbol* from_file_import(string name, string path) {
    File* file = create_file(path);
    AST* ast = NULL;
    foreach (AST*, item, parsed_files) {
        if (item != NULL && strcmp(file_full_path(item->file), file_full_path(file)) == 0) {
            ast = item;
            break;
        }
    }
    if (ast == NULL) {
        ast = parse_code(create_parser(create_lexer(file)));
        list_append(parsed_files, (pointer)ast);
    }
    return search_symbol(ast->table, name, false, 0, NULL);
}

Import* parse_import(Parser* parser, SymbolTable* table, AST* ast) {
    Import* import = create_struct(Import);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token);
        return NULL;
    }
    string name = token->lexeme;
    token = get_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
        import->path = file_full_path(create_file(string_splice("%s/%s.tc", std_path, name)));
    } else {
        if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_FROM) {
            parser_error("Expected 'from' after import name", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_STRING) {
            parser_error("Expected string literal after 'from'", token);
            return NULL;
        }
        import->path = file_full_path(create_file(string_splice("%s/%s", file_dir_path(parser->file), token->lexeme)));
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
            parser_error("Expected ';' after import path", token);
            return NULL;
        }
    }
    import->name = from_file_import(name, import->path);
    if (import->name == NULL) {
        parser_error("Failed to import module", token);
        import->name = create_symbol(name, NULL, SYMBOL_VARIABLE, NULL, table);
    } else {
        list_append(table->symbols, (pointer)import->name);
        if (import->name->kind == SYMBOL_CLASS) {
            list_append(ast->members, (pointer)create_code_member(CODE_CLASS, (pointer)import->name->info.class));
        } else if (import->name->kind == SYMBOL_FUNCTION) {
            list_append(ast->members, (pointer)create_code_member(CODE_FUNCTION, (pointer)import->name->info.function));
        }
    }
    return import;
}

static Method* parse_method(Parser* parser, SymbolTable* table);
static list(Variable*) parse_variable(Parser* parser, SymbolTable* table);
static ClassMember* create_class_member(ClassMemberType type, pointer member);

Class* parse_class(Parser* parser, SymbolTable* table) {
    Class* class = create_struct(Class);
    parser->current_class = class;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after 'class'", token);
        parser->current_class = NULL;
        return NULL;
    }
    class->name = create_symbol(token->lexeme, NULL, SYMBOL_CLASS, (pointer)class, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' after class name", token);
        parser->current_class = NULL;
        return NULL;
    }
    SymbolTable* class_table = create_symbol_table(SYMBOL_TABLE_CLASS, table);
    class->table = class_table;
    class->members = list_create();
    while (true) {
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_R_BRACE) {
            break;
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_METHOD) {
            list_append(class->members, (pointer)create_class_member(CLASS_METHOD, (pointer)parse_method(parser, class_table)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
            list(Variable*) vars = parse_variable(parser, class_table);
            while (!list_empty(vars)) {
                list_append(class->members, (pointer)create_class_member(CLASS_ATTRIBUTE, list_pop_front(vars)));
            }
        } else {
            parser_error("Unexpected token in class body", token);
        }
    }
    parser->current_class = NULL;
    return class;
}

ClassMember* create_class_member(ClassMemberType type, pointer member) {
    ClassMember* class_member = create_struct(ClassMember);
    class_member->type = type;
    switch (type) {
        case CLASS_METHOD:
            class_member->member.method = (Method*)member;
            break;
        case CLASS_ATTRIBUTE:
            class_member->member.attribute = (Variable*)member;
            break;
        default:
            class_member->member.method = NULL;
            break;
    }
    return class_member;
}

#define is_builtin_type(token) (token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))
static Symbol* parse_type(Parser* parser, SymbolTable* table);
static Statement* parse_statement(Parser* parser, SymbolTable* table);

static bool parse_body(Parser* parser, SymbolTable* table, list(Statement*) body);

Function* parse_function(Parser* parser, SymbolTable* table) {
    Function* function = create_struct(Function);
    function->body = list_create();
    function->parameters = list_create();
    parser->current_function = function;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected identifier or type after 'func'", token);
        parser->current_function = NULL;
        return NULL;
    }
    function->type = parse_type(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after function return type", token);
        parser->current_function = NULL;
        return NULL;
    }
    function->name = create_symbol(token->lexeme, NULL, SYMBOL_FUNCTION, (pointer)function, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after function name", token);
        parser->current_function = NULL;
        return NULL;
    }
    token = get_next_token(parser->lexer);
    SymbolTable* function_table = create_symbol_table(SYMBOL_TABLE_FUNCTION, table);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Unexpected token in parameter list", token);
            parser->current_function = NULL;
            return NULL;
        }
        Symbol* param_type = parse_type(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            parser_error("Expected identifier in parameter list", token);
            parser->current_function = NULL;
            return NULL;
        }
        list_append(function->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, NULL, function_table));
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ',' or ')' in parameter list", token);
            parser->current_function = NULL;
            return NULL;
        }
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start function body", token);
        parser->current_function = NULL;
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, function_table);
    bool result = parse_body(parser, block_table, function->body);
    parser->current_function = NULL;
    if (!result) return NULL;
    return function;
}

Method* parse_method(Parser* parser, SymbolTable* table) {
    Method* method = create_struct(Method);
    method->body = list_create();
    method->parameters = list_create();
    parser->current_method = method;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected identifier or type after 'method'", token);
        parser->current_method = NULL;
        return NULL;
    }
    method->type = parse_type(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && token->type != TOKEN_SPECIAL) {
        parser_error("Expected identifier after method return type", token);
        parser->current_method = NULL;
        return NULL;
    }
    method->name = create_symbol(token->lexeme, NULL, SYMBOL_FUNCTION, (pointer)method, table);
    if (token->type == TOKEN_SPECIAL) {
        if (!is_special(token->lexeme)) {
            parser_error("Invalid special method", token);
            parser->current_method = NULL;
            return NULL;
        }
        method->special = true;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after method name", token);
        parser->current_method = NULL;
        return NULL;
    }
    token = get_next_token(parser->lexer);
    SymbolTable* method_table = create_symbol_table(SYMBOL_TABLE_METHOD, table);
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_SELF) {
        parser_error("Expected 'self' as the first parameter", token);
        parser->current_method = NULL;
        return NULL;
    }
    list_append(method->parameters, (pointer)create_symbol(KEYWORD_SELF, parser->current_class->name, SYMBOL_PARAMETER, NULL, method_table));
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ',' or ')' in parameter list", token);
            parser->current_method = NULL;
            return NULL;
        }
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Unexpected token in parameter list", token);
            parser->current_method = NULL;
            return NULL;
        }
        Symbol* param_type = parse_type(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            parser_error("Expected identifier in parameter list", token);
            parser->current_method = NULL;
            return NULL;
        }
        list_append(method->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, NULL, method_table));
        token = get_next_token(parser->lexer);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start method body", token);
        parser->current_method = NULL;
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, method_table);
    bool result = parse_body(parser, block_table, method->body);
    parser->current_method = NULL;
    if (!result) return NULL;
    return method;
}

static Expression* parse_expression_prec(Parser* parser, int min_precedence, SymbolTable* table);
#define parse_expression(parser, table) parse_expression_prec(parser, 1, table)

list(Variable*) parse_variable(Parser* parser, SymbolTable* table) {
    list(Variable*) vars = list_create();
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_VAR) {
        parser_error("Expected 'var' at the beginning of variable declaration", token);
        return vars;
    }
    get_next_token(parser->lexer);  // consume 'var'
    Symbol* type = parse_type(parser, table);
    while ((token = get_next_token(parser->lexer))->type == TOKEN_IDENTIFIER) {
        Variable* var = create_struct(Variable);
        var->var = create_symbol(token->lexeme, type, SYMBOL_VARIABLE, NULL, table);
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_ASSIGN) {
            get_next_token(parser->lexer);  // consume '='
            var->initializer = parse_expression(parser, table);
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

Symbol* parse_type(Parser* parser, SymbolTable* table) {
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
            return NULL;
        }
    } else if (token->type == TOKEN_IDENTIFIER) {
        type = create_symbol(token->lexeme, NULL, SYMBOL_CLASS, NULL, table);
    } else {
        parser_error("Unexpected token when parsing type", token);
        return NULL;
    }
    token = peek_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_LT) {
        get_next_token(parser->lexer);  // consume '<'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Expected type in container type", token);
            return NULL;
        }
        Symbol* element_type = parse_type(parser, table);
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

static If* parse_if(Parser* parser, SymbolTable* table);
static For* parse_for(Parser* parser, SymbolTable* table);
static While* parse_while(Parser* parser, SymbolTable* table);

Statement* parse_statement(Parser* parser, SymbolTable* table) {
    Statement* stmt = create_struct(Statement);
    Token* token = get_current_token(parser->lexer);
    bool check_semicolon = true;
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IF) {
        stmt->type = STATEMENT_IF;
        stmt->statement.if_ = parse_if(parser, table);
        check_semicolon = false;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FOR) {
        stmt->type = STATEMENT_FOR;
        stmt->statement.for_ = parse_for(parser, table);
        check_semicolon = false;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_WHILE) {
        stmt->type = STATEMENT_WHILE;
        stmt->statement.while_ = parse_while(parser, table);
        check_semicolon = false;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_RETURN) {
        stmt->type = STATEMENT_RETURN;
        token = get_next_token(parser->lexer);  // consume 'return'
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
            stmt->statement.return_ = NULL;
            check_semicolon = false;
        } else {
            stmt->statement.return_ = parse_expression(parser, table);
        }
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_BREAK) {
        stmt->type = STATEMENT_BREAK;
        stmt->statement.break_ = NULL;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CONTINUE) {
        stmt->type = STATEMENT_CONTINUE;
        stmt->statement.continue_ = NULL;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        stmt->type = STATEMENT_DECLARE_LIST;
        stmt->statement.declare_list = parse_variable(parser, table);
        check_semicolon = false;
    } else {
        stmt->type = STATEMENT_EXPRESSION;
        stmt->statement.expression = parse_expression(parser, table);
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

If* parse_if(Parser* parser, SymbolTable* table) {
    If* if_ = create_struct(If);
    if_->body = list_create();
    if_->elif_list = list_create();
    if_->else_body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'if'", token);
        return NULL;
    }
    get_next_token(parser->lexer);  // consume '('
    if_->condition = parse_expression(parser, table);
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
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    bool result = parse_body(parser, block_table, if_->body);
    if (!result) return NULL;
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELIF) {
        If* elif = create_struct(If);
        elif->body = list_create();
        elif->elif_list = NULL;
        elif->else_body = NULL;
        get_next_token(parser->lexer);  // consume 'elif'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
            parser_error("Expected '(' after 'elif'", token);
            return NULL;
        }
        elif->condition = parse_expression(parser, table);
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
        SymbolTable* elif_block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
        result = parse_body(parser, elif_block_table, elif->body);
        if (!result) return NULL;
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
        SymbolTable* else_block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
        result = parse_body(parser, else_block_table, if_->else_body);
        if (!result) return NULL;
    }
    return if_;
}

For* parse_for(Parser* parser, SymbolTable* table) {
    For* for_ = create_struct(For);
    for_->body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'for'", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    SymbolTable* for_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        list(Variable*) vars = parse_variable(parser, for_table);
        if (vars == NULL || vars->head == NULL || vars->head != vars->tail) {
            parser_error("Expected exactly one variable declaration in for loop initializer", token);
            return NULL;
        }
        for_->init.decl = (Variable*)vars->head->data;
        token = get_next_token(parser->lexer);
    } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->init.expr = parse_expression(parser, for_table);
        if (for_->init.expr == NULL) {
            parser_error("Expected expression in for loop initializer", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->condition = parse_expression(parser, for_table);
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
        for_->increment = parse_expression(parser, for_table);
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
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, for_table);
    bool result = parse_body(parser, block_table, for_->body);
    if (!result) return NULL;
    return for_;
}

While* parse_while(Parser* parser, SymbolTable* table) {
    While* while_ = create_struct(While);
    while_->body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'while'", token);
        return NULL;
    }
    get_next_token(parser->lexer);
    while_->condition = parse_expression(parser, table);
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
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    bool result = parse_body(parser, block_table, while_->body);
    if (!result) return NULL;
    return while_;
}

static Primary* parse_primary(Parser* parser, SymbolTable* table);
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
Expression* parse_expression_prec(Parser* parser, int minp, SymbolTable* table) {
    // parse first operand
    Expression* left = create_struct(Expression);
    left->left.unary = parse_primary(parser, table);
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
        token = get_next_token(parser->lexer);
        // parse scond operand
        Expression* expr = create_struct(Expression);
        expr->right = parse_expression_prec(parser, p + (is_right_associative(op) ? 0 : 1), table);
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

static VariableAccess* parse_variable_access(Parser* parser, SymbolTable* table);

Primary* parse_primary(Parser* parser, SymbolTable* table) {
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
        primary->value.not = parse_primary(parser, table);
        if (primary->value.not == NULL) {
            parser_error("Expected expression after '!'", token);
            return NULL;
        }
        primary->type = PRIMARY_NOT;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SUB) {
        get_next_token(parser->lexer);  // consume '-'
        primary->value.neg = parse_primary(parser, table);
        if (primary->value.neg == NULL) {
            parser_error("Expected expression after '-'", token);
            return NULL;
        }
        primary->type = PRIMARY_NEG;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_L_PAREN) {
        get_next_token(parser->lexer);  // consume '('
        primary->value.exp = parse_expression(parser, table);
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
        primary->value.var_access = parse_variable_access(parser, table);
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

VariableAccess* parse_variable_access(Parser* parser, SymbolTable* table) {
    VariableAccess* var = create_struct(VariableAccess);
    var->base = NULL;
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_SELF)) {
        parser_error("Expected identifier or 'self' in variable access", token);
        return NULL;
    }
    var->access.var = search_symbol(table, token->lexeme, false, 0, NULL);
    if (var->access.var == NULL) {
        parser_error("Undefined variable", token);
        return NULL;
    }
    var->type = VAR_ACCESS_VAR;
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_SYMBOL && (token->lexeme == SYMBOL_DOT || token->lexeme == SYMBOL_L_BRACKET || token->lexeme == SYMBOL_L_PAREN)) {
        VariableAccess* access = create_struct(VariableAccess);
        access->base = var;
        if (token->lexeme == SYMBOL_DOT) {
            access->type = VAR_ACCESS_ATTRIBUTE;
            get_next_token(parser->lexer);  // consume '.'
            token = get_next_token(parser->lexer);
            if (token->type != TOKEN_IDENTIFIER) {
                parser_error("Expected identifier after '.'", token);
                return NULL;
            }
            Symbol* type = access->base->access.var->type;
            if (type == NULL || type->kind != SYMBOL_CLASS) {
                parser_error("Cannot access attribute of non-class type", token);
                return NULL;
            }
            access->access.attribute = search_symbol(type->info.class->table, token->lexeme, false, 0, NULL);
            if (access->access.attribute == NULL) {
                parser_error("Undefined attribute", token);
                return NULL;
            }
        } else if (token->lexeme == SYMBOL_L_BRACKET) {
            access->type = VAR_ACCESS_INDEX;
            get_next_token(parser->lexer);  // consume '['
            get_next_token(parser->lexer);
            access->access.index = parse_expression(parser, table);
            if (access->access.index == NULL) {
                parser_error("Expected expression in index access", token);
                return NULL;
            }
            token = get_next_token(parser->lexer);
            if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACKET) {
                parser_error("Expected ']' after index expression", token);
                return NULL;
            }
        } else if (token->lexeme == SYMBOL_L_PAREN) {
            access->type = VAR_ACCESS_CALL;
            access->access.args = list_create();
            get_next_token(parser->lexer);  // consume '('
            token = get_next_token(parser->lexer);
            while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
                Expression* arg = parse_expression(parser, table);
                if (arg == NULL) {
                    parser_error("Expected expression in function call", token);
                    return NULL;
                }
                list_append(access->access.args, (pointer)arg);
                token = get_next_token(parser->lexer);
                if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
                    token = get_next_token(parser->lexer);
                } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
                    parser_error("Expected ',' or ')' in function call", token);
                    return NULL;
                }
            }
        }
        var = access;
        token = peek_next_token(parser->lexer);
    }
    return var;
}

bool parse_body(Parser* parser, SymbolTable* table, list(Statement*) body) {
    Token* token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser, table);
        if (stmt == NULL) {
            parser_error("Unexpected token in body", token);
            return false;
        }
        if (stmt->type == STATEMENT_DECLARE_LIST) {
            list(Variable*) vars = stmt->statement.declare_list;
            while (!list_empty(vars)) {
                Variable* var = (Variable*)list_pop_front(vars);
                Statement* decl_stmt = create_struct(Statement);
                decl_stmt->type = STATEMENT_DECLARE;
                decl_stmt->statement.declare = var;
                list_append(body, (pointer)decl_stmt);
            }
        } else {
            list_append(body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return true;
}
