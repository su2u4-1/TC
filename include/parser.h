#ifndef PARSER_H
#define PARSER_H

#include "lexer.h"
#include "lib.h"

typedef struct Code {
    offset_ptr(Import*) imports;
    offset_ptr(Function*) functions;
    offset_ptr(Class*) classes;
    offset_ptr(Scope*) global_scope;
} Code;

typedef struct Import {
    offset name;
    offset source;
    offset_ptr(Import*) next;
} Import;

typedef struct Function {
    offset name;
    offset return_type;
    offset_ptr(Variable*) parameters;
    offset_ptr(Statement*) body;
    offset_ptr(Scope*) scope;
    offset_ptr(Function*) next;
} Function;

typedef struct Class {
    offset name;
    offset_ptr(Function*) methods;
    offset_ptr(Variable*) attributes;
    offset_ptr(Scope*) local_scope;
    offset_ptr(Class*) next;
} Class;

typedef struct Variable {
    offset type;
    offset name;
    offset_ptr(Expression*) value;
    offset_ptr(Variable*) next;
} Variable;

typedef enum StatementType {
    EXPRESSION_STATEMENT,
    VARIABLE_STATEMENT,
    IF_STATEMENT,
    WHILE_STATEMENT,
    FOR_STATEMENT,
    RETURN_STATEMENT,
    BREAK_STATEMENT,
    CONTINUE_STATEMENT
} StatementType;

typedef struct Statement {
    StatementType type;
    union {
        offset_ptr(Expression*) expr;
        offset_ptr(Variable*) var_decl;
        offset_ptr(If*) if_stmt;
        offset_ptr(While*) while_stmt;
        offset_ptr(For*) for_stmt;
        offset_ptr(Expression*) return_stmt;
    } stmt;
    offset_ptr(Statement*) next;
} Statement;

typedef enum OperatorType {
    OP_ADD,         // +
    OP_SUB,         // -
    OP_MUL,         // *
    OP_DIV,         // /
    OP_MOD,         // %
    OP_EQ,          // ==
    OP_NE,          // !=
    OP_LT,          // <
    OP_GT,          // >
    OP_LE,          // <=
    OP_GE,          //>=
    OP_AND,         // &&
    OP_OR,          // ||
    OP_ASSIGN,      // =
    OP_ADD_ASSIGN,  // +=
    OP_SUB_ASSIGN,  // -=
    OP_MUL_ASSIGN,  // *=
    OP_DIV_ASSIGN,  // /=
    OP_MOD_ASSIGN   // %=
} OperatorType;

typedef struct Expression {
    offset_ptr(Primary*) prim;
    OperatorType operator;
    offset_ptr(Expression*) left;
    offset_ptr(Expression*) right;
} Expression;

typedef struct If {
    offset_ptr(Expression*) condition;
    offset_ptr(Statement*) body;
    offset_ptr(If*) else_if;
    offset_ptr(Statement*) else_body;
} If;

typedef struct While {
    offset_ptr(Expression*) condition;
    offset_ptr(Statement*) body;
} While;

typedef struct For {
    offset_ptr(Variable*) initialization;
    offset_ptr(Expression*) condition;
    offset_ptr(Expression*) increment;
    offset_ptr(Statement*) body;
} For;

typedef enum PrimaryType {
    PRIM_IDENTIFIER,
    PRIM_INTEGER,
    PRIM_FLOAT,
    PRIM_STRING,
    PRIM_TRUE,
    PRIM_FALSE,
    PRIM_EXPRESSION,
    PRIM_NOT_OPERAND,
    PRIM_NEGATE_OPERAND,
    PRIM_VARIABLE_ACCESS
} PrimaryType;

typedef struct Primary {
    PrimaryType type;
    union {
        offset int_v;
        offset float_v;
        offset string_v;
        offset_ptr(Expression*) expr;
        offset_ptr(Primary*) operand;
        offset_ptr(VariableAccess*) var_access;
    } value;
} Primary;

typedef enum AccessType {
    ACCESS_FUNCTION_CALL,
    ACCESS_GET_ATTR,
    ACCESS_GET_SEQ
} AccessType;

typedef struct VariableAccess {
    offset name;
    offset_ptr(VariableAccess*) base;
    AccessType access_type;
    union {
        offset_ptr(Arguments*) func_call;
        offset get_attr;
        offset_ptr(Expression*) get_seq;
    } access;
} VariableAccess;

typedef struct Arguments {
    offset_ptr(Expression*) args;
    offset_ptr(Arguments*) next;
} Arguments;

typedef struct Scope {
    offset name;
    offset_ptr(Type*) types;
    size_t id;
    offset_ptr(Scope*) next;
} Scope;

#endif  // PARSER_H
