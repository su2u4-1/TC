#include "output.h"

#include "ast.h"

void remove_trailing_comma(FILE* out) {
    long pos = ftell(out);
    if (pos <= 0) {
        return;
    }
    fseek(out, pos - 2, SEEK_SET);
    char c1 = (char)fgetc(out);
    char c2 = (char)fgetc(out);
    if (c1 == ',' && c2 == '\n') {
        fseek(out, pos - 2, SEEK_SET);
        fputc('\n', out);
    } else {
        fseek(out, pos, SEEK_SET);
    }
}

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
                OUT(1, "\"error\": \"Unknown code member type\",\n");
                break;
        }
    }
    remove_trailing_comma(out);
    OUT(0, "}\n");
}
void print_function(Function* function, FILE* out, size_t indent) {
    OUT(indent, "\"function\": {\n");
    OUT(indent + 1, "\"name\": \"%s\",\n", function->name->id);
    OUT(indent + 1, "\"return_type\": \"%s\",\n", function->type != NULL ? function->type->id : "(null)");
    OUT(indent + 1, "\"parameters\": [\n");
    foreach (Symbol*, param, function->parameters) {
        OUT(indent + 2, "{\n");
        OUT(indent + 3, "\"name\": \"%s\",\n", param->id);
        OUT(indent + 3, "\"type\": \"%s\"\n", param->type != NULL ? param->type->id : "(null)");
        OUT(indent + 2, "},\n");
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "],\n");
    OUT(indent + 1, "\"body\": [\n");
    foreach (Statement*, stmt, function->body) {
        print_statement(stmt, out, indent + 2);
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "]\n");
    OUT(indent, "},\n");
}
void print_class(Class* class, FILE* out, size_t indent) {
    OUT(indent, "\"class\": {\n");
    OUT(indent + 1, "\"name\": \"%s\",\n", class->name->id);
    foreach (ClassMember*, member, class->members) {
        if (member->type == CLASS_METHOD) {
            print_method(member->member.method, out, indent + 1);
        } else if (member->type == CLASS_ATTRIBUTE) {
            print_variable(member->member.attribute, out, indent + 1);
        } else {
            OUT(indent + 1, "\"error\": \"Unknown class member type\",\n");
        }
    }
    remove_trailing_comma(out);
    OUT(indent, "},\n");
}
void print_import(Import* import, FILE* out, size_t indent) {
    OUT(indent, "\"import\": {\n");
    OUT(indent + 1, "\"name\": \"%s\",\n", import->name->id);
    OUT(indent + 1, "\"path\": \"%s\"\n", import->path);
    OUT(indent, "},\n");
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
            OUT(indent, "\"break\": null,\n");
            break;
        case STATEMENT_CONTINUE:
            OUT(indent, "\"continue\": null,\n");
            break;
        case STATEMENT_RETURN:
            OUT(indent, "\"return\": {");
            print_expression(statement->statement.return_, out, indent + 1);
            OUT(indent, "},\n");
            break;
        case STATEMENT_EXPRESSION:
            OUT(indent, "\"expression\": {");
            print_expression(statement->statement.return_, out, indent + 1);
            OUT(indent, "},\n");
            break;
        default:
            OUT(indent, "\"error\": \"Unknown statement type\",\n");
            break;
    }
}
void print_method(Method* method, FILE* out, size_t indent) {
    OUT(indent, "\"method\": {\n");
    OUT(indent + 1, "\"name\": \"%s\",\n", method->name->id);
    OUT(indent + 1, "\"return_type\": \"%s\",\n", method->type != NULL ? method->type->id : "(null)");
    OUT(indent + 1, "\"parameters\": [\n");
    foreach (Symbol*, param, method->parameters) {
        OUT(indent + 2, "{\n");
        OUT(indent + 3, "\"name\": \"%s\",\n", param->id);
        OUT(indent + 3, "\"type\": \"%s\"\n", param->type != NULL ? param->type->id : "(null)");
        OUT(indent + 2, "},\n");
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "],\n");
    OUT(indent + 1, "\"body\": [\n");
    foreach (Statement*, stmt, method->body) {
        print_statement(stmt, out, indent + 2);
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "]\n");
    OUT(indent, "},\n");
}
void print_if(If* if_, FILE* out, size_t indent) {
    OUT(indent, "\"if\": {\n");
    OUT(indent + 1, "\"condition\": {");
    print_expression(if_->condition, out, indent + 2);
    OUT(indent + 1, "},\n");
    OUT(indent + 1, "\"body\": [\n");
    foreach (Statement*, stmt, if_->body) {
        print_statement(stmt, out, indent + 2);
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "],\n");
    OUT(indent + 1, "\"elif_list\": [\n");
    foreach (If*, elif, if_->elif_list) {
        OUT(indent + 2, "{\n");
        OUT(indent + 3, "\"condition\": {");
        print_expression(elif->condition, out, indent + 4);
        OUT(indent + 3, "},\n");
        OUT(indent + 3, "\"body\": [\n");
        foreach (Statement*, stmt, elif->body) {
            print_statement(stmt, out, indent + 4);
        }
        remove_trailing_comma(out);
        OUT(indent + 3, "]\n");
        OUT(indent + 2, "},\n");
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "],\n");
    OUT(indent + 1, "\"else_body\": [\n");
    foreach (Statement*, stmt, if_->else_body) {
        print_statement(stmt, out, indent + 2);
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "]\n");
    OUT(indent, "},\n");
}
void print_for(For* for_, FILE* out, size_t indent) {
    OUT(indent, "\"for\": {\n");
    if (for_->init.decl != NULL) {
        OUT(indent + 1, "\"init\": {\n");
        print_variable(for_->init.decl, out, indent + 2);
        OUT(indent + 1, "},\n");
    } else if (for_->init.expr != NULL) {
        OUT(indent + 1, "\"init\": {");
        print_expression(for_->init.expr, out, indent + 2);
        OUT(indent + 1, "},\n");
    } else {
        OUT(indent + 1, "\"init\": null,\n");
    }
    if (for_->condition != NULL) {
        OUT(indent + 1, "\"condition\": {");
        print_expression(for_->condition, out, indent + 2);
        OUT(indent + 1, "},\n");
    } else
        OUT(indent + 1, "\"condition\": null,\n");
    if (for_->increment != NULL) {
        OUT(indent + 1, "\"increment\": {");
        print_expression(for_->increment, out, indent + 2);
        OUT(indent + 1, "},\n");
    } else {
        OUT(indent + 1, "\"increment\": null,\n");
    }
    OUT(indent + 1, "\"body\": [\n");
    foreach (Statement*, stmt, for_->body) {
        print_statement(stmt, out, indent + 2);
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "]\n");
    OUT(indent, "},\n");
}
void print_while(While* while_, FILE* out, size_t indent) {
    OUT(indent, "\"while\": {\n");
    OUT(indent + 1, "\"condition\": {");
    print_expression(while_->condition, out, indent + 2);
    OUT(indent + 1, "},\n");
    OUT(indent + 1, "\"body\": [\n");
    foreach (Statement*, stmt, while_->body) {
        print_statement(stmt, out, indent + 2);
    }
    remove_trailing_comma(out);
    OUT(indent + 1, "]\n");
    OUT(indent, "},\n");
}
void print_expression(Expression* expression, FILE* out, size_t indent) {
    if (expression->op == OP_NONE) {
        OUT(indent, "\"primary\": {\n");
        print_primary(expression->left.unary, out, indent + 1);
        OUT(indent, "}\n");
    } else {
        OUT(indent, "\"left\": {\n");
        print_expression(expression->left.binary, out, indent + 1);
        OUT(indent, "},\n");
        OUT(indent, "\"operator\": \"%s\",\n", operator_string(expression->op));
        OUT(indent, "\"right\": {\n");
        print_expression(expression->right, out, indent + 1);
        OUT(indent, "}\n");
    }
}
void print_variable(Variable* variable, FILE* out, size_t indent) {
    OUT(indent, "\"variable\": {\n");
    OUT(indent + 1, "\"name\": \"%s\",\n", variable->var->id);
    if (variable->initializer != NULL) {
        OUT(indent + 1, "\"initializer\": {\n");
        print_expression(variable->initializer, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "\"initializer\": null\n");
    }
    OUT(indent, "},\n");
}
void print_primary(Primary* primary, FILE* out, size_t indent) {
    switch (primary->type) {
        case PRIMARY_INT:
        case PRIMARY_FLOAT:
        case PRIMARY_STRING:
        case PRIMARY_BOOL:
            OUT(indent, "\"literal\": %s,\n", primary->value.literal);
            break;
        case PRIMARY_NOT:
            OUT(indent, "\"not\": {\n");
            print_primary(primary->value.not, out, indent + 1);
            OUT(indent, "},\n");
            break;
        case PRIMARY_NEG:
            OUT(indent, "\"neg\": {\n");
            print_primary(primary->value.neg, out, indent + 1);
            OUT(indent, "},\n");
            break;
        case PRIMARY_EXPR:
            OUT(indent, "\"exp\": {\n");
            print_expression(primary->value.exp, out, indent + 1);
            OUT(indent, "},\n");
            break;
        case PRIMARY_VAR_ACCESS:
            print_variable_access(primary->value.var_access, out, indent);
            break;
        default:
            OUT(indent, "\"error\": \"Unknown primary type\",\n");
            break;
    }
}
void print_variable_access(VariableAccess* variable_access, FILE* out, size_t indent) {
    if (variable_access->base != NULL) {
        OUT(indent, "\"base\": {\n");
        print_variable_access(variable_access->base, out, indent + 1);
        OUT(indent, "},\n");
    }
    switch (variable_access->type) {
        case VAR_ACCESS_VAR:
            OUT(indent, "\"var\": \"%s\",\n", variable_access->access.var->id);
            break;
        case VAR_ACCESS_CALL:
            OUT(indent, "\"call\": {\n");
            int arg_index = 0;
            foreach (Expression*, arg, variable_access->access.args) {
                OUT(indent + 1, "\"arg[%d]\": {\n", arg_index++);
                print_expression(arg, out, indent + 1);
                OUT(indent + 1, "},\n");
            }
            remove_trailing_comma(out);
            OUT(indent, "},\n");
            break;
        case VAR_ACCESS_ATTRIBUTE:
            OUT(indent, "\"attribute\": \"%s\",\n", variable_access->access.attribute->id);
            break;
        case VAR_ACCESS_INDEX:
            OUT(indent, "\"index\": {\n");
            print_expression(variable_access->access.index, out, indent + 1);
            OUT(indent, "},\n");
            break;
        default:
            OUT(indent, "\"error\": \"Unknown variable access type\",\n");
            break;
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
