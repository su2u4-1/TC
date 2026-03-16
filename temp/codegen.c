#include "codegen.h"

#include "helper.h"

typedef enum VarType {
    VAR_ATTR,
    VAR_PARAM,
    VAR_VAR,
    VAR_TEMP,
    VAR_BLOCK,
} VarType;

static Id* create_var(TACStatus* status, VarType type) {
    Id* id = (Id*)alloc_memory(sizeof(Id));
    id->id = ++status->var_count;
    id->name = (char*)alloc_memory(sizeDigit);
    if (type == VAR_ATTR)
        snprintf(id->name, sizeDigit + 2, "a%d", id->id);
    else if (type == VAR_PARAM)
        snprintf(id->name, sizeDigit + 2, "p%d", id->id);
    else if (type == VAR_VAR)
        snprintf(id->name, sizeDigit + 2, "v%d", id->id);
    else if (type == VAR_TEMP)
        snprintf(id->name, sizeDigit + 2, "t%d", id->id);
    else if (type == VAR_BLOCK)
        snprintf(id->name, sizeDigit + 2, "b%d", id->id);
    return id;
}
static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* result) {
    Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
    inst->type = type;
    inst->arg1 = arg1;
    inst->arg2 = arg2;
    inst->result = result;
    return inst;
}
static Arg* create_arg(ArgType type, void* value) {
    Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
    arg->type = type;
    if (type == ARG_INT)
        arg->value.int_value = *(int*)value;
    else if (type == ARG_FLOAT)
        arg->value.float_value = *(double*)value;
    else if (type == ARG_STRING)
        arg->value.string_value = (string)value;
    else if (type == ARG_BOOL)
        arg->value.bool_value = *(bool*)value;
    else if (type == ARG_LABEL)
        arg->value.label = (Id*)value;
    else if (type == ARG_DESIGN)
        arg->value.design = (Design*)value;
    else if (type == ARG_VARIABLE)
        arg->value.variable = (Id*)value;
    return arg;
}

TAC* codegen_code(Code* code) {}
void codegen_code_member(CodeMember* code_member, TACStatus* status) {}
void codegen_import(Import* import, TACStatus* status) {}
void codegen_function(Function* function, TACStatus* status) {}
void codegen_method(Method* method, TACStatus* status) {}
void codegen_class_member(ClassMember* class_member, TACStatus* status) {}
void codegen_class(Class* class, TACStatus* status) {}
void codegen_variable(Variable* variable, TACStatus* status) {}
void codegen_statement(Statement* statement, TACStatus* status) {}
void codegen_if(If* if_, TACStatus* status) {}
void codegen_else_if(ElseIf* else_if, TACStatus* status) {}
void codegen_for(For* for_, TACStatus* status) {}
void codegen_while(While* while_, TACStatus* status) {}
Arg* codegen_expression(Expression* expression, TACStatus* status) {}
Arg* codegen_primary(Primary* primary, TACStatus* status) {}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {
    Arg* base = NULL;
    if (variable_access->base != NULL)
        base = codegen_variable_access(variable_access->base, status);
    if (variable_access->type == VAR_NAME)
        return create_arg(ARG_VARIABLE, codegen_name(variable_access->content.name));
    else if (variable_access->type == VAR_FUNC_CALL) {
        list(Expression*) args = list_copy(variable_access->content.args);
        Expression* expr;
        size_t arg_count = 0;
        while ((expr = (Expression*)list_pop(args)) != 0) {
            Arg* param = codegen_expression(expr, status);
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_PARAM, param, NULL, NULL));
            ++arg_count;
        }
        Arg* var = create_arg(ARG_VARIABLE, create_var(status, VAR_VAR));
        Arg* int_arg = create_arg(ARG_INT, &arg_count);
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, var, base, int_arg));
        return var;
    } else if (variable_access->type == VAR_GET_ATTR) {
        Arg* var = create_arg(ARG_VARIABLE, create_var(status, VAR_VAR));
        Arg* name = create_arg(ARG_VARIABLE, codegen_name(variable_access->content.attr_name));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_GET_ATTR, var, base, name));
        return var;
    } else if (variable_access->type == VAR_GET_SEQ) {
        Arg* var = create_arg(ARG_VARIABLE, create_var(status, VAR_VAR));
        Arg* index = codegen_expression(variable_access->content.index, status);
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_GET_ELEM, var, base, index));
        return var;
    } else {
        fprintf(stderr, "Unknown VariableAccessType: %u\n", variable_access->type);
        return NULL;
    }
}
Id* codegen_name(Name* name) {
    Id* id = (Id*)alloc_memory(sizeof(Id));
    id->name = name->name;
    id->id = name->id;
    return id;
}
