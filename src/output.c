#include "helper.h"

static void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, Parser* parser);
static void output_import(Import* import, FILE* outfile, size_t indent, Parser* parser);
static void output_function(Function* function, FILE* outfile, size_t indent, Parser* parser);
static void output_method(Method* method, FILE* outfile, size_t indent, Parser* parser);
static void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, Parser* parser);
static void output_class(Class* class, FILE* outfile, size_t indent, Parser* parser);
static void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser);
static void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser);
static void output_if(If* if_, FILE* outfile, size_t indent, Parser* parser);
static void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, Parser* parser);
static void output_for(For* for_, FILE* outfile, size_t indent, Parser* parser);
static void output_while(While* while_, FILE* outfile, size_t indent, Parser* parser);
static void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser);
static void output_primary(Primary* primary, FILE* outfile, size_t indent, Parser* parser);
static void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser);
static void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser);

void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 78 Starting output_code_member\n");
    switch (code_member->type) {
        case CODE_IMPORT:
            ast_output(0, false, "import\n");
            output_import(code_member->content.import, outfile, indent + 1, parser);
            break;
        case CODE_FUNCTION:
            ast_output(0, false, "function\n");
            output_function(code_member->content.function, outfile, indent + 1, parser);
            break;
        case CODE_CLASS:
            ast_output(0, false, "class\n");
            output_class(code_member->content.class, outfile, indent + 1, parser);
            break;
        default:
            ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
            break;
    }
    // printf("[DEBUG] 79 Finished output_code_member\n");
}
void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 80 Starting output_code\n");
    list(CodeMember*) members = list_copy(code->members);
    CodeMember* member;
    while ((member = (CodeMember*)list_pop(members)) != NULL)
        output_code_member(member, outfile, indent + 1, parser);
    // printf("[DEBUG] 81 Finished output_code\n");
}
void output_import(Import* import, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 82 Starting output_import\n");
    ast_output(0, false, "name\n");
    output_name(import->name, outfile, indent + 1, parser);
    ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
    // printf("[DEBUG] 83 Finished output_import\n");
}
void output_function(Function* function, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 84 Starting output_function\n");
    ast_output(0, false, "name\n");
    output_name(function->name, outfile, indent + 1, parser);
    ast_output(0, false, "return_type\n");
    output_name(function->return_type, outfile, indent + 1, parser);
    ast_output(0, false, "parameters\n");
    list(Variable*) parameters = list_copy(function->parameters);
    list(Statement*) body = list_copy(function->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        ast_output(1, false, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, parser);
    }
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    // printf("[DEBUG] 85 Finished output_function\n");
}
void output_method(Method* method, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 86 Starting output_method\n");
    ast_output(0, false, "name\n");
    output_name(method->name, outfile, indent + 1, parser);
    ast_output(0, false, "return_type\n");
    output_name(method->return_type, outfile, indent + 1, parser);
    ast_output(0, false, "parameters\n");
    list(Variable*) parameters = list_copy(method->parameters);
    list(Statement*) body = list_copy(method->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        ast_output(1, false, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, parser);
    }
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    // printf("[DEBUG] 87 Finished output_method\n");
}
void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 88 Starting output_class_member\n");
    switch (class_member->type) {
        case CLASS_METHOD:
            ast_output(0, false, "method\n");
            output_method(class_member->content.method, outfile, indent + 1, parser);
            break;
        case CLASS_VARIABLE:
            ast_output(0, false, "variable\n");
            output_variable(class_member->content.variable, outfile, indent + 1, parser);
            break;
        default:
            ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
            break;
    }
    // printf("[DEBUG] 89 Finished output_class_member\n");
}
void output_class(Class* class, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 90 Starting output_class\n");
    ast_output(0, false, "name\n");
    output_name(class->name, outfile, indent + 1, parser);
    ast_output(0, true, "members\n");
    list(ClassMember*) members = list_copy(class->members);
    ClassMember* member;
    while ((member = (ClassMember*)list_pop(members)) != NULL)
        output_class_member(member, outfile, indent + 1, parser);
    // printf("[DEBUG] 91 Finished output_class\n");
}
void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 92 Starting output_variable\n");
    ast_output(0, false, "type\n");
    output_name(variable->type, outfile, indent + 1, parser);
    ast_output(0, false, "name\n");
    output_name(variable->name, outfile, indent + 1, parser);
    if (variable->value != NULL) {
        ast_output(0, true, "value\n");
        output_expression(variable->value, outfile, indent + 1, parser);
    } else
        ast_output(0, true, "value: \"NULL\"\n");
    // printf("[DEBUG] 93 Finished output_variable\n");
}
void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 94 Starting output_statement\n");
    switch (statement->type) {
        case IF_STATEMENT:
            ast_output(0, false, "if_statement\n");
            output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
            break;
        case FOR_STATEMENT:
            ast_output(0, false, "for_statement\n");
            output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
            break;
        case WHILE_STATEMENT:
            ast_output(0, false, "while_statement\n");
            output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
            break;
        case VARIABLE_STATEMENT:
            ast_output(0, false, "variable_declaration_statement\n");
            output_variable(statement->stmt.var, outfile, indent + 1, parser);
            break;
        case RETURN_STATEMENT:
            if (statement->stmt.expr == NULL) {
                ast_output(0, false, "return_statement: \"NULL\"\n");
                // printf("[DEBUG] 95 Finished output_statement\n");
                return;
            }
            ast_output(0, false, "return_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, parser);
            break;
        case BREAK_STATEMENT:
            ast_output(0, false, "break_statement: \"NULL\"\n");
            break;
        case CONTINUE_STATEMENT:
            ast_output(0, false, "continue_statement: \"NULL\"\n");
            break;
        case EXPRESSION_STATEMENT:
            if (statement->stmt.expr == NULL) {
                ast_output(0, false, "expression_statement: \"NULL\"\n");
                // printf("[DEBUG] 96 Finished output_statement\n");
                return;
            }
            ast_output(0, false, "expression_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, parser);
            break;
        default:
            ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
            break;
    }
    // printf("[DEBUG] 97 Finished output_statement\n");
}
void output_if(If* if_, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 98 Starting output_if\n");
    list(Statement*) body = list_copy(if_->body);
    list(ElseIf*) else_if_list = list_copy(if_->else_if);
    list(Statement*) else_body = list_copy(if_->else_body);
    ast_output(0, false, "condition\n");
    output_expression(if_->condition, outfile, indent + 1, parser);
    ast_output(0, false, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    ast_output(0, false, "else_if\n");
    ElseIf* else_if;
    while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
        output_else_if(else_if, outfile, indent + 1, parser);
    ast_output(0, true, "else_body\n");
    while ((statement = (Statement*)list_pop(else_body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    // printf("[DEBUG] 99 Finished output_if\n");
}
void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 100 Starting output_else_if\n");
    list(Statement*) body = list_copy(else_if->body);
    ast_output(0, false, "condition\n");
    output_expression(else_if->condition, outfile, indent + 1, parser);
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    // printf("[DEBUG] 101 Finished output_else_if\n");
}
void output_for(For* for_, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 102 Starting output_for\n");
    list(Statement*) body = list_copy(for_->body);
    if (for_->initializer != NULL) {
        ast_output(0, false, "initializer\n");
        output_variable(for_->initializer, outfile, indent + 1, parser);
    } else
        ast_output(0, false, "initializer: \"NULL\"\n");
    if (for_->condition != NULL) {
        ast_output(0, false, "condition\n");
        output_expression(for_->condition, outfile, indent + 1, parser);
    } else
        ast_output(0, false, "condition: \"NULL\"\n");
    if (for_->increment != NULL) {
        ast_output(0, false, "increment\n");
        output_expression(for_->increment, outfile, indent + 1, parser);
    } else
        ast_output(0, false, "increment: \"NULL\"\n");
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    // printf("[DEBUG] 103 Finished output_for\n");
}
void output_while(While* while_, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 104 Starting output_while\n");
    list(Statement*) body = list_copy(while_->body);
    ast_output(0, false, "condition\n");
    output_expression(while_->condition, outfile, indent + 1, parser);
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    // printf("[DEBUG] 105 Finished output_while\n");
}
void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 106 Starting output_expression\n");
    if (expression->operator == OP_NONE) {
        ast_output(0, true, "primary\n");
        output_primary(expression->prim_left, outfile, indent + 1, parser);
    } else {
        string op_str = operator_to_string(expression->operator);
        ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
        ast_output(0, false, "left\n");
        output_expression(expression->expr_left, outfile, indent + 1, parser);
        ast_output(0, true, "right\n");
        output_expression(expression->right, outfile, indent + 1, parser);
    }
    // printf("[DEBUG] 107 Finished output_expression\n");
}
void output_primary(Primary* primary, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 108 Starting output_primary\n");
    switch (primary->type) {
        case PRIM_INTEGER:
            ast_output(0, false, "type: \"integer\"\n");
            ast_output(0, true, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_FLOAT:
            ast_output(0, false, "type: \"float\"\n");
            ast_output(0, true, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_STRING:
            ast_output(0, false, "type: \"string\"\n");
            ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
            break;
        case PRIM_TRUE:
            ast_output(0, false, "type: \"boolean\"\n");
            ast_output(0, true, "value: \"true\"\n");
            break;
        case PRIM_FALSE:
            ast_output(0, false, "type: \"boolean\"\n");
            ast_output(0, true, "value: \"false\"\n");
            break;
        case PRIM_EXPRESSION:
            ast_output(0, false, "type: \"expression\"\n");
            ast_output(0, true, "value\n");
            output_expression(primary->value.expr, outfile, indent + 1, parser);
            break;
        case PRIM_NOT_OPERAND:
            ast_output(0, false, "type: \"!\"\n");
            ast_output(0, true, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, parser);
            break;
        case PRIM_NEG_OPERAND:
            ast_output(0, false, "type: \"-\"\n");
            ast_output(0, true, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, parser);
            break;
        case PRIM_VARIABLE_ACCESS:
            ast_output(0, false, "type: \"variable\"\n");
            ast_output(0, true, "value\n");
            output_variable_access(primary->value.var, outfile, indent + 1, parser);
            break;
        default:
            ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
            break;
    }
    // printf("[DEBUG] 109 Finished output_primary\n");
}
void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 110 Starting output_variable_access\n");
    list(Expression*) args;
    int index;
    switch (variable_access->type) {
        case VAR_NAME:
            ast_output(0, false, "type: \"name\"\n");
            ast_output(0, true, "name\n");
            output_name(variable_access->content.name, outfile, indent + 1, parser);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(variable_access->content.args);
            ast_output(0, false, "type: \"function_call\"\n");
            ast_output(0, false, "function\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            ast_output(0, true, "arguments\n");
            Expression* arg;
            index = -1;
            while ((arg = (Expression*)list_pop(args)) != NULL) {
                ast_output(1, false, "arguments[%d]\n", ++index);
                output_expression(arg, outfile, indent + 2, parser);
            }
            break;
        case VAR_GET_SEQ:
            ast_output(0, false, "type: \"get sequence_element\"\n");
            ast_output(0, false, "sequence\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            ast_output(0, true, "index\n");
            output_expression(variable_access->content.index, outfile, indent + 1, parser);
            break;
        case VAR_GET_ATTR:
            ast_output(0, false, "type: \"get_attribute\"\n");
            ast_output(0, false, "object\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            ast_output(0, true, "attribute_name\n");
            output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
            break;
        default:
            ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
            break;
    }
    // printf("[DEBUG] 111 Finished output_variable_access\n");
}
void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
    // printf("[DEBUG] 112 Starting output_name\n");
    if (name == NULL) {
        ast_output(0, true, "Name pointer: \"NULL\"\n");
        // printf("[DEBUG] 113 Finished output_name with NULL\n");
        return;
    }
    ast_output(0, false, "name: \"%s\"\n", name->name);
    ast_output(0, false, "id: %zu\n", name->id);
    switch (name->kind) {
        case SYMBOL_TYPE:
            ast_output(0, true, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            ast_output(0, false, "kind: \"variable\"\n");
            ast_output(0, true, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_FUNCTION:
            ast_output(0, false, "kind: \"function\"\n");
            ast_output(0, true, "return_type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_METHOD:
            ast_output(0, false, "kind: \"method\"\n");
            ast_output(0, true, "return_type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_CLASS:
            ast_output(0, true, "kind: \"class\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            ast_output(0, false, "kind: \"attribute\"\n");
            ast_output(0, true, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_PARAM:
            ast_output(0, false, "kind: \"parameter\"\n");
            ast_output(0, true, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        default:
            ast_output(0, true, "kind: \"unknown_NameType\"\n");
            break;
    }
    // printf("[DEBUG] 113 Finished output_name\n");
}
