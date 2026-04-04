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
static AttributeTable* create_attribute_table(Symbol* name) {
    AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
    table->attributes = create_list();
    table->name = name;
    table->size = 0;
    return table;
}
static size_t get_type_size(Symbol* type) {
    size_t result = 8;
    if (type == NULL)
        result = 0;
    else if (type == name_int || type == name_float || type == name_string)
        result = 8;
    else if (type == name_bool || type == name_void)
        result = 1;
    else if (type->kind == SYMBOL_CLASS)
        result = type->ast_node.class->size;
    else
        fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
    return result;
}
static inline char is_assignment_operator(OperatorType op) {
    return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
}
static InstructionType get_instruction_type(OperatorType op) {
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
static TAC* create_tac(void) {
    TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
    tac->attribute_tables = create_list();
    tac->entry_point = NULL;
    tac->global_vars = create_list();
    tac->subroutines = create_list();
    return tac;
}
static TACStatus* create_tac_status(TAC* tac) {
    TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
    status->tac = tac;
    status->current_subroutine = NULL;
    status->current_block = NULL;
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
static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
    Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
    subroutine->name = name;
    subroutine->return_type = return_type;
    subroutine->parameters = create_list();
    subroutine->local_vars = create_list();
    subroutine->blocks = create_list();
    return subroutine;
}
static Block* create_block(Var* label) {
    Block* block = (Block*)alloc_memory(sizeof(Block));
    block->label = label;
    block->instructions = create_list();
    return block;
}
static Var* search_var(Symbol* original_name, TACStatus* status) {
    if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
        List* vars = list_copy(status->current_subroutine->local_vars);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name) {
                return var;
            }
        }
    }
    if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
        List* vars = list_copy(status->current_subroutine->parameters);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name) {
                return var;
            }
        }
    }
    if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
        List* tables = list_copy(status->tac->attribute_tables);
        AttributeTable* table;
        while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
            if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
                List* attributes = list_copy(table->attributes);
                Attribute* attr;
                while ((attr = (Attribute*)list_pop(attributes)) != NULL)
                    if (attr->var->original_name == original_name) {
                        return attr->var;
                    }
            }
        }
    }
    if (!list_is_empty(status->tac->global_vars)) {
        List* vars = list_copy(status->tac->global_vars);
        Var* var;
        while ((var = (Var*)list_pop(vars)) != NULL) {
            if (var->original_name == original_name) {
                return var;
            }
        }
    }
    return NULL;
}
static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
    if (original_name != NULL) {
        Class* current_class = NULL;
        if (type->kind == SYMBOL_CLASS) {
            current_class = status->current_class;
            status->current_class = type->ast_node.class;
        }
        Var* var = search_var(original_name, status);
        if (type->kind == SYMBOL_CLASS)
            status->current_class = current_class;
        if (var != NULL) {
            return var;
        }
    }
    Var* var = (Var*)alloc_memory(sizeof(Var));
    var->original_name = original_name;
    size_t id;
    switch (kind) {
        case VAR_ATTR: id = status->attr_count++; break;
        case VAR_PARAM: id = status->param_count++; break;
        case VAR_VAR: id = status->var_count++; break;
        case VAR_TEMP: id = status->temp_count++; break;
        case VAR_BLOCK: id = status->block_count++; break;
        case VAR_SUBROUTINE: id = status->subroutine_count++; break;
        default: id = (size_t)-1; break;
    }
    var->name = create_string("", 32);
    if (id == (size_t)-1)
        sprintf(var->name, "$%d-error", kind);
    else
        sprintf(var->name, "$%c%zu", kind, id);
    var->type = type;
    if (kind == VAR_TEMP || kind == VAR_VAR)
        list_append(status->current_subroutine->local_vars, (pointer)var);
    return var;
}
static Attribute* create_attribute(Symbol* var, Symbol* type, AttributeTable* table, size_t offset, TACStatus* status) {
    Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
    attr->var = create_var(var, type, VAR_ATTR, status);
    attr->type = type;
    attr->offset = offset;
    if (offset == 0) {
        attr->offset = table->size;
        table->size += get_type_size(type);
    }
    if (table == NULL || table->attributes == NULL)
        fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
    else
        list_append(table->attributes, (pointer)attr);
    return attr;
}
static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
    Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
    inst->type = type;
    inst->arg1 = arg1;
    inst->arg2 = arg2;
    inst->arg3 = arg3;
    return inst;
}
static Arg* create_arg(ArgType kind, void* value) {
    Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
    arg->kind = kind;
    arg->type = NULL;
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
            arg->value.string_value = (string)value;
            arg->type = name_string;
            break;
        case ARG_BOOL:
            arg->value.bool_value = *(char*)value;
            arg->type = name_bool;
            break;
        case ARG_VOID:
            arg->value.string_value = NULL;
            arg->type = name_void;
            break;
        case ARG_LABEL:
            arg->value.label = (Var*)value;
            break;
        case ARG_SUBROUTINE:
            arg->value.subroutine = (Var*)value;
            arg->type = arg->value.subroutine->type;
            break;
        case ARG_NONE:
        default:
            fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
            break;
    }
    arg->is_get = 0;
    return arg;
}
static Arg* load_rvalue(Arg* arg, TACStatus* status) {
    if (arg == NULL) {
        return NULL;
    }
    if (arg->is_get) {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
        return temp;
    }
    return arg;
}
TAC* tac_code(Code* code) {
    TAC* tac = create_tac();
    TACStatus* status = create_tac_status(tac);
    List* members = list_copy(code->members);
    CodeMember* code_member;
    while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
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
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
    else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
    else if (import->name->kind == SYMBOL_CLASS)
        list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
    else
        fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
}
void tac_function(Function* function, TACStatus* status) {
    Subroutine* subroutine = create_subroutine(function->name, function->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (pointer)subroutine);
    List* parameters = list_copy(function->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL)
        list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
    Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
    list_append(subroutine->blocks, (pointer)block);
    status->current_block = block;
    List* statements = list_copy(function->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        tac_statement(statement, status);
    status->current_subroutine = NULL;
}
void tac_method(Method* method, TACStatus* status) {
    Subroutine* subroutine = create_subroutine(method->name, method->return_type);
    status->current_subroutine = subroutine;
    list_append(status->tac->subroutines, (pointer)subroutine);
    List* parameters = list_copy(method->parameters);
    Variable* parameter;
    while ((parameter = (Variable*)list_pop(parameters)) != NULL)
        list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
    Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
    list_append(subroutine->blocks, (pointer)block);
    status->current_block = block;
    if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
        list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
    }
    List* statements = list_copy(method->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        tac_statement(statement, status);
    status->current_subroutine = NULL;
}
void tac_class(Class* class, TACStatus* status) {
    status->current_class = class;
    List* members = list_copy(class->members);
    ClassMember* member;
    AttributeTable* attr_table = create_attribute_table(class->name);
    attr_table->size = class->size;
    list_append(status->tac->attribute_tables, (pointer)attr_table);
    while ((member = (ClassMember*)list_pop(members)) != NULL) {
        switch (member->type) {
            case CLASS_METHOD:
                tac_method(member->content.method, status);
                break;
            case CLASS_VARIABLE:
                tac_variable(member->content.variable, status, VAR_ATTR);
                break;
            default:
                fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
                break;
        }
    }
    status->current_class = NULL;
}
void tac_variable(Variable* variable, TACStatus* status, VarType type) {
    Var* var = NULL;
    switch (type) {
        case VAR_PARAM:
            var = create_var(variable->name, variable->type, type, status);
            list_append(status->current_subroutine->parameters, (pointer)var);
            break;
        case VAR_VAR: break;
        case VAR_TEMP: break;
        case VAR_SUBROUTINE:
            var = create_var(variable->name, variable->type, type, status);
            list_append(status->tac->global_vars, (pointer)var);
            break;
        case VAR_ATTR: {
            AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
            list_append(status->tac->attribute_tables, (pointer)attr_table);
            create_attribute(variable->name, variable->type, attr_table, 0, status);
            break;
        }
        case VAR_BLOCK:
        default:
            fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
            break;
    }
}
void tac_statement(Statement* statement, TACStatus* status) {
    switch (statement->type) {
        case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
        case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
        case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
        case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
        case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
        case RETURN_STATEMENT: {
            Arg* return_value = create_arg(ARG_VOID, NULL);
            if (statement->stmt.return_expr != NULL)
                return_value = tac_expression(statement->stmt.return_expr, status);
            list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
            break;
        }
        case BREAK_STATEMENT:
            if (!list_is_empty(status->end_labels)) {
                Arg* label = (Arg*)status->end_labels->tail->content;
                if (label != NULL) {
                    Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
                    list_append(status->current_block->instructions, (pointer)inst);
                    break;
                }
            }
            fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
            break;
        case CONTINUE_STATEMENT:
            if (!list_is_empty(status->start_labels)) {
                Arg* label = (Arg*)status->start_labels->tail->content;
                if (label != NULL) {
                    Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
                    list_append(status->current_block->instructions, (pointer)inst);
                    break;
                }
            }
            fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
            break;
        default:
            fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
            break;
    }
}
void tac_if(If* if_, TACStatus* status) {
    Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = NULL;
    if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
        end_label = else_label;
    else
        end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
    Arg* condition = tac_expression(if_->condition, status);
    Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
    list_append(status->current_block->instructions, (pointer)inst);
    Block* then_block = create_block(then_label);
    list_append(status->current_subroutine->blocks, (pointer)then_block);
    status->current_block = then_block;
    List* then_statements = list_copy(if_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(then_statements)) != NULL)
        tac_statement(statement, status);
    Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
    list_append(status->current_block->instructions, (pointer)jump_to_end);
    if (!list_is_empty(if_->else_if)) {
        List* elif_list = list_copy(if_->else_if);
        ElseIf* elif;
        while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
            Block* else_if_block = create_block(else_label);
            list_append(status->current_subroutine->blocks, (pointer)else_if_block);
            status->current_block = else_if_block;
            then_label = create_var(NULL, NULL, VAR_BLOCK, status);
            else_label = create_var(NULL, NULL, VAR_BLOCK, status);
            condition = tac_expression(elif->condition, status);
            if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
                else_label = end_label;
            inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
            list_append(status->current_block->instructions, (pointer)inst);
            then_block = create_block(then_label);
            list_append(status->current_subroutine->blocks, (pointer)then_block);
            status->current_block = then_block;
            List* elif_statements = list_copy(elif->body);
            Statement* elif_statement;
            while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
                tac_statement(elif_statement, status);
            jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
            list_append(status->current_block->instructions, (pointer)jump_to_end);
        }
    }
    if (!list_is_empty(if_->else_body)) {
        Block* else_block = create_block(else_label);
        list_append(status->current_subroutine->blocks, (pointer)else_block);
        status->current_block = else_block;
        List* else_statements = list_copy(if_->else_body);
        Statement* else_statement;
        while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
            tac_statement(else_statement, status);
        jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
        list_append(status->current_block->instructions, (pointer)jump_to_end);
    }
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
void tac_for(For* for_, TACStatus* status) {
    if (for_->initializer != NULL)
        tac_variable(for_->initializer, status, VAR_VAR);
    Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    if (for_->condition != NULL) {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* condition_block = create_block(condition_label);
        list_append(status->current_subroutine->blocks, (pointer)condition_block);
        status->current_block = condition_block;
        Arg* condition = tac_expression(for_->condition, status);
        inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
        list_append(status->current_block->instructions, (pointer)inst);
    } else {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
    }
    Block* body_block = create_block(body_label);
    list_append(status->current_subroutine->blocks, (pointer)body_block);
    status->current_block = body_block;
    Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
    if (for_->increment != NULL)
        list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
    else if (for_->condition != NULL)
        list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
    else
        list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
    list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
    List* body_statements = list_copy(for_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(body_statements)) != NULL)
        tac_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    if (for_->increment != NULL) {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* increment_block = create_block(increment_label);
        list_append(status->current_subroutine->blocks, (pointer)increment_block);
        status->current_block = increment_block;
        tac_expression(for_->increment, status);
    }
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    if (for_->condition == NULL)
        inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
void tac_while(While* while_, TACStatus* status) {
    Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* condition_block = create_block(condition_label);
    list_append(status->current_subroutine->blocks, (pointer)condition_block);
    status->current_block = condition_block;
    Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Arg* condition = tac_expression(while_->condition, status);
    inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
    list_append(status->current_block->instructions, (pointer)inst);
    Block* body_block = create_block(body_label);
    list_append(status->current_subroutine->blocks, (pointer)body_block);
    status->current_block = body_block;
    list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
    list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
    List* body_statements = list_copy(while_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(body_statements)) != NULL)
        tac_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
Arg* tac_expression(Expression* expression, TACStatus* status) {
    if (expression->operator == OP_NONE) {
        Arg* result = tac_primary(expression->prim_left, status);
        return result;
    }
    Arg* right = load_rvalue(tac_expression(expression->right, status), status);
    InstructionType op = get_instruction_type(expression->operator);
    Arg* left = tac_expression(expression->expr_left, status);
    Instruction* inst;
    if (is_assignment_operator(expression->operator)) {
        if (op != INST_ASSIGN) {
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
            inst = create_instruction(op, temp, load_rvalue(left, status), right);
            list_append(status->current_block->instructions, (pointer)inst);
            right = temp;
        }
        if (left->kind != ARG_VARIABLE)
            fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
        inst = create_instruction(INST_ASSIGN, left, right, NULL);
        if (left->is_get)
            inst = create_instruction(INST_STORE, left, right, NULL);
    } else {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
        inst = create_instruction(op, temp, load_rvalue(left, status), right);
        right = temp;
    }
    list_append(status->current_block->instructions, (pointer)inst);
    return right;
}
Arg* tac_primary(Primary* primary, TACStatus* status) {
    switch (primary->type) {
        case PRIM_INTEGER: {
            long long t = strtoll(primary->value.literal_value, NULL, 10);
            return create_arg(ARG_INT, &t);
        }
        case PRIM_FLOAT: {
            double t = strtod(primary->value.literal_value, NULL);
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
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
            Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
            return temp;
        }
        case PRIM_NEG_OPERAND: {
            Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
            Instruction* inst = NULL;
            long long zero_int = 0;
            double neg_one_float = -1.0;
            if (operand->type == name_int)
                inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
            else if (operand->type == name_float)
                inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
            else {
                fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
                return NULL;
            }
            list_append(status->current_block->instructions, (pointer)inst);
            return temp;
        }
        case PRIM_VARIABLE_ACCESS:
            return tac_variable_access(primary->value.var, status);
        default:
            fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
            return NULL;
    }
}
Arg* tac_variable_access(VariableAccess* variable_access, TACStatus* status) {
    if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
        if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
            Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
            return result;
        } else {
            Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
            return result;
        }
    }
    if (variable_access->base == NULL) {
        fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
        return NULL;
    }
    Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
    if (base == NULL) {
        fprintf(stderr, "[warning] Failed to generate variable access for base\n");
        return NULL;
    }
    if (variable_access->type == VAR_GET_ATTR) {
        if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
            fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
            return NULL;
        }
        SymbolTable* scope = base->type->ast_node.scope;
        if (base->type->kind == SYMBOL_CLASS)
            scope = base->type->ast_node.class->class_scope;
        Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
        if (attr == NULL) {
            fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
            return NULL;
        }
        if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
            return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        if (attr->kind != SYMBOL_ATTRIBUTE) {
            fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
            return NULL;
        }
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
        temp->is_get = 1;
        list_append(status->current_block->instructions, (pointer)inst);
        return temp;
    } else if (variable_access->type == VAR_GET_SEQ) {
        if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
            fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
            return NULL;
        }
        if (strcmp(base->type->name, "arr") != 0) {
            fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
            return NULL;
        }
        Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
        if (index == NULL) {
            fprintf(stderr, "[warning] Failed to generate variable access for index\n");
            return NULL;
        }
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
        temp->is_get = 1;
        list_append(status->current_block->instructions, (pointer)inst);
        return temp;
    } else if (variable_access->type == VAR_FUNC_CALL) {
        if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
            Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
            base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
        }
        if (base->kind != ARG_SUBROUTINE) {
            fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
            return NULL;
        }
        List* args = list_copy(variable_access->content.args);
        Expression* arg_expr;
        long long arg_count = 0;
        while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
            Arg* arg = tac_expression(arg_expr, status);
            long long size = (long long)get_type_size(arg->type);
            Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
            arg_count++;
        }
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
        list_append(status->current_block->instructions, (pointer)inst);
        return temp;
    } else {
        fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
        return NULL;
    }
}
