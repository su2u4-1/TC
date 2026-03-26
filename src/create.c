#include "create.h"

CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
    CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
    code_member->type = type;
    if (type == CODE_IMPORT && import_content != NULL)
        code_member->content.import = import_content;
    else if (type == CODE_FUNCTION && function_content != NULL)
        code_member->content.function = function_content;
    else if (type == CODE_CLASS && class_content != NULL)
        code_member->content.class = class_content;
    else {
        if (import_content == NULL && function_content == NULL && class_content == NULL)
            fprintf(stderr, "Error creating code member: content is NULL\n");
        else
            fprintf(stderr, "Error creating code member: unknown type %u\n", type);
        return NULL;
    }
    return code_member;
}

Code* create_code(list(CodeMember*) members, SymbolTable* global_scope) {
    Code* code = (Code*)alloc_memory(sizeof(Code));
    code->members = members;
    code->global_scope = global_scope;
    return code;
}

Import* create_import(Symbol* name, string source) {
    if (name == NULL) {
        fprintf(stderr, "Error creating import: name is NULL\n");
        return NULL;
    }
    Import* import = (Import*)alloc_memory(sizeof(Import));
    import->name = name;
    import->source = source;
    return import;
}

Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope) {
    if (name == NULL || return_type == NULL) {
        fprintf(stderr, "Error creating function: name or return_type is NULL\n");
        return NULL;
    }
    function->name = name;
    function->return_type = return_type;
    function->parameters = parameters;
    function->body = body;
    function->function_scope = function_scope;
    return function;
}
Function* create_function(Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* function_scope) {
    if (name == NULL || return_type == NULL) {
        fprintf(stderr, "Error creating function: name or return_type is NULL\n");
        return NULL;
    }
    Function* function = (Function*)alloc_memory(sizeof(Function));
    return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
}

Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope) {
    if (name == NULL || return_type == NULL) {
        fprintf(stderr, "Error creating method: name or return_type is NULL\n");
        return NULL;
    }
    method->name = name;
    method->return_type = return_type;
    method->parameters = parameters;
    method->body = body;
    method->method_scope = method_scope;
    return method;
}
Method* create_method(Symbol* name, Symbol* return_type, list(Variable*) parameters, list(Statement*) body, SymbolTable* method_scope) {
    if (name == NULL || return_type == NULL) {
        fprintf(stderr, "Error creating method: name or return_type is NULL\n");
        return NULL;
    }
    Method* method = (Method*)alloc_memory(sizeof(Method));
    return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
}

ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
    class_member->type = type;
    if (type == CLASS_METHOD && method_content != NULL)
        class_member->content.method = method_content;
    else if (type == CLASS_VARIABLE && variable_content != NULL)
        class_member->content.variable = variable_content;
    else {
        if (method_content == NULL && variable_content == NULL)
            fprintf(stderr, "Error creating class member: content is NULL\n");
        else
            fprintf(stderr, "Error creating class member: unknown type %u\n", type);
        return NULL;
    }
    return class_member;
}

Class* create_class_use_ptr(Class* class, Symbol* name, list(ClassMember*) members, SymbolTable* class_scope, size_t size) {
    if (name == NULL) {
        fprintf(stderr, "Error creating class: name is NULL\n");
        return NULL;
    }
    class->name = name;
    class->members = members;
    class->class_scope = class_scope;
    class->size = size;
    return class;
}
Class* create_class(Symbol* name, list(ClassMember*) members, SymbolTable* class_scope, size_t size) {
    if (name == NULL) {
        fprintf(stderr, "Error creating class: name is NULL\n");
        return NULL;
    }
    Class* class = (Class*)alloc_memory(sizeof(Class));
    return create_class_use_ptr(class, name, members, class_scope, size);
}

Variable* create_variable(Symbol* type, Symbol* name, Expression* value) {
    if (type == NULL || name == NULL) {
        fprintf(stderr, "Error creating variable: type or name is NULL\n");
        return NULL;
    }
    Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
    variable->type = type;
    variable->name = name;
    variable->value = value;
    return variable;
}

Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
    Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
    statement->type = type;
    if (type == EXPRESSION_STATEMENT && expr != NULL)
        statement->stmt.expr = expr;
    else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
        statement->stmt.var = var_stmt;
    else if (type == IF_STATEMENT && if_stmt != NULL)
        statement->stmt.if_stmt = if_stmt;
    else if (type == WHILE_STATEMENT && while_stmt != NULL)
        statement->stmt.while_stmt = while_stmt;
    else if (type == FOR_STATEMENT && for_stmt != NULL)
        statement->stmt.for_stmt = for_stmt;
    else if (type == RETURN_STATEMENT)
        statement->stmt.return_expr = expr;
    else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
        statement->stmt.expr = NULL;
    else {
        if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
            fprintf(stderr, "Error creating statement: content is NULL\n");
        else
            fprintf(stderr, "Error creating statement: unknown type %u\n", type);
        return NULL;
    }
    return statement;
}

If* create_if(Expression* condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body) {
    if (condition == NULL) {
        fprintf(stderr, "Error creating if statement: condition is NULL\n");
        return NULL;
    }
    If* if_ = (If*)alloc_memory(sizeof(If));
    if_->condition = condition;
    if_->body = body;
    if_->else_if = else_if;
    if_->else_body = else_body;
    return if_;
}

ElseIf* create_else_if(Expression* condition, list(Statement*) body) {
    if (condition == NULL) {
        fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
        return NULL;
    }
    ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
    else_if->condition = condition;
    else_if->body = body;
    return else_if;
}

For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
    For* for_ = (For*)alloc_memory(sizeof(For));
    for_->initializer = initializer;
    for_->condition = condition;
    for_->increment = increment;
    for_->body = body;
    return for_;
}

While* create_while(Expression* condition, list(Statement*) body) {
    While* while_ = (While*)alloc_memory(sizeof(While));
    while_->condition = condition;
    while_->body = body;
    return while_;
}

Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
    if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
        fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
                operator == OP_NONE ? "true" : "false",
                expr_left == NULL ? "true" : "false",
                prim_left == NULL ? "true" : "false",
                right == NULL ? "true" : "false");
        return NULL;
    }
    Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
    expression->operator = operator;
    if (expr_left != NULL)
        expression->expr_left = expr_left;
    else if (prim_left != NULL)
        expression->prim_left = prim_left;
    else {
        fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
        return NULL;
    }
    expression->right = right;
    return expression;
}

Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
    primary->type = type;
    if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
        primary->value.literal_value = str_value;
    else if (type == PRIM_EXPRESSION && expr_value != NULL)
        primary->value.expr = expr_value;
    else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
        primary->value.operand = prim_value;
    else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
        primary->value.var = variable_value;
    else {
        if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
            fprintf(stderr, "Error creating primary: value is NULL\n");
        else
            fprintf(stderr, "Error creating primary: unknown type %u\n", type);
        return NULL;
    }
    return primary;
}

VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, list(Expression*) args_content) {
    if ((base == NULL) != (type == VAR_NAME)) {
        fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
        return NULL;
    }
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
    variable_access->type = type;
    variable_access->base = base;
    if (type == VAR_NAME && name_content != NULL)
        variable_access->content.name = name_content;
    else if (type == VAR_FUNC_CALL && args_content != NULL)
        variable_access->content.args = args_content;
    else if (type == VAR_GET_SEQ && expr_content != NULL)
        variable_access->content.index = expr_content;
    else if (type == VAR_GET_ATTR && name_content != NULL)
        variable_access->content.attr_name = name_content;
    else {
        if (name_content == NULL && expr_content == NULL && args_content == NULL)
            fprintf(stderr, "Error creating variable access: content is NULL\n");
        else
            fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
        return NULL;
    }
    return variable_access;
}
