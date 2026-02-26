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
typedef struct Lexer Lexer;
typedef struct Parser Parser;
void string_append(string dest, const size_t dest_length, const string src, const string new);
string read_source(FILE* file, size_t* length);
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
string absolute_path(string path);
string get_file_name(File* path);
string get_file_extension(File* path);
string get_file_dir(File* path);
string get_full_path(File* path);
void change_file_extension(File* file, const string new_extension);
void change_file_name(File* file, const string new_name);
void normalize_path(File* file);
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
void string_append(string dest, const size_t dest_length, const string src, const string new) {
    size_t src_length = strlen(src), new_length = strlen(new);
    if (dest_length <= src_length + new_length) {
        size_t max_src_length = dest_length - new_length - 1;
        snprintf(dest, dest_length, "%.*s%s", (int)max_src_length, src, new);
    } else
        sprintf(dest, "%s%s", src, new);
}
string read_source(FILE* file, size_t* length) {
    fseek(file, 0, SEEK_END);
    *length = (size_t)ftell(file);
    fseek(file, 0, SEEK_SET);
    string source = create_string("", *length + 1);
    fread(source, 1, *length, file);
    source[*length] = '\0';
    for (size_t i = 0; i < *length; ++i) {
        if (source[i] == '\r' || source[i] == '\t')
            source[i] = ' ';
    }
    return source;
}
void output_token(FILE* file, Lexer* lexer) {
    for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
        Token* token = current;
        if (token->type == EOF_TOKEN) {
            fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
            break;
        } else if (token->type == IDENTIFIER)
            fprintf(file, "Token(Type: identifier,  Line: ");
        else if (token->type == INTEGER)
            fprintf(file, "Token(Type: integer,     Line: ");
        else if (token->type == FLOAT)
            fprintf(file, "Token(Type: float,       Line: ");
        else if (token->type == STRING)
            fprintf(file, "Token(Type: string,      Line: ");
        else if (token->type == SYMBOL)
            fprintf(file, "Token(Type: symbol,      Line: ");
        else if (token->type == KEYWORD)
            fprintf(file, "Token(Type: keyword,     Line: ");
        else if (token->type == COMMENT)
            fprintf(file, "Token(Type: comment,     Line: ");
        fprintf(file, "%zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
        string lexeme_ptr = token->lexeme;
        for (size_t i = 0; i < strlen(lexeme_ptr); ++i) {
            char c = lexeme_ptr[i];
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
        else
            output_token(out_token_file, lexer);
        fclose(out_token_file);
    }
    reset_lexer(lexer);
    Parser* parser = create_parser();
    if (o_ast) {
        change_file_extension(file, create_string(".ast", 4));
        string out_ast_name = get_full_path(file);
        FILE* out_ast_file = fopen(out_ast_name, "w");
        if (out_ast_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_ast_name);
        else
            output_ast(out_ast_file, lexer, parser);
        fclose(out_ast_file);
    }
}
