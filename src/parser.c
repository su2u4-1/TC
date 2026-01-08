#include "parser.h"

#include "lexer.h"
#include "lib.h"

offset_ptr(Code*) create_code(void) {
    offset_ptr(Code*) code = alloc_memory(sizeof(Code));
    Code* code_ptr = (Code*)offset_to_ptr(code);
    code_ptr->imports = 0;
    code_ptr->functions = 0;
    code_ptr->classes = 0;
    code_ptr->global_scope = 0;
    return code;
}

offset_ptr(Import*) create_import(offset name, offset source) {
    offset_ptr(Import*) import = alloc_memory(sizeof(Import));
    Import* import_ptr = (Import*)offset_to_ptr(import);
    import_ptr->name = name;
    import_ptr->source = source;
    import_ptr->next = 0;
    return import;
}

offset_ptr(Function*) create_function(offset name, offset return_type) {
    offset_ptr(Function*) function = alloc_memory(sizeof(Function));
    Function* function_ptr = (Function*)offset_to_ptr(function);
    function_ptr->name = name;
    function_ptr->return_type = return_type;
    function_ptr->parameters = 0;
    function_ptr->body = 0;
    function_ptr->scope = 0;
    function_ptr->next = 0;
    return function;
}

offset_ptr(Class*) create_class(offset name) {
    offset_ptr(Class*) class = alloc_memory(sizeof(Class));
    Class* class_ptr = (Class*)offset_to_ptr(class);
    class_ptr->name = name;
    class_ptr->methods = 0;
    class_ptr->attributes = 0;
    class_ptr->local_scope = 0;
    class_ptr->next = 0;
    return class;
}

offset_ptr(Variable*) create_variable(offset type, offset name) {
    offset_ptr(Variable*) variable = alloc_memory(sizeof(Variable));
    Variable* variable_ptr = (Variable*)offset_to_ptr(variable);
    variable_ptr->type = type;
    variable_ptr->name = name;
    variable_ptr->value = 0;
    variable_ptr->next = 0;
    return variable;
}

offset_ptr(Statement*) create_statement(StatementType type) {
    offset_ptr(Statement*) statement = alloc_memory(sizeof(Statement));
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

offset_ptr(Expression*) create_expression(offset_ptr(Primary*) prim, OperatorType operator) {
    offset_ptr(Expression*) expression = alloc_memory(sizeof(Expression));
    Expression* expression_ptr = (Expression*)offset_to_ptr(expression);
    expression_ptr->prim = prim;
    expression_ptr->operator = operator;
    expression_ptr->left = 0;
    expression_ptr->right = 0;
    return expression;
}

offset_ptr(If*) create_if(void) {
    offset_ptr(If*) if_stmt = alloc_memory(sizeof(If));
    If* if_ptr = (If*)offset_to_ptr(if_stmt);
    if_ptr->condition = 0;
    if_ptr->body = 0;
    if_ptr->else_if = 0;
    if_ptr->else_body = 0;
    return if_stmt;
}

offset_ptr(While*) create_while(void) {
    offset_ptr(While*) while_stmt = alloc_memory(sizeof(While));
    While* while_ptr = (While*)offset_to_ptr(while_stmt);
    while_ptr->condition = 0;
    while_ptr->body = 0;
    return while_stmt;
}

offset_ptr(For*) create_for(void) {
    offset_ptr(For*) for_stmt = alloc_memory(sizeof(For));
    For* for_ptr = (For*)offset_to_ptr(for_stmt);
    for_ptr->initialization = 0;
    for_ptr->condition = 0;
    for_ptr->increment = 0;
    for_ptr->body = 0;
    return for_stmt;
}

offset_ptr(Primary*) create_primary(PrimaryType type) {
    offset_ptr(Primary*) primary = alloc_memory(sizeof(Primary));
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

offset_ptr(VariableAccess*) create_variable_access(AccessType type) {
    offset_ptr(VariableAccess*) var_access = alloc_memory(sizeof(VariableAccess));
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

offset_ptr(Arguments*) create_arguments(void) {
    offset_ptr(Arguments*) args = alloc_memory(sizeof(Arguments));
    Arguments* args_ptr = (Arguments*)offset_to_ptr(args);
    args_ptr->args = 0;
    args_ptr->next = 0;
    return args;
}

offset_ptr(Scope*) create_scope(offset name, offset_ptr(Type*) type) {
    static size_t scope_id_counter = 0;
    offset_ptr(Scope*) scope = alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
    scope_ptr->name = name;
    scope_ptr->type = type;
    scope_ptr->id = scope_id_counter++;
    scope_ptr->next = 0;
    return scope;
}

offset_ptr(Code*) parser(offset_ptr(Lexer*) lexer) {
    offset_ptr(Token*) token = get_next_token(lexer);

    return 0;
}
