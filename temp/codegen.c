#include "codegen.h"

#include "helper.h"
#include "parser.h"

static AttributeTable* find_attribute_table(TACStatus* status, Symbol* name) {
    list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
    AttributeTable* current;
    while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
        if (current->name == name)
            return current;
    return NULL;
}
static AttributeTable* create_attribute_table(Symbol* name) {
    AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
    table->attributes = create_list();
    table->name = name;
    table->size = 0;
    return table;
}
static Attribute* create_attribute(Symbol* var_name, Symbol* type, AttributeTable* table, size_t offset) {
    Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
    attr->var_name = var_name;
    attr->type = type;
    // attr->offset = offset;
    // if (offset == 0) {
    //     // TODO: handle different type sizes
    //     attr->offset = table->size;
    //     table->size += 8;
    // }
    list_append(table->attributes, (pointer)attr);
    return attr;
}
static bool is_assignment_operator(OperatorType op) {
    return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
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
static TAC* create_tac(void) {
    TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
    tac->attribute_tables = create_list();
    tac->entry_point = NULL;
    tac->global_vars = create_list();
    tac->subroutines = create_list();
    return tac;
}
static TACStatus* create_tac_status(TAC* tac) {
    TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
    status->tac = tac;
    status->current_subroutine = NULL;
    status->current_block = NULL;
    status->end_labels = create_list();
    status->start_labels = create_list();
    status->attr_count = 0;
    status->param_count = 0;
    status->var_count = 0;
    status->temp_count = 0;
    status->block_count = 0;
    status->subroutine_count = 0;
    return status;
}
static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
    Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
    subroutine->name = name;
    subroutine->return_type = return_type;
    subroutine->parameters = create_list();
    subroutine->local_vars = create_list();
    subroutine->blocks = create_list();
    return subroutine;
}
static Block* create_block(Var* label) {
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    return block;
}
static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
    Var* var = (Var*)alloc_memory(sizeof(Var));
    var->original_name = original_name;
    size_t id;
    switch (kind) {
        case VAR_ATTR: id = status->attr_count++; break;
        case VAR_PARAM: id = status->param_count++; break;
        case VAR_VAR: id = status->var_count++; break;
        case VAR_TEMP: id = status->temp_count++; break;
        case VAR_BLOCK: id = status->block_count++; break;
        case VAR_SUBROUTINE: id = status->subroutine_count++; break;
        default: id = (size_t)-1; break;
    }
    var->name = create_string("", 32);
    if (id == (size_t)-1)
        sprintf(var->name, "$%d-error", kind);
    else
        sprintf(var->name, "$%c%zu", kind, id);
    var->type = type;
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
static Arg* create_arg(ArgType kind, void* value) {
    Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
    arg->kind = kind;
    arg->type = NULL;
    switch (kind) {
        case ARG_VARIABLE:
            arg->value.variable = (Var*)value;
            arg->type = arg->value.variable->type;
            break;
        case ARG_INT:
            arg->value.int_value = *(long long*)value;
            arg->type = name_int;
            break;
        case ARG_FLOAT:
            arg->value.float_value = *(double*)value;
            arg->type = name_float;
            break;
        case ARG_STRING:
            arg->value.string_value = (string)value;
            arg->type = name_string;
            break;
        case ARG_BOOL:
            arg->value.bool_value = *(bool*)value;
            arg->type = name_bool;
            break;
        case ARG_VOID:
            arg->value.string_value = NULL;
            arg->type = name_void;
            break;
        case ARG_LABEL:
            arg->value.label = (Var*)value;
            break;
        case ARG_SUBROUTINE:
            arg->value.subroutine = (Var*)value;
            arg->type = arg->value.subroutine->type;
            break;
        case ARG_NONE:
        default:
            fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
            break;
    }
    arg->is_get = false;
    return arg;
}
static Arg* load_rvalue(Arg* arg, TACStatus* status) {
    if (arg == NULL)
        return NULL;
    if (arg->is_get) {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
        return temp;
    }
    return arg;
}

TAC* codegen_code(Code* code) {
    TAC* tac = create_tac();
    TACStatus* status = create_tac_status(tac);

    list(CodeMember*) members = list_copy(code->members);
    CodeMember* code_member;
    while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
        if (code_member->type == CODE_FUNCTION) {
            codegen_function(code_member->content.function, status);
            if (strcmp(code_member->content.function->name->original_name, "main") == 0)
                tac->entry_point = code_member->content.function->name;
        } else if (code_member->type == CODE_CLASS)
            codegen_class(code_member->content.class, status);
        else if (code_member->type == CODE_IMPORT)
            codegen_import(code_member->content.import, tac, status);
    }
    return tac;
}
void codegen_import(Import* import, TAC* tac, TACStatus* status) {
    if (import->name->kind == SYMBOL_VARIABLE)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
    else if (import->name->kind == SYMBOL_SUBROUTINE)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
    else if (import->name->kind == SYMBOL_CLASS)
        list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
    else
        fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
}
void codegen_function(Function* function, TACStatus* status) {
    // create subroutine
    Subroutine* subroutine = create_subroutine(function->name, function->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (pointer)subroutine);
    // list_append(status->tac->global_vars, (pointer)create_var(function->name, function->name->type, VAR_SUBROUTINE, status));
    // add parameters
    list(Variable*) parameters = list_copy(function->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL)
        list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
    // add block
    Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
    list_append(subroutine->blocks, (pointer)block);
    status->current_block = block;
    // execute statements
    list(Statement*) statements = list_copy(function->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        codegen_statement(statement, status);
    // reset current subroutine
    status->current_subroutine = NULL;
}
void codegen_method(Method* method, Symbol* class_name, TACStatus* status) {
    // create method symbol
    string method_full_name = create_string("", strlen(class_name->original_name) + 2 + strlen(method->name->original_name));
    sprintf(method_full_name, "%s.%s", class_name->original_name, method->name->original_name);
    Symbol* method_symbol = create_symbol(method_full_name, SYMBOL_SUBROUTINE, method->return_type, method->method_scope->parent->parent);
    // create subroutine
    Subroutine* subroutine = create_subroutine(method_symbol, method->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (pointer)subroutine);
    // list_append(status->tac->global_vars, (pointer)create_var(method_symbol, method_symbol->type, VAR_SUBROUTINE, status));
    // add parameters
    list(Variable*) parameters = list_copy(method->parameters);
    Variable* parameter;
    // size_t param_count = 0;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
        // ++param_count;
    }
    // AttributeTable* attr_table = find_attribute_table(status, class_name);
    // Attribute* attr = create_attribute(method_symbol, method_symbol->type, attr_table, param_count);
    // list_append(attr_table->attributes, (pointer)attr);
    // add block
    Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
    list_append(subroutine->blocks, (pointer)block);
    status->current_block = block;
    // execute statements
    list(Statement*) statements = list_copy(method->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        codegen_statement(statement, status);
    // reset current subroutine
    status->current_subroutine = NULL;
}
void codegen_class(Class* class, TACStatus* status) {
    list(ClassMember*) members = list_copy(class->members);
    ClassMember* member;
    // AttributeTable* attr_table = create_attribute_table(class->name);
    // list_append(status->tac->attribute_tables, (pointer)attr_table);
    while ((member = (ClassMember*)list_pop(members)) != NULL) {
        switch (member->type) {
            case CLASS_METHOD:
                codegen_method(member->content.method, class->name, status);
                break;
            case CLASS_VARIABLE:
                codegen_variable(member->content.variable, status, VAR_ATTR);
                break;
            default:
                fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
                break;
        }
    }
}
void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
    Var* var = create_var(variable->name, variable->type, type, status);
    switch (type) {
        case VAR_PARAM:
            list_append(status->current_subroutine->parameters, (pointer)var);
            break;
        case VAR_VAR:
            list_append(status->current_subroutine->local_vars, (pointer)var);
            break;
        case VAR_TEMP:
            list_append(status->current_subroutine->local_vars, (pointer)var);
            break;
        case VAR_SUBROUTINE:
            list_append(status->tac->global_vars, (pointer)var);
            break;
        case VAR_ATTR: {
            // AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
            // list_append(status->tac->attribute_tables, (pointer)attr_table);
            // create_attribute(variable->name, variable->type, attr_table, 0);
            break;
        }
        case VAR_BLOCK:
        default:
            fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
            break;
    }
}
void codegen_statement(Statement* statement, TACStatus* status) {
    switch (statement->type) {
        case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
        case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
        case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
        case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
        case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
        case RETURN_STATEMENT: {
            Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
            Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
            break;
        }
        case BREAK_STATEMENT:
            if (!list_is_empty(status->end_labels)) {
                Arg* label = (Arg*)status->end_labels->tail->content;
                if (label != NULL) {
                    Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
                    list_append(status->current_block->instructions, (pointer)inst);
                    break;
                }
            }
            fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
            break;
        case CONTINUE_STATEMENT:
            if (!list_is_empty(status->start_labels)) {
                Arg* label = (Arg*)status->start_labels->tail->content;
                if (label != NULL) {
                    Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
                    list_append(status->current_block->instructions, (pointer)inst);
                    break;
                }
            }
            fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
            break;
        default:
            fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
            break;
    }
}
void codegen_if(If* if_, TACStatus* status) {
    // create labels
    Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = NULL;
    if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
        end_label = else_label;
    else
        end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
    // execute condition
    Arg* condition = codegen_expression(if_->condition, status);
    Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
    list_append(status->current_block->instructions, (pointer)inst);
    // add then block
    Block* then_block = create_block(then_label);
    list_append(status->current_subroutine->blocks, (pointer)then_block);
    status->current_block = then_block;
    // execute then statements
    list(Statement*) then_statements = list_copy(if_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(then_statements)) != NULL)
        codegen_statement(statement, status);
    // jump to end block
    Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
    list_append(status->current_block->instructions, (pointer)jump_to_end);
    // run else if
    if (!list_is_empty(if_->else_if)) {
        // iterate else if blocks
        list(ElseIf*) elif_list = list_copy(if_->else_if);
        ElseIf* elif;
        while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
            // add else if condition block
            Block* else_if_block = create_block(else_label);
            list_append(status->current_subroutine->blocks, (pointer)else_if_block);
            status->current_block = else_if_block;
            // create labels for else if
            then_label = create_var(NULL, NULL, VAR_BLOCK, status);
            else_label = create_var(NULL, NULL, VAR_BLOCK, status);
            // execute condition
            condition = codegen_expression(elif->condition, status);
            if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
                else_label = end_label;
            inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
            list_append(status->current_block->instructions, (pointer)inst);
            // add else if block
            then_block = create_block(then_label);
            list_append(status->current_subroutine->blocks, (pointer)then_block);
            status->current_block = then_block;
            // execute else if statements
            list(Statement*) elif_statements = list_copy(elif->body);
            Statement* elif_statement;
            while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
                codegen_statement(elif_statement, status);
            // jump to end block
            jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
            list_append(status->current_block->instructions, (pointer)jump_to_end);
        }
    }
    // run else
    if (!list_is_empty(if_->else_body)) {
        // add else block
        Block* else_block = create_block(else_label);
        list_append(status->current_subroutine->blocks, (pointer)else_block);
        status->current_block = else_block;
        // execute else statements
        list(Statement*) else_statements = list_copy(if_->else_body);
        Statement* else_statement;
        while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
            codegen_statement(else_statement, status);
        // jump to end block
        jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
        list_append(status->current_block->instructions, (pointer)jump_to_end);
    }
    // add end block
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
void codegen_for(For* for_, TACStatus* status) {
    // execute initializer
    if (for_->initializer != NULL)
        codegen_variable(for_->initializer, status, VAR_VAR);
    // create labels
    Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    if (for_->condition != NULL) {
        // add condition check block
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* condition_block = create_block(condition_label);
        list_append(status->current_subroutine->blocks, (pointer)condition_block);
        status->current_block = condition_block;
        // execute condition
        Arg* condition = codegen_expression(for_->condition, status);
        inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
        list_append(status->current_block->instructions, (pointer)inst);
    } else {
        // jump to body if no condition
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
    }
    // add body block
    Block* body_block = create_block(body_label);
    list_append(status->current_subroutine->blocks, (pointer)body_block);
    status->current_block = body_block;
    // execute body statements
    Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
    if (for_->increment != NULL)
        list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
    else if (for_->condition != NULL)
        list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
    else
        list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
    list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
    list(Statement*) body_statements = list_copy(for_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(body_statements)) != NULL)
        codegen_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    if (for_->increment != NULL) {
        // execute increment
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* increment_block = create_block(increment_label);
        list_append(status->current_subroutine->blocks, (pointer)increment_block);
        status->current_block = increment_block;
        codegen_expression(for_->increment, status);
    }
    // jump to condition check
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    if (for_->condition == NULL)
        inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    // add end block
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
void codegen_while(While* while_, TACStatus* status) {
    // add condition check block
    Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* condition_block = create_block(condition_label);
    list_append(status->current_subroutine->blocks, (pointer)condition_block);
    status->current_block = condition_block;
    // execute condition
    Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Arg* condition = codegen_expression(while_->condition, status);
    inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
    list_append(status->current_block->instructions, (pointer)inst);
    // add body block
    Block* body_block = create_block(body_label);
    list_append(status->current_subroutine->blocks, (pointer)body_block);
    status->current_block = body_block;
    // execute body statements
    list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
    list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
    list(Statement*) body_statements = list_copy(while_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(body_statements)) != NULL)
        codegen_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    // jump to condition check
    inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    // add end block
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
Arg* codegen_expression(Expression* expression, TACStatus* status) {
    if (expression->operator == OP_NONE)
        return codegen_primary(expression->prim_left, status);
    Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
    InstructionType op = get_instruction_type(expression->operator);
    Arg* left = codegen_expression(expression->expr_left, status);
    Instruction* inst;
    if (is_assignment_operator(expression->operator)) {
        if (op != INST_ASSIGN) {
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
            inst = create_instruction(op, temp, load_rvalue(left, status), right);
            list_append(status->current_block->instructions, (pointer)inst);
            right = temp;
        }
        if (left->kind != ARG_VARIABLE)
            fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
        inst = create_instruction(INST_ASSIGN, left, right, NULL);
        if (left->is_get)
            inst = create_instruction(INST_STORE, left, right, NULL);
    } else {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
        inst = create_instruction(op, temp, load_rvalue(left, status), right);
        right = temp;
    }
    list_append(status->current_block->instructions, (pointer)inst);
    return right;
}
Arg* codegen_primary(Primary* primary, TACStatus* status) {
    switch (primary->type) {
        case PRIM_INTEGER: {
            long long t = strtoll(primary->value.literal_value, NULL, 10);
            return create_arg(ARG_INT, &t);
        }
        case PRIM_FLOAT: {
            double t = strtod(primary->value.literal_value, NULL);
            return create_arg(ARG_FLOAT, &t);
        }
        case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
        case PRIM_TRUE: {
            bool t = true;
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_FALSE: {
            bool t = false;
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
        case PRIM_NOT_OPERAND: {
            Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
            Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
            return temp;
        }
        case PRIM_NEG_OPERAND: {
            Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
            Instruction* inst = NULL;
            long long zero_int = 0;
            double neg_one_float = -1.0;
            if (operand->type == name_int)
                inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
            else if (operand->type == name_float)
                inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
            else {
                fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->original_name);
                return NULL;
            }
            list_append(status->current_block->instructions, (pointer)inst);
            return temp;
        }
        case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
        default:
            fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
            return NULL;
    }
}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {
    // if (variable_access == NULL) return NULL;
    // if ((variable_access->base == NULL) != (variable_access->type == VAR_NAME)) {
    //     fprintf(stderr, "[error] Invalid variable access: base is %s but type is %d\n", variable_access->base == NULL ? "NULL" : "not NULL", variable_access->type);
    //     return NULL;
    // }
    // if (variable_access->type == VAR_NAME) {
    //     if (variable_access->content.name->kind == SYMBOL_SUBROUTINE) {
    //         list(Var*) vars = list_copy(status->tac->global_vars);
    //         Var* var;
    //         while ((var = (Var*)list_pop(vars)) != NULL) {
    //             if (var->original_name == variable_access->content.name) {
    //                 return create_arg(ARG_SUBROUTINE, var);
    //             }
    //         }
    //     } else {
    //         Var* var = create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status);
    //         return create_arg(ARG_VARIABLE, var);
    //     }
    // }
    // if (variable_access->base == NULL) {
    //     fprintf(stderr, "[error] Invalid variable access: base is NULL for non-name type\n");
    //     return NULL;
    // }
    // Arg* base = codegen_variable_access(variable_access->base, status);
    // if (base == NULL) {
    //     fprintf(stderr, "[error] Failed to generate code for variable access base\n");
    //     return NULL;
    // }
    // if (variable_access->type == VAR_FUNC_CALL) {
    //     list(Expression*) args = list_copy(variable_access->content.args);
    //     Expression* arg;
    //     long long arg_count = 0;
    //     while ((arg = (Expression*)list_pop(args)) != NULL) {
    //         codegen_expression(arg, status);
    //         ++arg_count;
    //     }
    //     Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, NULL, VAR_TEMP, status));
    //     Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
    //     list_append(status->current_block->instructions, (pointer)inst);
    //     return temp;
    // } else if (variable_access->type == VAR_GET_ATTR) {
    //     variable_access->content.attr_name;
    // } else if (variable_access->type == VAR_GET_SEQ) {
    //     variable_access->content.index;
    // }
}
