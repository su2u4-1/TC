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

#define is_arithmetic_op(op) (op == OP_ADD || op == OP_SUB || op == OP_MUL || op == OP_DIV || op == OP_MOD)
#define is_arithmetic_assign_op(op) (op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN)
#define is_comparison_op(op) (op == OP_LT || op == OP_GT || op == OP_LE || op == OP_GE)
#define is_equality_op(op) (op == OP_EQ || op == OP_NE)
#define is_logical_op(op) (op == OP_AND || op == OP_OR)
static bool is_number_type(Symbol* type) {
    return type == symbol_int || type == symbol_float || type == symbol_bool;
}
static Symbol* types_compatible(Symbol* left, Symbol* right) {
    if (right == NULL || left == NULL)
        return NULL;
    if (left == right)
        return left;
    if (is_number_type(left) && is_number_type(right)) {
        if (left == symbol_float || right == symbol_float)
            return symbol_float;
        if (left == symbol_int || right == symbol_int)
            return symbol_int;
        return symbol_bool;
    }
    return NULL;
}
static Symbol* find_method(SymbolTable* table, OperatorType op) {
    switch (op) {
        case OP_ADD: return search_symbol(table, SPECIAL_ADD, true, SYMBOL_METHOD, NULL);
        case OP_SUB: return search_symbol(table, SPECIAL_SUB, true, SYMBOL_METHOD, NULL);
        case OP_MUL: return search_symbol(table, SPECIAL_MUL, true, SYMBOL_METHOD, NULL);
        case OP_DIV: return search_symbol(table, SPECIAL_DIV, true, SYMBOL_METHOD, NULL);
        case OP_MOD: return search_symbol(table, SPECIAL_MOD, true, SYMBOL_METHOD, NULL);
        case OP_EQ: return search_symbol(table, SPECIAL_EQ, true, SYMBOL_METHOD, NULL);
        case OP_NE: return search_symbol(table, SPECIAL_NE, true, SYMBOL_METHOD, NULL);
        case OP_LT: return search_symbol(table, SPECIAL_LT, true, SYMBOL_METHOD, NULL);
        case OP_GE: return search_symbol(table, SPECIAL_GE, true, SYMBOL_METHOD, NULL);
        case OP_GT: return search_symbol(table, SPECIAL_GT, true, SYMBOL_METHOD, NULL);
        case OP_LE: return search_symbol(table, SPECIAL_LE, true, SYMBOL_METHOD, NULL);
        case OP_AND: return search_symbol(table, SPECIAL_AND, true, SYMBOL_METHOD, NULL);
        case OP_OR: return search_symbol(table, SPECIAL_OR, true, SYMBOL_METHOD, NULL);
        case OP_NOT: return search_symbol(table, SPECIAL_NOT, true, SYMBOL_METHOD, NULL);
        case OP_NEG: return search_symbol(table, SPECIAL_NEG, true, SYMBOL_METHOD, NULL);
        default: return NULL;
    }
}
static bool method_compatibility(Symbol* method, Symbol* other) {
    size_t param_count = 0;
    Symbol* second_param = NULL;
    foreach (Symbol*, param, method->info.method->parameters) {
        if (param_count == 0)
            assert(param->name == KEYWORD_SELF);
        else if (param_count == 1)
            second_param = param;
        param_count++;
    }
    assert(param_count == 2);
    assert(second_param != NULL);
    return types_compatible(second_param->type, other) != NULL;
}
static Symbol* method_other_type(Symbol* method) {
    size_t param_count = 0;
    Symbol* second_param = NULL;
    foreach (Symbol*, param, method->info.method->parameters) {
        if (param_count == 0)
            assert(param->name == KEYWORD_SELF);
        else if (param_count == 1)
            second_param = param;
        param_count++;
    }
    assert(param_count == 2);
    assert(second_param != NULL);
    return second_param->type;
}
static VariableAccess* create_variable_access_var(Symbol* symbol) {
    VariableAccess* variable_access = create_struct(VariableAccess);
    variable_access->base = NULL;
    variable_access->access.var = symbol;
    variable_access->kind = VAR_ACCESS_VAR;
    variable_access->type = NULL;
    return variable_access;
}
static VariableAccess* create_variable_access_attribute(VariableAccess* base, Symbol* attribute) {
    VariableAccess* variable_access = create_struct(VariableAccess);
    variable_access->base = base;
    variable_access->access.attribute = attribute;
    variable_access->kind = VAR_ACCESS_ATTRIBUTE;
    variable_access->type = NULL;
    return variable_access;
}
static VariableAccess* create_variable_access_call(VariableAccess* base, Expression* argument) {
    VariableAccess* variable_access = create_struct(VariableAccess);
    variable_access->base = base;
    variable_access->access.args = list_create();
    variable_access->kind = VAR_ACCESS_CALL;
    variable_access->type = NULL;
    list_append(variable_access->access.args, (pointer)argument);
    return variable_access;
}
static Primary* create_primary_var_access(VariableAccess* variable_access) {
    Primary* primary = create_struct(Primary);
    primary->kind = PRIMARY_VAR_ACCESS;
    primary->value.var_access = variable_access;
    primary->type = NULL;
    return primary;
}
static Expression* create_expression_from_primary(Primary* primary) {
    Expression* expression = create_struct(Expression);
    expression->left.unary = primary;
    expression->op = OP_NONE;
    expression->right = NULL;
    expression->type = NULL;
    return expression;
}
static Symbol* create_comparison_method(Class* class, string method_name, Symbol* method_1, Symbol* method_2) {
    assert(class != NULL);
    assert(class->table != NULL);
    assert(method_name != NULL);
    assert(method_1 != NULL);
    Method* method = create_struct(Method);
    method->body = list_create();
    method->parameters = list_create();
    method->special = true;
    method->type = symbol_bool;

    SymbolTable* method_table = create_symbol_table(SYMBOL_TABLE_METHOD, class->table);
    Symbol* self_symbol = create_symbol(KEYWORD_SELF, class->name, SYMBOL_PARAMETER, NULL, method_table);
    Symbol* other_type = method_other_type(method_1);
    if (method_2 != NULL) {
        Symbol* second_other_type = method_other_type(method_2);
        Symbol* compatible_type = types_compatible(other_type, second_other_type);
        assert(compatible_type != NULL);
        other_type = compatible_type;
    }
    Symbol* other_symbol = create_symbol(create_string("other", 5), other_type, SYMBOL_PARAMETER, NULL, method_table);
    list_append(method->parameters, (pointer)self_symbol);
    list_append(method->parameters, (pointer)other_symbol);

    VariableAccess* self_access = create_variable_access_var(self_symbol);
    VariableAccess* call_1_base = create_variable_access_attribute(self_access, method_1);
    Expression* other_argument = create_expression_from_primary(create_primary_var_access(create_variable_access_var(other_symbol)));
    VariableAccess* call_1_access = create_variable_access_call(call_1_base, other_argument);

    Expression* return_expression = NULL;
    if (method_2 == NULL) {
        Primary* call_primary = create_primary_var_access(call_1_access);
        Primary* not_primary = create_struct(Primary);
        not_primary->kind = PRIMARY_NOT;
        not_primary->value.not = call_primary;
        not_primary->type = NULL;
        return_expression = create_expression_from_primary(not_primary);
    } else {
        VariableAccess* call_2_base = create_variable_access_attribute(create_variable_access_var(self_symbol), method_2);
        Expression* other_argument_2 = create_expression_from_primary(create_primary_var_access(create_variable_access_var(other_symbol)));
        VariableAccess* call_2_access = create_variable_access_call(call_2_base, other_argument_2);
        Expression* left_expression = create_expression_from_primary(create_primary_var_access(call_1_access));
        Expression* right_expression = create_expression_from_primary(create_primary_var_access(call_2_access));
        return_expression = create_struct(Expression);
        return_expression->left.binary = left_expression;
        return_expression->op = OP_OR;
        return_expression->right = right_expression;
        return_expression->type = NULL;
    }
    Statement* statement = create_struct(Statement);
    statement->statement.return_ = return_expression;
    statement->type = STATEMENT_RETURN;
    list_append(method->body, (pointer)statement);

    method->name = create_symbol(method_name, method->type, SYMBOL_METHOD, (pointer)method, class->table);
    ClassMember* class_member = create_struct(ClassMember);
    class_member->type = CLASS_METHOD;
    class_member->member.method = method;
    list_append(class->members, (pointer)class_member);
    return method->name;
}
static void auto_fill_comparison_method(Class* class) {
    Symbol* eq = find_method(class->table, OP_EQ);
    Symbol* ne = find_method(class->table, OP_NE);
    Symbol* lt = find_method(class->table, OP_LT);
    Symbol* ge = find_method(class->table, OP_GE);
    Symbol* gt = find_method(class->table, OP_GT);
    Symbol* le = find_method(class->table, OP_LE);
    // TODO: support comparison object address
    if (!eq && !ne && (!(lt || ge) || !(gt || le))) {
        // eq = object identity comparison
    }
    while (true) {
        Symbol** method_0 = NULL;
        Symbol* method_1 = NULL;
        Symbol* method_2 = NULL;
        string method_name = NULL;
        if (!eq && ne) {  // eq = !ne
            method_0 = &eq;
            method_1 = ne;
            method_name = SPECIAL_EQ;
        }
        if (!ne && eq) {  // ne = !eq
            method_0 = &ne;
            method_1 = eq;
            method_name = SPECIAL_NE;
        }
        if (!lt && ge) {  // lt = !ge
            method_0 = &lt;
            method_1 = ge;
            method_name = SPECIAL_LT;
        }
        if (!ge && lt) {  // ge = !lt
            method_0 = &ge;
            method_1 = lt;
            method_name = SPECIAL_GE;
        }
        if (!gt && le) {  // gt = !le
            method_0 = &gt;
            method_1 = le;
            method_name = SPECIAL_GT;
        }
        if (!le && gt) {  // le = !gt
            method_0 = &le;
            method_1 = gt;
            method_name = SPECIAL_LE;
        }
        if (!le && eq && lt) {  // le = eq || lt
            method_0 = &le;
            method_1 = eq;
            method_2 = lt;
            method_name = SPECIAL_LE;
        }
        if (!ge && eq && gt) {  // ge = eq || gt
            method_0 = &ge;
            method_1 = eq;
            method_2 = gt;
            method_name = SPECIAL_GE;
        }
        if (!ne && lt && gt) {  // ne = lt || gt
            method_0 = &ne;
            method_1 = lt;
            method_2 = gt;
            method_name = SPECIAL_NE;
        }
        if (method_name == NULL)
            break;
        assert(method_0 != NULL);
        *method_0 = create_comparison_method(class, method_name, method_1, method_2);
    }
}
Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op) {
    assert(left != NULL);
    assert(left->kind == SYMBOL_TYPE || left->kind == SYMBOL_CLASS);
    if (right == NULL) {
        if (op == OP_NONE)
            return left;
        if ((left == symbol_int || left == symbol_float) && op == OP_NEG)
            return left;
        if (op == OP_NOT)
            return symbol_bool;
        if (left->kind == SYMBOL_CLASS) {
            Symbol* method = find_method(left->info.class->table, op);
            if (method != NULL) {
                assert(!list_empty(method->info.method->parameters) && method->info.method->parameters->head == method->info.method->parameters->tail);
                assert(((Symbol*)method->info.method->parameters->head->data)->name == KEYWORD_SELF);
                return method->type;
            }
        }
        assert(false);
    }
    assert(right != NULL);
    assert(right->kind == SYMBOL_TYPE || right->kind == SYMBOL_CLASS);
    if (is_logical_op(op))
        return symbol_bool;
    if (is_equality_op(op)) {
        if (left == right || types_compatible(left, right) != NULL)
            return symbol_bool;
    }
    if (is_comparison_op(op)) {
        if (is_number_type(left) && is_number_type(right))
            return symbol_bool;
    }
    if (is_arithmetic_op(op)) {
        if (left == right && is_number_type(left))
            return left;
        if (is_number_type(left) && is_number_type(right))
            return types_compatible(left, right);
    }
    if (op == OP_ASSIGN) {
        if (left == right || types_compatible(left, right) != NULL)
            return left;
    }
    if (is_arithmetic_assign_op(op)) {
        if (is_number_type(left) && (left == right || types_compatible(left, right) != NULL))
            return left;
    }
    if (left->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(left->info.class->table, op);
        if (method != NULL && method_compatibility(method, right))
            return method->type;
    }
    if (right->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(right->info.class->table, op);
        if (method != NULL && method_compatibility(method, left))
            return method->type;
    }
    assert(false);
    // TODO: support more type combinations and operators
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
    auto_fill_comparison_method(class);
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
    size_t param_count = 0;
    foreach (Symbol*, symbol, method->parameters) {
        analyze_symbol(symbol);
        assert(symbol->kind == SYMBOL_PARAMETER);
        if (param_count == 0)
            assert(symbol->name == KEYWORD_SELF);
        param_count++;
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
            primary->type = calculate_type(primary->value.not->type, NULL, OP_NOT);
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
            size_t arg_count = 0;
            foreach (Expression*, arg, variable_access->access.args) {
                analyze_expression(arg);
                ++arg_count;
            }
            VariableAccess* base = variable_access->base;
            assert((base->kind == VAR_ACCESS_VAR && (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_CLASS)) ||
                   (base->kind == VAR_ACCESS_ATTRIBUTE && base->type->kind == SYMBOL_METHOD));
            union {
                Function* function;
                Method* method;
            } callee;
            bool is_method = true;
            if (base->type->kind == SYMBOL_CLASS) {
                variable_access->type = base->type;
                callee.method = search_symbol(base->type->info.class->table, SPECIAL_INIT, true, SYMBOL_METHOD, NULL)->info.method;
            } else {
                variable_access->type = base->type->type;
                if (base->type->kind == SYMBOL_FUNCTION) {
                    callee.function = base->type->info.function;
                    is_method = false;
                } else if (base->type->kind == SYMBOL_METHOD)
                    callee.method = base->type->info.method;
                else
                    assert(false);
            }
            Symbol** param_type = malloc(sizeof(Symbol*) * arg_count);
            size_t param_count = 0;
            foreach (Symbol*, param, is_method ? callee.method->parameters : callee.function->parameters) {
                assert(param->kind == SYMBOL_PARAMETER);
                param_type[param_count++] = param->type;
            }
            if (is_method) --param_count;
            Symbol* name = is_method ? callee.method->name : callee.function->name;
            if (arg_count != param_count)
                fprintf(stderr, "[analyzer Warning] Argument count mismatch in %s call '%s', expected %zu, got %zu\n", is_method ? "method" : "function", name->name, param_count, arg_count);
            arg_count = is_method ? 1 : 0;
            foreach (Expression*, arg, variable_access->access.args) {
                assert(arg->type != NULL);
                if (arg->type != param_type[arg_count++])
                    fprintf(stderr, "[analyzer Warning] Type mismatch in %s call '%s', expected '%s', got '%s'\n", is_method ? "method" : "function", name->name, param_type[arg_count - 1]->name, arg->type->name);
            }
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
