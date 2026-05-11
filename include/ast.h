#ifndef AST_H
#define AST_H

#include "file.h"
#include "symbol_table.h"

typedef struct AST {
    File* file;
    list(CodeMember*) members;
} AST;

typedef enum CodeMemberType {
    CODE_FUNCTION,
    CODE_CLASS,
    CODE_IMPORT,
} CodeMemberType;
typedef enum ClassMemberType {
    CLASS_METHOD,
    CLASS_ATTRIBUTE,
} ClassMemberType;
typedef enum StatementType {
    STATEMENT_DECLARE,
    STATEMENT_IF,
    STATEMENT_FOR,
    STATEMENT_WHILE,
    STATEMENT_BREAK,
    STATEMENT_CONTINUE,
    STATEMENT_RETURN,
    STATEMENT_EXPRESSION,
} StatementType;
typedef enum OperatorType {
    OP_ADD,
    OP_SUB,
    OP_MUL,
    OP_DIV,
    OP_MOD,
    OP_ASSIGN,
    OP_EQ,
    OP_NE,
    OP_LT,
    OP_GT,
    OP_LE,
    OP_GE,
    OP_ADD_ASSIGN,
    OP_SUB_ASSIGN,
    OP_MUL_ASSIGN,
    OP_DIV_ASSIGN,
    OP_MOD_ASSIGN,
    OP_AND,
    OP_OR,
    OP_NONE,
} OperatorType;
typedef enum VariableAccessType {
    VAR_ACCESS_VAR,
    VAR_ACCESS_CALL,
    VAR_ACCESS_ATTRIBUTE,
    VAR_ACCESS_INDEX,
} VariableAccessType;
typedef struct CodeMember CodeMember;
typedef struct Function Function;
typedef struct Class Class;
typedef struct Import Import;
typedef struct Statement Statement;
typedef struct ClassMember ClassMember;
typedef struct Method Method;
typedef struct If If;
typedef struct For For;
typedef struct While While;
typedef struct Expression Expression;
typedef struct Variable Variable;
typedef struct Primary Primary;
typedef struct VariableAccess VariableAccess;

struct CodeMember {
    union {
        Function* function;
        Class* class;
        Import* import;
    } member;
    CodeMemberType type;
};

struct Function {
    Symbol* name;
    Symbol* type;
    list(Symbol*) parameters;
    list(Statement*) body;
};

struct Method {
    Symbol* name;
    Symbol* type;
    list(Symbol*) parameters;
    list(Statement*) body;
    bool special;
    /*
    initialization: $init
    type conversion: $to_int, $to_float, $to_string, $to_bool
    operator overloading: $<op>$<target_type>, e.g. $add$int, $add$float
     */
};

struct Class {
    Symbol* name;
    list(ClassMember*) members;
};

struct Import {
    Symbol* name;
    string path;
};

struct ClassMember {
    union {
        Method* method;
        Variable* attribute;
    } member;
    ClassMemberType type;
};

struct Statement {
    union {
        list(Variable*) declare;  // DECLARE
        If* if_;                  // IF
        For* for_;                // FOR
        While* while_;            // WHILE
        void* break_;             // BREAK
        void* continue_;          // CONTINUE
        Expression* return_;      // RETURN
        Expression* expression;   // EXPRESSION
    } statement;
    StatementType type;
};

struct If {
    Expression* condition;
    list(Statement*) body;
    list(If*) elif_list;  // elif only has condition and body, not elif_list and else_body
    list(Statement*) else_body;
};

struct For {
    union {
        Variable* decl;
        Expression* expr;
    } init;
    Expression* condition;
    Expression* increment;
    list(Statement*) body;
};

struct While {
    Expression* condition;
    list(Statement*) body;
};

struct Expression {
    union {
        Expression* binary;  // binary expression
        Primary* unary;      // unary expression
    } left;
    Expression* right;
    OperatorType op;
};

struct Variable {
    Symbol* var;
    Expression* initializer;
};

struct Primary {
    union {
        string literal;              // literal value, including integer, float, string, "true", "false"
        Expression* exp;             // parenthesized expression
        Primary* neg;                // negative number
        Primary * not;               // logical not
        VariableAccess* var_access;  // variable access
    } value;
};

struct VariableAccess {
    VariableAccess* base;  // if type == simple variable access, base = NULL;
    union {
        Symbol* var;             // simple variable access
        list(Expression*) args;  // function or method call
        Symbol* attribute;       // attribute or method access
        Expression* index;       // container access
    } access;
    VariableAccessType type;
};

#endif  // AST_H
