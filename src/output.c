#include <stdio.h>

#include "helper.h"
#include "lib.h"
#include "parser.h"

// `static void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent)`
static void output_code_member(offset(CodeMember*) code_member, FILE* outfile, size_t indent);
// `static void output_code(Code* code, FILE* outfile, size_t indent)`
static void output_code(offset(Code*) code, FILE* outfile, size_t indent);
// `static void output_import(Import* import, FILE* outfile, size_t indent)`
static void output_import(offset(Import*) import, FILE* outfile, size_t indent);
// `static void output_function(Function* function, FILE* outfile, size_t indent)`
static void output_function(offset(Function*) function, FILE* outfile, size_t indent);
// `static void output_method(Method* method, FILE* outfile, size_t indent)`
static void output_method(offset(Method*) method, FILE* outfile, size_t indent);
// `static void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent)`
static void output_class_member(offset(ClassMember*) class_member, FILE* outfile, size_t indent);
// `static void output_class(Class* class, FILE* outfile, size_t indent)`
static void output_class(offset(Class*) class, FILE* outfile, size_t indent);
// `static void output_variable(Variable* variable, FILE* outfile, size_t indent)`
static void output_variable(offset(Variable*) variable, FILE* outfile, size_t indent);
// `static void output_statement(Statement* statement, FILE* outfile, size_t indent)`
static void output_statement(offset(Statement*) statement, FILE* outfile, size_t indent);
// `static void output_if(If* if_, FILE* outfile, size_t indent)`
static void output_if(offset(If*) if_, FILE* outfile, size_t indent);
// `static void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent)`
static void output_else_if(offset(ElseIf*) else_if, FILE* outfile, size_t indent);
// `static void output_for(For* for_, FILE* outfile, size_t indent)`
static void output_for(offset(For*) for_, FILE* outfile, size_t indent);
// `static void output_while(While* while_, FILE* outfile, size_t indent)`
static void output_while(offset(While*) while_, FILE* outfile, size_t indent);
// `static void output_expression(Expression* expression, FILE* outfile, size_t indent)`
static void output_expression(offset(Expression*) expression, FILE* outfile, size_t indent);
// `static void output_primary(Primary* primary, FILE* outfile, size_t indent)`
static void output_primary(offset(Primary*) primary, FILE* outfile, size_t indent);
// `static void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent)`
static void output_variable_access(offset(VariableAccess*) variable_access, FILE* outfile, size_t indent);
// `static void output_name(Name* name, FILE* outfile, size_t indent)`
static void output_name(offset(Name*) name, FILE* outfile, size_t indent);

void output_code_member(offset(CodeMember*) code_member, FILE* outfile, size_t indent) {
    CodeMember* code_member_ptr = (CodeMember*)offset_to_ptr(code_member);
    switch (code_member_ptr->type) {
        case CODE_IMPORT:
            OUT(0, false, "import\n");
            output_import(code_member_ptr->content.import, outfile, indent + 1);
            break;
        case CODE_FUNCTION:
            OUT(0, false, "function\n");
            output_function(code_member_ptr->content.function, outfile, indent + 1);
            break;
        case CODE_CLASS:
            OUT(0, false, "class\n");
            output_class(code_member_ptr->content.class_, outfile, indent + 1);
            break;
        default:
            OUT(0, false, "unknown_CodeMemberType: %d\n", code_member_ptr->type);
            break;
    }
}
void output_code(offset(Code*) code, FILE* outfile, size_t indent) {
    list(CodeMember*) members = list_copy(((Code*)offset_to_ptr(code))->members);
    offset(CodeMember*) member;
    while ((member = list_pop(members)) != 0)
        output_code_member(member, outfile, indent + 1);
}
void output_import(offset(Import*) import, FILE* outfile, size_t indent) {
    Import* import_ptr = (Import*)offset_to_ptr(import);
    OUT(0, false, "name\n");
    output_name(import_ptr->name, outfile, indent + 1);
    OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? string_to_cstr(import_ptr->source) : "NULL");
}
void output_function(offset(Function*) function, FILE* outfile, size_t indent) {
    Function* function_ptr = (Function*)offset_to_ptr(function);
    OUT(0, false, "name\n");
    output_name(function_ptr->name, outfile, indent + 1);
    OUT(0, false, "return_type\n");
    output_name(function_ptr->return_type, outfile, indent + 1);
    OUT(0, false, "parameters\n");
    list(Variable*) parameters = list_copy(function_ptr->parameters);
    list(Statement*) body = list_copy(function_ptr->body);
    offset(Variable*) parameter;
    int index = -1;
    while ((parameter = list_pop(parameters)) != 0) {
        OUT(1, false, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2);
    }
    OUT(0, true, "body\n");
    offset(Statement*) statement;
    while ((statement = list_pop(body)) != 0)
        output_statement(statement, outfile, indent + 1);
}
void output_method(offset(Method*) method, FILE* outfile, size_t indent) {
    Method* method_ptr = (Method*)offset_to_ptr(method);
    OUT(0, false, "name\n");
    output_name(method_ptr->name, outfile, indent + 1);
    OUT(0, false, "return_type\n");
    output_name(method_ptr->return_type, outfile, indent + 1);
    OUT(0, false, "parameters\n");
    list(Variable*) parameters = list_copy(method_ptr->parameters);
    list(Statement*) body = list_copy(method_ptr->body);
    offset(Variable*) parameter;
    int index = -1;
    while ((parameter = list_pop(parameters)) != 0) {
        OUT(1, false, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2);
    }
    OUT(0, true, "body\n");
    offset(Statement*) statement;
    while ((statement = list_pop(body)) != 0)
        output_statement(statement, outfile, indent + 1);
}
void output_class_member(offset(ClassMember*) class_member, FILE* outfile, size_t indent) {
    ClassMember* class_member_ptr = (ClassMember*)offset_to_ptr(class_member);
    switch (class_member_ptr->type) {
        case CLASS_METHOD:
            OUT(0, false, "method\n");
            output_method(class_member_ptr->content.method, outfile, indent + 1);
            break;
        case CLASS_VARIABLE:
            OUT(0, false, "variable\n");
            output_variable(class_member_ptr->content.variable, outfile, indent + 1);
            break;
        default:
            OUT(0, false, "unknown_ClassMemberType: %d\n", class_member_ptr->type);
            break;
    }
}
void output_class(offset(Class*) class, FILE* outfile, size_t indent) {
    Class* class_ptr = (Class*)offset_to_ptr(class);
    OUT(0, false, "name\n");
    output_name(class_ptr->name, outfile, indent + 1);
    OUT(0, true, "members\n");
    list(ClassMember*) members = list_copy(class_ptr->members);
    offset(ClassMember*) member;
    while ((member = list_pop(members)) != 0)
        output_class_member(member, outfile, indent + 1);
}
void output_variable(offset(Variable*) variable, FILE* outfile, size_t indent) {
    Variable* variable_ptr = (Variable*)offset_to_ptr(variable);
    OUT(0, false, "type\n");
    output_name(variable_ptr->type, outfile, indent + 1);
    OUT(0, false, "name\n");
    output_name(variable_ptr->name, outfile, indent + 1);
    if (variable_ptr->value != 0) {
        OUT(0, true, "value\n");
        output_expression(variable_ptr->value, outfile, indent + 1);
    } else
        OUT(0, true, "value: \"NULL\"\n");
}
void output_statement(offset(Statement*) statement, FILE* outfile, size_t indent) {
    Statement* statement_ptr = (Statement*)offset_to_ptr(statement);
    switch (statement_ptr->type) {
        case IF_STATEMENT:
            OUT(0, false, "if_statement\n");
            output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1);
            break;
        case FOR_STATEMENT:
            OUT(0, false, "for_statement\n");
            output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1);
            break;
        case WHILE_STATEMENT:
            OUT(0, false, "while_statement\n");
            output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1);
            break;
        case VARIABLE_STATEMENT:
            OUT(0, false, "variable_declaration_statement\n");
            output_variable(statement_ptr->stmt.var, outfile, indent + 1);
            break;
        case RETURN_STATEMENT:
            if (statement_ptr->stmt.expr == 0) {
                OUT(0, false, "return_statement: \"NULL\"\n");
                return;
            }
            OUT(0, false, "return_statement\n");
            output_expression(statement_ptr->stmt.expr, outfile, indent + 1);
            break;
        case BREAK_STATEMENT:
            OUT(0, false, "break_statement: \"NULL\"\n");
            return;
        case CONTINUE_STATEMENT:
            OUT(0, false, "continue_statement: \"NULL\"\n");
            return;
        case EXPRESSION_STATEMENT:
            if (statement_ptr->stmt.expr == 0) {
                OUT(0, false, "expression_statement: \"NULL\"\n");
                return;
            }
            OUT(0, false, "expression_statement\n");
            output_expression(statement_ptr->stmt.expr, outfile, indent + 1);
            break;
        default:
            OUT(0, false, "unknown_StatementType: %d\n", statement_ptr->type);
            return;
    }
}
void output_if(offset(If*) if_, FILE* outfile, size_t indent) {
    If* if_ptr = (If*)offset_to_ptr(if_);
    list(Statement*) body = list_copy(if_ptr->body);
    list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
    list(Statement*) else_body = list_copy(if_ptr->else_body);
    OUT(0, false, "condition\n");
    output_expression(if_ptr->condition, outfile, indent + 1);
    OUT(0, false, "body\n");
    offset(Statement*) statement;
    while ((statement = list_pop(body)) != 0)
        output_statement(statement, outfile, indent + 1);
    OUT(0, false, "else_if\n");
    offset(ElseIf*) else_if;
    while ((else_if = list_pop(else_if_list)) != 0)
        output_else_if(else_if, outfile, indent + 1);
    OUT(0, true, "else_body\n");
    while ((statement = list_pop(else_body)) != 0)
        output_statement(statement, outfile, indent + 1);
}
void output_else_if(offset(ElseIf*) else_if, FILE* outfile, size_t indent) {
    ElseIf* else_if_ptr = (ElseIf*)offset_to_ptr(else_if);
    list(Statement*) body = list_copy(else_if_ptr->body);
    OUT(0, false, "condition\n");
    output_expression(else_if_ptr->condition, outfile, indent + 1);
    OUT(0, true, "body\n");
    offset(Statement*) statement;
    while ((statement = list_pop(body)) != 0)
        output_statement(statement, outfile, indent + 1);
}
void output_for(offset(For*) for_, FILE* outfile, size_t indent) {
    For* for_ptr = (For*)offset_to_ptr(for_);
    list(Statement*) body = list_copy(for_ptr->body);
    if (for_ptr->initializer != 0) {
        OUT(0, false, "initializer\n");
        output_variable(for_ptr->initializer, outfile, indent + 1);
    } else
        OUT(0, false, "initializer: \"NULL\"\n");
    if (for_ptr->condition != 0) {
        OUT(0, false, "condition\n");
        output_expression(for_ptr->condition, outfile, indent + 1);
    } else
        OUT(0, false, "condition: \"NULL\"\n");
    if (for_ptr->increment != 0) {
        OUT(0, false, "increment\n");
        output_expression(for_ptr->increment, outfile, indent + 1);
    } else
        OUT(0, false, "increment: \"NULL\"\n");
    OUT(0, true, "body\n");
    offset(Statement*) statement;
    while ((statement = list_pop(body)) != 0)
        output_statement(statement, outfile, indent + 1);
}
void output_while(offset(While*) while_, FILE* outfile, size_t indent) {
    While* while_ptr = (While*)offset_to_ptr(while_);
    list(Statement*) body = list_copy(while_ptr->body);
    OUT(0, false, "condition\n");
    output_expression(while_ptr->condition, outfile, indent + 1);
    OUT(0, true, "body\n");
    offset(Statement*) statement;
    while ((statement = list_pop(body)) != 0)
        output_statement(statement, outfile, indent + 1);
}
void output_expression(offset(Expression*) expression, FILE* outfile, size_t indent) {
    Expression* expression_ptr = (Expression*)offset_to_ptr(expression);
    if (expression_ptr->operator == OP_NONE) {
        OUT(0, true, "primary\n");
        output_primary(expression_ptr->left, outfile, indent + 1);
    } else {
        string op_str = operator_to_string(expression_ptr->operator);
        OUT(0, false, "operator: \"%s\"\n", op_str ? string_to_cstr(op_str) : "UNKNOWN_OPERATOR");
        OUT(0, false, "left\n");
        output_expression(expression_ptr->left, outfile, indent + 1);
        OUT(0, true, "right\n");
        output_expression(expression_ptr->right, outfile, indent + 1);
    }
}
void output_primary(offset(Primary*) primary, FILE* outfile, size_t indent) {
    Primary* primary_ptr = (Primary*)offset_to_ptr(primary);
    switch (primary_ptr->type) {
        case PRIM_INTEGER:
            OUT(0, false, "type: \"integer\"\n");
            OUT(0, true, "value: %s\n", string_to_cstr(primary_ptr->value.literal_value));
            break;
        case PRIM_FLOAT:
            OUT(0, false, "type: \"float\"\n");
            OUT(0, true, "value: %s\n", string_to_cstr(primary_ptr->value.literal_value));
            break;
        case PRIM_STRING:
            OUT(0, false, "type: \"string\"\n");
            OUT(0, true, "value: \"%s\"\n", string_to_cstr(primary_ptr->value.literal_value));
            break;
        case PRIM_TRUE:
            OUT(0, false, "type: \"boolean\"\n");
            OUT(0, true, "value: \"true\"\n");
            break;
        case PRIM_FALSE:
            OUT(0, false, "type: \"boolean\"\n");
            OUT(0, true, "value: \"false\"\n");
            break;
        case PRIM_EXPRESSION:
            OUT(0, false, "type: \"expression\"\n");
            OUT(0, true, "value\n");
            output_expression(primary_ptr->value.expr, outfile, indent + 1);
            break;
        case PRIM_NOT_OPERAND:
            OUT(0, false, "type: \"!\"\n");
            OUT(0, true, "value\n");
            output_primary(primary_ptr->value.operand, outfile, indent + 1);
            break;
        case PRIM_NEG_OPERAND:
            OUT(0, false, "type: \"-\"\n");
            OUT(0, true, "value\n");
            output_primary(primary_ptr->value.operand, outfile, indent + 1);
            break;
        case PRIM_VARIABLE_ACCESS:
            OUT(0, false, "type: \"variable\"\n");
            OUT(0, true, "value\n");
            output_variable_access(primary_ptr->value.var, outfile, indent + 1);
            break;
        default:
            OUT(0, true, "unknown_PrimaryType: %d\n", primary_ptr->type);
            break;
    }
}
void output_variable_access(offset(VariableAccess*) variable_access, FILE* outfile, size_t indent) {
    VariableAccess* var_access_ptr = (VariableAccess*)offset_to_ptr(variable_access);
    list(Expression*) args;
    switch (var_access_ptr->type) {
        case VAR_NAME:
            OUT(0, false, "type: \"name\"\n");
            OUT(0, true, "name\n");
            output_name(var_access_ptr->content.name, outfile, indent + 1);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(var_access_ptr->content.args);
            OUT(0, false, "type: \"function_call\"\n");
            OUT(0, false, "function\n");
            output_variable_access(var_access_ptr->base, outfile, indent + 1);
            OUT(0, true, "arguments\n");
            offset(Expression*) arg;
            while ((arg = list_pop(args)) != 0)
                output_expression(arg, outfile, indent + 1);
            break;
        case VAR_GET_SEQ:
            OUT(0, false, "type: \"get sequence_element\"\n");
            OUT(0, false, "sequence\n");
            output_variable_access(var_access_ptr->base, outfile, indent + 1);
            OUT(0, true, "index\n");
            output_expression(var_access_ptr->content.index, outfile, indent + 1);
            break;
        case VAR_GET_ATTR:
            OUT(0, false, "type: \"get_attribute\"\n");
            OUT(0, false, "object\n");
            output_variable_access(var_access_ptr->base, outfile, indent + 1);
            OUT(0, true, "attribute_name\n");
            output_name(var_access_ptr->content.attr_name, outfile, indent + 1);
            break;
        default:
            OUT(0, true, "unknown_VariableAccessType: %d\n", var_access_ptr->type);
            break;
    }
}
static void output_name(offset(Name*) name, FILE* outfile, size_t indent) {
    Name* name_ptr = (Name*)offset_to_ptr(name);
    OUT(0, false, "name: \"%s\"\n", string_to_cstr(name_ptr->name));
    OUT(0, false, "id: %zu\n", name_ptr->id);
    switch (name_ptr->kind) {
        case NAME_TYPE:
            OUT(0, true, "kind: \"type\"\n");
            break;
        case NAME_VARIABLE:
            OUT(0, false, "kind: \"variable\"\n");
            OUT(0, true, "type\n");
            output_name(name_ptr->info.type, outfile, indent + 1);
            break;
        case NAME_FUNCTION:
            OUT(0, false, "kind: \"function\"\n");
            OUT(0, true, "return_type\n");
            output_name(name_ptr->info.type, outfile, indent + 1);
            break;
        case NAME_METHOD:
            OUT(0, false, "kind: \"method\"\n");
            OUT(0, true, "return_type\n");
            output_name(name_ptr->info.type, outfile, indent + 1);
            break;
        case NAME_CLASS:
            OUT(0, true, "kind: \"class\"\n");
            break;
        case NAME_ATTRIBUTE:
            OUT(0, false, "kind: \"attribute\"\n");
            OUT(0, true, "type\n");
            output_name(name_ptr->info.type, outfile, indent + 1);
            break;
        default:
            OUT(0, true, "kind: \"unknown_NameType\"\n");
            break;
    }
}

// public functions
void output_ast(offset(Code*) ast_node, FILE* outfile, size_t indent) {
    output_code(ast_node, outfile, indent);
}
