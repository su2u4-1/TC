#include "codegen.h"

#include "helper.h"

static Symbol* search_id(TACStatus* status, Symbol* original_name, VarType type) {
    Var* var = NULL;
    if (original_name == NULL)
        fprintf(stderr, "Warning: original_name or label_name is NULL\n");
    else if (type == VAR_TEMP || type == VAR_VAR || type == VAR_PARAM) {
        list(Var*) vars = list_copy(status->current_subroutine->local_vars);
        if (type == VAR_PARAM)
            vars = list_copy(status->current_subroutine->parameters);
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name)
                return var->name;
        }
    } else if (type == VAR_ATTR) {
        list(SymbolTable*) symbol_tables = list_copy(status->designs);
        SymbolTable* symbol_table;
        while ((symbol_table = (SymbolTable*)list_pop(symbol_tables)) != NULL) {
            list(Symbol*) attributes = list_copy(symbol_table->symbols);
            Symbol* attr;
            while ((attr = (Symbol*)list_pop(attributes)) != NULL) {
                if (attr->original_name == original_name->original_name)
                    return attr;
            }
        }
    } else if (type == VAR_BLOCK) {
        list(Block*) blocks = list_copy(status->current_subroutine->blocks);
        Block* block;
        while ((block = (Block*)list_pop(blocks)) != NULL) {
            if (block->label == original_name)
                return block->label;
        }
    } else
        fprintf(stderr, "Error: Unknown VarType: %c, original_name: %s\n", type, original_name != NULL ? original_name->original_name : "NULL");
    return NULL;
}
static Symbol* create_id(TACStatus* status, Symbol* original_name, VarType type) {
    if (original_name != NULL) {
        Symbol* id = search_id(status, original_name, type);
        if (id != NULL)
            return id;
    }
    string name = (string)alloc_memory(sizeDigit + 2);
    snprintf(name, sizeDigit + 2, "%c%d", type, ++status->id_count);
    return create_symbol(name, SYMBOL_VARIABLE, NULL, NULL);  // TODO
}
static Var* create_var(TACStatus* status, Symbol* original_name, Symbol* type, VarType var_type) {
    Var* var = (Var*)alloc_memory(sizeof(Var));
    var->original_name = original_name;
    var->name = create_id(status, NULL, var_type);
    var->type = type;
    if (var_type == VAR_PARAM)
        list_append(status->current_subroutine->parameters, (pointer)var);
    else if (var_type == VAR_VAR)
        list_append(status->current_subroutine->local_vars, (pointer)var);
    else if (var_type == VAR_ATTR) {
        // TODO
    } else
        fprintf(stderr, "Warning: Unknown VarType for create_var: %c\n", var_type);
    return var;
}
static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
    Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
    inst->type = type;
    inst->arg1 = arg1;
    inst->arg2 = arg2;
    inst->arg3 = arg3;
    return inst;
}
static Arg* create_arg(void* value, ArgType type) {
    Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
    arg->type = type;
    switch (type) {
        case ARG_INT: arg->value.int_value = *(long long*)value; break;
        case ARG_FLOAT: arg->value.float_value = *(double*)value; break;
        case ARG_STRING: arg->value.string_value = (string)value; break;
        case ARG_BOOL: arg->value.bool_value = *(bool*)value; break;
        case ARG_LABEL: arg->value.label = (Symbol*)value; break;
        case ARG_VARIABLE: arg->value.variable = (Symbol*)value; break;
        case ARG_NONE:
        case ARG_VOID:
        default: break;
    }
    return arg;
}
static Block* create_block(Symbol* label) {
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    return block;
}
#define push_inst(type, arg1, arg2, arg3) list_append(status->current_block->instructions, (pointer)create_instruction(type, arg1, arg2, arg3))

static void add_new_block(Symbol* label, TACStatus* status) {
    Block* block = create_block(label);
    list_append(status->current_subroutine->blocks, (pointer)block);
    status->current_block = block;
}
static Arg* load_rvalue(Arg* arg, TACStatus* status) {
    if (arg == NULL)
        return NULL;
    if (status->is_get) {
        status->is_get = false;
        Arg* temp = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE);
        push_inst(INST_LOAD, temp, arg, NULL);
        return temp;
    }
    return arg;
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
void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
    list(Var*) local = status->current_subroutine->local_vars;
    Var* var = create_var(status, variable->name, create_id(status, variable->type, VAR_VAR), type);
    if (variable->value != NULL) {
        Arg* init_value = load_rvalue(codegen_expression(variable->value, status), status);
        push_inst(INST_ASSIGN, create_arg(var->name, ARG_VARIABLE), init_value, NULL);
    }
    list_append(local, (pointer)var);
}
void codegen_statement(Statement* statement, TACStatus* status) {
    switch (statement->type) {
        case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); return;
        case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); return;
        case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); return;
        case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); return;
        case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); return;
        case RETURN_STATEMENT:
            if (statement->stmt.return_expr != NULL) {
                Arg* return_value = load_rvalue(codegen_expression(statement->stmt.return_expr, status), status);
                push_inst(INST_RET, return_value, NULL, NULL);
            } else {
                Arg* void_arg = create_arg(NULL, ARG_VOID);
                push_inst(INST_RET, void_arg, NULL, NULL);
            }
            return;
        case BREAK_STATEMENT:
            if (status->end_labels->head != NULL)
                push_inst(INST_JMP, (Arg*)list_pop_back(status->end_labels), NULL, NULL);
            else
                fprintf(stderr, "Break statement not within a loop\n");
            return;
        case CONTINUE_STATEMENT:
            if (status->start_labels->head != NULL)
                push_inst(INST_JMP, (Arg*)list_pop_back(status->start_labels), NULL, NULL);
            else
                fprintf(stderr, "Continue statement not within a loop\n");
            return;
        default:
            fprintf(stderr, "Unknown StatementType: %u\n", statement->type);
            return;
    }
}
void codegen_if(If* if_, TACStatus* status) {
    Symbol *then_label = create_id(status, NULL, VAR_BLOCK), *next_branch_label = create_id(status, NULL, VAR_BLOCK), *end_label = create_id(status, NULL, VAR_BLOCK);
    Arg *next_branch_arg = create_arg(next_branch_label, ARG_LABEL), *end_arg = create_arg(end_label, ARG_LABEL);
    Arg* cond = load_rvalue(codegen_expression(if_->condition, status), status);
    push_inst(INST_JMP_C, create_arg(then_label, ARG_LABEL), next_branch_arg, cond);
    add_new_block(then_label, status);
    list(Statement*) body = list_copy(if_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != NULL)
        codegen_statement(stmt, status);
    push_inst(INST_JMP, end_arg, NULL, NULL);
    add_new_block(next_branch_label, status);
    if (if_->else_if != NULL) {
        list(ElseIf*) elif_list = list_copy(if_->else_if);
        ElseIf* elif;
        while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
            Arg* elif_cond = load_rvalue(codegen_expression(elif->condition, status), status);
            Symbol *elif_then_label = create_id(status, NULL, VAR_BLOCK), *elif_next_label = create_id(status, NULL, VAR_BLOCK);
            Arg* elif_next_arg = create_arg(elif_next_label, ARG_LABEL);
            push_inst(INST_JMP_C, create_arg(elif_then_label, ARG_LABEL), elif_next_arg, elif_cond);
            add_new_block(elif_then_label, status);
            list(Statement*) elif_body = list_copy(elif->body);
            while ((stmt = (Statement*)list_pop(elif_body)) != NULL)
                codegen_statement(stmt, status);
            push_inst(INST_JMP, end_arg, NULL, NULL);
            add_new_block(elif_next_label, status);
            next_branch_label = elif_next_label;
            next_branch_arg = elif_next_arg;
        }
    }
    if (if_->else_body != NULL) {
        list(Statement*) else_body = list_copy(if_->else_body);
        while ((stmt = (Statement*)list_pop(else_body)) != NULL)
            codegen_statement(stmt, status);
    }
    push_inst(INST_JMP, end_arg, NULL, NULL);
    add_new_block(end_label, status);
}
void codegen_for(For* for_, TACStatus* status) {
    if (for_->initializer != NULL)
        codegen_variable(for_->initializer, status, VAR_VAR);
    Symbol* cond_label = create_id(status, NULL, VAR_BLOCK);
    Symbol* body_label = create_id(status, NULL, VAR_BLOCK);
    Symbol* incr_label = create_id(status, NULL, VAR_BLOCK);
    Symbol* end_label = create_id(status, NULL, VAR_BLOCK);
    Arg* cond_arg = create_arg(cond_label, ARG_LABEL);
    Arg* body_arg = create_arg(body_label, ARG_LABEL);
    Arg* incr_arg = create_arg(incr_label, ARG_LABEL);
    Arg* end_arg = create_arg(end_label, ARG_LABEL);
    push_inst(INST_JMP, cond_arg, NULL, NULL);
    add_new_block(cond_label, status);
    if (for_->condition != NULL)
        push_inst(INST_JMP_C, body_arg, end_arg, load_rvalue(codegen_expression(for_->condition, status), status));
    else
        push_inst(INST_JMP, body_arg, NULL, NULL);
    add_new_block(body_label, status);
    list_append(status->end_labels, (pointer)end_arg);
    list_append(status->start_labels, (pointer)incr_arg);
    list(Statement*) body = list_copy(for_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != NULL)
        codegen_statement(stmt, status);
    list_pop_back(status->end_labels);
    list_pop_back(status->start_labels);
    push_inst(INST_JMP, incr_arg, NULL, NULL);
    add_new_block(incr_label, status);
    if (for_->increment != NULL)
        codegen_expression(for_->increment, status);
    push_inst(INST_JMP, cond_arg, NULL, NULL);
    add_new_block(end_label, status);
}
void codegen_while(While* while_, TACStatus* status) {
    Symbol* cond_label = create_id(status, NULL, VAR_BLOCK);
    Symbol* body_label = create_id(status, NULL, VAR_BLOCK);
    Symbol* end_label = create_id(status, NULL, VAR_BLOCK);
    Arg* cond_arg = create_arg(cond_label, ARG_LABEL);
    Arg* end_arg = create_arg(end_label, ARG_LABEL);
    push_inst(INST_JMP, cond_arg, NULL, NULL);
    add_new_block(cond_label, status);
    Arg* cond = load_rvalue(codegen_expression(while_->condition, status), status);
    push_inst(INST_JMP_C, create_arg(body_label, ARG_LABEL), end_arg, cond);
    add_new_block(body_label, status);
    list_append(status->end_labels, (pointer)end_arg);
    list_append(status->start_labels, (pointer)cond_arg);
    list(Statement*) body = list_copy(while_->body);
    Statement* stmt;
    while ((stmt = (Statement*)list_pop(body)) != NULL)
        codegen_statement(stmt, status);
    list_pop_back(status->end_labels);
    list_pop_back(status->start_labels);
    push_inst(INST_JMP, cond_arg, NULL, NULL);
    add_new_block(end_label, status);
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
                left_val = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE);
                push_inst(INST_LOAD, left_val, left, NULL);
            }
            Arg* result = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE);
            push_inst(base_op, result, left_val, right);
            right = result;
        }
        push_inst(left_is_addr ? INST_STORE : INST_ASSIGN, left, right, NULL);
        status->is_get = false;
        return right;
    }
    Arg* left = load_rvalue(codegen_expression(expression->expr_left, status), status);
    Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
    Arg* result = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE);
    push_inst(base_op, result, left, right);
    status->is_get = false;
    return result;
}
Arg* codegen_primary(Primary* primary, TACStatus* status) {
    status->is_get = false;
    if (primary->type == PRIM_INTEGER) {
        long long int_value = strtoll(primary->value.literal_value, NULL, 10);
        return create_arg(&int_value, ARG_INT);
    } else if (primary->type == PRIM_FLOAT) {
        double float_value = strtod(primary->value.literal_value, NULL);
        return create_arg(&float_value, ARG_FLOAT);
    } else if (primary->type == PRIM_STRING)
        return create_arg(primary->value.literal_value, ARG_STRING);
    else if (primary->type == PRIM_TRUE || primary->type == PRIM_FALSE) {
        bool bool_value = (primary->type == PRIM_TRUE);
        return create_arg(&bool_value, ARG_BOOL);
    } else if (primary->type == PRIM_EXPRESSION)
        return codegen_expression(primary->value.expr, status);
    else if (primary->type == PRIM_NOT_OPERAND || primary->type == PRIM_NEG_OPERAND) {
        Arg *arg = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE), *operand = codegen_primary(primary->value.operand, status);
        long long zero = 0;
        if (primary->type == PRIM_NOT_OPERAND)
            push_inst(INST_NOT, arg, operand, NULL);
        else
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_SUB, arg, create_arg(&zero, ARG_INT), operand));
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
        return create_arg(create_id(status, variable_access->content.name, VAR_VAR), ARG_VARIABLE);
    else if (variable_access->type == VAR_FUNC_CALL) {
        list(Expression*) args = list_copy(variable_access->content.args);
        Expression* expr;
        long long arg_count = 0;
        while ((expr = (Expression*)list_pop(args)) != NULL) {
            Arg* param = load_rvalue(codegen_expression(expr, status), status);
            push_inst(INST_PARAM, param, NULL, NULL);
            ++arg_count;
        }
        Arg *var = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE), *int_arg = create_arg(&arg_count, ARG_INT);
        push_inst(INST_CALL, var, base, int_arg);
        return var;
    } else if (variable_access->type == VAR_GET_ATTR || variable_access->type == VAR_GET_SEQ) {
        Arg *var = create_arg(create_id(status, NULL, VAR_TEMP), ARG_VARIABLE), *offset = NULL;
        if (variable_access->type == VAR_GET_ATTR)
            offset = create_arg(create_id(status, variable_access->content.attr_name, VAR_VAR), ARG_VARIABLE);
        else
            offset = load_rvalue(codegen_expression(variable_access->content.index, status), status);
        push_inst(variable_access->type == VAR_GET_ATTR ? INST_GET_ATTR : INST_GET_ELEM, var, base, offset);
        status->is_get = true;
        return var;
    } else
        fprintf(stderr, "Unknown VariableAccessType: %u\n", variable_access->type);
    return NULL;
}
