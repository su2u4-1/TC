#include "create.h"

CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
    CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
    code_member->type = type;
    if (type == CODE_IMPORT && import_content != NULL)
        code_member->content.import = import_content;
    else if (type == CODE_FUNCTION && function_content != NULL)
        code_member->content.function = function_content;
    else if (type == CODE_CLASS && class_content != NULL)
        code_member->content.class_ = class_content;
    else {
        if (import_content == 0 && function_content == 0 && class_content == 0)
            fprintf(stderr, "Error creating code member: content is NULL\n");
        else
            fprintf(stderr, "Error creating code member: unknown type %u\n", type);
        return 0;
    }
    return code_member;
}

Code* create_code(list(CodeMember*) members, Scope* global_scope) {
    Code* code = (Code*)alloc_memory(sizeof(Code));
    Code* code_ptr = code;
    code_ptr->members = members;
    code_ptr->global_scope = global_scope;
    return code;
}

Import* create_import(Name* name, string source) {
    if (name == 0) {
        fprintf(stderr, "Error creating import: name is NULL\n");
        return 0;
    }
    Import* import = (Import*)alloc_memory(sizeof(Import));
    Import* import_ptr = import;
    import_ptr->name = name;
    import_ptr->source = source;
    return import;
}

Function* create_function(Name* name, Name* return_type, list(Variable*) parameters, list(Statement*) body, Scope* function_scope) {
    if (name == 0 || return_type == 0) {
        fprintf(stderr, "Error creating function: name or return_type is NULL\n");
        return 0;
    }
    Function* function = (Function*)alloc_memory(sizeof(Function));
    Function* function_ptr = function;
    function_ptr->name = name;
    function_ptr->return_type = return_type;
    function_ptr->parameters = parameters;
    function_ptr->body = body;
    function_ptr->function_scope = function_scope;
    return function;
}

Method* create_method(Name* name, Name* return_type, list(Variable*) parameters, list(Statement*) body, Scope* method_scope) {
    if (name == 0 || return_type == 0) {
        fprintf(stderr, "Error creating method: name or return_type is NULL\n");
        return 0;
    }
    Method* method = (Method*)alloc_memory(sizeof(Method));
    Method* method_ptr = method;
    method_ptr->name = name;
    method_ptr->return_type = return_type;
    method_ptr->parameters = parameters;
    method_ptr->body = body;
    method_ptr->method_scope = method_scope;
    return method;
}

ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
    ClassMember* class_member_ptr = class_member;
    class_member_ptr->type = type;
    if (type == CLASS_METHOD && method_content != NULL)
        class_member_ptr->content.method = method_content;
    else if (type == CLASS_VARIABLE && variable_content != NULL)
        class_member_ptr->content.variable = variable_content;
    else {
        if (method_content == 0 && variable_content == 0)
            fprintf(stderr, "Error creating class member: content is NULL\n");
        else
            fprintf(stderr, "Error creating class member: unknown type %u\n", type);
        return 0;
    }
    return class_member;
}

Class* create_class(Name* name, list(ClassMember*) members, Scope* class_scope) {
    if (name == 0) {
        fprintf(stderr, "Error creating class: name is NULL\n");
        return 0;
    }
    Class* class = (Class*)alloc_memory(sizeof(Class));
    Class* class_ptr = class;
    class_ptr->name = name;
    class_ptr->members = members;
    class_ptr->class_scope = class_scope;
    return class;
}

Variable* create_variable(Name* type, Name* name, Expression* value) {
    if (type == 0 || name == 0) {
        fprintf(stderr, "Error creating variable: type or name is NULL\n");
        return 0;
    }
    Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
    Variable* variable_ptr = variable;
    variable_ptr->type = type;
    variable_ptr->name = name;
    variable_ptr->value = value;
    return variable;
}

Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
    Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
    Statement* statement_ptr = statement;
    statement_ptr->type = type;
    if (type == EXPRESSION_STATEMENT && expr != 0)
        statement_ptr->stmt.expr = expr;
    else if (type == VARIABLE_STATEMENT && var_stmt != 0)
        statement_ptr->stmt.var = var_stmt;
    else if (type == IF_STATEMENT && if_stmt != 0)
        statement_ptr->stmt.if_stmt = if_stmt;
    else if (type == WHILE_STATEMENT && while_stmt != 0)
        statement_ptr->stmt.while_stmt = while_stmt;
    else if (type == FOR_STATEMENT && for_stmt != 0)
        statement_ptr->stmt.for_stmt = for_stmt;
    else if (type == RETURN_STATEMENT && expr != 0)
        statement_ptr->stmt.return_expr = expr;
    else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
        statement_ptr->stmt.expr = 0;
    else {
        if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
            fprintf(stderr, "Error creating statement: content is NULL\n");
        else
            fprintf(stderr, "Error creating statement: unknown type %u\n", type);
        return 0;
    }
    return statement;
}

If* create_if(Expression* condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body) {
    if (condition == 0) {
        fprintf(stderr, "Error creating if statement: condition is NULL\n");
        return 0;
    }
    If* if_ = (If*)alloc_memory(sizeof(If));
    If* if_ptr = if_;
    if_ptr->condition = condition;
    if_ptr->body = body;
    if_ptr->else_if = else_if;
    if_ptr->else_body = else_body;
    return if_;
}

ElseIf* create_else_if(Expression* condition, list(Statement*) body) {
    if (condition == 0) {
        fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
        return 0;
    }
    ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
    ElseIf* else_if_ptr = else_if;
    else_if_ptr->condition = condition;
    else_if_ptr->body = body;
    return else_if;
}

For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
    For* for_ = (For*)alloc_memory(sizeof(For));
    For* for_ptr = for_;
    for_ptr->initializer = initializer;
    for_ptr->condition = condition;
    for_ptr->increment = increment;
    for_ptr->body = body;
    return for_;
}

While* create_while(Expression* condition, list(Statement*) body) {
    While* while_ = (While*)alloc_memory(sizeof(While));
    While* while_ptr = while_;
    while_ptr->condition = condition;
    while_ptr->body = body;
    return while_;
}

Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
    if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
        fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
                operator == OP_NONE ? "true" : "false",
                expr_left == 0 ? "true" : "false",
                prim_left == 0 ? "true" : "false",
                right == 0 ? "true" : "false");
        return 0;
    }
    Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
    Expression* expression_ptr = expression;
    expression_ptr->operator = operator;
    if (expr_left != 0)
        expression_ptr->expr_left = expr_left;
    else if (prim_left != 0)
        expression_ptr->prim_left = prim_left;
    else {
        fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
        return 0;
    }
    expression_ptr->right = right;
    return expression;
}

Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
    Primary* primary_ptr = primary;
    primary_ptr->type = type;
    if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
        primary_ptr->value.literal_value = str_value;
    else if (type == PRIM_EXPRESSION && expr_value != 0)
        primary_ptr->value.expr = expr_value;
    else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
        primary_ptr->value.operand = prim_value;
    else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
        primary_ptr->value.var = variable_value;
    else {
        if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
            fprintf(stderr, "Error creating primary: value is NULL\n");
        else
            fprintf(stderr, "Error creating primary: unknown type %u\n", type);
        return 0;
    }
    return primary;
}

VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
    if ((base == 0) != (type == VAR_NAME)) {
        fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
        return 0;
    }
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
    VariableAccess* variable_access_ptr = variable_access;
    variable_access_ptr->type = type;
    variable_access_ptr->base = base;
    if (type == VAR_NAME && name_content != 0)
        variable_access_ptr->content.name = name_content;
    else if (type == VAR_FUNC_CALL && args_content != 0)
        variable_access_ptr->content.args = args_content;
    else if (type == VAR_GET_SEQ && expr_content != 0)
        variable_access_ptr->content.index = expr_content;
    else if (type == VAR_GET_ATTR && name_content != 0)
        variable_access_ptr->content.attr_name = name_content;
    else {
        if (name_content == 0 && expr_content == 0 && args_content == 0)
            fprintf(stderr, "Error creating variable access: content is NULL\n");
        else
            fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
        return 0;
    }
    return variable_access;
}
