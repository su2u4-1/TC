#include "analyzer.h"

#include "output.h"

static void analyze_import(Import* import);
static void analyze_class(Class* class);
static void analyze_function(Function* function);
static void analyze_method(Method* method);
static void analyze_variable(Variable* variable);
static void analyze_type(Symbol* type);
static void analyze_statement(Statement* statement);
static void analyze_body(list(Statement*) body);
static void analyze_expression(Expression* expression);
static void analyze_if(If* if_);
static void analyze_for(For* for_);
static void analyze_while(While* while_);
static void analyze_primary(Primary* primary);
static void analyze_variable_access(VariableAccess* variable_access);

AST* analyzer(AST* ast) {
    assert(ast != NULL);
    assert(ast->file != NULL);
    assert(ast->members != NULL);
    assert(!list_empty(ast->members));
    assert(ast->table != NULL);
    foreach (CodeMember*, member, ast->members) {
        switch (member->type) {
            case CODE_CLASS: analyze_class(member->member.class); break;
            case CODE_FUNCTION: analyze_function(member->member.function); break;
            case CODE_IMPORT: analyze_import(member->member.import); break;
            default: assert(false);
        }
    }
    return ast;
}

void analyze_import(Import* import) {
    assert(import != NULL);
    assert(import->path != NULL);
    FILE* file = fopen(import->path, "r");
    assert(file != NULL);
    fclose(file);
    assert(import->name != NULL);
}

void analyze_class(Class* class) {
    assert(class != NULL);
    assert(class->name != NULL);
    assert(class->members != NULL);
    assert(!list_empty(class->members));
    assert(class->table != NULL);
}

void analyze_function(Function* function) {
    assert(function != NULL);
    assert(function->name != NULL);
    assert(function->type != NULL);
    assert(function->parameters != NULL);
    assert(function->body != NULL);
    assert(!list_empty(function->body));
}
