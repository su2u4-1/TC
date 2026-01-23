#include "parser.h"

#include "lexer.h"
#include "lib.h"

#define list(type) offset(List(type)*)

// helper functions
// `static list<void*> create_list()`
static list() create_list(void) {
    offset(List*) new_list = alloc_memory(sizeof(List));
    List* list_ptr = (List*)offset_to_ptr(new_list);
    list_ptr->head = 0;
    list_ptr->tail = 0;
    return new_list;
}
// `static Node* create_node(void* content)`
static offset(Node*) create_node(offset() content) {
    offset(Node*) new_node = alloc_memory(sizeof(Node));
    Node* node_ptr = (Node*)offset_to_ptr(new_node);
    node_ptr->next = 0;
    node_ptr->content = content;
    return new_node;
}
// `static Name* create_name(string name, size_t id)`
static offset(Name*) create_name(string name, size_t id) {
    offset(Name*) new_name = alloc_memory(sizeof(Name));
    Name* name_ptr = (Name*)offset_to_ptr(new_name);
    name_ptr->name = name;
    name_ptr->id = id;
    return new_name;
}
// `static Scope* create_scope(offset(Scope*) parent)`
static offset(Scope*) create_scope(offset(Scope*) parent) {
    offset(Scope*) new_scope = alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (Scope*)offset_to_ptr(new_scope);
    scope_ptr->parent = parent;
    scope_ptr->names = create_list();
    return new_scope;
}
// `static Name* search(Scope* scope, string name)`
static offset(Name*) search(offset(Scope*) scope, string name) {
    Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
    while (scope_ptr != NULL) {
        list(Name*) names = scope_ptr->names;
        offset(Node*) current = ((List*)offset_to_ptr(names))->head;
        while (current != 0) {
            Node* node_ptr = (Node*)offset_to_ptr(current);
            offset(Name*) current_name = (node_ptr)->content;
            if (string_equal(((Name*)offset_to_ptr(current_name))->name, name))
                return current_name;
            current = node_ptr->next;
        }
        scope_ptr = (Scope*)offset_to_ptr(scope_ptr->parent);
    }
    return 0;
}
// `static void list_append(list<void*>* list, void* item)`
static void list_append(list() list, offset() item) {
    offset(Node*) new_node = create_node(item);
    List* list_ptr = (List*)offset_to_ptr(list);
    if (list_ptr->head == 0) {
        list_ptr->head = new_node;
        list_ptr->tail = new_node;
    } else {
        Node* tail_ptr = (Node*)offset_to_ptr(list_ptr->tail);
        tail_ptr->next = new_node;
        list_ptr->tail = new_node;
    }
}
// `static bool is_builtin_type(string type)`
static bool is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}
// `static size_t parser_error(const char* message, offset(Token*) token)`
static size_t parser_error(const char* message, offset(Token*) token) {
    Token* token_ptr = (Token*)offset_to_ptr(token);
    fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token_ptr->line + 1, token_ptr->column + 1, message);
    return 0;
}
static offset(Token*) token = 0;
static Token* token_ptr = NULL;
static offset(Token*) current_token = 0;
// `static Token* get_next_token(Lexer* lexer)`
static offset(Token*) next_token(offset(Lexer*) lexer) {
    while (true) {
        current_token = get_next_token(lexer);
        if (current_token == 0) {
            fprintf(stderr, "Error: get_next_token returned NULL\n");
            token = 0;
            token_ptr = NULL;
            return token;
        }
        if (((Token*)offset_to_ptr(current_token))->type != COMMENT)
            break;
    }
    token = current_token;
    token_ptr = (Token*)offset_to_ptr(token);
    return token;
}
// `static Token* peek_current_token(void)`
static offset(Token*) peek_current_token(void) {
    token = current_token;
    token_ptr = (Token*)offset_to_ptr(token);
    return token;
}
// `static Token* peek_next_token(Lexer* lexer)`
static offset(Token*) peek_token(offset(Lexer*) lexer) {
    token = peek_next_token(lexer);
    token_ptr = (Token*)offset_to_ptr(token);
    return token;
}
static bool in_function = false;
static bool in_method = false;
static bool in_loop = false;

// create struct functions
// `static CodeMember* create_code_member(CodeMemberType type, (Import* | Function* | Class*) content)`
static offset(CodeMember*) create_code_member(CodeMemberType type, offset(Import* | Function * | Class*) content) {
    if (content == 0) {
        fprintf(stderr, "Error creating code member: content is NULL\n");
        return 0;
    }
    offset(CodeMember*) code_member = alloc_memory(sizeof(CodeMember));
    CodeMember* code_member_ptr = (CodeMember*)offset_to_ptr(code_member);
    code_member_ptr->type = type;
    if (type == CODE_IMPORT)
        code_member_ptr->content.import = content;
    else if (type == CODE_FUNCTION)
        code_member_ptr->content.function = content;
    else if (type == CODE_CLASS)
        code_member_ptr->content.class_ = content;
    else {
        fprintf(stderr, "Error creating code member: unknown type %d\n", type);
        return 0;
    }
    return code_member;
}
// `static Code* create_code(list<CodeMember*>* members, Scope* global_scope)`
static offset(Code*) create_code(list(CodeMember*) members, offset(Scope*) global_scope) {
    offset(Code*) code = alloc_memory(sizeof(Code));
    Code* code_ptr = (Code*)offset_to_ptr(code);
    code_ptr->members = members;
    code_ptr->global_scope = global_scope;
    return code;
}
// `static Import* create_import(string name, string source)`
static offset(Import*) create_import(string name, string source) {
    if (name == 0) {
        fprintf(stderr, "Error creating import: name is NULL\n");
        return 0;
    }
    offset(Import*) import = alloc_memory(sizeof(Import));
    Import* import_ptr = (Import*)offset_to_ptr(import);
    import_ptr->name = name;
    import_ptr->source = source;
    return import;
}
// `static Function* create_function(string name, string return_type, list<Variable*>* parameters, list<Statement*>* body, Scope* function_scope)`
static offset(Function*) create_function(string name, string return_type, list(Variable*) parameters, list(Statement*) body, offset(Scope*) function_scope) {
    if (name == 0 || return_type == 0) {
        fprintf(stderr, "Error creating function: name or return_type is NULL\n");
        return 0;
    }
    offset(Function*) function = alloc_memory(sizeof(Function));
    Function* function_ptr = (Function*)offset_to_ptr(function);
    function_ptr->name = name;
    function_ptr->return_type = return_type;
    function_ptr->parameters = parameters;
    function_ptr->body = body;
    function_ptr->function_scope = function_scope;
    return function;
}
// `static Method* create_method(string name, string return_type, list<Variable*>* parameters, list<Statement*>* body, Scope* method_scope)`
static offset(Method*) create_method(string name, string return_type, list(Variable*) parameters, list(Statement*) body, offset(Scope*) method_scope) {
    if (name == 0 || return_type == 0) {
        fprintf(stderr, "Error creating method: name or return_type is NULL\n");
        return 0;
    }
    offset(Method*) method = alloc_memory(sizeof(Method));
    Method* method_ptr = (Method*)offset_to_ptr(method);
    method_ptr->name = name;
    method_ptr->return_type = return_type;
    method_ptr->parameters = parameters;
    method_ptr->body = body;
    method_ptr->method_scope = method_scope;
    return method;
}
// `static ClassMember* create_class_member(ClassMemberType type, (Method* | Variable*) content)`
static offset(ClassMember*) create_class_member(ClassMemberType type, offset(Method* | Variable*) content) {
    if (content == 0) {
        fprintf(stderr, "Error creating class member: content is NULL\n");
        return 0;
    }
    offset(ClassMember*) class_member = alloc_memory(sizeof(ClassMember));
    ClassMember* class_member_ptr = (ClassMember*)offset_to_ptr(class_member);
    class_member_ptr->type = type;
    if (type == CLASS_METHOD)
        class_member_ptr->content.method = content;
    else if (type == CLASS_VARIABLE)
        class_member_ptr->content.variable = content;
    else {
        fprintf(stderr, "Error creating class member: unknown type %d\n", type);
        return 0;
    }
    return class_member;
}
// `static Class* create_class(stirng name, list<ClassMember*>* members, Scope* class_scope)`
static offset(Class*) create_class(string name, list(ClassMember*) members, offset(Scope*) class_scope) {
    if (name == 0) {
        fprintf(stderr, "Error creating class: name is NULL\n");
        return 0;
    }
    offset(Class*) class = alloc_memory(sizeof(Class));
    Class* class_ptr = (Class*)offset_to_ptr(class);
    class_ptr->name = name;
    class_ptr->members = members;
    class_ptr->class_scope = class_scope;
    return class;
}
// `static Variable* create_variable(string type, string name, Expression* value)`
static offset(Variable*) create_variable(string type, string name, offset(Expression*) value) {
    if (type == 0 || name == 0) {
        fprintf(stderr, "Error creating variable: type or name is NULL\n");
        return 0;
    }
    offset(Variable*) variable = alloc_memory(sizeof(Variable));
    Variable* variable_ptr = (Variable*)offset_to_ptr(variable);
    variable_ptr->type = type;
    variable_ptr->name = name;
    variable_ptr->value = value;
    return variable;
}
// `static Statement* create_statement(StatementType type, (If* | While* | For* | Expression* | Variable* | Expression* ) stmt)`
static offset(Statement*) create_statement(StatementType type, offset(If* | While * | For * | Expression * | Variable*) stmt) {
    offset(Statement*) statement = alloc_memory(sizeof(Statement));
    Statement* statement_ptr = (Statement*)offset_to_ptr(statement);
    statement_ptr->type = type;
    if (type == EXPRESSION_STATEMENT)
        statement_ptr->stmt.expr = stmt;
    else if (type == VARIABLE_STATEMENT)
        statement_ptr->stmt.var = stmt;
    else if (type == IF_STATEMENT)
        statement_ptr->stmt.if_stmt = stmt;
    else if (type == WHILE_STATEMENT)
        statement_ptr->stmt.while_stmt = stmt;
    else if (type == FOR_STATEMENT)
        statement_ptr->stmt.for_stmt = stmt;
    else if (type == RETURN_STATEMENT)
        statement_ptr->stmt.return_expr = stmt;
    else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
        statement_ptr->stmt.expr = 0;
    else {
        fprintf(stderr, "Error creating statement: unknown type %d\n", type);
        return 0;
    }
    return statement;
}
// `static If* create_if(Expression* condition, list<Statement*>* body, list<ElseIf*>* else_if, list<Statement*>* else_body)`
static offset(If*) create_if(offset(Expression*) condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body) {
    if (condition == 0) {
        fprintf(stderr, "Error creating if statement: condition is NULL\n");
        return 0;
    }
    offset(If*) if_ = alloc_memory(sizeof(If));
    If* if_ptr = (If*)offset_to_ptr(if_);
    if_ptr->condition = condition;
    if_ptr->body = body;
    if_ptr->else_if = else_if;
    if_ptr->else_body = else_body;
    return if_;
}
// `static ElseIf* create_else_if(Expression* condition, list<Statement*>* body)`
static offset(ElseIf*) create_else_if(offset(Expression*) condition, list(Statement*) body) {
    if (condition == 0) {
        fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
        return 0;
    }
    offset(ElseIf*) else_if = alloc_memory(sizeof(ElseIf));
    ElseIf* else_if_ptr = (ElseIf*)offset_to_ptr(else_if);
    else_if_ptr->condition = condition;
    else_if_ptr->body = body;
    return else_if;
}
// `static For* create_for(Variable* initializer, Expression* condition, Expression* increment, list<Statement*>* body)`
static offset(For*) create_for(offset(Variable*) initializer, offset(Expression*) condition, offset(Expression*) increment, list(Statement*) body) {
    offset(For*) for_ = alloc_memory(sizeof(For));
    For* for_ptr = (For*)offset_to_ptr(for_);
    for_ptr->initializer = initializer;
    for_ptr->condition = condition;
    for_ptr->increment = increment;
    for_ptr->body = body;
    return for_;
}
// `static While* create_while(Expression* condition, list<Statement*>* body)`
static offset(While*) create_while(offset(Expression*) condition, list(Statement*) body) {
    offset(While*) while_ = alloc_memory(sizeof(While));
    While* while_ptr = (While*)offset_to_ptr(while_);
    while_ptr->condition = condition;
    while_ptr->body = body;
    return while_;
}
// `static Expression* create_expression(OperatorType operator, (Expression* | Primary*) left, Expression* right)`
static offset(Expression*) create_expression(OperatorType operator, offset(Expression* | Primary*) left, offset(Expression*) right) {
    if ((operator == OP_NONE) != (right == 0) || left == 0) {
        fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, left == 0: %s, right == 0: %s\n", operator == OP_NONE ? "true" : "false", left == 0 ? "true" : "false", right == 0 ? "true" : "false");
        return 0;
    }
    offset(Expression*) expression = alloc_memory(sizeof(Expression));
    Expression* expression_ptr = (Expression*)offset_to_ptr(expression);
    expression_ptr->operator = operator;
    expression_ptr->left = left;
    expression_ptr->right = right;
    return expression;
}
// `static Primary* create_primary(PrimaryType type, (string | Expression* | Primary* | VariableAccess*) value)`
static offset(Primary*) create_primary(PrimaryType type, offset(string | Expression * | Primary * | VariableAccess*) value) {
    offset(Primary*) primary = alloc_memory(sizeof(Primary));
    Primary* primary_ptr = (Primary*)offset_to_ptr(primary);
    primary_ptr->type = type;
    if (type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE)
        primary_ptr->value.literal_value = value;
    else if (type == PRIM_EXPRESSION)
        primary_ptr->value.expr = value;
    else if (type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND)
        primary_ptr->value.operand = value;
    else if (type == PRIM_VARIABLE_ACCESS)
        primary_ptr->value.var = value;
    else {
        fprintf(stderr, "Error creating primary: unknown type %d\n", type);
        return 0;
    }
    return primary;
}
// `static VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, (string | Expression*) content)`
static offset(VariableAccess*) create_variable_access(VariableAccessType type, offset(VariableAccess*) base, offset(string | Expression*) content) {
    if ((base == 0) != (type == VAR_NAME)) {
        fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
        return 0;
    }
    offset(VariableAccess*) variable_access = alloc_memory(sizeof(VariableAccess));
    VariableAccess* variable_access_ptr = (VariableAccess*)offset_to_ptr(variable_access);
    variable_access_ptr->type = type;
    variable_access_ptr->base = base;
    if (type == VAR_NAME)
        variable_access_ptr->content.name = content;
    else if (type == VAR_FUNC_CALL)
        variable_access_ptr->content.args = content;
    else if (type == VAR_GET_SEQ)
        variable_access_ptr->content.index = content;
    else if (type == VAR_GET_ATTR)
        variable_access_ptr->content.attr_name = content;
    else {
        fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
        return 0;
    }
    return variable_access;
}

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

// output AST functions
// `static void parse_code_member(CodeMember* code_member, FILE* outfile, size_t indent)`
static void output_code_member(offset(CodeMember*) code_member, FILE* outfile, size_t indent);
// `static void parse_code(Code* code, FILE* outfile, size_t indent)`
static void output_code(offset(Code*) code, FILE* outfile, size_t indent);
// `static void parse_import(Import* import, FILE* outfile, size_t indent)`
static void output_import(offset(Import*) import, FILE* outfile, size_t indent);
// `static void parse_function(Function* function, FILE* outfile, size_t indent)`
static void output_function(offset(Function*) function, FILE* outfile, size_t indent);
// `static void parse_method(Method* method, FILE* outfile, size_t indent)`
static void output_method(offset(Method*) method, FILE* outfile, size_t indent);
// `static void parse_class_member(ClassMember* class_member, FILE* outfile, size_t indent)`
static void output_class_member(offset(ClassMember*) class_member, FILE* outfile, size_t indent);
// `static void parse_class(Class* class, FILE* outfile, size_t indent)`
static void output_class(offset(Class*) class, FILE* outfile, size_t indent);
// `static void parse_variable(Variable* variable, FILE* outfile, size_t indent)`
static void output_variable(offset(Variable*) variable, FILE* outfile, size_t indent);
// `static void parse_statement(Statement* statement, FILE* outfile, size_t indent)`
static void output_statement(offset(Statement*) statement, FILE* outfile, size_t indent);
// `static void parse_if(If* if_, FILE* outfile, size_t indent)`
static void output_if(offset(If*) if_, FILE* outfile, size_t indent);
// `static void parse_else_if(ElseIf* else_if, FILE* outfile, size_t indent)`
static void output_else_if(offset(ElseIf*) else_if, FILE* outfile, size_t indent);
// `static void parse_for(For* for_, FILE* outfile, size_t indent)`
static void output_for(offset(For*) for_, FILE* outfile, size_t indent);
// `static void parse_while(While* while_, FILE* outfile, size_t indent)`
static void output_while(offset(While*) while_, FILE* outfile, size_t indent);
// `static void parse_expression(Expression* expression, FILE* outfile, size_t indent)`
static void output_expression(offset(Expression*) expression, FILE* outfile, size_t indent);
// `static void parse_primary(Primary* primary, FILE* outfile, size_t indent)`
static void output_primary(offset(Primary*) primary, FILE* outfile, size_t indent);
// `static void parse_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent)`
static void output_variable_access(offset(VariableAccess*) variable_access, FILE* outfile, size_t indent);

void output_code_member(offset(CodeMember*) code_member, FILE* outfile, size_t indent) {}
void output_code(offset(Code*) code, FILE* outfile, size_t indent) {}
void output_import(offset(Import*) import, FILE* outfile, size_t indent) {}
void output_function(offset(Function*) function, FILE* outfile, size_t indent) {}
void output_method(offset(Method*) method, FILE* outfile, size_t indent) {}
void output_class_member(offset(ClassMember*) class_member, FILE* outfile, size_t indent) {}
void output_class(offset(Class*) class, FILE* outfile, size_t indent) {}
void output_variable(offset(Variable*) variable, FILE* outfile, size_t indent) {}
void output_statement(offset(Statement*) statement, FILE* outfile, size_t indent) {}
void output_if(offset(If*) if_, FILE* outfile, size_t indent) {}
void output_else_if(offset(ElseIf*) else_if, FILE* outfile, size_t indent) {}
void output_for(offset(For*) for_, FILE* outfile, size_t indent) {}
void output_while(offset(While*) while_, FILE* outfile, size_t indent) {}
void output_expression(offset(Expression*) expression, FILE* outfile, size_t indent) {}
void output_primary(offset(Primary*) primary, FILE* outfile, size_t indent) {}
void output_variable_access(offset(VariableAccess*) variable_access, FILE* outfile, size_t indent) {}

// public functions
offset(Code*) parser(offset(Lexer*) lexer) {
    return parse_code(lexer);
}
int operator_precedence(OperatorType op) {
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
OperatorType string_to_operator(string str) {
    if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
    else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
    else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
    else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
    else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
    else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
    else if (string_equal(str, AND_SYMBOL)) return OP_AND;
    else if (string_equal(str, OR_SYMBOL)) return OP_OR;
    else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
    else if (string_equal(str, NE_SYMBOL)) return OP_NE;
    else if (string_equal(str, LT_SYMBOL)) return OP_LT;
    else if (string_equal(str, GT_SYMBOL)) return OP_GT;
    else if (string_equal(str, LE_SYMBOL)) return OP_LE;
    else if (string_equal(str, GE_SYMBOL)) return OP_GE;
    else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
    else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
    else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
    else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
    else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
    else return OP_NONE;
}
void output_ast(offset(Code*) ast_node, FILE* outfile, size_t indent) {
    output_code(ast_node, outfile, indent);
}

#undef list
