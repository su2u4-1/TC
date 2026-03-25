#include "codegen.h"

#include "helper.h"

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

TAC* codegen_code(Code* code) {}
void codegen_code_member(CodeMember* code_member, TACStatus* status) {}
void codegen_import(Import* import, TACStatus* status) {}
void codegen_function(Function* function, TACStatus* status) {}
void codegen_method(Method* method, TACStatus* status) {}
void codegen_class_member(ClassMember* class_member, TACStatus* status) {}
void codegen_class(Class* class, TACStatus* status) {}
void codegen_variable(Variable* variable, TACStatus* status, VarType type) {}
void codegen_statement(Statement* statement, TACStatus* status) {}
void codegen_if(If* if_, TACStatus* status) {}
void codegen_for(For* for_, TACStatus* status) {}
void codegen_while(While* while_, TACStatus* status) {}
Arg* codegen_expression(Expression* expression, TACStatus* status) {}
Arg* codegen_primary(Primary* primary, TACStatus* status) {}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {}
