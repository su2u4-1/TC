#ifndef PARSER_H
#define PARSER_H

#include "lib.h"

#define list(type) offset(List(type)*)

typedef enum CodeMemberType {
    CODE_IMPORT,
    CODE_FUNCTION,
    CODE_CLASS
} CodeMemberType;

typedef struct CodeMember {
    CodeMemberType type;
    union {
        offset(Import*) import;
        offset(Function*) function;
        offset(Class*) class_;
    } content;
} CodeMember;

typedef struct Code {
    list(CodeMember*) members;
    offset(Scope*) global_scope;
} Code;

typedef struct Import {
    string name;
    string source;
} Import;

typedef struct Function {
    string name;
    string return_type;
    list(Variable*) parameters;
    list(Statement*) body;
    offset(Scope*) function_scope;
} Function;

typedef struct Method {
    string name;
    string return_type;
    list(Variable*) parameters;
    list(Statement*) body;
    offset(Scope*) method_scope;
} Method;

typedef enum ClassMemberType {
    CLASS_METHOD,
    CLASS_VARIABLE
} ClassMemberType;

typedef struct ClassMember {
    ClassMemberType type;
    union {
        offset(Method*) method;
        offset(Variable*) variable;
    } content;
} ClassMember;

typedef struct Class {
    string name;
    list(ClassMember*) members;
    offset(Scope*) class_scope;
} Class;

typedef struct Variable {
    string type;
    string name;
    offset(Expression*) value;
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
        offset(Variable*) var;
        offset(If*) if_stmt;
        offset(While*) while_stmt;
        offset(For*) for_stmt;
        offset(Expression*) return_expr;
    } stmt;
} Statement;

typedef struct If {
    offset(Expression*) condition;
    list(Statement*) body;
    list(ElseIf*) else_if;
    list(Statement*) else_body;
} If;

typedef struct ElseIf {
    offset(Expression*) condition;
    list(Statement*) body;
} ElseIf;

typedef struct For {
    offset(Variable*) initializer;
    offset(Expression*) condition;
    offset(Expression*) increment;
    list(Statement*) body;
} For;

typedef struct While {
    offset(Expression*) condition;
    list(Statement*) body;
} While;

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
    OperatorType operator;
    offset(Expression* | Primary*) left;
    offset(Expression*) right;
} Expression;

typedef enum PrimaryType {
    PRIM_INTEGER,
    PRIM_FLOAT,
    PRIM_STRING,
    PRIM_TRUE,
    PRIM_FALSE,
    PRIM_EXPRESSION,
    PRIM_NOT_OPERAND,
    PRIM_NEG_OPERAND,
    PRIM_VARIABLE_ACCESS
} PrimaryType;

typedef struct Primary {
    PrimaryType type;
    union {
        string literal_value;         // int, float, string, true, false
        offset(Expression*) expr;     // expr
        offset(Primary*) operand;     // not, neg
        offset(VariableAccess*) var;  // variable access
    } value;
} Primary;

typedef enum VariableAccessType {
    VAR_NAME,
    VAR_FUNC_CALL,
    VAR_GET_ATTR,
    VAR_GET_SEQ
} VariableAccessType;

typedef struct VariableAccess {
    VariableAccessType type;
    offset(VariableAccess*) base;
    union {
        string name;
        list(Expression*) args;     // func_call
        string attr_name;           // get_attr
        offset(Expression*) index;  // get_seq
    } content;
} VariableAccess;

typedef struct Scope {
    offset(Scope*) parent;
    list(Name*) names;
} Scope;

typedef struct Name {
    string name;
    size_t id;
} Name;

typedef struct List {
    offset(Node*) head;
    offset(Node*) tail;
} List;

typedef struct Node {
    offset(Node*) next;
    offset() content;
} Node;

// public functions
// `Code* parser(Lexer* lexer)`
offset(Code*) parser(offset(Lexer*) lexer);
// `int operator_precedence(string op)`
int operator_precedence(OperatorType op);
// `void output_ast(Code* ast_node, FILE* outfile, size_t indent)`
void output_ast(offset(Code*) ast_node, FILE* outfile, size_t indent);
// `OperatorType string_to_operator(string str)`
OperatorType string_to_operator(string str);

#undef list

#endif  // PARSER_H
