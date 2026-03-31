#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

// other start
typedef char* string;
typedef size_t* pointer;
// other end

// enum start
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
typedef enum SymbolTableType {
    SYMBOL_CLASS,
    SYMBOL_FUNCTION,
    SYMBOL_METHOD,
    SYMBOL_VARIABLE,
    SYMBOL_PARAM,
    SYMBOL_ATTRIBUTE,
    SYMBOL_TYPE
} SymbolType;
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
typedef enum VarType {
    VAR_ATTR = 'a',
    VAR_PARAM = 'p',
    VAR_VAR = 'v',
    VAR_TEMP = 't',
    VAR_BLOCK = 'b',
    VAR_SUBROUTINE = 'f'
} VarType;
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
// enum end

// struct start
typedef struct Node Node;
struct Node {
    Node* next;
    pointer content;
};
typedef struct List {
    Node* head;
    Node* tail;
} List;
typedef struct SymbolTable SymbolTable;
struct SymbolTable {
    SymbolTable* parent;
    List* symbols;
};
typedef struct Symbol Symbol;
typedef struct Class {
    Symbol* name;
    List* members;
    SymbolTable* class_scope;
    size_t size;
} Class;
typedef struct Function {
    Symbol* name;
    Symbol* return_type;
    List* parameters;
    List* body;
    SymbolTable* function_scope;
} Function;
typedef struct Method {
    Symbol* name;
    Symbol* return_type;
    List* parameters;
    List* body;
    SymbolTable* method_scope;
} Method;
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
typedef struct Var {
    Symbol* original_name;
    string name;
    Symbol* type;
} Var;
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
typedef struct Attribute {
    Symbol* var_name;
    Symbol* type;
    size_t offset;
} Attribute;
typedef struct AttributeTable {
    List* attributes;
    Symbol* name;
    size_t size;
} AttributeTable;
typedef struct Block {
    Var* label;
    List* instructions;
} Block;
typedef struct Expression Expression;
typedef struct VariableAccess VariableAccess;
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
typedef struct Primary Primary;
struct Primary {
    union {
        string literal_value;
        Expression* expr;
        Primary* operand;
        VariableAccess* var;
    } value;
    PrimaryType type;
};
struct Expression {
    Expression* expr_left;
    Primary* prim_left;
    Expression* right;
    OperatorType operator;
};
typedef struct Variable {
    Symbol* type;
    Symbol* name;
    Expression* value;
} Variable;
typedef struct ClassMember {
    union {
        Method* method;
        Variable* variable;
    } content;
    ClassMemberType type;
} ClassMember;
typedef struct Code {
    List* members;
    SymbolTable* global_scope;
} Code;
typedef struct Import {
    Symbol* name;
    string source;
} Import;
typedef struct CodeMember {
    union {
        Import* import;
        Function* function;
        Class* class;
    } content;
    CodeMemberType type;
} CodeMember;
typedef struct ElseIf {
    Expression* condition;
    List* body;
} ElseIf;
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
typedef struct For {
    Variable* initializer;
    Expression* condition;
    Expression* increment;
    List* body;
} For;
typedef struct If {
    Expression* condition;
    List* body;
    List* else_if;
    List* else_body;
} If;
typedef struct Instruction {
    Arg* arg1;
    Arg* arg2;
    Arg* arg3;
    InstructionType type;
} Instruction;
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
typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    MemoryBlock* next;
    pointer block;
};
typedef struct Parser {
    File* source_file;
    char in_function;
    char in_method;
    char in_loop;
    char indent_has_next[32];
} Parser;
typedef struct While {
    Expression* condition;
    List* body;
} While;
typedef struct Statement {
    union {
        Expression* expr;
        Variable* var;
        If* if_stmt;
        While* while_stmt;
        For* for_stmt;
        Expression* return_expr;
    } stmt;
    StatementType type;
} Statement;
typedef struct StringList StringList;
struct StringList {
    string str;
    size_t length;
    StringList* next;
};
typedef struct Subroutine {
    Symbol* name;
    Symbol* return_type;
    List* parameters;
    List* local_vars;
    List* blocks;
} Subroutine;
typedef struct TAC {
    List* attribute_tables;
    Symbol* entry_point;
    List* global_vars;
    List* subroutines;
} TAC;
typedef struct TACStatus {
    TAC* tac;
    Subroutine* current_subroutine;
    Block* current_block;
    List* end_labels;
    List* start_labels;
    size_t attr_count;
    size_t param_count;
    size_t var_count;
    size_t temp_count;
    size_t block_count;
    size_t subroutine_count;
} TACStatus;
// struct end

// static start
static char initialized = 0;
static const char* keywordStrings[22] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var"};
static const char* symbolStrings[30] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
static MemoryBlock* string_memory = NULL;
static MemoryBlock* struct_memory = NULL;
static size_t id_counter = 0;
static size_t memoryBlockCount = 0;
static size_t string_memory_count = 0;
static size_t string_memory_used = 0;
static size_t struct_memory_count = 0;
static size_t struct_memory_used = 0;
static string ADD_ASSIGN_SYMBOL = NULL;
static string ADD_SYMBOL = NULL;
static string AND_SYMBOL = NULL;
static string ASSIGN_SYMBOL = NULL;
static string BOOL_KEYWORD = NULL;
static string BREAK_KEYWORD = NULL;
static string CLASS_KEYWORD = NULL;
static string COMMA_SYMBOL = NULL;
static string CONTINUE_KEYWORD = NULL;
static string DEFAULT_CONSTRUCTOR_NAME = NULL;
static string DEFAULT_INIT_NAME = NULL;
static string DIV_ASSIGN_SYMBOL = NULL;
static string DIV_SYMBOL = NULL;
static string DOT_SYMBOL = NULL;
static string ELIF_KEYWORD = NULL;
static string ELSE_KEYWORD = NULL;
static string EQ_SYMBOL = NULL;
static string FALSE_KEYWORD = NULL;
static string FLOAT_KEYWORD = NULL;
static string FOR_KEYWORD = NULL;
static string FROM_KEYWORD = NULL;
static string FUNC_KEYWORD = NULL;
static string GE_SYMBOL = NULL;
static string GT_SYMBOL = NULL;
static string IF_KEYWORD = NULL;
static string IMPORT_KEYWORD = NULL;
static string INT_KEYWORD = NULL;
static string keywordList[22] = {0};
static string L_BRACE_SYMBOL = NULL;
static string L_BRACKET_SYMBOL = NULL;
static string L_PAREN_SYMBOL = NULL;
static string LE_SYMBOL = NULL;
static string LT_SYMBOL = NULL;
static string METHOD_KEYWORD = NULL;
static string MOD_ASSIGN_SYMBOL = NULL;
static string MOD_SYMBOL = NULL;
static string MUL_ASSIGN_SYMBOL = NULL;
static string MUL_SYMBOL = NULL;
static string NE_SYMBOL = NULL;
static string NOT_SYMBOL = NULL;
static string OR_SYMBOL = NULL;
static string R_BRACE_SYMBOL = NULL;
static string R_BRACKET_SYMBOL = NULL;
static string R_PAREN_SYMBOL = NULL;
static string RETURN_KEYWORD = NULL;
static string SELF_KEYWORD = NULL;
static string SEMICOLON_SYMBOL = NULL;
static string STRING_KEYWORD = NULL;
static string SUB_ASSIGN_SYMBOL = NULL;
static string SUB_SYMBOL = NULL;
static string symbolList[30] = {0};
static string TRUE_KEYWORD = NULL;
static string UNDERLINE_SYMBOL = NULL;
static string VAR_KEYWORD = NULL;
static string VOID_KEYWORD = NULL;
static string WHILE_KEYWORD = NULL;
static StringList* all_string_list = NULL;
static Symbol* name_bool = NULL;
static Symbol* name_float = NULL;
static Symbol* name_int = NULL;
static Symbol* name_string = NULL;
static Symbol* name_void = NULL;
static SymbolTable* builtin_scope = NULL;
// static end

// pure function start
static pointer list_pop(List* list) {
    if (list == NULL || list->head == NULL)
        return NULL;
    Node* head_node = list->head;
    list->head = head_node->next;
    if (list->head == NULL)
        list->tail = NULL;
    return head_node->content;
}
static Class* create_class_use_ptr(Class* class, Symbol* name, List* members, SymbolTable* class_scope, size_t size) {
    if (name == NULL) {
        fprintf(stderr, "Error creating class: name is NULL\n");
        return NULL;
    }
    class->name = name;
    class->members = members;
    class->class_scope = class_scope;
    class->size = size;
    return class;
}
static Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* method_scope) {
    if (name == NULL || return_type == NULL) {
        fprintf(stderr, "Error creating method: name or return_type is NULL\n");
        return NULL;
    }
    method->name = name;
    method->return_type = return_type;
    method->parameters = parameters;
    method->body = body;
    method->method_scope = method_scope;
    return method;
}
static Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* function_scope) {
    if (name == NULL || return_type == NULL) {
        fprintf(stderr, "Error creating function: name or return_type is NULL\n");
        return NULL;
    }
    function->name = name;
    function->return_type = return_type;
    function->parameters = parameters;
    function->body = body;
    function->function_scope = function_scope;
    return function;
}
static int operator_precedence(OperatorType op) {
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
static Symbol* search_name_use_strcmp(SymbolTable* scope, string name) {
    while (scope != NULL) {
        List* names = scope->symbols;
        Node* current = names->head;
        while (current != NULL) {
            Node* node_ptr = current;
            Symbol* current_name = (Symbol*)node_ptr->content;
            if (strcmp(current_name->name, name) == 0)
                return current_name;
            current = node_ptr->next;
        }
        scope = scope->parent;
    }
    return NULL;
}
static void parser_error(const string message, Token* token, string file_name) {
    fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
}
static void lexer_error(const string message, size_t line, size_t column) {
    fprintf(stderr, "Lexer Error at :%zu:%zu: %s\n", line + 1, column + 1, message);
}
static char get_current_char(Lexer* lexer) {
    if (lexer->position >= lexer->length)
        return '\0';
    lexer->column++;
    return lexer->source[lexer->position++];
}
static void indention(FILE* out, size_t indent, char is_last, Parser* parser) {
    Parser* parser_ptr = parser;
    char word = parser_ptr->indent_has_next[indent / 8];
    parser_ptr->indent_has_next[indent / 8] = (char)((is_last) ? (word & ~(1 << (indent % 8))) : (word | (1 << (indent % 8))));
    for (size_t i = 1; i < indent; ++i)
        fprintf(out, (parser_ptr->indent_has_next[i / 8] & (1 << (i % 8))) ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}
// pure function end

// function start
static void init(void);
static pointer alloc_memory(size_t size) {
    if (!initialized) init();
    size = (size + sizeof(size_t) - 1) & ~(sizeof(size_t) - 1);
    if (struct_memory->used + size >= struct_memory->size) {
        MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (new_block == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            MemoryBlock* current = string_memory;
            while (current != NULL) {
                MemoryBlock* next = current->next;
                free(current->block);
                free(current);
                current = next;
            }
            initialized = 0;
            exit(1);
        }
        new_block->block = (pointer)malloc(1024);
        new_block->size = 1024;
        new_block->used = 0;
        new_block->next = NULL;
        struct_memory_used += struct_memory->used;
        new_block->next = struct_memory;
        struct_memory = new_block;
        struct_memory_count += 1024;
    }
    assert(struct_memory->used % sizeof(size_t) == 0);
    size_t* ptr = struct_memory->block + (struct_memory->used / sizeof(size_t));
    struct_memory->used += size;
    ++memoryBlockCount;
    return ptr;
}
static List* create_list(void) {
    List* new_list = (List*)alloc_memory(sizeof(List));
    new_list->head = NULL;
    new_list->tail = NULL;
    return new_list;
}
static List* list_copy(List* original) {
    if (original == NULL)
        return NULL;
    List* new_list = create_list();
    new_list->head = original->head;
    new_list->tail = original->tail;
    return new_list;
}
static void list_append(List* list, pointer item) {
    if (list == NULL) {
        fprintf(stderr, "Error: list_append received NULL list\n");
        return;
    }
    Node* new_node = (Node*)alloc_memory(sizeof(Node));
    new_node->next = NULL;
    new_node->content = item;
    if (list->head == NULL) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
}
static string create_string_check(const char* data, size_t length, char check) {
    if (!initialized) init();
    if (data == NULL || length == 0) return 0;
    if (check) {
        StringList* current = all_string_list;
        string existing = NULL;
        while (current != NULL) {
            if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
                existing = current->str;
            current = current->next;
        }
        if (existing != NULL)
            return existing;
    }
    char* str;
    if (length >= 1024 - 1) {
        string_memory_count += length + 1;
        string_memory_used += length + 1;
        str = (char*)malloc(length + 1);
        fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", length + 1);
        if (str == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            exit(1);
        }
    } else {
        if (string_memory->used + length >= string_memory->size) {
            MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
            if (new_block == NULL) {
                fprintf(stderr, "Fatal: Cannot allocate memory\n");
                MemoryBlock* current = string_memory;
                while (current != NULL) {
                    MemoryBlock* next = current->next;
                    free(current->block);
                    free(current);
                    current = next;
                }
                initialized = 0;
                exit(1);
            }
            new_block->block = (pointer)malloc(1024);
            new_block->size = 1024;
            new_block->used = 0;
            new_block->next = NULL;
            string_memory_used += string_memory->used;
            new_block->next = string_memory;
            string_memory = new_block;
            string_memory_count += 1024;
        }
        str = &((char*)(string_memory->block))[string_memory->used];
        string_memory->used += length + 1;
    }
    strncpy(str, data, length);
    str[length] = '\0';
    StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
    new_str->str = str;
    new_str->length = length;
    new_str->next = all_string_list;
    all_string_list = new_str;
    return str;
}
void init(void) {
    if (initialized) return;
    if (struct_memory == NULL) {
        struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (struct_memory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            initialized = 0;
            exit(1);
        }
        struct_memory->block = (size_t*)malloc(1024);
        struct_memory->size = 1024;
        struct_memory->used = 0;
        struct_memory->next = NULL;
        struct_memory_count = 1024;
    }
    if (string_memory == NULL) {
        string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
        if (string_memory == NULL) {
            fprintf(stderr, "Fatal: Cannot allocate memory\n");
            initialized = 0;
            exit(1);
        }
        string_memory->block = (pointer)malloc(1024);
        string_memory->size = 1024;
        string_memory->used = 0;
        string_memory->next = NULL;
        string_memory_count = 1024;
    }
    initialized = 1;
    for (size_t i = 0; i < 22; ++i)
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
    for (size_t i = 0; i < 30; ++i)
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
    DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
    DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
    IMPORT_KEYWORD = keywordList[0];
    FROM_KEYWORD = keywordList[1];
    FUNC_KEYWORD = keywordList[2];
    CLASS_KEYWORD = keywordList[3];
    METHOD_KEYWORD = keywordList[4];
    SELF_KEYWORD = keywordList[5];
    IF_KEYWORD = keywordList[6];
    ELIF_KEYWORD = keywordList[7];
    ELSE_KEYWORD = keywordList[8];
    WHILE_KEYWORD = keywordList[9];
    FOR_KEYWORD = keywordList[10];
    TRUE_KEYWORD = keywordList[11];
    FALSE_KEYWORD = keywordList[12];
    RETURN_KEYWORD = keywordList[13];
    BREAK_KEYWORD = keywordList[14];
    CONTINUE_KEYWORD = keywordList[15];
    INT_KEYWORD = keywordList[16];
    FLOAT_KEYWORD = keywordList[17];
    STRING_KEYWORD = keywordList[18];
    BOOL_KEYWORD = keywordList[19];
    VOID_KEYWORD = keywordList[20];
    VAR_KEYWORD = keywordList[21];
    L_PAREN_SYMBOL = symbolList[0];
    R_PAREN_SYMBOL = symbolList[1];
    L_BRACE_SYMBOL = symbolList[2];
    R_BRACE_SYMBOL = symbolList[3];
    COMMA_SYMBOL = symbolList[4];
    NOT_SYMBOL = symbolList[5];
    DOT_SYMBOL = symbolList[6];
    L_BRACKET_SYMBOL = symbolList[7];
    R_BRACKET_SYMBOL = symbolList[8];
    SEMICOLON_SYMBOL = symbolList[9];
    UNDERLINE_SYMBOL = symbolList[10];
    ADD_SYMBOL = symbolList[11];
    SUB_SYMBOL = symbolList[12];
    MUL_SYMBOL = symbolList[13];
    DIV_SYMBOL = symbolList[14];
    MOD_SYMBOL = symbolList[15];
    LT_SYMBOL = symbolList[16];
    GT_SYMBOL = symbolList[17];
    ASSIGN_SYMBOL = symbolList[18];
    EQ_SYMBOL = symbolList[19];
    NE_SYMBOL = symbolList[20];
    LE_SYMBOL = symbolList[21];
    GE_SYMBOL = symbolList[22];
    ADD_ASSIGN_SYMBOL = symbolList[23];
    SUB_ASSIGN_SYMBOL = symbolList[24];
    MUL_ASSIGN_SYMBOL = symbolList[25];
    DIV_ASSIGN_SYMBOL = symbolList[26];
    MOD_ASSIGN_SYMBOL = symbolList[27];
    AND_SYMBOL = symbolList[28];
    OR_SYMBOL = symbolList[29];
}
static string read_source(FILE* file, size_t* length) {
    fseek(file, 0, SEEK_END);
    *length = (size_t)ftell(file);
    fseek(file, 0, SEEK_SET);
    string source = create_string_check("", *length + 1, 0);
    size_t bytes_read = fread(source, 1, *length, file);
    source[bytes_read] = '\0';
    *length = bytes_read;
    for (size_t i = 0; i < *length; ++i) {
        if (source[i] == '\r' || source[i] == '\t')
            source[i] = ' ';
    }
    return source;
}
static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
    Token* token = (Token*)alloc_memory(sizeof(Token));
    token->type = type;
    token->lexeme = lexeme;
    token->line = line;
    token->column = column;
    return token;
}
static Token* next_token(Lexer* lexer, char skip_comment) {
    char c = get_current_char(lexer);
    if (c == '\0')
        return create_token(EOF_TOKEN, NULL, lexer->line, lexer->column);
    else if (c == ' ' || c == '\t' || c == '\r')
        return next_token(lexer, skip_comment);
    else if (c == '\n') {
        lexer->line++;
        lexer->column = 0;
        return next_token(lexer, skip_comment);
    } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
        size_t start = lexer->position - 1;
        size_t column_start = lexer->column - 1;
        while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
            c = get_current_char(lexer);
        lexer->position -= (size_t)1;
        lexer->column -= (size_t)1;
        string content = create_string_check(&lexer->source[start], lexer->position - start, 1);
        if (!initialized) init();
        for (size_t i = 0; i < 22; ++i)
            if (content == keywordList[i])
                return create_token(KEYWORD, content, lexer->line, column_start);
        return create_token(IDENTIFIER, content, lexer->line, column_start);
    } else if ('0' <= c && c <= '9') {
        size_t start = lexer->position - 1;
        size_t column_start = lexer->column - 1;
        while ('0' <= c && c <= '9')
            c = get_current_char(lexer);
        TokenType type = INTEGER;
        char p = '\0';
        if (lexer->position < lexer->length)
            p = lexer->source[lexer->position];
        if (c == '.' && ('0' <= p && p <= '9')) {
            c = get_current_char(lexer);
            while ('0' <= c && c <= '9')
                c = get_current_char(lexer);
            type = FLOAT;
        }
        lexer->position -= (size_t)1;
        lexer->column -= (size_t)1;
        return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
    } else if (c == '"') {
        size_t start = lexer->position;
        size_t column_start = lexer->column - 1;
        c = get_current_char(lexer);
        while (c != '"' && c != '\0' && c != '\n')
            c = get_current_char(lexer);
        if (c != '"') {
            lexer_error("Unterminated string literal", lexer->line, start - 1);
            if (c == '\n') {
                lexer->line++;
                lexer->column = 0;
            }
        }
        if (lexer->position - start == 1)
            return create_token(STRING, create_string_check("\0", 1, 1), lexer->line, column_start);
        return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
    } else {
        char p = '\0';
        if (lexer->position < lexer->length)
            p = lexer->source[lexer->position];
        if (c == '/' && p == '/') {
            size_t start = lexer->position + 1;
            size_t column_start = lexer->column - 1;
            while (c != '\n' && c != '\0')
                c = get_current_char(lexer);
            lexer->position -= (size_t)1;
            lexer->column -= (size_t)1;
            if (skip_comment)
                return next_token(lexer, skip_comment);
            return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
        } else if (c == '/' && p == '*') {
            size_t start = lexer->position + 1;
            size_t column_start = lexer->column - 1;
            while (!(c == '*' && p == '/')) {
                c = get_current_char(lexer);
                p = '\0';
                if (lexer->position < lexer->length)
                    p = lexer->source[lexer->position];
                if (c == '\n') {
                    lexer->line++;
                    lexer->column = 0;
                }
                if (p == '\0') break;
                assert(c != '\0');
            }
            if (p == '\0') {
                if (c == '\0') {
                    lexer->position -= (size_t)1;
                    lexer->column -= (size_t)1;
                }
                lexer_error("Unterminated comment", lexer->line, start);
                if (skip_comment)
                    return next_token(lexer, skip_comment);
                return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
            }
            c = get_current_char(lexer);
            if (skip_comment)
                return next_token(lexer, skip_comment);
            return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start - 2, 1), lexer->line, column_start);
        } else if (c == '=' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, EQ_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '!' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, NE_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '<' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, LE_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '>' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, GE_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '+' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, ADD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '-' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, SUB_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '*' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, MUL_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '/' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, DIV_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '%' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, MOD_ASSIGN_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '&' && p == '&') {
            get_current_char(lexer);
            return create_token(SYMBOL, AND_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '|' && p == '|') {
            get_current_char(lexer);
            return create_token(SYMBOL, OR_SYMBOL, lexer->line, lexer->column - 2);
        } else if (c == '(')
            return create_token(SYMBOL, L_PAREN_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == ')')
            return create_token(SYMBOL, R_PAREN_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '{')
            return create_token(SYMBOL, L_BRACE_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '}')
            return create_token(SYMBOL, R_BRACE_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == ',')
            return create_token(SYMBOL, COMMA_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '!')
            return create_token(SYMBOL, NOT_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '.')
            return create_token(SYMBOL, DOT_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '[')
            return create_token(SYMBOL, L_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == ']')
            return create_token(SYMBOL, R_BRACKET_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == ';')
            return create_token(SYMBOL, SEMICOLON_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '_')
            return create_token(SYMBOL, UNDERLINE_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '+')
            return create_token(SYMBOL, ADD_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '-')
            return create_token(SYMBOL, SUB_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '*')
            return create_token(SYMBOL, MUL_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '/')
            return create_token(SYMBOL, DIV_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '%')
            return create_token(SYMBOL, MOD_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '<')
            return create_token(SYMBOL, LT_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '>')
            return create_token(SYMBOL, GT_SYMBOL, lexer->line, lexer->column - 1);
        else if (c == '=')
            return create_token(SYMBOL, ASSIGN_SYMBOL, lexer->line, lexer->column - 1);
        else {
            lexer_error("Unexpected character", lexer->line, lexer->column - 1);
            return create_token(EOF_TOKEN, NULL, 0, 0);
        }
    }
}
static Token* get_next_token(Lexer* lexer, char skip_comment) {
    if (lexer->peeked_token != NULL) {
        lexer->current_token = lexer->peeked_token;
        lexer->position = lexer->peeked_position;
        lexer->line = lexer->peeked_line;
        lexer->column = lexer->peeked_column;
        lexer->peeked_token = 0;
        return lexer->current_token;
    }
    Token* token = next_token(lexer, skip_comment);
    return lexer->current_token = token;
}
static string get_info(void) {
    size_t stringCount = 0;
    StringList* current = all_string_list;
    while (current != NULL) {
        stringCount++;
        current = current->next;
    }
    string struct_memory_used_str = create_string_check("", 48, 0);
    sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
    string string_memory_used_str = create_string_check("", 48, 0);
    sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
    string info = (string)create_string_check("", 240, 0);
    sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", 2, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
    return info;
}
static SymbolTable* create_symbol_table(SymbolTable* parent) {
    SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
    new_scope->parent = parent;
    new_scope->symbols = create_list();
    return new_scope;
}
static Symbol* search_name(SymbolTable* scope, string name) {
    while (scope != NULL) {
        List* names = scope->symbols;
        Node* current = names->head;
        while (current != NULL) {
            Node* node_ptr = current;
            Symbol* current_name = (Symbol*)node_ptr->content;
            if (current_name->name == name)
                return current_name;
            current = node_ptr->next;
        }
        scope = scope->parent;
    }
    return NULL;
}
static Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node) {
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
            fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %d\n", kind);
            break;
    }
    Symbol* result = search_name(scope, name);
    if (result != NULL)
        fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
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
            fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %d\n", kind);
            break;
    }
    if (scope == NULL)
        fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %d, id: %zu\n", name, kind, new_name->id);
    else
        list_append(scope->symbols, (pointer)new_name);
    return new_name;
}
static string absolute_path(string path, string base_path) {
    path = create_string_check(path, strlen(path), 0);
    size_t path_len = strlen(path);
    for (size_t i = 0; i < path_len; i++) {
        if (path[i] == '\\') path[i] = '/';
        if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
            memmove(path + i - 1, path + i + 1, path_len - i);
            path_len -= 2;
            i -= 2;
        }
        if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
            memmove(path + i, path + i + 1, path_len - i);
            path_len--;
            i--;
        }
    }
    if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
        path[0] = path[1] - ('a' - 'A');
        path[1] = ':';
        return path;
    }
    if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
        return path;
    if (path_len > 0 && path[0] == '/')
        return path;
    if (base_path == NULL)
        base_path = getcwd(NULL, 0);
    if (base_path == NULL)
        return path;
    size_t total_len = strlen(base_path) + 1 + path_len + 1;
    string abs_path = create_string_check("", total_len, 0);
    sprintf(abs_path, "%s/%s", base_path, path);
    return absolute_path(create_string_check(abs_path, total_len, 1), NULL);
}
static string get_file_dir(File* path) {
    if (path->dirs == NULL) return 0;
    size_t total_len = 0;
    size_t node_count = 0;
    StrNode* current = path->dirs;
    while (current != NULL) {
        if (current->next != NULL) {
            size_t dir_len = strlen(current->dir);
            total_len += dir_len;
            node_count++;
        }
        current = current->next;
    }
    if (node_count == 0) return NULL;
    if (node_count > 1)
        total_len += node_count - 1;
    string dir_path = create_string_check("", total_len + 1, 0);
    dir_path[0] = '\0';
    current = path->dirs;
    char first = 1;
    while (current != NULL) {
        if (current->next != NULL) {
            if (!first && strcmp(current->dir, "/") != 0)
                if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
                    strcat(dir_path, "/");
            strcat(dir_path, current->dir);
            first = 0;
        }
        current = current->next;
    }
    return create_string_check(dir_path, strlen(dir_path), 1);
}
static Lexer* create_lexer(string source, size_t length) {
    Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
    lexer->source = source;
    lexer->position = 0;
    lexer->length = length;
    lexer->line = 0;
    lexer->column = 0;
    lexer->peeked_token = NULL;
    lexer->peeked_position = 0;
    lexer->peeked_line = 0;
    lexer->peeked_column = 0;
    lexer->current_token = NULL;
    return lexer;
}
static Parser* create_parser(File* file) {
    Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
    new_parser->in_function = 0;
    new_parser->in_method = 0;
    new_parser->in_loop = 0;
    new_parser->source_file = file;
    return new_parser;
}
static File* create_file(const string path) {
    File* file = (File*)alloc_memory(sizeof(File));
    file->path = absolute_path(path, NULL);
    size_t path_len = strlen(file->path);
    string path_copy = create_string_check("", path_len + 1, 0);
    strcpy(path_copy, file->path);
    StrNode* dirs_head = NULL;
    StrNode* dirs_tail = NULL;
    size_t start = 0;
    if (path_len > 0 && path_copy[0] == '/') {
        StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
        node->dir = create_string_check("/", 1, 1);
        node->next = 0;
        dirs_head = node;
        dirs_tail = node;
        start = 1;
    }
    size_t i = start;
    while (i <= path_len) {
        if (i == path_len || path_copy[i] == '/') {
            if (i > start) {
                size_t comp_len = i - start;
                if (comp_len >= 256) {
                    comp_len = 256 - 1;
                    fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
                }
                char component[256];
                strncpy(component, path_copy + start, comp_len);
                component[comp_len] = '\0';
                if (strcmp(component, ".") == 0) {
                } else if (strcmp(component, "..") == 0) {
                    if (dirs_tail != NULL && dirs_tail != dirs_head) {
                        if (strcmp(dirs_tail->dir, "..") == 0) {
                            StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                            node->dir = create_string_check("..", 2, 1);
                            node->next = 0;
                            dirs_tail->next = node;
                            dirs_tail = node;
                        } else {
                            StrNode* prev = dirs_head;
                            while (prev != NULL && prev->next != dirs_tail)
                                prev = prev->next;
                            if (prev != NULL) {
                                prev->next = 0;
                                dirs_tail = prev;
                            }
                        }
                    } else if (dirs_head == NULL) {
                        StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                        node->dir = create_string_check("..", 2, 1);
                        node->next = 0;
                        dirs_head = node;
                        dirs_tail = node;
                    }
                } else if (strlen(component) > 0) {
                    StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                    node->dir = create_string_check(component, comp_len, 1);
                    node->next = 0;
                    if (dirs_tail != NULL)
                        dirs_tail->next = node;
                    dirs_tail = node;
                    if (dirs_head == NULL) dirs_head = node;
                }
            }
            start = i + 1;
        }
        i++;
    }
    file->dirs = dirs_head;
    if (dirs_tail != NULL) {
        string dot = strrchr(dirs_tail->dir, '.');
        if (dot != NULL && dot != dirs_tail->dir) {
            size_t name_len = (size_t)(dot - dirs_tail->dir);
            file->name = create_string_check(dirs_tail->dir, name_len, 1);
            file->extension = create_string_check(dot, strlen(dot), 1);
        } else {
            file->name = dirs_tail->dir;
            file->extension = NULL;
        }
    } else {
        file->name = NULL;
        file->extension = NULL;
    }
    size_t full_path_len = 0;
    StrNode* current = dirs_head;
    size_t node_count = 0;
    while (current != NULL) {
        full_path_len += strlen(current->dir);
        node_count++;
        current = current->next;
    }
    if (node_count > 1)
        full_path_len += (node_count - 1);
    string full_path = create_string_check("", full_path_len + 1, 0);
    full_path[0] = '\0';
    current = dirs_head;
    char is_first = 1;
    while (current != NULL) {
        if (!is_first && strcmp(current->dir, "/") != 0) {
            if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
                strcat(full_path, "/");
            }
        }
        strcat(full_path, current->dir);
        is_first = 0;
        current = current->next;
    }
    file->path = create_string_check(full_path, strlen(full_path), 1);
    return file;
}
static Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Import* create_import(Symbol* name, string source) {
    if (name == NULL) {
        fprintf(stderr, "Error creating import: name is NULL\n");
        return NULL;
    }
    Import* import = (Import*)alloc_memory(sizeof(Import));
    import->name = name;
    import->source = source;
    return import;
}
static Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token, parser->source_file->path);
        return NULL;
    }
    string import_name = token->lexeme;
    string source = NULL;
    token = get_next_token(lexer, 1);
    if (token->type == KEYWORD && token->lexeme == FROM_KEYWORD) {
        token = get_next_token(lexer, 1);
        if (token->type != STRING) {
            parser_error("Expected string literal after 'from'", token, parser->source_file->path);
            return NULL;
        }
        source = token->lexeme;
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL) {
        parser_error("Expected ';' at end of import statement", token, parser->source_file->path);
        return NULL;
    }
    Symbol* name = NULL;
    FILE* openfile;
    string filename;
    if (source == NULL) {
        string temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
        sprintf(temp_import_name, "%s.tc", import_name);
        filename = absolute_path(temp_import_name, "D:/TC/std/");
    } else
        filename = absolute_path(source, get_file_dir(parser->source_file));
    openfile = fopen(filename, "r");
    if (openfile == NULL) {
        fprintf(stderr, "Error opening library file for import: %s\n", filename);
        name = NULL;
    } else {
        printf("Info: Starting parsing lib file for import: %s\n", filename);
        size_t length = 0;
        string source_code = read_source(openfile, &length);
        fclose(openfile);
        Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
        printf("Info: Finished parsing lib file for import: %s\n", filename);
        if (code == NULL) {
            fprintf(stderr, "Error parsing library file for import: %s\n", filename);
            name = NULL;
        } else {
            List* names = code->global_scope->symbols;
            Node* current = names->head;
            while (current != NULL) {
                Node* node_ptr = current;
                Symbol* current_name = (Symbol*)node_ptr->content;
                if (current_name->name == import_name) {
                    name = current_name;
                    break;
                }
                current = node_ptr->next;
            }
            if (name != NULL)
                list_append(now_scope->symbols, (pointer)name);
            else
                fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
        }
    }
    if (name == NULL) {
        fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
        name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
    }
    return create_import(name, source);
}
static CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
    CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
    code_member->type = type;
    if (type == CODE_IMPORT && import_content != NULL)
        code_member->content.import = import_content;
    else if (type == CODE_FUNCTION && function_content != NULL)
        code_member->content.function = function_content;
    else if (type == CODE_CLASS && class_content != NULL)
        code_member->content.class = class_content;
    else {
        if (import_content == NULL && function_content == NULL && class_content == NULL)
            fprintf(stderr, "Error creating code member: content is NULL\n");
        else
            fprintf(stderr, "Error creating code member: unknown type %u\n", type);
        return NULL;
    }
    return code_member;
}
static Token* peek_next_token(Lexer* lexer, char skip_comment) {
    if (lexer->peeked_token != NULL)
        return lexer->peeked_token;
    size_t saved_position = lexer->position;
    size_t saved_line = lexer->line;
    size_t saved_column = lexer->column;
    Token* token = get_next_token(lexer, skip_comment);
    lexer->peeked_position = lexer->position;
    lexer->peeked_line = lexer->line;
    lexer->peeked_column = lexer->column;
    lexer->position = saved_position;
    lexer->line = saved_line;
    lexer->column = saved_column;
    lexer->peeked_token = token;
    return token;
}
static VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, List* args_content) {
    if ((base == NULL) != (type == VAR_NAME)) {
        fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
        return NULL;
    }
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
    variable_access->type = type;
    variable_access->base = base;
    if (type == VAR_NAME && name_content != NULL)
        variable_access->content.name = name_content;
    else if (type == VAR_FUNC_CALL && args_content != NULL)
        variable_access->content.args = args_content;
    else if (type == VAR_GET_SEQ && expr_content != NULL)
        variable_access->content.index = expr_content;
    else if (type == VAR_GET_ATTR && name_content != NULL)
        variable_access->content.attr_name = name_content;
    else {
        if (name_content == NULL && expr_content == NULL && args_content == NULL)
            fprintf(stderr, "Error creating variable access: content is NULL\n");
        else
            fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
        return NULL;
    }
    return variable_access;
}
static string make_method_name(string class_name, string method_name) {
    string name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
    sprintf(name, "%s.%s", class_name, method_name);
    return name;
}
static Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = lexer->current_token;
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && token->lexeme == SELF_KEYWORD)) {
        parser_error("Expected variable name in variable access", token, parser->source_file->path);
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
            var_scope = current_type->ast_node.class->class_scope;
        if (token->lexeme == L_PAREN_SYMBOL) {
            token = get_next_token(lexer, 1);
            if (base_name == NULL)
                parser_error("Cannot call undefined variable", token, parser->source_file->path);
            else if (base_name->kind == SYMBOL_CLASS) {
                string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
                base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
                base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
            }
            if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
                parser_error("Cannot call non-function variable", token, parser->source_file->path);
            token = get_next_token(lexer, 1);
            List* args = create_list();
            while (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
                Expression* arg = parse_expression(lexer, now_scope, parser);
                if (arg == NULL)
                    parser_error("Failed to parse function call argument", token, parser->source_file->path);
                list_append(args, (pointer)arg);
                token = get_next_token(lexer, 1);
                if (token->type == SYMBOL && token->lexeme == COMMA_SYMBOL)
                    token = get_next_token(lexer, 1);
                else if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
                    parser_error("Expected ',' or ')' after function call argument", token, parser->source_file->path);
                    return NULL;
                }
            }
            base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
            base_name = base_name->type;
            current_type = NULL;
            var_scope = NULL;
            if (base_name->kind == SYMBOL_CLASS)
                var_scope = base_name->ast_node.class->class_scope;
        } else if (token->lexeme == L_BRACKET_SYMBOL) {
            token = get_next_token(lexer, 1);
            token = get_next_token(lexer, 1);
            Expression* index = parse_expression(lexer, now_scope, parser);
            if (index == NULL)
                parser_error("Failed to parse sequence index", token, parser->source_file->path);
            token = get_next_token(lexer, 1);
            if (token->type != SYMBOL || token->lexeme != R_BRACKET_SYMBOL) {
                parser_error("Expected ']' after sequence index", token, parser->source_file->path);
                return NULL;
            }
            base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
        } else if (token->lexeme == DOT_SYMBOL) {
            token = get_next_token(lexer, 1);
            token = get_next_token(lexer, 1);
            if (var_scope == NULL) {
                parser_error("Cannot access attribute without a valid scope", token, parser->source_file->path);
                return NULL;
            }
            if (token->type != IDENTIFIER) {
                parser_error("Expected attribute name after '.'", token, parser->source_file->path);
                return NULL;
            }
            base_name = search_name(var_scope, token->lexeme);
            if (base_name == NULL) {
                string class_name = NULL;
                if (current_type != NULL) {
                    if (current_type->kind == SYMBOL_CLASS)
                        class_name = current_type->name;
                    else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
                        class_name = current_type->type->name;
                }
                string name = make_method_name(class_name, token->lexeme);
                base_name = search_name_use_strcmp(var_scope, name);
            }
            if (base_name == NULL) {
                parser_error("Unknown attribute name", token, parser->source_file->path);
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
static Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
    primary->type = type;
    if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
        primary->value.literal_value = str_value;
    else if (type == PRIM_EXPRESSION && expr_value != NULL)
        primary->value.expr = expr_value;
    else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
        primary->value.operand = prim_value;
    else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
        primary->value.var = variable_value;
    else {
        if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
            fprintf(stderr, "Error creating primary: value is NULL\n");
        else
            fprintf(stderr, "Error creating primary: unknown type %u\n", type);
        return NULL;
    }
    return primary;
}
static Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
    if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
        fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
                operator == OP_NONE ? "true" : "false",
                expr_left == NULL ? "true" : "false",
                prim_left == NULL ? "true" : "false",
                right == NULL ? "true" : "false");
        return NULL;
    }
    Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
    expression->operator = operator;
    if (expr_left != NULL)
        expression->expr_left = expr_left;
    else if (prim_left != NULL)
        expression->prim_left = prim_left;
    else {
        fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
        return NULL;
    }
    expression->right = right;
    return expression;
}
static OperatorType string_to_operator(string str) {
    if (str == ASSIGN_SYMBOL) return OP_ASSIGN;
    else if (str == ADD_ASSIGN_SYMBOL) return OP_ADD_ASSIGN;
    else if (str == SUB_ASSIGN_SYMBOL) return OP_SUB_ASSIGN;
    else if (str == MUL_ASSIGN_SYMBOL) return OP_MUL_ASSIGN;
    else if (str == DIV_ASSIGN_SYMBOL) return OP_DIV_ASSIGN;
    else if (str == MOD_ASSIGN_SYMBOL) return OP_MOD_ASSIGN;
    else if (str == AND_SYMBOL) return OP_AND;
    else if (str == OR_SYMBOL) return OP_OR;
    else if (str == EQ_SYMBOL) return OP_EQ;
    else if (str == NE_SYMBOL) return OP_NE;
    else if (str == LT_SYMBOL) return OP_LT;
    else if (str == GT_SYMBOL) return OP_GT;
    else if (str == LE_SYMBOL) return OP_LE;
    else if (str == GE_SYMBOL) return OP_GE;
    else if (str == ADD_SYMBOL) return OP_ADD;
    else if (str == SUB_SYMBOL) return OP_SUB;
    else if (str == MUL_SYMBOL) return OP_MUL;
    else if (str == DIV_SYMBOL) return OP_DIV;
    else if (str == MOD_SYMBOL) return OP_MOD;
    else return OP_NONE;
}
static Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
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
            parser_error("Failed to parse right operand", token, parser->source_file->path);
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
            if (right == NULL) {
                return NULL;
            }
            token = peek_next_token(lexer, 1);
        }
        expr_left = create_expression(op, expr_left, NULL, right);
        token = peek_next_token(lexer, 1);
    }
    token = lexer->current_token;
    return expr_left;
}
Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = lexer->current_token;
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
    } else if (token->type == KEYWORD && token->lexeme == TRUE_KEYWORD) {
        type = PRIM_TRUE;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && token->lexeme == FALSE_KEYWORD) {
        type = PRIM_FALSE;
        str_value = token->lexeme;
    } else if (token->type == SYMBOL && token->lexeme == L_PAREN_SYMBOL) {
        type = PRIM_EXPRESSION;
        token = get_next_token(lexer, 1);
        expr_value = parse_expression(lexer, now_scope, parser);
        if (expr_value == NULL) {
            parser_error("Failed to parse parenthesized expression", token, parser->source_file->path);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
            parser_error("Expected ')' after expression", token, parser->source_file->path);
            return NULL;
        }
    } else if (token->type == SYMBOL && token->lexeme == NOT_SYMBOL) {
        type = PRIM_NOT_OPERAND;
        token = get_next_token(lexer, 1);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == NULL) {
            parser_error("Failed to parse operand of unary '!'", token, parser->source_file->path);
            return NULL;
        }
    } else if (token->type == SYMBOL && token->lexeme == SUB_SYMBOL) {
        type = PRIM_NEG_OPERAND;
        token = get_next_token(lexer, 1);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == NULL) {
            parser_error("Failed to parse operand of unary '-'", token, parser->source_file->path);
            return NULL;
        }
    } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == SELF_KEYWORD && parser->in_method)) {
        type = PRIM_VARIABLE_ACCESS;
        variable_value = parse_variable_access(lexer, now_scope, parser);
        if (variable_value == NULL) {
            parser_error("Failed to parse variable access", token, parser->source_file->path);
            return NULL;
        }
    } else {
        parser_error("Unexpected token in primary expression", token, parser->source_file->path);
        return NULL;
    }
    return create_primary(type, str_value, expr_value, prim_value, variable_value);
}
Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Primary* left_primary = parse_primary(lexer, now_scope, parser);
    if (left_primary == NULL) {
        parser_error("Failed to parse expression primary", lexer->current_token, parser->source_file->path);
        return NULL;
    }
    return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
}
static Variable* create_variable(Symbol* type, Symbol* name, Expression* value) {
    if (type == NULL || name == NULL) {
        fprintf(stderr, "Error creating variable: type or name is NULL\n");
        return NULL;
    }
    Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
    variable->type = type;
    variable->name = name;
    variable->value = value;
    return variable;
}
static Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = lexer->current_token;
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == INT_KEYWORD || token->lexeme == FLOAT_KEYWORD || token->lexeme == STRING_KEYWORD || token->lexeme == BOOL_KEYWORD || token->lexeme == VOID_KEYWORD))) {
        parser_error("Expected variable type", token, parser->source_file->path);
        return NULL;
    }
    Symbol* type = search_name(now_scope, token->lexeme);
    if (type != NULL) {
        Symbol* type_ptr = type;
        if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
            parser_error("Expected a type for variable declaration", token, parser->source_file->path);
    } else
        parser_error("Unknown variable type", token, parser->source_file->path);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER)
        parser_error("Expected variable name", token, parser->source_file->path);
    Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
    Expression* value = NULL;
    token = peek_next_token(lexer, 1);
    if (token->type == SYMBOL && token->lexeme == ASSIGN_SYMBOL) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        value = parse_expression(lexer, now_scope, parser);
        if (value == NULL)
            parser_error("Failed to parse variable initializer", token, parser->source_file->path);
    }
    return create_variable(type, name, value);
}
static Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
    Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
    statement->type = type;
    if (type == EXPRESSION_STATEMENT && expr != NULL)
        statement->stmt.expr = expr;
    else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
        statement->stmt.var = var_stmt;
    else if (type == IF_STATEMENT && if_stmt != NULL)
        statement->stmt.if_stmt = if_stmt;
    else if (type == WHILE_STATEMENT && while_stmt != NULL)
        statement->stmt.while_stmt = while_stmt;
    else if (type == FOR_STATEMENT && for_stmt != NULL)
        statement->stmt.for_stmt = for_stmt;
    else if (type == RETURN_STATEMENT)
        statement->stmt.return_expr = expr;
    else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
        statement->stmt.expr = NULL;
    else {
        if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
            fprintf(stderr, "Error creating statement: content is NULL\n");
        else
            fprintf(stderr, "Error creating statement: unknown type %u\n", type);
        return NULL;
    }
    return statement;
}
static ElseIf* create_else_if(Expression* condition, List* body) {
    if (condition == NULL) {
        fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
        return NULL;
    }
    ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
    else_if->condition = condition;
    else_if->body = body;
    return else_if;
}
static If* create_if(Expression* condition, List* body, List* else_if, List* else_body) {
    if (condition == NULL) {
        fprintf(stderr, "Error creating if statement: condition is NULL\n");
        return NULL;
    }
    If* if_ = (If*)alloc_memory(sizeof(If));
    if_->condition = condition;
    if_->body = body;
    if_->else_if = else_if;
    if_->else_body = else_body;
    return if_;
}
static Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_PAREN_SYMBOL) {
        parser_error("Expected '(' after 'if'", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == NULL)
        parser_error("Failed to parse if condition", token, parser->source_file->path);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
        parser_error("Expected ')' after if condition", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
        parser_error("Expected '{' to start if body", token, parser->source_file->path);
        return NULL;
    }
    List* body = create_list();
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse if body statement", token, parser->source_file->path);
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    List* else_if = create_list();
    List* else_body = create_list();
    token = peek_next_token(lexer, 1);
    while (token->type == KEYWORD && token->lexeme == ELIF_KEYWORD) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != L_PAREN_SYMBOL) {
            parser_error("Expected '(' after 'elif'", token, parser->source_file->path);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        Expression* elif_condition = parse_expression(lexer, now_scope, parser);
        if (elif_condition == NULL)
            parser_error("Failed to parse else-if condition", token, parser->source_file->path);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
            parser_error("Expected ')' after else-if condition", token, parser->source_file->path);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
            parser_error("Expected '{' to start else-if body", token, parser->source_file->path);
            return NULL;
        }
        List* elif_body = create_list();
        token = get_next_token(lexer, 1);
        while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == NULL)
                parser_error("Failed to parse else-if body statement", token, parser->source_file->path);
            list_append(elif_body, (pointer)statement);
            token = get_next_token(lexer, 1);
        }
        list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
        token = peek_next_token(lexer, 1);
    }
    if (token->type == KEYWORD && token->lexeme == ELSE_KEYWORD) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
            parser_error("Expected '{' to start else body", token, parser->source_file->path);
            return NULL;
        }
        token = get_next_token(lexer, 1);
        while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == NULL)
                parser_error("Failed to parse else body statement", token, parser->source_file->path);
            list_append(else_body, (pointer)statement);
            token = get_next_token(lexer, 1);
        }
    }
    token = lexer->current_token;
    return create_if(condition, body, else_if, else_body);
}
static For* create_for(Variable* initializer, Expression* condition, Expression* increment, List* body) {
    For* for_ = (For*)alloc_memory(sizeof(For));
    for_->initializer = initializer;
    for_->condition = condition;
    for_->increment = increment;
    for_->body = body;
    return for_;
}
static For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_PAREN_SYMBOL) {
        parser_error("Expected '(' after 'for'", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Variable* initializer = NULL;
    if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL) {
        initializer = parse_variable(lexer, now_scope, parser);
        if (initializer == NULL)
            parser_error("Failed to parse for loop initializer", token, parser->source_file->path);
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL) {
        parser_error("Expected ';' after for loop initializer", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* condition = NULL;
    if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL) {
        condition = parse_expression(lexer, now_scope, parser);
        if (condition == NULL)
            parser_error("Failed to parse for loop condition", token, parser->source_file->path);
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL) {
        parser_error("Expected ';' after for loop condition", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* increment = NULL;
    if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
        increment = parse_expression(lexer, now_scope, parser);
        if (increment == NULL)
            parser_error("Failed to parse for loop increment", token, parser->source_file->path);
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
        parser_error("Expected ')' after for loop increment", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
        parser_error("Expected '{' to start for loop body", token, parser->source_file->path);
        return NULL;
    }
    List* body = create_list();
    parser->in_loop = 1;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse for loop body statement", token, parser->source_file->path);
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_loop = 0;
    return create_for(initializer, condition, increment, body);
}
static While* create_while(Expression* condition, List* body) {
    While* while_ = (While*)alloc_memory(sizeof(While));
    while_->condition = condition;
    while_->body = body;
    return while_;
}
static While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_PAREN_SYMBOL) {
        parser_error("Expected '(' after 'while'", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == NULL)
        parser_error("Failed to parse while condition", token, parser->source_file->path);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
        parser_error("Expected ')' after while condition", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
        parser_error("Expected '{' to start while body", token, parser->source_file->path);
        return NULL;
    }
    List* body = create_list();
    parser->in_loop = 1;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse while body statement", token, parser->source_file->path);
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_loop = 0;
    return create_while(condition, body);
}
Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    token = lexer->current_token;
    Statement* statement = NULL;
    if (token->type == KEYWORD) {
        if (token->lexeme == IF_KEYWORD)
            return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
        else if (token->lexeme == FOR_KEYWORD)
            return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
        else if (token->lexeme == WHILE_KEYWORD)
            return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
        else if (token->lexeme == VAR_KEYWORD) {
            get_next_token(lexer, 1);
            statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
        } else if (token->lexeme == RETURN_KEYWORD) {
            token = get_next_token(lexer, 1);
            if (token->type == SYMBOL && token->lexeme == SEMICOLON_SYMBOL) {
                return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
            }
            statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
        } else if (token->lexeme == BREAK_KEYWORD) {
            if (!parser->in_loop) {
                parser_error("Cannot use 'break' outside of a loop", token, parser->source_file->path);
                return NULL;
            }
            statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else if (token->lexeme == CONTINUE_KEYWORD) {
            if (!parser->in_loop) {
                parser_error("Cannot use 'continue' outside of a loop", token, parser->source_file->path);
                return NULL;
            }
            statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
        } else
            statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    } else
        statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
    token = lexer->current_token;
    if (statement == NULL)
        parser_error("Failed to parse statement", token, parser->source_file->path);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL)
        parser_error("Expected ';' after statement", token, parser->source_file->path);
    return statement;
}
static Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    SymbolTable* function_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == INT_KEYWORD || token->lexeme == FLOAT_KEYWORD || token->lexeme == STRING_KEYWORD || token->lexeme == BOOL_KEYWORD || token->lexeme == VOID_KEYWORD))) {
        parser_error("Expected function return type after 'func'", token, parser->source_file->path);
        return NULL;
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == NULL) {
        parser_error("Unknown function return type", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected function name after return type", token, parser->source_file->path);
        return NULL;
    }
    Function* function = (Function*)alloc_memory(sizeof(Function));
    function->function_scope = function_scope;
    Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_PAREN_SYMBOL) {
        parser_error("Expected '(' after function name", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    List* parameters = create_list();
    while (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
        Variable* parameter = parse_variable(lexer, function_scope, parser);
        if (parameter == NULL)
            parser_error("Failed to parse function parameter", token, parser->source_file->path);
        else if (parameter->value != NULL)
            parser_error("Function parameters cannot have default values", token, parser->source_file->path);
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, 1);
        if (token->type == SYMBOL && token->lexeme == COMMA_SYMBOL) {
            token = get_next_token(lexer, 1);
        } else if (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
            parser_error("Expected ',' or ')' after function parameter", token, parser->source_file->path);
            return NULL;
        }
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
        parser_error("Expected '{' to start function body", token, parser->source_file->path);
        return NULL;
    }
    List* body = create_list();
    parser->in_function = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
        Statement* statement = parse_statement(lexer, function_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse function body statement", token, parser->source_file->path);
        else if (have_return)
            parser_error("Unreachable code after return statement", token, parser->source_file->path);
        if (statement != NULL && statement->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_function = 0;
    if (!have_return && return_type != name_void)
        parser_error("Function missing return statement", token, parser->source_file->path);
    return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
}
static Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser) {
    Token* token = NULL;
    SymbolTable* method_scope = create_symbol_table(now_scope);
    Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == INT_KEYWORD || token->lexeme == FLOAT_KEYWORD || token->lexeme == STRING_KEYWORD || token->lexeme == BOOL_KEYWORD || token->lexeme == VOID_KEYWORD))) {
        parser_error("Expected method return type after 'method'", token, parser->source_file->path);
        return NULL;
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == NULL) {
        parser_error("Unknown return type for method", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected method name after return type", token, parser->source_file->path);
        return NULL;
    }
    Method* method = (Method*)alloc_memory(sizeof(Method));
    method->method_scope = method_scope;
    Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_PAREN_SYMBOL) {
        parser_error("Expected '(' after method name", token, parser->source_file->path);
        return NULL;
    }
    token = get_next_token(lexer, 1);
    if (token->type != KEYWORD || token->lexeme != SELF_KEYWORD)
        parser_error("Expected 'self' as first parameter of method", token, parser->source_file->path);
    token = get_next_token(lexer, 1);
    List* parameters = create_list();
    list_append(parameters, (pointer)create_variable(class_name, self, NULL));
    while (token->type != SYMBOL || token->lexeme != R_PAREN_SYMBOL) {
        if (token->type == SYMBOL && token->lexeme == COMMA_SYMBOL) {
            token = get_next_token(lexer, 1);
        } else if (token->type == SYMBOL && token->lexeme == R_PAREN_SYMBOL) break;
        else {
            parser_error("Expected ',' or ')' after method parameter", token, parser->source_file->path);
            return NULL;
        }
        Variable* parameter = parse_variable(lexer, method_scope, parser);
        if (parameter == NULL)
            parser_error("Failed to parse method parameter", token, parser->source_file->path);
        else if (parameter->value != NULL)
            parser_error("Method parameters cannot have default values", token, parser->source_file->path);
        else
            list_append(parameters, (pointer)parameter);
        token = get_next_token(lexer, 1);
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
        parser_error("Expected '{' to start method body", token, parser->source_file->path);
        return NULL;
    }
    List* body = create_list();
    parser->in_function = 1;
    parser->in_method = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
        Statement* statement = parse_statement(lexer, method_scope, parser);
        if (statement == NULL)
            parser_error("Failed to parse method body statement", token, parser->source_file->path);
        else if (have_return)
            parser_error("Unreachable code after return statement", token, parser->source_file->path);
        if (statement != NULL && statement->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (pointer)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_function = 0;
    parser->in_method = 0;
    if (!have_return && return_type != name_void)
        parser_error("Method missing return statement", token, parser->source_file->path);
    return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
}
static ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
    class_member->type = type;
    if (type == CLASS_METHOD && method_content != NULL)
        class_member->content.method = method_content;
    else if (type == CLASS_VARIABLE && variable_content != NULL)
        class_member->content.variable = variable_content;
    else {
        if (method_content == NULL && variable_content == NULL)
            fprintf(stderr, "Error creating class member: content is NULL\n");
        else
            fprintf(stderr, "Error creating class member: unknown type %u\n", type);
        return NULL;
    }
    return class_member;
}
static Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = NULL;
    SymbolTable* class_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        parser_error("Expected class name after 'class'", token, parser->source_file->path);
        return NULL;
    }
    Class* class = (Class*)alloc_memory(sizeof(Class));
    class->class_scope = class_scope;
    Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != L_BRACE_SYMBOL) {
        parser_error("Expected '{' to start class body", token, parser->source_file->path);
        return NULL;
    }
    List* members = create_list();
    token = get_next_token(lexer, 1);
    size_t size = 0;
    while (token->type != SYMBOL || token->lexeme != R_BRACE_SYMBOL) {
        if (token->type == KEYWORD && token->lexeme == METHOD_KEYWORD) {
            Method* method = parse_method(lexer, class_scope, name, parser);
            if (method == NULL)
                parser_error("Failed to parse class method", token, parser->source_file->path);
            list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
        } else if (token->type == KEYWORD && token->lexeme == VAR_KEYWORD) {
            token = get_next_token(lexer, 1);
            Variable* variable = parse_variable(lexer, class_scope, parser);
            if (variable == NULL)
                parser_error("Failed to parse class variable", token, parser->source_file->path);
            ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
            list_append(members, (pointer)member);
            if (member->type == CLASS_VARIABLE) {
                Symbol* type = member->content.variable->type;
                if (type == name_int || type == name_float || type == name_string)
                    size += 8;
                else if (type == name_bool || type == name_void)
                    size += 1;
                else if (type->kind == SYMBOL_CLASS)
                    size += 8;
                else
                    fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
            }
            token = get_next_token(lexer, 1);
            if (token->type != SYMBOL || token->lexeme != SEMICOLON_SYMBOL)
                parser_error("Expected ';' after class variable declaration", token, parser->source_file->path);
        } else
            parser_error("Unexpected token in class member", token, parser->source_file->path);
        token = get_next_token(lexer, 1);
    }
    string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
    Symbol* init = search_name_use_strcmp(class_scope, init_name);
    if (init == NULL) {
        Method* method = (Method*)alloc_memory(sizeof(Method));
        method->method_scope = create_symbol_table(class_scope);
        init = create_symbol(init_name, SYMBOL_METHOD, name, method);
        List* parameters = create_list();
        Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
        list_append(parameters, (pointer)create_variable(name, self, NULL));
        List* body = create_list();
        list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
        create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
        list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
    }
    if (init->kind != SYMBOL_METHOD)
        parser_error("Constructor name conflicts with existing member", token, parser->source_file->path);
    string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
    Method* method = (Method*)alloc_memory(sizeof(Method));
    method->method_scope = create_symbol_table(class_scope);
    Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
    List* parameters = create_list();
    Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
    list_append(parameters, (pointer)create_variable(name, self, NULL));
    List* init_params = list_copy(init->ast_node.method->parameters);
    Variable* param;
    while ((param = (Variable*)list_pop(init_params)) != NULL) {
        if (param->name->name == SELF_KEYWORD) continue;
        list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
    }
    List* body = create_list();
    List* ms = list_copy(members);
    ClassMember* mb;
    while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
        if (mb->type == CLASS_VARIABLE) {
            Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
            Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), NULL, NULL, NULL), NULL);
            list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
        }
    }
    List* args = create_list();
    List* params = list_copy(parameters);
    while ((param = (Variable*)list_pop(params)) != NULL)
        list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
    list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
    create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
    list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
    return create_class_use_ptr(class, name, members, class_scope, size);
}
static Code* create_code(List* members, SymbolTable* global_scope) {
    Code* code = (Code*)alloc_memory(sizeof(Code));
    code->members = members;
    code->global_scope = global_scope;
    return code;
}
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
        if (token->type == KEYWORD && token->lexeme == IMPORT_KEYWORD) {
            Import* import = parse_import(lexer, global_scope, parser);
            if (import == NULL)
                parser_error("Failed to parse import statement", token, parser->source_file->path);
            list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
        } else if (token->type == KEYWORD && token->lexeme == FUNC_KEYWORD) {
            Function* function = parse_function(lexer, global_scope, parser);
            if (function == NULL)
                parser_error("Failed to parse function declaration", token, parser->source_file->path);
            list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
        } else if (token->type == KEYWORD && token->lexeme == CLASS_KEYWORD) {
            Class* class = parse_class(lexer, global_scope, parser);
            if (class == NULL)
                parser_error("Failed to parse class declaration", token, parser->source_file->path);
            list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
        } else
            parser_error("Unexpected token in code member", token, parser->source_file->path);
        token = get_next_token(lexer, 1);
    }
    return create_code(members, global_scope);
}
static void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
    if (name == NULL) {
        indention(outfile, indent + 0, 1, parser);
        fprintf(outfile, "Name pointer: \"NULL\"\n");
        return;
    }
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "name: \"%s\"\n", name->name);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "id: %zu\n", name->id);
    switch (name->kind) {
        case SYMBOL_TYPE:
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "kind: \"variable\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_FUNCTION:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "kind: \"function\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_METHOD:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "kind: \"method\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_CLASS:
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "kind: \"class\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "kind: \"attribute\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        case SYMBOL_PARAM:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "kind: \"parameter\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "kind: \"unknown_NameType\"\n");
            break;
    }
}
static void output_import(Import* import, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "name\n");
    output_name(import->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
}
static void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser);
static void output_variable_access(VariableAccess* variable_access, FILE* outfile, size_t indent, Parser* parser) {
    List* args;
    int index;
    switch (variable_access->type) {
        case VAR_NAME:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"name\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "name\n");
            output_name(variable_access->content.name, outfile, indent + 1, parser);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(variable_access->content.args);
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"function_call\"\n");
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "function\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "arguments\n");
            Expression* arg;
            index = -1;
            while ((arg = (Expression*)list_pop(args)) != NULL) {
                indention(outfile, indent + 1, 0, parser);
                fprintf(outfile, "arguments[%d]\n", ++index);
                output_expression(arg, outfile, indent + 2, parser);
            }
            break;
        case VAR_GET_SEQ:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"get sequence_element\"\n");
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "sequence\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "index\n");
            output_expression(variable_access->content.index, outfile, indent + 1, parser);
            break;
        case VAR_GET_ATTR:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"get_attribute\"\n");
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "object\n");
            output_variable_access(variable_access->base, outfile, indent + 1, parser);
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "attribute_name\n");
            output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "unknown_VariableAccessType: %u\n", variable_access->type);
            break;
    }
}
static void output_primary(Primary* primary, FILE* outfile, size_t indent, Parser* parser) {
    switch (primary->type) {
        case PRIM_INTEGER:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"integer\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_FLOAT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"float\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_STRING:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"string\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value: \"%s\"\n", primary->value.literal_value);
            break;
        case PRIM_TRUE:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value: \"true\"\n");
            break;
        case PRIM_FALSE:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value: \"false\"\n");
            break;
        case PRIM_EXPRESSION:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"expression\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value\n");
            output_expression(primary->value.expr, outfile, indent + 1, parser);
            break;
        case PRIM_NOT_OPERAND:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"!\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, parser);
            break;
        case PRIM_NEG_OPERAND:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"-\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, parser);
            break;
        case PRIM_VARIABLE_ACCESS:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "type: \"variable\"\n");
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "value\n");
            output_variable_access(primary->value.var, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 1, parser);
            fprintf(outfile, "unknown_PrimaryType: %u\n", primary->type);
            break;
    }
}
void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
    if (expression->operator == OP_NONE) {
        indention(outfile, indent + 0, 1, parser);
        fprintf(outfile, "primary\n");
        output_primary(expression->prim_left, outfile, indent + 1, parser);
    } else {
        string op_str = NULL;
        switch (expression->operator) {
            case OP_ASSIGN: op_str = ASSIGN_SYMBOL; break;
            case OP_ADD_ASSIGN: op_str = ADD_ASSIGN_SYMBOL; break;
            case OP_SUB_ASSIGN: op_str = SUB_ASSIGN_SYMBOL; break;
            case OP_MUL_ASSIGN: op_str = MUL_ASSIGN_SYMBOL; break;
            case OP_DIV_ASSIGN: op_str = DIV_ASSIGN_SYMBOL; break;
            case OP_MOD_ASSIGN: op_str = MOD_ASSIGN_SYMBOL; break;
            case OP_AND: op_str = AND_SYMBOL; break;
            case OP_OR: op_str = OR_SYMBOL; break;
            case OP_EQ: op_str = EQ_SYMBOL; break;
            case OP_NE: op_str = NE_SYMBOL; break;
            case OP_LT: op_str = LT_SYMBOL; break;
            case OP_GT: op_str = GT_SYMBOL; break;
            case OP_LE: op_str = LE_SYMBOL; break;
            case OP_GE: op_str = GE_SYMBOL; break;
            case OP_ADD: op_str = ADD_SYMBOL; break;
            case OP_SUB: op_str = SUB_SYMBOL; break;
            case OP_MUL: op_str = MUL_SYMBOL; break;
            case OP_DIV: op_str = DIV_SYMBOL; break;
            case OP_MOD: op_str = MOD_SYMBOL; break;
            case OP_NONE:
            default: op_str = NULL; break;
        }
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "left\n");
        output_expression(expression->expr_left, outfile, indent + 1, parser);
        indention(outfile, indent + 0, 1, parser);
        fprintf(outfile, "right\n");
        output_expression(expression->right, outfile, indent + 1, parser);
    }
}
static void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "type\n");
    output_name(variable->type, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "name\n");
    output_name(variable->name, outfile, indent + 1, parser);
    if (variable->value != NULL) {
        indention(outfile, indent + 0, 1, parser);
        fprintf(outfile, "value\n");
        output_expression(variable->value, outfile, indent + 1, parser);
    } else {
        indention(outfile, indent + 0, 1, parser);
        fprintf(outfile, "value: \"NULL\"\n");
    }
}
static void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser);
static void output_else_if(ElseIf* else_if, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(else_if->body);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "condition\n");
    output_expression(else_if->condition, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
static void output_if(If* if_, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(if_->body);
    List* else_if_list = list_copy(if_->else_if);
    List* else_body = list_copy(if_->else_body);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "condition\n");
    output_expression(if_->condition, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "else_if\n");
    ElseIf* else_if;
    while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
        output_else_if(else_if, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "else_body\n");
    while ((statement = (Statement*)list_pop(else_body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
static void output_for(For* for_, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(for_->body);
    if (for_->initializer != NULL) {
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "initializer\n");
        output_variable(for_->initializer, outfile, indent + 1, parser);
    } else {
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "initializer: \"NULL\"\n");
    }
    if (for_->condition != NULL) {
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "condition\n");
        output_expression(for_->condition, outfile, indent + 1, parser);
    } else {
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "condition: \"NULL\"\n");
    }
    if (for_->increment != NULL) {
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "increment\n");
        output_expression(for_->increment, outfile, indent + 1, parser);
    } else {
        indention(outfile, indent + 0, 0, parser);
        fprintf(outfile, "increment: \"NULL\"\n");
    }
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
static void output_while(While* while_, FILE* outfile, size_t indent, Parser* parser) {
    List* body = list_copy(while_->body);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "condition\n");
    output_expression(while_->condition, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
    switch (statement->type) {
        case IF_STATEMENT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "if_statement\n");
            output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
            break;
        case FOR_STATEMENT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "for_statement\n");
            output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
            break;
        case WHILE_STATEMENT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "while_statement\n");
            output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
            break;
        case VARIABLE_STATEMENT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "variable_declaration_statement\n");
            output_variable(statement->stmt.var, outfile, indent + 1, parser);
            break;
        case RETURN_STATEMENT:
            if (statement->stmt.expr == NULL) {
                indention(outfile, indent + 0, 0, parser);
                fprintf(outfile, "return_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "return_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, parser);
            break;
        case BREAK_STATEMENT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "break_statement: \"NULL\"\n");
            break;
        case CONTINUE_STATEMENT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "continue_statement: \"NULL\"\n");
            break;
        case EXPRESSION_STATEMENT:
            if (statement->stmt.expr == NULL) {
                indention(outfile, indent + 0, 0, parser);
                fprintf(outfile, "expression_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "expression_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "unknown_StatementType: %u\n", statement->type);
            break;
    }
}
static void output_function(Function* function, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "name\n");
    output_name(function->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "return_type\n");
    output_name(function->return_type, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "parameters\n");
    List* parameters = list_copy(function->parameters);
    List* body = list_copy(function->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        indention(outfile, indent + 1, 0, parser);
        fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, parser);
    }
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
static void output_method(Method* method, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "name\n");
    output_name(method->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "return_type\n");
    output_name(method->return_type, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "parameters\n");
    List* parameters = list_copy(method->parameters);
    List* body = list_copy(method->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
        indention(outfile, indent + 1, 0, parser);
        fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, parser);
    }
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != NULL)
        output_statement(statement, outfile, indent + 1, parser);
}
static void output_class_member(ClassMember* class_member, FILE* outfile, size_t indent, Parser* parser) {
    switch (class_member->type) {
        case CLASS_METHOD:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "method\n");
            output_method(class_member->content.method, outfile, indent + 1, parser);
            break;
        case CLASS_VARIABLE:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "variable\n");
            output_variable(class_member->content.variable, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "unknown_ClassMemberType: %u\n", class_member->type);
            break;
    }
}
static void output_class(Class* class, FILE* outfile, size_t indent, Parser* parser) {
    indention(outfile, indent + 0, 0, parser);
    fprintf(outfile, "name\n");
    output_name(class->name, outfile, indent + 1, parser);
    indention(outfile, indent + 0, 1, parser);
    fprintf(outfile, "members\n");
    List* members = list_copy(class->members);
    ClassMember* member;
    while ((member = (ClassMember*)list_pop(members)) != NULL)
        output_class_member(member, outfile, indent + 1, parser);
}
static void output_code_member(CodeMember* code_member, FILE* outfile, size_t indent, Parser* parser) {
    switch (code_member->type) {
        case CODE_IMPORT:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "import\n");
            output_import(code_member->content.import, outfile, indent + 1, parser);
            break;
        case CODE_FUNCTION:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "function\n");
            output_function(code_member->content.function, outfile, indent + 1, parser);
            break;
        case CODE_CLASS:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "class\n");
            output_class(code_member->content.class, outfile, indent + 1, parser);
            break;
        default:
            indention(outfile, indent + 0, 0, parser);
            fprintf(outfile, "unknown_CodeMemberType: %u\n", code_member->type);
            break;
    }
}
static void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
    List* members = list_copy(code->members);
    CodeMember* member;
    while ((member = (CodeMember*)list_pop(members)) != NULL)
        output_code_member(member, outfile, indent + 1, parser);
}
static void output_ast(FILE* file, Lexer* lexer, Parser* parser) {
    Code* ast_root = parse_code(lexer, builtin_scope, parser);
    output_code(ast_root, file, 0, parser);
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
static void rebuild_full_path(File* file) {
    string dir = get_file_dir(file);
    string dir_cstr = dir != NULL ? dir : "";
    string ext_cstr = file->extension != NULL ? file->extension : "";
    size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
    if (file->extension != NULL) path_len += strlen(ext_cstr);
    string new_path = create_string_check("", path_len + 1, 0);
    if (dir != NULL && strlen(dir_cstr) > 0)
        sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
    else
        sprintf(new_path, "%s%s", file->name, ext_cstr);
    file->path = create_string_check(new_path, strlen(new_path), 1);
}
static void parse_file(const string name, char o_token, char o_ast) {
    File* file = create_file(name);
    string filename = file->path;
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
        file->extension = create_string_check(".token", 6, 1);
        rebuild_full_path(file);
        string out_token_name = file->path;
        FILE* out_token_file = fopen(out_token_name, "w");
        if (out_token_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_token_name);
        else {
            for (Token* current = get_next_token(lexer, 0); current != 0; current = get_next_token(lexer, 0)) {
                if (current->type == EOF_TOKEN) {
                    fprintf(out_token_file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", current->line + 1, current->column + 1);
                    break;
                } else if (current->type == IDENTIFIER)
                    fprintf(out_token_file, "Token(Type: identifier,  Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                else if (current->type == INTEGER)
                    fprintf(out_token_file, "Token(Type: integer,     Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                else if (current->type == FLOAT)
                    fprintf(out_token_file, "Token(Type: float,       Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                else if (current->type == STRING)
                    fprintf(out_token_file, "Token(Type: string,      Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                else if (current->type == SYMBOL)
                    fprintf(out_token_file, "Token(Type: symbol,      Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                else if (current->type == KEYWORD)
                    fprintf(out_token_file, "Token(Type: keyword,     Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                else if (current->type == COMMENT)
                    fprintf(out_token_file, "Token(Type: comment,     Line: %zu, Column: %zu)\tLexeme: '", current->line + 1, current->column + 1);
                for (size_t i = 0; i < strlen(current->lexeme); ++i) {
                    char c = current->lexeme[i];
                    if (c == '\0')
                        fputs("\\0", out_token_file);
                    else if (c == '\n')
                        fputs("\\n", out_token_file);
                    else if (c == '\t')
                        fputs("\\t", out_token_file);
                    else if (c == '\r')
                        fputs("\\r", out_token_file);
                    else
                        fputc(c, out_token_file);
                }
                fprintf(out_token_file, "'\n");
                if (current->type == EOF_TOKEN)
                    break;
            }
            fprintf(out_token_file, "\ninfo by lib:\n    %s\n", get_info());
            fclose(out_token_file);
        }
    }
    lexer->position = 0;
    lexer->line = 0;
    lexer->column = 0;
    lexer->peeked_token = NULL;
    lexer->peeked_position = 0;
    lexer->peeked_line = 0;
    lexer->peeked_column = 0;
    lexer->current_token = NULL;
    Parser* parser = create_parser(file);
    if (o_ast) {
        file->extension = create_string_check(".ast", 4, 1);
        rebuild_full_path(file);
        string out_ast_name = file->path;
        file->extension = create_string_check(".tc", 3, 1);
        rebuild_full_path(file);
        FILE* out_ast_file = fopen(out_ast_name, "w");
        if (out_ast_file == NULL)
            fprintf(stderr, "Error opening file: %s\n", out_ast_name);
        else {
            output_ast(out_ast_file, lexer, parser);
            fclose(out_ast_file);
        }
    }
}
int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    string filename = argv[1];
    parse_file(filename, 1, 1);
    return 0;
}
// function end
