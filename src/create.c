#include "create.h"

offset(CodeMember*) create_code_member(CodeMemberType type, offset(Import* | Function * | Class*) content) {
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

offset(Code*) create_code(list(CodeMember*) members, offset(Scope*) global_scope) {
    offset(Code*) code = alloc_memory(sizeof(Code));
    Code* code_ptr = (Code*)offset_to_ptr(code);
    code_ptr->members = members;
    code_ptr->global_scope = global_scope;
    return code;
}

offset(Import*) create_import(string name, string source) {
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

offset(Function*) create_function(string name, string return_type, list(Variable*) parameters, list(Statement*) body, offset(Scope*) function_scope) {
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

offset(Method*) create_method(string name, string return_type, list(Variable*) parameters, list(Statement*) body, offset(Scope*) method_scope) {
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

offset(ClassMember*) create_class_member(ClassMemberType type, offset(Method* | Variable*) content) {
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

offset(Class*) create_class(string name, list(ClassMember*) members, offset(Scope*) class_scope) {
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

offset(Variable*) create_variable(string type, string name, offset(Expression*) value) {
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

offset(Statement*) create_statement(StatementType type, offset(If* | While * | For * | Expression * | Variable*) stmt) {
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

offset(If*) create_if(offset(Expression*) condition, list(Statement*) body, list(ElseIf*) else_if, list(Statement*) else_body) {
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

offset(ElseIf*) create_else_if(offset(Expression*) condition, list(Statement*) body) {
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

offset(For*) create_for(offset(Variable*) initializer, offset(Expression*) condition, offset(Expression*) increment, list(Statement*) body) {
    offset(For*) for_ = alloc_memory(sizeof(For));
    For* for_ptr = (For*)offset_to_ptr(for_);
    for_ptr->initializer = initializer;
    for_ptr->condition = condition;
    for_ptr->increment = increment;
    for_ptr->body = body;
    return for_;
}

offset(While*) create_while(offset(Expression*) condition, list(Statement*) body) {
    offset(While*) while_ = alloc_memory(sizeof(While));
    While* while_ptr = (While*)offset_to_ptr(while_);
    while_ptr->condition = condition;
    while_ptr->body = body;
    return while_;
}

offset(Expression*) create_expression(OperatorType operator, offset(Expression* | Primary*) left, offset(Expression*) right) {
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

offset(Primary*) create_primary(PrimaryType type, offset(string | Expression * | Primary * | VariableAccess*) value) {
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

offset(VariableAccess*) create_variable_access(VariableAccessType type, offset(VariableAccess*) base, offset(string | Expression*) content) {
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
