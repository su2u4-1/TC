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
// `static CodeMember* parse_code_member(Lexer* lexer)`
static offset(CodeMember*) parse_code_member(offset(Lexer*) lexer) {
    return 0;
}
// `static Code* parse_code(Lexer* lexer)`
static offset(Code*) parse_code(offset(Lexer*) lexer) {
    return 0;
}
// `static Import* parse_import(Lexer* lexer)`
static offset(Import*) parse_import(offset(Lexer*) lexer) {
    return 0;
}
// `static Function* parse_function(Lexer* lexer)`
static offset(Function*) parse_function(offset(Lexer*) lexer) {
    return 0;
}
// `static Method* parse_method(Lexer* lexer)`
static offset(Method*) parse_method(offset(Lexer*) lexer) {
    return 0;
}
// `static ClassMember* parse_class_member(Lexer* lexer)`
static offset(ClassMember*) parse_class_member(offset(Lexer*) lexer) {
    return 0;
}
// `static Class* parse_class(Lexer* lexer)`
static offset(Class*) parse_class(offset(Lexer*) lexer) {
    return 0;
}
// `static Variable* parse_variable(Lexer* lexer)`
static offset(Variable*) parse_variable(offset(Lexer*) lexer) {
    return 0;
}
// `static Statement* parse_statement(Lexer* lexer)`
static offset(Statement*) parse_statement(offset(Lexer*) lexer) {
    return 0;
}
// `static If* parse_if(Lexer* lexer)`
static offset(If*) parse_if(offset(Lexer*) lexer) {
    return 0;
}
// `static ElseIf* parse_else_if(Lexer* lexer)`
static offset(ElseIf*) parse_else_if(offset(Lexer*) lexer) {
    return 0;
}
// `static For* parse_for(Lexer* lexer)`
static offset(For*) parse_for(offset(Lexer*) lexer) {
    return 0;
}
// `static While* parse_while(Lexer* lexer)`
static offset(While*) parse_while(offset(Lexer*) lexer) {
    return 0;
}
// `static Expression* parse_expression(Lexer* lexer)`
static offset(Expression*) parse_expression(offset(Lexer*) lexer) {
    return 0;
}
// `static Primary* parse_primary(Lexer* lexer)`
static offset(Primary*) parse_primary(offset(Lexer*) lexer) {
    return 0;
}
// `static VariableAccess* parse_variable_access(Lexer* lexer)`
static offset(VariableAccess*) parse_variable_access(offset(Lexer*) lexer) {
    return 0;
}

// output AST functions
// `static void parse_code_member(CodeMember* code_member, FILE* outfile, size_t indent)`
static void output_code_member(offset(CodeMember*) code_member, FILE* outfile, size_t indent) {
}
// `static void parse_code(Code* code, FILE* outfile, size_t indent)`
static void output_code(offset(Code*) code, FILE* outfile, size_t indent) {
}
// `static void parse_import(Import* import, FILE* outfile, size_t indent)`
static void output_import(offset(Import*) import, FILE* outfile, size_t indent) {
}
// `static void parse_function(Function* function, FILE* outfile, size_t indent)`
static void output_function(offset(Function*) function, FILE* outfile, size_t indent) {
}
// `static void parse_method(Method* method, FILE* outfile, size_t indent)`
static void output_method(offset(Method*) method, FILE* outfile, size_t indent) {
}
// `static void parse_class_member(ClassMember* class_member, FILE* outfile, size_t indent)`
static void output_class_member(offset(ClassMember*) class_member, FILE* outfile, size_t indent) {
}
// `static void parse_class(Class* class, FILE* outfile, size_t indent)`
static void output_class(offset(Class*) class, FILE* outfile, size_t indent) {
}
// `static void parse_variable(Variable* variable, FILE* outfile, size_t indent)`
static void output_variable(offset(Variable*) variable, FILE* outfile, size_t indent) {
}
// `static void parse_statement(Statement* statement, FILE* outfile, size_t indent)`
static void output_statement(offset(Statement*) statement, FILE* outfile, size_t indent) {
}
// `static void parse_if(If* if_, FILE* outfile, size_t indent)`
static void output_if(offset(If*) if_, FILE* outfile, size_t indent) {
}
// `static void parse_else_if(ElseIf* else_if, FILE* outfile, size_t indent)`
static void output_else_if(offset(ElseIf*) else_if, FILE* outfile, size_t indent) {
}
// `static void parse_for(For* for_, FILE* outfile, size_t indent)`
static void output_for(offset(For*) for_, FILE* outfile, size_t indent) {
}
// `static void parse_while(While* while_, FILE* outfile, size_t indent)`
static void output_while(offset(While*) while_, FILE* outfile, size_t indent) {
}
// `static void parse_expression(Expression* expression, FILE* outfile, size_t indent)`
static void output_expression(offset(Expression*) expression, FILE* outfile, size_t indent) {
}
// `static void parse_primary(Primary* primary, FILE* outfile, size_t indent)`
static void output_primary(offset(Primary*) primary, FILE* outfile, size_t indent) {
}
// `static void parse_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent)`
static void output_variable_access(offset(VariableAccess*) variable_access, FILE* outfile, size_t indent) {
}

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
void output_ast(offset(Code*) ast_node, FILE* outfile, size_t indent) {
    output_code(ast_node, outfile, indent);
}

#undef list
