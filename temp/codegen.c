#include "codegen.h"

#include "helper.h"
#include "parser.h"

static AttributeTable* find_attribute_table(TACStatus* status, Symbol* name) {
    list(AttributeTable*) attribute_tables = list_copy(status->attribute_tables);
    AttributeTable* current;
    while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
        if (current->name == name)
            return current;
    return NULL;
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
    status->attribute_tables = tac->attribute_tables;
    status->current_subroutine = NULL;
    status->current_block = NULL;
    status->end_labels = create_list();
    status->start_labels = create_list();
    status->attr_count = 0;
    status->param_count = 0;
    status->var_count = 0;
    status->temp_count = 0;
    status->block_count = 0;
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
        default: id = (size_t)-1; break;
    }
    var->name = create_string("", 32);
    if (id == (size_t)-1)
        sprintf(var->name, "%d-error", kind);
    else
        sprintf(var->name, "%c%zu", kind, id);
    var->type = type;
    return var;
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
            codegen_class(code_member->content.class_, status);
        else if (code_member->type == CODE_IMPORT)
            codegen_import(code_member->content.import, tac, status);
    }
    return tac;
}
void codegen_import(Import* import, TAC* tac, TACStatus* status) {
    if (import->name->kind == SYMBOL_VARIABLE)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
}
void codegen_function(Function* function, TACStatus* status) {
    Subroutine* subroutine = create_subroutine(function->name, function->return_type);
    status->current_subroutine = subroutine;

    list(Variable*) parameters = list_copy(function->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL)
        list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));

    Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
    list_append(subroutine->blocks, (pointer)block);
    status->current_block = block;

    list(Statement*) statements = list_copy(function->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        codegen_statement(statement, status);
}
void codegen_method(Method* method, TACStatus* status) {}
void codegen_class_member(ClassMember* class_member, TACStatus* status) {}
void codegen_class(Class* class, TACStatus* status) {}
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
        case VAR_ATTR:
        case VAR_BLOCK:
        default:
            fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
            break;
    }
}
void codegen_statement(Statement* statement, TACStatus* status) {}
void codegen_if(If* if_, TACStatus* status) {}
void codegen_for(For* for_, TACStatus* status) {}
void codegen_while(While* while_, TACStatus* status) {}
Arg* codegen_expression(Expression* expression, TACStatus* status) {}
Arg* codegen_primary(Primary* primary, TACStatus* status) {}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {}
