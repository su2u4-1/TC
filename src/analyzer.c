#include "analyzer.h"

#include "lib.h"
#include "output.h"
#include "symbol_table.h"

static void fill_symbol_offset(SymbolTable* table);

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
    assert(ast->table != NULL);
    fill_symbol_offset(ast->table);
    if (!list_empty(ast->members)) {
        foreach (CodeMember*, member, ast->members) {
            switch (member->type) {
                case CODE_CLASS: analyze_class(member->member.class); break;
                case CODE_FUNCTION: analyze_function(member->member.function); break;
                case CODE_IMPORT: analyze_import(member->member.import); break;
                default: assert(false);
            }
        }
    }
    return ast;
}

void fill_symbol_offset(SymbolTable* table) {
    assert(table != NULL);
    size_t offset = 0;
    foreach (Symbol*, symbol, table->symbols) {
        if (symbol->kind == SYMBOL_VARIABLE || symbol->kind == SYMBOL_PARAMETER || symbol->kind == SYMBOL_ATTRIBUTE) {
            symbol->info.offset = offset;
            assert(symbol->type != NULL);
            assert(symbol->type->kind == SYMBOL_TYPE || symbol->type->kind == SYMBOL_CLASS);
            offset += (symbol->type->kind == SYMBOL_TYPE) ? symbol->type->info.size : pointer_size;
        }
    }
    foreach (SymbolTable*, child, table->children)
        fill_symbol_offset(child);
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
    if (!list_empty(class->members)) {
        foreach (ClassMember*, member, class->members) {
            switch (member->type) {
                case CLASS_METHOD: analyze_method(member->member.method); break;
                case CLASS_ATTRIBUTE: analyze_variable(member->member.attribute); break;
                default: assert(false);
            }
        }
    }
}

void analyze_function(Function* function) {
    assert(function != NULL);
    assert(function->name != NULL);
    assert(function->type != NULL);
    assert(function->parameters != NULL);
    analyze_type(function->type);
    if (!list_empty(function->parameters)) {
        foreach (Symbol*, symbol, function->parameters) {
            assert(symbol->type != NULL);
            analyze_type(symbol);
            assert(symbol->name != NULL);
            assert(symbol->kind == SYMBOL_PARAMETER);
        }
    }
    analyze_body(function->body);
}

void analyze_method(Method* method) {
    assert(method != NULL);
    assert(method->name != NULL);
    assert(method->type != NULL);
    assert(!list_empty(method->parameters));
    analyze_type(method->type);
    foreach (Symbol*, symbol, method->parameters) {
        assert(symbol->type != NULL);
        analyze_type(symbol);
        assert(symbol->name != NULL);
        assert(symbol->kind == SYMBOL_PARAMETER);
    }
    analyze_body(method->body);
}

void analyze_variable(Variable* variable) {
    assert(variable != NULL);
    assert(variable->var != NULL);
    assert(variable->var->type != NULL);
    analyze_type(variable->var->type);
    if (variable->initializer != NULL)
        analyze_expression(variable->initializer);
}

void analyze_type(Symbol* type) {
    // TODO
}

void analyze_statement(Statement* statement) {
    assert(statement != NULL);
    switch (statement->type) {
        case STATEMENT_DECLARE_LIST:
            assert(!list_empty(statement->statement.declare_list));
            foreach (Variable*, var, statement->statement.declare_list)
                analyze_variable(var);
            break;
        case STATEMENT_DECLARE:
            analyze_variable(statement->statement.declare);
            break;
        case STATEMENT_IF:
            analyze_if(statement->statement.if_);
            break;
        case STATEMENT_FOR:
            analyze_for(statement->statement.for_);
            break;
        case STATEMENT_WHILE:
            analyze_while(statement->statement.while_);
            break;
        case STATEMENT_BREAK:
        case STATEMENT_CONTINUE:
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ != NULL)
                analyze_expression(statement->statement.return_);
            break;
        case STATEMENT_EXPRESSION:
            analyze_expression(statement->statement.expression);
            break;
        default:
            assert(false);
    }
}

void analyze_body(list(Statement*) body) {
    assert(body != NULL);
    if (list_empty(body)) return;
    foreach (Statement*, statement, body) {
        analyze_statement(statement);
    }
}

void analyze_expression(Expression* expression) {
    // TODO
}

void analyze_if(If* if_) {
    assert(if_ != NULL);
    analyze_expression(if_->condition);
    analyze_body(if_->body);
    if (!list_empty(if_->elif_list)) {
        foreach (If*, elif, if_->elif_list) {
            assert(elif != NULL);
            assert(elif->else_body == NULL);
            assert(elif->elif_list == NULL);
            analyze_expression(elif->condition);
            analyze_body(elif->body);
        }
    }
    if (!list_empty(if_->else_body))
        analyze_body(if_->else_body);
}

void analyze_for(For* for_) {
    assert(for_ != NULL);
    if (for_->init.decl != NULL) {
        if (!for_->is_decl) {
            analyze_variable(for_->init.decl);
        } else {
            assert(for_->init.expr != NULL);
            analyze_expression(for_->init.expr);
        }
    }
    if (for_->condition != NULL)
        analyze_expression(for_->condition);
    if (for_->increment != NULL)
        analyze_expression(for_->increment);
    analyze_body(for_->body);
}

void analyze_while(While* while_) {
    assert(while_ != NULL);
    analyze_expression(while_->condition);
    analyze_body(while_->body);
}

void analyze_primary(Primary* primary) {
    // TODO
}

void analyze_variable_access(VariableAccess* variable_access) {
    // TODO
}
