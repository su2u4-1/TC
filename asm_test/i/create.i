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
CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
    CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
    code_member->type = type;
    if (type == CODE_IMPORT && import_content != NULL)
        code_member->content.import = import_content;
    else if (type == CODE_FUNCTION && function_content != NULL)
        code_member->content.function = function_content;
    else if (type == CODE_CLASS && class_content != NULL)
        code_member->content.class_ = class_content;
    else {
        if (import_content == 0 && function_content == 0 && class_content == 0)
            fprintf(stderr, "Error creating code member: content is NULL\n");
        else
            fprintf(stderr, "Error creating code member: unknown type %d\n", type);
        return 0;
    }
    return code_member;
}
Code* create_code(List* members, Scope* global_scope) {
    Code* code = (Code*)alloc_memory(sizeof(Code));
    Code* code_ptr = code;
    code_ptr->members = members;
    code_ptr->global_scope = global_scope;
    return code;
}
Import* create_import(Name* name, string source) {
    if (name == 0) {
        fprintf(stderr, "Error creating import: name is NULL\n");
        return 0;
    }
    Import* import = (Import*)alloc_memory(sizeof(Import));
    Import* import_ptr = import;
    import_ptr->name = name;
    import_ptr->source = source;
    return import;
}
Function* create_function(Name* name, Name* return_type, List* parameters, List* body, Scope* function_scope) {
    if (name == 0 || return_type == 0) {
        fprintf(stderr, "Error creating function: name or return_type is NULL\n");
        return 0;
    }
    Function* function = (Function*)alloc_memory(sizeof(Function));
    Function* function_ptr = function;
    function_ptr->name = name;
    function_ptr->return_type = return_type;
    function_ptr->parameters = parameters;
    function_ptr->body = body;
    function_ptr->function_scope = function_scope;
    return function;
}
Method* create_method(Name* name, Name* return_type, List* parameters, List* body, Scope* method_scope) {
    if (name == 0 || return_type == 0) {
        fprintf(stderr, "Error creating method: name or return_type is NULL\n");
        return 0;
    }
    Method* method = (Method*)alloc_memory(sizeof(Method));
    Method* method_ptr = method;
    method_ptr->name = name;
    method_ptr->return_type = return_type;
    method_ptr->parameters = parameters;
    method_ptr->body = body;
    method_ptr->method_scope = method_scope;
    return method;
}
ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
    ClassMember* class_member_ptr = class_member;
    class_member_ptr->type = type;
    if (type == CLASS_METHOD && method_content != NULL)
        class_member_ptr->content.method = method_content;
    else if (type == CLASS_VARIABLE && variable_content != NULL)
        class_member_ptr->content.variable = variable_content;
    else {
        if (method_content == 0 && variable_content == 0)
            fprintf(stderr, "Error creating class member: content is NULL\n");
        else
            fprintf(stderr, "Error creating class member: unknown type %d\n", type);
        return 0;
    }
    return class_member;
}
Class* create_class(Name* name, List* members, Scope* class_scope) {
    if (name == 0) {
        fprintf(stderr, "Error creating class: name is NULL\n");
        return 0;
    }
    Class* class = (Class*)alloc_memory(sizeof(Class));
    Class* class_ptr = class;
    class_ptr->name = name;
    class_ptr->members = members;
    class_ptr->class_scope = class_scope;
    return class;
}
Variable* create_variable(Name* type, Name* name, Expression* value) {
    if (type == 0 || name == 0) {
        fprintf(stderr, "Error creating variable: type or name is NULL\n");
        return 0;
    }
    Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
    Variable* variable_ptr = variable;
    variable_ptr->type = type;
    variable_ptr->name = name;
    variable_ptr->value = value;
    return variable;
}
Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
    Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
    Statement* statement_ptr = statement;
    statement_ptr->type = type;
    if (type == EXPRESSION_STATEMENT && expr != 0)
        statement_ptr->stmt.expr = expr;
    else if (type == VARIABLE_STATEMENT && var_stmt != 0)
        statement_ptr->stmt.var = var_stmt;
    else if (type == IF_STATEMENT && if_stmt != 0)
        statement_ptr->stmt.if_stmt = if_stmt;
    else if (type == WHILE_STATEMENT && while_stmt != 0)
        statement_ptr->stmt.while_stmt = while_stmt;
    else if (type == FOR_STATEMENT && for_stmt != 0)
        statement_ptr->stmt.for_stmt = for_stmt;
    else if (type == RETURN_STATEMENT && expr != 0)
        statement_ptr->stmt.return_expr = expr;
    else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
        statement_ptr->stmt.expr = 0;
    else {
        if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
            fprintf(stderr, "Error creating statement: content is NULL\n");
        else
            fprintf(stderr, "Error creating statement: unknown type %d\n", type);
        return 0;
    }
    return statement;
}
If* create_if(Expression* condition, List* body, List* else_if, List* else_body) {
    if (condition == 0) {
        fprintf(stderr, "Error creating if statement: condition is NULL\n");
        return 0;
    }
    If* if_ = (If*)alloc_memory(sizeof(If));
    If* if_ptr = if_;
    if_ptr->condition = condition;
    if_ptr->body = body;
    if_ptr->else_if = else_if;
    if_ptr->else_body = else_body;
    return if_;
}
ElseIf* create_else_if(Expression* condition, List* body) {
    if (condition == 0) {
        fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
        return 0;
    }
    ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
    ElseIf* else_if_ptr = else_if;
    else_if_ptr->condition = condition;
    else_if_ptr->body = body;
    return else_if;
}
For* create_for(Variable* initializer, Expression* condition, Expression* increment, List* body) {
    For* for_ = (For*)alloc_memory(sizeof(For));
    For* for_ptr = for_;
    for_ptr->initializer = initializer;
    for_ptr->condition = condition;
    for_ptr->increment = increment;
    for_ptr->body = body;
    return for_;
}
While* create_while(Expression* condition, List* body) {
    While* while_ = (While*)alloc_memory(sizeof(While));
    While* while_ptr = while_;
    while_ptr->condition = condition;
    while_ptr->body = body;
    return while_;
}
Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
    if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
        fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
                operator == OP_NONE ? "true" : "false",
                expr_left == 0 ? "true" : "false",
                prim_left == 0 ? "true" : "false",
                right == 0 ? "true" : "false");
        return 0;
    }
    Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
    Expression* expression_ptr = expression;
    expression_ptr->operator = operator;
    if (expr_left != 0)
        expression_ptr->expr_left = expr_left;
    else if (prim_left != 0)
        expression_ptr->prim_left = prim_left;
    else {
        fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
        return 0;
    }
    expression_ptr->right = right;
    return expression;
}
Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
    Primary* primary_ptr = primary;
    primary_ptr->type = type;
    if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
        primary_ptr->value.literal_value = str_value;
    else if (type == PRIM_EXPRESSION && expr_value != 0)
        primary_ptr->value.expr = expr_value;
    else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
        primary_ptr->value.operand = prim_value;
    else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
        primary_ptr->value.var = variable_value;
    else {
        if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
            fprintf(stderr, "Error creating primary: value is NULL\n");
        else
            fprintf(stderr, "Error creating primary: unknown type %d\n", type);
        return 0;
    }
    return primary;
}
VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, List* args_content) {
    if ((base == 0) != (type == VAR_NAME)) {
        fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
        return 0;
    }
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
    VariableAccess* variable_access_ptr = variable_access;
    variable_access_ptr->type = type;
    variable_access_ptr->base = base;
    if (type == VAR_NAME && name_content != 0)
        variable_access_ptr->content.name = name_content;
    else if (type == VAR_FUNC_CALL && args_content != 0)
        variable_access_ptr->content.args = args_content;
    else if (type == VAR_GET_SEQ && expr_content != 0)
        variable_access_ptr->content.index = expr_content;
    else if (type == VAR_GET_ATTR && name_content != 0)
        variable_access_ptr->content.attr_name = name_content;
    else {
        if (name_content == 0 && expr_content == 0 && args_content == 0)
            fprintf(stderr, "Error creating variable access: content is NULL\n");
        else
            fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
        return 0;
    }
    return variable_access;
}
