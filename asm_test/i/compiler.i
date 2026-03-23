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
typedef struct Token Token;
typedef struct Lexer Lexer;
typedef struct Parser Parser;
string read_source(FILE* file, size_t* length);
void output_one_token(FILE* file, Token* token);
void output_token(FILE* file, Lexer* lexer);
void output_ast(FILE* file, Lexer* lexer, Parser* parser);
void parse_file(const string name, char o_token, char o_ast);
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
string read_source(FILE* file, size_t* length) {
    fseek(file, 0, SEEK_END);
    *length = (size_t)ftell(file);
    fseek(file, 0, SEEK_SET);
    string source = create_string_not_check("", *length + 1);
    size_t bytes_read = fread(source, 1, *length, file);
    source[bytes_read] = '\0';
    *length = bytes_read;
    for (size_t i = 0; i < *length; ++i) {
        if (source[i] == '\r' || source[i] == '\t')
            source[i] = ' ';
    }
    return source;
}
void output_one_token(FILE* file, Token* token) {
    if (token->type == EOF_TOKEN) {
        fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
        return;
    } else if (token->type == IDENTIFIER)
        fprintf(file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == INTEGER)
        fprintf(file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == FLOAT)
        fprintf(file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == STRING)
        fprintf(file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == SYMBOL)
        fprintf(file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == KEYWORD)
        fprintf(file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    else if (token->type == COMMENT)
        fprintf(file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    for (size_t i = 0; i < strlen(token->lexeme); ++i) {
        char c = token->lexeme[i];
        if (c == '\0')
            fputs("\\0", file);
        else if (c == '\n')
            fputs("\\n", file);
        else if (c == '\t')
            fputs("\\t", file);
        else if (c == '\r')
            fputs("\\r", file);
        else
            fputc(c, file);
    }
    fprintf(file, "'\n");
}
void output_token(FILE* file, Lexer* lexer) {
    for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
        output_one_token(file, current);
        if (current->type == EOF_TOKEN)
            break;
    }
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
    Code* ast_root = parse_code(lexer, builtin_scope, parser);
    output_code(ast_root, file, 0, parser);
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
void parse_file(const string name, char o_token, char o_ast) {
    File* file = create_file(name);
    string filename = get_full_path(file);
    size_t length = 0;
    FILE* source_file = fopen(filename, "r");
    if (source_file == NULL) {
        fprintf(stderr, "Error opening file: %s", filename);
        return;
    }
    string source = read_source(source_file, &length);
    fclose(source_file);
    Lexer* lexer = create_lexer(source, length);
    if (o_token) {
        change_file_extension(file, create_string(".token", 6));
        string out_token_name = get_full_path(file);
        FILE* out_token_file = fopen(out_token_name, "w");
        if (out_token_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_token_name);
        else {
            output_token(out_token_file, lexer);
            fclose(out_token_file);
        }
    }
    reset_lexer(lexer);
    Parser* parser = create_parser(file);
    if (o_ast) {
        change_file_extension(file, create_string(".ast", 4));
        string out_ast_name = get_full_path(file);
        change_file_extension(file, create_string(".tc", 3));
        FILE* out_ast_file = fopen(out_ast_name, "w");
        if (out_ast_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_ast_name);
        else {
            output_ast(out_ast_file, lexer, parser);
            fclose(out_ast_file);
        }
    }
}
