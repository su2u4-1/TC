#ifndef CODEGEN_H
#define CODEGEN_H

#include "parser.h"

typedef struct TAC {
    list(AttributeTable*) attribute_tables;
    Symbol* entry_point;
    list(Var*) global_vars;
    list(Subroutine*) subroutines;
} TAC;
typedef struct Subroutine {
    Symbol* name;
    Symbol* return_type;
    list(Var*) parameters;
    list(Var*) local_vars;
    list(Block*) blocks;
} Subroutine;
typedef struct Var {
    Symbol* original_name;
    string name;
    Symbol* type;
} Var;
typedef struct Block {
    Var* label;
    list(Instruction*) instructions;
} Block;
typedef enum ArgType {
    ARG_VARIABLE,
    ARG_INT,
    ARG_FLOAT,
    ARG_STRING,
    ARG_BOOL,
    ARG_VOID,
    ARG_LABEL,
    ARG_NONE
} ArgType;
typedef struct Arg {
    union {
        Symbol* variable;
        long long int_value;
        double float_value;
        string string_value;
        bool bool_value;
        Var* label;
    } value;
    ArgType type;
} Arg;
typedef enum InstructionType {
    INST_ADD,       // +
    INST_SUB,       // -
    INST_MUL,       // *
    INST_DIV,       // /
    INST_MOD,       // %
    INST_EQ,        // ==
    INST_NE,        // !=
    INST_LT,        // <
    INST_GT,        // >
    INST_LE,        // <=
    INST_GE,        // >=
    INST_AND,       // &&
    INST_OR,        // ||
    INST_NOT,       // !
    INST_ASSIGN,    // =
    INST_GET_ATTR,  // get object attribute
    INST_GET_ELEM,  // get array element
    INST_PARAM,     // set parameter for function/method call
    INST_ALLOC,     // allocate size memory for variable
    INST_JMP_C,     // jump to true_label if condition is true, else jump to false_label
    INST_JMP,       // unconditional jump to label
    INST_RET,       // return from subroutine
    INST_CALL,      // call subroutine
    INST_LOAD,      // load value of address to temporary variable
    INST_STORE,     // store value of temporary variable to address
    INST_NONE
} InstructionType;
typedef struct Instruction {
    Arg* arg1;
    Arg* arg2;
    Arg* arg3;
    InstructionType type;
} Instruction;
typedef struct AttributeTable {
    list(Attribute*) attributes;
    Symbol* name;
} AttributeTable;
typedef struct Attribute {
    Symbol* var_name;
    Symbol* type;
    size_t offset;
} Attribute;
typedef struct TACStatus {
    list(AttributeTable*) attribute_tables;
    Subroutine* current_subroutine;
    Block* current_block;
    list(Arg*) end_labels;
    list(Arg*) start_labels;
    size_t attr_count;
    size_t param_count;
    size_t var_count;
    size_t temp_count;
    size_t block_count;
} TACStatus;

typedef enum VarType {
    VAR_ATTR = 'a',
    VAR_PARAM = 'p',
    VAR_VAR = 'v',
    VAR_TEMP = 't',
    VAR_BLOCK = 'b',
} VarType;

TAC* codegen_code(Code* code);
void codegen_import(Import* import, TAC* tac, TACStatus* status);
void codegen_function(Function* function, TACStatus* status);
void codegen_method(Method* method, TACStatus* status);
void codegen_class_member(ClassMember* class_member, TACStatus* status);
void codegen_class(Class* class, TACStatus* status);
void codegen_variable(Variable* variable, TACStatus* status, VarType type);
void codegen_statement(Statement* statement, TACStatus* status);
void codegen_if(If* if_, TACStatus* status);
void codegen_else_if(ElseIf* else_if, TACStatus* status);
void codegen_for(For* for_, TACStatus* status);
void codegen_while(While* while_, TACStatus* status);
Arg* codegen_expression(Expression* expression, TACStatus* status);
Arg* codegen_primary(Primary* primary, TACStatus* status);
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status);

#endif  // CODEGEN_H
