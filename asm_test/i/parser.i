#include <assert.h>
#include <stddef.h>
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
extern string CONSTRUCTOR_NAME;
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
    SYMBOL_SUBROUTINE,
    SYMBOL_VARIABLE,
    SYMBOL_PARAM,
    SYMBOL_ATTRIBUTE,
    SYMBOL_TYPE
} SymbolType;
struct CodeMember {
    union {
        Import* import;
        Function* function;
        Class* class_;
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
    SymbolTable* scope;
    string original_name;
    size_t id;
    SymbolType kind;
};
typedef struct Lexer Lexer;
typedef struct Parser Parser;
Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser);
CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content);
Code* create_code(List* members, SymbolTable* global_scope);
Import* create_import(Symbol* name, string source);
Function* create_function(Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* function_scope);
Method* create_method(Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* method_scope);
ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content);
Class* create_class(Symbol* name, List* members, SymbolTable* class_scope);
Variable* create_variable(Symbol* type, Symbol* name, Expression* value);
Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt);
If* create_if(Expression* condition, List* body, List* else_if, List* else_body);
ElseIf* create_else_if(Expression* condition, List* body);
For* create_for(Variable* initializer, Expression* condition, Expression* increment, List* body);
While* create_while(Expression* condition, List* body);
Expression* create_expression(OperatorType operator, Expression * expr_left, Primary* prim_left, Expression* right);
Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value);
VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, List* args_content);
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
    char in_loop;
    char indent_has_next[32];
} Parser;
typedef struct Token Token;
List* create_list(void);
void list_append(List* list, pointer item);
List* list_copy(List* original);
pointer list_pop(List* list);
pointer list_pop_back(List* list);
Symbol* create_symbol(string original_name, SymbolType kind, Symbol* type, SymbolTable* scope);
SymbolTable* create_symbol_table(SymbolTable* parent);
Symbol* search_name(SymbolTable* scope, string name);
char is_builtin_type(string type);
void parser_error(const string message, Token* token, string file_name);
void indention(FILE* out, size_t indent, char is_last, Parser* parser);
Parser* create_parser(File* file);
Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file);
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);
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
typedef struct Token {
    string lexeme;
    size_t line, column;
    TokenType type;
} Token;
typedef struct Lexer {
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
} Lexer;
Lexer* create_lexer(string source, size_t length);
Token* get_next_token(Lexer* lexer, char skip_comment);
Token* peek_next_token(Lexer* lexer, char skip_comment);
void reset_lexer(Lexer* lexer);
Token* peek_current_token(Lexer* lexer);
static Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser);
static Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    if (builtin_scope == NULL) {
        builtin_scope = create_symbol_table(NULL);
        name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
        name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
    }
    if (now_scope == NULL)
        now_scope = builtin_scope;
    Token* token = NULL;
    List* members = create_list();
    SymbolTable* global_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    while (token != NULL && token->type != EOF_TOKEN) {
        if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
            Import* import = parse_import(lexer, global_scope, parser);
            if (import == NULL)
                parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
        } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
            Function* function = parse_function(lexer, global_scope, parser);
            if (function == NULL)
                parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
        } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
            Class* class_ = parse_class(lexer, global_scope, parser);
            if (class_ == NULL)
                parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
        } else
            parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, 1);
    }
    return create_code(members, global_scope);
}
Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
        return NULL;
    }
    string import_name = token->lexeme;
    string source = NULL;
    token = get_next_token(lexer, 1);
    if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
        token = get_next_token(lexer, 1);
        if (token->type != STRING) {
            parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
            return NULL;
        }
        source = token->lexeme;
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* name;
    name = parse_import_file(import_name, source, now_scope, parser->source_file);
    if (name == NULL) {
        fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
        name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
    }
    return create_import(name, source);
}
Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    SymbolTable* function_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
        parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == NULL) {
        parser_error("Unknown function return type", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    List* parameters = create_list();
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        Variable* parameter = parse_variable(lexer, function_scope, parser);
        if (parameter == NULL)
            parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
        else if (parameter->value != NULL)
            parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, 1);
        if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, 1);
        } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
            return NULL;
        }
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
        return NULL;
    }
    List* body = create_list();
    parser->in_function = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, function_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
        else if (have_return)
            parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
        if (statement != NULL && statement->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_function = 0;
    if (!have_return && return_type != name_void)
        parser_error("Function missing return statement", token, get_full_path(parser->source_file));
    return create_function(name, return_type, parameters, body, function_scope);
}
Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser) {
    Token* token = NULL;
    SymbolTable* method_scope = create_symbol_table(now_scope);
    Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
        parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == NULL) {
        parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
        parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, 1);
    List* parameters = create_list();
    list_append(parameters, (pointer)create_variable(class_name, self, NULL));
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, 1);
        } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
        else {
            parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
            return NULL;
        }
        Variable* parameter = parse_variable(lexer, method_scope, parser);
        if (parameter == NULL)
            parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
        else if (parameter->value != NULL)
            parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, 1);
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
        return NULL;
    }
    List* body = create_list();
    parser->in_function = 1;
    parser->in_method = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, method_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
        else if (have_return)
            parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
        if (statement != NULL && statement->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_function = 0;
    parser->in_method = 0;
    if (!have_return && return_type != name_void)
        parser_error("Method missing return statement", token, get_full_path(parser->source_file));
    return create_method(name, return_type, parameters, body, method_scope);
}
Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    SymbolTable* class_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
        return NULL;
    }
    List* members = create_list();
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
            Method* method = parse_method(lexer, class_scope, name, parser);
            if (method == NULL)
                parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
        } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
            token = get_next_token(lexer, 1);
            Variable* variable = parse_variable(lexer, class_scope, parser);
            if (variable == NULL)
                parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
            list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
            token = get_next_token(lexer, 1);
            if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
                parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
        } else
            parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, 1);
    }
    Symbol* constructor = search_name(class_scope, CONSTRUCTOR_NAME);
    if (constructor == NULL) {
        SymbolTable* constructor_scope = create_symbol_table(class_scope);
        constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
    }
    if (constructor->kind != SYMBOL_SUBROUTINE)
        parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
    return create_class(name, members, class_scope);
}
Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = peek_current_token(lexer);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
        parser_error("Expected variable type", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* type = search_name(now_scope, token->lexeme);
    if (type != NULL) {
        Symbol* type_ptr = type;
        if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
            parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
    } else
        parser_error("Unknown variable type", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER)
        parser_error("Expected variable name", token, get_full_path(parser->source_file));
    Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
    Expression* value = NULL;
    token = peek_next_token(lexer, 1);
    if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        value = parse_expression(lexer, now_scope, parser);
        if (value == NULL)
            parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
    }
    return create_variable(type, name, value);
}
Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = peek_current_token(lexer);
    Statement* statement = NULL;
    if (token->type == KEYWORD) {
        if (string_equal(token->lexeme, IF_KEYWORD))
            return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
        else if (string_equal(token->lexeme, FOR_KEYWORD))
            return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
        else if (string_equal(token->lexeme, WHILE_KEYWORD))
            return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
        else if (string_equal(token->lexeme, VAR_KEYWORD)) {
            get_next_token(lexer, 1);
            statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
        } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
            token = get_next_token(lexer, 1);
            if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
                return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
            statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
        } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
            if (!parser->in_loop) {
                parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
                return NULL;
            }
            statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
            if (!parser->in_loop) {
                parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
                return NULL;
            }
            statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else
            statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    } else
        statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    token = peek_current_token(lexer);
    if (statement == NULL)
        parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
    return statement;
}
If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == NULL)
        parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
        return NULL;
    }
    List* body = create_list();
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    List* else_if = create_list();
    List* else_body = create_list();
    token = peek_next_token(lexer, 1);
    while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
            parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
            return NULL;
        }
        token = get_next_token(lexer, 1);
        Expression* elif_condition = parse_expression(lexer, now_scope, parser);
        if (elif_condition == NULL)
            parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
            return NULL;
        }
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
            parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
            return NULL;
        }
        List* elif_body = create_list();
        token = get_next_token(lexer, 1);
        while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == NULL)
                parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
            list_append(elif_body, (pointer)statement);
            token = get_next_token(lexer, 1);
        }
        list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
        token = peek_next_token(lexer, 1);
    }
    if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
            parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
            return NULL;
        }
        token = get_next_token(lexer, 1);
        while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == NULL)
                parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
            list_append(else_body, (pointer)statement);
            token = get_next_token(lexer, 1);
        }
    }
    token = peek_current_token(lexer);
    return create_if(condition, body, else_if, else_body);
}
For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Variable* initializer = NULL;
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        initializer = parse_variable(lexer, now_scope, parser);
        if (initializer == NULL)
            parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* condition = NULL;
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        condition = parse_expression(lexer, now_scope, parser);
        if (condition == NULL)
            parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* increment = NULL;
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        increment = parse_expression(lexer, now_scope, parser);
        if (increment == NULL)
            parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
        return NULL;
    }
    List* body = create_list();
    parser->in_loop = 1;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_loop = 0;
    return create_for(initializer, condition, increment, body);
}
While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == NULL)
        parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
        return NULL;
    }
    List* body = create_list();
    parser->in_loop = 1;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_loop = 0;
    return create_while(condition, body);
}
static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = peek_next_token(lexer, 1);
    while (token->type == SYMBOL) {
        OperatorType op = string_to_operator(token->lexeme);
        int op_prec = operator_precedence(op);
        if (op == OP_NONE || op_prec < min_prec)
            break;
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        Primary* right_primary = parse_primary(lexer, now_scope, parser);
        if (right_primary == NULL) {
            parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
            return NULL;
        }
        Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
        token = peek_next_token(lexer, 1);
        while (token->type == SYMBOL) {
            OperatorType next_op = string_to_operator(token->lexeme);
            int next_prec = operator_precedence(next_op);
            if (next_op == OP_NONE || next_prec <= op_prec)
                break;
            right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
            if (right == NULL)
                return NULL;
            token = peek_next_token(lexer, 1);
        }
        expr_left = create_expression(op, expr_left, NULL, right);
        token = peek_next_token(lexer, 1);
    }
    token = peek_current_token(lexer);
    return expr_left;
}
Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Primary* left_primary = parse_primary(lexer, now_scope, parser);
    if (left_primary == NULL) {
        parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
        return NULL;
    }
    return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
}
Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = peek_current_token(lexer);
    PrimaryType type;
    string str_value = NULL;
    Expression* expr_value = NULL;
    Primary* prim_value = NULL;
    VariableAccess* variable_value = NULL;
    if (token->type == INTEGER) {
        type = PRIM_INTEGER;
        str_value = token->lexeme;
    } else if (token->type == FLOAT) {
        type = PRIM_FLOAT;
        str_value = token->lexeme;
    } else if (token->type == STRING) {
        type = PRIM_STRING;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
        type = PRIM_TRUE;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
        type = PRIM_FALSE;
        str_value = token->lexeme;
    } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
        type = PRIM_EXPRESSION;
        token = get_next_token(lexer, 1);
        expr_value = parse_expression(lexer, now_scope, parser);
        if (expr_value == NULL) {
            parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
            return NULL;
        }
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
            return NULL;
        }
    } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
        type = PRIM_NOT_OPERAND;
        token = get_next_token(lexer, 1);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == NULL) {
            parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
            return NULL;
        }
    } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
        type = PRIM_NEG_OPERAND;
        token = get_next_token(lexer, 1);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == NULL) {
            parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
            return NULL;
        }
    } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
        type = PRIM_VARIABLE_ACCESS;
        variable_value = parse_variable_access(lexer, now_scope, parser);
        if (variable_value == NULL) {
            parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
            return NULL;
        }
    } else {
        parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
        return NULL;
    }
    return create_primary(type, str_value, expr_value, prim_value, variable_value);
}
VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = peek_current_token(lexer);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
        parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
        return NULL;
    }
    Symbol* current_type = NULL;
    Symbol* base_name = NULL;
    SymbolTable* var_scope = NULL;
    base_name = search_name(now_scope, token->lexeme);
    VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
    token = peek_next_token(lexer, 1);
    while (token->type == SYMBOL) {
        if (base_name != NULL) {
            current_type = base_name;
            if (base_name->type != NULL)
                current_type = base_name->type;
        }
        if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
            var_scope = current_type->scope;
        if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
            token = get_next_token(lexer, 1);
            if (base_name == NULL)
                parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
            else if (base_name->kind == SYMBOL_CLASS) {
                base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
                base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
            }
            if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
                parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
            token = get_next_token(lexer, 1);
            List* args = create_list();
            while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
                Expression* arg = parse_expression(lexer, now_scope, parser);
                if (arg == NULL)
                    parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
                list_append(args, (pointer)arg);
                token = get_next_token(lexer, 1);
                if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
                    token = get_next_token(lexer, 1);
                else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
                    parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
                    return NULL;
                }
            }
            base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
            base_name = base_name->type;
            current_type = NULL;
            var_scope = NULL;
            if (base_name->kind == SYMBOL_CLASS)
                var_scope = base_name->scope;
        } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token = get_next_token(lexer, 1);
            Expression* index = parse_expression(lexer, now_scope, parser);
            if (index == NULL)
                parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
            token = get_next_token(lexer, 1);
            if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
                parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
                return NULL;
            }
            base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
        } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token = get_next_token(lexer, 1);
            if (var_scope == NULL) {
                parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
                return NULL;
            }
            if (token->type != IDENTIFIER) {
                parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
                return NULL;
            }
            base_name = search_name(var_scope, token->lexeme);
            if (base_name == NULL) {
                parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
                return NULL;
            }
            base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
            current_type = NULL;
            var_scope = NULL;
        } else
            break;
        token = peek_next_token(lexer, 1);
    }
    return base;
}
