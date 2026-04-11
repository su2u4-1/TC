#if defined(__clang__)
#pragma clang diagnostic ignored "-Wempty-translation-unit"
#endif
typedef struct {
    int __count;
    union {
        short unsigned int __wch;
        unsigned char __wchb[4];
    } __value;
} _mbstate_t;
typedef struct _reent _reent;
struct __locale_t;
struct __sbuf {
    unsigned char* _base;
    int _size;
};
typedef struct {
    unsigned char* _p;
    void* _cookie;
    _reent* _data;
    void* _lock;
    unsigned char* _up;
    int (*_read)(_reent*, void*, char*, int);
    int (*_write)(_reent*, void*, const char*, int);
    long (*_seek)(_reent*, void*, long, int);
    int (*_close)(_reent*, void*);
    long _offset;
    int _r;
    int _w;
    int _lbfsize;
    int _ur;
    int _blksize;
    int _flags2;
    short _flags;
    short _file;
    struct __sbuf _ub;
    struct __sbuf _lb;
    struct __sbuf _bf;
    _mbstate_t _mbstate;
    unsigned char _ubuf[3];
    unsigned char _nbuf[1];
} FILE;
int fclose(FILE*);
int fprintf(FILE* restrict, const char* restrict, ...) __attribute__((__format__(__printf__, 2, 3)));
int printf(const char* restrict, ...) __attribute__((__format__(__printf__, 1, 2)));
int fputc(int, FILE*);
int fputs(const char* restrict, FILE* restrict);
int putc(int, FILE*);
unsigned long long fread(void* restrict, unsigned long long _size, unsigned long long _n, FILE* restrict);
int fseek(FILE*, long, int);
long ftell(FILE*);
FILE* fopen(const char* restrict _name, const char* restrict _type);
int sprintf(char* restrict, const char* restrict, ...) __attribute__((__format__(__printf__, 2, 3)));
void exit(int __status);
void free(void*);
void* malloc(unsigned long long) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1)));
double strtod(const char* restrict __n, char** restrict __end_PTR);
long long strtoll(const char* restrict __n, char** restrict __end_PTR, int __base);
void* memmove(void*, const void*, unsigned long long);
char* strcat(char* restrict, const char* restrict);
int strcmp(const char*, const char*);
char* strcpy(char* restrict, const char* restrict);
unsigned long long strlen(const char*);
int strncmp(const char*, const char*, unsigned long long);
char* strncpy(char* restrict, const char* restrict, unsigned long long);
char* strrchr(const char*, int);
char* getcwd(char* __buf, unsigned long long __size);
extern FILE* __acrt_iob_func(unsigned);
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
typedef struct Node Node;
struct Node {
    Node* next;
    unsigned long long* content;
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
    unsigned long long size;
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
    char* name;
    unsigned long long id;
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
    char* name;
    Symbol* type;
} Var;
typedef struct Arg {
    union {
        Var* variable;
        long long int_value;
        double float_value;
        char* string_value;
        char bool_value;
        Var* label;
        Var* subroutine;
    } value;
    Symbol* type;
    ArgType kind;
    char is_get;
} Arg;
typedef struct AttributeTable {
    List* attributes;
    Symbol* name;
    unsigned long long size;
} AttributeTable;
typedef struct Attribute {
    Var* var;
    Symbol* type;
    unsigned long long offset;
} Attribute;
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
        char* literal_value;
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
    char* source;
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
    char* dir;
    StrNode* next;
};
typedef struct File {
    StrNode* dirs;
    char* extension;
    char* name;
    char* path;
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
    char* lexeme;
    unsigned long long line, column;
    TokenType type;
} Token;
typedef struct Lexer {
    char* filename;
    char* source;
    unsigned long long position;
    unsigned long long length;
    unsigned long long line;
    unsigned long long column;
    Token* peeked_token;
    unsigned long long peeked_position;
    unsigned long long peeked_line;
    unsigned long long peeked_column;
    Token* current_token;
} Lexer;
typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    unsigned long long size;
    unsigned long long used;
    MemoryBlock* next;
    unsigned long long* block;
};
typedef struct Parser {
    File* source_file;
    char in_function;
    char in_method;
    char in_class;
    char in_loop;
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
    char* str;
    unsigned long long length;
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
    Class* current_class;
    List* end_labels;
    List* start_labels;
    unsigned long long attr_count;
    unsigned long long param_count;
    unsigned long long var_count;
    unsigned long long temp_count;
    unsigned long long block_count;
    unsigned long long subroutine_count;
} TACStatus;
static char initialized = 0;
static char* keywordStrings[22] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var"};
static char* symbolStrings[30] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
static MemoryBlock* string_memory = ((void*)0);
static MemoryBlock* struct_memory = ((void*)0);
static unsigned long long memoryBlockCount = 0;
static unsigned long long string_memory_count = 0;
static unsigned long long string_memory_used = 0;
static unsigned long long struct_memory_count = 0;
static unsigned long long struct_memory_used = 0;
static char* DEFAULT_CONSTRUCTOR_NAME = ((void*)0);
static char* DEFAULT_INIT_NAME = ((void*)0);
static char* keywordList[22] = {0};
static char* symbolList[30] = {0};
static StringList* all_string_list = ((void*)0);
static Symbol* name_bool = ((void*)0);
static Symbol* name_float = ((void*)0);
static Symbol* name_int = ((void*)0);
static Symbol* name_string = ((void*)0);
static Symbol* name_void = ((void*)0);
static SymbolTable* builtin_scope = ((void*)0);
static Arg* create_arg(ArgType kind, void* value);
static Arg* load_rvalue(Arg* arg, TACStatus* status);
static Arg* tac_expression(Expression* expression, TACStatus* status);
static Arg* tac_primary(Primary* primary, TACStatus* status);
static Arg* tac_variable_access(VariableAccess* variable_access, TACStatus* status);
static Attribute* create_attribute(Symbol* var, Symbol* type, AttributeTable* table, unsigned long long offset, TACStatus* status);
static AttributeTable* create_attribute_table(Symbol* name);
static Block* create_block(Var* label);
static char get_current_char(Lexer* lexer);
static char is_keyword(char* str);
static char peek_next_char(Lexer* lexer);
static Class* create_class_use_ptr(Class* class, Symbol* name, List* members, SymbolTable* class_scope, unsigned long long size);
static Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content);
static Code* create_code(List* members, SymbolTable* global_scope);
static Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content);
static ElseIf* create_else_if(Expression* condition, List* body);
static Expression* create_expression(OperatorType operator, Expression * expr_left, Primary* prim_left, Expression* right);
static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser);
static Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static File* create_file(char* path);
static For* create_for(Variable* initializer, Expression* condition, Expression* increment, List* body);
static For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* function_scope);
static Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static If* create_if(Expression* condition, List* body, List* else_if, List* else_body);
static If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Import* create_import(Symbol* name, char* source);
static Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3);
static InstructionType get_instruction_type(OperatorType op);
static int operator_precedence(OperatorType op);
static Lexer* create_lexer(char* source, unsigned long long length, char* filename);
static List* create_list(void);
static List* list_copy(List* original);
static MemoryBlock* create_memory_block(unsigned long long size);
static Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* method_scope);
static Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser);
static Node* create_node(unsigned long long* content);
static OperatorType string_to_operator(char* str);
static Parser* create_parser(File* file);
static unsigned long long* alloc_memory(unsigned long long size);
static unsigned long long* list_pop_back(List* list);
static unsigned long long* list_pop(List* list);
static Primary* create_primary(PrimaryType type, char* str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value);
static Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static unsigned long long get_type_size(Symbol* type);
static Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt);
static Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static char* absolute_path(char* path, char* base_path);
static char* alloc_big_memory(unsigned long long size);
static char* create_string_check(char* data, unsigned long long length, char check);
static char* get_file_dir(File* path);
static char* get_info(void);
static char* make_method_name(char* class_name, char* method_name);
static char* operator_to_string(OperatorType op);
static char* read_source(FILE* file, unsigned long long* length);
static Subroutine* create_subroutine(Symbol* name, Symbol* return_type);
static Symbol* create_symbol(char* name, SymbolType kind, Symbol* type, void* ast_node);
static Symbol* parse_import_file(char* import_name, char* source, SymbolTable* scope, File* source_file);
static Symbol* search_name_use_strcmp(SymbolTable* scope, char* name);
static Symbol* search_name(SymbolTable* scope, char* name);
static SymbolTable* create_symbol_table(SymbolTable* parent);
static TAC* create_tac(void);
static TAC* tac_code(Code* code);
static TACStatus* create_tac_status(TAC* tac);
static Token* create_token(TokenType type, char* lexeme, unsigned long long line, unsigned long long column);
static Token* get_next_token(Lexer* lexer, char skip_comment);
static Token* next_token(Lexer* lexer, char skip_comment);
static Token* peek_next_token(Lexer* lexer, char skip_comment);
static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status);
static Var* search_var(Symbol* original_name, TACStatus* status);
static Variable* create_variable(Symbol* type, Symbol* name, Expression* value);
static Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, List* args_content);
static VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
static void change_file_extension(File* file, char* new_extension);
static void increase_memory_size(char for_struct);
static void indention(FILE* out, unsigned long long indent, char is_last, char indent_has_next[32]);
static void init(void);
static void list_append(List* list, unsigned long long* item);
static void move_position(Lexer* lexer, int count);
static void normalize_path(File* file);
static void output_arg(Arg* arg, FILE* outfile);
static void output_ast(FILE* file, Code* ast);
static void output_ast(FILE* file, Code* ast);
static void output_attribute_table(AttributeTable* attribute_table, FILE* outfile, unsigned long long indent);
static void output_attribute(Attribute* attribute, FILE* outfile, unsigned long long indent);
static void output_block(Block* block, FILE* outfile, unsigned long long indent);
static void output_class_member(ClassMember* class_member, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_class(Class* class, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_code_member(CodeMember* code_member, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_code(Code* code, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_else_if(ElseIf* else_if, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_expression(Expression* expression, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_for(For* for_, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_function(Function* function, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_if(If* if_, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_import(Import* import, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_instruction(Instruction* instruction, FILE* outfile, unsigned long long indent);
static void output_method(Method* method, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_name(Symbol* name, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_one_token(FILE* file, Token* token);
static void output_primary(Primary* primary, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_statement(Statement* statement, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_subroutine(Subroutine* subroutine, FILE* outfile, unsigned long long indent);
static void output_tac(FILE* file, TAC* tac);
static void output_TAC(TAC* tac, FILE* outfile, unsigned long long indent);
static void output_token(FILE* file, Lexer* lexer);
static void output_var(Var* var, FILE* outfile, unsigned long long indent);
static void output_variable_access(VariableAccess* variable_access, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_variable(Variable* variable, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void output_while(While* while_, FILE* outfile, unsigned long long indent, char indent_has_next[32]);
static void parse_file(char* name, char o_token, char o_ast, char o_tac);
static void rebuild_full_path(File* file);
static void reset_lexer(Lexer* lexer);
static void tac_class(Class* class, TACStatus* status);
static void tac_for(For* for_, TACStatus* status);
static void tac_function(Function* function, TACStatus* status);
static void tac_if(If* if_, TACStatus* status);
static void tac_import(Import* import, TAC* tac, TACStatus* status);
static void tac_method(Method* method, TACStatus* status);
static void tac_statement(Statement* statement, TACStatus* status);
static void tac_variable(Variable* variable, TACStatus* status, char is_attr);
static void tac_while(While* while_, TACStatus* status);
static While* create_while(Expression* condition, List* body);
static While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser);
void increase_memory_size(char for_struct) {
    MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
    if (new_block == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Fatal: Cannot allocate memory\n");
        MemoryBlock* current = string_memory;
        while (current != ((void*)0)) {
            MemoryBlock* next = current->next;
            free(current->block);
            free(current);
            current = next;
        }
        initialized = 0;
        exit(1);
    }
    new_block->block = (unsigned long long*)malloc(1024);
    new_block->size = 1024;
    new_block->used = 0;
    new_block->next = ((void*)0);
    if (for_struct) {
        struct_memory_used += struct_memory->used;
        new_block->next = struct_memory;
        struct_memory = new_block;
        struct_memory_count += 1024;
    } else {
        string_memory_used += string_memory->used;
        new_block->next = string_memory;
        string_memory = new_block;
        string_memory_count += 1024;
    }
}
char* alloc_big_memory(unsigned long long size) {
    string_memory_count += size;
    string_memory_used += size;
    char* block = (char*)malloc(size);
    fprintf((__acrt_iob_func(2u)), "Info: Allocate big memory block of size %zu bytes\n", size);
    if (block == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Fatal: Cannot allocate memory\n");
        exit(1);
    }
    return block;
}
char* create_string_check(char* data, unsigned long long length, char check) {
    if (!initialized) init();
    if (data == ((void*)0) || length == 0) return 0;
    if (check) {
        StringList* current = all_string_list;
        char* existing = ((void*)0);
        while (current != ((void*)0)) {
            if (current->length == length && current->str != ((void*)0) && strncmp(current->str, data, length) == 0)
                existing = current->str;
            current = current->next;
        }
        if (existing != ((void*)0))
            return existing;
    }
    char* str;
    if (length >= 1024 - 1)
        str = alloc_big_memory(length + 1);
    else {
        if (string_memory->used + length >= string_memory->size)
            increase_memory_size(0);
        str = (char*)string_memory->block + string_memory->used;
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
MemoryBlock* create_memory_block(unsigned long long size) {
    MemoryBlock* new_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
    if (new_memory == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Fatal: Cannot allocate memory\n");
        initialized = 0;
        exit(1);
    }
    new_memory->block = (unsigned long long*)malloc(size);
    new_memory->size = size;
    new_memory->used = 0;
    new_memory->next = ((void*)0);
    return new_memory;
}
void init(void) {
    if (initialized) return;
    if (struct_memory == ((void*)0)) {
        struct_memory = create_memory_block(1024);
        struct_memory_count = 1024;
    }
    if (string_memory == ((void*)0)) {
        string_memory = create_memory_block(1024);
        string_memory_count = 1024;
    }
    initialized = 1;
    for (unsigned long long i = 0; i < 22; ++i)
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
    for (unsigned long long i = 0; i < 30; ++i)
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
    DEFAULT_INIT_NAME = create_string_check("init", 4, 0);
    DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, 0);
}
unsigned long long* alloc_memory(unsigned long long size) {
    if (!initialized) init();
    size = (size + sizeof(unsigned long long) - 1) & ~(sizeof(unsigned long long) - 1);
    if (struct_memory->used + size >= struct_memory->size)
        increase_memory_size(1);
    if (struct_memory->used % sizeof(unsigned long long) != 0) {
        fprintf((__acrt_iob_func(2u)), "Fatal: Memory allocation is not aligned, used: %zu bytes\n", struct_memory->used);
        initialized = 0;
        exit(1);
    }
    unsigned long long* ptr = struct_memory->block + (struct_memory->used / sizeof(unsigned long long));
    struct_memory->used += size;
    ++memoryBlockCount;
    return ptr;
}
char is_keyword(char* str) {
    if (!initialized) init();
    for (unsigned long long i = 0; i < 22; ++i)
        if (str == keywordList[i])
            return 1;
    return 0;
}
char* get_info(void) {
    unsigned long long stringCount = 0;
    StringList* current = all_string_list;
    while (current != ((void*)0)) {
        stringCount++;
        current = current->next;
    }
    char* struct_memory_used_str = create_string_check("", 48, 0);
    sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
    char* string_memory_used_str = create_string_check("", 48, 0);
    sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
    char* info = (char*)create_string_check("", 240, 0);
    sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", 2, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
    return info;
}
CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
    CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
    code_member->type = type;
    if (type == CODE_IMPORT && import_content != ((void*)0))
        code_member->content.import = import_content;
    else if (type == CODE_FUNCTION && function_content != ((void*)0))
        code_member->content.function = function_content;
    else if (type == CODE_CLASS && class_content != ((void*)0))
        code_member->content.class = class_content;
    else if (import_content == ((void*)0) && function_content == ((void*)0) && class_content == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "Error creating code member: content is NULL\n");
    else
        fprintf((__acrt_iob_func(2u)), "Error creating code member: unknown type %d\n", type);
    return code_member;
}
Code* create_code(List* members, SymbolTable* global_scope) {
    Code* code = (Code*)alloc_memory(sizeof(Code));
    code->members = members;
    code->global_scope = global_scope;
    return code;
}
Import* create_import(Symbol* name, char* source) {
    if (name == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating import: name is NULL\n");
        return ((void*)0);
    }
    Import* import = (Import*)alloc_memory(sizeof(Import));
    import->name = name;
    import->source = source;
    return import;
}
Function* create_function_use_ptr(Function* function, Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* function_scope) {
    if (name == ((void*)0) || return_type == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating function: name or return_type is NULL\n");
        return ((void*)0);
    }
    function->name = name;
    function->return_type = return_type;
    function->parameters = parameters;
    function->body = body;
    function->function_scope = function_scope;
    return function;
}
Method* create_method_use_ptr(Method* method, Symbol* name, Symbol* return_type, List* parameters, List* body, SymbolTable* method_scope) {
    if (name == ((void*)0) || return_type == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating method: name or return_type is NULL\n");
        return ((void*)0);
    }
    method->name = name;
    method->return_type = return_type;
    method->parameters = parameters;
    method->body = body;
    method->method_scope = method_scope;
    return method;
}
ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
    class_member->type = type;
    if (type == CLASS_METHOD && method_content != ((void*)0))
        class_member->content.method = method_content;
    else if (type == CLASS_VARIABLE && variable_content != ((void*)0))
        class_member->content.variable = variable_content;
    else {
        if (method_content == ((void*)0) && variable_content == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error creating class member: content is NULL\n");
        else
            fprintf((__acrt_iob_func(2u)), "Error creating class member: unknown type %d\n", type);
        return ((void*)0);
    }
    return class_member;
}
Class* create_class_use_ptr(Class* class, Symbol* name, List* members, SymbolTable* class_scope, unsigned long long size) {
    if (name == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating class: name is NULL\n");
        return ((void*)0);
    }
    class->name = name;
    class->members = members;
    class->class_scope = class_scope;
    class->size = size;
    return class;
}
Variable* create_variable(Symbol* type, Symbol* name, Expression* value) {
    if (type == ((void*)0) || name == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating variable: type or name is NULL\n");
        return ((void*)0);
    }
    Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
    variable->type = type;
    variable->name = name;
    variable->value = value;
    return variable;
}
Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
    Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
    statement->type = type;
    if (type == EXPRESSION_STATEMENT && expr != ((void*)0))
        statement->stmt.expr = expr;
    else if (type == VARIABLE_STATEMENT && var_stmt != ((void*)0))
        statement->stmt.var = var_stmt;
    else if (type == IF_STATEMENT && if_stmt != ((void*)0))
        statement->stmt.if_stmt = if_stmt;
    else if (type == WHILE_STATEMENT && while_stmt != ((void*)0))
        statement->stmt.while_stmt = while_stmt;
    else if (type == FOR_STATEMENT && for_stmt != ((void*)0))
        statement->stmt.for_stmt = for_stmt;
    else if (type == RETURN_STATEMENT)
        statement->stmt.return_expr = expr;
    else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
        statement->stmt.expr = ((void*)0);
    else {
        if (if_stmt == ((void*)0) && while_stmt == ((void*)0) && for_stmt == ((void*)0) && expr == ((void*)0) && var_stmt == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error creating statement: content is NULL\n");
        else
            fprintf((__acrt_iob_func(2u)), "Error creating statement: unknown type %d\n", type);
        return ((void*)0);
    }
    return statement;
}
If* create_if(Expression* condition, List* body, List* else_if, List* else_body) {
    if (condition == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating if statement: condition is NULL\n");
        return ((void*)0);
    }
    If* if_ = (If*)alloc_memory(sizeof(If));
    if_->condition = condition;
    if_->body = body;
    if_->else_if = else_if;
    if_->else_body = else_body;
    return if_;
}
ElseIf* create_else_if(Expression* condition, List* body) {
    if (condition == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error creating else-if statement: condition is NULL\n");
        return ((void*)0);
    }
    ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
    else_if->condition = condition;
    else_if->body = body;
    return else_if;
}
For* create_for(Variable* initializer, Expression* condition, Expression* increment, List* body) {
    For* for_ = (For*)alloc_memory(sizeof(For));
    for_->initializer = initializer;
    for_->condition = condition;
    for_->increment = increment;
    for_->body = body;
    return for_;
}
While* create_while(Expression* condition, List* body) {
    While* while_ = (While*)alloc_memory(sizeof(While));
    while_->condition = condition;
    while_->body = body;
    return while_;
}
Expression* create_expression(OperatorType operator, Expression * expr_left, Primary* prim_left, Expression* right) {
    if ((operator== OP_NONE) != (right == ((void*)0)) || (expr_left == ((void*)0) && prim_left == ((void*)0))) {
        fprintf((__acrt_iob_func(2u)), "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
                                       operator== OP_NONE ? "true" : "false",
                expr_left == ((void*)0) ? "true" : "false",
                prim_left == ((void*)0) ? "true" : "false",
                right == ((void*)0) ? "true" : "false");
        return ((void*)0);
    }
    Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
    expression->operator= operator;
    if (expr_left != ((void*)0))
        expression->expr_left = expr_left;
    else if (prim_left != ((void*)0))
        expression->prim_left = prim_left;
    else {
        fprintf((__acrt_iob_func(2u)), "Error creating expression: both expr_left and prim_left are NULL\n");
        return ((void*)0);
    }
    expression->right = right;
    return expression;
}
Primary* create_primary(PrimaryType type, char* str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
    primary->type = type;
    if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != ((void*)0))
        primary->value.literal_value = str_value;
    else if (type == PRIM_EXPRESSION && expr_value != ((void*)0))
        primary->value.expr = expr_value;
    else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != ((void*)0))
        primary->value.operand = prim_value;
    else if (type == PRIM_VARIABLE_ACCESS && variable_value != ((void*)0))
        primary->value.var = variable_value;
    else {
        if (str_value == ((void*)0) && expr_value == ((void*)0) && prim_value == ((void*)0) && variable_value == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error creating primary: value is NULL\n");
        else
            fprintf((__acrt_iob_func(2u)), "Error creating primary: unknown type %d\n", type);
        return ((void*)0);
    }
    return primary;
}
VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Symbol* name_content, Expression* expr_content, List* args_content) {
    if ((base == ((void*)0)) != (type == VAR_NAME)) {
        fprintf((__acrt_iob_func(2u)), "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == ((void*)0) ? "true" : "false", type == VAR_NAME ? "true" : "false");
        return ((void*)0);
    }
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
    variable_access->type = type;
    variable_access->base = base;
    if (type == VAR_NAME && name_content != ((void*)0))
        variable_access->content.name = name_content;
    else if (type == VAR_FUNC_CALL && args_content != ((void*)0))
        variable_access->content.args = args_content;
    else if (type == VAR_GET_SEQ && expr_content != ((void*)0))
        variable_access->content.index = expr_content;
    else if (type == VAR_GET_ATTR && name_content != ((void*)0))
        variable_access->content.attr_name = name_content;
    else {
        if (name_content == ((void*)0) && expr_content == ((void*)0) && args_content == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error creating variable access: content is NULL\n");
        else
            fprintf((__acrt_iob_func(2u)), "Error creating variable access: unknown type %d\n", type);
        return ((void*)0);
    }
    return variable_access;
}
char* read_source(FILE* file, unsigned long long* length) {
    fseek(file, 0, 2);
    *length = (unsigned long long)ftell(file);
    fseek(file, 0, 0);
    char* source = create_string_check("", *length + 1, 0);
    unsigned long long bytes_read = fread(source, 1, *length, file);
    source[bytes_read] = '\0';
    *length = bytes_read;
    for (unsigned long long i = 0; i < *length; ++i) {
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
    for (unsigned long long i = 0; i < strlen(token->lexeme); ++i) {
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
void output_ast(FILE* file, Code* ast) {
    char indent_has_next[32];
    output_code(ast, file, 0, indent_has_next);
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
void output_tac(FILE* file, TAC* tac) {
    output_TAC(tac, file, 0);
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
}
void parse_file(char* name, char o_token, char o_ast, char o_tac) {
    File* file = create_file(name);
    char* filename = file->path;
    unsigned long long length = 0;
    FILE* source_file = fopen(filename, "r");
    if (source_file == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error opening file: %s\n", filename);
        return;
    }
    char* source = read_source(source_file, &length);
    fclose(source_file);
    Lexer* lexer = create_lexer(source, length, filename);
    if (o_token) {
        change_file_extension(file, create_string_check(".token", 6, 1));
        char* out_token_name = file->path;
        FILE* out_token_file = fopen(out_token_name, "w");
        if (out_token_file == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error opening file: %s\n", out_token_name);
        else {
            output_token(out_token_file, lexer);
            fclose(out_token_file);
        }
    }
    reset_lexer(lexer);
    Parser* parser = create_parser(file);
    Code* ast = ((void*)0);
    if (o_ast || o_tac)
        ast = parse_code(lexer, builtin_scope, parser);
    if (o_ast) {
        change_file_extension(file, create_string_check(".ast", 4, 1));
        char* out_ast_name = file->path;
        change_file_extension(file, create_string_check(".tc", 3, 1));
        FILE* out_ast_file = fopen(out_ast_name, "w");
        if (out_ast_file == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error opening file: %s\n", out_ast_name);
        else {
            output_ast(out_ast_file, ast);
            fclose(out_ast_file);
        }
    }
    if (o_tac) {
        change_file_extension(file, create_string_check(".tac", 4, 1));
        char* out_tac_name = file->path;
        change_file_extension(file, create_string_check(".tc", 3, 1));
        FILE* out_tac_file = fopen(out_tac_name, "w");
        if (out_tac_file == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "Error opening file: %s\n", out_tac_name);
        else {
            TAC* tac = tac_code(ast);
            output_tac(out_tac_file, tac);
            fclose(out_tac_file);
        }
    }
}
List* create_list(void) {
    List* new_list = (List*)alloc_memory(sizeof(List));
    new_list->head = ((void*)0);
    new_list->tail = ((void*)0);
    return new_list;
}
Node* create_node(unsigned long long* content) {
    Node* new_node = (Node*)alloc_memory(sizeof(Node));
    new_node->next = ((void*)0);
    new_node->content = content;
    return new_node;
}
void list_append(List* list, unsigned long long* item) {
    if (list == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error: list_append received NULL list\n");
        return;
    }
    Node* new_node = create_node(item);
    if (list->head == ((void*)0)) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
}
List* list_copy(List* original) {
    if (original == ((void*)0))
        return ((void*)0);
    List* new_list = create_list();
    new_list->head = original->head;
    new_list->tail = original->tail;
    return new_list;
}
unsigned long long* list_pop(List* list) {
    if (list == ((void*)0) || list->head == ((void*)0))
        return ((void*)0);
    Node* head_node = list->head;
    list->head = head_node->next;
    if (list->head == ((void*)0))
        list->tail = ((void*)0);
    return head_node->content;
}
unsigned long long* list_pop_back(List* list) {
    if (list == ((void*)0) || list->head == ((void*)0))
        return ((void*)0);
    if (list->head == list->tail) {
        unsigned long long* content = list->head->content;
        list->head = ((void*)0);
        list->tail = ((void*)0);
        return content;
    }
    Node* current = list->head;
    while (current->next != list->tail)
        current = current->next;
    unsigned long long* content = list->tail->content;
    current->next = ((void*)0);
    list->tail = current;
    return content;
}
Symbol* create_symbol(char* name, SymbolType kind, Symbol* type, void* ast_node) {
    static unsigned long long id_counter = 0;
    SymbolTable* scope = ((void*)0);
    switch (kind) {
        case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
        case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
        case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
        case SYMBOL_VARIABLE:
        case SYMBOL_PARAM:
        case SYMBOL_ATTRIBUTE:
        case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
        default:
            fprintf((__acrt_iob_func(2u)), "[Warning] Creating symbol with unknown SymbolType: %d\n", kind);
            break;
    }
    Symbol* result = search_name(scope, name);
    if (result != ((void*)0))
        fprintf((__acrt_iob_func(2u)), "[Warning] Name '%s' already exists in the current scope, kind: %d, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
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
            fprintf((__acrt_iob_func(2u)), "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %d\n", kind);
            break;
    }
    if (scope == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "[Warning] Creating symbol '%s' with NULL scope, kind: %d, id: %zu\n", name, kind, new_name->id);
    else
        list_append(scope->symbols, (unsigned long long*)new_name);
    return new_name;
}
SymbolTable* create_symbol_table(SymbolTable* parent) {
    SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
    new_scope->parent = parent;
    new_scope->symbols = create_list();
    return new_scope;
}
Symbol* search_name_use_strcmp(SymbolTable* scope, char* name) {
    while (scope != ((void*)0)) {
        List* names = scope->symbols;
        Node* current = names->head;
        while (current != ((void*)0)) {
            Symbol* current_name = (Symbol*)current->content;
            if (strcmp(current_name->name, name) == 0)
                return current_name;
            current = current->next;
        }
        scope = scope->parent;
    }
    return ((void*)0);
}
Symbol* search_name(SymbolTable* scope, char* name) {
    while (scope != ((void*)0)) {
        List* names = scope->symbols;
        Node* current = names->head;
        while (current != ((void*)0)) {
            Symbol* current_name = (Symbol*)current->content;
            if (current_name->name == name)
                return current_name;
            current = current->next;
        }
        scope = scope->parent;
    }
    return ((void*)0);
}
void indention(FILE* out, unsigned long long indent, char is_last, char indent_has_next[32]) {
    indent_has_next[indent / 8] = (char)(!is_last ? (indent_has_next[indent / 8] | (1 << (indent % 8))) : (indent_has_next[indent / 8] & ~(1 << (indent % 8))));
    for (unsigned long long i = 1; i < indent; ++i)
        fprintf(out, (indent_has_next[i / 8] & (1 << (i % 8))) != 0 ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}
Parser* create_parser(File* file) {
    Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
    new_parser->in_function = 0;
    new_parser->in_method = 0;
    new_parser->in_loop = 0;
    new_parser->source_file = file;
    return new_parser;
}
Symbol* parse_import_file(char* import_name, char* source, SymbolTable* scope, File* source_file) {
    Symbol* name = ((void*)0);
    FILE* openfile;
    char* filename;
    if (source == ((void*)0)) {
        char* temp_import_name = create_string_check("", strlen(import_name) + 4, 0);
        sprintf(temp_import_name, "%s.tc", import_name);
        filename = absolute_path(temp_import_name, "D:/TC/std/");
    } else
        filename = absolute_path(source, get_file_dir(source_file));
    openfile = fopen(filename, "r");
    if (openfile == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error opening library file for import: %s\n", filename);
        return ((void*)0);
    }
    fprintf((__acrt_iob_func(2u)), "Info: Starting parsing lib file for import: %s\n", filename);
    unsigned long long length = 0;
    char* source_code = read_source(openfile, &length);
    fclose(openfile);
    Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
    fprintf((__acrt_iob_func(2u)), "Info: Finished parsing lib file for import: %s\n", filename);
    if (code == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "Error parsing library file for import: %s\n", filename);
        return ((void*)0);
    }
    name = search_name_use_strcmp(code->global_scope, import_name);
    if (name != ((void*)0))
        list_append(scope->symbols, (unsigned long long*)name);
    else
        fprintf((__acrt_iob_func(2u)), "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
    return name;
}
char* make_method_name(char* class_name, char* method_name) {
    char* name = create_string_check("", strlen(class_name) + strlen(method_name) + 2, 1);
    sprintf(name, "%s.%s", class_name, method_name);
    return name;
}
OperatorType string_to_operator(char* str) {
    if (str == symbolList[18]) return OP_ASSIGN;
    else if (str == symbolList[23]) return OP_ADD_ASSIGN;
    else if (str == symbolList[24]) return OP_SUB_ASSIGN;
    else if (str == symbolList[25]) return OP_MUL_ASSIGN;
    else if (str == symbolList[26]) return OP_DIV_ASSIGN;
    else if (str == symbolList[27]) return OP_MOD_ASSIGN;
    else if (str == symbolList[28]) return OP_AND;
    else if (str == symbolList[29]) return OP_OR;
    else if (str == symbolList[19]) return OP_EQ;
    else if (str == symbolList[20]) return OP_NE;
    else if (str == symbolList[16]) return OP_LT;
    else if (str == symbolList[17]) return OP_GT;
    else if (str == symbolList[21]) return OP_LE;
    else if (str == symbolList[22]) return OP_GE;
    else if (str == symbolList[11]) return OP_ADD;
    else if (str == symbolList[12]) return OP_SUB;
    else if (str == symbolList[13]) return OP_MUL;
    else if (str == symbolList[14]) return OP_DIV;
    else if (str == symbolList[15]) return OP_MOD;
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
char* operator_to_string(OperatorType op) {
    switch (op) {
        case OP_ASSIGN: return symbolList[18];
        case OP_ADD_ASSIGN: return symbolList[23];
        case OP_SUB_ASSIGN: return symbolList[24];
        case OP_MUL_ASSIGN: return symbolList[25];
        case OP_DIV_ASSIGN: return symbolList[26];
        case OP_MOD_ASSIGN: return symbolList[27];
        case OP_AND: return symbolList[28];
        case OP_OR: return symbolList[29];
        case OP_EQ: return symbolList[19];
        case OP_NE: return symbolList[20];
        case OP_LT: return symbolList[16];
        case OP_GT: return symbolList[17];
        case OP_LE: return symbolList[21];
        case OP_GE: return symbolList[22];
        case OP_ADD: return symbolList[11];
        case OP_SUB: return symbolList[12];
        case OP_MUL: return symbolList[13];
        case OP_DIV: return symbolList[14];
        case OP_MOD: return symbolList[15];
        case OP_NONE:
        default: return ((void*)0);
    }
}
Lexer* create_lexer(char* source, unsigned long long length, char* filename) {
    Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer));
    lexer->source = source;
    lexer->position = 0;
    lexer->length = length;
    lexer->line = 0;
    lexer->column = 0;
    lexer->peeked_token = ((void*)0);
    lexer->peeked_position = 0;
    lexer->peeked_line = 0;
    lexer->peeked_column = 0;
    lexer->current_token = ((void*)0);
    lexer->filename = filename;
    return lexer;
}
Token* create_token(TokenType type, char* lexeme, unsigned long long line, unsigned long long column) {
    Token* token = (Token*)alloc_memory(sizeof(Token));
    token->type = type;
    token->lexeme = lexeme;
    token->line = line;
    token->column = column;
    return token;
}
char get_current_char(Lexer* lexer) {
    if (lexer->position >= lexer->length)
        return '\0';
    lexer->column++;
    return lexer->source[lexer->position++];
}
char peek_next_char(Lexer* lexer) {
    if (lexer->position >= lexer->length)
        return '\0';
    return lexer->source[lexer->position];
}
void move_position(Lexer* lexer, int count) {
    if (count >= 0) {
        lexer->position += (unsigned long long)count;
        lexer->column += (unsigned long long)count;
    } else {
        lexer->position -= (unsigned long long)(-count);
        lexer->column -= (unsigned long long)(-count);
    }
}
Token* next_token(Lexer* lexer, char skip_comment) {
    char c = get_current_char(lexer);
    if (c == '\0')
        return create_token(EOF_TOKEN, ((void*)0), lexer->line, lexer->column);
    else if (c == ' ' || c == '\t' || c == '\r')
        return next_token(lexer, skip_comment);
    else if (c == '\n') {
        (void)(lexer->line++), lexer->column = 0;
        return next_token(lexer, skip_comment);
    } else if (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || c == '_') {
        unsigned long long start = lexer->position - 1;
        unsigned long long column_start = lexer->column - 1;
        while (('a' <= c && c <= 'z') || ('A' <= c && c <= 'Z') || ('0' <= c && c <= '9') || c == '_')
            c = get_current_char(lexer);
        move_position(lexer, -1);
        char* content = create_string_check(&lexer->source[start], lexer->position - start, 1);
        if (is_keyword(content))
            return create_token(KEYWORD, content, lexer->line, column_start);
        else
            return create_token(IDENTIFIER, content, lexer->line, column_start);
    } else if ('0' <= c && c <= '9') {
        unsigned long long start = lexer->position - 1;
        unsigned long long column_start = lexer->column - 1;
        while ('0' <= c && c <= '9')
            c = get_current_char(lexer);
        TokenType type = INTEGER;
        char p = peek_next_char(lexer);
        if (c == '.' && ('0' <= p && p <= '9')) {
            c = get_current_char(lexer);
            while ('0' <= c && c <= '9')
                c = get_current_char(lexer);
            type = FLOAT;
        }
        move_position(lexer, -1);
        return create_token(type, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
    } else if (c == '"') {
        unsigned long long start = lexer->position;
        unsigned long long column_start = lexer->column - 1;
        c = get_current_char(lexer);
        while (c != '"' && c != '\0' && c != '\n')
            c = get_current_char(lexer);
        if (c != '"') {
            fprintf((__acrt_iob_func(2u)), "[Lexer Error] at %s:%zu:%zu: Unterminated string literal\n", lexer->filename, lexer->line + 1, start);
            if (c == '\n') (void)(lexer->line++), lexer->column = 0;
        }
        if (lexer->position - start == 1)
            return create_token(STRING, create_string_check("\0", 1, 1), lexer->line, column_start);
        return create_token(STRING, create_string_check(&lexer->source[start], lexer->position - start - 1, 1), lexer->line, column_start);
    } else {
        char p = peek_next_char(lexer);
        if (c == '/' && p == '/') {
            unsigned long long start = lexer->position + 1;
            unsigned long long column_start = lexer->column - 1;
            while (c != '\n' && c != '\0')
                c = get_current_char(lexer);
            move_position(lexer, -1);
            if (skip_comment)
                return next_token(lexer, skip_comment);
            return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
        } else if (c == '/' && p == '*') {
            unsigned long long start = lexer->position + 1;
            unsigned long long column_start = lexer->column - 1;
            while (!(c == '*' && p == '/')) {
                c = get_current_char(lexer);
                p = peek_next_char(lexer);
                if (c == '\n') (void)(lexer->line++), lexer->column = 0;
                if (p == '\0') break;
                if (c == '\0') {
                    fprintf((__acrt_iob_func(2u)), "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
                    if (skip_comment)
                        return next_token(lexer, skip_comment);
                    return create_token(COMMENT, create_string_check(&lexer->source[start], lexer->position - start, 1), lexer->line, column_start);
                }
            }
            if (p == '\0') {
                if (c == '\0') move_position(lexer, -1);
                fprintf((__acrt_iob_func(2u)), "[Lexer Error] at %s:%zu:%zu: Unterminated comment\n", lexer->filename, lexer->line + 1, start + 1);
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
            return create_token(SYMBOL, symbolList[19], lexer->line, lexer->column - 2);
        } else if (c == '!' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[20], lexer->line, lexer->column - 2);
        } else if (c == '<' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[21], lexer->line, lexer->column - 2);
        } else if (c == '>' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[22], lexer->line, lexer->column - 2);
        } else if (c == '+' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[23], lexer->line, lexer->column - 2);
        } else if (c == '-' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[24], lexer->line, lexer->column - 2);
        } else if (c == '*' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[25], lexer->line, lexer->column - 2);
        } else if (c == '/' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[26], lexer->line, lexer->column - 2);
        } else if (c == '%' && p == '=') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[27], lexer->line, lexer->column - 2);
        } else if (c == '&' && p == '&') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[28], lexer->line, lexer->column - 2);
        } else if (c == '|' && p == '|') {
            get_current_char(lexer);
            return create_token(SYMBOL, symbolList[29], lexer->line, lexer->column - 2);
        } else if (c == '(')
            return create_token(SYMBOL, symbolList[0], lexer->line, lexer->column - 1);
        else if (c == ')')
            return create_token(SYMBOL, symbolList[1], lexer->line, lexer->column - 1);
        else if (c == '{')
            return create_token(SYMBOL, symbolList[2], lexer->line, lexer->column - 1);
        else if (c == '}')
            return create_token(SYMBOL, symbolList[3], lexer->line, lexer->column - 1);
        else if (c == ',')
            return create_token(SYMBOL, symbolList[4], lexer->line, lexer->column - 1);
        else if (c == '!')
            return create_token(SYMBOL, symbolList[5], lexer->line, lexer->column - 1);
        else if (c == '.')
            return create_token(SYMBOL, symbolList[6], lexer->line, lexer->column - 1);
        else if (c == '[')
            return create_token(SYMBOL, symbolList[7], lexer->line, lexer->column - 1);
        else if (c == ']')
            return create_token(SYMBOL, symbolList[8], lexer->line, lexer->column - 1);
        else if (c == ';')
            return create_token(SYMBOL, symbolList[9], lexer->line, lexer->column - 1);
        else if (c == '_')
            return create_token(SYMBOL, symbolList[10], lexer->line, lexer->column - 1);
        else if (c == '+')
            return create_token(SYMBOL, symbolList[11], lexer->line, lexer->column - 1);
        else if (c == '-')
            return create_token(SYMBOL, symbolList[12], lexer->line, lexer->column - 1);
        else if (c == '*')
            return create_token(SYMBOL, symbolList[13], lexer->line, lexer->column - 1);
        else if (c == '/')
            return create_token(SYMBOL, symbolList[14], lexer->line, lexer->column - 1);
        else if (c == '%')
            return create_token(SYMBOL, symbolList[15], lexer->line, lexer->column - 1);
        else if (c == '<')
            return create_token(SYMBOL, symbolList[16], lexer->line, lexer->column - 1);
        else if (c == '>')
            return create_token(SYMBOL, symbolList[17], lexer->line, lexer->column - 1);
        else if (c == '=')
            return create_token(SYMBOL, symbolList[18], lexer->line, lexer->column - 1);
        else {
            fprintf((__acrt_iob_func(2u)), "[Lexer Error] at %s:%zu:%zu: Unexpected character\n", lexer->filename, lexer->line + 1, lexer->column);
            return create_token(EOF_TOKEN, ((void*)0), 0, 0);
        }
    }
}
Token* get_next_token(Lexer* lexer, char skip_comment) {
    if (lexer->peeked_token != ((void*)0)) {
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
Token* peek_next_token(Lexer* lexer, char skip_comment) {
    if (lexer->peeked_token != ((void*)0))
        return lexer->peeked_token;
    unsigned long long saved_position = lexer->position;
    unsigned long long saved_line = lexer->line;
    unsigned long long saved_column = lexer->column;
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
void reset_lexer(Lexer* lexer) {
    lexer->position = 0;
    lexer->line = 0;
    lexer->column = 0;
    lexer->peeked_token = ((void*)0);
    lexer->peeked_position = 0;
    lexer->peeked_line = 0;
    lexer->peeked_column = 0;
    lexer->current_token = ((void*)0);
}
void output_code_member(CodeMember* code_member, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    switch (code_member->type) {
        case CODE_IMPORT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "import\n");
            output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
            break;
        case CODE_FUNCTION:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "function\n");
            output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
            break;
        case CODE_CLASS:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "class\n");
            output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "unknown_CodeMemberType: %d\n", code_member->type);
            break;
    }
}
void output_code(Code* code, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    List* members = list_copy(code->members);
    CodeMember* member;
    while ((member = (CodeMember*)list_pop(members)) != ((void*)0))
        output_code_member(member, outfile, indent + 1, indent_has_next);
}
void output_import(Import* import, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "name\n");
    output_name(import->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "source: \"%s\"\n", import->source != ((void*)0) ? import->source : "NULL");
}
void output_function(Function* function, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "name\n");
    output_name(function->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "return_type\n");
    output_name(function->return_type, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "parameters\n");
    List* parameters = list_copy(function->parameters);
    List* body = list_copy(function->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != ((void*)0)) {
        indention(outfile, indent + 1, 0, indent_has_next);
        fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, indent_has_next);
    }
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_method(Method* method, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "name\n");
    output_name(method->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "return_type\n");
    output_name(method->return_type, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "parameters\n");
    List* parameters = list_copy(method->parameters);
    List* body = list_copy(method->body);
    Variable* parameter;
    int index = -1;
    while ((parameter = (Variable*)list_pop(parameters)) != ((void*)0)) {
        indention(outfile, indent + 1, 0, indent_has_next);
        fprintf(outfile, "parameters[%d]\n", ++index);
        output_variable(parameter, outfile, indent + 2, indent_has_next);
    }
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_class_member(ClassMember* class_member, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    switch (class_member->type) {
        case CLASS_METHOD:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "method\n");
            output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
            break;
        case CLASS_VARIABLE:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "variable\n");
            output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "unknown_ClassMemberType: %d\n", class_member->type);
            break;
    }
}
void output_class(Class* class, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "name\n");
    output_name(class->name, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "members\n");
    List* members = list_copy(class->members);
    ClassMember* member;
    while ((member = (ClassMember*)list_pop(members)) != ((void*)0))
        output_class_member(member, outfile, indent + 1, indent_has_next);
}
void output_variable(Variable* variable, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "type\n");
    output_name(variable->type, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "name\n");
    output_name(variable->name, outfile, indent + 1, indent_has_next);
    if (variable->value != ((void*)0)) {
        indention(outfile, indent, 1, indent_has_next);
        fprintf(outfile, "value\n");
        output_expression(variable->value, outfile, indent + 1, indent_has_next);
    } else {
        indention(outfile, indent, 1, indent_has_next);
        fprintf(outfile, "value: \"NULL\"\n");
    }
}
void output_statement(Statement* statement, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    switch (statement->type) {
        case IF_STATEMENT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "if_statement\n");
            output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
            break;
        case FOR_STATEMENT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "for_statement\n");
            output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
            break;
        case WHILE_STATEMENT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "while_statement\n");
            output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
            break;
        case VARIABLE_STATEMENT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "variable_declaration_statement\n");
            output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
            break;
        case RETURN_STATEMENT:
            if (statement->stmt.expr == ((void*)0)) {
                indention(outfile, indent, 0, indent_has_next);
                fprintf(outfile, "return_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "return_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
            break;
        case BREAK_STATEMENT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "break_statement: \"NULL\"\n");
            break;
        case CONTINUE_STATEMENT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "continue_statement: \"NULL\"\n");
            break;
        case EXPRESSION_STATEMENT:
            if (statement->stmt.expr == ((void*)0)) {
                indention(outfile, indent, 0, indent_has_next);
                fprintf(outfile, "expression_statement: \"NULL\"\n");
                return;
            }
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "expression_statement\n");
            output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "unknown_StatementType: %d\n", statement->type);
            break;
    }
}
void output_if(If* if_, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    List* body = list_copy(if_->body);
    List* else_if_list = list_copy(if_->else_if);
    List* else_body = list_copy(if_->else_body);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "condition\n");
    output_expression(if_->condition, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "else_if\n");
    ElseIf* else_if;
    while ((else_if = (ElseIf*)list_pop(else_if_list)) != ((void*)0))
        output_else_if(else_if, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "else_body\n");
    while ((statement = (Statement*)list_pop(else_body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_else_if(ElseIf* else_if, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    List* body = list_copy(else_if->body);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "condition\n");
    output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_for(For* for_, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    List* body = list_copy(for_->body);
    if (for_->initializer != ((void*)0)) {
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "initializer\n");
        output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
    } else {
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "initializer: \"NULL\"\n");
    }
    if (for_->condition != ((void*)0)) {
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "condition\n");
        output_expression(for_->condition, outfile, indent + 1, indent_has_next);
    } else {
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "condition: \"NULL\"\n");
    }
    if (for_->increment != ((void*)0)) {
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "increment\n");
        output_expression(for_->increment, outfile, indent + 1, indent_has_next);
    } else {
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "increment: \"NULL\"\n");
    }
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_while(While* while_, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    List* body = list_copy(while_->body);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "condition\n");
    output_expression(while_->condition, outfile, indent + 1, indent_has_next);
    indention(outfile, indent, 1, indent_has_next);
    fprintf(outfile, "body\n");
    Statement* statement;
    while ((statement = (Statement*)list_pop(body)) != ((void*)0))
        output_statement(statement, outfile, indent + 1, indent_has_next);
}
void output_expression(Expression* expression, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    if (expression->operator== OP_NONE) {
        indention(outfile, indent, 1, indent_has_next);
        fprintf(outfile, "primary\n");
        output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
    } else {
        char* op_str = operator_to_string(expression->operator);
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
        indention(outfile, indent, 0, indent_has_next);
        fprintf(outfile, "left\n");
        output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
        indention(outfile, indent, 1, indent_has_next);
        fprintf(outfile, "right\n");
        output_expression(expression->right, outfile, indent + 1, indent_has_next);
    }
}
void output_primary(Primary* primary, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    switch (primary->type) {
        case PRIM_INTEGER:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"integer\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_FLOAT:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"float\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value: %s\n", primary->value.literal_value);
            break;
        case PRIM_STRING:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"string\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value: \"%s\"\n", primary->value.literal_value);
            break;
        case PRIM_TRUE:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value: \"true\"\n");
            break;
        case PRIM_FALSE:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"boolean\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value: \"false\"\n");
            break;
        case PRIM_EXPRESSION:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"expression\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value\n");
            output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_NOT_OPERAND:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"!\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_NEG_OPERAND:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"-\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value\n");
            output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
            break;
        case PRIM_VARIABLE_ACCESS:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"variable\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "value\n");
            output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "unknown_PrimaryType: %d\n", primary->type);
            break;
    }
}
void output_variable_access(VariableAccess* variable_access, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    List* args;
    int index;
    switch (variable_access->type) {
        case VAR_NAME:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"name\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "name\n");
            output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
            break;
        case VAR_FUNC_CALL:
            args = list_copy(variable_access->content.args);
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"function_call\"\n");
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "function\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "arguments\n");
            Expression* arg;
            index = -1;
            while ((arg = (Expression*)list_pop(args)) != ((void*)0)) {
                indention(outfile, indent + 1, 0, indent_has_next);
                fprintf(outfile, "arguments[%d]\n", ++index);
                output_expression(arg, outfile, indent + 2, indent_has_next);
            }
            break;
        case VAR_GET_SEQ:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"get sequence_element\"\n");
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "sequence\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "index\n");
            output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
            break;
        case VAR_GET_ATTR:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "type: \"get_attribute\"\n");
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "object\n");
            output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "attribute_name\n");
            output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "unknown_VariableAccessType: %d\n", variable_access->type);
            break;
    }
}
void output_name(Symbol* name, FILE* outfile, unsigned long long indent, char indent_has_next[32]) {
    if (name == ((void*)0)) {
        indention(outfile, indent, 1, indent_has_next);
        fprintf(outfile, "Name: \"NULL\"\n");
        return;
    }
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "name: \"%s\"\n", name->name);
    indention(outfile, indent, 0, indent_has_next);
    fprintf(outfile, "id: %zu\n", name->id);
    switch (name->kind) {
        case SYMBOL_TYPE:
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "kind: \"variable\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_FUNCTION:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "kind: \"function\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_METHOD:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "kind: \"method\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "return_type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_CLASS:
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "kind: \"class\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "kind: \"attribute\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        case SYMBOL_PARAM:
            indention(outfile, indent, 0, indent_has_next);
            fprintf(outfile, "kind: \"parameter\"\n");
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "type\n");
            output_name(name->type, outfile, indent + 1, indent_has_next);
            break;
        default:
            indention(outfile, indent, 1, indent_has_next);
            fprintf(outfile, "kind: \"unknown_NameType\"\n");
            break;
    }
}
void output_TAC(TAC* tac, FILE* outfile, unsigned long long indent) {
    if (tac == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "TAC: \"NULL\"\n");
        return;
    }
    for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
    fprintf(outfile, "TAC {\n");
    if (tac->attribute_tables == ((void*)0) || tac->attribute_tables->head == ((void*)0) || tac->attribute_tables->tail == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "designs: []\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "designs: [\n");
        AttributeTable* attribute_table;
        while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != ((void*)0))
            output_attribute_table(attribute_table, outfile, indent + 2);
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "]\n");
    }
    if (tac->entry_point == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "entry_point: \"NULL\"\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "entry_point: %s\n", tac->entry_point->name);
    }
    if (tac->global_vars == ((void*)0) || tac->global_vars->head == ((void*)0) || tac->global_vars->tail == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "global: []\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "global: [\n");
        Var* var;
        while ((var = (Var*)list_pop(tac->global_vars)) != ((void*)0))
            output_var(var, outfile, indent + 2);
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "]\n");
    }
    if (tac->subroutines == ((void*)0) || tac->subroutines->head == ((void*)0) || tac->subroutines->tail == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "subroutines: []\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "subroutines: [\n");
        Subroutine* subroutine;
        while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != ((void*)0))
            output_subroutine(subroutine, outfile, indent + 2);
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "]\n");
    }
    for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
    fprintf(outfile, "}\n");
}
void output_subroutine(Subroutine* subroutine, FILE* outfile, unsigned long long indent) {
    if (subroutine == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "Subroutine: \"NULL\"\n");
        return;
    }
    if (subroutine->name == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "NULL {\n");
    } else {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "%s {\n", subroutine->name->name);
    }
    if (subroutine->return_type == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "return_type: \"NULL\"\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "return_type: %s\n", subroutine->return_type->name);
    }
    if (subroutine->parameters == ((void*)0) || subroutine->parameters->head == ((void*)0) || subroutine->parameters->tail == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "parameters: []\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "parameters: [\n");
        Var* parameter;
        while ((parameter = (Var*)list_pop(subroutine->parameters)) != ((void*)0))
            output_var(parameter, outfile, indent + 2);
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "]\n");
    }
    if (subroutine->local_vars == ((void*)0) || subroutine->local_vars->head == ((void*)0) || subroutine->local_vars->tail == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "local: []\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "local: [\n");
        Var* var;
        while ((var = (Var*)list_pop(subroutine->local_vars)) != ((void*)0))
            output_var(var, outfile, indent + 2);
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "]\n");
    }
    if (subroutine->blocks == ((void*)0) || subroutine->blocks->head == ((void*)0) || subroutine->blocks->tail == ((void*)0)) {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "instructions: []\n");
    } else {
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "instructions: [\n");
        Block* block;
        while ((block = (Block*)list_pop(subroutine->blocks)) != ((void*)0))
            output_block(block, outfile, indent + 2);
        for (unsigned long long i = 0; i < (indent + 1) * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "]\n");
    }
    for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
    fprintf(outfile, "}\n");
}
void output_var(Var* var, FILE* outfile, unsigned long long indent) {
    if (var == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "Var: \"NULL\"\n");
        return;
    }
    if (var->type == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "NULL\t%s\n", var->name);
    } else if (var->original_name) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "%s\t%s(%s)\n", var->type->name, var->name, var->original_name->name);
    } else {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "%s\t%s\n", var->type->name, var->name);
    }
}
void output_block(Block* block, FILE* outfile, unsigned long long indent) {
    if (block == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "Block: \"NULL\"\n");
        return;
    }
    if (block->label == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "NULL ");
    } else {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "%s ", block->label->name);
    }
    if (block->instructions == ((void*)0) || block->instructions->head == ((void*)0) || block->instructions->tail == ((void*)0))
        fprintf(outfile, "{}\n");
    else {
        fprintf(outfile, "{\n");
        Instruction* instruction;
        while ((instruction = (Instruction*)list_pop(block->instructions)) != ((void*)0))
            output_instruction(instruction, outfile, indent + 1);
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "}\n");
    }
}
void output_arg(Arg* arg, FILE* outfile) {
    if (arg == ((void*)0)) {
        fprintf(outfile, "\"NULL\"");
        return;
    }
    switch (arg->kind) {
        case ARG_VARIABLE:
            if (arg->value.variable->original_name)
                fprintf(outfile, "%s(%s)", arg->value.variable->name, arg->value.variable->original_name->name);
            else
                fprintf(outfile, "%s", arg->value.variable->name);
            break;
        case ARG_INT: fprintf(outfile, "%lld", arg->value.int_value); break;
        case ARG_FLOAT: fprintf(outfile, "%f", arg->value.float_value); break;
        case ARG_STRING: fprintf(outfile, "\"%s\"", arg->value.string_value); break;
        case ARG_BOOL: fprintf(outfile, "%s", arg->value.bool_value ? "true" : "false"); break;
        case ARG_VOID: fprintf(outfile, "void"); break;
        case ARG_LABEL: fprintf(outfile, "%s", arg->value.label->name); break;
        case ARG_FUNCTION:
        case ARG_METHOD:
            if (arg->value.subroutine->original_name)
                fprintf(outfile, "%s(%s)", arg->value.subroutine->name, arg->value.subroutine->original_name->name);
            else
                fprintf(outfile, "%s", arg->value.subroutine->name);
            break;
        case ARG_NONE: fprintf(outfile, "NONE"); break;
        default: fprintf(outfile, "unknown_ArgType: %d", arg->kind); break;
    }
}
void output_instruction(Instruction* instruction, FILE* outfile, unsigned long long indent) {
    if (instruction == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "Instruction: \"NULL\"\n");
        return;
    }
    switch (instruction->type) {
        case INST_ADD: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "add\t");
        } break;
        case INST_SUB: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "sub\t");
        } break;
        case INST_MUL: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "mul\t");
        } break;
        case INST_DIV: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "div\t");
        } break;
        case INST_MOD: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "mod\t");
        } break;
        case INST_EQ: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "eq \t");
        } break;
        case INST_NE: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "ne \t");
        } break;
        case INST_LT: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "lt \t");
        } break;
        case INST_GT: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "gt \t");
        } break;
        case INST_LE: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "le \t");
        } break;
        case INST_GE: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "ge \t");
        } break;
        case INST_AND: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "and\t");
        } break;
        case INST_OR: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "or \t");
        } break;
        case INST_NOT: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "not\t");
        } break;
        case INST_ASSIGN: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "assign\t");
        } break;
        case INST_GET_ATTR: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "get_attr\t");
        } break;
        case INST_GET_ELEM: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "get_elem\t");
        } break;
        case INST_PARAM: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "param\t");
        } break;
        case INST_ALLOC: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "alloc\t");
        } break;
        case INST_JMP_C: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "jmp_c\t");
        } break;
        case INST_JMP: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "jmp\t");
        } break;
        case INST_RET: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "ret\t");
        } break;
        case INST_CALL: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "call\t");
        } break;
        case INST_LOAD: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "load\t");
        } break;
        case INST_STORE: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "store\t");
        } break;
        case INST_NONE: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "INST_NONE\n");
        }
            return;
        default: {
            for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
            fprintf(outfile, "unknown_InstructionType: %d\n", instruction->type);
        }
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
            fprintf(outfile, " ");
            output_arg(instruction->arg2, outfile);
            fprintf(outfile, " ");
            output_arg(instruction->arg3, outfile);
            break;
        case INST_NOT:
        case INST_ASSIGN:
        case INST_PARAM:
        case INST_ALLOC:
        case INST_LOAD:
        case INST_STORE:
            fprintf(outfile, " ");
            output_arg(instruction->arg2, outfile);
            break;
        case INST_JMP:
        case INST_RET:
            break;
        case INST_NONE:
        default:
            return;
    }
    fprintf(outfile, "\n");
}
void output_attribute_table(AttributeTable* attribute_table, FILE* outfile, unsigned long long indent) {
    if (attribute_table == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "AttributeTable: \"NULL\"\n");
        return;
    }
    if (attribute_table->name == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "NULL ");
    } else {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "%s ", attribute_table->name->name);
    }
    fprintf(outfile, "%zu ", attribute_table->size);
    if (attribute_table->attributes == ((void*)0) || attribute_table->attributes->head == ((void*)0) || attribute_table->attributes->tail == ((void*)0))
        fprintf(outfile, "{}\n");
    else {
        fprintf(outfile, "{\n");
        Attribute* attribute;
        while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != ((void*)0))
            output_attribute(attribute, outfile, indent + 1);
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "}\n");
    }
}
void output_attribute(Attribute* attribute, FILE* outfile, unsigned long long indent) {
    if (attribute == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "Attribute: \"NULL\"\n");
        return;
    }
    if (attribute->type == ((void*)0)) {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "NULL\t");
    } else {
        for (unsigned long long i = 0; i < indent * 4; ++i) putc(' ', outfile);
        fprintf(outfile, "%s\t", attribute->type->name);
    }
    if (attribute->var == ((void*)0))
        fprintf(outfile, "NULL ");
    else if (attribute->var->original_name)
        fprintf(outfile, "%s(%s) ", attribute->var->name, attribute->var->original_name->name);
    else
        fprintf(outfile, "%s ", attribute->var->name);
    fprintf(outfile, "%zu\n", attribute->offset);
}
Code* parse_code(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    if (builtin_scope == ((void*)0)) {
        builtin_scope = create_symbol_table(((void*)0));
        name_void = create_symbol(keywordList[20], SYMBOL_TYPE, ((void*)0), builtin_scope);
        name_int = create_symbol(keywordList[16], SYMBOL_TYPE, ((void*)0), builtin_scope);
        name_float = create_symbol(keywordList[17], SYMBOL_TYPE, ((void*)0), builtin_scope);
        name_string = create_symbol(keywordList[18], SYMBOL_TYPE, ((void*)0), builtin_scope);
        name_bool = create_symbol(keywordList[19], SYMBOL_TYPE, ((void*)0), builtin_scope);
    }
    if (now_scope == ((void*)0))
        now_scope = builtin_scope;
    Token* token = ((void*)0);
    List* members = create_list();
    SymbolTable* global_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    while (token != ((void*)0) && token->type != EOF_TOKEN) {
        if (token->type == KEYWORD && token->lexeme == keywordList[0]) {
            Import* import = parse_import(lexer, global_scope, parser);
            if (import == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
            list_append(members, (unsigned long long*)create_code_member(CODE_IMPORT, import, ((void*)0), ((void*)0)));
        } else if (token->type == KEYWORD && token->lexeme == keywordList[2]) {
            Function* function = parse_function(lexer, global_scope, parser);
            if (function == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse function declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
            list_append(members, (unsigned long long*)create_code_member(CODE_FUNCTION, ((void*)0), function, ((void*)0)));
        } else if (token->type == KEYWORD && token->lexeme == keywordList[3]) {
            Class* class = parse_class(lexer, global_scope, parser);
            if (class == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse class declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
            list_append(members, (unsigned long long*)create_code_member(CODE_CLASS, ((void*)0), ((void*)0), class));
        } else
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unexpected token in code member\n", parser->source_file->path, token->line + 1, token->column + 1);
        token = get_next_token(lexer, 1);
    }
    return create_code(members, global_scope);
}
Import* parse_import(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected identifier after 'import'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    char* import_name = token->lexeme;
    char* source = ((void*)0);
    token = get_next_token(lexer, 1);
    if (token->type == KEYWORD && token->lexeme == keywordList[1]) {
        token = get_next_token(lexer, 1);
        if (token->type != STRING) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected string literal after 'from'\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        source = token->lexeme;
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ';' at end of import statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Symbol* name;
    name = parse_import_file(import_name, source, now_scope, parser->source_file);
    if (name == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to import module\n", parser->source_file->path, token->line + 1, token->column + 1);
        name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
    }
    return create_import(name, source);
}
Function* parse_function(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    SymbolTable* function_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected function return type after 'func'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unknown function return type\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected function name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Function* function = (Function*)alloc_memory(sizeof(Function));
    function->function_scope = function_scope;
    Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '(' after function name\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    List* parameters = create_list();
    while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
        Variable* parameter = parse_variable(lexer, function_scope, parser);
        if (parameter == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
        else if (parameter->value != ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Function parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
        else
            list_append(parameters, (unsigned long long*)parameter);
        token = get_next_token(lexer, 1);
        if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
            token = get_next_token(lexer, 1);
        } else if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start function body\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    List* body = create_list();
    parser->in_function = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
        Statement* statement = parse_statement(lexer, function_scope, parser);
        if (statement == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse function body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        else if (have_return)
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        if (statement != ((void*)0) && statement->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (unsigned long long*)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_function = 0;
    if (!have_return && return_type != name_void)
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Function missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
    if (!have_return && return_type == name_void)
        list_append(body, (unsigned long long*)create_statement(RETURN_STATEMENT, ((void*)0), ((void*)0), ((void*)0), ((void*)0), ((void*)0)));
    return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
}
Method* parse_method(Lexer* lexer, SymbolTable* now_scope, Symbol* class_name, Parser* parser) {
    Token* token = ((void*)0);
    SymbolTable* method_scope = create_symbol_table(now_scope);
    Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, class_name, method_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected method return type after 'method'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Symbol* return_type = search_name(now_scope, token->lexeme);
    if (return_type == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unknown return type for method\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected method name after return type\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Method* method = (Method*)alloc_memory(sizeof(Method));
    method->method_scope = method_scope;
    Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '(' after method name\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    if (token->type != KEYWORD || token->lexeme != keywordList[5])
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected 'self' as first parameter of method\n", parser->source_file->path, token->line + 1, token->column + 1);
    token = get_next_token(lexer, 1);
    List* parameters = create_list();
    list_append(parameters, (unsigned long long*)create_variable(class_name, self, ((void*)0)));
    while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
        if (token->type == SYMBOL && token->lexeme == symbolList[4]) {
            token = get_next_token(lexer, 1);
        } else if (token->type == SYMBOL && token->lexeme == symbolList[1]) break;
        else {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        Variable* parameter = parse_variable(lexer, method_scope, parser);
        if (parameter == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse method parameter\n", parser->source_file->path, token->line + 1, token->column + 1);
        else if (parameter->value != ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Method parameters cannot have default values\n", parser->source_file->path, token->line + 1, token->column + 1);
        else
            list_append(parameters, (unsigned long long*)parameter);
        token = get_next_token(lexer, 1);
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start method body\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    List* body = create_list();
    parser->in_function = 1;
    parser->in_method = 1;
    char have_return = 0;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
        Statement* statement = parse_statement(lexer, method_scope, parser);
        if (statement == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse method body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        else if (have_return)
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unreachable code after return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        if (statement != ((void*)0) && statement->type == RETURN_STATEMENT)
            have_return = 1;
        list_append(body, (unsigned long long*)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_function = 0;
    parser->in_method = 0;
    if (!have_return && return_type != name_void)
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Method missing return statement\n", parser->source_file->path, token->line + 1, token->column + 1);
    if (!have_return && return_type == name_void)
        list_append(body, (unsigned long long*)create_statement(RETURN_STATEMENT, ((void*)0), ((void*)0), ((void*)0), ((void*)0), ((void*)0)));
    return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
}
Class* parse_class(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    SymbolTable* class_scope = create_symbol_table(now_scope);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected class name after 'class'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Class* class = (Class*)alloc_memory(sizeof(Class));
    class->class_scope = class_scope;
    Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, ((void*)0), class);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start class body\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    List* members = create_list();
    token = get_next_token(lexer, 1);
    unsigned long long size = 0;
    while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
        if (token->type == KEYWORD && token->lexeme == keywordList[4]) {
            Method* method = parse_method(lexer, class_scope, name, parser);
            if (method == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse class method\n", parser->source_file->path, token->line + 1, token->column + 1);
            list_append(members, (unsigned long long*)create_class_member(CLASS_METHOD, method, ((void*)0)));
        } else if (token->type == KEYWORD && token->lexeme == keywordList[21]) {
            token = get_next_token(lexer, 1);
            parser->in_class = 1;
            Variable* variable = parse_variable(lexer, class_scope, parser);
            parser->in_class = 0;
            if (variable == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
            ClassMember* member = create_class_member(CLASS_VARIABLE, ((void*)0), variable);
            list_append(members, (unsigned long long*)member);
            if (member->type == CLASS_VARIABLE) {
                Symbol* type = member->content.variable->type;
                if (type == name_int || type == name_float || type == name_string)
                    size += 8;
                else if (type == name_bool || type == name_void)
                    size += 1;
                else if (type->kind == SYMBOL_CLASS)
                    size += 8;
                else
                    fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unsupported type for class variable\n", parser->source_file->path, token->line + 1, token->column + 1);
            }
            token = get_next_token(lexer, 1);
            if (token->type != SYMBOL || token->lexeme != symbolList[9])
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ';' after class variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
        } else
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unexpected token in class member\n", parser->source_file->path, token->line + 1, token->column + 1);
        token = get_next_token(lexer, 1);
    }
    char* init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
    Symbol* init = search_name_use_strcmp(class_scope, init_name);
    if (init == ((void*)0)) {
        Method* method = (Method*)alloc_memory(sizeof(Method));
        method->method_scope = create_symbol_table(class_scope);
        init = create_symbol(init_name, SYMBOL_METHOD, name, method);
        List* parameters = create_list();
        Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
        list_append(parameters, (unsigned long long*)create_variable(name, self, ((void*)0)));
        List* body = create_list();
        list_append(body, (unsigned long long*)create_statement(RETURN_STATEMENT, ((void*)0), ((void*)0), ((void*)0), create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), create_variable_access(VAR_NAME, ((void*)0), self, ((void*)0), ((void*)0))), ((void*)0)), ((void*)0)));
        create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
        list_append(members, (unsigned long long*)create_class_member(CLASS_METHOD, method, ((void*)0)));
    }
    if (init->kind != SYMBOL_METHOD)
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Constructor name conflicts with existing member\n", parser->source_file->path, token->line + 1, token->column + 1);
    char* constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
    Method* method = (Method*)alloc_memory(sizeof(Method));
    method->method_scope = create_symbol_table(class_scope);
    Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
    List* parameters = create_list();
    Symbol* self = create_symbol(keywordList[5], SYMBOL_VARIABLE, name, method->method_scope);
    List* init_params = list_copy(init->ast_node.method->parameters);
    Variable* param;
    while ((param = (Variable*)list_pop(init_params)) != ((void*)0)) {
        if (param->name->name == keywordList[5]) continue;
        list_append(parameters, (unsigned long long*)create_variable(param->type, param->name, ((void*)0)));
    }
    List* body = create_list();
    List* ms = list_copy(members);
    ClassMember* mb;
    list_append(body, (unsigned long long*)create_statement(EXPRESSION_STATEMENT, ((void*)0), ((void*)0), ((void*)0), create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), create_variable_access(VAR_NAME, ((void*)0), self, ((void*)0), ((void*)0))), ((void*)0)), ((void*)0)));
    while ((mb = (ClassMember*)list_pop(ms)) != ((void*)0)) {
        if (mb->type == CLASS_VARIABLE) {
            Expression* left = create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), create_variable_access(VAR_GET_ATTR, create_variable_access(VAR_NAME, ((void*)0), self, ((void*)0), ((void*)0)), mb->content.variable->name, ((void*)0), ((void*)0))), ((void*)0));
            Expression* right = mb->content.variable->value != ((void*)0) ? mb->content.variable->value : create_expression(OP_NONE, ((void*)0), create_primary(PRIM_INTEGER, create_string_check("0", 2, 1), ((void*)0), ((void*)0), ((void*)0)), ((void*)0));
            list_append(body, (unsigned long long*)create_statement(EXPRESSION_STATEMENT, ((void*)0), ((void*)0), ((void*)0), create_expression(OP_ASSIGN, left, ((void*)0), right), ((void*)0)));
        }
    }
    List* args = create_list();
    list_append(args, (unsigned long long*)create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), create_variable_access(VAR_NAME, ((void*)0), self, ((void*)0), ((void*)0))), ((void*)0)));
    List* params = list_copy(parameters);
    while ((param = (Variable*)list_pop(params)) != ((void*)0))
        list_append(args, (unsigned long long*)create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), create_variable_access(VAR_NAME, ((void*)0), param->name, ((void*)0), ((void*)0))), ((void*)0)));
    list_append(body, (unsigned long long*)create_statement(RETURN_STATEMENT, ((void*)0), ((void*)0), ((void*)0), create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, ((void*)0), init, ((void*)0), ((void*)0)), ((void*)0), ((void*)0), args)), ((void*)0)), ((void*)0)));
    create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
    list_append(members, (unsigned long long*)create_class_member(CLASS_METHOD, method, ((void*)0)));
    return create_class_use_ptr(class, name, members, class_scope, size);
}
Variable* parse_variable(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = lexer->current_token;
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && (token->lexeme == keywordList[16] || token->lexeme == keywordList[17] || token->lexeme == keywordList[18] || token->lexeme == keywordList[19] || token->lexeme == keywordList[20]))) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Symbol* type = search_name(now_scope, token->lexeme);
    if (type != ((void*)0)) {
        if (type->kind != SYMBOL_TYPE && type->kind != SYMBOL_CLASS)
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected a type for variable declaration\n", parser->source_file->path, token->line + 1, token->column + 1);
    } else
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unknown variable type\n", parser->source_file->path, token->line + 1, token->column + 1);
    token = get_next_token(lexer, 1);
    if (token->type != IDENTIFIER)
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected variable name\n", parser->source_file->path, token->line + 1, token->column + 1);
    Symbol* name = create_symbol(token->lexeme, (parser->in_class && !parser->in_method) ? SYMBOL_ATTRIBUTE : SYMBOL_VARIABLE, type, now_scope);
    Expression* value = ((void*)0);
    token = peek_next_token(lexer, 1);
    if (token->type == SYMBOL && token->lexeme == symbolList[18]) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        value = parse_expression(lexer, now_scope, parser);
        if (value == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse variable initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
    }
    return create_variable(type, name, value);
}
Statement* parse_statement(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = lexer->current_token;
    Statement* statement = ((void*)0);
    if (token->type == KEYWORD) {
        if (token->lexeme == keywordList[6])
            return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), ((void*)0), ((void*)0), ((void*)0), ((void*)0));
        else if (token->lexeme == keywordList[10])
            return create_statement(FOR_STATEMENT, ((void*)0), ((void*)0), parse_for(lexer, now_scope, parser), ((void*)0), ((void*)0));
        else if (token->lexeme == keywordList[9])
            return create_statement(WHILE_STATEMENT, ((void*)0), parse_while(lexer, now_scope, parser), ((void*)0), ((void*)0), ((void*)0));
        else if (token->lexeme == keywordList[21]) {
            get_next_token(lexer, 1);
            statement = create_statement(VARIABLE_STATEMENT, ((void*)0), ((void*)0), ((void*)0), ((void*)0), parse_variable(lexer, now_scope, parser));
        } else if (token->lexeme == keywordList[13]) {
            token = get_next_token(lexer, 1);
            if (token->type == SYMBOL && token->lexeme == symbolList[9]) {
                return create_statement(RETURN_STATEMENT, ((void*)0), ((void*)0), ((void*)0), ((void*)0), ((void*)0));
            }
            statement = create_statement(RETURN_STATEMENT, ((void*)0), ((void*)0), ((void*)0), parse_expression(lexer, now_scope, parser), ((void*)0));
        } else if (token->lexeme == keywordList[14]) {
            if (!parser->in_loop) {
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Cannot use 'break' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
                return ((void*)0);
            }
            statement = create_statement(BREAK_STATEMENT, ((void*)0), ((void*)0), ((void*)0), ((void*)0), ((void*)0));
        } else if (token->lexeme == keywordList[15]) {
            if (!parser->in_loop) {
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Cannot use 'continue' outside of a loop\n", parser->source_file->path, token->line + 1, token->column + 1);
                return ((void*)0);
            }
            statement = create_statement(CONTINUE_STATEMENT, ((void*)0), ((void*)0), ((void*)0), ((void*)0), ((void*)0));
        } else
            statement = create_statement(EXPRESSION_STATEMENT, ((void*)0), ((void*)0), ((void*)0), parse_expression(lexer, now_scope, parser), ((void*)0));
    } else
        statement = create_statement(EXPRESSION_STATEMENT, ((void*)0), ((void*)0), ((void*)0), parse_expression(lexer, now_scope, parser), ((void*)0));
    token = lexer->current_token;
    if (statement == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse statement\n", parser->source_file->path, token->line + 1, token->column + 1);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[9])
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ';' after statement\n", parser->source_file->path, token->line + 1, token->column + 1);
    return statement;
}
If* parse_if(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '(' after 'if'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ')' after if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start if body\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    List* body = create_list();
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        list_append(body, (unsigned long long*)statement);
        token = get_next_token(lexer, 1);
    }
    List* else_if = create_list();
    List* else_body = create_list();
    token = peek_next_token(lexer, 1);
    while (token->type == KEYWORD && token->lexeme == keywordList[7]) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '(' after 'elif'\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        token = get_next_token(lexer, 1);
        Expression* elif_condition = parse_expression(lexer, now_scope, parser);
        if (elif_condition == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ')' after else-if condition\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start else-if body\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        List* elif_body = create_list();
        token = get_next_token(lexer, 1);
        while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse else-if body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
            list_append(elif_body, (unsigned long long*)statement);
            token = get_next_token(lexer, 1);
        }
        list_append(else_if, (unsigned long long*)create_else_if(elif_condition, elif_body));
        token = peek_next_token(lexer, 1);
    }
    if (token->type == KEYWORD && token->lexeme == keywordList[8]) {
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start else body\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        token = get_next_token(lexer, 1);
        while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
            Statement* statement = parse_statement(lexer, now_scope, parser);
            if (statement == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse else body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
            list_append(else_body, (unsigned long long*)statement);
            token = get_next_token(lexer, 1);
        }
    }
    token = lexer->current_token;
    return create_if(condition, body, else_if, else_body);
}
For* parse_for(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '(' after 'for'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    Variable* initializer = ((void*)0);
    if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
        initializer = parse_variable(lexer, now_scope, parser);
        if (initializer == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop initializer\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    Expression* condition = ((void*)0);
    if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
        condition = parse_expression(lexer, now_scope, parser);
        if (condition == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != symbolList[9]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ';' after for loop condition\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    Expression* increment = ((void*)0);
    if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
        increment = parse_expression(lexer, now_scope, parser);
        if (increment == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
        token = get_next_token(lexer, 1);
    }
    if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ')' after for loop increment\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start for loop body\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    List* body = create_list();
    parser->in_loop = 1;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse for loop body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        list_append(body, (unsigned long long*)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_loop = 0;
    return create_for(initializer, condition, increment, body);
}
While* parse_while(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[0]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '(' after 'while'\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    Expression* condition = parse_expression(lexer, now_scope, parser);
    if (condition == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ')' after while condition\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    token = get_next_token(lexer, 1);
    if (token->type != SYMBOL || token->lexeme != symbolList[2]) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected '{' to start while body\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    List* body = create_list();
    parser->in_loop = 1;
    token = get_next_token(lexer, 1);
    while (token->type != SYMBOL || token->lexeme != symbolList[3]) {
        Statement* statement = parse_statement(lexer, now_scope, parser);
        if (statement == ((void*)0))
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse while body statement\n", parser->source_file->path, token->line + 1, token->column + 1);
        list_append(body, (unsigned long long*)statement);
        token = get_next_token(lexer, 1);
    }
    parser->in_loop = 0;
    return create_while(condition, body);
}
Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = peek_next_token(lexer, 1);
    while (token->type == SYMBOL) {
        OperatorType op = string_to_operator(token->lexeme);
        int op_prec = operator_precedence(op);
        if (op == OP_NONE || op_prec < min_prec)
            break;
        token = get_next_token(lexer, 1);
        token = get_next_token(lexer, 1);
        Primary* right_primary = parse_primary(lexer, now_scope, parser);
        if (right_primary == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse right operand\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        Expression* right = create_expression(OP_NONE, ((void*)0), right_primary, ((void*)0));
        token = peek_next_token(lexer, 1);
        while (token->type == SYMBOL) {
            OperatorType next_op = string_to_operator(token->lexeme);
            int next_prec = operator_precedence(next_op);
            if (next_op == OP_NONE || next_prec <= op_prec)
                break;
            right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
            if (right == ((void*)0)) {
                return ((void*)0);
            }
            token = peek_next_token(lexer, 1);
        }
        expr_left = create_expression(op, expr_left, ((void*)0), right);
        token = peek_next_token(lexer, 1);
    }
    token = lexer->current_token;
    return expr_left;
}
Expression* parse_expression(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Primary* left_primary = parse_primary(lexer, now_scope, parser);
    if (left_primary == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse expression primary\n", parser->source_file->path, lexer->current_token->line + 1, lexer->current_token->column + 1);
        return ((void*)0);
    }
    return parse_expr_prec(lexer, create_expression(OP_NONE, ((void*)0), left_primary, ((void*)0)), 0, now_scope, parser);
}
Primary* parse_primary(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = ((void*)0);
    token = lexer->current_token;
    PrimaryType type;
    char* str_value = ((void*)0);
    Expression* expr_value = ((void*)0);
    Primary* prim_value = ((void*)0);
    VariableAccess* variable_value = ((void*)0);
    if (token->type == INTEGER) {
        type = PRIM_INTEGER;
        str_value = token->lexeme;
    } else if (token->type == FLOAT) {
        type = PRIM_FLOAT;
        str_value = token->lexeme;
    } else if (token->type == STRING) {
        type = PRIM_STRING;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && token->lexeme == keywordList[11]) {
        type = PRIM_TRUE;
        str_value = token->lexeme;
    } else if (token->type == KEYWORD && token->lexeme == keywordList[12]) {
        type = PRIM_FALSE;
        str_value = token->lexeme;
    } else if (token->type == SYMBOL && token->lexeme == symbolList[0]) {
        type = PRIM_EXPRESSION;
        token = get_next_token(lexer, 1);
        expr_value = parse_expression(lexer, now_scope, parser);
        if (expr_value == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse parenthesized expression\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
        token = get_next_token(lexer, 1);
        if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ')' after expression\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
    } else if (token->type == SYMBOL && token->lexeme == symbolList[5]) {
        type = PRIM_NOT_OPERAND;
        token = get_next_token(lexer, 1);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '!'\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
    } else if (token->type == SYMBOL && token->lexeme == symbolList[12]) {
        type = PRIM_NEG_OPERAND;
        token = get_next_token(lexer, 1);
        prim_value = parse_primary(lexer, now_scope, parser);
        if (prim_value == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse operand of unary '-'\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
    } else if (token->type == IDENTIFIER || (token->type == KEYWORD && token->lexeme == keywordList[5] && parser->in_method)) {
        type = PRIM_VARIABLE_ACCESS;
        variable_value = parse_variable_access(lexer, now_scope, parser);
        if (variable_value == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
            return ((void*)0);
        }
    } else {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unexpected token in primary expression\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    return create_primary(type, str_value, expr_value, prim_value, variable_value);
}
VariableAccess* parse_variable_access(Lexer* lexer, SymbolTable* now_scope, Parser* parser) {
    Token* token = lexer->current_token;
    if (token->type != IDENTIFIER && !(token->type == KEYWORD && token->lexeme == keywordList[5])) {
        fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected variable name in variable access\n", parser->source_file->path, token->line + 1, token->column + 1);
        return ((void*)0);
    }
    Symbol* current_type = ((void*)0);
    Symbol* base_name = ((void*)0);
    SymbolTable* var_scope = ((void*)0);
    base_name = search_name(now_scope, token->lexeme);
    VariableAccess* base = create_variable_access(VAR_NAME, ((void*)0), base_name, ((void*)0), ((void*)0));
    token = peek_next_token(lexer, 1);
    while (token->type == SYMBOL) {
        if (base_name != ((void*)0)) {
            current_type = base_name;
            if (base_name->type != ((void*)0))
                current_type = base_name->type;
        }
        if (var_scope == ((void*)0) && current_type != ((void*)0) && current_type->kind == SYMBOL_CLASS)
            var_scope = current_type->ast_node.class->class_scope;
        if (token->lexeme == symbolList[0]) {
            token = get_next_token(lexer, 1);
            if (base_name == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Cannot call undefined variable\n", parser->source_file->path, token->line + 1, token->column + 1);
            else if (base_name->kind == SYMBOL_CLASS) {
                char* name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
                base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
                base = create_variable_access(VAR_GET_ATTR, base, base_name, ((void*)0), ((void*)0));
            }
            if (base_name != ((void*)0) && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Cannot call non-function variable\n", parser->source_file->path, token->line + 1, token->column + 1);
            token = get_next_token(lexer, 1);
            List* args = create_list();
            while (token->type != SYMBOL || token->lexeme != symbolList[1]) {
                Expression* arg = parse_expression(lexer, now_scope, parser);
                if (arg == ((void*)0))
                    fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
                list_append(args, (unsigned long long*)arg);
                token = get_next_token(lexer, 1);
                if (token->type == SYMBOL && token->lexeme == symbolList[4])
                    token = get_next_token(lexer, 1);
                else if (token->type != SYMBOL || token->lexeme != symbolList[1]) {
                    fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ',' or ')' after function call argument\n", parser->source_file->path, token->line + 1, token->column + 1);
                    return ((void*)0);
                }
            }
            base = create_variable_access(VAR_FUNC_CALL, base, ((void*)0), ((void*)0), args);
            base_name = base_name->type;
            current_type = ((void*)0);
            var_scope = ((void*)0);
            if (base_name->kind == SYMBOL_CLASS)
                var_scope = base_name->ast_node.class->class_scope;
        } else if (token->lexeme == symbolList[7]) {
            token = get_next_token(lexer, 1);
            token = get_next_token(lexer, 1);
            Expression* index = parse_expression(lexer, now_scope, parser);
            if (index == ((void*)0))
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Failed to parse sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
            token = get_next_token(lexer, 1);
            if (token->type != SYMBOL || token->lexeme != symbolList[8]) {
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected ']' after sequence index\n", parser->source_file->path, token->line + 1, token->column + 1);
                return ((void*)0);
            }
            base = create_variable_access(VAR_GET_SEQ, base, ((void*)0), index, ((void*)0));
        } else if (token->lexeme == symbolList[6]) {
            token = get_next_token(lexer, 1);
            token = get_next_token(lexer, 1);
            if (var_scope == ((void*)0)) {
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Cannot access attribute without a valid scope\n", parser->source_file->path, token->line + 1, token->column + 1);
                return ((void*)0);
            }
            if (token->type != IDENTIFIER) {
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Expected attribute name after '.'\n", parser->source_file->path, token->line + 1, token->column + 1);
                return ((void*)0);
            }
            base_name = search_name(var_scope, token->lexeme);
            if (base_name == ((void*)0)) {
                char* class_name = ((void*)0);
                if (current_type != ((void*)0)) {
                    if (current_type->kind == SYMBOL_CLASS)
                        class_name = current_type->name;
                    else if (current_type->type != ((void*)0) && current_type->type->kind == SYMBOL_CLASS)
                        class_name = current_type->type->name;
                }
                char* name = make_method_name(class_name, token->lexeme);
                base_name = search_name_use_strcmp(var_scope, name);
            }
            if (base_name == ((void*)0)) {
                fprintf((__acrt_iob_func(2u)), "[Parser Error] at %s:%zu:%zu: Unknown attribute name\n", parser->source_file->path, token->line + 1, token->column + 1);
                return ((void*)0);
            }
            base = create_variable_access(VAR_GET_ATTR, base, base_name, ((void*)0), ((void*)0));
            current_type = ((void*)0);
            var_scope = ((void*)0);
        } else
            break;
        token = peek_next_token(lexer, 1);
    }
    return base;
}
AttributeTable* create_attribute_table(Symbol* name) {
    AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
    table->attributes = create_list();
    table->name = name;
    table->size = 0;
    return table;
}
unsigned long long get_type_size(Symbol* type) {
    unsigned long long result = 8;
    if (type == ((void*)0))
        result = 0;
    else if (type == name_int || type == name_float || type == name_string)
        result = 8;
    else if (type == name_bool || type == name_void)
        result = 1;
    else if (type->kind == SYMBOL_CLASS)
        result = type->ast_node.class->size;
    else
        fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported type for size lookup: %s\n", type->name);
    return result;
}
InstructionType get_instruction_type(OperatorType op) {
    switch (op) {
        case OP_ADD:
        case OP_ADD_ASSIGN: return INST_ADD;
        case OP_SUB:
        case OP_SUB_ASSIGN: return INST_SUB;
        case OP_MUL:
        case OP_MUL_ASSIGN: return INST_MUL;
        case OP_DIV:
        case OP_DIV_ASSIGN: return INST_DIV;
        case OP_MOD:
        case OP_MOD_ASSIGN: return INST_MOD;
        case OP_ASSIGN: return INST_ASSIGN;
        case OP_EQ: return INST_EQ;
        case OP_NE: return INST_NE;
        case OP_LT: return INST_LT;
        case OP_GT: return INST_GT;
        case OP_LE: return INST_LE;
        case OP_GE: return INST_GE;
        case OP_AND: return INST_AND;
        case OP_OR: return INST_OR;
        case OP_NONE:
        default: return INST_NONE;
    }
}
TAC* create_tac(void) {
    TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
    tac->attribute_tables = create_list();
    tac->entry_point = ((void*)0);
    tac->global_vars = create_list();
    tac->subroutines = create_list();
    return tac;
}
TACStatus* create_tac_status(TAC* tac) {
    TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
    status->tac = tac;
    status->current_subroutine = ((void*)0);
    status->current_block = ((void*)0);
    status->end_labels = create_list();
    status->start_labels = create_list();
    status->attr_count = 0;
    status->param_count = 0;
    status->var_count = 0;
    status->temp_count = 0;
    status->block_count = 0;
    status->subroutine_count = 0;
    return status;
}
Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
    Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
    subroutine->name = name;
    subroutine->return_type = return_type;
    subroutine->parameters = create_list();
    subroutine->local_vars = create_list();
    subroutine->blocks = create_list();
    return subroutine;
}
Block* create_block(Var* label) {
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    return block;
}
Var* search_var(Symbol* original_name, TACStatus* status) {
    if (status->current_subroutine != ((void*)0) && status->current_subroutine->local_vars != ((void*)0) && status->current_subroutine->local_vars->head != ((void*)0) && status->current_subroutine->local_vars->tail != ((void*)0)) {
        List* vars = list_copy(status->current_subroutine->local_vars);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != ((void*)0)) {
            if (var->original_name == original_name) {
                return var;
            }
        }
    }
    if (status->current_subroutine != ((void*)0) && status->current_subroutine->parameters != ((void*)0) && status->current_subroutine->parameters->head != ((void*)0) && status->current_subroutine->parameters->tail != ((void*)0)) {
        List* vars = list_copy(status->current_subroutine->parameters);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != ((void*)0)) {
            if (var->original_name == original_name) {
                return var;
            }
        }
    }
    if (status->current_class != ((void*)0) && status->tac->attribute_tables != ((void*)0) && status->tac->attribute_tables->head != ((void*)0) && status->tac->attribute_tables->tail != ((void*)0)) {
        List* tables = list_copy(status->tac->attribute_tables);
        AttributeTable* table;
        while ((table = (AttributeTable*)list_pop(tables)) != ((void*)0)) {
            if (table->name == status->current_class->name && table->attributes != ((void*)0) && table->attributes->head != ((void*)0) && table->attributes->tail != ((void*)0)) {
                List* attributes = list_copy(table->attributes);
                Attribute* attr;
                while ((attr = (Attribute*)list_pop(attributes)) != ((void*)0))
                    if (attr->var->original_name == original_name) {
                        return attr->var;
                    }
            }
        }
    }
    if (status->tac->global_vars != ((void*)0) && status->tac->global_vars->head != ((void*)0) && status->tac->global_vars->tail != ((void*)0)) {
        List* vars = list_copy(status->tac->global_vars);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != ((void*)0)) {
            if (var->original_name == original_name) {
                return var;
            }
        }
    }
    return ((void*)0);
}
Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
    if (original_name != ((void*)0)) {
        Class* current_class = ((void*)0);
        if (type->kind == SYMBOL_CLASS) {
            current_class = status->current_class;
            status->current_class = type->ast_node.class;
        }
        Var* var = search_var(original_name, status);
        if (type->kind == SYMBOL_CLASS)
            status->current_class = current_class;
        if (var != ((void*)0)) {
            return var;
        }
    }
    Var* var = (Var*)alloc_memory(sizeof(Var));
    var->original_name = original_name;
    unsigned long long id;
    switch (kind) {
        case VAR_ATTR: id = status->attr_count++; break;
        case VAR_PARAM: id = status->param_count++; break;
        case VAR_VAR: id = status->var_count++; break;
        case VAR_TEMP: id = status->temp_count++; break;
        case VAR_BLOCK: id = status->block_count++; break;
        case VAR_SUBROUTINE: id = status->subroutine_count++; break;
        default: id = (unsigned long long)-1; break;
    }
    var->name = create_string_check("", 32, 1);
    if (id == (unsigned long long)-1)
        sprintf(var->name, "$%d-error", kind);
    else
        sprintf(var->name, "$%c%zu", kind, id);
    var->type = type;
    if (kind == VAR_TEMP || kind == VAR_VAR)
        list_append(status->current_subroutine->local_vars, (unsigned long long*)var);
    return var;
}
Attribute* create_attribute(Symbol* var, Symbol* type, AttributeTable* table, unsigned long long offset, TACStatus* status) {
    Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
    attr->var = create_var(var, type, VAR_ATTR, status);
    attr->type = type;
    attr->offset = offset;
    if (offset == 0 && table != ((void*)0)) {
        attr->offset = table->size;
        table->size += get_type_size(type);
    } else if (table == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "Error: create_attribute received NULL table\n");
    if (table == ((void*)0) || table->attributes == ((void*)0))
        fprintf((__acrt_iob_func(2u)), "Error: create_attribute received NULL table or attributes list\n");
    else
        list_append(table->attributes, (unsigned long long*)attr);
    return attr;
}
Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
    Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
    inst->type = type;
    inst->arg1 = arg1;
    inst->arg2 = arg2;
    inst->arg3 = arg3;
    return inst;
}
Arg* create_arg(ArgType kind, void* value) {
    Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
    arg->kind = kind;
    arg->type = ((void*)0);
    switch (kind) {
        case ARG_VARIABLE:
            arg->value.variable = (Var*)value;
            arg->type = arg->value.variable->type;
            break;
        case ARG_INT:
            arg->value.int_value = *(long long*)value;
            arg->type = name_int;
            break;
        case ARG_FLOAT:
            arg->value.float_value = *(double*)value;
            arg->type = name_float;
            break;
        case ARG_STRING:
            arg->value.string_value = (char*)value;
            arg->type = name_string;
            break;
        case ARG_BOOL:
            arg->value.bool_value = *(char*)value;
            arg->type = name_bool;
            break;
        case ARG_VOID:
            arg->value.string_value = ((void*)0);
            arg->type = name_void;
            break;
        case ARG_LABEL:
            arg->value.label = (Var*)value;
            break;
        case ARG_FUNCTION:
        case ARG_METHOD:
            arg->value.subroutine = (Var*)value;
            arg->type = arg->value.subroutine->type;
            break;
        case ARG_NONE:
        default:
            fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported argument type for create_arg: %d\n", kind);
            break;
    }
    arg->is_get = 0;
    return arg;
}
Arg* load_rvalue(Arg* arg, TACStatus* status) {
    if (arg == ((void*)0)) {
        return ((void*)0);
    }
    if (arg->is_get) {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), arg->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (unsigned long long*)create_instruction(INST_LOAD, temp, arg, ((void*)0)));
        return temp;
    }
    return arg;
}
TAC* tac_code(Code* code) {
    TAC* tac = create_tac();
    TACStatus* status = create_tac_status(tac);
    List* members = list_copy(code->members);
    CodeMember* code_member;
    while ((code_member = (CodeMember*)list_pop(members)) != ((void*)0)) {
        if (code_member->type == CODE_FUNCTION) {
            tac_function(code_member->content.function, status);
            if (strcmp(code_member->content.function->name->name, "main") == 0)
                tac->entry_point = code_member->content.function->name;
        } else if (code_member->type == CODE_CLASS)
            tac_class(code_member->content.class, status);
        else if (code_member->type == CODE_IMPORT)
            tac_import(code_member->content.import, tac, status);
    }
    return tac;
}
void tac_import(Import* import, TAC* tac, TACStatus* status) {
    if (import->name->kind == SYMBOL_VARIABLE)
        list_append(tac->global_vars, (unsigned long long*)create_var(import->name, import->name->type, VAR_VAR, status));
    else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
        list_append(tac->global_vars, (unsigned long long*)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
    else if (import->name->kind == SYMBOL_CLASS)
        tac_class(import->name->ast_node.class, status);
    else
        fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
}
void tac_function(Function* function, TACStatus* status) {
    Subroutine* subroutine = create_subroutine(function->name, function->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (unsigned long long*)subroutine);
    List* parameters = list_copy(function->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != ((void*)0))
        list_append(subroutine->parameters, (unsigned long long*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
    Block* block = create_block(create_var(((void*)0), ((void*)0), VAR_BLOCK, status));
    list_append(subroutine->blocks, (unsigned long long*)block);
    status->current_block = block;
    List* statements = list_copy(function->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != ((void*)0))
        tac_statement(statement, status);
    status->current_subroutine = ((void*)0);
}
void tac_method(Method* method, TACStatus* status) {
    Subroutine* subroutine = create_subroutine(method->name, method->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (unsigned long long*)subroutine);
    List* parameters = list_copy(method->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != ((void*)0))
        list_append(subroutine->parameters, (unsigned long long*)create_var(parameter->name, parameter->type, VAR_PARAM, status));
    Block* block = create_block(create_var(((void*)0), ((void*)0), VAR_BLOCK, status));
    list_append(subroutine->blocks, (unsigned long long*)block);
    status->current_block = block;
    List* statements = list_copy(method->body);
    if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
        Statement* stmt = (Statement*)list_pop(statements);
        if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator!= OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
            return;
        }
        Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
        list_append(block->instructions, (unsigned long long*)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), ((void*)0)));
    }
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != ((void*)0))
        tac_statement(statement, status);
    status->current_subroutine = ((void*)0);
}
void tac_class(Class* class, TACStatus* status) {
    status->current_class = class;
    List* members = list_copy(class->members);
    ClassMember* member;
    AttributeTable* attr_table = create_attribute_table(class->name);
    list_append(status->tac->attribute_tables, (unsigned long long*)attr_table);
    while ((member = (ClassMember*)list_pop(members)) != ((void*)0)) {
        switch (member->type) {
            case CLASS_METHOD:
                tac_method(member->content.method, status);
                break;
            case CLASS_VARIABLE:
                tac_variable(member->content.variable, status, 1);
                break;
            default:
                fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
                break;
        }
    }
    status->current_class = ((void*)0);
}
void tac_variable(Variable* variable, TACStatus* status, char is_attr) {
    Var* var = ((void*)0);
    if (is_attr) {
        AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
        list_append(status->tac->attribute_tables, (unsigned long long*)attr_table);
        create_attribute(variable->name, variable->type, attr_table, 0, status);
    } else {
        var = create_var(variable->name, variable->type, VAR_VAR, status);
        Arg* value;
        if (variable->value != ((void*)0))
            value = load_rvalue(tac_expression(variable->value, status), status);
        else
            value = create_arg(ARG_INT, &(long long){0});
        list_append(status->current_block->instructions, (unsigned long long*)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, ((void*)0)));
    }
}
void tac_statement(Statement* statement, TACStatus* status) {
    switch (statement->type) {
        case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
        case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, 0); break;
        case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
        case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
        case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
        case RETURN_STATEMENT: {
            Arg* return_value = create_arg(ARG_VOID, ((void*)0));
            if (statement->stmt.return_expr != ((void*)0))
                return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
            list_append(status->current_block->instructions, (unsigned long long*)create_instruction(INST_RET, return_value, ((void*)0), ((void*)0)));
            break;
        }
        case BREAK_STATEMENT:
            if (status->end_labels != ((void*)0) && status->end_labels->head != ((void*)0) && status->end_labels->tail != ((void*)0)) {
                Arg* label = (Arg*)status->end_labels->tail->content;
                if (label != ((void*)0)) {
                    Instruction* inst = create_instruction(INST_JMP, label, ((void*)0), ((void*)0));
                    list_append(status->current_block->instructions, (unsigned long long*)inst);
                    break;
                }
            }
            fprintf((__acrt_iob_func(2u)), "[Warning] 'break' statement used outside of loop\n");
            break;
        case CONTINUE_STATEMENT:
            if (status->start_labels != ((void*)0) && status->start_labels->head != ((void*)0) && status->start_labels->tail != ((void*)0)) {
                Arg* label = (Arg*)status->start_labels->tail->content;
                if (label != ((void*)0)) {
                    Instruction* inst = create_instruction(INST_JMP, label, ((void*)0), ((void*)0));
                    list_append(status->current_block->instructions, (unsigned long long*)inst);
                    break;
                }
            }
            fprintf((__acrt_iob_func(2u)), "[Warning] 'continue' statement used outside of loop\n");
            break;
        default:
            fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
            break;
    }
}
void tac_if(If* if_, TACStatus* status) {
    Var* then_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Var* else_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Var* end_label = ((void*)0);
    if ((if_->else_if == ((void*)0) || if_->else_if->head == ((void*)0) || if_->else_if->tail == ((void*)0)) && (if_->else_body == ((void*)0) || if_->else_body->head == ((void*)0) || if_->else_body->tail == ((void*)0)))
        end_label = else_label;
    else
        end_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
    Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
    Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
    list_append(status->current_block->instructions, (unsigned long long*)inst);
    Block* then_block = create_block(then_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)then_block);
    status->current_block = then_block;
    List* then_statements = list_copy(if_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(then_statements)) != ((void*)0))
        tac_statement(statement, status);
    Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, ((void*)0), ((void*)0));
    list_append(status->current_block->instructions, (unsigned long long*)jump_to_end);
    if (if_->else_if != ((void*)0) && if_->else_if->head != ((void*)0) && if_->else_if->tail != ((void*)0)) {
        List* elif_list = list_copy(if_->else_if);
        ElseIf* elif;
        while ((elif = (ElseIf*)list_pop(elif_list)) != ((void*)0)) {
            Block* else_if_block = create_block(else_label);
            list_append(status->current_subroutine->blocks, (unsigned long long*)else_if_block);
            status->current_block = else_if_block;
            then_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
            else_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
            condition = load_rvalue(tac_expression(elif->condition, status), status);
            if ((elif_list == ((void*)0) || elif_list->head == ((void*)0) || elif_list->tail == ((void*)0)) && (if_->else_body == ((void*)0) || if_->else_body->head == ((void*)0) || if_->else_body->tail == ((void*)0)))
                else_label = end_label;
            inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
            list_append(status->current_block->instructions, (unsigned long long*)inst);
            then_block = create_block(then_label);
            list_append(status->current_subroutine->blocks, (unsigned long long*)then_block);
            status->current_block = then_block;
            List* elif_statements = list_copy(elif->body);
            Statement* elif_statement;
            while ((elif_statement = (Statement*)list_pop(elif_statements)) != ((void*)0))
                tac_statement(elif_statement, status);
            jump_to_end = create_instruction(INST_JMP, end_block_arg, ((void*)0), ((void*)0));
            list_append(status->current_block->instructions, (unsigned long long*)jump_to_end);
        }
    }
    if (if_->else_body != ((void*)0) && if_->else_body->head != ((void*)0) && if_->else_body->tail != ((void*)0)) {
        Block* else_block = create_block(else_label);
        list_append(status->current_subroutine->blocks, (unsigned long long*)else_block);
        status->current_block = else_block;
        List* else_statements = list_copy(if_->else_body);
        Statement* else_statement;
        while ((else_statement = (Statement*)list_pop(else_statements)) != ((void*)0))
            tac_statement(else_statement, status);
        jump_to_end = create_instruction(INST_JMP, end_block_arg, ((void*)0), ((void*)0));
        list_append(status->current_block->instructions, (unsigned long long*)jump_to_end);
    }
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)end_block);
    status->current_block = end_block;
}
void tac_for(For* for_, TACStatus* status) {
    if (for_->initializer != ((void*)0))
        tac_variable(for_->initializer, status, 0);
    Var* condition_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Var* body_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Var* end_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    if (for_->condition != ((void*)0)) {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), ((void*)0), ((void*)0));
        list_append(status->current_block->instructions, (unsigned long long*)inst);
        Block* condition_block = create_block(condition_label);
        list_append(status->current_subroutine->blocks, (unsigned long long*)condition_block);
        status->current_block = condition_block;
        Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
        inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
        list_append(status->current_block->instructions, (unsigned long long*)inst);
    } else {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), ((void*)0), ((void*)0));
        list_append(status->current_block->instructions, (unsigned long long*)inst);
    }
    Block* body_block = create_block(body_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)body_block);
    status->current_block = body_block;
    Var* increment_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    if (for_->increment != ((void*)0))
        list_append(status->start_labels, (unsigned long long*)create_arg(ARG_LABEL, increment_label));
    else if (for_->condition != ((void*)0))
        list_append(status->start_labels, (unsigned long long*)create_arg(ARG_LABEL, condition_label));
    else
        list_append(status->start_labels, (unsigned long long*)create_arg(ARG_LABEL, body_label));
    list_append(status->end_labels, (unsigned long long*)create_arg(ARG_LABEL, end_label));
    List* body_statements = list_copy(for_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(body_statements)) != ((void*)0))
        tac_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    if (for_->increment != ((void*)0)) {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), ((void*)0), ((void*)0));
        list_append(status->current_block->instructions, (unsigned long long*)inst);
        Block* increment_block = create_block(increment_label);
        list_append(status->current_subroutine->blocks, (unsigned long long*)increment_block);
        status->current_block = increment_block;
        load_rvalue(tac_expression(for_->increment, status), status);
    }
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), ((void*)0), ((void*)0));
    if (for_->condition == ((void*)0))
        inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), ((void*)0), ((void*)0));
    list_append(status->current_block->instructions, (unsigned long long*)inst);
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)end_block);
    status->current_block = end_block;
}
void tac_while(While* while_, TACStatus* status) {
    Var* condition_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), ((void*)0), ((void*)0));
    list_append(status->current_block->instructions, (unsigned long long*)inst);
    Block* condition_block = create_block(condition_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)condition_block);
    status->current_block = condition_block;
    Var* body_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Var* end_label = create_var(((void*)0), ((void*)0), VAR_BLOCK, status);
    Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
    inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
    list_append(status->current_block->instructions, (unsigned long long*)inst);
    Block* body_block = create_block(body_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)body_block);
    status->current_block = body_block;
    list_append(status->start_labels, (unsigned long long*)create_arg(ARG_LABEL, condition_label));
    list_append(status->end_labels, (unsigned long long*)create_arg(ARG_LABEL, end_label));
    List* body_statements = list_copy(while_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(body_statements)) != ((void*)0))
        tac_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), ((void*)0), ((void*)0));
    list_append(status->current_block->instructions, (unsigned long long*)inst);
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (unsigned long long*)end_block);
    status->current_block = end_block;
}
Arg* tac_expression(Expression* expression, TACStatus* status) {
    if (expression->operator== OP_NONE) {
        Arg* result = tac_primary(expression->prim_left, status);
        return result;
    }
    Arg* right = load_rvalue(tac_expression(expression->right, status), status);
    InstructionType op = get_instruction_type(expression->operator);
    Arg* left = tac_expression(expression->expr_left, status);
    Instruction* inst;
    if (expression->operator== OP_ASSIGN || expression->operator== OP_ADD_ASSIGN || expression->operator== OP_SUB_ASSIGN || expression->operator== OP_MUL_ASSIGN || expression->operator== OP_DIV_ASSIGN || expression->operator== OP_MOD_ASSIGN) {
        if (op != INST_ASSIGN) {
            Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), left->type, VAR_TEMP, status));
            inst = create_instruction(op, temp, load_rvalue(left, status), right);
            list_append(status->current_block->instructions, (unsigned long long*)inst);
            right = temp;
        }
        if (left->kind != ARG_VARIABLE)
            fprintf((__acrt_iob_func(2u)), "[Warning] Left-hand side of assignment is not a variable\n");
        inst = create_instruction(INST_ASSIGN, left, right, ((void*)0));
        if (left->is_get)
            inst = create_instruction(INST_STORE, left, right, ((void*)0));
    } else {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), left->type, VAR_TEMP, status));
        inst = create_instruction(op, temp, load_rvalue(left, status), right);
        right = temp;
    }
    list_append(status->current_block->instructions, (unsigned long long*)inst);
    return right;
}
Arg* tac_primary(Primary* primary, TACStatus* status) {
    switch (primary->type) {
        case PRIM_INTEGER: {
            long long t = strtoll(primary->value.literal_value, ((void*)0), 10);
            return create_arg(ARG_INT, &t);
        }
        case PRIM_FLOAT: {
            double t = strtod(primary->value.literal_value, ((void*)0));
            return create_arg(ARG_FLOAT, &t);
        }
        case PRIM_STRING:
            return create_arg(ARG_STRING, primary->value.literal_value);
        case PRIM_TRUE: {
            char t = 1;
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_FALSE: {
            char t = 0;
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_EXPRESSION:
            return tac_expression(primary->value.expr, status);
        case PRIM_NOT_OPERAND: {
            Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), name_bool, VAR_TEMP, status));
            Instruction* inst = create_instruction(INST_NOT, temp, operand, ((void*)0));
            list_append(status->current_block->instructions, (unsigned long long*)inst);
            return temp;
        }
        case PRIM_NEG_OPERAND: {
            Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), operand->type, VAR_TEMP, status));
            Instruction* inst = ((void*)0);
            long long zero_int = 0;
            double neg_one_float = -1.0;
            if (operand->type == name_int)
                inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
            else if (operand->type == name_float)
                inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
            else {
                fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported type for negation: %s\n", operand->type->name);
                return ((void*)0);
            }
            list_append(status->current_block->instructions, (unsigned long long*)inst);
            return temp;
        }
        case PRIM_VARIABLE_ACCESS:
            return tac_variable_access(primary->value.var, status);
        default:
            fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
            return ((void*)0);
    }
}
Arg* tac_variable_access(VariableAccess* variable_access, TACStatus* status) {
    if (variable_access->type == VAR_NAME && variable_access->content.name != ((void*)0)) {
        if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
            Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
            return result;
        } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
            Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
            return result;
        } else {
            Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
            return result;
        }
    }
    if (variable_access->base == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported variable access with NULL base\n");
        return ((void*)0);
    }
    Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
    if (base == ((void*)0)) {
        fprintf((__acrt_iob_func(2u)), "[Warning] Failed to generate variable access for base\n");
        return ((void*)0);
    }
    if (variable_access->type == VAR_GET_ATTR) {
        if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
            return ((void*)0);
        }
        SymbolTable* scope = base->type->ast_node.scope;
        if (base->type->kind == SYMBOL_CLASS)
            scope = base->type->ast_node.class->class_scope;
        Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
        if (attr == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
            return ((void*)0);
        }
        if (attr->kind == SYMBOL_FUNCTION) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
            return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        }
        if (attr->kind == SYMBOL_METHOD)
            return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        if (attr->kind != SYMBOL_ATTRIBUTE) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
            return ((void*)0);
        }
        Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), attr->type, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
        temp->is_get = 1;
        list_append(status->current_block->instructions, (unsigned long long*)inst);
        return temp;
    } else if (variable_access->type == VAR_GET_SEQ) {
        if (strcmp(base->type->name, "arr") != 0) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
            return ((void*)0);
        }
        Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
        if (index == ((void*)0)) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Failed to generate variable access for index\n");
            return ((void*)0);
        }
        Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), name_int, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
        temp->is_get = 1;
        list_append(status->current_block->instructions, (unsigned long long*)inst);
        return temp;
    } else if (variable_access->type == VAR_FUNC_CALL) {
        if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
            Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
            base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        }
        if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
            fprintf((__acrt_iob_func(2u)), "[Warning] Attempting to call non-function, kind: %d, type name: %s\n", base->kind, base->type->name);
            return ((void*)0);
        }
        long long arg_count = 0;
        List* arguments = create_list();
        if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
            Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, ((void*)0), create_primary(PRIM_VARIABLE_ACCESS, ((void*)0), ((void*)0), ((void*)0), variable_access->base->base), ((void*)0)), status), status);
            long long size = (long long)get_type_size(self->type);
            list_append(arguments, (unsigned long long*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, ((void*)0)));
            arg_count++;
        }
        List* args = list_copy(variable_access->content.args);
        Expression* arg_expr;
        while ((arg_expr = (Expression*)list_pop(args)) != ((void*)0)) {
            Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
            long long size = (long long)get_type_size(arg->type);
            list_append(arguments, (unsigned long long*)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, ((void*)0)));
            arg_count++;
        }
        Instruction* arg;
        while ((arg = (Instruction*)list_pop(arguments)) != ((void*)0))
            list_append(status->current_block->instructions, (unsigned long long*)arg);
        Arg* temp = create_arg(ARG_VARIABLE, create_var(((void*)0), base->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (unsigned long long*)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
        return temp;
    } else {
        fprintf((__acrt_iob_func(2u)), "[Warning] Unsupported variable access type for tac_variable_access: %d\n", variable_access->type);
        return ((void*)0);
    }
}
File* create_file(char* path) {
    File* file = (File*)alloc_memory(sizeof(File));
    file->path = absolute_path(path, ((void*)0));
    normalize_path(file);
    return file;
}
char* absolute_path(char* path, char* base_path) {
    path = create_string_check(path, strlen(path), 0);
    unsigned long long path_len = strlen(path);
    for (unsigned long long i = 0; i < path_len; i++) {
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
        path[0] = (path[1] >= 'a' && path[1] <= 'z') ? (path[1] - ('a' - 'A')) : path[1];
        path[1] = ':';
        return path;
    }
    if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
        return path;
    if (path_len > 0 && path[0] == '/')
        return path;
    if (base_path == ((void*)0))
        base_path = getcwd(((void*)0), 0);
    if (base_path == ((void*)0))
        return path;
    unsigned long long total_len = strlen(base_path) + 1 + path_len + 1;
    char* abs_path = create_string_check("", total_len, 0);
    sprintf(abs_path, "%s/%s", base_path, path);
    return absolute_path(create_string_check(abs_path, total_len, 1), ((void*)0));
}
char* get_file_dir(File* path) {
    if (path->dirs == ((void*)0)) return 0;
    unsigned long long total_len = 0;
    unsigned long long node_count = 0;
    StrNode* current = path->dirs;
    while (current != ((void*)0)) {
        if (current->next != ((void*)0)) {
            unsigned long long dir_len = strlen(current->dir);
            total_len += dir_len;
            node_count++;
        }
        current = current->next;
    }
    if (node_count == 0) return ((void*)0);
    if (node_count > 1)
        total_len += node_count - 1;
    char* dir_path = create_string_check("", total_len + 1, 0);
    dir_path[0] = '\0';
    current = path->dirs;
    char first = 1;
    while (current != ((void*)0)) {
        if (current->next != ((void*)0)) {
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
void rebuild_full_path(File* file) {
    char* dir = get_file_dir(file);
    char* dir_cstr = dir != ((void*)0) ? dir : "";
    char* ext_cstr = file->extension != ((void*)0) ? file->extension : "";
    unsigned long long path_len = strlen(dir_cstr) + 1 + strlen(file->name);
    if (file->extension != ((void*)0)) path_len += strlen(ext_cstr);
    char* new_path = create_string_check("", path_len + 1, 0);
    if (dir != ((void*)0) && strlen(dir_cstr) > 0)
        sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
    else
        sprintf(new_path, "%s%s", file->name, ext_cstr);
    file->path = create_string_check(new_path, strlen(new_path), 1);
}
void change_file_extension(File* file, char* new_extension) {
    file->extension = new_extension;
    rebuild_full_path(file);
}
void normalize_path(File* file) {
    unsigned long long path_len = strlen(file->path);
    char* path_copy = create_string_check("", path_len + 1, 0);
    strcpy(path_copy, file->path);
    StrNode* dirs_head = ((void*)0);
    StrNode* dirs_tail = ((void*)0);
    unsigned long long start = 0;
    if (path_len > 0 && path_copy[0] == '/') {
        StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
        node->dir = create_string_check("/", 1, 1);
        node->next = 0;
        dirs_head = node;
        dirs_tail = node;
        start = 1;
    }
    unsigned long long i = start;
    while (i <= path_len) {
        if (i == path_len || path_copy[i] == '/') {
            if (i > start) {
                unsigned long long comp_len = i - start;
                if (comp_len >= 256) {
                    fprintf((__acrt_iob_func(2u)), "Warning: Path component too long, truncating to %zu characters\n", comp_len);
                    comp_len = 256 - 1;
                }
                char component[256];
                strncpy(component, path_copy + start, comp_len);
                component[comp_len] = '\0';
                if (strcmp(component, ".") == 0) {
                } else if (strcmp(component, "..") == 0) {
                    if (dirs_tail != ((void*)0) && dirs_tail != dirs_head) {
                        if (strcmp(dirs_tail->dir, "..") == 0) {
                            StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
                            node->dir = create_string_check("..", 2, 1);
                            node->next = 0;
                            dirs_tail->next = node;
                            dirs_tail = node;
                        } else {
                            StrNode* prev = dirs_head;
                            while (prev != ((void*)0) && prev->next != dirs_tail)
                                prev = prev->next;
                            if (prev != ((void*)0)) {
                                prev->next = 0;
                                dirs_tail = prev;
                            }
                        }
                    } else if (dirs_head == ((void*)0)) {
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
                    if (dirs_tail != ((void*)0))
                        dirs_tail->next = node;
                    dirs_tail = node;
                    if (dirs_head == ((void*)0)) dirs_head = node;
                }
            }
            start = i + 1;
        }
        i++;
    }
    file->dirs = dirs_head;
    if (dirs_tail != ((void*)0)) {
        char* dot = strrchr(dirs_tail->dir, '.');
        if (dot != ((void*)0) && dot != dirs_tail->dir) {
            unsigned long long name_len = (unsigned long long)(dot - dirs_tail->dir);
            file->name = create_string_check(dirs_tail->dir, name_len, 1);
            file->extension = create_string_check(dot, strlen(dot), 1);
        } else {
            file->name = dirs_tail->dir;
            file->extension = ((void*)0);
        }
    } else {
        file->name = ((void*)0);
        file->extension = ((void*)0);
    }
    unsigned long long full_path_len = 0;
    StrNode* current = dirs_head;
    unsigned long long node_count = 0;
    while (current != ((void*)0)) {
        full_path_len += strlen(current->dir);
        node_count++;
        current = current->next;
    }
    if (node_count > 1)
        full_path_len += (node_count - 1);
    char* full_path = create_string_check("", full_path_len + 1, 0);
    full_path[0] = '\0';
    current = dirs_head;
    char is_first = 1;
    while (current != ((void*)0)) {
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
}
int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf((__acrt_iob_func(2u)), "Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    init();
    char* filename = argv[1];
    parse_file(filename, 1, 1, 1);
    return 0;
}
