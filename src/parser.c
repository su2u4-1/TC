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

// `void output_import(Import* ast_node, FILE* outfile, size_t indent)`
static void output_import(offset(Import*) ast_node, FILE* outfile, size_t indent);
// `void output_function(Function* ast_node, FILE* outfile, size_t indent)`
static void output_function(offset(Function*) ast_node, FILE* outfile, size_t indent);
// `void output_class(Class* ast_node, FILE* outfile, size_t indent)`
static void output_class(offset(Class*) ast_node, FILE* outfile, size_t indent);
// `void output_variable(Variable* ast_node, FILE* outfile, size_t indent)`
static void output_variable(offset(Variable*) ast_node, FILE* outfile, size_t indent);
// `void output_statement(Statement* ast_node, FILE* outfile, size_t indent)`
static void output_statement(offset(Statement*) ast_node, FILE* outfile, size_t indent);
// `void output_expression(Expression* ast_node, FILE* outfile, size_t indent)`
static void output_expression(offset(Expression*) ast_node, FILE* outfile, size_t indent);
// `void output_if(If* ast_node, FILE* outfile, size_t indent)`
static void output_if(offset(If*) ast_node, FILE* outfile, size_t indent);
// `void output_while(While* ast_node, FILE* outfile, size_t indent)`
static void output_while(offset(While*) ast_node, FILE* outfile, size_t indent);
// `void output_for(For* ast_node, FILE* outfile, size_t indent)`
static void output_for(offset(For*) ast_node, FILE* outfile, size_t indent);
// `void output_primary(Primary* ast_node, FILE* outfile, size_t indent)`
static void output_primary(offset(Primary*) ast_node, FILE* outfile, size_t indent);
// `void output_variable_access(VariableAccess* ast_node, FILE* outfile, size_t indent)`
static void output_variable_access(offset(VariableAccess*) ast_node, FILE* outfile, size_t indent);
// `void output_argument(Argument* ast_node, FILE* outfile, size_t indent)`
static void output_arguments(offset(Arguments*) ast_node, FILE* outfile, size_t indent);

// `static size_t parser_error(const char* message, Token* token)`
static size_t parser_error(const char* message, offset(Token*) token) {
    Token* token_ptr = (Token*)offset_to_ptr(token);
    fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token_ptr->line + 1, token_ptr->column + 1, message);
    return 0;
}

static bool is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}

int operator_precedence(OperatorType op) {
    if (op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN)
        return 1;
    if (op == OP_AND || op == OP_OR)
        return 2;
    if (op == OP_EQ || op == OP_NE || op == OP_LT || op == OP_GT || op == OP_LE || op == OP_GE)
        return 3;
    if (op == OP_ADD || op == OP_SUB)
        return 4;
    if (op == OP_MUL || op == OP_DIV || op == OP_MOD)
        return 5;
    return 0;
}

static void indention(FILE* outfile, size_t indent) {
    for (size_t i = 0; i < indent; ++i)
        fprintf(outfile, "    ");
}

static offset(Token*) token = 0;
static Token* token_ptr = NULL;
static bool in_loop = false;
static bool in_method = false;

static offset(Token*) next_token(offset(Lexer*) lexer) {
    token = get_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == COMMENT)
        return next_token(lexer);
    return token;
}

static offset(Token*) peek_token(offset(Lexer*) lexer) {
    token = peek_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == COMMENT) {
        get_next_token(lexer);
        return peek_token(lexer);
    }
    return token;
}

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

offset(Code*) parser(offset(Lexer*) lexer) {
    offset(Import*) imports = 0;
    offset(Function*) functions = 0;
    offset(Class*) classes = 0;
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token != 0 && token_ptr->type != EOF_TOKEN) {
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
            } else
                parser_error("Unexpected keyword at top-level", token);
        } else
            parser_error("Unexpected token at top-level", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    offset(Code*) code = create_code();
    Code* code_ptr = (Code*)offset_to_ptr(code);
    code_ptr->imports = imports;
    code_ptr->functions = functions;
    code_ptr->classes = classes;
    return code;
}

offset(Import*) parse_import(offset(Lexer*) lexer) {
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected identifier after 'import'", token);
    string name = token_ptr->lexeme;
    token = peek_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    string source = 0;
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
        next_token(lexer);  // consume 'from'
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != STRING)
            return parser_error("Expected string literal after 'from'", token);
        source = token_ptr->lexeme;
    }
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' at the end of import statement", token);
    return create_import(name, source);
}

offset(Function*) parse_function(offset(Lexer*) lexer) {
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    string return_type = 0;
    if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
        return_type = token_ptr->lexeme;
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    if (return_type == 0)
        return parser_error("Expected function return type after 'func'", token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected function name after return type", token);
    string name = token_ptr->lexeme;
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after function name", token);
    token = next_token(lexer);
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
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
            token = next_token(lexer);
            token_ptr = (Token*)offset_to_ptr(token);
        } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ',' or ')' in function parameter list", token);
    }
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start function body", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) body = 0;
    bool have_return_statement = false;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) stmt = parse_statement(lexer);
        if (stmt != 0) {
            Statement* stmt_ptr = (Statement*)offset_to_ptr(stmt);
            if ((stmt_ptr->type == BREAK_STATEMENT || stmt_ptr->type == CONTINUE_STATEMENT) && !in_loop)
                parser_error("Break/Continue statement not within a loop", token);
            else if (have_return_statement)
                parser_error("Unreachable code after return statement", token);
            else {
                stmt_ptr->next = body;
                body = stmt;
            }
            if (stmt_ptr->type == RETURN_STATEMENT)
                have_return_statement = true;
        } else
            parser_error("Failed to parse statement in function body", token);
        token = next_token(lexer);
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
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected class name after 'class'", token);
    string name = token_ptr->lexeme;
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start class body", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Function*) methods = 0;
    offset(Variable*) attributes = 0;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        if (token_ptr->type == KEYWORD) {
            if (string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
                in_method = true;
                offset(Function*) method = parse_function(lexer);
                in_method = false;
                if (method != 0) {
                    ((Function*)offset_to_ptr(method))->next = methods;
                    methods = method;
                } else
                    return parser_error("Failed to parse method in class body", token);
            } else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
                token = next_token(lexer);
                offset(Variable*) attribute = parse_variable(lexer);
                if (attribute != 0) {
                    ((Variable*)offset_to_ptr(attribute))->next = attributes;
                    attributes = attribute;
                } else
                    return parser_error("Failed to parse attribute in class body", token);
                token = next_token(lexer);
                token_ptr = (Token*)offset_to_ptr(token);
                if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
                    parser_error("Expected ';' after class attribute declaration", token);
            } else
                parser_error("Unexpected keyword in class body", token);
        } else
            parser_error("Unexpected token in class body", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    offset(Class*) class = create_class(name);
    Class* class_ptr = (Class*)offset_to_ptr(class);
    class_ptr->methods = methods;
    class_ptr->attributes = attributes;
    return class;
}

offset(Variable*) parse_variable(offset(Lexer*) lexer) {
    string var_type = 0;
    token_ptr = (Token*)offset_to_ptr(token);

    if (in_method && string_equal(token_ptr->lexeme, SELF_KEYWORD))
        return create_variable(SELF_KEYWORD, SELF_KEYWORD);

    if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme)))
        var_type = token_ptr->lexeme;
    else
        return parser_error("Expected variable type in variable declaration", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER)
        return parser_error("Expected variable name in variable declaration", token);
    string var_name = token_ptr->lexeme;
    token = peek_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Expression*) var_value = 0;
    if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
        next_token(lexer);  // consume '='
        token = next_token(lexer);
        var_value = parse_expression(lexer);
        if (var_value == 0)
            parser_error("Failed to parse variable initialization expression", token);
    }
    offset(Variable*) variable = create_variable(var_type, var_name);
    Variable* variable_ptr = (Variable*)offset_to_ptr(variable);
    variable_ptr->value = var_value;
    return variable;
}

offset(Statement*) parse_statement(offset(Lexer*) lexer) {
    offset(Statement*) statement = create_statement(EXPRESSION_STATEMENT);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == KEYWORD) {
        if (string_equal(token_ptr->lexeme, IF_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = IF_STATEMENT;
            ((Statement*)offset_to_ptr(statement))->stmt.if_stmt = parse_if(lexer);
            return statement;
        } else if (string_equal(token_ptr->lexeme, FOR_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = FOR_STATEMENT;
            ((Statement*)offset_to_ptr(statement))->stmt.for_stmt = parse_for(lexer);
            return statement;
        } else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = WHILE_STATEMENT;
            ((Statement*)offset_to_ptr(statement))->stmt.while_stmt = parse_while(lexer);
            return statement;
        } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = RETURN_STATEMENT;
            token = next_token(lexer);
            ((Statement*)offset_to_ptr(statement))->stmt.return_stmt = parse_expression(lexer);
        } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = BREAK_STATEMENT;
            ((Statement*)offset_to_ptr(statement))->stmt.expr = 0;
        } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = CONTINUE_STATEMENT;
            ((Statement*)offset_to_ptr(statement))->stmt.expr = 0;
        } else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            ((Statement*)offset_to_ptr(statement))->type = VARIABLE_STATEMENT;
            token = next_token(lexer);
            ((Statement*)offset_to_ptr(statement))->stmt.var_decl = parse_variable(lexer);
        } else if (string_equal(token_ptr->lexeme, SELF_KEYWORD) && in_method)
            ((Statement*)offset_to_ptr(statement))->stmt.expr = parse_expression(lexer);
        else
            return parser_error("Unexpected keyword in statement", token);
    } else {
        offset(Expression*) expr = parse_expression(lexer);
        ((Statement*)offset_to_ptr(statement))->stmt.expr = expr;
        // ((Statement*)offset_to_ptr(statement))->stmt.expr = parse_expression(lexer);
        // ^ error, WHY??????????
    }
    Statement* stmt_ptr = (Statement*)offset_to_ptr(statement);
    if ((stmt_ptr->type == EXPRESSION_STATEMENT && stmt_ptr->stmt.expr == 0))
        return parser_error("Failed to parse expression statement content", token);
    if ((stmt_ptr->type == VARIABLE_STATEMENT && stmt_ptr->stmt.var_decl == 0))
        return parser_error("Failed to parse variable statement content", token);
    if ((stmt_ptr->type == IF_STATEMENT && stmt_ptr->stmt.if_stmt == 0))
        return parser_error("Failed to parse if statement content", token);
    if ((stmt_ptr->type == WHILE_STATEMENT && stmt_ptr->stmt.while_stmt == 0))
        return parser_error("Failed to parse while statement content", token);
    if ((stmt_ptr->type == FOR_STATEMENT && stmt_ptr->stmt.for_stmt == 0))
        return parser_error("Failed to parse for statement content", token);
    if ((stmt_ptr->type == RETURN_STATEMENT && stmt_ptr->stmt.return_stmt == 0))
        return parser_error("Failed to parse return statement content", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' after statement", token);
        token = peek_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
            token = next_token(lexer);  // consume ';'
    }
    return statement;
}

static OperatorType str_to_type(string op) {
    OperatorType op_type = OP_NONE;
    if (string_equal(op, ADD_SYMBOL))
        op_type = OP_ADD;
    else if (string_equal(op, SUB_SYMBOL))
        op_type = OP_SUB;
    else if (string_equal(op, MUL_SYMBOL))
        op_type = OP_MUL;
    else if (string_equal(op, DIV_SYMBOL))
        op_type = OP_DIV;
    else if (string_equal(op, MOD_SYMBOL))
        op_type = OP_MOD;
    else if (string_equal(op, EQ_SYMBOL))
        op_type = OP_EQ;
    else if (string_equal(op, NE_SYMBOL))
        op_type = OP_NE;
    else if (string_equal(op, LT_SYMBOL))
        op_type = OP_LT;
    else if (string_equal(op, GT_SYMBOL))
        op_type = OP_GT;
    else if (string_equal(op, LE_SYMBOL))
        op_type = OP_LE;
    else if (string_equal(op, GE_SYMBOL))
        op_type = OP_GE;
    else if (string_equal(op, AND_SYMBOL))
        op_type = OP_AND;
    else if (string_equal(op, OR_SYMBOL))
        op_type = OP_OR;
    else if (string_equal(op, ASSIGN_SYMBOL))
        op_type = OP_ASSIGN;
    else if (string_equal(op, ADD_ASSIGN_SYMBOL))
        op_type = OP_ADD_ASSIGN;
    else if (string_equal(op, SUB_ASSIGN_SYMBOL))
        op_type = OP_SUB_ASSIGN;
    else if (string_equal(op, MUL_ASSIGN_SYMBOL))
        op_type = OP_MUL_ASSIGN;
    else if (string_equal(op, DIV_ASSIGN_SYMBOL))
        op_type = OP_DIV_ASSIGN;
    else if (string_equal(op, MOD_ASSIGN_SYMBOL))
        op_type = OP_MOD_ASSIGN;
    return op_type;
}

static offset(Expression*) parse_expr_rhs(offset(Lexer*) lexer, int expr_prec, offset(Expression*) left) {
    while (true) {
        token = peek_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);

        OperatorType op_type = OP_NONE;
        if (token_ptr->type == SYMBOL)
            op_type = str_to_type(token_ptr->lexeme);
        if (op_type == OP_NONE) {
            if (left == 0)
                return parser_error("Failed to parse left-hand side expression", token);
            return left;
        }
        int token_prec = operator_precedence(op_type);

        if (token_prec < expr_prec) {
            if (left == 0)
                return parser_error("Failed to parse left-hand side expression", token);
            return left;
        }
        next_token(lexer);  // consume operator

        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        offset(Expression*) right = create_expression(parse_primary(lexer), OP_NONE);
        if (right == 0)
            return parser_error("Failed to parse right-hand side expression", token);

        token = peek_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);

        OperatorType next_op_type = OP_NONE;
        if (token_ptr->type == SYMBOL)
            next_op_type = str_to_type(token_ptr->lexeme);
        int next_prec = operator_precedence(next_op_type);

        if (token_prec < next_prec) {
            right = parse_expr_rhs(lexer, token_prec + 1, right);
            if (right == 0)
                return parser_error("Failed to parse right-hand side expression", token);
        }

        offset(Expression*) temp = create_expression(0, op_type);
        Expression* temp_ptr = (Expression*)offset_to_ptr(temp);
        temp_ptr->left = left;
        temp_ptr->right = right;
        left = temp;
    }
}

offset(Expression*) parse_expression(offset(Lexer*) lexer) {
    offset(Primary*) prim = parse_primary(lexer);
    if (prim == 0)
        return parser_error("Failed to parse primary", token);
    offset(Expression*) temp = parse_expr_rhs(lexer, 0, create_expression(prim, OP_NONE));
    if (temp == 0)
        return parser_error("Failed to parse expression", token);
    return temp;
}

offset(If*) parse_if(offset(Lexer*) lexer) {
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'if'", token);
    token = next_token(lexer);
    offset(Expression*) condition = parse_expression(lexer);
    if (condition == 0)
        return parser_error("Failed to parse if statement condition", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after if statement condition", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start if statement body", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) body = 0;
    bool have_return_statement = false;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) stmt = parse_statement(lexer);
        if (stmt != 0) {
            Statement* stmt_ptr = (Statement*)offset_to_ptr(stmt);
            if ((stmt_ptr->type == BREAK_STATEMENT || stmt_ptr->type == CONTINUE_STATEMENT) && !in_loop)
                parser_error("Break/Continue statement not within a loop", token);
            else if (have_return_statement)
                parser_error("Unreachable code after return statement", token);
            else {
                stmt_ptr->next = body;
                body = stmt;
            }
            if (stmt_ptr->type == RETURN_STATEMENT)
                have_return_statement = true;
        } else
            parser_error("Failed to parse statement in if body", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    token = peek_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) else_body = 0;
    offset(If*) elif = 0;
    if (token_ptr->type == KEYWORD) {
        if (string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
            next_token(lexer);  // consume 'elif'
            elif = parse_if(lexer);
        } else if (string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
            next_token(lexer);  // consume 'else'
            token = next_token(lexer);
            token_ptr = (Token*)offset_to_ptr(token);
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
                return parser_error("Expected '{' to start else statement body", token);
            token = next_token(lexer);
            token_ptr = (Token*)offset_to_ptr(token);
            have_return_statement = false;
            while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
                offset(Statement*) stmt = parse_statement(lexer);
                if (stmt != 0) {
                    Statement* stmt_ptr = (Statement*)offset_to_ptr(stmt);
                    if ((stmt_ptr->type == BREAK_STATEMENT || stmt_ptr->type == CONTINUE_STATEMENT) && !in_loop)
                        parser_error("Break/Continue statement not within a loop", token);
                    else if (have_return_statement)
                        parser_error("Unreachable code after return statement", token);
                    else {
                        stmt_ptr->next = else_body;
                        else_body = stmt;
                    }
                    if (stmt_ptr->type == RETURN_STATEMENT)
                        have_return_statement = true;
                } else
                    parser_error("Failed to parse statement in else body", token);
                token = next_token(lexer);
                token_ptr = (Token*)offset_to_ptr(token);
            }
        }
    }
    offset(If*) if_stmt = create_if();
    If* if_ptr = (If*)offset_to_ptr(if_stmt);
    if_ptr->condition = condition;
    if_ptr->body = body;
    if_ptr->else_if = elif;
    if_ptr->else_body = else_body;
    return if_stmt;
}

offset(While*) parse_while(offset(Lexer*) lexer) {
    in_loop = true;
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'while'", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Expression*) condition = parse_expression(lexer);
    if (condition == 0)
        return parser_error("Failed to parse while statement condition", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return parser_error("Expected ')' after while statement condition", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start while statement body", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) body = 0;
    bool have_return_statement = false;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) stmt = parse_statement(lexer);
        if (stmt != 0) {
            if (have_return_statement)
                parser_error("Unreachable code after return statement", token);
            else {
                Statement* stmt_ptr = (Statement*)offset_to_ptr(stmt);
                stmt_ptr->next = body;
                body = stmt;
                if (stmt_ptr->type == RETURN_STATEMENT)
                    have_return_statement = true;
            }
        } else
            parser_error("Failed to parse statement in while body", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    offset(While*) while_stmt = create_while();
    While* while_ptr = (While*)offset_to_ptr(while_stmt);
    while_ptr->condition = condition;
    while_ptr->body = body;
    in_loop = false;
    return while_stmt;
}

offset(For*) parse_for(offset(Lexer*) lexer) {
    in_loop = true;
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL))
        return parser_error("Expected '(' after 'for'", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(lexer);
    offset(Variable*) initialization = 0;
    offset(Expression*) condition = 0;
    offset(Expression*) increment = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        initialization = parse_variable(lexer);
        if (initialization == 0)
            parser_error("Failed to parse for loop initialization", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
            return parser_error("Expected ';' after for loop initialization", token);
    }
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        condition = parse_expression(lexer);
        if (condition == 0)
            parser_error("Failed to parse for loop condition", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
            return parser_error("Expected ';' after for loop condition", token);
    }
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        increment = parse_expression(lexer);
        if (increment == 0)
            parser_error("Failed to parse for loop increment", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ')' after for loop increment", token);
    }
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL))
        return parser_error("Expected '{' to start for statement body", token);
    token = next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    offset(Statement*) body = 0;
    bool have_return_statement = false;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        offset(Statement*) stmt = parse_statement(lexer);
        if (stmt != 0) {
            if (have_return_statement)
                parser_error("Unreachable code after return statement", token);
            else {
                Statement* stmt_ptr = (Statement*)offset_to_ptr(stmt);
                stmt_ptr->next = body;
                body = stmt;
                if (stmt_ptr->type == RETURN_STATEMENT)
                    have_return_statement = true;
            }
        } else
            parser_error("Failed to parse statement in for body", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    offset(For*) for_stmt = create_for();
    For* for_ptr = (For*)offset_to_ptr(for_stmt);
    for_ptr->initialization = initialization;
    for_ptr->condition = condition;
    for_ptr->increment = increment;
    for_ptr->body = body;
    in_loop = false;
    return for_stmt;
}

offset(Primary*) parse_primary(offset(Lexer*) lexer) {
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == INTEGER || token_ptr->type == FLOAT || token_ptr->type == STRING || (token_ptr->type == KEYWORD && (string_equal(token_ptr->lexeme, TRUE_KEYWORD) || string_equal(token_ptr->lexeme, FALSE_KEYWORD)))) {
        PrimaryType type;
        if (token_ptr->type == INTEGER)
            type = PRIM_INTEGER;
        else if (token_ptr->type == FLOAT)
            type = PRIM_FLOAT;
        else if (token_ptr->type == STRING)
            type = PRIM_STRING;
        else
            type = PRIM_STRING;
        offset(Primary*) primary = create_primary(type);
        ((Primary*)offset_to_ptr(primary))->value.string_value = token_ptr->lexeme;
        return primary;
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        token = next_token(lexer);
        offset(Expression*) expr = parse_expression(lexer);
        if (expr == 0)
            return parser_error("Failed to parse expression in parentheses", token);
        token = next_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
            return parser_error("Expected ')' after expression", token);
        offset(Primary*) primary = create_primary(PRIM_EXPRESSION);
        ((Primary*)offset_to_ptr(primary))->value.expr = expr;
        return primary;
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
        token = next_token(lexer);
        offset(Primary*) operand = parse_primary(lexer);
        if (operand == 0)
            return parser_error("Failed to parse operand for unary '!' operator", token);
        offset(Primary*) primary = create_primary(PRIM_NOT_OPERAND);
        ((Primary*)offset_to_ptr(primary))->value.operand = operand;
        return primary;
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
        token = next_token(lexer);
        offset(Primary*) operand = parse_primary(lexer);
        if (operand == 0)
            return parser_error("Failed to parse operand for unary '-' operator", token);
        offset(Primary*) primary = create_primary(PRIM_NEGATE_OPERAND);
        ((Primary*)offset_to_ptr(primary))->value.operand = operand;
        return primary;
    } else if (token_ptr->type == IDENTIFIER || (in_method && token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
        offset(VariableAccess*) var_access = parse_variable_access(lexer);
        if (var_access == 0)
            return parser_error("Failed to parse variable access", token);
        offset(Primary*) primary = create_primary(PRIM_VARIABLE_ACCESS);
        ((Primary*)offset_to_ptr(primary))->value.var_access = var_access;
        return primary;
    } else
        return parser_error("Unexpected token in primary expression", token);
}

offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer) {
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type != IDENTIFIER && !(in_method && token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD)))
        return parser_error("Expected identifier in variable access", token);
    offset(VariableAccess*) var_access = create_variable_access(ACCESS_NONE);
    ((VariableAccess*)offset_to_ptr(var_access))->name = token_ptr->lexeme;
    while (true) {
        token = peek_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
        if (token_ptr->type == SYMBOL) {
            if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
                next_token(lexer);  // consume '('
                offset(Arguments*) args = parse_arguments(lexer);
                token = next_token(lexer);
                token_ptr = (Token*)offset_to_ptr(token);
                if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
                    return parser_error("Expected ')' after function arguments", token);
                offset(VariableAccess*) func_call = create_variable_access(ACCESS_FUNCTION_CALL);
                VariableAccess* func_call_ptr = (VariableAccess*)offset_to_ptr(func_call);
                func_call_ptr->base = var_access;
                func_call_ptr->access.func_call = args;
                var_access = func_call;
            } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
                next_token(lexer);  // consume '['
                token = next_token(lexer);
                offset(Expression*) index_expr = parse_expression(lexer);
                if (index_expr == 0)
                    return parser_error("Failed to parse index expression", token);
                token = next_token(lexer);
                token_ptr = (Token*)offset_to_ptr(token);
                if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL))
                    return parser_error("Expected ']' after index expression", token);
                offset(VariableAccess*) seq_access = create_variable_access(ACCESS_GET_SEQ);
                VariableAccess* seq_access_ptr = (VariableAccess*)offset_to_ptr(seq_access);
                seq_access_ptr->base = var_access;
                seq_access_ptr->access.get_seq = index_expr;
                var_access = seq_access;
            } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
                next_token(lexer);  // consume '.'
                token = next_token(lexer);
                token_ptr = (Token*)offset_to_ptr(token);
                if (token_ptr->type != IDENTIFIER)
                    return parser_error("Expected identifier after '.'", token);
                offset(VariableAccess*) attr_access = create_variable_access(ACCESS_GET_ATTR);
                VariableAccess* attr_access_ptr = (VariableAccess*)offset_to_ptr(attr_access);
                attr_access_ptr->base = var_access;
                attr_access_ptr->access.get_attr = token_ptr->lexeme;
                var_access = attr_access;
            } else
                break;
        } else
            break;
    }
    return var_access;
}

offset(Arguments*) parse_arguments(offset(Lexer*) lexer) {
    token = peek_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
        return 0;
    offset(Arguments*) args = 0;
    token = next_token(lexer);
    offset(Expression*) expr = parse_expression(lexer);
    if (expr == 0)
        return parser_error("Failed to parse argument expression", token);
    offset(Arguments*) arg = create_arguments();
    Arguments* arg_ptr = (Arguments*)offset_to_ptr(arg);
    arg_ptr->args = expr;
    arg_ptr->next = args;
    args = arg;
    token = peek_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    while (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
        next_token(lexer);  // consume ','
        token = next_token(lexer);
        expr = parse_expression(lexer);
        if (expr == 0)
            return parser_error("Failed to parse argument expression", token);
        arg = create_arguments();
        arg_ptr = (Arguments*)offset_to_ptr(arg);
        arg_ptr->args = expr;
        arg_ptr->next = args;
        args = arg;
        token = peek_token(lexer);
        token_ptr = (Token*)offset_to_ptr(token);
    }
    return args;
}

void output_ast(offset(Code*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Code: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Code {\n");
    Code* node = (Code*)offset_to_ptr(ast_node);
    offset(Import*) import = node->imports;
    while (import != 0) {
        Import* import_ptr = (Import*)offset_to_ptr(import);
        output_import(import, outfile, indent + 1);
        import = import_ptr->next;
    }
    offset(Function*) function = node->functions;
    while (function != 0) {
        Function* function_ptr = (Function*)offset_to_ptr(function);
        output_function(function, outfile, indent + 1);
        function = function_ptr->next;
    }
    offset(Class*) class = node->classes;
    while (class != 0) {
        Class* class_ptr = (Class*)offset_to_ptr(class);
        output_class(class, outfile, indent + 1);
        class = class_ptr->next;
    }
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_import(offset(Import*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Import: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Import {\n");
    Import* node = (Import*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    fprintf(outfile, "name: '%s'\n", node->name ? string_to_char_ptr(node->name) : "NULL");
    indention(outfile, indent + 1);
    fprintf(outfile, "source: '%s'\n", node->name ? string_to_char_ptr(node->source) : "NULL");
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_function(offset(Function*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Function: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Function {\n");
    Function* node = (Function*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    fprintf(outfile, "name: '%s'\n", string_to_char_ptr(node->name));
    indention(outfile, indent + 1);
    fprintf(outfile, "return_type: '%s'\n", string_to_char_ptr(node->return_type));
    indention(outfile, indent + 1);
    fprintf(outfile, "parameters {\n");
    offset(Variable*) param = node->parameters;
    while (param != 0) {
        Variable* param_ptr = (Variable*)offset_to_ptr(param);
        output_variable(param, outfile, indent + 2);
        param = param_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent + 1);
    fprintf(outfile, "body {\n");
    offset(Statement*) body = node->body;
    while (body != 0) {
        Statement* body_ptr = (Statement*)offset_to_ptr(body);
        output_statement(body, outfile, indent + 2);
        body = body_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_class(offset(Class*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Class: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Class {\n");
    Class* node = (Class*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    fprintf(outfile, "name: '%s'\n", string_to_char_ptr(node->name));
    indention(outfile, indent + 1);
    fprintf(outfile, "methods {\n");
    offset(Function*) method = node->methods;
    while (method != 0) {
        Function* method_ptr = (Function*)offset_to_ptr(method);
        output_function(method, outfile, indent + 2);
        method = method_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent + 1);
    fprintf(outfile, "attributes {\n");
    offset(Variable*) attribute = node->attributes;
    while (attribute != 0) {
        Variable* attribute_ptr = (Variable*)offset_to_ptr(attribute);
        output_variable(attribute, outfile, indent + 2);
        attribute = attribute_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_variable(offset(Variable*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Variable: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Variable {\n");
    Variable* node = (Variable*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    fprintf(outfile, "type: '%s'\n", string_to_char_ptr(node->type));
    indention(outfile, indent + 1);
    fprintf(outfile, "name: '%s'\n", string_to_char_ptr(node->name));
    output_expression(node->value, outfile, indent + 1);
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_statement(offset(Statement*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Statement: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Statement {\n");
    Statement* node = (Statement*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    if (node->type == EXPRESSION_STATEMENT) {
        fprintf(outfile, "type: expression\n");
        output_expression(node->stmt.expr, outfile, indent + 1);
    } else if (node->type == VARIABLE_STATEMENT) {
        fprintf(outfile, "type: variable_declaration\n");
        output_variable(node->stmt.var_decl, outfile, indent + 1);
    } else if (node->type == IF_STATEMENT) {
        fprintf(outfile, "type: if_statement\n");
        output_if(node->stmt.if_stmt, outfile, indent + 1);
    } else if (node->type == WHILE_STATEMENT) {
        fprintf(outfile, "type: while_statement\n");
        output_while(node->stmt.while_stmt, outfile, indent + 1);
    } else if (node->type == FOR_STATEMENT) {
        fprintf(outfile, "type: for_statement\n");
        output_for(node->stmt.for_stmt, outfile, indent + 1);
    } else if (node->type == RETURN_STATEMENT) {
        fprintf(outfile, "type: return_statement\n");
        output_expression(node->stmt.return_stmt, outfile, indent + 1);
    } else if (node->type == BREAK_STATEMENT)
        fprintf(outfile, "type: break\n");
    else if (node->type == CONTINUE_STATEMENT)
        fprintf(outfile, "type: continue\n");

    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_expression(offset(Expression*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Expression: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Expression {\n");
    Expression* node = (Expression*)offset_to_ptr(ast_node);
    if (node->operator == OP_NONE) {
        indention(outfile, indent + 1);
        fprintf(outfile, "operator: None\n");
        output_primary(node->prim, outfile, indent + 1);
    } else {
        indention(outfile, indent + 1);
        if (node->operator == OP_ADD) fprintf(outfile, "operator: +\n");
        else if (node->operator == OP_SUB) fprintf(outfile, "operator: -\n");
        else if (node->operator == OP_MUL) fprintf(outfile, "operator: *\n");
        else if (node->operator == OP_DIV) fprintf(outfile, "operator: /\n");
        else if (node->operator == OP_MOD) fprintf(outfile, "operator: %%\n");
        else if (node->operator == OP_EQ) fprintf(outfile, "operator: ==\n");
        else if (node->operator == OP_NE) fprintf(outfile, "operator: !=\n");
        else if (node->operator == OP_LT) fprintf(outfile, "operator: <\n");
        else if (node->operator == OP_GT) fprintf(outfile, "operator: >\n");
        else if (node->operator == OP_LE) fprintf(outfile, "operator: <=\n");
        else if (node->operator == OP_GE) fprintf(outfile, "operator: >=\n");
        else if (node->operator == OP_AND) fprintf(outfile, "operator: &&\n");
        else if (node->operator == OP_OR) fprintf(outfile, "operator: ||\n");
        else if (node->operator == OP_ASSIGN) fprintf(outfile, "operator: =\n");
        else if (node->operator == OP_ADD_ASSIGN) fprintf(outfile, "operator: +=\n");
        else if (node->operator == OP_SUB_ASSIGN) fprintf(outfile, "operator: -=\n");
        else if (node->operator == OP_MUL_ASSIGN) fprintf(outfile, "operator: *=\n");
        else if (node->operator == OP_DIV_ASSIGN) fprintf(outfile, "operator: /=\n");
        else if (node->operator == OP_MOD_ASSIGN) fprintf(outfile, "operator: %%=\n");
        else fprintf(outfile, "operator: UNKNOWN\n");
        output_expression(node->left, outfile, indent + 1);
        output_expression(node->right, outfile, indent + 1);
    }
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_if(offset(If*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "If: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "If{\n");
    If* node = (If*)offset_to_ptr(ast_node);
    output_expression(node->condition, outfile, indent + 1);
    indention(outfile, indent + 1);
    fprintf(outfile, "body {\n");
    offset(Statement*) body_stmt = node->body;
    while (body_stmt != 0) {
        Statement* body_ptr = (Statement*)offset_to_ptr(body_stmt);
        output_statement(body_stmt, outfile, indent + 2);
        body_stmt = body_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    output_if(node->else_if, outfile, indent + 1);
    indention(outfile, indent + 1);
    fprintf(outfile, "else_body {\n");
    offset(Statement*) else_body_stmt = node->else_body;
    while (else_body_stmt != 0) {
        Statement* else_body_ptr = (Statement*)offset_to_ptr(else_body_stmt);
        output_statement(else_body_stmt, outfile, indent + 2);
        else_body_stmt = else_body_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_while(offset(While*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "While: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "While {\n");
    While* node = (While*)offset_to_ptr(ast_node);
    output_expression(node->condition, outfile, indent + 1);
    indention(outfile, indent + 1);
    fprintf(outfile, "body {\n");
    offset(Statement*) body_stmt = node->body;
    while (body_stmt != 0) {
        Statement* body_ptr = (Statement*)offset_to_ptr(body_stmt);
        output_statement(body_stmt, outfile, indent + 2);
        body_stmt = body_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_for(offset(For*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "For: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "For {\n");
    For* node = (For*)offset_to_ptr(ast_node);
    output_variable(node->initialization, outfile, indent + 1);
    output_expression(node->condition, outfile, indent + 1);
    output_expression(node->increment, outfile, indent + 1);
    indention(outfile, indent + 1);
    fprintf(outfile, "body {\n");
    offset(Statement*) body_stmt = node->body;
    while (body_stmt != 0) {
        Statement* body_ptr = (Statement*)offset_to_ptr(body_stmt);
        output_statement(body_stmt, outfile, indent + 2);
        body_stmt = body_ptr->next;
    }
    indention(outfile, indent + 1);
    fprintf(outfile, "}\n");
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_primary(offset(Primary*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Primary: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Primary {\n");
    Primary* node = (Primary*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    if (node->type == PRIM_INTEGER) {
        fprintf(outfile, "type: integer\n");
        indention(outfile, indent + 1);
        fprintf(outfile, "value: %s\n", string_to_char_ptr(node->value.string_value));
    } else if (node->type == PRIM_FLOAT) {
        fprintf(outfile, "type: float\n");
        indention(outfile, indent + 1);
        fprintf(outfile, "value: %s\n", string_to_char_ptr(node->value.string_value));
    } else if (node->type == PRIM_STRING) {
        fprintf(outfile, "type: string\n");
        indention(outfile, indent + 1);
        fprintf(outfile, "value: '%s'\n", string_to_char_ptr(node->value.string_value));
    } else if (node->type == PRIM_TRUE)
        fprintf(outfile, "type: true\n");
    else if (node->type == PRIM_FALSE)
        fprintf(outfile, "type: false\n");
    else if (node->type == PRIM_EXPRESSION) {
        fprintf(outfile, "type: expression\n");
        output_expression(node->value.expr, outfile, indent + 1);
    } else if (node->type == PRIM_NOT_OPERAND) {
        fprintf(outfile, "type: not_operand\n");
        output_primary(node->value.operand, outfile, indent + 1);
    } else if (node->type == PRIM_NEGATE_OPERAND) {
        fprintf(outfile, "type: negate_operand\n");
        output_primary(node->value.operand, outfile, indent + 1);
    } else if (node->type == PRIM_VARIABLE_ACCESS) {
        fprintf(outfile, "type: variable_access\n");
        output_variable_access(node->value.var_access, outfile, indent + 1);
    }
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_variable_access(offset(VariableAccess*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "VariableAccess: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "VariableAccess {\n");
    VariableAccess* node = (VariableAccess*)offset_to_ptr(ast_node);
    indention(outfile, indent + 1);
    fprintf(outfile, "name: '%s'\n", string_to_char_ptr(node->name));
    if (node->base != 0) {
        indention(outfile, indent + 1);
        fprintf(outfile, "base {\n");
        output_variable_access(node->base, outfile, indent + 2);
        indention(outfile, indent + 1);
        fprintf(outfile, "}\n");
    }
    if (node->access_type == ACCESS_FUNCTION_CALL) {
        indention(outfile, indent + 1);
        fprintf(outfile, "access_type: function_call\n");
        indention(outfile, indent + 1);
        fprintf(outfile, "arguments {\n");
        offset(Arguments*) args = node->access.func_call;
        while (args != 0) {
            Arguments* args_ptr = (Arguments*)offset_to_ptr(args);
            output_arguments(args, outfile, indent + 2);
            args = args_ptr->next;
        }
        indention(outfile, indent + 1);
        fprintf(outfile, "}\n");
    } else if (node->access_type == ACCESS_GET_SEQ) {
        indention(outfile, indent + 1);
        fprintf(outfile, "access_type: get_sequence\n");
        output_expression(node->access.get_seq, outfile, indent + 1);
    } else if (node->access_type == ACCESS_GET_ATTR) {
        indention(outfile, indent + 1);
        fprintf(outfile, "access_type: get_attribute\n");
        indention(outfile, indent + 1);
        fprintf(outfile, "attribute_name: '%s'\n", string_to_char_ptr(node->access.get_attr));
    } else {
        indention(outfile, indent + 1);
        fprintf(outfile, "access_type: none\n");
    }
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}

void output_arguments(offset(Arguments*) ast_node, FILE* outfile, size_t indent) {
    if (ast_node == 0) {
        indention(outfile, indent);
        fprintf(outfile, "Arguments: NULL\n");
        return;
    }
    indention(outfile, indent);
    fprintf(outfile, "Arguments {\n");
    Arguments* node = (Arguments*)offset_to_ptr(ast_node);
    output_expression(node->args, outfile, indent + 1);
    indention(outfile, indent);
    fprintf(outfile, "}\n");
}
