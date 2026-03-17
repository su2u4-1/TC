#include "codegen.h"

#include "helper.h"

typedef enum VarType {
    VAR_ATTR = 'a',
    VAR_PARAM = 'p',
    VAR_VAR = 'v',
    VAR_TEMP = 't',
    VAR_BLOCK = 'b',
} VarType;

static Id* create_var(TACStatus* status, VarType type) {
    Id* id = (Id*)alloc_memory(sizeof(Id));
    id->id = ++status->id_cont;
    id->name = (char*)alloc_memory(sizeDigit + 2);
    snprintf(id->name, sizeDigit + 2, "%c%d", type, id->id);
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
    switch (type) {
        case ARG_INT: arg->value.int_value = *(long long*)value; break;
        case ARG_FLOAT: arg->value.float_value = *(double*)value; break;
        case ARG_STRING: arg->value.string_value = (string)value; break;
        case ARG_BOOL: arg->value.bool_value = *(bool*)value; break;
        case ARG_LABEL: arg->value.label = (Id*)value; break;
        case ARG_DESIGN: arg->value.design = (Design*)value; break;
        case ARG_VARIABLE: arg->value.variable = (Id*)value; break;
        case ARG_NONE:
        case ARG_VOID:
        default: break;
    }
    return arg;
}
static Block* create_block(Id* label) {
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    return block;
}
static void add_new_block(Id* label, Arg* arg, TACStatus* status, bool continued) {
    if (continued)
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, arg, NULL, NULL));
    Block* block = create_block(label);
    list_append(status->current_subroutine->blocks, (pointer)block);
    status->current_block = block;
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
void codegen_if(If* if_, TACStatus* status) {
    Arg* cond = codegen_expression(if_->condition, status);
    Id *next_label = create_var(status, VAR_BLOCK), *end_label = next_label;
    Arg *next_arg = create_arg(ARG_LABEL, next_label), *end_arg = next_arg;
    if (if_->else_if != NULL || if_->else_body != NULL) {
        next_label = create_var(status, VAR_BLOCK);
        next_arg = create_arg(ARG_LABEL, next_label);
    }
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP_F, next_arg, cond, NULL));
    list(Statement*) body = list_copy(if_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != 0)
        codegen_statement(stmt, status);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, end_arg, NULL, NULL));
    if (next_label != end_label)
        add_new_block(next_label, next_arg, status, false);
    if (if_->else_if != NULL) {
        list(ElseIf*) elif_list = list_copy(if_->else_if);
        ElseIf* elif;
        while ((elif = (ElseIf*)list_pop(elif_list)) != 0) {
            Arg* elif_cond = codegen_expression(elif->condition, status);
            Id* target_label = end_label;
            Arg* target_arg = end_arg;
            if (elif_list->head != NULL || if_->else_body != NULL) {
                target_arg = create_arg(ARG_LABEL, target_label);
                target_label = create_var(status, VAR_BLOCK);
            }
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP_F, target_arg, elif_cond, NULL));
            list(Statement*) else_if_body = list_copy(elif->body);
            while ((stmt = (Statement*)list_pop(else_if_body)) != 0)
                codegen_statement(stmt, status);
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, end_arg, NULL, NULL));
            if (target_label != end_label)
                add_new_block(target_label, target_arg, status, false);
        }
    }
    if (if_->else_body != NULL) {
        list(Statement*) else_body = list_copy(if_->else_body);
        while ((stmt = (Statement*)list_pop(else_body)) != 0)
            codegen_statement(stmt, status);
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, end_arg, NULL, NULL));
    }
    add_new_block(end_label, end_arg, status, false);
}
void codegen_for(For* for_, TACStatus* status) {
    if (for_->initializer != NULL)
        codegen_variable(for_->initializer, status);
    Id* start_label = create_var(status, VAR_BLOCK);
    Arg* start_arg = create_arg(ARG_LABEL, start_label);
    add_new_block(start_label, start_arg, status, true);
    Id* end_label = create_var(status, VAR_BLOCK);
    Arg* end_arg = create_arg(ARG_LABEL, end_label);
    if (for_->condition != NULL) {
        Arg* cond = codegen_expression(for_->condition, status);
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP_F, end_arg, cond, NULL));
    }
    list_append(status->end_labels, (pointer)end_arg);
    list_append(status->start_labels, (pointer)start_arg);
    list(Statement*) body = list_copy(for_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != 0)
        codegen_statement(stmt, status);
    list_pop_back(status->end_labels);
    list_pop_back(status->start_labels);
    if (for_->increment != NULL)
        codegen_expression(for_->increment, status);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, start_arg, NULL, NULL));
    add_new_block(end_label, end_arg, status, false);
}
void codegen_while(While* while_, TACStatus* status) {
    Id* start_label = create_var(status, VAR_BLOCK);
    Arg* start_arg = create_arg(ARG_LABEL, start_label);
    add_new_block(start_label, start_arg, status, true);
    Id* end_label = create_var(status, VAR_BLOCK);
    Arg* end_arg = create_arg(ARG_LABEL, end_label);
    Arg* cond = codegen_expression(while_->condition, status);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP_F, end_arg, cond, NULL));
    list_append(status->end_labels, (pointer)end_arg);
    list_append(status->start_labels, (pointer)start_arg);
    list(Statement*) body = list_copy(while_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != 0)
        codegen_statement(stmt, status);
    list_pop_back(status->end_labels);
    list_pop_back(status->start_labels);
    list_append(status->current_block->instructions, (pointer)create_instruction(INST_JMP, start_arg, NULL, NULL));
    add_new_block(end_label, end_arg, status, false);
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
        case OP_MOD:
        case OP_MOD_ASSIGN: return INST_MOD;
        case OP_ASSIGN: return INST_ASSIGN;
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
    if (arg == NULL)
        return NULL;
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
    if (expression->operator == OP_ASSIGN || is_compound) {
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
        list_append(status->current_block->instructions, (pointer)create_instruction(left_is_addr ? INST_STORE : INST_ASSIGN, left, right, NULL));
        status->is_get = false;
        return right;
    }
    Arg* left = load_rvalue(codegen_expression(expression->expr_left, status), status);
    Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
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
    else if (primary->type == PRIM_TRUE || primary->type == PRIM_FALSE) {
        bool bool_value = (primary->type == PRIM_TRUE);
        return create_arg(ARG_BOOL, &bool_value);
    } else if (primary->type == PRIM_EXPRESSION)
        return codegen_expression(primary->value.expr, status);
    else if (primary->type == PRIM_NOT_OPERAND || primary->type == PRIM_NEG_OPERAND) {
        Arg *arg = create_arg(ARG_VARIABLE, create_var(status, VAR_TEMP)), *operand = codegen_primary(primary->value.operand, status);
        long long zero = 0;
        if (primary->type == PRIM_NOT_OPERAND)
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_NOT, arg, operand, NULL));
        else
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_SUB, arg, create_arg(ARG_INT, &zero), operand));
        return arg;
    } else if (primary->type == PRIM_VARIABLE_ACCESS)
        return codegen_variable_access(primary->value.var, status);
    else
        fprintf(stderr, "Unknown PrimaryType: %u\n", primary->type);
    return NULL;
}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {
    Arg* base = NULL;
    if (variable_access->base != NULL)
        base = load_rvalue(codegen_variable_access(variable_access->base, status), status);
    status->is_get = false;
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
        Arg *var = create_arg(ARG_VARIABLE, create_var(status, VAR_VAR)), *int_arg = create_arg(ARG_INT, &arg_count);
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, var, base, int_arg));
        return var;
    } else if (variable_access->type == VAR_GET_ATTR || variable_access->type == VAR_GET_SEQ) {
        Arg *var = create_arg(ARG_VARIABLE, create_var(status, VAR_VAR)), *offset = NULL;
        if (variable_access->type == VAR_GET_ATTR)
            offset = create_arg(ARG_VARIABLE, codegen_name(variable_access->content.attr_name));
        else
            offset = load_rvalue(codegen_expression(variable_access->content.index, status), status);
        list_append(status->current_block->instructions, (pointer)create_instruction(variable_access->type == VAR_GET_ATTR ? INST_GET_ATTR : INST_GET_ELEM, var, base, offset));
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
