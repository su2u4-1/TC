#ifndef OBJECT_H
#define OBJECT_H

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define bool char
#define true 1
#define false 0
typedef char* string;
typedef size_t* pointer;
#define list(type) List*

typedef enum ArgType {
    ARG_VARIABLE,
    ARG_INT,
    ARG_FLOAT,
    ARG_STRING,
    ARG_BOOL,
    ARG_VOID,
    ARG_LABEL,
    ARG_FUNCTION,
    ARG_METHOD,
    ARG_NONE
} ArgType;
typedef enum ClassMemberType {
    CLASS_METHOD,
    CLASS_VARIABLE
} ClassMemberType;
typedef enum CodeMemberType {
    CODE_IMPORT,
    CODE_FUNCTION,
    CODE_CLASS
} CodeMemberType;
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
typedef enum SymbolType {
    SYMBOL_CLASS,
    SYMBOL_FUNCTION,
    SYMBOL_METHOD,
    SYMBOL_VARIABLE,
    SYMBOL_PARAM,
    SYMBOL_ATTRIBUTE,
    SYMBOL_TYPE
} SymbolType;
typedef enum TokenType {
    EOF_TOKEN,
    IDENTIFIER,
    INTEGER,
    FLOAT,
    STRING,
    SYMBOL,
    KEYWORD,
    COMMENT
} TokenType;
typedef enum VariableAccessType {
    VAR_NAME,
    VAR_FUNC_CALL,
    VAR_GET_ATTR,
    VAR_GET_SEQ
} VariableAccessType;
typedef enum VarType {
    VAR_ATTR = 'a',
    VAR_PARAM = 'p',
    VAR_VAR = 'v',
    VAR_TEMP = 't',
    VAR_BLOCK = 'b',
    VAR_SUBROUTINE = 'f'
} VarType;

typedef struct Arg Arg;
typedef struct Attribute Attribute;
typedef struct AttributeTable AttributeTable;
typedef struct Block Block;
typedef struct Class Class;
typedef struct ClassMember ClassMember;
typedef struct Code Code;
typedef struct CodeMember CodeMember;
typedef struct ElseIf ElseIf;
typedef struct Expression Expression;
typedef struct File File;
typedef struct For For;
typedef struct Function Function;
typedef struct If If;
typedef struct Import Import;
typedef struct Instruction Instruction;
typedef struct Lexer Lexer;
typedef struct List List;
typedef struct MemoryBlock MemoryBlock;
typedef struct Method Method;
typedef struct Node Node;
typedef struct Parser Parser;
typedef struct Primary Primary;
typedef struct Statement Statement;
typedef struct StringList StringList;
typedef struct StrNode StrNode;
typedef struct Subroutine Subroutine;
typedef struct Symbol Symbol;
typedef struct SymbolTable SymbolTable;
typedef struct TAC TAC;
typedef struct TACStatus TACStatus;
typedef struct Token Token;
typedef struct Var Var;
typedef struct Variable Variable;
typedef struct VariableAccess VariableAccess;
typedef struct While While;

struct Arg {
    union {
        Var* variable;
        long long int_value;
        double float_value;
        string string_value;
        bool bool_value;
        Var* label;
        Var* subroutine;
    } value;
    Symbol* type;
    ArgType kind;
    bool is_get;
};
struct Attribute {
    Var* var;
    Symbol* type;
    size_t offset;
};
struct AttributeTable {
    list(Attribute*) attributes;
    Symbol* name;
    size_t size;
};
struct Block {
    Var* label;
    list(Instruction*) instructions;
};
struct Class {
    Symbol* name;
    list(ClassMember*) members;
    SymbolTable* class_scope;
    size_t size;
};
struct ClassMember {
    union {
        Method* method;
        Variable* variable;
    } content;
    ClassMemberType type;
};
struct Code {
    list(CodeMember*) members;
    SymbolTable* global_scope;
};
struct CodeMember {
    union {
        Import* import;
        Function* function;
        Class* class;
    } content;
    CodeMemberType type;
};
struct ElseIf {
    Expression* condition;
    list(Statement*) body;
};
struct Expression {
    Expression* expr_left;
    Primary* prim_left;
    Expression* right;
    OperatorType operator;
};
struct File {
    StrNode* dirs;
    string extension;
    string name;
    string path;
};
struct For {
    Variable* initializer;
    Expression* condition;
    Expression* increment;
    list(Statement*) body;
};
struct Function {
    Symbol* name;
    Symbol* return_type;
    list(Variable*) parameters;
    list(Statement*) body;
    SymbolTable* function_scope;
};
struct If {
    Expression* condition;
    list(Statement*) body;
    list(ElseIf*) else_if;
    list(Statement*) else_body;
};
struct Import {
    Symbol* name;
    string source;
};
struct Instruction {
    Arg* arg1;
    Arg* arg2;
    Arg* arg3;
    InstructionType type;
};
struct Lexer {
    string filename;
    string source;
    size_t position;
    size_t length;
    size_t line;
    size_t column;
    Token* peeked_token;
    size_t peeked_position;
    size_t peeked_line;
    size_t peeked_column;
    Token* current_token;
};
struct List {
    Node* head;
    Node* tail;
};
struct MemoryBlock {
    size_t size;
    size_t used;
    MemoryBlock* next;
    pointer block;
};
struct Method {
    Symbol* name;
    Symbol* return_type;
    list(Variable*) parameters;
    list(Statement*) body;
    SymbolTable* method_scope;
};
struct Node {
    Node* next;
    pointer content;
};
struct Parser {
    File* source_file;
    bool in_function;
    bool in_method;
    bool in_class;
    bool in_loop;
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
struct StringList {
    string str;
    size_t length;
    StringList* next;
};
struct StrNode {
    string dir;
    StrNode* next;
};
struct Subroutine {
    Symbol* name;
    Symbol* return_type;
    list(Var*) parameters;
    list(Var*) local_vars;
    list(Block*) blocks;
};
struct Symbol {
    // for SYMBOL_CLASS and SYMBOL_TYPE, type is NULL
    // but if name == arr, type points to the array element type
    /// TODO: ^this
    // for SYMBOL_FUNCTION and SYMBOL_METHOD, type points to the return type symbol
    // for SYMBOL_VARIABLE and SYMBOL_PARAM, type points to the variable type symbol
    // for SYMBOL_ATTRIBUTE, type points to the attribute type symbol
    Symbol* type;
    string name;
    size_t id;
    union {
        Class* class;        // for SYMBOL_CLASS
        Function* function;  // for SYMBOL_FUNCTION
        Method* method;      // for SYMBOL_METHOD
        SymbolTable* scope;  // for SYMBOL_VARIABLE, SYMBOL_PARAM, SYMBOL_ATTRIBUTE, SYMBOL_TYPE. use current scope for them to allow searching
    } ast_node;
    SymbolType kind;
};
struct SymbolTable {
    SymbolTable* parent;
    list(Symbol*) symbols;
};
struct TAC {
    list(AttributeTable*) attribute_tables;
    Symbol* entry_point;
    list(Var*) global_vars;
    list(Subroutine*) subroutines;
};
struct TACStatus {
    TAC* tac;
    Subroutine* current_subroutine;
    Block* current_block;
    Class* current_class;
    list(Arg*) end_labels;
    list(Arg*) start_labels;
    size_t attr_count;
    size_t param_count;
    size_t var_count;
    size_t temp_count;
    size_t block_count;
    size_t subroutine_count;
};
struct Token {
    string lexeme;
    size_t line, column;
    TokenType type;
};
struct Var {
    Symbol* original_name;
    string name;
    Symbol* type;
};
struct Variable {
    Symbol* type;
    Symbol* name;
    Expression* value;
};
struct VariableAccess {
    VariableAccess* base;
    union {
        Symbol* name;
        list(Expression*) args;  // func_call
        Symbol* attr_name;       // get_attr
        Expression* index;       // get_seq
    } content;
    VariableAccessType type;
};
struct While {
    Expression* condition;
    list(Statement*) body;
};

#endif  // OBJECT_H
