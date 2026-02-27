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
Name* parse_import_file(string import_name, string source, Scope* scope);
OperatorType string_to_operator(string str);
int operator_precedence(OperatorType op);
string operator_to_string(OperatorType op);
typedef struct Lexer Lexer;
typedef struct Parser Parser;
void string_append(string dest, const size_t dest_length, const string src, const string new);
string read_source(FILE* file, size_t* length);
void output_token(FILE* file, Lexer* lexer);
void output_ast(FILE* file, Lexer* lexer, Parser* parser);
void parse_file(const string name, char o_token, char o_ast);
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
List* create_list(void) {
    List* new_list = (List*)alloc_memory(sizeof(List));
    new_list->head = 0;
    new_list->tail = 0;
    return new_list;
}
Node* create_node(pointer content) {
    Node* new_node = (Node*)alloc_memory(sizeof(Node));
    new_node->next = 0;
    new_node->content = content;
    return new_node;
}
void list_append(List* list, pointer item) {
    Node* new_node = create_node(item);
    if (list->head == 0) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
}
List* list_copy(List* original) {
    List* new_list = create_list();
    new_list->head = original->head;
    new_list->tail = original->tail;
    return new_list;
}
pointer list_pop(List* list) {
    if (list->head == 0)
        return 0;
    Node* head_node = list->head;
    list->head = head_node->next;
    if (list->head == 0)
        list->tail = 0;
    return head_node->content;
}
Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
    static size_t id_counter = 0;
    Name* result = search(scope, name);
    if (result != NULL) {
        fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
        switch (result->kind) {
            case NAME_TYPE:
                fprintf(stderr, "type\n");
                break;
            case NAME_VARIABLE:
                fprintf(stderr, "variable\n");
                break;
            case NAME_FUNCTION:
                fprintf(stderr, "function\n");
                break;
            case NAME_METHOD:
                fprintf(stderr, "method\n");
                break;
            case NAME_CLASS:
                fprintf(stderr, "class\n");
                break;
            case NAME_ATTRIBUTE:
                fprintf(stderr, "attribute\n");
                break;
            default:
                fprintf(stderr, "unknown\n");
                break;
        }
    }
    Name* new_name = (Name*)alloc_memory(sizeof(Name));
    new_name->name = name;
    new_name->id = ++id_counter;
    new_name->kind = kind;
    if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
        new_name->info.type = name_info;
    else if (kind == NAME_CLASS && scope_info != NULL)
        new_name->info.scope = scope_info;
    else if (kind == NAME_TYPE)
        new_name->info.type = NULL;
    else {
        if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
            fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
        else
            fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
        return NULL;
    }
    list_append(scope->names, (pointer)new_name);
    return new_name;
}
Scope* create_scope(Scope* parent) {
    Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (new_scope);
    scope_ptr->parent = parent;
    scope_ptr->names = create_list();
    return new_scope;
}
Name* search(Scope* scope, string name) {
    Scope* scope_ptr = (scope);
    while (scope_ptr != NULL) {
        List* names = scope_ptr->names;
        Node* current = ((names))->head;
        while (current != 0) {
            Node* node_ptr = (current);
            Name* current_name = (Name*)node_ptr->content;
            if (string_equal(current_name->name, name))
                return current_name;
            current = node_ptr->next;
        }
        scope_ptr = (scope_ptr->parent);
    }
    return NULL;
}
char is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}
char is_type(Name* type) {
    Name* type_ptr = (type);
    return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
}
void parser_error(const string message, Token* token) {
    fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
}
static void set_bool_list(char bool_list[32], size_t index, char value) {
    char word = bool_list[index / 8];
    if (value)
        bool_list[index / 8] = (char)(word | (1 << (index % 8)));
    else
        bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
}
static char get_bool_list(char bool_list[32], size_t index) {
    return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? 0 : 1);
}
void indention(FILE* out, size_t indent, char is_last, Parser* parser) {
    Parser* parser_ptr = (parser);
    set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
    for (size_t i = 1; i < indent; ++i)
        fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}
Parser* create_parser(void) {
    Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
    Parser* parser_ptr = (new_parser);
    parser_ptr->in_function = 0;
    parser_ptr->in_method = 0;
    parser_ptr->in_loop = 0;
    return new_parser;
}
Name* parse_import_file(string import_name, string source, Scope* scope) {
    Name* name = 0;
    FILE* openfile;
    char filename[1024];
    filename[0] = '\0';
    if (source == 0) {
        if (strcmp(import_name, "print") == 0)
            strcpy(filename, "./std/print.tc");
        else if (strcmp(import_name, "arr") == 0)
            strcpy(filename, "./std/arr.tc");
        else {
            fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
            return 0;
        }
    } else {
        string_append(filename, 1024, filename, source);
        string_append(filename, 1024, filename, "/");
        string_append(filename, 1024, filename, import_name);
        string_append(filename, 1024, filename, ".tc");
    }
    openfile = fopen(filename, "r");
    if (openfile == NULL) {
        fprintf(stderr, "Error opening library file for import: %s\n", filename);
        return 0;
    }
    printf("Info: Starting parsing lib file for import: %s\n", filename);
    size_t length = 0;
    string source_code = read_source(openfile, &length);
    fclose(openfile);
    Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
    printf("Info: Finished parsing lib file for import: %s\n", filename);
    if (code == 0) {
        fprintf(stderr, "Error parsing library file for import: %s\n", filename);
        return 0;
    }
    List* names = ((((code))->global_scope))->names;
    Node* current = ((names))->head;
    while (current != 0) {
        Node* node_ptr = (current);
        Name* current_name = (Name*)node_ptr->content;
        if (string_equal(current_name->name, import_name)) {
            name = current_name;
            break;
        }
        current = node_ptr->next;
    }
    if (name != 0) {
        Scope* scope_ptr = (scope);
        list_append(scope_ptr->names, (pointer)name);
    }
    return name;
}
OperatorType string_to_operator(string str) {
    if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
    else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
    else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
    else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
    else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
    else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
    else if (string_equal(str, AND_SYMBOL)) return OP_AND;
    else if (string_equal(str, OR_SYMBOL)) return OP_OR;
    else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
    else if (string_equal(str, NE_SYMBOL)) return OP_NE;
    else if (string_equal(str, LT_SYMBOL)) return OP_LT;
    else if (string_equal(str, GT_SYMBOL)) return OP_GT;
    else if (string_equal(str, LE_SYMBOL)) return OP_LE;
    else if (string_equal(str, GE_SYMBOL)) return OP_GE;
    else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
    else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
    else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
    else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
    else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
    else return OP_NONE;
}
int operator_precedence(OperatorType op) {
    switch (op) {
        case OP_ASSIGN:
        case OP_ADD_ASSIGN:
        case OP_SUB_ASSIGN:
        case OP_MUL_ASSIGN:
        case OP_DIV_ASSIGN:
        case OP_MOD_ASSIGN:
            return 1;
        case OP_AND:
        case OP_OR:
            return 2;
        case OP_EQ:
        case OP_NE:
        case OP_LT:
        case OP_GT:
        case OP_LE:
        case OP_GE:
            return 3;
        case OP_ADD:
        case OP_SUB:
            return 4;
        case OP_MUL:
        case OP_DIV:
        case OP_MOD:
            return 5;
        case OP_NONE:
        default:
            return 0;
    }
}
string operator_to_string(OperatorType op) {
    switch (op) {
        case OP_ASSIGN: return ASSIGN_SYMBOL;
        case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
        case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
        case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
        case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
        case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
        case OP_AND: return AND_SYMBOL;
        case OP_OR: return OR_SYMBOL;
        case OP_EQ: return EQ_SYMBOL;
        case OP_NE: return NE_SYMBOL;
        case OP_LT: return LT_SYMBOL;
        case OP_GT: return GT_SYMBOL;
        case OP_LE: return LE_SYMBOL;
        case OP_GE: return GE_SYMBOL;
        case OP_ADD: return ADD_SYMBOL;
        case OP_SUB: return SUB_SYMBOL;
        case OP_MUL: return MUL_SYMBOL;
        case OP_DIV: return DIV_SYMBOL;
        case OP_MOD: return MOD_SYMBOL;
        case OP_NONE:
        default: return 0;
    }
}
