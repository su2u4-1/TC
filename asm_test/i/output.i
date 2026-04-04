#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
typedef char* string;
typedef size_t* pointer;
typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    MemoryBlock* next;
    pointer block;
};
typedef struct StringList StringList;
struct StringList {
    string str;
    size_t length;
    StringList* next;
};
extern string keywordList[22];
extern string symbolList[30];
extern MemoryBlock* struct_memory;
extern MemoryBlock* string_memory;
extern char initialized;
extern StringList* all_string_list;
extern string DEFAULT_INIT_NAME;
extern string DEFAULT_CONSTRUCTOR_NAME;
extern string IMPORT_KEYWORD;
extern string FROM_KEYWORD;
extern string FUNC_KEYWORD;
extern string CLASS_KEYWORD;
extern string METHOD_KEYWORD;
extern string SELF_KEYWORD;
extern string IF_KEYWORD;
extern string ELIF_KEYWORD;
extern string ELSE_KEYWORD;
extern string WHILE_KEYWORD;
extern string FOR_KEYWORD;
extern string TRUE_KEYWORD;
extern string FALSE_KEYWORD;
extern string RETURN_KEYWORD;
extern string BREAK_KEYWORD;
extern string CONTINUE_KEYWORD;
extern string INT_KEYWORD;
extern string FLOAT_KEYWORD;
extern string STRING_KEYWORD;
extern string BOOL_KEYWORD;
extern string VOID_KEYWORD;
extern string VAR_KEYWORD;
extern string L_PAREN_SYMBOL;
extern string R_PAREN_SYMBOL;
extern string L_BRACE_SYMBOL;
extern string R_BRACE_SYMBOL;
extern string COMMA_SYMBOL;
extern string NOT_SYMBOL;
extern string DOT_SYMBOL;
extern string L_BRACKET_SYMBOL;
extern string R_BRACKET_SYMBOL;
extern string SEMICOLON_SYMBOL;
extern string UNDERLINE_SYMBOL;
extern string ADD_SYMBOL;
extern string SUB_SYMBOL;
extern string MUL_SYMBOL;
extern string DIV_SYMBOL;
extern string MOD_SYMBOL;
extern string LT_SYMBOL;
extern string GT_SYMBOL;
extern string ASSIGN_SYMBOL;
extern string EQ_SYMBOL;
extern string NE_SYMBOL;
extern string LE_SYMBOL;
extern string GE_SYMBOL;
extern string ADD_ASSIGN_SYMBOL;
extern string SUB_ASSIGN_SYMBOL;
extern string MUL_ASSIGN_SYMBOL;
extern string DIV_ASSIGN_SYMBOL;
extern string MOD_ASSIGN_SYMBOL;
extern string AND_SYMBOL;
extern string OR_SYMBOL;
typedef struct SymbolTable SymbolTable;
typedef struct Symbol Symbol;
extern Symbol* name_void;
extern Symbol* name_int;
extern Symbol* name_float;
extern Symbol* name_string;
extern Symbol* name_bool;
extern SymbolTable* builtin_scope;
string create_string_not_check(const char* data, size_t length);
string create_string(const char* data, size_t length);
pointer alloc_memory(size_t size);
char is_keyword(const string str);
char string_equal(string a, string b);
string get_info(void);
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
    OP_ADD,
    OP_SUB,
    OP_MUL,
    OP_DIV,
    OP_MOD,
    OP_EQ,
    OP_NE,
    OP_LT,
    OP_GT,
    OP_LE,
    OP_GE,
    OP_AND,
    OP_OR,
    OP_ASSIGN,
    OP_ADD_ASSIGN,
    OP_SUB_ASSIGN,
    OP_MUL_ASSIGN,
    OP_DIV_ASSIGN,
    OP_MOD_ASSIGN,
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
typedef struct List List;
typedef struct Node Node;
typedef enum SymbolTableType {
    SYMBOL_CLASS,
    SYMBOL_FUNCTION,
    SYMBOL_METHOD,
    SYMBOL_VARIABLE,
    SYMBOL_PARAM,
    SYMBOL_ATTRIBUTE,
    SYMBOL_TYPE
} SymbolType;
struct CodeMember {
    union {
        Import* import;
        Function* function;
        Class* class;
    } content;
    CodeMemberType type;
};
struct Code {
    List* members;
    SymbolTable* global_scope;
};
struct Import {
    Symbol* name;
    string source;
};
struct Function {
    Symbol* name;
    Symbol* return_type;
    List* parameters;
    List* body;
    SymbolTable* function_scope;
};
struct Method {
    Symbol* name;
    Symbol* return_type;
    List* parameters;
    List* body;
    SymbolTable* method_scope;
};
struct ClassMember {
    union {
        Method* method;
        Variable* variable;
    } content;
    ClassMemberType type;
};
struct Class {
    Symbol* name;
    List* members;
    SymbolTable* class_scope;
    size_t size;
};
struct Variable {
    Symbol* type;
    Symbol* name;
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
    List* body;
    List* else_if;
    List* else_body;
};
struct ElseIf {
    Expression* condition;
    List* body;
};
struct For {
    Variable* initializer;
    Expression* condition;
    Expression* increment;
    List* body;
};
struct While {
    Expression* condition;
    List* body;
};
struct Expression {
    Expression* expr_left;
    Primary* prim_left;
    Expression* right;
    OperatorType operator;
};
struct Primary {
    union {
        string literal_value;
        Expression* expr;
        Primary* operand;
        VariableAccess* var;
    } value;
    PrimaryType type;
};
struct VariableAccess {
    VariableAccess* base;
    union {
        Symbol* name;
        List* args;
        Symbol* attr_name;
        Expression* index;
    } content;
    VariableAccessType type;
};
struct List {
    Node* head;
    Node* tail;
};
struct Node {
    Node* next;
    pointer content;
};
struct SymbolTable {
    SymbolTable* parent;
    List* symbols;
};
struct Symbol {
    Symbol* type;
    string name;
    size_t id;
    union {
        Class* class;
        Function* function;
        Method* method;
        SymbolTable* scope;
    } ast_node;
    SymbolType kind;
};
typedef struct Lexer Lexer;
typedef struct Parser Parser;
Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]);
typedef struct TAC {
    List* attribute_tables;
    Symbol* entry_point;
    List* global_vars;
    List* subroutines;
} TAC;
typedef struct Subroutine {
    Symbol* name;
    Symbol* return_type;
    List* parameters;
    List* local_vars;
    List* blocks;
} Subroutine;
typedef struct Var {
    Symbol* original_name;
    string name;
    Symbol* type;
} Var;
typedef struct Block {
    Var* label;
    List* instructions;
} Block;
typedef enum ArgType {
    ARG_VARIABLE,
    ARG_INT,
    ARG_FLOAT,
    ARG_STRING,
    ARG_BOOL,
    ARG_VOID,
    ARG_LABEL,
    ARG_SUBROUTINE,
    ARG_NONE
} ArgType;
typedef struct Arg {
    union {
        Var* variable;
        long long int_value;
        double float_value;
        string string_value;
        char bool_value;
        Var* label;
        Var* subroutine;
    } value;
    Symbol* type;
    ArgType kind;
    char is_get;
} Arg;
typedef enum InstructionType {
    INST_ADD,
    INST_SUB,
    INST_MUL,
    INST_DIV,
    INST_MOD,
    INST_EQ,
    INST_NE,
    INST_LT,
    INST_GT,
    INST_LE,
    INST_GE,
    INST_AND,
    INST_OR,
    INST_NOT,
    INST_ASSIGN,
    INST_GET_ATTR,
    INST_GET_ELEM,
    INST_PARAM,
    INST_ALLOC,
    INST_JMP_C,
    INST_JMP,
    INST_RET,
    INST_CALL,
    INST_LOAD,
    INST_STORE,
    INST_NONE
} InstructionType;
typedef struct Instruction {
    Arg* arg1;
    Arg* arg2;
    Arg* arg3;
    InstructionType type;
} Instruction;
typedef struct AttributeTable {
    List* attributes;
    Symbol* name;
    size_t size;
} AttributeTable;
typedef struct Attribute {
    Var* var;
    Symbol* type;
    size_t offset;
} Attribute;
typedef struct TACStatus {
    TAC* tac;
    Subroutine* current_subroutine;
    Block* current_block;
    Class* current_class;
    List* end_labels;
    List* start_labels;
    size_t attr_count;
    size_t param_count;
    size_t var_count;
    size_t temp_count;
    size_t block_count;
    size_t subroutine_count;
} TACStatus;
typedef enum VarType {
    VAR_ATTR = 'a',
    VAR_PARAM = 'p',
    VAR_VAR = 'v',
    VAR_TEMP = 't',
    VAR_BLOCK = 'b',
    VAR_SUBROUTINE = 'f'
} VarType;
TAC* tac_code(Code* code);
void tac_import(Import* import, TAC* tac, TACStatus* status);
void tac_function(Function* function, TACStatus* status);
void tac_method(Method* method, TACStatus* status);
void tac_class_member(ClassMember* class_member, TACStatus* status);
void tac_class(Class* class, TACStatus* status);
void tac_variable(Variable* variable, TACStatus* status, VarType type);
void tac_statement(Statement* statement, TACStatus* status);
void tac_if(If* if_, TACStatus* status);
void tac_else_if(ElseIf* else_if, TACStatus* status);
void tac_for(For* for_, TACStatus* status);
void tac_while(While* while_, TACStatus* status);
Arg* tac_expression(Expression* expression, TACStatus* status);
Arg* tac_primary(Primary* primary, TACStatus* status);
Arg* tac_variable_access(VariableAccess* variable_access, TACStatus* status);
void output_TAC(TAC* tac, FILE* outfile, size_t indent);
typedef struct StrNode StrNode;
struct StrNode {
    string dir;
    StrNode* next;
};
typedef struct File {
    StrNode* dirs;
    string extension;
    string name;
    string path;
} File;
string get_cwd(void);
File* create_file(const string path);
string absolute_path(string path, string base_path);
string get_file_name(File* path);
string get_file_extension(File* path);
string get_file_dir(File* path);
string get_full_path(File* path);
void change_file_extension(File* file, const string new_extension);
void change_file_name(File* file, const string new_name);
typedef struct Parser {
    File* source_file;
    char in_function;
    char in_method;
    char in_class;
    char in_loop;
} Parser;
typedef struct Token Token;
List* create_list(void);
void list_append(List* list, pointer item);
List* list_copy(List* original);
pointer list_pop(List* list);
pointer list_pop_back(List* list);
char list_is_empty(List* list);
Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node);
SymbolTable* create_symbol_table(SymbolTable* parent);
Symbol* search_name(SymbolTable* scope, string name);
Symbol* search_name_use_strcmp(SymbolTable* scope, string name);
char is_builtin_type(string type);
void parser_error(const string message, Token* token, string file_name);
void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]);
void indention_tac(FILE* out, size_t indent);
Parser* create_parser(File* file);
Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file);
string make_method_name(string class_name, string method_name);
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);
static void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_import(Import* import, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_function(Function* function, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_method(Method* method, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_class(Class* class, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_if(If* if_, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_for(For* for_, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_while(While* while_, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_primary(Primary* primary, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, char indent_has_next[32]);
static void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]);
void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, char indent_has_next[32]) {
    switch (code_member->type) {
        case CODE_IMPORT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "import\n");
            output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
            break;
        case CODE_FUNCTION:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "function\n");
            output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
            break;
        case CODE_CLASS:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "class\n");
            output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "unknown_CodeMemberType: %u\n", code_member->type);
            break;
    }
}
void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]) {
    List* members = list_copy(code->members);
    CodeMember* member;
    while ((member = (CodeMember*)list_pop(members)) != NULL)
        output_code_member(member, outfile, indent + 1, indent_has_next);
}
void output_import(Import* import, FILE* outfile, size_t indent, char indent_has_next[32]) {
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "name\n");
    output_name(import->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
}
void output_function(Function* function, FILE* outfile, size_t indent, char indent_has_next[32]) {
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "name\n");
    output_name(function->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "return_type\n");
    output_name(function->return_type, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "parameters\n");
    List* parameters = list_copy(function->parameters);
    List* body = list_copy(function->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        indention(outfile, indent + 1, 0, indent_has_next), fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, indent_has_next);
    }
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_method(Method* method, FILE* outfile, size_t indent, char indent_has_next[32]) {
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "name\n");
    output_name(method->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "return_type\n");
    output_name(method->return_type, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "parameters\n");
    List* parameters = list_copy(method->parameters);
    List* body = list_copy(method->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        indention(outfile, indent + 1, 0, indent_has_next), fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, indent_has_next);
    }
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, char indent_has_next[32]) {
    switch (class_member->type) {
        case CLASS_METHOD:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "method\n");
            output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
            break;
        case CLASS_VARIABLE:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "variable\n");
            output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "unknown_ClassMemberType: %u\n", class_member->type);
            break;
    }
}
void output_class(Class* class, FILE* outfile, size_t indent, char indent_has_next[32]) {
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "name\n");
    output_name(class->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "members\n");
    List* members = list_copy(class->members);
    ClassMember* member;
    while ((member = (ClassMember*)list_pop(members)) != NULL)
        output_class_member(member, outfile, indent + 1, indent_has_next);
}
void output_variable(Variable* variable, FILE* outfile, size_t indent, char indent_has_next[32]) {
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type\n");
    output_name(variable->type, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "name\n");
    output_name(variable->name, outfile, indent + 1, indent_has_next);
    if (variable->value != NULL) {
        indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value\n");
        output_expression(variable->value, outfile, indent + 1, indent_has_next);
    } else
        indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value: \"NULL\"\n");
}
void output_statement(Statement* statement, FILE* outfile, size_t indent, char indent_has_next[32]) {
    switch (statement->type) {
        case IF_STATEMENT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "if_statement\n");
            output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
            break;
        case FOR_STATEMENT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "for_statement\n");
            output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
            break;
        case WHILE_STATEMENT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "while_statement\n");
            output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
            break;
        case VARIABLE_STATEMENT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "variable_declaration_statement\n");
            output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
            break;
        case RETURN_STATEMENT:
            if (statement->stmt.expr == NULL) {
                indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "return_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "return_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
            break;
        case BREAK_STATEMENT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "break_statement: \"NULL\"\n");
            break;
        case CONTINUE_STATEMENT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "continue_statement: \"NULL\"\n");
            break;
        case EXPRESSION_STATEMENT:
            if (statement->stmt.expr == NULL) {
                indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "expression_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "expression_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
            break;
    }
}
void output_if(If* if_, FILE* outfile, size_t indent, char indent_has_next[32]) {
    List* body = list_copy(if_->body);
    List* else_if_list = list_copy(if_->else_if);
    List* else_body = list_copy(if_->else_body);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "condition\n");
    output_expression(if_->condition, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "else_if\n");
    ElseIf* else_if;
    while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
        output_else_if(else_if, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "else_body\n");
    while ((statement = (Statement*)list_pop(else_body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, char indent_has_next[32]) {
    List* body = list_copy(else_if->body);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "condition\n");
    output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_for(For* for_, FILE* outfile, size_t indent, char indent_has_next[32]) {
    List* body = list_copy(for_->body);
    if (for_->initializer != NULL) {
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "initializer\n");
        output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
    } else
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "initializer: \"NULL\"\n");
    if (for_->condition != NULL) {
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "condition\n");
        output_expression(for_->condition, outfile, indent + 1, indent_has_next);
    } else
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "condition: \"NULL\"\n");
    if (for_->increment != NULL) {
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "increment\n");
        output_expression(for_->increment, outfile, indent + 1, indent_has_next);
    } else
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "increment: \"NULL\"\n");
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_while(While* while_, FILE* outfile, size_t indent, char indent_has_next[32]) {
    List* body = list_copy(while_->body);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "condition\n");
    output_expression(while_->condition, outfile, indent + 1, indent_has_next);
    indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_expression(Expression* expression, FILE* outfile, size_t indent, char indent_has_next[32]) {
    if (expression->operator == OP_NONE) {
        indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "primary\n");
        output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
    } else {
        string op_str = operator_to_string(expression->operator);
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
        indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "left\n");
        output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
        indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "right\n");
        output_expression(expression->right, outfile, indent + 1, indent_has_next);
    }
}
void output_primary(Primary* primary, FILE* outfile, size_t indent, char indent_has_next[32]) {
    switch (primary->type) {
        case PRIM_INTEGER:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"integer\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_FLOAT:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"float\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_STRING:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"string\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value: \"%s\"\n", primary->value.literal_value);
            break;
        case PRIM_TRUE:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value: \"true\"\n");
            break;
        case PRIM_FALSE:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value: \"false\"\n");
            break;
        case PRIM_EXPRESSION:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"expression\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value\n");
            output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_NOT_OPERAND:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"!\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_NEG_OPERAND:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"-\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_VARIABLE_ACCESS:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"variable\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "value\n");
            output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
            break;
    }
}
void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, char indent_has_next[32]) {
    List* args;
    int index;
    switch (variable_access->type) {
        case VAR_NAME:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"name\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "name\n");
            output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(variable_access->content.args);
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"function_call\"\n");
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "function\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "arguments\n");
            Expression* arg;
            index = -1;
            while ((arg = (Expression*)list_pop(args)) != NULL) {
                indention(outfile, indent + 1, 0, indent_has_next), fprintf(outfile, "arguments[%d]\n", ++index);
                output_expression(arg, outfile, indent + 2, indent_has_next);
            }
            break;
        case VAR_GET_SEQ:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"get sequence_element\"\n");
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "sequence\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "index\n");
            output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
            break;
        case VAR_GET_ATTR:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "type: \"get_attribute\"\n");
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "object\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "attribute_name\n");
            output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
            break;
    }
}
void output_name(Symbol* name, FILE* outfile, size_t indent, char indent_has_next[32]) {
    if (name == NULL) {
        indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "Name: \"NULL\"\n");
        return;
    }
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "name: \"%s\"\n", name->name);
    indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "id: %zu\n", name->id);
    switch (name->kind) {
        case SYMBOL_TYPE:
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "kind: \"variable\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_FUNCTION:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "kind: \"function\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_METHOD:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "kind: \"method\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_CLASS:
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "kind: \"class\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "kind: \"attribute\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_PARAM:
            indention(outfile, indent + 0, 0, indent_has_next), fprintf(outfile, "kind: \"parameter\"\n");
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent + 0, 1, indent_has_next), fprintf(outfile, "kind: \"unknown_NameType\"\n");
            break;
    }
}
static void output_subroutine(Subroutine* subroutine, FILE* outfile, size_t indent);
static void output_var(Var* var, FILE* outfile, size_t indent);
static void output_block(Block* block, FILE* outfile, size_t indent);
static void output_arg(Arg* arg, FILE* outfile);
static void output_instruction(Instruction* instruction, FILE* outfile, size_t indent);
static void output_attribute_table(AttributeTable* attribute_table, FILE* outfile, size_t indent);
static void output_attribute(Attribute* attribute, FILE* outfile, size_t indent);
void output_TAC(TAC* tac, FILE* outfile, size_t indent) {
    if (tac == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "TAC: \"NULL\"\n");
        return;
    }
    indention_tac(outfile, indent), fprintf(outfile, "TAC {\n");
    if (list_is_empty(tac->attribute_tables))
        indention_tac(outfile, indent + 1), fprintf(outfile, "designs: []\n");
    else {
        indention_tac(outfile, indent + 1), fprintf(outfile, "designs: [\n");
        AttributeTable* attribute_table;
        while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
            output_attribute_table(attribute_table, outfile, indent + 2);
        indention_tac(outfile, indent + 1), fprintf(outfile, "]\n");
    }
    if (tac->entry_point == NULL)
        indention_tac(outfile, indent + 1), fprintf(outfile, "entry_point: \"NULL\"\n");
    else
        indention_tac(outfile, indent + 1), fprintf(outfile, "entry_point: %s\n", tac->entry_point->name);
    if (list_is_empty(tac->global_vars))
        indention_tac(outfile, indent + 1), fprintf(outfile, "global: []\n");
    else {
        indention_tac(outfile, indent + 1), fprintf(outfile, "global: [\n");
        Var* var;
        while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
            output_var(var, outfile, indent + 2);
        indention_tac(outfile, indent + 1), fprintf(outfile, "]\n");
    }
    if (list_is_empty(tac->subroutines))
        indention_tac(outfile, indent + 1), fprintf(outfile, "subroutines: []\n");
    else {
        indention_tac(outfile, indent + 1), fprintf(outfile, "subroutines: [\n");
        Subroutine* subroutine;
        while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
            output_subroutine(subroutine, outfile, indent + 2);
        indention_tac(outfile, indent + 1), fprintf(outfile, "]\n");
    }
    indention_tac(outfile, indent), fprintf(outfile, "}\n");
}
void output_subroutine(Subroutine* subroutine, FILE* outfile, size_t indent) {
    if (subroutine == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "Subroutine: \"NULL\"\n");
        return;
    }
    if (subroutine->name == NULL)
        indention_tac(outfile, indent), fprintf(outfile, "NULL {\n");
    else
        indention_tac(outfile, indent), fprintf(outfile, "%s {\n", subroutine->name->name);
    if (subroutine->return_type == NULL)
        indention_tac(outfile, indent + 1), fprintf(outfile, "return_type: \"NULL\"\n");
    else
        indention_tac(outfile, indent + 1), fprintf(outfile, "return_type: %s\n", subroutine->return_type->name);
    if (list_is_empty(subroutine->parameters))
        indention_tac(outfile, indent + 1), fprintf(outfile, "parameters: []\n");
    else {
        indention_tac(outfile, indent + 1), fprintf(outfile, "parameters: [\n");
        Var* parameter;
        while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
            output_var(parameter, outfile, indent + 2);
        indention_tac(outfile, indent + 1), fprintf(outfile, "]\n");
    }
    if (list_is_empty(subroutine->local_vars))
        indention_tac(outfile, indent + 1), fprintf(outfile, "local: []\n");
    else {
        indention_tac(outfile, indent + 1), fprintf(outfile, "local: [\n");
        Var* var;
        while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
            output_var(var, outfile, indent + 2);
        indention_tac(outfile, indent + 1), fprintf(outfile, "]\n");
    }
    if (list_is_empty(subroutine->blocks))
        indention_tac(outfile, indent + 1), fprintf(outfile, "instructions: []\n");
    else {
        indention_tac(outfile, indent + 1), fprintf(outfile, "instructions: [\n");
        Block* block;
        while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
            output_block(block, outfile, indent + 2);
        indention_tac(outfile, indent + 1), fprintf(outfile, "]\n");
    }
    indention_tac(outfile, indent), fprintf(outfile, "}\n");
}
void output_var(Var* var, FILE* outfile, size_t indent) {
    if (var == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "Var: \"NULL\"\n");
        return;
    }
    if (var->type == NULL)
        indention_tac(outfile, indent), fprintf(outfile, "NULL\t%s\n", var->name);
    else
        indention_tac(outfile, indent), fprintf(outfile, "%s\t%s\n", var->type->name, var->name);
}
void output_block(Block* block, FILE* outfile, size_t indent) {
    if (block == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "Block: \"NULL\"\n");
        return;
    }
    if (block->label == NULL)
        indention_tac(outfile, indent), fprintf(outfile, "NULL ");
    else
        indention_tac(outfile, indent), fprintf(outfile, "%s ", block->label->name);
    if (list_is_empty(block->instructions))
        indention_tac(outfile, 0), fprintf(outfile, "{}\n");
    else {
        indention_tac(outfile, 0), fprintf(outfile, "{\n");
        Instruction* instruction;
        while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
            output_instruction(instruction, outfile, indent + 1);
        indention_tac(outfile, indent), fprintf(outfile, "}\n");
    }
}
void output_arg(Arg* arg, FILE* outfile) {
    if (arg == NULL) {
        indention_tac(outfile, 0), fprintf(outfile, "\"NULL\"");
        return;
    }
    switch (arg->kind) {
        case ARG_VARIABLE: indention_tac(outfile, 0), fprintf(outfile, "%s", arg->value.variable->name); break;
        case ARG_INT: indention_tac(outfile, 0), fprintf(outfile, "%lld", arg->value.int_value); break;
        case ARG_FLOAT: indention_tac(outfile, 0), fprintf(outfile, "%f", arg->value.float_value); break;
        case ARG_STRING: indention_tac(outfile, 0), fprintf(outfile, "%s", arg->value.string_value); break;
        case ARG_BOOL: indention_tac(outfile, 0), fprintf(outfile, "%s", arg->value.bool_value ? "true" : "false"); break;
        case ARG_VOID: indention_tac(outfile, 0), fprintf(outfile, "void"); break;
        case ARG_LABEL: indention_tac(outfile, 0), fprintf(outfile, "%s", arg->value.label->name); break;
        case ARG_SUBROUTINE: indention_tac(outfile, 0), fprintf(outfile, "%s", arg->value.subroutine->name); break;
        case ARG_NONE: indention_tac(outfile, 0), fprintf(outfile, "NONE"); break;
        default: indention_tac(outfile, 0), fprintf(outfile, "unknown_ArgType: %u", arg->kind); break;
    }
}
void output_instruction(Instruction* instruction, FILE* outfile, size_t indent) {
    if (instruction == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "Instruction: \"NULL\"\n");
        return;
    }
    switch (instruction->type) {
        case INST_ADD: indention_tac(outfile, indent), fprintf(outfile, "add\t"); break;
        case INST_SUB: indention_tac(outfile, indent), fprintf(outfile, "sub\t"); break;
        case INST_MUL: indention_tac(outfile, indent), fprintf(outfile, "mul\t"); break;
        case INST_DIV: indention_tac(outfile, indent), fprintf(outfile, "div\t"); break;
        case INST_MOD: indention_tac(outfile, indent), fprintf(outfile, "mod\t"); break;
        case INST_EQ: indention_tac(outfile, indent), fprintf(outfile, "eq \t"); break;
        case INST_NE: indention_tac(outfile, indent), fprintf(outfile, "ne \t"); break;
        case INST_LT: indention_tac(outfile, indent), fprintf(outfile, "lt \t"); break;
        case INST_GT: indention_tac(outfile, indent), fprintf(outfile, "gt \t"); break;
        case INST_LE: indention_tac(outfile, indent), fprintf(outfile, "le \t"); break;
        case INST_GE: indention_tac(outfile, indent), fprintf(outfile, "ge \t"); break;
        case INST_AND: indention_tac(outfile, indent), fprintf(outfile, "and\t"); break;
        case INST_OR: indention_tac(outfile, indent), fprintf(outfile, "or \t"); break;
        case INST_NOT: indention_tac(outfile, indent), fprintf(outfile, "not\t"); break;
        case INST_ASSIGN: indention_tac(outfile, indent), fprintf(outfile, "assign\t"); break;
        case INST_GET_ATTR: indention_tac(outfile, indent), fprintf(outfile, "get_attr\t"); break;
        case INST_GET_ELEM: indention_tac(outfile, indent), fprintf(outfile, "get_elem\t"); break;
        case INST_PARAM: indention_tac(outfile, indent), fprintf(outfile, "param\t"); break;
        case INST_ALLOC: indention_tac(outfile, indent), fprintf(outfile, "alloc\t"); break;
        case INST_JMP_C: indention_tac(outfile, indent), fprintf(outfile, "jmp_c\t"); break;
        case INST_JMP: indention_tac(outfile, indent), fprintf(outfile, "jmp\t"); break;
        case INST_RET: indention_tac(outfile, indent), fprintf(outfile, "ret\t"); break;
        case INST_CALL: indention_tac(outfile, indent), fprintf(outfile, "call\t"); break;
        case INST_LOAD: indention_tac(outfile, indent), fprintf(outfile, "load\t"); break;
        case INST_STORE: indention_tac(outfile, indent), fprintf(outfile, "store\t"); break;
        case INST_NONE: indention_tac(outfile, indent), fprintf(outfile, "INST_NONE\n"); return;
        default:
            indention_tac(outfile, indent), fprintf(outfile, "unknown_InstructionType: %u\n", instruction->type);
            return;
    }
    output_arg(instruction->arg1, outfile);
    switch (instruction->type) {
        case INST_ADD:
        case INST_SUB:
        case INST_MUL:
        case INST_DIV:
        case INST_MOD:
        case INST_EQ:
        case INST_NE:
        case INST_LT:
        case INST_GT:
        case INST_LE:
        case INST_GE:
        case INST_AND:
        case INST_OR:
        case INST_GET_ATTR:
        case INST_GET_ELEM:
        case INST_JMP_C:
        case INST_CALL:
            indention_tac(outfile, 0), fprintf(outfile, " ");
            output_arg(instruction->arg2, outfile);
            indention_tac(outfile, 0), fprintf(outfile, " ");
            output_arg(instruction->arg3, outfile);
            break;
        case INST_NOT:
        case INST_ASSIGN:
        case INST_PARAM:
        case INST_ALLOC:
        case INST_LOAD:
        case INST_STORE:
            indention_tac(outfile, 0), fprintf(outfile, " ");
            output_arg(instruction->arg2, outfile);
            break;
        case INST_JMP:
        case INST_RET:
            break;
        case INST_NONE:
        default:
            return;
    }
    indention_tac(outfile, 0), fprintf(outfile, "\n");
}
void output_attribute_table(AttributeTable* attribute_table, FILE* outfile, size_t indent) {
    if (attribute_table == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "AttributeTable: \"NULL\"\n");
        return;
    }
    if (attribute_table->name == NULL)
        indention_tac(outfile, indent), fprintf(outfile, "NULL ");
    else
        indention_tac(outfile, indent), fprintf(outfile, "%s ", attribute_table->name->name);
    indention_tac(outfile, 0), fprintf(outfile, "%zu ", attribute_table->size);
    if (list_is_empty(attribute_table->attributes))
        indention_tac(outfile, 0), fprintf(outfile, "{}\n");
    else {
        indention_tac(outfile, 0), fprintf(outfile, "{\n");
        Attribute* attribute;
        while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
            output_attribute(attribute, outfile, indent + 1);
        indention_tac(outfile, indent), fprintf(outfile, "}\n");
    }
}
void output_attribute(Attribute* attribute, FILE* outfile, size_t indent) {
    if (attribute == NULL) {
        indention_tac(outfile, indent), fprintf(outfile, "Attribute: \"NULL\"\n");
        return;
    }
    if (attribute->type == NULL)
        indention_tac(outfile, indent), fprintf(outfile, "NULL\t");
    else
        indention_tac(outfile, indent), fprintf(outfile, "%s\t", attribute->type->name);
    if (attribute->var == NULL)
        indention_tac(outfile, 0), fprintf(outfile, "NULL ");
    else
        indention_tac(outfile, 0), fprintf(outfile, "%s ", attribute->var->name);
    indention_tac(outfile, 0), fprintf(outfile, "%zu\n", attribute->offset);
}
