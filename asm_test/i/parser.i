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
typedef struct Name Name;
typedef struct Scope Scope;
extern Name* name_void;
extern Name* name_int;
extern Name* name_float;
extern Name* name_string;
extern Name* name_bool;
extern Scope* builtin_scope;
void init(void);
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
    List* members;
    Scope* global_scope;
};
struct Import {
    Name* name;
    string source;
};
struct Function {
    Name* name;
    Name* return_type;
    List* parameters;
    List* body;
    Scope* function_scope;
};
struct Method {
    Name* name;
    Name* return_type;
    List* parameters;
    List* body;
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
    List* members;
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
        Name* name;
        List* args;
        Name* attr_name;
        Expression* index;
    } content;
    VariableAccessType type;
};
struct Scope {
    Scope* parent;
    List* names;
};
struct Name {
    string name;
    size_t id;
    union {
        Name* type;
        Scope* scope;
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
Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser);
void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser);
CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content);
Code* create_code(List* members, Scope* global_scope);
Import* create_import(Name* name, string source);
Function* create_function(Name* name, Name* return_type, List* parameters, List* body, Scope* function_scope);
Method* create_method(Name* name, Name* return_type, List* parameters, List* body, Scope* method_scope);
ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content);
Class* create_class(Name* name, List* members, Scope* class_scope);
Variable* create_variable(Name* type, Name* name, Expression* value);
Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt);
If* create_if(Expression* condition, List* body, List* else_if, List* else_body);
ElseIf* create_else_if(Expression* condition, List* body);
For* create_for(Variable* initializer, Expression* condition, Expression* increment, List* body);
While* create_while(Expression* condition, List* body);
Expression* create_expression(OperatorType operator, Expression * expr_left, Primary* prim_left, Expression* right);
Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value);
VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, List* args_content);
typedef struct Parser {
    char in_function;
    char in_method;
    char in_loop;
    char indent_has_next[32];
} Parser;
typedef struct Token Token;
List* create_list(void);
Node* create_node(pointer content);
void list_append(List* list, pointer item);
List* list_copy(List* original);
pointer list_pop(List* list);
Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope);
Scope* create_scope(Scope* parent);
Name* search(Scope* scope, string name);
char is_builtin_type(string type);
char is_type(Name* type);
void parser_error(const string message, Token* token);
void indention(FILE* out, size_t indent, char is_last, Parser* parser);
Parser* create_parser(void);
Name* parse_import_file(string import_name, string score, Scope* scope);
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
static Import* parse_import(Lexer* lexer, Scope* now_scope);
static Function* parse_function(Lexer* lexer, Scope* now_scope, Parser* parser);
static Method* parse_method(Lexer* lexer, Scope* now_scope, Name* class_name, Parser* parser);
static Class* parse_class(Lexer* lexer, Scope* now_scope, Parser* parser);
static Variable* parse_variable(Lexer* lexer, Scope* now_scope, Parser* parser);
static Statement* parse_statement(Lexer* lexer, Scope* now_scope, Parser* parser);
static If* parse_if(Lexer* lexer, Scope* now_scope, Parser* parser);
static For* parse_for(Lexer* lexer, Scope* now_scope, Parser* parser);
static While* parse_while(Lexer* lexer, Scope* now_scope, Parser* parser);
static Expression* parse_expression(Lexer* lexer, Scope* now_scope, Parser* parser);
static Primary* parse_primary(Lexer* lexer, Scope* now_scope, Parser* parser);
static VariableAccess* parse_variable_access(Lexer* lexer, Scope* now_scope, Parser* parser);
Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser) {
    if (builtin_scope == 0) {
        builtin_scope = create_scope(0);
        name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
        name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
        name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
        name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
        name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
    }
    if (now_scope == 0)
        now_scope = builtin_scope;
    Token* token = 0;
    Token* token_ptr = NULL;
    List* members = create_list();
    Scope* global_scope = create_scope(now_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token != 0 && token_ptr->type != EOF_TOKEN) {
        if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
            Import* import = parse_import(lexer, global_scope);
            if (import == 0)
                parser_error("Failed to parse import statement", token);
            list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
            Function* function = parse_function(lexer, global_scope, parser);
            if (function == 0)
                parser_error("Failed to parse function declaration", token);
            list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
            Class* class_ = parse_class(lexer, global_scope, parser);
            if (class_ == 0)
                parser_error("Failed to parse class declaration", token);
            list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
        } else
            parser_error("Unexpected token in code member", token);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    return create_code(members, global_scope);
}
Import* parse_import(Lexer* lexer, Scope* now_scope) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token);
        return NULL;
    }
    string import_name = token_ptr->lexeme;
    string source = 0;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type != STRING) {
            parser_error("Expected string literal after 'from'", token);
            return NULL;
        }
        source = token_ptr->lexeme;
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        parser_error("Expected ';' at end of import statement", token);
        return NULL;
    }
    Name* name;
    name = parse_import_file(import_name, source, now_scope);
    if (name == 0)
        name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
    return create_import(name, source);
}
Function* parse_function(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    Scope* function_scope = create_scope(now_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
        parser_error("Expected function return type after 'func'", token);
        return NULL;
    }
    Name* return_type = search(now_scope, token_ptr->lexeme);
    if (return_type == 0)
    {
        parser_error("Unknown function return type", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER) {
        parser_error("Expected function name after return type", token);
        return NULL;
    }
    Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after function name", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    List* parameters = create_list();
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        Variable* parameter = parse_variable(lexer, function_scope, parser);
        if (parameter == 0)
            parser_error("Failed to parse function parameter", token);
        else if (parameter->value != 0)
            parser_error("Function parameters cannot have default values", token);
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
        } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ',' or ')' after function parameter", token);
            return NULL;
        }
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start function body", token);
        return NULL;
    }
    List* body = create_list();
    parser->in_function = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, function_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse function body statement", token);
        else if (have_return)
            parser_error("Unreachable code after return statement", token);
        if (((statement))->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    ((parser))->in_function = 0;
    if (!have_return && return_type != name_void)
        parser_error("Function missing return statement", token);
    return create_function(name, return_type, parameters, body, function_scope);
}
Method* parse_method(Lexer* lexer, Scope* now_scope, Name* class_name, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    Scope* method_scope = create_scope(now_scope);
    Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
        parser_error("Expected method return type after 'method'", token);
        return NULL;
    }
    Name* return_type = search(now_scope, token_ptr->lexeme);
    if (return_type == 0) {
        parser_error("Unknown return type for method", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER) {
        parser_error("Expected method name after return type", token);
        return NULL;
    }
    Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after method name", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
        parser_error("Expected 'self' as first parameter of method", token);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    List* parameters = create_list();
    list_append(parameters, (pointer)create_variable(class_name, self, 0));
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
        } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
        else {
            parser_error("Expected ',' or ')' after method parameter", token);
            return NULL;
        }
        Variable* parameter = parse_variable(lexer, method_scope, parser);
        if (parameter == 0)
            parser_error("Failed to parse method parameter", token);
        else if (((parameter))->value != 0)
            parser_error("Method parameters cannot have default values", token);
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start method body", token);
        return NULL;
    }
    List* body = create_list();
    ((parser))->in_function = 1;
    ((parser))->in_method = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, method_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse method body statement", token);
        else if (have_return)
            parser_error("Unreachable code after return statement", token);
        if (((statement))->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    ((parser))->in_function = 0;
    ((parser))->in_method = 0;
    if (!have_return && return_type != name_void)
        parser_error("Method missing return statement", token);
    return create_method(name, return_type, parameters, body, method_scope);
}
Class* parse_class(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    Scope* class_scope = create_scope(now_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER) {
        parser_error("Expected class name after 'class'", token);
        return NULL;
    }
    Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start class body", token);
        return NULL;
    }
    List* members = create_list();
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
            Method* method = parse_method(lexer, class_scope, name, parser);
            if (method == 0)
                parser_error("Failed to parse class method", token);
            list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
        } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
            Variable* variable = parse_variable(lexer, class_scope, parser);
            if (variable == 0)
                parser_error("Failed to parse class variable", token);
            list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
            token = get_next_token(lexer, 1);
            token_ptr = token;
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
                parser_error("Expected ';' after class variable declaration", token);
        } else
            parser_error("Unexpected token in class member", token);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    return create_class(name, members, class_scope);
}
Variable* parse_variable(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = peek_current_token(lexer);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
        parser_error("Expected variable type", token);
        return NULL;
    }
    Name* type = search(now_scope, token_ptr->lexeme);
    if (type != 0) {
        Name* type_ptr = (type);
        if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
            parser_error("Expected a type for variable declaration", token);
    } else
        parser_error("Unknown variable type", token);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != IDENTIFIER)
        parser_error("Expected variable name", token);
    Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
    Expression* value = 0;
    token = peek_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
        token = get_next_token(lexer, 1);
        token_ptr = token;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        value = parse_expression(lexer, now_scope, parser);
        if (value == 0)
            parser_error("Failed to parse variable initializer", token);
    }
    return create_variable(type, name, value);
}
Statement* parse_statement(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = peek_current_token(lexer);
    token_ptr = token;
    Statement* statement = 0;
    if (token_ptr->type == KEYWORD) {
        if (string_equal(token_ptr->lexeme, IF_KEYWORD))
            return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
        else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
            return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
        else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
            return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
        else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
            get_next_token(lexer, 1);
            statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
        } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
            statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
        } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
            if (!(((parser))->in_loop))
            {
                parser_error("Cannot use 'break' outside of a loop", token);
                return NULL;
            }
            statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
            if (!(((parser))->in_loop))
            {
                parser_error("Cannot use 'continue' outside of a loop", token);
                return NULL;
            }
            statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else
            statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    } else
        statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    token = peek_current_token(lexer);
    if (statement == 0)
        parser_error("Failed to parse statement", token);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
        parser_error("Expected ';' after statement", token);
    return statement;
}
If* parse_if(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'if'", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == 0)
        parser_error("Failed to parse if condition", token);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after if condition", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start if body", token);
        return NULL;
    }
    List* body = create_list();
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse if body statement", token);
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    List* else_if = create_list();
    List* else_body = create_list();
    token = peek_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
        token = get_next_token(lexer, 1);
        token_ptr = token;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
            parser_error("Expected '(' after 'elif'", token);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        token_ptr = token;
        Expression* elif_condition = parse_expression(lexer, now_scope, parser);
        if (elif_condition == 0)
            parser_error("Failed to parse else-if condition", token);
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ')' after else-if condition", token);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
            parser_error("Expected '{' to start else-if body", token);
            return NULL;
        }
        List* elif_body = create_list();
        token = get_next_token(lexer, 1);
        token_ptr = token;
        while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == 0)
                parser_error("Failed to parse else-if body statement", token);
            list_append(elif_body, (pointer)statement);
            token = get_next_token(lexer, 1);
            token_ptr = token;
        }
        list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
        token = peek_next_token(lexer, 1);
        token_ptr = token;
    }
    if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
        token = get_next_token(lexer, 1);
        token_ptr = token;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
            parser_error("Expected '{' to start else body", token);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        token_ptr = token;
        while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == 0)
                parser_error("Failed to parse else body statement", token);
            list_append(else_body, (pointer)statement);
            token = get_next_token(lexer, 1);
            token_ptr = token;
        }
    }
    token = peek_current_token(lexer);
    token_ptr = token;
    return create_if(condition, body, else_if, else_body);
}
For* parse_for(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'for'", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    Variable* initializer = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        initializer = parse_variable(lexer, now_scope, parser);
        if (initializer == 0)
            parser_error("Failed to parse for loop initializer", token);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
    {
        parser_error("Expected ';' after for loop initializer", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    Expression* condition = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
        condition = parse_expression(lexer, now_scope, parser);
        if (condition == 0)
            parser_error("Failed to parse for loop condition", token);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
    {
        parser_error("Expected ';' after for loop condition", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    Expression* increment = 0;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        increment = parse_expression(lexer, now_scope, parser);
        if (increment == 0)
            parser_error("Failed to parse for loop increment", token);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
    {
        parser_error("Expected ')' after for loop increment", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start for loop body", token);
        return NULL;
    }
    List* body = create_list();
    ((parser))->in_loop = 1;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse for loop body statement", token);
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    ((parser))->in_loop = 0;
    return create_for(initializer, condition, increment, body);
}
While* parse_while(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        parser_error("Expected '(' after 'while'", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == 0)
        parser_error("Failed to parse while condition", token);
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
        parser_error("Expected ')' after while condition", token);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    token_ptr = token;
    if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
        parser_error("Expected '{' to start while body", token);
        return NULL;
    }
    List* body = create_list();
    ((parser))->in_loop = 1;
    token = get_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == 0)
            parser_error("Failed to parse while body statement", token);
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
        token_ptr = token;
    }
    ((parser))->in_loop = 0;
    return create_while(condition, body);
}
static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = peek_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type == SYMBOL) {
        OperatorType op = string_to_operator(token_ptr->lexeme);
        int op_prec = operator_precedence(op);
        if (op == OP_NONE || op_prec < min_prec)
            break;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        Primary* right_primary = parse_primary(lexer, now_scope, parser);
        if (right_primary == 0) {
            parser_error("Failed to parse right operand", token);
            return NULL;
        }
        Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
        token = peek_next_token(lexer, 1);
        token_ptr = token;
        while (token_ptr->type == SYMBOL) {
            OperatorType next_op = string_to_operator(token_ptr->lexeme);
            int next_prec = operator_precedence(next_op);
            if (next_op == OP_NONE || next_prec <= op_prec)
                break;
            right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
            if (right == 0)
                return NULL;
            token = peek_next_token(lexer, 1);
            token_ptr = token;
        }
        expr_left = create_expression(op, expr_left, NULL, right);
        token = peek_next_token(lexer, 1);
        token_ptr = token;
    }
    token = peek_current_token(lexer);
    token_ptr = token;
    return expr_left;
}
Expression* parse_expression(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Primary* left_primary = parse_primary(lexer, now_scope, parser);
    if (left_primary == 0) {
        parser_error("Failed to parse expression primary", peek_current_token(lexer));
        return NULL;
    }
    return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
}
Primary* parse_primary(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = 0;
    Token* token_ptr = NULL;
    token = peek_current_token(lexer);
    token_ptr = token;
    PrimaryType type;
    string str_value = NULL;
    Expression* expr_value = NULL;
    Primary* prim_value = NULL;
    VariableAccess* variable_value = NULL;
    if (token_ptr->type == INTEGER) {
        type = PRIM_INTEGER;
        str_value = token_ptr->lexeme;
    } else if (token_ptr->type == FLOAT) {
        type = PRIM_FLOAT;
        str_value = token_ptr->lexeme;
    } else if (token_ptr->type == STRING) {
        type = PRIM_STRING;
        str_value = token_ptr->lexeme;
    } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
        type = PRIM_TRUE;
        str_value = token_ptr->lexeme;
    } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
        type = PRIM_FALSE;
        str_value = token_ptr->lexeme;
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
        type = PRIM_EXPRESSION;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        expr_value = parse_expression(lexer, now_scope, parser);
        if (expr_value == NULL) {
            parser_error("Failed to parse parenthesized expression", token);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        token_ptr = token;
        if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
            parser_error("Expected ')' after expression", token);
            return NULL;
        }
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
        type = PRIM_NOT_OPERAND;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == 0) {
            parser_error("Failed to parse operand of unary '!'", token);
            return NULL;
        }
    } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
        type = PRIM_NEG_OPERAND;
        token = get_next_token(lexer, 1);
        token_ptr = token;
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == 0) {
            parser_error("Failed to parse operand of unary '-'", token);
            return NULL;
        }
    } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
        type = PRIM_VARIABLE_ACCESS;
        variable_value = parse_variable_access(lexer, now_scope, parser);
        if (variable_value == 0) {
            parser_error("Failed to parse variable access", token);
            return NULL;
        }
    } else {
        parser_error("Unexpected token in primary expression", token);
        return NULL;
    }
    return create_primary(type, str_value, expr_value, prim_value, variable_value);
}
VariableAccess* parse_variable_access(Lexer* lexer, Scope* now_scope, Parser* parser) {
    Token* token = peek_current_token(lexer);
    Token* token_ptr = token;
    if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
        parser_error("Expected variable name in variable access", token);
        return NULL;
    }
    Name* current_type = 0;
    Name* base_name = 0;
    Scope* var_scope = 0;
    Name* base_name_ptr = NULL;
    base_name = search(now_scope, token_ptr->lexeme);
    VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
    token = peek_next_token(lexer, 1);
    token_ptr = token;
    while (token_ptr->type == SYMBOL) {
        if (base_name != 0) {
            base_name_ptr = (base_name);
            if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
                current_type = base_name_ptr->info.type;
            else if (base_name_ptr->kind == NAME_CLASS || base_name_ptr->kind == NAME_TYPE)
                current_type = base_name;
        }
        if (var_scope == 0 && current_type != 0) {
            Name* type_ptr = (current_type);
            if (type_ptr->kind == NAME_CLASS)
                var_scope = type_ptr->info.scope;
        }
        if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
            if (base_name == 0)
                parser_error("Cannot call undefined variable", token);
            base_name_ptr = (base_name);
            if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
                parser_error("Cannot call non-function variable", token);
            token = get_next_token(lexer, 1);
            token_ptr = token;
            List* args = create_list();
            while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
                Expression* arg = parse_expression(lexer, now_scope, parser);
                if (arg == 0)
                    parser_error("Failed to parse function call argument", token);
                list_append(args, (pointer)arg);
                token = get_next_token(lexer, 1);
                token_ptr = token;
                if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
                    token = get_next_token(lexer, 1);
                    token_ptr = token;
                } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
                    parser_error("Expected ',' or ')' after function call argument", token);
                    return NULL;
                }
            }
            base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
            base_name = base_name_ptr->info.type;
            current_type = 0;
            var_scope = 0;
        } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
            token = get_next_token(lexer, 1);
            token_ptr = token;
            Expression* index = parse_expression(lexer, now_scope, parser);
            if (index == 0)
                parser_error("Failed to parse sequence index", token);
            token = get_next_token(lexer, 1);
            token_ptr = token;
            if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
                parser_error("Expected ']' after sequence index", token);
                return NULL;
            }
            base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
        } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
            token = get_next_token(lexer, 1);
            token_ptr = token;
            token = get_next_token(lexer, 1);
            token_ptr = token;
            if (var_scope == 0) {
                parser_error("Cannot access attribute without a valid scope", token);
                return NULL;
            }
            if (token_ptr->type != IDENTIFIER) {
                parser_error("Expected attribute name after '.'", token);
                return NULL;
            }
            base_name = search(var_scope, token_ptr->lexeme);
            if (base_name == 0) {
                parser_error("Unknown attribute name", token);
                return NULL;
            }
            base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
            current_type = 0;
            var_scope = 0;
        } else
            break;
        token = peek_next_token(lexer, 1);
        token_ptr = token;
    }
    return base;
}
