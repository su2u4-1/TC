#include <assert.h>
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
void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser);
typedef struct Parser {
    File* source_file;
    char in_function;
    char in_method;
    char in_loop;
    char indent_has_next[32];
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
void indention(FILE* out, size_t indent, char is_last, Parser* parser);
Parser* create_parser(File* file);
Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file);
string make_method_name(string class_name, string method_name);
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);
static void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, Parser* parser);
static void output_import(Import* import, FILE* outfile, size_t indent, Parser* parser);
static void output_function(Function* function, FILE* outfile, size_t indent, Parser* parser);
static void output_method(Method* method, FILE* outfile, size_t indent, Parser* parser);
static void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, Parser* parser);
static void output_class(Class* class, FILE* outfile, size_t indent, Parser* parser);
static void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser);
static void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser);
static void output_if(If* if_, FILE* outfile, size_t indent, Parser* parser);
static void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, Parser* parser);
static void output_for(For* for_, FILE* outfile, size_t indent, Parser* parser);
static void output_while(While* while_, FILE* outfile, size_t indent, Parser* parser);
static void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser);
static void output_primary(Primary* primary, FILE* outfile, size_t indent, Parser* parser);
static void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser);
static void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser);
void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, Parser* parser) {
    switch (code_member->type) {
        case CODE_IMPORT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "import\n");
            output_import(code_member->content.import, outfile, indent + 1, parser);
            break;
        case CODE_FUNCTION:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "function\n");
            output_function(code_member->content.function, outfile, indent + 1, parser);
            break;
        case CODE_CLASS:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "class\n");
            output_class(code_member->content.class, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "unknown_CodeMemberType: %u\n", code_member->type);
            break;
    }
}
void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
    List* members = list_copy(code->members);
    CodeMember* member;
    while ((member = (CodeMember*)list_pop(members)) != NULL)
        output_code_member(member, outfile, indent + 1, parser);
}
void output_import(Import* import, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "name\n");
    output_name(import->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
}
void output_function(Function* function, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "name\n");
    output_name(function->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "return_type\n");
    output_name(function->return_type, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "parameters\n");
    List* parameters = list_copy(function->parameters);
    List* body = list_copy(function->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        indention(outfile, indent + 1, 0, parser), fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, parser);
    }
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_method(Method* method, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "name\n");
    output_name(method->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "return_type\n");
    output_name(method->return_type, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "parameters\n");
    List* parameters = list_copy(method->parameters);
    List* body = list_copy(method->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        indention(outfile, indent + 1, 0, parser), fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, parser);
    }
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, Parser* parser) {
    switch (class_member->type) {
        case CLASS_METHOD:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "method\n");
            output_method(class_member->content.method, outfile, indent + 1, parser);
            break;
        case CLASS_VARIABLE:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "variable\n");
            output_variable(class_member->content.variable, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "unknown_ClassMemberType: %u\n", class_member->type);
            break;
    }
}
void output_class(Class* class, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "name\n");
    output_name(class->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "members\n");
    List* members = list_copy(class->members);
    ClassMember* member;
    while ((member = (ClassMember*)list_pop(members)) != NULL)
        output_class_member(member, outfile, indent + 1, parser);
}
void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type\n");
    output_name(variable->type, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "name\n");
    output_name(variable->name, outfile, indent + 1, parser);
    if (variable->value != NULL) {
        indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value\n");
        output_expression(variable->value, outfile, indent + 1, parser);
    } else
        indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value: \"NULL\"\n");
}
void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
    switch (statement->type) {
        case IF_STATEMENT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "if_statement\n");
            output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
            break;
        case FOR_STATEMENT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "for_statement\n");
            output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
            break;
        case WHILE_STATEMENT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "while_statement\n");
            output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
            break;
        case VARIABLE_STATEMENT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "variable_declaration_statement\n");
            output_variable(statement->stmt.var, outfile, indent + 1, parser);
            break;
        case RETURN_STATEMENT:
            if (statement->stmt.expr == NULL) {
                indention(outfile, indent + 0, 0, parser), fprintf(outfile, "return_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "return_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, parser);
            break;
        case BREAK_STATEMENT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "break_statement: \"NULL\"\n");
            break;
        case CONTINUE_STATEMENT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "continue_statement: \"NULL\"\n");
            break;
        case EXPRESSION_STATEMENT:
            if (statement->stmt.expr == NULL) {
                indention(outfile, indent + 0, 0, parser), fprintf(outfile, "expression_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "expression_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
            break;
    }
}
void output_if(If* if_, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(if_->body);
    List* else_if_list = list_copy(if_->else_if);
    List* else_body = list_copy(if_->else_body);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "condition\n");
    output_expression(if_->condition, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "else_if\n");
    ElseIf* else_if;
    while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
        output_else_if(else_if, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "else_body\n");
    while ((statement = (Statement*)list_pop(else_body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(else_if->body);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "condition\n");
    output_expression(else_if->condition, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_for(For* for_, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(for_->body);
    if (for_->initializer != NULL) {
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "initializer\n");
        output_variable(for_->initializer, outfile, indent + 1, parser);
    } else
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "initializer: \"NULL\"\n");
    if (for_->condition != NULL) {
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "condition\n");
        output_expression(for_->condition, outfile, indent + 1, parser);
    } else
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "condition: \"NULL\"\n");
    if (for_->increment != NULL) {
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "increment\n");
        output_expression(for_->increment, outfile, indent + 1, parser);
    } else
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "increment: \"NULL\"\n");
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_while(While* while_, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(while_->body);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "condition\n");
    output_expression(while_->condition, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser), fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
    if (expression->operator == OP_NONE) {
        indention(outfile, indent + 0, 1, parser), fprintf(outfile, "primary\n");
        output_primary(expression->prim_left, outfile, indent + 1, parser);
    } else {
        string op_str = operator_to_string(expression->operator);
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
        indention(outfile, indent + 0, 0, parser), fprintf(outfile, "left\n");
        output_expression(expression->expr_left, outfile, indent + 1, parser);
        indention(outfile, indent + 0, 1, parser), fprintf(outfile, "right\n");
        output_expression(expression->right, outfile, indent + 1, parser);
    }
}
void output_primary(Primary* primary, FILE* outfile, size_t indent, Parser* parser) {
    switch (primary->type) {
        case PRIM_INTEGER:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"integer\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_FLOAT:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"float\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_STRING:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"string\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value: \"%s\"\n", primary->value.literal_value);
            break;
        case PRIM_TRUE:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value: \"true\"\n");
            break;
        case PRIM_FALSE:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value: \"false\"\n");
            break;
        case PRIM_EXPRESSION:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"expression\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value\n");
            output_expression(primary->value.expr, outfile, indent + 1, parser);
            break;
        case PRIM_NOT_OPERAND:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"!\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, parser);
            break;
        case PRIM_NEG_OPERAND:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"-\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, parser);
            break;
        case PRIM_VARIABLE_ACCESS:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"variable\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "value\n");
            output_variable_access(primary->value.var, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
            break;
    }
}
void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser) {
    List* args;
    int index;
    switch (variable_access->type) {
        case VAR_NAME:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"name\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "name\n");
            output_name(variable_access->content.name, outfile, indent + 1, parser);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(variable_access->content.args);
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"function_call\"\n");
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "function\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "arguments\n");
            Expression* arg;
            index = -1;
            while ((arg = (Expression*)list_pop(args)) != NULL) {
                indention(outfile, indent + 1, 0, parser), fprintf(outfile, "arguments[%d]\n", ++index);
                output_expression(arg, outfile, indent + 2, parser);
            }
            break;
        case VAR_GET_SEQ:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"get sequence_element\"\n");
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "sequence\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "index\n");
            output_expression(variable_access->content.index, outfile, indent + 1, parser);
            break;
        case VAR_GET_ATTR:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "type: \"get_attribute\"\n");
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "object\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "attribute_name\n");
            output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
            break;
    }
}
void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
    if (name == NULL) {
        indention(outfile, indent + 0, 1, parser), fprintf(outfile, "Name pointer: \"NULL\"\n");
        return;
    }
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "name: \"%s\"\n", name->name);
    indention(outfile, indent + 0, 0, parser), fprintf(outfile, "id: %zu\n", name->id);
    switch (name->kind) {
        case SYMBOL_TYPE:
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "kind: \"variable\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_FUNCTION:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "kind: \"function\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_METHOD:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "kind: \"method\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_CLASS:
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "kind: \"class\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "kind: \"attribute\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_PARAM:
            indention(outfile, indent + 0, 0, parser), fprintf(outfile, "kind: \"parameter\"\n");
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 1, parser), fprintf(outfile, "kind: \"unknown_NameType\"\n");
            break;
    }
}
