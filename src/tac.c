#include "tac.h"

#include "create.h"
#include "helper.h"
#include "lib.h"

static AttributeTable* create_attribute_table(Symbol* name) {
    // printf("[DEBUG] 191 Starting create_attribute_table\n");
    AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
    table->attributes = create_list();
    table->name = name;
    table->size = 0;
    // printf("[DEBUG] 192 Finished create_attribute_table\n");
    return table;
}
static size_t get_type_size(Symbol* type) {
    // printf("[DEBUG] 193 Starting get_type_size\n");
    size_t result = 8;
    if (type == NULL)
        result = 0;
    else if (type == name_int || type == name_float || type == name_string)
        result = 8;
    else if (type == name_bool || type == name_void)
        result = 1;
    else if (type->kind == SYMBOL_CLASS)
        result = type->ast_node.class->size;
    else
        fprintf(stderr, "[TAC Warning] at <get_type_size>: Unsupported type for size lookup: %s\n", type->name);
    // printf("[DEBUG] 194 Finished get_type_size\n");
    return result;
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
    // printf("[DEBUG] 195 Starting create_tac\n");
    TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
    tac->attribute_tables = create_list();
    tac->entry_point = NULL;
    tac->global_vars = create_list();
    tac->subroutines = create_list();
    // printf("[DEBUG] 196 Finished create_tac\n");
    return tac;
}
static TACStatus* create_tac_status(TAC* tac) {
    // printf("[DEBUG] 197 Starting create_tac_status\n");
    TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
    status->tac = tac;
    status->current_subroutine = NULL;
    status->current_block = NULL;
    status->current_class = NULL;
    status->end_labels = create_list();
    status->start_labels = create_list();
    status->attr_count = 0;
    status->param_count = 0;
    status->var_count = 0;
    status->temp_count = 0;
    status->block_count = 0;
    status->subroutine_count = 0;
    // printf("[DEBUG] 198 Finished create_tac_status\n");
    return status;
}
static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
    // printf("[DEBUG] 199 Starting create_subroutine\n");
    Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
    subroutine->name = name;
    subroutine->return_type = return_type;
    subroutine->parameters = create_list();
    subroutine->local_vars = create_list();
    subroutine->blocks = create_list();
    // printf("[DEBUG] 200 Finished create_subroutine\n");
    return subroutine;
}
static Block* create_block(Var* label) {
    // printf("[DEBUG] 201 Starting create_block\n");
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    // printf("[DEBUG] 202 Finished create_block\n");
    return block;
}
static Var* search_var(Symbol* original_name, TACStatus* status) {
    // printf("[DEBUG] 203 Starting search_var\n");
    if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
        list(Var*) vars = list_copy(status->current_subroutine->local_vars);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name) {
                // printf("[DEBUG] 204 Finished search_var with local\n");
                return var;
            }
        }
    }
    if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
        list(Var*) vars = list_copy(status->current_subroutine->parameters);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name) {
                // printf("[DEBUG] 205 Finished search_var with parameter\n");
                return var;
            }
        }
    }
    if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
        list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
        AttributeTable* table;
        while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
            if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
                list(Attribute*) attributes = list_copy(table->attributes);
                Attribute* attr;
                while ((attr = (Attribute*)list_pop(attributes)) != NULL)
                    if (attr->var->original_name == original_name) {
                        // printf("[DEBUG] 206 Finished search_var with attribute\n");
                        return attr->var;
                    }
            }
        }
    }
    if (!list_is_empty(status->tac->global_vars)) {
        list(Var*) vars = list_copy(status->tac->global_vars);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name) {
                // printf("[DEBUG] 207 Finished search_var with global\n");
                return var;
            }
        }
    }
    // printf("[DEBUG] 208 Finished search_var with not found\n");
    return NULL;
}
static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
    // printf("[DEBUG] 209 Starting create_var\n");
    if (original_name != NULL) {
        Class* current_class = NULL;
        if (type->kind == SYMBOL_CLASS) {
            current_class = status->current_class;
            status->current_class = type->ast_node.class;
        }
        Var* var = search_var(original_name, status);
        if (type->kind == SYMBOL_CLASS)
            status->current_class = current_class;
        if (var != NULL) {
            // printf("[DEBUG] 210 Finished create_var with existing variable\n");
            return var;
        }
    }
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
        default: assert(false);
    }
    var->name = string_splice("$%c%zu", kind, id);
    var->type = type;
    if ((kind == VAR_TEMP || kind == VAR_VAR) && status->current_subroutine != NULL)
        list_append(status->current_subroutine->local_vars, (pointer)var);
    // printf("[DEBUG] 211 Finished create_var\n");
    return var;
}
static Attribute* create_attribute(Symbol* var, Symbol* type, AttributeTable* table, size_t offset, TACStatus* status) {
    // printf("[DEBUG] 212 Starting create_attribute\n");
    Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
    attr->var = create_var(var, type, VAR_ATTR, status);
    attr->type = type;
    attr->offset = offset;
    if (offset == 0 && table != NULL) {
        attr->offset = table->size;
        table->size += get_type_size(type);
    }
    assert(table != NULL && table->attributes != NULL);
    list_append(table->attributes, (pointer)attr);
    // printf("[DEBUG] 213 Finished create_attribute\n");
    return attr;
}
static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
    // printf("[DEBUG] 214 Starting create_instruction\n");
    Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
    inst->type = type;
    inst->arg1 = arg1;
    inst->arg2 = arg2;
    inst->arg3 = arg3;
    // printf("[DEBUG] 215 Finished create_instruction\n");
    return inst;
}
static Arg* create_arg(ArgType kind, void* value) {
    // printf("[DEBUG] 216 Starting create_arg\n");
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
        case ARG_FUNCTION:
        case ARG_METHOD:
            arg->value.subroutine = (Var*)value;
            arg->type = arg->value.subroutine->type;
            break;
        case ARG_NONE:
        default:
            fprintf(stderr, "[TAC Warning] at <create_arg>: Unsupported argument type for create_arg: %s\n", get_enum_str(kind));
            break;
    }
    arg->is_get = false;
    // printf("[DEBUG] 217 Finished create_arg\n");
    return arg;
}
static Arg* load_rvalue(Arg* arg, TACStatus* status) {
    // printf("[DEBUG] 218 Starting load_rvalue\n");
    if (arg == NULL) return NULL;
    if (arg->is_get) {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
        // printf("[DEBUG] 220 Finished load_rvalue with load\n");
        return temp;
    }
    // printf("[DEBUG] 221 Finished load_rvalue without load\n");
    return arg;
}

TAC* tac_code(Code* code) {
    // printf("[DEBUG] 141 Starting tac_code\n");
    TAC* tac = create_tac();
    TACStatus* status = create_tac_status(tac);

    list(CodeMember*) members = list_copy(code->members);
    CodeMember* code_member;
    while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
        if (code_member->type == CODE_FUNCTION) {
            tac_function(code_member->content.function, status);
            if (strcmp(code_member->content.function->name->name, "main") == 0)
                tac->entry_point = code_member->content.function->name;
        } else if (code_member->type == CODE_CLASS)
            tac_class(code_member->content.class, status);
        else if (code_member->type == CODE_IMPORT)
            tac_import(code_member->content.import, tac, status);
    }
    // printf("[DEBUG] 142 Finished tac_code\n");
    return tac;
}
void tac_import(Import* import, TAC* tac, TACStatus* status) {
    // printf("[DEBUG] 143 Starting tac_import\n");
    if (import->name->kind == SYMBOL_VARIABLE)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
    else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
    else if (import->name->kind == SYMBOL_CLASS)
        tac_class(import->name->ast_node.class, status);
    else
        fprintf(stderr, "[TAC Warning] at <tac_import>: Unsupported symbol kind for import: %s\n", get_enum_str(import->name->kind));
    // printf("[DEBUG] 144 Finished tac_import\n");
}
void tac_function(Function* function, TACStatus* status) {
    // printf("[DEBUG] 145 Starting tac_function\n");
    // create subroutine
    Subroutine* subroutine = create_subroutine(function->name, function->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (pointer)subroutine);
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
        tac_statement(statement, status);
    // reset current subroutine
    status->current_subroutine = NULL;
    // printf("[DEBUG] 146 Finished tac_function\n");
}
void tac_method(Method* method, TACStatus* status) {
    // printf("[DEBUG] 147 Starting tac_method\n");
    // create subroutine
    Subroutine* subroutine = create_subroutine(method->name, method->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (pointer)subroutine);
    // add parameters
    list(Variable*) parameters = list_copy(method->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL)
        list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
    // add block
    Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
    list_append(subroutine->blocks, (pointer)block);
    status->current_block = block;
    // constructor initialization
    list(Statement*) statements = list_copy(method->body);
    if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
        Statement* stmt = (Statement*)list_pop(statements);
        if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
            fprintf(stderr, "[TAC Warning] at <tac_method>: Constructor '%s' does not start with 'self' initialization\n", method->name->name);
            status->current_subroutine = NULL;
            return;
        }
        Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
        list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
    }
    // execute statements
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        tac_statement(statement, status);
    // reset current subroutine
    status->current_subroutine = NULL;
    // printf("[DEBUG] 148 Finished tac_method\n");
}
void tac_class(Class* class, TACStatus* status) {
    // printf("[DEBUG] 149 Starting tac_class\n");
    status->current_class = class;
    list(ClassMember*) members = list_copy(class->members);
    ClassMember* member;
    AttributeTable* attr_table = create_attribute_table(class->name);
    // parser already computes class object size; keep it for later type-size lookup in tac.
    list_append(status->tac->attribute_tables, (pointer)attr_table);
    while ((member = (ClassMember*)list_pop(members)) != NULL) {
        switch (member->type) {
            case CLASS_METHOD:
                tac_method(member->content.method, status);
                break;
            case CLASS_VARIABLE:
                tac_variable(member->content.variable, status, true);
                break;
            default:
                fprintf(stderr, "[TAC Warning] at <tac_class>: Unsupported class member type for tac_class: %s\n", get_enum_str(member->type));
                break;
        }
    }
    status->current_class = NULL;
    // printf("[DEBUG] 150 Finished tac_class\n");
}
void tac_variable(Variable* variable, TACStatus* status, bool is_attr) {
    // printf("[DEBUG] 151 Starting tac_variable\n");
    Var* var = NULL;
    if (is_attr) {
        AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
        list_append(status->tac->attribute_tables, (pointer)attr_table);
        create_attribute(variable->name, variable->type, attr_table, 0, status);
    } else {
        var = create_var(variable->name, variable->type, VAR_VAR, status);
        // if (status->current_subroutine)
        //     list_append(status->current_subroutine->local_vars, (pointer)var);
        // else
        //     list_append(status->tac->global_vars, (pointer)var);
        Arg* value;
        if (variable->value != NULL)
            value = load_rvalue(tac_expression(variable->value, status), status);
        else
            value = create_arg(ARG_INT, &(long long){0});
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
    }
    // printf("[DEBUG] 152 Finished tac_variable\n");
}
void tac_statement(Statement* statement, TACStatus* status) {
    // printf("[DEBUG] 153 Starting tac_statement\n");
    switch (statement->type) {
        case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
        case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
        case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
        case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
        case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
        case RETURN_STATEMENT: {
            Arg* return_value = create_arg(ARG_VOID, NULL);
            if (statement->stmt.return_expr != NULL)
                return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
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
            fprintf(stderr, "[TAC Warning] at <tac_statement>: 'break' statement used outside of loop\n");
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
            fprintf(stderr, "[TAC Warning] at <tac_statement>: 'continue' statement used outside of loop\n");
            break;
        default:
            fprintf(stderr, "[TAC Warning] at <tac_statement>: Unsupported statement type for tac_statement: %s\n", get_enum_str(statement->type));
            break;
    }
    // printf("[DEBUG] 154 Finished tac_statement\n");
}
void tac_if(If* if_, TACStatus* status) {
    // printf("[DEBUG] 155 Starting tac_if\n");
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
    Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
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
        tac_statement(statement, status);
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
            condition = load_rvalue(tac_expression(elif->condition, status), status);
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
                tac_statement(elif_statement, status);
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
            tac_statement(else_statement, status);
        // jump to end block
        jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
        list_append(status->current_block->instructions, (pointer)jump_to_end);
    }
    // add end block
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
    // printf("[DEBUG] 156 Finished tac_if\n");
}
void tac_for(For* for_, TACStatus* status) {
    // printf("[DEBUG] 157 Starting tac_for\n");
    // execute initializer
    if (for_->initializer != NULL)
        tac_variable(for_->initializer, status, false);
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
        Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
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
        tac_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    if (for_->increment != NULL) {
        // execute increment
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* increment_block = create_block(increment_label);
        list_append(status->current_subroutine->blocks, (pointer)increment_block);
        status->current_block = increment_block;
        load_rvalue(tac_expression(for_->increment, status), status);
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
    // printf("[DEBUG] 158 Finished tac_for\n");
}
void tac_while(While* while_, TACStatus* status) {
    // printf("[DEBUG] 159 Starting tac_while\n");
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
    Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
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
        tac_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    // jump to condition check
    inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    // add end block
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
    // printf("[DEBUG] 160 Finished tac_while\n");
}
Arg* tac_expression(Expression* expression, TACStatus* status) {
    // printf("[DEBUG] 161 Starting tac_expression\n");
    if (expression->operator == OP_NONE) {
        Arg* result = tac_primary(expression->prim_left, status);
        // printf("[DEBUG] 162 Finished tac_expression\n");
        return result;
    }
    Arg* right = load_rvalue(tac_expression(expression->right, status), status);
    InstructionType op = get_instruction_type(expression->operator);
    Arg* left = tac_expression(expression->expr_left, status);
    Instruction* inst;
    if (is_assignment_operator(expression->operator)) {
        if (op != INST_ASSIGN) {
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
            inst = create_instruction(op, temp, load_rvalue(left, status), right);
            list_append(status->current_block->instructions, (pointer)inst);
            right = temp;
        }
        if (left->kind != ARG_VARIABLE)
            fprintf(stderr, "[TAC Warning] at <tac_expression>: Left-hand side of assignment is not a variable\n");
        inst = create_instruction(INST_ASSIGN, left, right, NULL);
        if (left->is_get)
            inst = create_instruction(INST_STORE, left, right, NULL);
    } else {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
        inst = create_instruction(op, temp, load_rvalue(left, status), right);
        right = temp;
    }
    list_append(status->current_block->instructions, (pointer)inst);
    // printf("[DEBUG] 163 Finished tac_expression\n");
    return right;
}
Arg* tac_primary(Primary* primary, TACStatus* status) {
    // printf("[DEBUG] 164 Starting tac_primary\n");
    switch (primary->type) {
        case PRIM_INTEGER: {
            long long t = strtoll(primary->value.literal_value, NULL, 10);
            // printf("[DEBUG] 165 Finished tac_primary\n");
            return create_arg(ARG_INT, &t);
        }
        case PRIM_FLOAT: {
            double t = strtod(primary->value.literal_value, NULL);
            return create_arg(ARG_FLOAT, &t);
        }
        case PRIM_STRING:
            // printf("[DEBUG] 166 Finished tac_primary\n");
            return create_arg(ARG_STRING, primary->value.literal_value);
        case PRIM_TRUE: {
            bool t = true;
            // printf("[DEBUG] 167 Finished tac_primary\n");
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_FALSE: {
            bool t = false;
            // printf("[DEBUG] 168 Finished tac_primary\n");
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_EXPRESSION:
            // printf("[DEBUG] 169 Starting tac_primary\n");
            return tac_expression(primary->value.expr, status);
        case PRIM_NOT_OPERAND: {
            Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
            Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
            // printf("[DEBUG] 170 Finished tac_primary\n");
            return temp;
        }
        case PRIM_NEG_OPERAND: {
            Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
            Instruction* inst = NULL;
            long long zero_int = 0;
            double neg_one_float = -1.0;
            if (operand->type == name_int)
                inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
            else if (operand->type == name_float)
                inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
            else {
                fprintf(stderr, "[TAC Warning] at <tac_primary>: Unsupported type for negation: %s\n", operand->type->name);
                // printf("[DEBUG] 171 Finished tac_primary with error\n");
                return NULL;
            }
            list_append(status->current_block->instructions, (pointer)inst);
            // printf("[DEBUG] 172 Finished tac_primary\n");
            return temp;
        }
        case PRIM_VARIABLE_ACCESS:
            // printf("[DEBUG] 173 Starting tac_primary\n");
            return tac_variable_access(primary->value.var, status);
        default:
            fprintf(stderr, "[TAC Warning] at <tac_primary>: Unsupported primary type for tac_primary: %s\n", get_enum_str(primary->type));
            // printf("[DEBUG] 174 Finished tac_primary with error\n");
            return NULL;
    }
}
Arg* tac_variable_access(VariableAccess* variable_access, TACStatus* status) {
    assert(variable_access != NULL);
    // printf("[DEBUG] 175 Starting tac_variable_access\n");
    if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
        if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
            Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
            // printf("[DEBUG] 176 Finished tac_variable_access\n");
            return result;
        } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
            Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
            // printf("[DEBUG] 177 Finished tac_variable_access\n");
            return result;
        } else {
            Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
            // printf("[DEBUG] 177-1 Finished tac_variable_access\n");
            return result;
        }
    }
    assert(variable_access->base != NULL);
    Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
    assert(base != NULL);
    if (variable_access->type == VAR_GET_ATTR) {
        assert(base->type != NULL);
        if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Attempting to access attribute of non-object type: %s\n", base->type->name);
            // printf("[DEBUG] 180 Finished tac_variable_access with error\n");
            return NULL;
        }
        SymbolTable* scope = base->type->ast_node.scope;
        if (base->type->kind == SYMBOL_CLASS)
            scope = base->type->ast_node.class->class_scope;
        Symbol* attr = search_name(scope, variable_access->content.attr_name->name);
        if (attr == NULL) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
            // printf("[DEBUG] 181 Finished tac_variable_access with error\n");
            return NULL;
        }
        if (attr->kind == SYMBOL_FUNCTION) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
            return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        }
        if (attr->kind == SYMBOL_METHOD)
            return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        if (attr->kind != SYMBOL_ATTRIBUTE) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
            // printf("[DEBUG] 182 Finished tac_variable_access with error\n");
            return NULL;
        }
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
        temp->is_get = true;
        list_append(status->current_block->instructions, (pointer)inst);
        // printf("[DEBUG] 183 Finished tac_variable_access\n");
        return temp;
    } else if (variable_access->type == VAR_GET_SEQ) {
        // TODO: arr[index] -> arr.get(index) for user-defined types with getitem method
        if (strcmp(base->type->name, "arr") != 0) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
            // printf("[DEBUG] 185 Finished tac_variable_access with error\n");
            return NULL;
        }
        Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
        if (index == NULL) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Failed to generate variable access for index\n");
            // printf("[DEBUG] 186 Finished tac_variable_access with error\n");
            return NULL;
        }
        // just a special case to get the array element type
        // TODO: design some grammar to set user-defined array-like class getitem method return type and use that instead of this hack.
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
        temp->is_get = true;
        list_append(status->current_block->instructions, (pointer)inst);
        // printf("[DEBUG] 187 Finished tac_variable_access\n");
        return temp;
    } else if (variable_access->type == VAR_FUNC_CALL) {
        if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
            Symbol* attr = search_name(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
            base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        }
        if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
            fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Attempting to call non-function, kind: %s, type name: %s\n", get_enum_str(base->kind), base->type->name);
            // printf("[DEBUG] 188 Finished tac_variable_access with error\n");
            return NULL;
        }
        long long arg_count = 0;
        list(Instruction*) arguments = create_list();
        if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
            Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
            long long size = (long long)get_type_size(self->type);
            list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
            arg_count++;
        }
        list(Expression*) args = list_copy(variable_access->content.args);
        Expression* arg_expr;
        while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
            Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
            long long size = (long long)get_type_size(arg->type);
            list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
            arg_count++;
        }
        Instruction* arg;
        while ((arg = (Instruction*)list_pop(arguments)) != NULL)
            list_append(status->current_block->instructions, (pointer)arg);
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
        // printf("[DEBUG] 189 Finished tac_variable_access\n");
        return temp;
    } else {
        fprintf(stderr, "[TAC Warning] at <tac_variable_access>: Unsupported variable access type for tac_variable_access: %s\n", get_enum_str(variable_access->type));
        // printf("[DEBUG] 190 Finished tac_variable_access with error\n");
        return NULL;
    }
}
