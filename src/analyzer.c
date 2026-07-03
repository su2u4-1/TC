#include "analyzer.h"

#include "lib.h"
#include "symbol_table.h"

static bool has_error = false;

#define print_analyzer_error(message) (void)(fprintf(stderr, "[analyzer Error] at %s: " message "\n", file)), has_error = true
#define analyzer_check(condition, message, run) \
    do {                                        \
        if (!(condition)) {                     \
            print_analyzer_error(message);      \
            run;                                \
        }                                       \
    } while (0)
#define check_not_null(member) assert(member != NULL)
#define check_is_null(member) assert(member == NULL)

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
static void analyze_var_access_var(VariableAccess* variable_access);
static void analyze_var_access_call(VariableAccess* variable_access);
static void analyze_var_access_attribute(VariableAccess* variable_access);
static void analyze_var_access_index(VariableAccess* variable_access);
static void analyze_symbol(Symbol* symbol);

static int loop_depth = 0;
static Symbol* return_type = NULL;
static string file = NULL;

AST* analyzer(AST* ast) {
    check_not_null(ast);
    check_not_null(ast->file);
    file = file_full_path(ast->file);
    check_not_null(ast->members);
    check_not_null(ast->table);
    has_error = false;
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
    if (has_error) return NULL;
    return ast;
}

size_t get_type_size(Symbol* type) {
    if (type->kind == SYMBOL_CLASS)
        return pointer_size;
    return type->info.size;
}

void fill_symbol_offset(SymbolTable* table, size_t base_offset) {
    check_not_null(table);
    size_t offset = base_offset;
    if (table->type == SYMBOL_TABLE_CLASS || table->type == SYMBOL_TABLE_FUNCTION || table->type == SYMBOL_TABLE_METHOD)
        offset = 0;
    foreach (Symbol*, symbol, table->symbols) {
        if (symbol->kind != SYMBOL_VARIABLE && symbol->kind != SYMBOL_PARAMETER && symbol->kind != SYMBOL_ATTRIBUTE)
            continue;
        symbol->info.offset = offset;
        check_not_null(symbol->type);
        assert(symbol->type->kind == SYMBOL_TYPE || symbol->type->kind == SYMBOL_CLASS);
        offset += get_type_size(symbol->type);
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
        case OP_ASSIGN:
        case OP_ADD_ASSIGN:
        case OP_SUB_ASSIGN:
        case OP_MUL_ASSIGN:
        case OP_DIV_ASSIGN:
        case OP_MOD_ASSIGN:
        case OP_NONE:
            return NULL;
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
static Symbol* method_other_type(Symbol* method) {
    check_not_null(method);
    check_not_null(method->info.method);
    check_not_null(method->info.method->parameters);
    size_t param_count = 0;
    Symbol* second_param = NULL;
    foreach (Symbol*, param, method->info.method->parameters) {
        if (param_count == 0)
            analyzer_check(param->name == KEYWORD_SELF, "First parameter of method must be 'self'", return NULL);
        else if (param_count == 1)
            second_param = param;
        param_count++;
    }
    analyzer_check(param_count == 2, "Binary operations method must have exactly two parameters", return NULL);
    analyzer_check(second_param != NULL, "Second parameter of binary operations special method must not be NULL", return NULL);
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
    check_not_null(class);
    check_not_null(class->table);
    check_not_null(method_name);
    check_not_null(method_1);
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
        analyzer_check(compatible_type != NULL, "The second parameter types of the two comparison methods must be compatible", return NULL);
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
        check_not_null(method_0);
        *method_0 = create_comparison_method(class, method_name, method_1, method_2);
    }
}
Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op) {
    // left type check
    check_not_null(left);
    if (left == symbol_void && right == NULL) return symbol_void;
    analyzer_check(left != symbol_void, "Cannot perform operations on void type", return symbol_void);
    assert(left->kind == SYMBOL_TYPE || left->kind == SYMBOL_CLASS);

    // unary operation
    if (right == NULL) {
        if (op == OP_NONE) return left;
        if (left->kind == SYMBOL_CLASS) {
            Symbol* method = find_method(left->info.class->table, op);
            if (method != NULL) {
                check_not_null(method->info.method);
                analyzer_check(!list_empty(method->info.method->parameters) && method->info.method->parameters->head == method->info.method->parameters->tail,
                               "Unary operation special method must have exactly one parameter", return symbol_void);
                analyzer_check(((Symbol*)method->info.method->parameters->head->data)->name == KEYWORD_SELF, "First parameter of method must be 'self'", return symbol_void);
                return method->type;
            }
        }
        if ((left == symbol_int || left == symbol_float) && op == OP_NEG) return left;
        if (op == OP_NOT) return symbol_bool;
        print_analyzer_error("Invalid unary operation");
        return symbol_void;
    }

    // right type check
    check_not_null(right);
    analyzer_check(right != symbol_void, "Cannot perform operations on void type", return symbol_void);
    assert(right->kind == SYMBOL_TYPE || right->kind == SYMBOL_CLASS);

    // binary operation
    if (is_logical_op(op))
        return symbol_bool;
    if (is_equality_op(op) && types_compatible(left, right) != NULL)
        return symbol_bool;
    if (is_comparison_op(op) && is_number_type(left) && is_number_type(right))
        return symbol_bool;
    if (is_arithmetic_op(op) && is_number_type(left) && is_number_type(right))
        return types_compatible(left, right);
    if (op == OP_ASSIGN && types_compatible(left, right) != NULL)
        return left;
    if (is_arithmetic_assign_op(op) && is_number_type(left) && types_compatible(left, right) != NULL)
        return left;

    if (left->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(left->info.class->table, op);
        if (method != NULL && types_compatible(method_other_type(method), right) != NULL)
            return method->type;
    }
    if (right->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(right->info.class->table, op);
        if (method != NULL && types_compatible(method_other_type(method), left) != NULL)
            return method->type;
    }

    print_analyzer_error("Invalid binary operation");
    fprintf(stderr, "[analyzer Warning]: Type mismatch, left: '%s', right: '%s', op: '%u'\n", left->name, right->name, op);
    return symbol_void;
}

void analyze_import(Import* import) {
    check_not_null(import);
    check_not_null(import->path);
    FILE* import_file = fopen(import->path, "r");
    analyzer_check(import_file != NULL, "Failed to open import file", return);
    fclose(import_file);
    analyze_symbol(import->name);
    if (import->name->kind == SYMBOL_CLASS)
        check_not_null(import->name->info.class);
    else if (import->name->kind == SYMBOL_FUNCTION)
        check_not_null(import->name->info.function);
    else
        print_analyzer_error("Imported symbol must be a class or function");
}

void analyze_class(Class* class) {
    check_not_null(class);
    analyze_symbol(class->name);
    check_not_null(class->members);
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
    check_not_null(function);
    analyze_symbol(function->name);
    analyze_type(function->type);
    return_type = function->type;
    check_not_null(function->parameters);
    if (!list_empty(function->parameters)) {
        foreach (Symbol*, symbol, function->parameters) {
            analyze_symbol(symbol);
            assert(symbol->kind == SYMBOL_PARAMETER);
        }
    }
    analyze_body(function->body);
    return_type = NULL;
}

void analyze_method(Method* method) {
    check_not_null(method);
    analyze_symbol(method->name);
    analyze_type(method->type);
    return_type = method->type;
    analyzer_check(!list_empty(method->parameters), "Method must have at least one parameter (self)", return);
    size_t param_count = 0;
    foreach (Symbol*, symbol, method->parameters) {
        analyze_symbol(symbol);
        assert(symbol->kind == SYMBOL_PARAMETER);
        if (param_count == 0)
            analyzer_check(symbol->name == KEYWORD_SELF, "First parameter of method must be 'self'", return);
        param_count++;
    }
    analyze_body(method->body);
    return_type = NULL;
}

void analyze_variable(Variable* variable) {
    check_not_null(variable);
    analyze_symbol(variable->var);
    analyze_type(variable->var->type);
    if (variable->initializer != NULL) {
        analyze_expression(variable->initializer);
        analyzer_check(types_compatible(variable->var->type, variable->initializer->type) != NULL,
                       "Variable initializer type must be compatible with variable type", );
    }
}

static bool is_container_type(Symbol* type) {
    return type->name == KEYWORD_CONST || type->name == KEYWORD_POINTER || strcmp(type->name, "arr") == 0 || strcmp(type->name, "list") == 0;
}
void analyze_type(Symbol* type) {
    check_not_null(type);
    check_not_null(type->name);
    assert(type->kind == SYMBOL_TYPE || type->kind == SYMBOL_CLASS);
    if (type->type != NULL) {
        // assume that the container types only include arr, list, const and pointer
        analyzer_check(is_container_type(type), "Container types must be const, pointer, arr or list", return);
        analyze_type(type->type);
    }
    if (type->kind == SYMBOL_CLASS)
        check_not_null(type->info.class);
}

void analyze_statement(Statement* statement) {
    check_not_null(statement);
    switch (statement->type) {
        case STATEMENT_DECLARE_LIST:
            analyzer_check(!list_empty(statement->statement.declare_list), "Declare list statement must not be empty", return);
            foreach (Variable*, var, statement->statement.declare_list)
                analyze_variable(var);
            break;
        case STATEMENT_DECLARE: analyze_variable(statement->statement.declare); break;
        case STATEMENT_IF: analyze_if(statement->statement.if_); break;
        case STATEMENT_FOR: analyze_for(statement->statement.for_); break;
        case STATEMENT_WHILE: analyze_while(statement->statement.while_); break;
        case STATEMENT_BREAK:
        case STATEMENT_CONTINUE:
            analyzer_check(loop_depth > 0, "Break and continue statements must be inside a loop", return);
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ != NULL)
                analyze_expression(statement->statement.return_);
            analyzer_check(return_type != NULL, "Return statement must be inside a function or method", );
            if (statement->statement.return_ == NULL) {
                analyzer_check(return_type == symbol_void, "Return statement type must be compatible with function or method return type", );
            } else {
                analyzer_check(types_compatible(return_type, statement->statement.return_->type) != NULL,
                               "Return statement type must be compatible with function or method return type", );
            }
            break;
        case STATEMENT_EXPRESSION: analyze_expression(statement->statement.expression); break;
        default: assert(false);
    }
}

void analyze_body(list(Statement*) body) {
    check_not_null(body);
    if (list_empty(body)) return;
    foreach (Statement*, statement, body) {
        analyze_statement(statement);
    }
}

static bool lvalue_expression(Expression* expression);
static bool lvalue_var_access(VariableAccess* variable_access) {
    check_not_null(variable_access);
    switch (variable_access->kind) {
        case VAR_ACCESS_CALL:
            return false;
        case VAR_ACCESS_VAR:
        case VAR_ACCESS_ATTRIBUTE:
        case VAR_ACCESS_INDEX:
            return true;
        default:
            assert(false);
            return false;
    }
}
static bool lvalue_primary(Primary* primary) {
    check_not_null(primary);
    switch (primary->kind) {
        case PRIMARY_VAR_ACCESS:
            return lvalue_var_access(primary->value.var_access);
        case PRIMARY_EXPR:
            return lvalue_expression(primary->value.exp);
        case PRIMARY_INT:
        case PRIMARY_FLOAT:
        case PRIMARY_STRING:
        case PRIMARY_BOOL:
        case PRIMARY_NEG:
        case PRIMARY_NOT:
            return false;
        default:
            assert(false);
            return false;
    }
}
bool lvalue_expression(Expression* expression) {
    check_not_null(expression);
    if (expression->op == OP_NONE)
        return lvalue_primary(expression->left.unary);
    assert(expression->op != OP_ASSIGN && !is_arithmetic_assign_op(expression->op));
    return false;
}
void analyze_expression(Expression* expression) {
    check_not_null(expression);
    check_is_null(expression->type);
    if (expression->op == OP_NONE) {
        check_not_null(expression->left.unary);
        check_is_null(expression->right);
        analyze_primary(expression->left.unary);
        expression->type = calculate_type(expression->left.unary->type, NULL, OP_NONE);
    } else {
        check_not_null(expression->left.binary);
        check_not_null(expression->right);
        analyze_expression(expression->left.binary);
        analyze_expression(expression->right);
        expression->type = calculate_type(expression->left.binary->type, expression->right->type, expression->op);
        if (expression->op == OP_ASSIGN || is_arithmetic_assign_op(expression->op))
            analyzer_check(lvalue_expression(expression->left.binary), "Left side of assignment must be an lvalue", );
    }
    analyzer_check(expression->type != NULL, "Expression type must not be NULL", expression->type = symbol_void);
}

void analyze_if(If* if_) {
    check_not_null(if_);
    check_not_null(if_->condition);
    check_not_null(if_->body);
    check_not_null(if_->elif_list);
    check_not_null(if_->else_body);
    analyze_expression(if_->condition);
    analyze_body(if_->body);
    if (!list_empty(if_->elif_list)) {
        foreach (If*, elif, if_->elif_list) {
            check_not_null(elif);
            check_not_null(elif->condition);
            check_not_null(elif->body);
            check_is_null(elif->else_body);
            check_is_null(elif->elif_list);
            analyze_expression(elif->condition);
            analyze_body(elif->body);
        }
    }
    if (!list_empty(if_->else_body))
        analyze_body(if_->else_body);
}

void analyze_for(For* for_) {
    check_not_null(for_);
    assert(loop_depth >= 0);
    check_not_null(for_->body);
    loop_depth++;
    if (for_->is_decl && for_->init.decl != NULL)
        analyze_variable(for_->init.decl);
    else if (!for_->is_decl && for_->init.expr != NULL)
        analyze_expression(for_->init.expr);
    if (for_->condition != NULL)
        analyze_expression(for_->condition);
    if (for_->increment != NULL)
        analyze_expression(for_->increment);
    analyze_body(for_->body);
    loop_depth--;
    assert(loop_depth >= 0);
}

void analyze_while(While* while_) {
    check_not_null(while_);
    assert(loop_depth >= 0);
    check_not_null(while_->condition);
    check_not_null(while_->body);
    loop_depth++;
    analyze_expression(while_->condition);
    analyze_body(while_->body);
    loop_depth--;
    assert(loop_depth >= 0);
}

void analyze_primary(Primary* primary) {
    check_not_null(primary);
    check_is_null(primary->type);
    switch (primary->kind) {
        case PRIMARY_INT:
            check_not_null(primary->value.literal);
            primary->type = symbol_int;
            break;
        case PRIMARY_FLOAT:
            check_not_null(primary->value.literal);
            primary->type = symbol_float;
            break;
        case PRIMARY_STRING:
            check_not_null(primary->value.literal);
            primary->type = symbol_string;
            break;
        case PRIMARY_BOOL:
            check_not_null(primary->value.literal);
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
        default: assert(false);
    }
    analyzer_check(primary->type != NULL, "Primary expression type could not be determined", primary->type = symbol_void);
}

static void analyze_var_access_var(VariableAccess* variable_access) {
    check_not_null(variable_access->access.var);
    analyze_symbol(variable_access->access.var);
    check_is_null(variable_access->base);
    Symbol* var = variable_access->access.var;
    if (var->kind == SYMBOL_VARIABLE || var->kind == SYMBOL_PARAMETER || var->kind == SYMBOL_ATTRIBUTE)
        variable_access->type = var->type;
    else if (var->kind == SYMBOL_FUNCTION || var->kind == SYMBOL_METHOD || var->kind == SYMBOL_CLASS)
        variable_access->type = var;
    else
        assert(false);
}
#define max(a, b) ((a) > (b) ? (a) : (b))
#define min(a, b) ((a) < (b) ? (a) : (b))
static void analyze_var_access_call(VariableAccess* variable_access) {
    check_not_null(variable_access->base);
    check_not_null(variable_access->access.args);
    analyzer_check(variable_access->base->type != NULL, "Base of call has no type", return);
    size_t arg_count = 0;
    foreach (Expression*, arg, variable_access->access.args) {
        analyze_expression(arg);
        ++arg_count;
    }
    VariableAccess* base = variable_access->base;
    analyzer_check((base->kind == VAR_ACCESS_VAR && (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_CLASS)) ||
                       (base->kind == VAR_ACCESS_ATTRIBUTE && base->type->kind == SYMBOL_METHOD),
                   "Base of call must be a function, method or class", return);
    union {
        Function* function;
        Method* method;
    } callee;
    bool is_method = true;
    if (base->type->kind == SYMBOL_CLASS) {
        Symbol* init_method = search_symbol(base->type->info.class->table, SPECIAL_INIT, true, SYMBOL_METHOD, NULL);
        analyzer_check(init_method != NULL, "Class call must define '$init' special method", return);
        check_not_null(init_method->info.method);
        callee.method = init_method->info.method;
    } else if (base->type->kind == SYMBOL_FUNCTION) {
        check_not_null(base->type->info.function);
        callee.function = base->type->info.function;
        is_method = false;
    } else if (base->type->kind == SYMBOL_METHOD) {
        check_not_null(base->type->info.method);
        callee.method = base->type->info.method;
    } else {
        assert(false);
    }
    size_t param_count = 0;
    foreach (Symbol*, param, is_method ? callee.method->parameters : callee.function->parameters) param_count++;
    Symbol** param_types = calloc(max(arg_count, param_count), sizeof(Symbol*));
    size_t i = 0;
    foreach (Symbol*, param, is_method ? callee.method->parameters : callee.function->parameters) {
        assert(param->kind == SYMBOL_PARAMETER);
        param_types[i++] = param->type;
    }
    Symbol* name = is_method ? callee.method->name : callee.function->name;
    size_t compare_count = min(arg_count, param_count);
    if (is_method) --param_count;
    i = is_method ? 1 : 0;
    foreach (Expression*, arg, variable_access->access.args) {
        if (i >= compare_count)
            break;
        Symbol* param_type = param_types[i++];
        check_not_null(arg->type);
        check_not_null(param_type);
        analyzer_check(types_compatible(arg->type, param_type), "Argument type must match callee parameter type",
                       fprintf(stderr, "    Type mismatch in %s call '%s', expected '%s', got '%s'\n",
                               (is_method ? "method" : "function"), name->name, param_type->name, arg->type->name));
    }
    analyzer_check(arg_count == param_count, "Argument count must match callee parameter count",
                   fprintf(stderr, "    Argument count mismatch in %s call '%s', expected %zu, got %zu\n",
                           (is_method ? "method" : "function"), name->name, param_count, arg_count));
    if (base->type->kind == SYMBOL_CLASS)
        variable_access->type = base->type;
    else
        variable_access->type = base->type->type;
    free(param_types);
}
static void analyze_var_access_attribute(VariableAccess* variable_access) {
    check_not_null(variable_access->base);
    check_not_null(variable_access->access.attribute);
    analyzer_check(variable_access->base->type != NULL, "Base of attribute access has no type", return);
    analyze_symbol(variable_access->access.attribute);
    analyzer_check(variable_access->base->type->kind == SYMBOL_CLASS, "Base of attribute access must be a class", return);
    if (variable_access->access.attribute->kind == SYMBOL_METHOD)
        variable_access->type = variable_access->access.attribute;
    else if (variable_access->access.attribute->kind == SYMBOL_ATTRIBUTE)
        variable_access->type = variable_access->access.attribute->type;
    else
        assert(false);
}
static void analyze_var_access_index(VariableAccess* variable_access) {
    check_not_null(variable_access->base);
    check_not_null(variable_access->access.index);
    analyzer_check(variable_access->base->type != NULL, "Base of index access has no type", return);
    analyze_expression(variable_access->access.index);
    analyzer_check(types_compatible(variable_access->access.index->type, symbol_int) == symbol_int, "Index must be of type int", return);
    Symbol* type = variable_access->base->type;
    analyzer_check(is_container_type(type), "Index access base must be a container type", return);
    check_not_null(type->type);
    variable_access->type = type->type;
}
void analyze_variable_access(VariableAccess* variable_access) {
    check_not_null(variable_access);
    check_is_null(variable_access->type);
    if (variable_access->base != NULL) analyze_variable_access(variable_access->base);
    switch (variable_access->kind) {
        case VAR_ACCESS_VAR: analyze_var_access_var(variable_access); break;
        case VAR_ACCESS_CALL: analyze_var_access_call(variable_access); break;
        case VAR_ACCESS_ATTRIBUTE: analyze_var_access_attribute(variable_access); break;
        case VAR_ACCESS_INDEX: analyze_var_access_index(variable_access); break;
        default: assert(false);
    }
    analyzer_check(variable_access->type != NULL, "Variable access type could not be determined", variable_access->type = symbol_void);
}

void analyze_symbol(Symbol* symbol) {
    check_not_null(symbol);
    check_not_null(symbol->name);
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            if (is_container_type(symbol))
                check_not_null(symbol->type);
            else
                check_is_null(symbol->type);
            break;
        case SYMBOL_VARIABLE:
            check_not_null(symbol->type);
            break;
        case SYMBOL_FUNCTION:
            check_not_null(symbol->type);
            check_not_null(symbol->info.function);
            break;
        case SYMBOL_CLASS:
            check_not_null(symbol->info.class);
            if (is_container_type(symbol))
                check_not_null(symbol->type);
            else
                check_is_null(symbol->type);
            break;
        case SYMBOL_METHOD:
            check_not_null(symbol->type);
            check_not_null(symbol->info.method);
            break;
        case SYMBOL_ATTRIBUTE:
            check_not_null(symbol->type);
            break;
        case SYMBOL_PARAMETER:
            check_not_null(symbol->type);
            break;
        default: assert(false);
    }
    if (symbol->type != NULL)
        analyze_type(symbol->type);
}
