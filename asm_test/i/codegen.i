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
    Symbol* var_name;
    Symbol* type;
    size_t offset;
} Attribute;
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
typedef enum VarType {
    VAR_ATTR = 'a',
    VAR_PARAM = 'p',
    VAR_VAR = 'v',
    VAR_TEMP = 't',
    VAR_BLOCK = 'b',
    VAR_SUBROUTINE = 'f'
} VarType;
TAC* codegen_code(Code* code);
void codegen_import(Import* import, TAC* tac, TACStatus* status);
void codegen_function(Function* function, TACStatus* status);
void codegen_method(Method* method, TACStatus* status);
void codegen_class_member(ClassMember* class_member, TACStatus* status);
void codegen_class(Class* class, TACStatus* status);
void codegen_variable(Variable* variable, TACStatus* status, VarType type);
void codegen_statement(Statement* statement, TACStatus* status);
void codegen_if(If* if_, TACStatus* status);
void codegen_else_if(ElseIf* else_if, TACStatus* status);
void codegen_for(For* for_, TACStatus* status);
void codegen_while(While* while_, TACStatus* status);
Arg* codegen_expression(Expression* expression, TACStatus* status);
Arg* codegen_primary(Primary* primary, TACStatus* status);
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status);
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
static AttributeTable* find_attribute_table(TACStatus* status, Symbol* name) {
    List* attribute_tables = list_copy(status->tac->attribute_tables);
    AttributeTable* current;
    while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
        if (current->name == name)
            return current;
    return NULL;
}
static AttributeTable* create_attribute_table(Symbol* name) {
    AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
    table->attributes = create_list();
    table->name = name;
    table->size = 0;
    return table;
}
static size_t get_type_size(Symbol* type) {
    if (type == NULL)
        return 0;
    if (type == name_int || type == name_float || type == name_string)
        return 8;
    if (type == name_bool || type == name_void)
        return 1;
    if (type->kind == SYMBOL_CLASS)
        return type->ast_node.class->size;
    fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
    return 8;
}
static Attribute* create_attribute(Symbol* var_name, Symbol* type, AttributeTable* table, size_t offset) {
    Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
    attr->var_name = var_name;
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
static char is_assignment_operator(OperatorType op) {
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
static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
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
    return var;
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
    if (arg == NULL)
        return NULL;
    if (arg->is_get) {
        Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
        list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
        return temp;
    }
    return arg;
}
static Var* find_var_by_symbol(List* vars, Symbol* symbol) {
    if (vars == NULL || symbol == NULL)
        return NULL;
    Node* current = vars->head;
    while (current != NULL) {
        Var* var = (Var*)current->content;
        if (var != NULL && var->original_name == symbol)
            return var;
        current = current->next;
    }
    return NULL;
}
static Var* resolve_named_var(Symbol* symbol, TACStatus* status) {
    if (symbol == NULL || status == NULL)
        return NULL;
    if (status->current_subroutine != NULL) {
        Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
        if (var != NULL)
            return var;
        var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
        if (var != NULL)
            return var;
    }
    return find_var_by_symbol(status->tac->global_vars, symbol);
}
static Var* find_self_parameter(TACStatus* status) {
    if (status == NULL || status->current_subroutine == NULL)
        return NULL;
    Node* current = status->current_subroutine->parameters->head;
    while (current != NULL) {
        Var* var = (Var*)current->content;
        if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
            return var;
        current = current->next;
    }
    return NULL;
}
static Var* create_attribute_ref_var(Symbol* class_type, Symbol* attr_name, TACStatus* status) {
    if (attr_name == NULL)
        return NULL;
    AttributeTable* table = find_attribute_table(status, class_type);
    if (table == NULL || table->attributes == NULL)
        return create_var(attr_name, attr_name->type, VAR_ATTR, status);
    size_t index = 0;
    char found = 0;
    List* attrs = list_copy(table->attributes);
    Attribute* attr;
    while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
        if (attr->var_name == attr_name) {
            found = 1;
            break;
        }
        ++index;
    }
    Var* var = (Var*)alloc_memory(sizeof(Var));
    var->original_name = attr_name;
    var->type = attr_name->type;
    var->name = create_string("", 32);
    if (!found)
        fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
    sprintf(var->name, "$a%zu", index);
    return var;
}
static Arg* emit_attribute_access(Arg* object, Symbol* attr_name, TACStatus* status) {
    if (object == NULL || attr_name == NULL) {
        fprintf(stderr, "[warning] Invalid attribute access\n");
        return NULL;
    }
    Arg* object_value = load_rvalue(object, status);
    if (object_value == NULL)
        return NULL;
    Symbol* class_type = NULL;
    if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
        class_type = object_value->type;
    Var* attr_var = create_attribute_ref_var(class_type, attr_name, status);
    Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
    Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
    list_append(status->current_block->instructions, (pointer)inst);
    result->is_get = 1;
    return result;
}
static void emit_param_instruction(Arg* value, TACStatus* status) {
    if (value == NULL || status == NULL)
        return;
    long long size = (long long)get_type_size(value->type);
    Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
}
TAC* codegen_code(Code* code) {
    TAC* tac = create_tac();
    TACStatus* status = create_tac_status(tac);
    List* members = list_copy(code->members);
    CodeMember* code_member;
    while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
        if (code_member->type == CODE_FUNCTION) {
            codegen_function(code_member->content.function, status);
            if (strcmp(code_member->content.function->name->name, "main") == 0)
                tac->entry_point = code_member->content.function->name;
        } else if (code_member->type == CODE_CLASS)
            codegen_class(code_member->content.class, status);
        else if (code_member->type == CODE_IMPORT)
            codegen_import(code_member->content.import, tac, status);
    }
    return tac;
}
void codegen_import(Import* import, TAC* tac, TACStatus* status) {
    if (import->name->kind == SYMBOL_VARIABLE)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
    else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
        list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
    else if (import->name->kind == SYMBOL_CLASS)
        list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
    else
        fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
}
void codegen_function(Function* function, TACStatus* status) {
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
        codegen_statement(statement, status);
    status->current_subroutine = NULL;
}
void codegen_method(Method* method, TACStatus* status) {
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
    List* statements = list_copy(method->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(statements)) != NULL)
        codegen_statement(statement, status);
    status->current_subroutine = NULL;
}
void codegen_class(Class* class, TACStatus* status) {
    List* members = list_copy(class->members);
    ClassMember* member;
    AttributeTable* attr_table = create_attribute_table(class->name);
    attr_table->size = class->size;
    list_append(status->tac->attribute_tables, (pointer)attr_table);
    while ((member = (ClassMember*)list_pop(members)) != NULL) {
        switch (member->type) {
            case CLASS_METHOD:
                codegen_method(member->content.method, status);
                break;
            case CLASS_VARIABLE:
                codegen_variable(member->content.variable, status, VAR_ATTR);
                break;
            default:
                fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
                break;
        }
    }
}
void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
    Var* var = create_var(variable->name, variable->type, type, status);
    switch (type) {
        case VAR_PARAM:
            list_append(status->current_subroutine->parameters, (pointer)var);
            break;
        case VAR_VAR:
            list_append(status->current_subroutine->local_vars, (pointer)var);
            break;
        case VAR_TEMP:
            list_append(status->current_subroutine->local_vars, (pointer)var);
            break;
        case VAR_SUBROUTINE:
            list_append(status->tac->global_vars, (pointer)var);
            break;
        case VAR_ATTR: {
            AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
            list_append(status->tac->attribute_tables, (pointer)attr_table);
            create_attribute(variable->name, variable->type, attr_table, 0);
            break;
        }
        case VAR_BLOCK:
        default:
            fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
            break;
    }
}
void codegen_statement(Statement* statement, TACStatus* status) {
    switch (statement->type) {
        case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
        case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
        case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
        case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
        case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
        case RETURN_STATEMENT: {
            Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
            Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
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
            fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
            break;
    }
}
void codegen_if(If* if_, TACStatus* status) {
    Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = NULL;
    if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
        end_label = else_label;
    else
        end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
    Arg* condition = codegen_expression(if_->condition, status);
    Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
    list_append(status->current_block->instructions, (pointer)inst);
    Block* then_block = create_block(then_label);
    list_append(status->current_subroutine->blocks, (pointer)then_block);
    status->current_block = then_block;
    List* then_statements = list_copy(if_->body);
    Statement* statement;
    while ((statement = (Statement*)list_pop(then_statements)) != NULL)
        codegen_statement(statement, status);
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
            condition = codegen_expression(elif->condition, status);
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
                codegen_statement(elif_statement, status);
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
            codegen_statement(else_statement, status);
        jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
        list_append(status->current_block->instructions, (pointer)jump_to_end);
    }
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
void codegen_for(For* for_, TACStatus* status) {
    if (for_->initializer != NULL)
        codegen_variable(for_->initializer, status, VAR_VAR);
    Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    if (for_->condition != NULL) {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* condition_block = create_block(condition_label);
        list_append(status->current_subroutine->blocks, (pointer)condition_block);
        status->current_block = condition_block;
        Arg* condition = codegen_expression(for_->condition, status);
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
        codegen_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    if (for_->increment != NULL) {
        Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
        list_append(status->current_block->instructions, (pointer)inst);
        Block* increment_block = create_block(increment_label);
        list_append(status->current_subroutine->blocks, (pointer)increment_block);
        status->current_block = increment_block;
        codegen_expression(for_->increment, status);
    }
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    if (for_->condition == NULL)
        inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
void codegen_while(While* while_, TACStatus* status) {
    Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* condition_block = create_block(condition_label);
    list_append(status->current_subroutine->blocks, (pointer)condition_block);
    status->current_block = condition_block;
    Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
    Arg* condition = codegen_expression(while_->condition, status);
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
        codegen_statement(statement, status);
    list_pop_back(status->start_labels);
    list_pop_back(status->end_labels);
    inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
    list_append(status->current_block->instructions, (pointer)inst);
    Block* end_block = create_block(end_label);
    list_append(status->current_subroutine->blocks, (pointer)end_block);
    status->current_block = end_block;
}
Arg* codegen_expression(Expression* expression, TACStatus* status) {
    if (expression->operator == OP_NONE)
        return codegen_primary(expression->prim_left, status);
    Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
    InstructionType op = get_instruction_type(expression->operator);
    Arg* left = codegen_expression(expression->expr_left, status);
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
Arg* codegen_primary(Primary* primary, TACStatus* status) {
    switch (primary->type) {
        case PRIM_INTEGER: {
            long long t = strtoll(primary->value.literal_value, NULL, 10);
            return create_arg(ARG_INT, &t);
        }
        case PRIM_FLOAT: {
            double t = strtod(primary->value.literal_value, NULL);
            return create_arg(ARG_FLOAT, &t);
        }
        case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
        case PRIM_TRUE: {
            char t = 1;
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_FALSE: {
            char t = 0;
            return create_arg(ARG_BOOL, &t);
        }
        case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
        case PRIM_NOT_OPERAND: {
            Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
            Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
            Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
            list_append(status->current_block->instructions, (pointer)inst);
            return temp;
        }
        case PRIM_NEG_OPERAND: {
            Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
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
        case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
        default:
            fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
            return NULL;
    }
}
Arg* codegen_variable_access(VariableAccess* variable_access, TACStatus* status) {
    if (variable_access == NULL || status == NULL) {
        fprintf(stderr, "[warning] Invalid variable access input\n");
        return NULL;
    }
    if (variable_access->type == VAR_NAME) {
        Symbol* name = variable_access->content.name;
        if (name == NULL) {
            fprintf(stderr, "[warning] Variable access name is NULL\n");
            return NULL;
        }
        Var* existing = resolve_named_var(name, status);
        if (existing != NULL)
            return create_arg(ARG_VARIABLE, existing);
        if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
            return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
        Var* self = find_self_parameter(status);
        if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
            return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
        fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
        return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
    }
    if (variable_access->type == VAR_GET_ATTR) {
        if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
            fprintf(stderr, "[warning] Invalid get-attribute access\n");
            return NULL;
        }
        Symbol* attr_name = variable_access->content.attr_name;
        if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
            return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
        Arg* object = codegen_variable_access(variable_access->base, status);
        if (object == NULL) {
            fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
            return NULL;
        }
        return emit_attribute_access(object, attr_name, status);
    }
    if (variable_access->type == VAR_GET_SEQ) {
        if (variable_access->base == NULL || variable_access->content.index == NULL) {
            fprintf(stderr, "[warning] Invalid get-sequence access\n");
            return NULL;
        }
        Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
        Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
        if (sequence == NULL || index == NULL) {
            fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
            return NULL;
        }
        Symbol* element_type = name_int;
        if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
            element_type = sequence->type;
        Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
        Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
        list_append(status->current_block->instructions, (pointer)inst);
        result->is_get = 1;
        return result;
    }
    if (variable_access->type == VAR_FUNC_CALL) {
        if (variable_access->base == NULL) {
            fprintf(stderr, "[warning] Invalid function call without callee\n");
            return NULL;
        }
        Symbol* callee_name = NULL;
        Arg* receiver = NULL;
        VariableAccess* callee_access = variable_access->base;
        if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
            (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
            callee_name = callee_access->content.attr_name;
            if (callee_access->base != NULL) {
                char is_class_constructor_call = 0;
                if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
                    is_class_constructor_call = 1;
                if (!is_class_constructor_call)
                    receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
            }
        }
        if (callee_name == NULL) {
            Arg* callee = codegen_variable_access(callee_access, status);
            if (callee == NULL) {
                fprintf(stderr, "[warning] Failed to generate callee for function call\n");
                return NULL;
            }
            if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
                callee_name = callee->value.subroutine->original_name;
            else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
                Symbol* maybe_subroutine = callee->value.variable->original_name;
                if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
                    callee_name = maybe_subroutine;
            }
        }
        if (callee_name == NULL) {
            fprintf(stderr, "[warning] Unsupported callee in function call\n");
            return NULL;
        }
        size_t argument_count = 0;
        if (receiver != NULL) {
            emit_param_instruction(receiver, status);
            ++argument_count;
        }
        List* args = list_copy(variable_access->content.args);
        Expression* arg_expr;
        while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
            Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
            if (arg_value == NULL) {
                fprintf(stderr, "[warning] Failed to generate function call argument\n");
                return NULL;
            }
            emit_param_instruction(arg_value, status);
            ++argument_count;
        }
        Arg* result = create_arg(ARG_VOID, NULL);
        if (callee_name->type != NULL && callee_name->type != name_void)
            result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
        long long count = (long long)argument_count;
        Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
        Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
        list_append(status->current_block->instructions, (pointer)call_inst);
        return result;
    }
    fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
    return NULL;
}
