#include "parser.h"

#include "lexer.h"
#include "lib.h"

// `static Code* create_code(void)`
static offset(Code*) create_code(void);
// `static Import* create_import(string name, string source)`
static offset(Import*) create_import(string name, string source);
// `static Function* create_function(string name, string return_type)`
static offset(Function*) create_function(string name, string return_type);
// `static Class* create_class(string name)`
static offset(Class*) create_class(string name);
// `static Variable* create_variable(string type, string name)`
static offset(Variable*) create_variable(string type, string name);
// `static Statement* create_statement(StatementType type)`
static offset(Statement*) create_statement(StatementType type);
// `static Expression* create_expression(Primary* prim, OperatorType operator)`
static offset(Expression*) create_expression(offset(Primary*) prim, OperatorType operator);
// `static If* create_if(void)`
static offset(If*) create_if(void);
// `static While* create_while(void)`
static offset(While*) create_while(void);
// `static For* create_for(void)`
static offset(For*) create_for(void);
// `static Primary* create_primary(PrimaryType type)`
static offset(Primary*) create_primary(PrimaryType type);
// `static VariableAccess* create_variable_access(AccessType type)`
static offset(VariableAccess*) create_variable_access(AccessType type);
// `static Arguments* create_arguments(void)`
static offset(Arguments*) create_arguments(void);
// `static Scope* create_scope(string name, Type* type)`
static offset(Scope*) create_scope(string name, offset(Type*) type);

// `static Import* parse_import(Lexer* lexer)`
static offset(Import*) parse_import(offset(Lexer*) lexer);
// `static Function* parse_function(Lexer* lexer)`
static offset(Function*) parse_function(offset(Lexer*) lexer);
// `static Class* parse_class(Lexer* lexer)`
static offset(Class*) parse_class(offset(Lexer*) lexer);
// `static Variable* parse_variable(Lexer* lexer)`
static offset(Variable*) parse_variable(offset(Lexer*) lexer);
// `static Statement* parse_statement(Lexer* lexer)`
static offset(Statement*) parse_statement(offset(Lexer*) lexer);
// `static Expression* parse_expression(Lexer* lexer)`
static offset(Expression*) parse_expression(offset(Lexer*) lexer);
// `static If* parse_if(Lexer* lexer)`
static offset(If*) parse_if(offset(Lexer*) lexer);
// `static While* parse_while(Lexer* lexer)`
static offset(While*) parse_while(offset(Lexer*) lexer);
// `static For* parse_for(Lexer* lexer)`
static offset(For*) parse_for(offset(Lexer*) lexer);
// `static Primary* parse_primary(Lexer* lexer)`
static offset(Primary*) parse_primary(offset(Lexer*) lexer);
// `static VariableAccess* parse_variable_access(Lexer* lexer)`
static offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer);
// `static Arguments* parse_arguments(Lexer* lexer)`
static offset(Arguments*) parse_arguments(offset(Lexer*) lexer);

offset(Code*) create_code(void) {
    offset(Code*) code = alloc_memory(sizeof(Code));
    Code* code_ptr = (Code*)offset_to_ptr(code);
    code_ptr->imports = 0;
    code_ptr->functions = 0;
    code_ptr->classes = 0;
    code_ptr->global_scope = 0;
    return code;
}

offset(Import*) create_import(string name, string source) {
    offset(Import*) import = alloc_memory(sizeof(Import));
    Import* import_ptr = (Import*)offset_to_ptr(import);
    import_ptr->name = name;
    import_ptr->source = source;
    import_ptr->next = 0;
    return import;
}

offset(Function*) create_function(string name, string return_type) {
    offset(Function*) function = alloc_memory(sizeof(Function));
    Function* function_ptr = (Function*)offset_to_ptr(function);
    function_ptr->name = name;
    function_ptr->return_type = return_type;
    function_ptr->parameters = 0;
    function_ptr->body = 0;
    function_ptr->scope = 0;
    function_ptr->next = 0;
    return function;
}

offset(Class*) create_class(string name) {
    offset(Class*) class = alloc_memory(sizeof(Class));
    Class* class_ptr = (Class*)offset_to_ptr(class);
    class_ptr->name = name;
    class_ptr->methods = 0;
    class_ptr->attributes = 0;
    class_ptr->local_scope = 0;
    class_ptr->next = 0;
    return class;
}

offset(Variable*) create_variable(string type, string name) {
    offset(Variable*) variable = alloc_memory(sizeof(Variable));
    Variable* variable_ptr = (Variable*)offset_to_ptr(variable);
    variable_ptr->type = type;
    variable_ptr->name = name;
    variable_ptr->value = 0;
    variable_ptr->next = 0;
    return variable;
}

offset(Statement*) create_statement(StatementType type) {
    offset(Statement*) statement = alloc_memory(sizeof(Statement));
    Statement* statement_ptr = (Statement*)offset_to_ptr(statement);
    statement_ptr->type = type;
    if (type == EXPRESSION_STATEMENT)
        statement_ptr->stmt.expr = 0;
    else if (type == VARIABLE_STATEMENT)
        statement_ptr->stmt.var_decl = 0;
    else if (type == IF_STATEMENT)
        statement_ptr->stmt.if_stmt = 0;
    else if (type == WHILE_STATEMENT)
        statement_ptr->stmt.while_stmt = 0;
    else if (type == FOR_STATEMENT)
        statement_ptr->stmt.for_stmt = 0;
    else if (type == RETURN_STATEMENT)
        statement_ptr->stmt.return_stmt = 0;
    return statement;
}

offset(Expression*) create_expression(offset(Primary*) prim, OperatorType operator) {
    offset(Expression*) expression = alloc_memory(sizeof(Expression));
    Expression* expression_ptr = (Expression*)offset_to_ptr(expression);
    expression_ptr->prim = prim;
    expression_ptr->operator = operator;
    expression_ptr->left = 0;
    expression_ptr->right = 0;
    return expression;
}

offset(If*) create_if(void) {
    offset(If*) if_stmt = alloc_memory(sizeof(If));
    If* if_ptr = (If*)offset_to_ptr(if_stmt);
    if_ptr->condition = 0;
    if_ptr->body = 0;
    if_ptr->else_if = 0;
    if_ptr->else_body = 0;
    return if_stmt;
}

offset(While*) create_while(void) {
    offset(While*) while_stmt = alloc_memory(sizeof(While));
    While* while_ptr = (While*)offset_to_ptr(while_stmt);
    while_ptr->condition = 0;
    while_ptr->body = 0;
    return while_stmt;
}

offset(For*) create_for(void) {
    offset(For*) for_stmt = alloc_memory(sizeof(For));
    For* for_ptr = (For*)offset_to_ptr(for_stmt);
    for_ptr->initialization = 0;
    for_ptr->condition = 0;
    for_ptr->increment = 0;
    for_ptr->body = 0;
    return for_stmt;
}

offset(Primary*) create_primary(PrimaryType type) {
    offset(Primary*) primary = alloc_memory(sizeof(Primary));
    Primary* primary_ptr = (Primary*)offset_to_ptr(primary);
    primary_ptr->type = type;
    if (type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING)
        primary_ptr->value.string_value = 0;
    else if (type == PRIM_EXPRESSION)
        primary_ptr->value.expr = 0;
    else if (type == PRIM_NOT_OPERAND)
        primary_ptr->value.operand = 0;
    else if (type == PRIM_NEGATE_OPERAND)
        primary_ptr->value.operand = 0;
    else if (type == PRIM_VARIABLE_ACCESS)
        primary_ptr->value.var_access = 0;
    return primary;
}

offset(VariableAccess*) create_variable_access(AccessType type) {
    offset(VariableAccess*) var_access = alloc_memory(sizeof(VariableAccess));
    VariableAccess* var_access_ptr = (VariableAccess*)offset_to_ptr(var_access);
    var_access_ptr->name = 0;
    var_access_ptr->base = 0;
    var_access_ptr->access_type = type;
    if (type == ACCESS_FUNCTION_CALL)
        var_access_ptr->access.func_call = 0;
    else if (type == ACCESS_GET_ATTR)
        var_access_ptr->access.get_attr = 0;
    else if (type == ACCESS_GET_SEQ)
        var_access_ptr->access.get_seq = 0;
    return var_access;
}

offset(Arguments*) create_arguments(void) {
    offset(Arguments*) args = alloc_memory(sizeof(Arguments));
    Arguments* args_ptr = (Arguments*)offset_to_ptr(args);
    args_ptr->args = 0;
    args_ptr->next = 0;
    return args;
}

offset(Scope*) create_scope(string name, offset(Type*) type) {
    static size_t scope_id_counter = 0;
    offset(Scope*) scope = alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
    scope_ptr->name = name;
    scope_ptr->type = type;
    scope_ptr->id = scope_id_counter++;
    scope_ptr->next = 0;
    return scope;
}

// `static size_t parser_error(const char* message, Token* token)`
static size_t parser_error(const char* message, offset(Token*) token) {
    Token* token_ptr = (Token*)offset_to_ptr(token);
    fprintf(stderr, "Parser Error at Line %zu, Column %zu: %s\n", token_ptr->line + 1, token_ptr->column + 1, message);
    return 0;
}

static bool is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}

static offset(Token*) token = 0;
static Token* token_ptr = NULL;

offset(Code*) parser(offset(Lexer*) lexer) {
    offset(Import*) imports = 0;
    offset(Function*) functions = 0;
    offset(Class*) classes = 0;
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == KEYWORD) {
        if (string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
            offset(Import*) import = parse_import(lexer);
            if (import != 0) {
                ((Import*)offset_to_ptr(import))->next = imports;
                imports = import;
            } else
                parser_error("Failed to parse import statement", token);
        } else if (string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
            offset(Function*) function = parse_function(lexer);
            if (function != 0) {
                ((Function*)offset_to_ptr(function))->next = functions;
                functions = function;
            } else
                parser_error("Failed to parse function declaration", token);
        } else if (string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
            offset(Class*) class = parse_class(lexer);
            if (class != 0) {
                ((Class*)offset_to_ptr(class))->next = classes;
                classes = class;
            } else
                parser_error("Failed to parse class declaration", token);
        }
    }
    offset(Code*) code = create_code();
    Code* code_ptr = (Code*)offset_to_ptr(code);
    code_ptr->imports = imports;
    code_ptr->functions = functions;
    code_ptr->classes = classes;
    return code;
}

offset(Import*) parse_import(offset(Lexer*) lexer) {
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected identifier after 'import'", token);
    string name = token_ptr->lexeme;
    token = peek_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    string source = 0;
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
        get_next_token(lexer);  // consume 'from'
        token = get_next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != STRING)
            return parser_error("Expected string literal after 'from'", token);
        source = token_ptr->lexeme;
    }
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' at the end of import statement", token);
    return create_import(name, source);
}

offset(Function*) parse_function(offset(Lexer*) lexer) {
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    string return_type = 0;
    if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
        return_type = token_ptr->lexeme;
        token = get_next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (return_type == 0)
        return parser_error("Expected function return type after 'func'", token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected function name after return type", token);
    string name = token_ptr->lexeme;
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after function name", token);
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Variable*) parameters = 0;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        offset(Variable*) param = parse_variable(lexer);
        if (param != 0) {
            Variable* param_ptr = (Variable*)offset_to_ptr(param);
            if (param_ptr->value != 0)
                parser_error("Function parameters cannot have default values", token);
            else {
                param_ptr->next = parameters;
                parameters = param;
            }
        } else
            return parser_error("Failed to parse function parameter", token);
        token = get_next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer);
            token_ptr = (Token*)offset_to_ptr(token);
        } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ',' or ')' in function parameter list", token);
    }
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start function body", token);
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) body = 0;
    bool have_return_statement = false;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) stmt = parse_statement(lexer);
        if (stmt != 0) {
            Statement* stmt_ptr = (Statement*)offset_to_ptr(stmt);
            if (stmt_ptr->type == RETURN_STATEMENT)
                have_return_statement = true;
            stmt_ptr->next = body;
            body = stmt;
        } else
            return parser_error("Failed to parse statement in function body", token);
        token = get_next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (!have_return_statement && !string_equal(return_type, VOID_KEYWORD))
        parser_error("Function missing return statement", token);
    offset(Function*) function = create_function(name, return_type);
    Function* function_ptr = (Function*)offset_to_ptr(function);
    function_ptr->parameters = parameters;
    function_ptr->body = body;
    return function;
}

offset(Class*) parse_class(offset(Lexer*) lexer) {
    return 0;
}

offset(Variable*) parse_variable(offset(Lexer*) lexer) {
    return 0;
}

offset(Statement*) parse_statement(offset(Lexer*) lexer) {
    return 0;
}

offset(Expression*) parse_expression(offset(Lexer*) lexer) {
    return 0;
}

offset(If*) parse_if(offset(Lexer*) lexer) {
    return 0;
}

offset(While*) parse_while(offset(Lexer*) lexer) {
    return 0;
}

offset(For*) parse_for(offset(Lexer*) lexer) {
    return 0;
}

offset(Primary*) parse_primary(offset(Lexer*) lexer) {
    return 0;
}

offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer) {
    return 0;
}

offset(Arguments*) parse_arguments(offset(Lexer*) lexer) {
    return 0;
}
