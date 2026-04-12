#include "helper.h"
#include "parser.h"
#include "tac.h"

// output AST
static void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_import(Import* import, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_function(Function* function, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_method(Method* method, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_class(Class* class, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_if(If* if_, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_for(For* for_, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_while(While* while_, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_primary(Primary* primary, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]);

void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 78 Starting output_code_member\n");
    switch (code_member->type) {
        case CODE_IMPORT:
            ast_output(0, false, "import\n");
            output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
            break;
        case CODE_FUNCTION:
            ast_output(0, false, "function\n");
            output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
            break;
        case CODE_CLASS:
            ast_output(0, false, "class\n");
            output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
            break;
        default:
            ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
            break;
    }
    // printf("[DEBUG] 79 Finished output_code_member\n");
}
void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 80 Starting output_code\n");
    list(CodeMember*) members = list_copy(code->members);
    CodeMember* member;
    while ((member = (CodeMember*)list_pop(members)) != NULL)
        output_code_member(member, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 81 Finished output_code\n");
}
void output_import(Import* import, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 82 Starting output_import\n");
    ast_output(0, false, "name\n");
    output_name(import->name, outfile, indent + 1, indent_has_next);
    ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
    // printf("[DEBUG] 83 Finished output_import\n");
}
void output_function(Function* function, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 84 Starting output_function\n");
    ast_output(0, false, "name\n");
    output_name(function->name, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "return_type\n");
    output_name(function->return_type, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "parameters\n");
    list(Variable*) parameters = list_copy(function->parameters);
    list(Statement*) body = list_copy(function->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        ast_output(1, false, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, indent_has_next);
    }
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 85 Finished output_function\n");
}
void output_method(Method* method, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 86 Starting output_method\n");
    ast_output(0, false, "name\n");
    output_name(method->name, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "return_type\n");
    output_name(method->return_type, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "parameters\n");
    list(Variable*) parameters = list_copy(method->parameters);
    list(Statement*) body = list_copy(method->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        ast_output(1, false, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, indent_has_next);
    }
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 87 Finished output_method\n");
}
void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 88 Starting output_class_member\n");
    switch (class_member->type) {
        case CLASS_METHOD:
            ast_output(0, false, "method\n");
            output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
            break;
        case CLASS_VARIABLE:
            ast_output(0, false, "variable\n");
            output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
            break;
        default:
            ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
            break;
    }
    // printf("[DEBUG] 89 Finished output_class_member\n");
}
void output_class(Class* class, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 90 Starting output_class\n");
    ast_output(0, false, "name\n");
    output_name(class->name, outfile, indent + 1, indent_has_next);
    ast_output(0, true, "members\n");
    list(ClassMember*) members = list_copy(class->members);
    ClassMember* member;
    while ((member = (ClassMember*)list_pop(members)) != NULL)
        output_class_member(member, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 91 Finished output_class\n");
}
void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 92 Starting output_variable\n");
    ast_output(0, false, "type\n");
    output_name(variable->type, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "name\n");
    output_name(variable->name, outfile, indent + 1, indent_has_next);
    if (variable->value != NULL) {
        ast_output(0, true, "value\n");
        output_expression(variable->value, outfile, indent + 1, indent_has_next);
    } else
        ast_output(0, true, "value: \"NULL\"\n");
    // printf("[DEBUG] 93 Finished output_variable\n");
}
void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 94 Starting output_statement\n");
    switch (statement->type) {
        case IF_STATEMENT:
            ast_output(0, false, "if_statement\n");
            output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
            break;
        case FOR_STATEMENT:
            ast_output(0, false, "for_statement\n");
            output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
            break;
        case WHILE_STATEMENT:
            ast_output(0, false, "while_statement\n");
            output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
            break;
        case VARIABLE_STATEMENT:
            ast_output(0, false, "variable_declaration_statement\n");
            output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
            break;
        case RETURN_STATEMENT:
            if (statement->stmt.expr == NULL) {
                ast_output(0, false, "return_statement: \"NULL\"\n");
                // printf("[DEBUG] 95 Finished output_statement\n");
                return;
            }
            ast_output(0, false, "return_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
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
            output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
            break;
        default:
            ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
            break;
    }
    // printf("[DEBUG] 97 Finished output_statement\n");
}
void output_if(If* if_, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 98 Starting output_if\n");
    list(Statement*) body = list_copy(if_->body);
    list(ElseIf*) else_if_list = list_copy(if_->else_if);
    list(Statement*) else_body = list_copy(if_->else_body);
    ast_output(0, false, "condition\n");
    output_expression(if_->condition, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    ast_output(0, false, "else_if\n");
    ElseIf* else_if;
    while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
        output_else_if(else_if, outfile, indent + 1, indent_has_next);
    ast_output(0, true, "else_body\n");
    while ((statement = (Statement*)list_pop(else_body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 99 Finished output_if\n");
}
void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 100 Starting output_else_if\n");
    list(Statement*) body = list_copy(else_if->body);
    ast_output(0, false, "condition\n");
    output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 101 Finished output_else_if\n");
}
void output_for(For* for_, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 102 Starting output_for\n");
    list(Statement*) body = list_copy(for_->body);
    if (for_->initializer != NULL) {
        ast_output(0, false, "initializer\n");
        output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
    } else
        ast_output(0, false, "initializer: \"NULL\"\n");
    if (for_->condition != NULL) {
        ast_output(0, false, "condition\n");
        output_expression(for_->condition, outfile, indent + 1, indent_has_next);
    } else
        ast_output(0, false, "condition: \"NULL\"\n");
    if (for_->increment != NULL) {
        ast_output(0, false, "increment\n");
        output_expression(for_->increment, outfile, indent + 1, indent_has_next);
    } else
        ast_output(0, false, "increment: \"NULL\"\n");
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 103 Finished output_for\n");
}
void output_while(While* while_, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 104 Starting output_while\n");
    list(Statement*) body = list_copy(while_->body);
    ast_output(0, false, "condition\n");
    output_expression(while_->condition, outfile, indent + 1, indent_has_next);
    ast_output(0, true, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    // printf("[DEBUG] 105 Finished output_while\n");
}
void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 106 Starting output_expression\n");
    if (expression->operator == OP_NONE) {
        ast_output(0, true, "primary\n");
        output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
    } else {
        string op_str = operator_to_string(expression->operator);
        ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
        ast_output(0, false, "left\n");
        output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
        ast_output(0, true, "right\n");
        output_expression(expression->right, outfile, indent + 1, indent_has_next);
    }
    // printf("[DEBUG] 107 Finished output_expression\n");
}
void output_primary(Primary* primary, FILE* outfile, size_t indent, char indent_has_next[32]) {
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
            output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_NOT_OPERAND:
            ast_output(0, false, "type: \"!\"\n");
            ast_output(0, true, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_NEG_OPERAND:
            ast_output(0, false, "type: \"-\"\n");
            ast_output(0, true, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_VARIABLE_ACCESS:
            ast_output(0, false, "type: \"variable\"\n");
            ast_output(0, true, "value\n");
            output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
            break;
        default:
            ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
            break;
    }
    // printf("[DEBUG] 109 Finished output_primary\n");
}
void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 110 Starting output_variable_access\n");
    list(Expression*) args;
    int index;
    switch (variable_access->type) {
        case VAR_NAME:
            ast_output(0, false, "type: \"name\"\n");
            ast_output(0, true, "name\n");
            output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(variable_access->content.args);
            ast_output(0, false, "type: \"function_call\"\n");
            ast_output(0, false, "function\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            ast_output(0, true, "arguments\n");
            Expression* arg;
            index = -1;
            while ((arg = (Expression*)list_pop(args)) != NULL) {
                ast_output(1, false, "arguments[%d]\n", ++index);
                output_expression(arg, outfile, indent + 2, indent_has_next);
            }
            break;
        case VAR_GET_SEQ:
            ast_output(0, false, "type: \"get sequence_element\"\n");
            ast_output(0, false, "sequence\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            ast_output(0, true, "index\n");
            output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
            break;
        case VAR_GET_ATTR:
            ast_output(0, false, "type: \"get_attribute\"\n");
            ast_output(0, false, "object\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            ast_output(0, true, "attribute_name\n");
            output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
            break;
        default:
            ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
            break;
    }
    // printf("[DEBUG] 111 Finished output_variable_access\n");
}
void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
    // printf("[DEBUG] 112 Starting output_name\n");
    if (name == NULL) {
        ast_output(0, true, "Name: \"NULL\"\n");
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
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_FUNCTION:
            ast_output(0, false, "kind: \"function\"\n");
            ast_output(0, true, "return_type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_METHOD:
            ast_output(0, false, "kind: \"method\"\n");
            ast_output(0, true, "return_type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_CLASS:
            ast_output(0, true, "kind: \"class\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            ast_output(0, false, "kind: \"attribute\"\n");
            ast_output(0, true, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_PARAM:
            ast_output(0, false, "kind: \"parameter\"\n");
            ast_output(0, true, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        default:
            ast_output(0, true, "kind: \"unknown_NameType\"\n");
            break;
    }
    // printf("[DEBUG] 114 Finished output_name\n");
}

// output TAC
static void output_subroutine(Subroutine* subroutine, FILE* outfile, size_t indent);
static void output_var(Var* var, FILE* outfile, size_t indent);
static void output_block(Block* block, FILE* outfile, size_t indent);
static void output_arg(Arg* arg, FILE* outfile);
static void output_instruction(Instruction* instruction, FILE* outfile, size_t indent);
static void output_attribute_table(AttributeTable* attribute_table, FILE* outfile, size_t indent);
static void output_attribute(Attribute* attribute, FILE* outfile, size_t indent);

void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 115 Starting output_TAC\n");
    if (tac == NULL) {
        tac_output(indent, "TAC: \"NULL\"\n");
        // printf("[DEBUG] 116 Finished output_TAC with NULL\n");
        return;
    }
    tac_output(indent, "TAC {\n");
    if (list_is_empty(tac->attribute_tables))
        tac_output(indent + 1, "designs: []\n");
    else {
        tac_output(indent + 1, "designs: [\n");
        list(AttributeTable*) tables = list_copy(tac->attribute_tables);
        AttributeTable* attribute_table;
        while ((attribute_table = (AttributeTable*)list_pop(tables)) != NULL)
            output_attribute_table(attribute_table, outfile, indent + 2);
        tac_output(indent + 1, "]\n");
    }
    if (tac->entry_point == NULL)
        tac_output(indent + 1, "entry_point: \"NULL\"\n");
    else
        tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
    if (list_is_empty(tac->global_vars))
        tac_output(indent + 1, "global: []\n");
    else {
        tac_output(indent + 1, "global: [\n");
        list(Var*) globals = list_copy(tac->global_vars);
        Var* var;
        while ((var = (Var*)list_pop(globals)) != NULL)
            output_var(var, outfile, indent + 2);
        tac_output(indent + 1, "]\n");
    }
    if (list_is_empty(tac->subroutines))
        tac_output(indent + 1, "subroutines: []\n");
    else {
        tac_output(indent + 1, "subroutines: [\n");
        list(Subroutine*) subs = list_copy(tac->subroutines);
        Subroutine* subroutine;
        while ((subroutine = (Subroutine*)list_pop(subs)) != NULL)
            output_subroutine(subroutine, outfile, indent + 2);
        tac_output(indent + 1, "]\n");
    }
    tac_output(indent, "}\n");
    // printf("[DEBUG] 117 Finished output_TAC\n");
}
void output_subroutine(Subroutine* subroutine, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 118 Starting output_subroutine\n");
    if (subroutine == NULL) {
        tac_output(indent, "Subroutine: \"NULL\"\n");
        // printf("[DEBUG] 119 Finished output_subroutine with NULL\n");
        return;
    }
    if (subroutine->name == NULL)
        tac_output(indent, "NULL {\n");
    else
        tac_output(indent, "%s {\n", subroutine->name->name);
    if (subroutine->return_type == NULL)
        tac_output(indent + 1, "return_type: \"NULL\"\n");
    else
        tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
    if (list_is_empty(subroutine->parameters))
        tac_output(indent + 1, "parameters: []\n");
    else {
        tac_output(indent + 1, "parameters: [\n");
        list(Var*) parameters = list_copy(subroutine->parameters);
        Var* parameter;
        while ((parameter = (Var*)list_pop(parameters)) != NULL)
            output_var(parameter, outfile, indent + 2);
        tac_output(indent + 1, "]\n");
    }
    if (list_is_empty(subroutine->local_vars))
        tac_output(indent + 1, "local: []\n");
    else {
        tac_output(indent + 1, "local: [\n");
        list(Var*) locals = list_copy(subroutine->local_vars);
        Var* var;
        while ((var = (Var*)list_pop(locals)) != NULL)
            output_var(var, outfile, indent + 2);
        tac_output(indent + 1, "]\n");
    }
    if (list_is_empty(subroutine->blocks))
        tac_output(indent + 1, "instructions: []\n");
    else {
        tac_output(indent + 1, "instructions: [\n");
        list(Block*) blocks = list_copy(subroutine->blocks);
        Block* block;
        while ((block = (Block*)list_pop(blocks)) != NULL)
            output_block(block, outfile, indent + 2);
        tac_output(indent + 1, "]\n");
    }
    tac_output(indent, "}\n");
    // printf("[DEBUG] 120 Finished output_subroutine\n");
}
void output_var(Var* var, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 121 Starting output_var\n");
    if (var == NULL) {
        tac_output(indent, "Var: \"NULL\"\n");
        // printf("[DEBUG] 122 Finished output_var with NULL\n");
        return;
    }
    if (var->type == NULL)
        tac_output(indent, "NULL\t%s\n", var->name);
    else if (var->original_name)
        tac_output(indent, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
    else
        tac_output(indent, "%s\t%s\n", var->type->name, var->name);
    // printf("[DEBUG] 123 Finished output_var\n");
}
void output_block(Block* block, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 124 Starting output_block\n");
    if (block == NULL) {
        tac_output(indent, "Block: \"NULL\"\n");
        // printf("[DEBUG] 125 Finished output_block with NULL\n");
        return;
    }
    if (block->label == NULL)
        tac_output(indent, "NULL ");
    else
        tac_output(indent, "%s ", block->label->name);
    if (list_is_empty(block->instructions))
        tac_output(0, "{}\n");
    else {
        tac_output(0, "{\n");
        list(Instruction*) instructions = list_copy(block->instructions);
        Instruction* instruction;
        while ((instruction = (Instruction*)list_pop(instructions)) != NULL)
            output_instruction(instruction, outfile, indent + 1);
        tac_output(indent, "}\n");
    }
    // printf("[DEBUG] 126 Finished output_block\n");
}
void output_arg(Arg* arg, FILE* outfile) {
    // printf("[DEBUG] 127 Starting output_arg\n");
    if (arg == NULL) {
        tac_output(0, "\"NULL\"");
        // printf("[DEBUG] 128 Finished output_arg with NULL\n");
        return;
    }
    switch (arg->kind) {
        case ARG_VARIABLE:
            if (arg->value.variable->original_name)
                tac_output(0, "%s(%s)", arg->value.variable->name, arg->value.variable->original_name->name);
            else
                tac_output(0, "%s", arg->value.variable->name);
            break;
        case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
        case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
        case ARG_STRING: tac_output(0, "\"%s\"", arg->value.string_value); break;
        case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
        case ARG_VOID: tac_output(0, "void"); break;
        case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
        case ARG_FUNCTION:
        case ARG_METHOD:
            if (arg->value.subroutine->original_name)
                tac_output(0, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
            else
                tac_output(0, "%s", arg->value.subroutine->name);
            break;
        case ARG_NONE: tac_output(0, "NONE"); break;
        default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
    }
    // printf("[DEBUG] 129 Finished output_arg\n");
}
void output_instruction(Instruction* instruction, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 130 Starting output_instruction\n");
    if (instruction == NULL) {
        tac_output(indent, "Instruction: \"NULL\"\n");
        // printf("[DEBUG] 131 Finished output_instruction with NULL\n");
        return;
    }
    switch (instruction->type) {
        case INST_ADD: tac_output(indent, "add\t"); break;
        case INST_SUB: tac_output(indent, "sub\t"); break;
        case INST_MUL: tac_output(indent, "mul\t"); break;
        case INST_DIV: tac_output(indent, "div\t"); break;
        case INST_MOD: tac_output(indent, "mod\t"); break;
        case INST_EQ: tac_output(indent, "eq \t"); break;
        case INST_NE: tac_output(indent, "ne \t"); break;
        case INST_LT: tac_output(indent, "lt \t"); break;
        case INST_GT: tac_output(indent, "gt \t"); break;
        case INST_LE: tac_output(indent, "le \t"); break;
        case INST_GE: tac_output(indent, "ge \t"); break;
        case INST_AND: tac_output(indent, "and\t"); break;
        case INST_OR: tac_output(indent, "or \t"); break;
        case INST_NOT: tac_output(indent, "not\t"); break;
        case INST_ASSIGN: tac_output(indent, "assign\t"); break;
        case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
        case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
        case INST_PARAM: tac_output(indent, "param\t"); break;
        case INST_ALLOC: tac_output(indent, "alloc\t"); break;
        case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
        case INST_JMP: tac_output(indent, "jmp\t"); break;
        case INST_RET: tac_output(indent, "ret\t"); break;
        case INST_CALL: tac_output(indent, "call\t"); break;
        case INST_LOAD: tac_output(indent, "load\t"); break;
        case INST_STORE: tac_output(indent, "store\t"); break;
        case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
        default:
            tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
            // printf("[DEBUG] 132 Finished output_instruction with unknown type\n");
            return;
    }
    output_arg(instruction->arg1, outfile);
    switch (instruction->type) {
        case INST_ADD:
        case INST_SUB:
        case INST_MUL:
        case INST_DIV:
        case INST_MOD:
        case INST_EQ:
        case INST_NE:
        case INST_LT:
        case INST_GT:
        case INST_LE:
        case INST_GE:
        case INST_AND:
        case INST_OR:
        case INST_GET_ATTR:
        case INST_GET_ELEM:
        case INST_JMP_C:
        case INST_CALL:
            tac_output(0, " ");
            output_arg(instruction->arg2, outfile);
            tac_output(0, " ");
            output_arg(instruction->arg3, outfile);
            break;
        case INST_NOT:
        case INST_ASSIGN:
        case INST_PARAM:
        case INST_ALLOC:
        case INST_LOAD:
        case INST_STORE:
            tac_output(0, " ");
            output_arg(instruction->arg2, outfile);
            break;
        case INST_JMP:
        case INST_RET:
            break;
        case INST_NONE:
        default:
            // printf("[DEBUG] 133 Finished output_instruction with unknown type\n");
            return;
    }
    tac_output(0, "\n");
    // printf("[DEBUG] 134 Finished output_instruction\n");
}
void output_attribute_table(AttributeTable* attribute_table, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 135 Starting output_attribute_table\n");
    if (attribute_table == NULL) {
        tac_output(indent, "AttributeTable: \"NULL\"\n");
        // printf("[DEBUG] 136 Finished output_attribute_table with NULL\n");
        return;
    }
    if (attribute_table->name == NULL)
        tac_output(indent, "NULL ");
    else
        tac_output(indent, "%s ", attribute_table->name->name);
    tac_output(0, "%zu ", attribute_table->size);
    if (list_is_empty(attribute_table->attributes))
        tac_output(0, "{}\n");
    else {
        tac_output(0, "{\n");
        list(Attribute*) attributes = list_copy(attribute_table->attributes);
        Attribute* attribute;
        while ((attribute = (Attribute*)list_pop(attributes)) != NULL)
            output_attribute(attribute, outfile, indent + 1);
        tac_output(indent, "}\n");
    }
    // printf("[DEBUG] 137 Finished output_attribute_table\n");
}
void output_attribute(Attribute* attribute, FILE* outfile, size_t indent) {
    // printf("[DEBUG] 138 Starting output_attribute\n");
    if (attribute == NULL) {
        tac_output(indent, "Attribute: \"NULL\"\n");
        // printf("[DEBUG] 139 Finished output_attribute with NULL\n");
        return;
    }
    if (attribute->type == NULL)
        tac_output(indent, "NULL\t");
    else
        tac_output(indent, "%s\t", attribute->type->name);
    if (attribute->var == NULL)
        tac_output(0, "NULL ");
    else if (attribute->var->original_name)
        tac_output(0, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
    else
        tac_output(0, "%s ", attribute->var->name);
    tac_output(0, "%zu\n", attribute->offset);
    // printf("[DEBUG] 140 Finished output_attribute\n");
}
