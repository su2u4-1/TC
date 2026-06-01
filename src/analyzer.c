#include "analyzer.h"

#include "lib.h"
#include "symbol_table.h"

static void fill_symbol_offset(SymbolTable* table, size_t base_offset);
static size_t get_type_size(Symbol* type);
static Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op);

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
    foreach (SymbolTable*, table, global_symbol_table->children) {
        fill_symbol_offset(table, 0);
    }
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
    return type->info.size;
}

void fill_symbol_offset(SymbolTable* table, size_t base_offset) {
    assert(table != NULL);
    size_t offset = base_offset;
    if (table->type == SYMBOL_TABLE_CLASS || table->type == SYMBOL_TABLE_FUNCTION || table->type == SYMBOL_TABLE_METHOD)
        offset = 0;
    foreach (Symbol*, symbol, table->symbols) {
        if (symbol->kind == SYMBOL_VARIABLE || symbol->kind == SYMBOL_PARAMETER || symbol->kind == SYMBOL_ATTRIBUTE) {
            symbol->info.offset = offset;
            assert(symbol->type != NULL);
            assert(symbol->type->kind == SYMBOL_TYPE || symbol->type->kind == SYMBOL_CLASS);
            offset += get_type_size(symbol->type);
        }
    }
    foreach (SymbolTable*, child, table->children)
        fill_symbol_offset(child, offset);
}

static bool is_number_type(Symbol* type) {
    return type == symbol_int || type == symbol_float || type == symbol_bool;
}
Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op) {
    assert(left != NULL);
    assert(left->kind == SYMBOL_TYPE || left->kind == SYMBOL_CLASS);
    if (right == NULL) {
        if (op == OP_NONE)
            return left;
        if ((left == symbol_int || left == symbol_float) && (op == OP_NEG))
            return left;
        if (op == OP_NOT)
            return symbol_bool;
    }
    assert(right != NULL);
    assert(right->kind == SYMBOL_TYPE || right->kind == SYMBOL_CLASS);
    if (op == OP_AND || op == OP_OR || op == OP_EQ || op == OP_NE)
        return symbol_bool;
    if (left == right) {
        if (op == OP_ASSIGN)
            return left;
        if (is_number_type(left) && (op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN))
            return left;
        if (is_number_type(left) && (op == OP_ADD || op == OP_SUB || op == OP_MUL || op == OP_DIV || op == OP_MOD))
            return left;
    }
    if (is_number_type(left) && is_number_type(right) && (op == OP_EQ || op == OP_NE || op == OP_LT || op == OP_GT || op == OP_LE || op == OP_GE))
        return symbol_bool;
    // TODO: support more type combinations and operators
    // assert(false);
    fprintf(stderr, "[DEBUG] Warning: Type mismatch, left: '%s', right: '%s', op: '%u'\n", left->name, right->name, op);
    return symbol_void;
}

void analyze_import(Import* import) {
    assert(import != NULL);
    assert(import->path != NULL);
    FILE* file = fopen(import->path, "r");
    assert(file != NULL);
    fclose(file);
    analyze_symbol(import->name);
    if (import->name->kind == SYMBOL_CLASS)
        assert(import->name->info.class != NULL);
    else if (import->name->kind == SYMBOL_FUNCTION)
        assert(import->name->info.function != NULL);
    else
        assert(false);
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
        assert(type->kind == SYMBOL_TYPE || type->kind == SYMBOL_CLASS);
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
    assert(expression->type == NULL);
    if (expression->op == OP_NONE) {
        analyze_primary(expression->left.unary);
        expression->type = calculate_type(expression->left.unary->type, NULL, OP_NONE);
    } else {
        analyze_expression(expression->left.binary);
        analyze_expression(expression->right);
        expression->type = calculate_type(expression->left.binary->type, expression->right->type, expression->op);
    }
    assert(expression->type != NULL);
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
        if (for_->is_decl) {
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
    assert(primary->type == NULL);
    switch (primary->kind) {
        case PRIMARY_INT:
            assert(primary->value.literal != NULL);
            primary->type = symbol_int;
            break;
        case PRIMARY_FLOAT:
            assert(primary->value.literal != NULL);
            primary->type = symbol_float;
            break;
        case PRIMARY_STRING:
            assert(primary->value.literal != NULL);
            primary->type = symbol_string;
            break;
        case PRIMARY_BOOL:
            assert(primary->value.literal != NULL);
            primary->type = symbol_bool;
            break;
        case PRIMARY_NOT:
            analyze_primary(primary->value.not);
            primary->type = calculate_type(primary->value.neg->type, NULL, OP_NOT);
            break;
        case PRIMARY_NEG:
            analyze_primary(primary->value.neg);
            primary->type = calculate_type(primary->value.neg->type, NULL, OP_NEG);
            break;
        case PRIMARY_EXPR:
            analyze_expression(primary->value.exp);
            primary->type = primary->value.exp->type;
            break;
        case PRIMARY_VAR_ACCESS:
            analyze_variable_access(primary->value.var_access);
            primary->type = primary->value.var_access->type;
            break;
        default:
            assert(false);
    }
    assert(primary->type != NULL);
}

void analyze_variable_access(VariableAccess* variable_access) {
    assert(variable_access != NULL);
    assert(variable_access->type == NULL);
    if (variable_access->base != NULL)
        analyze_variable_access(variable_access->base);
    switch (variable_access->kind) {
        case VAR_ACCESS_VAR:
            assert(variable_access->access.var != NULL);
            analyze_symbol(variable_access->access.var);
            assert(variable_access->base == NULL);
            Symbol* var = variable_access->access.var;
            if (var->kind == SYMBOL_VARIABLE || var->kind == SYMBOL_PARAMETER || var->kind == SYMBOL_ATTRIBUTE)
                variable_access->type = var->type;
            else if (var->kind == SYMBOL_FUNCTION || var->kind == SYMBOL_METHOD || var->kind == SYMBOL_CLASS)
                variable_access->type = var;
            else
                assert(false);
            break;
        case VAR_ACCESS_CALL:
            assert(variable_access->access.args != NULL);
            foreach (Expression*, arg, variable_access->access.args)
                analyze_expression(arg);
            VariableAccess* base = variable_access->base;
            assert((base->kind == VAR_ACCESS_VAR && (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_CLASS)) ||
                   (base->kind == VAR_ACCESS_ATTRIBUTE && base->type->kind == SYMBOL_METHOD));
            if (base->type->kind == SYMBOL_CLASS)
                variable_access->type = base->type;
            else
                variable_access->type = base->type->type;
            break;
        case VAR_ACCESS_ATTRIBUTE:
            assert(variable_access->access.attribute != NULL);
            analyze_symbol(variable_access->access.attribute);
            assert(variable_access->base->type->kind == SYMBOL_CLASS);
            if (variable_access->access.attribute->kind == SYMBOL_METHOD)
                variable_access->type = variable_access->access.attribute;
            else if (variable_access->access.attribute->kind == SYMBOL_ATTRIBUTE)
                variable_access->type = variable_access->access.attribute->type;
            else
                assert(false);
            break;
        case VAR_ACCESS_INDEX:
            assert(variable_access->access.index != NULL);
            analyze_expression(variable_access->access.index);
            Symbol* type = variable_access->base->type;
            assert(type->kind == SYMBOL_TYPE || type->kind == SYMBOL_CLASS);
            assert(type->type != NULL);
            variable_access->type = type->type;
            break;
        default:
            assert(false);
    }
    assert(variable_access->type != NULL);
}

void analyze_symbol(Symbol* symbol) {
    assert(symbol != NULL);
    assert(symbol->name != NULL);
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            break;
        case SYMBOL_VARIABLE:
            assert(symbol->type != NULL);
            break;
        case SYMBOL_FUNCTION:
            assert(symbol->type != NULL);
            assert(symbol->info.function != NULL);
            break;
        case SYMBOL_CLASS:
            assert(symbol->info.class != NULL);
            break;
        case SYMBOL_METHOD:
            assert(symbol->type != NULL);
            assert(symbol->info.method != NULL);
            break;
        case SYMBOL_ATTRIBUTE:
            assert(symbol->type != NULL);
            break;
        case SYMBOL_PARAMETER:
            assert(symbol->type != NULL);
            break;
        default:
            assert(false);
    }
    if (symbol->type != NULL)
        analyze_type(symbol->type);
}
