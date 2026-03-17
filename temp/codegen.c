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
    id->id = ++status->id_cont;
    id->name = (char*)alloc_memory(sizeDigit + 2);
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
static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
    Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
    inst->type = type;
    inst->arg1 = arg1;
    inst->arg2 = arg2;
    inst->arg3 = arg3;
    return inst;
}
static Arg* create_arg(ArgType type, void* value) {
    Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
    arg->type = type;
    if (type == ARG_INT)
        arg->value.int_value = *(long long*)value;
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
static Block* create_block(Id* label) {
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    return block;
}

TAC* codegen_code(Code* code) {
    return NULL;
}
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
void codegen_while(While* while_, TACStatus* status) {
    Id* start_label = create_var(status, VAR_BLOCK);
    Arg* start_arg = create_arg(ARG_LABEL, start_label);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, start_arg, NULL, NULL));
    Block* block = create_block(start_label);
    list_append(status->current_subroutine->blocks, (pointer)block);
    status->current_block = block;
    Id* end_label = create_var(status, VAR_BLOCK);
    Arg* end_arg = create_arg(ARG_LABEL, end_label);
    Arg* cond = codegen_expression(while_->condition, status);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP_F, end_arg, cond, NULL));
    list(Statement*) body = list_copy(while_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != 0)
        codegen_statement(stmt, status);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, start_arg, NULL, NULL));
    block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)block);
    status->current_block = block;
}
static InstructionType get_instruction_type(OperatorType op) {
    switch (op) {
        case OP_ADD:
        case OP_ADD_ASSIGN: return INST_ADD;
        case OP_SUB:
        case OP_SUB_ASSIGN: return INST_SUB;
        case OP_MUL:
        case OP_MUL_ASSIGN: return INST_MUL;
        case OP_DIV:
        case OP_DIV_ASSIGN: return INST_DIV;
        case OP_ASSIGN: return INST_ASSIGN;
        case OP_MOD:
        case OP_MOD_ASSIGN: return INST_MOD;
        case OP_EQ: return INST_EQ;
        case OP_NE: return INST_NE;
        case OP_LT: return INST_LT;
        case OP_GT: return INST_GT;
        case OP_LE: return INST_LE;
        case OP_GE: return INST_GE;
        case OP_AND: return INST_AND;
        case OP_OR: return INST_OR;
        case OP_NONE:
        default: return INST_NONE;
    }
}
static Arg* load_rvalue(Arg* arg, TACStatus* status) {
    if (status->is_get) {
        status->is_get = false;
        Arg* temp = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
        return temp;
    }
    return arg;
}
Arg* codegen_expression(Expression* expression, TACStatus* status) {
    if (expression->operator == OP_NONE)
        return codegen_primary(expression->prim_left, status);
    status->is_get = false;
    InstructionType base_op = get_instruction_type(expression->operator);
    bool is_compound = (expression->operator == OP_ADD_ASSIGN || expression->operator == OP_SUB_ASSIGN || expression->operator == OP_MUL_ASSIGN || expression->operator == OP_DIV_ASSIGN || expression->operator == OP_MOD_ASSIGN);
    bool is_assign = (expression->operator == OP_ASSIGN || is_compound);
    if (is_assign) {
        Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
        Arg* left = codegen_expression(expression->expr_left, status);
        bool left_is_addr = status->is_get;
        if (is_compound) {
            Arg* left_val = left;
            if (left_is_addr) {
                left_val = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP));
                list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, left_val, left, NULL));
            }
            Arg* result = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP));
            list_append(status->current_block->instructions, (pointer)create_instruction(base_op, result, left_val, right));
            right = result;
        }
        if (left_is_addr)
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_STORE, left, right, NULL));
        else
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, left, right, NULL));
        status->is_get = false;
        return right;
    }
    Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
    Arg* left = load_rvalue(codegen_expression(expression->expr_left, status), status);
    Arg* result = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP));
    list_append(status->current_block->instructions, (pointer)create_instruction(base_op, result, left, right));
    status->is_get = false;
    return result;
}
Arg* codegen_primary(Primary* primary, TACStatus* status) {
    status->is_get = false;
    if (primary->type == PRIM_INTEGER) {
        long long int_value = strtoll(primary->value.literal_value, NULL, 10);
        return create_arg(ARG_INT, &int_value);
    } else if (primary->type == PRIM_FLOAT) {
        double float_value = strtod(primary->value.literal_value, NULL);
        return create_arg(ARG_FLOAT, &float_value);
    } else if (primary->type == PRIM_STRING)
        return create_arg(ARG_STRING, primary->value.literal_value);
    else if (primary->type == PRIM_TRUE) {
        bool bool_value = true;
        return create_arg(ARG_BOOL, &bool_value);
    } else if (primary->type == PRIM_FALSE) {
        bool bool_value = false;
        return create_arg(ARG_BOOL, &bool_value);
    } else if (primary->type == PRIM_EXPRESSION)
        return codegen_expression(primary->value.expr, status);
    else if (primary->type == PRIM_NOT_OPERAND) {
        Arg* arg = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP));
        Instruction* inst = create_instruction(INST_NOT, arg, codegen_primary(primary->value.operand, status), NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        return arg;
    } else if (primary->type == PRIM_NEG_OPERAND) {
        Arg* arg = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP));
        long long zero = 0;
        Instruction* inst = create_instruction(INST_SUB, arg, create_arg(ARG_INT, &zero), codegen_primary(primary->value.operand, status));
        list_append(status->current_block->instructions, (pointer)inst);
        return arg;
    } else if (primary->type == PRIM_VARIABLE_ACCESS)
        return codegen_variable_access(primary->value.var, status);
    else
        fprintf(stderr, "Unknown PrimaryType: %u\n", primary->type);
    return NULL;
}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {
    Arg* base = NULL;
    status->is_get = false;
    if (variable_access->base != NULL)
        base = load_rvalue(codegen_variable_access(variable_access->base, status), status);
    if (variable_access->type == VAR_NAME)
        return create_arg(ARG_VARIABLE, codegen_name(variable_access->content.name));
    else if (variable_access->type == VAR_FUNC_CALL) {
        list(Expression*) args = list_copy(variable_access->content.args);
        Expression* expr;
        long long arg_count = 0;
        while ((expr = (Expression*)list_pop(args)) != 0) {
            Arg* param = load_rvalue(codegen_expression(expr, status), status);
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
        status->is_get = true;
        return var;
    } else if (variable_access->type == VAR_GET_SEQ) {
        Arg* var = create_arg(ARG_VARIABLE, create_var(status, VAR_VAR));
        Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_GET_ELEM, var, base, index));
        status->is_get = true;
        return var;
    } else
        fprintf(stderr, "Unknown VariableAccessType: %u\n", variable_access->type);
    return NULL;
}
Id* codegen_name(Name* name) {
    Id* id = (Id*)alloc_memory(sizeof(Id));
    id->name = name->name;
    id->id = name->id;
    return id;
}
