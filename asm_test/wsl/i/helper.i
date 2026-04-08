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
char to_lower(char c);
char to_upper(char c);
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
} Lexer;
Lexer* create_lexer(string source, size_t length, string filename);
Token* get_next_token(Lexer* lexer, char skip_comment);
Token* peek_next_token(Lexer* lexer, char skip_comment);
void reset_lexer(Lexer* lexer);
Token* peek_current_token(Lexer* lexer);
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
typedef enum SymbolType {
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
typedef struct Parser {
    File* source_file;
    char in_function;
    char in_method;
    char in_class;
    char in_loop;
} Parser;
Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
void output_code(Code* code, FILE* outfile, size_t indent, char indent_has_next[32]);
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
typedef struct Token Token;
typedef struct Lexer Lexer;
typedef struct TAC TAC;
typedef struct Code Code;
string read_source(FILE* file, size_t* length);
void output_one_token(FILE* file, Token* token);
void output_token(FILE* file, Lexer* lexer);
void output_ast(FILE* file, Code* ast);
void output_tac(FILE* file, TAC* tac);
void parse_file(const string name, char o_token, char o_ast, char o_tac);
List* create_list(void) {
    List* new_list = (List*)alloc_memory(sizeof(List));
    new_list->head = NULL;
    new_list->tail = NULL;
    return new_list;
}
static Node* create_node(pointer content) {
    Node* new_node = (Node*)alloc_memory(sizeof(Node));
    new_node->next = NULL;
    new_node->content = content;
    return new_node;
}
void list_append(List* list, pointer item) {
    if (list == NULL) {
        fprintf(stderr, "Error: list_append received NULL list\n");
        return;
    }
    Node* new_node = create_node(item);
    if (list->head == NULL) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
}
List* list_copy(List* original) {
    if (original == NULL)
        return NULL;
    List* new_list = create_list();
    new_list->head = original->head;
    new_list->tail = original->tail;
    return new_list;
}
pointer list_pop(List* list) {
    if (list == NULL || list->head == NULL)
        return NULL;
    Node* head_node = list->head;
    list->head = head_node->next;
    if (list->head == NULL)
        list->tail = NULL;
    return head_node->content;
}
pointer list_pop_back(List* list) {
    if (list == NULL || list->head == NULL)
        return NULL;
    if (list->head == list->tail) {
        pointer content = list->head->content;
        list->head = NULL;
        list->tail = NULL;
        return content;
    }
    Node* current = list->head;
    while (current->next != list->tail)
        current = current->next;
    pointer content = list->tail->content;
    current->next = NULL;
    list->tail = current;
    return content;
}
char list_is_empty(List* list) {
    return list == NULL || list->head == NULL || list->tail == NULL;
}
Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node) {
    static size_t id_counter = 0;
    SymbolTable* scope = NULL;
    switch (kind) {
        case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
        case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
        case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
        case SYMBOL_VARIABLE:
        case SYMBOL_PARAM:
        case SYMBOL_ATTRIBUTE:
        case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
        default:
            fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType: %u\n", kind);
            break;
    }
    Symbol* result = search_name(scope, name);
    if (result != NULL)
        fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
    Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
    new_name->name = name;
    new_name->id = ++id_counter;
    new_name->kind = kind;
    new_name->type = type;
    switch (kind) {
        case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
        case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
        case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
        case SYMBOL_VARIABLE:
        case SYMBOL_PARAM:
        case SYMBOL_ATTRIBUTE:
        case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
        default:
            fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
            break;
    }
    if (scope == NULL)
        fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
    else
        list_append(scope->symbols, (pointer)new_name);
    return new_name;
}
SymbolTable* create_symbol_table(SymbolTable* parent) {
    SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
    new_scope->parent = parent;
    new_scope->symbols = create_list();
    return new_scope;
}
Symbol* search_name_use_strcmp(SymbolTable* scope, string name) {
    while (scope != NULL) {
        List* names = scope->symbols;
        Node* current = names->head;
        while (current != NULL) {
            Symbol* current_name = (Symbol*)current->content;
            if (strcmp(current_name->name, name) == 0)
                return current_name;
            current = current->next;
        }
        scope = scope->parent;
    }
    return NULL;
}
Symbol* search_name(SymbolTable* scope, string name) {
    while (scope != NULL) {
        List* names = scope->symbols;
        Node* current = names->head;
        while (current != NULL) {
            Symbol* current_name = (Symbol*)current->content;
            if (string_equal(current_name->name, name))
                return current_name;
            current = current->next;
        }
        scope = scope->parent;
    }
    return NULL;
}
inline char is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}
inline void parser_error(const string message, Token* token, string file_name) {
    fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
}
static void set_bool_list(char bool_list[32], size_t index, char value) {
    char word = bool_list[index / 8];
    bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
}
static inline char get_bool_list(char bool_list[32], size_t index) {
    return (bool_list[index / 8] & (1 << (index % 8))) != 0;
}
void indention(FILE* out, size_t indent, char is_last, char indent_has_next[32]) {
    set_bool_list(indent_has_next, indent, !is_last);
    for (size_t i = 1; i < indent; ++i)
        fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}
void indention_tac(FILE* out, size_t indent) {
    for (size_t i = 0; i < indent * 4; ++i)
        putc(' ', out);
}
Parser* create_parser(File* file) {
    Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
    new_parser->in_function = 0;
    new_parser->in_method = 0;
    new_parser->in_loop = 0;
    new_parser->source_file = file;
    return new_parser;
}
Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file) {
    Symbol* name = NULL;
    FILE* openfile;
    string filename;
    if (source == NULL) {
        string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
        sprintf(temp_import_name, "%s.tc", import_name);
        filename = absolute_path(temp_import_name, "/home/su2u4/code/TC/std/");
    } else
        filename = absolute_path(source, get_file_dir(source_file));
    openfile = fopen(filename, "r");
    if (openfile == NULL) {
        fprintf(stderr, "Error opening library file for import: %s\n", filename);
        return NULL;
    }
    fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
    size_t length = 0;
    string source_code = read_source(openfile, &length);
    fclose(openfile);
    Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
    fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
    if (code == NULL) {
        fprintf(stderr, "Error parsing library file for import: %s\n", filename);
        return NULL;
    }
    name = search_name_use_strcmp(code->global_scope, import_name);
    if (name != NULL)
        list_append(scope->symbols, (pointer)name);
    else
        fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
    return name;
}
string make_method_name(string class_name, string method_name) {
    string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
    sprintf(name, "%s.%s", class_name, method_name);
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
        default: return NULL;
    }
}
