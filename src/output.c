#include "output.h"

#include "ast.h"

static void print_function(Function* function, FILE* out, size_t indent);
static void print_class(Class* class, FILE* out, size_t indent);
static void print_import(Import* import, FILE* out, size_t indent);
static void print_statement(Statement* statement, FILE* out, size_t indent);
static void print_method(Method* method, FILE* out, size_t indent);
static void print_if(If* if_, FILE* out, size_t indent);
static void print_for(For* for_, FILE* out, size_t indent);
static void print_while(While* while_, FILE* out, size_t indent);
static void print_expression(Expression* expression, FILE* out, size_t indent);
static void print_variable(Variable* variable, FILE* out, size_t indent);
static void print_primary(Primary* primary, FILE* out, size_t indent);
static void print_variable_access(VariableAccess* variable_access, FILE* out, size_t indent);
static void print_symbol(Symbol* symbol, FILE* out, size_t indent);
static string operator_string(OperatorType op);

void print_ast(AST* ast, FILE* out) {
    OUT(0, "{\n");
    foreach (CodeMember*, member, ast->members) {
        switch (member->type) {
            case CODE_FUNCTION:
                print_function(member->member.function, out, 1);
                break;
            case CODE_CLASS:
                print_class(member->member.class, out, 1);
                break;
            case CODE_IMPORT:
                print_import(member->member.import, out, 1);
                break;
            default:
                OUT(1, "error: \"Unknown code member type\"\n");
                break;
        }
    }
    OUT(0, "}\n");
}
void print_function(Function* function, FILE* out, size_t indent) {
    OUT(indent, "function: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(function->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "return_type: %s(%zu)\n", function->type->name, function->type->id);
    OUT(indent + 1, "parameters: {\n");
    foreach (Symbol*, param, function->parameters) {
        OUT(indent + 2, "{\n");
        print_symbol(param, out, indent + 3);
        OUT(indent + 2, "}\n");
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, function->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_class(Class* class, FILE* out, size_t indent) {
    OUT(indent, "class: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(class->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    foreach (ClassMember*, member, class->members) {
        if (member->type == CLASS_METHOD) {
            print_method(member->member.method, out, indent + 1);
        } else if (member->type == CLASS_ATTRIBUTE) {
            print_variable(member->member.attribute, out, indent + 1);
        } else {
            OUT(indent + 1, "error: \"Unknown class member type\"\n");
        }
    }
    OUT(indent, "}\n");
}
void print_import(Import* import, FILE* out, size_t indent) {
    OUT(indent, "import: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(import->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "path: \"%s\"\n", import->path);
    OUT(indent, "}\n");
}
void print_statement(Statement* statement, FILE* out, size_t indent) {
    switch (statement->type) {
        case STATEMENT_DECLARE:
            print_variable(statement->statement.declare, out, indent);
            break;
        case STATEMENT_DECLARE_LIST:
            fprintf(stderr, "[output Warning] at <print_statement>: Cannot exist declare list in statement. This should have been split into multiple declare statements in the parsing stage.\n");
            foreach (Variable*, var, statement->statement.declare_list) {
                print_variable(var, out, indent);
            }
            break;
        case STATEMENT_IF:
            print_if(statement->statement.if_, out, indent);
            break;
        case STATEMENT_FOR:
            print_for(statement->statement.for_, out, indent);
            break;
        case STATEMENT_WHILE:
            print_while(statement->statement.while_, out, indent);
            break;
        case STATEMENT_BREAK:
            OUT(indent, "break: null\n");
            break;
        case STATEMENT_CONTINUE:
            OUT(indent, "continue: null\n");
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ == NULL) {
                OUT(indent, "return: null\n");
            } else {
                OUT(indent, "return: {\n");
                print_expression(statement->statement.return_, out, indent + 1);
                OUT(indent, "}\n");
            }
            break;
        case STATEMENT_EXPRESSION:
            OUT(indent, "expression: {\n");
            print_expression(statement->statement.return_, out, indent + 1);
            OUT(indent, "}\n");
            break;
        default:
            OUT(indent, "error: \"Unknown statement type\"\n");
            break;
    }
}
void print_method(Method* method, FILE* out, size_t indent) {
    OUT(indent, "method: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(method->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "return_type: %s(%zu)\n", method->type->name, method->type->id);
    OUT(indent + 1, "parameters: {\n");
    foreach (Symbol*, param, method->parameters) {
        OUT(indent + 2, "{\n");
        print_symbol(param, out, indent + 3);
        OUT(indent + 2, "}\n");
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, method->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_if(If* if_, FILE* out, size_t indent) {
    OUT(indent, "if: {\n");
    OUT(indent + 1, "condition: {\n");
    print_expression(if_->condition, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt0, if_->body) {
        print_statement(stmt0, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "elif_list: {\n");
    foreach (If*, elif, if_->elif_list) {
        OUT(indent + 2, "{\n");
        OUT(indent + 3, "condition: {\n");
        print_expression(elif->condition, out, indent + 4);
        OUT(indent + 3, "}\n");
        OUT(indent + 3, "body: {\n");
        foreach (Statement*, stmt1, elif->body) {
            print_statement(stmt1, out, indent + 4);
        }
        OUT(indent + 3, "}\n");
        OUT(indent + 2, "}\n");
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "else_body: {\n");
    foreach (Statement*, stmt2, if_->else_body) {
        print_statement(stmt2, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_for(For* for_, FILE* out, size_t indent) {
    OUT(indent, "for: {\n");
    if (for_->init.decl != NULL) {
        OUT(indent + 1, "init: {\n");
        print_variable(for_->init.decl, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else if (for_->init.expr != NULL) {
        OUT(indent + 1, "init: {\n");
        print_expression(for_->init.expr, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "init: null\n");
    }
    if (for_->condition != NULL) {
        OUT(indent + 1, "condition: {\n");
        print_expression(for_->condition, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else
        OUT(indent + 1, "condition: null\n");
    if (for_->increment != NULL) {
        OUT(indent + 1, "increment: {\n");
        print_expression(for_->increment, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "increment: null\n");
    }
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, for_->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_while(While* while_, FILE* out, size_t indent) {
    OUT(indent, "while: {\n");
    OUT(indent + 1, "condition: {\n");
    print_expression(while_->condition, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, while_->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_expression(Expression* expression, FILE* out, size_t indent) {
    if (expression->op == OP_NONE) {
        OUT(indent, "primary: {\n");
        print_primary(expression->left.unary, out, indent + 1);
        OUT(indent, "}\n");
    } else {
        OUT(indent, "left: {\n");
        print_expression(expression->left.binary, out, indent + 1);
        OUT(indent, "}\n");
        OUT(indent, "operator: \"%s\"\n", operator_string(expression->op));
        OUT(indent, "right: {\n");
        print_expression(expression->right, out, indent + 1);
        OUT(indent, "}\n");
    }
}
void print_variable(Variable* variable, FILE* out, size_t indent) {
    OUT(indent, "variable: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(variable->var, out, indent + 2);
    OUT(indent + 1, "}\n");
    if (variable->initializer != NULL) {
        OUT(indent + 1, "initializer: {\n");
        print_expression(variable->initializer, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "initializer: null\n");
    }
    OUT(indent, "}\n");
}
void print_primary(Primary* primary, FILE* out, size_t indent) {
    switch (primary->type) {
        case PRIMARY_INT:
            OUT(indent, "int literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_FLOAT:
            OUT(indent, "float literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_STRING:
            OUT(indent, "string literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_BOOL:
            OUT(indent, "bool literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_NOT:
            OUT(indent, "not: {\n");
            print_primary(primary->value.not, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case PRIMARY_NEG:
            OUT(indent, "neg: {\n");
            print_primary(primary->value.neg, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case PRIMARY_EXPR:
            OUT(indent, "exp: {\n");
            print_expression(primary->value.exp, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case PRIMARY_VAR_ACCESS:
            print_variable_access(primary->value.var_access, out, indent);
            break;
        default:
            OUT(indent, "error: \"Unknown primary type\"\n");
            break;
    }
}
void print_variable_access(VariableAccess* variable_access, FILE* out, size_t indent) {
    if (variable_access->base != NULL) {
        OUT(indent, "base: {\n");
        print_variable_access(variable_access->base, out, indent + 1);
        OUT(indent, "}\n");
    }
    switch (variable_access->type) {
        case VAR_ACCESS_VAR:
            OUT(indent, "var: {\n");
            print_symbol(variable_access->access.var, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case VAR_ACCESS_CALL:
            OUT(indent, "call: {\n");
            int arg_index = 0;
            foreach (Expression*, arg, variable_access->access.args) {
                OUT(indent + 1, "arg[%d]: {\n", arg_index++);
                print_expression(arg, out, indent + 2);
                OUT(indent + 1, "}\n");
            }
            OUT(indent, "}\n");
            break;
        case VAR_ACCESS_ATTRIBUTE:
            OUT(indent, "attribute: {\n");
            print_symbol(variable_access->access.attribute, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case VAR_ACCESS_INDEX:
            OUT(indent, "index: {\n");
            print_expression(variable_access->access.index, out, indent + 1);
            OUT(indent, "}\n");
            break;
        default:
            OUT(indent, "error: \"Unknown variable access type\"\n");
            break;
    }
}

void print_symbol(Symbol* symbol, FILE* out, size_t indent) {
    OUT(indent, "name: \"%s(%zu)\"\n", symbol->name, symbol->id);
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            OUT(indent, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            OUT(indent, "kind: \"variable\"\n");
            break;
        case SYMBOL_FUNCTION:
            OUT(indent, "kind: \"function\"\n");
            break;
        case SYMBOL_CLASS:
            OUT(indent, "kind: \"class\"\n");
            break;
        case SYMBOL_METHOD:
            OUT(indent, "kind: \"method\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            OUT(indent, "kind: \"attribute\"\n");
            break;
        case SYMBOL_PARAMETER:
            OUT(indent, "kind: \"parameter\"\n");
            break;
        default:
            OUT(indent, "kind: \"unknown\"\n");
            break;
    }
    if (symbol->type != NULL) {
        OUT(indent, "type: \"%s(%zu)\"\n", symbol->type->name, symbol->type->id);
    } else {
        OUT(indent, "type: null\n");
    }
    if (symbol->kind == SYMBOL_VARIABLE || symbol->kind == SYMBOL_PARAMETER || symbol->kind == SYMBOL_ATTRIBUTE) {
        OUT(indent, "offset: %zu\n", symbol->info.offset);
    } else {
        OUT(indent, "offset: null\n");
    }
}

string operator_string(OperatorType op) {
    switch (op) {
        case OP_ADD: return "+";
        case OP_SUB: return "-";
        case OP_MUL: return "*";
        case OP_DIV: return "/";
        case OP_MOD: return "%";
        case OP_ASSIGN: return "=";
        case OP_EQ: return "==";
        case OP_NE: return "!=";
        case OP_LT: return "<";
        case OP_GT: return ">";
        case OP_LE: return "<=";
        case OP_GE: return ">=";
        case OP_ADD_ASSIGN: return "+=";
        case OP_SUB_ASSIGN: return "-=";
        case OP_MUL_ASSIGN: return "*=";
        case OP_DIV_ASSIGN: return "/=";
        case OP_MOD_ASSIGN: return "%=";
        case OP_AND: return "&&";
        case OP_OR: return "||";
        case OP_NONE: return "(none)";
        default: return "(unknown operator)";
    }
}

static void print_symbol_table_recursive(SymbolTable* table, FILE* out, size_t indent) {
    switch (table->type) {
        case SYMBOL_TABLE_GLOBAL:
            OUT(indent, "SymbolTable (type: global): {\n");
            break;
        case SYMBOL_TABLE_FUNCTION:
            OUT(indent, "SymbolTable (type: function): {\n");
            break;
        case SYMBOL_TABLE_CLASS:
            OUT(indent, "SymbolTable (type: class): {\n");
            break;
        case SYMBOL_TABLE_METHOD:
            OUT(indent, "SymbolTable (type: method): {\n");
            break;
        case SYMBOL_TABLE_BLOCK:
            OUT(indent, "SymbolTable (type: block): {\n");
            break;
        default:
            OUT(indent, "SymbolTable (type: unknown): {\n");
            break;
    }
    if (!list_empty(table->symbols)) {
        OUT(indent + 1, "symbols:\n");
        foreach (Symbol*, symbol, table->symbols) {
            OUT(indent + 1, "{\n");
            print_symbol(symbol, out, indent + 2);
            OUT(indent + 1, "}\n");
        }
    }
    if (!list_empty(table->children)) {
        OUT(indent + 1, "sub-tables:\n");
        foreach (SymbolTable*, child, table->children) {
            print_symbol_table_recursive(child, out, indent + 1);
        }
    }
    OUT(indent, "}\n");
}

void print_symbol_table(SymbolTable* table, FILE* out) {
    print_symbol_table_recursive(table, out, 0);
}
