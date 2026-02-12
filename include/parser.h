#ifndef PARSER_H
#define PARSER_H

#include "lib.h"

#define list(type) List*

typedef enum CodeMemberType {
    CODE_IMPORT,
    CODE_FUNCTION,
    CODE_CLASS
} CodeMemberType;
typedef enum ClassMemberType {
    CLASS_METHOD,
    CLASS_VARIABLE
} ClassMemberType;
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
typedef enum VariableAccessType {
    VAR_NAME,
    VAR_FUNC_CALL,
    VAR_GET_ATTR,
    VAR_GET_SEQ
} VariableAccessType;
typedef enum NameType {
    NAME_TYPE,
    NAME_VARIABLE,
    NAME_FUNCTION,
    NAME_METHOD,
    NAME_CLASS,
    NAME_ATTRIBUTE
} NameType;

typedef struct CodeMember CodeMember;
typedef struct Code Code;
typedef struct Import Import;
typedef struct Function Function;
typedef struct Method Method;
typedef struct ClassMember ClassMember;
typedef struct Class Class;
typedef struct Variable Variable;
typedef struct Statement Statement;
typedef struct If If;
typedef struct ElseIf ElseIf;
typedef struct For For;
typedef struct While While;
typedef struct Expression Expression;
typedef struct Primary Primary;
typedef struct VariableAccess VariableAccess;
typedef struct Scope Scope;
typedef struct Name Name;
typedef struct List List;
typedef struct Node Node;

struct CodeMember {
    union {
        Import* import;
        Function* function;
        Class* class_;
    } content;
    CodeMemberType type;
};
struct Code {
    list(CodeMember*) members;
    Scope* global_scope;
};
struct Import {
    Name* name;
    string source;
};
struct Function {
    Name* name;
    Name* return_type;
    list(Variable*) parameters;
    list(Statement*) body;
    Scope* function_scope;
};
struct Method {
    Name* name;
    Name* return_type;
    list(Variable*) parameters;
    list(Statement*) body;
    Scope* method_scope;
};
struct ClassMember {
    union {
        Method* method;
        Variable* variable;
    } content;
    ClassMemberType type;
};
struct Class {
    Name* name;
    list(ClassMember*) members;
    Scope* class_scope;
};

struct Variable {
    Name* type;
    Name* name;
    Expression* value;
};
struct Statement {
    union {
        Expression* expr;
        Variable* var;
        If* if_stmt;
        While* while_stmt;
        For* for_stmt;
        Expression* return_expr;
    } stmt;
    StatementType type;
};
struct If {
    Expression* condition;
    list(Statement*) body;
    list(ElseIf*) else_if;
    list(Statement*) else_body;
};
struct ElseIf {
    Expression* condition;
    list(Statement*) body;
};
struct For {
    Variable* initializer;
    Expression* condition;
    Expression* increment;
    list(Statement*) body;
};
struct While {
    Expression* condition;
    list(Statement*) body;
};
struct Expression {
    Expression* expr_left;
    Primary* prim_left;
    Expression* right;
    OperatorType operator;
};
struct Primary {
    union {
        string literal_value;  // int, float, string, true, false
        Expression* expr;      // expr
        Primary* operand;      // not, neg
        VariableAccess* var;   // variable access
    } value;
    PrimaryType type;
};
struct VariableAccess {
    VariableAccess* base;
    union {
        Name* name;
        list(Expression*) args;  // func_call
        Name* attr_name;         // get_attr
        Expression* index;       // get_seq
    } content;
    VariableAccessType type;
};
struct Scope {
    Scope* parent;
    list(Name*) names;
};
struct Name {
    string name;
    size_t id;
    union {
        // variable type, attribute type, function return ntype, method return type
        Name* type;
        // class scope
        Scope* scope;
        // NAME_TYPE: 0
    } info;
    NameType kind;
};
struct List {
    Node* head;
    Node* tail;
};
struct Node {
    Node* next;
    pointer content;
};

typedef struct Lexer Lexer;
typedef struct Parser Parser;

// public functions
Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser);
void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser);

#endif  // PARSER_H
