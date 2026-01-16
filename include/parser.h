#ifndef PARSER_H
#define PARSER_H

#include "lib.h"

typedef struct Code {
    offset(Import*) imports;
    offset(Function*) functions;
    offset(Class*) classes;
    offset(Scope*) global_scope;
} Code;

typedef struct Import {
    string name;
    string source;
    offset(Import*) next;
} Import;

typedef struct Function {
    string name;
    string return_type;
    offset(Variable*) parameters;
    offset(Statement*) body;
    offset(Scope*) scope;
    offset(Function*) next;
} Function;

typedef struct Class {
    string name;
    offset(Function*) methods;
    offset(Variable*) attributes;
    offset(Scope*) local_scope;
    offset(Class*) next;
} Class;

typedef struct Variable {
    string type;
    string name;
    offset(Expression*) value;
    offset(Variable*) next;
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
        offset(Expression*) expr;
        offset(Variable*) var_decl;
        offset(If*) if_stmt;
        offset(While*) while_stmt;
        offset(For*) for_stmt;
        offset(Expression*) return_stmt;
    } stmt;
    offset(Statement*) next;
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
    OP_GE,          // >=
    OP_AND,         // &&
    OP_OR,          // ||
    OP_ASSIGN,      // =
    OP_ADD_ASSIGN,  // +=
    OP_SUB_ASSIGN,  // -=
    OP_MUL_ASSIGN,  // *=
    OP_DIV_ASSIGN,  // /=
    OP_MOD_ASSIGN,  // %=
    OP_NONE
} OperatorType;

typedef struct Expression {
    offset(Primary*) prim;
    OperatorType operator;
    offset(Expression*) left;
    offset(Expression*) right;
} Expression;

typedef struct If {
    offset(Expression*) condition;
    offset(Statement*) body;
    offset(If*) else_if;
    offset(Statement*) else_body;
} If;

typedef struct While {
    offset(Expression*) condition;
    offset(Statement*) body;
} While;

typedef struct For {
    offset(Variable*) initialization;
    offset(Expression*) condition;
    offset(Expression*) increment;
    offset(Statement*) body;
} For;

typedef enum PrimaryType {
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
        string string_value;
        offset(Expression*) expr;
        offset(Primary*) operand;
        offset(VariableAccess*) var_access;
    } value;
} Primary;

typedef enum AccessType {
    ACCESS_FUNCTION_CALL,
    ACCESS_GET_ATTR,
    ACCESS_GET_SEQ,
    ACCESS_NONE
} AccessType;

typedef struct VariableAccess {
    string name;
    offset(VariableAccess*) base;
    AccessType access_type;
    union {
        offset(Arguments*) func_call;
        string get_attr;
        offset(Expression*) get_seq;
    } access;
} VariableAccess;

typedef struct Arguments {
    offset(Expression*) args;
    offset(Arguments*) next;
} Arguments;

typedef struct Scope {
    string name;
    offset(Type*) type;
    size_t id;
    offset(Scope*) next;
} Scope;

// `Code* parser(Lexer* lexer)`
offset(Code*) parser(offset(Lexer*) lexer);
// `int operator_precedence(string op)`
int operator_precedence(OperatorType op);
// `void output_ast(Code* ast_node, FILE* outfile, size_t indent)`
void output_ast(offset(Code*) ast_node, FILE* outfile, size_t indent);

#endif  // PARSER_H
