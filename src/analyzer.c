#include "analyzer.h"

#include "lib.h"
#include "output.h"
#include "symbol_table.h"

static void fill_symbol_offset(SymbolTable* table);
static size_t get_type_size(Symbol* type);

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
static void analyze_symbol(Symbol* symbol);

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

size_t get_type_size(Symbol* type) {
    if (type->kind == SYMBOL_CLASS)
        return pointer_size;
    // TODO: support array and other container types
    // if (strcmp(type->type->name, "arr") == 0)
    //     return type->info.size * get_type_size(type->type);
    return type->info.size;
}

void fill_symbol_offset(SymbolTable* table) {
    assert(table != NULL);
    size_t offset = 0;
    foreach (Symbol*, symbol, table->symbols) {
        if (symbol->kind == SYMBOL_VARIABLE || symbol->kind == SYMBOL_PARAMETER || symbol->kind == SYMBOL_ATTRIBUTE) {
            symbol->info.offset = offset;
            assert(symbol->type != NULL);
            assert(symbol->type->kind == SYMBOL_TYPE || symbol->type->kind == SYMBOL_CLASS);
            offset += get_type_size(symbol->type);
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
    analyze_symbol(import->name);
}

void analyze_class(Class* class) {
    assert(class != NULL);
    analyze_symbol(class->name);
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
    analyze_symbol(function->name);
    analyze_type(function->type);
    assert(function->parameters != NULL);
    if (!list_empty(function->parameters)) {
        foreach (Symbol*, symbol, function->parameters) {
            analyze_symbol(symbol);
            assert(symbol->kind == SYMBOL_PARAMETER);
        }
    }
    analyze_body(function->body);
}

void analyze_method(Method* method) {
    assert(method != NULL);
    analyze_symbol(method->name);
    analyze_type(method->type);
    assert(!list_empty(method->parameters));
    foreach (Symbol*, symbol, method->parameters) {
        analyze_symbol(symbol);
        assert(symbol->kind == SYMBOL_PARAMETER);
    }
    analyze_body(method->body);
}

void analyze_variable(Variable* variable) {
    assert(variable != NULL);
    analyze_symbol(variable->var);
    analyze_type(variable->var->type);
    if (variable->initializer != NULL)
        analyze_expression(variable->initializer);
}

void analyze_type(Symbol* type) {
    assert(type != NULL);
    assert(type->name != NULL);
    assert(type->kind == SYMBOL_TYPE || type->kind == SYMBOL_CLASS);
    if (type->type != NULL) {
        assert(type->kind == SYMBOL_TYPE);
        // TODO: check type is container type
        analyze_type(type->type);
    }
    if (type->kind == SYMBOL_CLASS)
        assert(type->info.class != NULL);
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
    assert(expression != NULL);
    if (expression->op == OP_NONE) {
        analyze_primary(expression->left.unary);
    } else {
        analyze_expression(expression->left.binary);
        analyze_expression(expression->right);
    }
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
    assert(primary != NULL);
    switch (primary->type) {
        case PRIMARY_INT:
        case PRIMARY_FLOAT:
        case PRIMARY_STRING:
        case PRIMARY_BOOL:
            assert(primary->value.literal != NULL);
            break;
        case PRIMARY_NOT:
            analyze_primary(primary->value.not);
            break;
        case PRIMARY_NEG:
            analyze_primary(primary->value.neg);
            break;
        case PRIMARY_EXPR:
            analyze_expression(primary->value.exp);
            break;
        case PRIMARY_VAR_ACCESS:
            analyze_variable_access(primary->value.var_access);
            break;
        default:
            assert(false);
    }
}

void analyze_variable_access(VariableAccess* variable_access) {
    assert(variable_access != NULL);
    if (variable_access->base != NULL)
        analyze_variable_access(variable_access->base);
    switch (variable_access->type) {
        case VAR_ACCESS_VAR:
            assert(variable_access->access.var != NULL);
            analyze_symbol(variable_access->access.var);
            assert(variable_access->base == NULL);
            break;
        case VAR_ACCESS_CALL:
            assert(variable_access->access.args != NULL);
            foreach (Expression*, arg, variable_access->access.args)
                analyze_expression(arg);
            break;
        case VAR_ACCESS_ATTRIBUTE:
            assert(variable_access->access.attribute != NULL);
            analyze_symbol(variable_access->access.attribute);
            break;
        case VAR_ACCESS_INDEX:
            assert(variable_access->access.index != NULL);
            analyze_expression(variable_access->access.index);
            break;
        default:
            assert(false);
    }
}

void analyze_symbol(Symbol* symbol) {
    assert(symbol != NULL);
    assert(symbol->name != NULL);
    if (symbol->type != NULL)
        analyze_type(symbol->type);
}
