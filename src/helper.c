#include "helper.h"

#include "compiler.h"
#include "lexer.h"

// list helper functions
list() create_list(void) {
    List* new_list = (List*)alloc_memory(sizeof(List));
    new_list->head = 0;
    new_list->tail = 0;
    return new_list;
}

Node* create_node(pointer content) {
    Node* new_node = (Node*)alloc_memory(sizeof(Node));
    new_node->next = 0;
    new_node->content = content;
    return new_node;
}

void list_append(list() list, pointer item) {
    Node* new_node = create_node(item);
    if (list->head == 0) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
}

list() list_copy(list() original) {
    list() new_list = create_list();
    new_list->head = original->head;
    new_list->tail = original->tail;
    return new_list;
}

pointer list_pop(list() list) {
    if (list->head == 0)
        return 0;
    Node* head_node = list->head;
    list->head = head_node->next;
    if (list->head == 0)
        list->tail = 0;
    return head_node->content;
}

// parser helper functions
Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
    static size_t id_counter = 0;
    Name* result = search(scope, name);
    if (result != 0)
        return result;
    Name* new_name = (Name*)alloc_memory(sizeof(Name));
    Name* name_ptr = (new_name);
    name_ptr->name = name;
    name_ptr->id = ++id_counter;
    name_ptr->kind = kind;
    if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != 0)
        name_ptr->info.type = name_info;
    else if (kind == NAME_CLASS && scope_info != 0)
        name_ptr->info.scope = scope_info;
    else if (kind == NAME_TYPE)
        name_ptr->info.type = 0;
    else {
        if (name_info == 0 && scope_info == 0 && kind != NAME_TYPE)
            fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %d\n", kind);
        else
            fprintf(stderr, "Error creating name: unknown NameType %d\n", kind);
        return 0;
    }
    Scope* scope_ptr = (scope);
    list_append(scope_ptr->names, (pointer)new_name);
    return new_name;
}

Scope* create_scope(Scope* parent) {
    Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (new_scope);
    scope_ptr->parent = parent;
    scope_ptr->names = create_list();
    return new_scope;
}

Name* search(Scope* scope, string name) {
    Scope* scope_ptr = (scope);
    while (scope_ptr != NULL) {
        list(Name*) names = scope_ptr->names;
        Node* current = ((names))->head;
        while (current != 0) {
            Node* node_ptr = (current);
            Name* current_name = (Name*)node_ptr->content;
            if (string_equal(current_name->name, name))
                return current_name;
            current = node_ptr->next;
        }
        scope_ptr = (scope_ptr->parent);
    }
    return 0;
}

bool is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}

bool is_type(Name* type) {
    Name* type_ptr = (type);
    return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
}

void parser_error(const string message, Token* token) {
    fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
}

static void set_bool_list(char bool_list[32], size_t index, bool value) {
    char word = bool_list[index / 8];
    if (value)
        bool_list[index / 8] = (char)(word | (1 << (index % 8)));
    else
        bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
}

static bool get_bool_list(char bool_list[32], size_t index) {
    return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
}

void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
    Parser* parser_ptr = (parser);
    set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
    for (size_t i = 1; i < indent; ++i)
        fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}

Parser* create_parser(void) {
    Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
    Parser* parser_ptr = (new_parser);
    parser_ptr->in_function = false;
    parser_ptr->in_method = false;
    parser_ptr->in_loop = false;
    return new_parser;
}

Name* parse_import_file(string import_name, string score, Scope* scope) {
    Name* name = 0;
    FILE* openfile;
    // temporary hack, need path system
    char filename[MAX_FILENAME_SIZE];
    filename[0] = '\0';
    if (score == 0) {
        if (strcmp(import_name, "print") == 0)
            strcpy(filename, "./std/print.tc");
        else if (strcmp(import_name, "arr") == 0)
            strcpy(filename, "./std/arr.tc");
        else {
            fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
            return 0;
        }
    } else {
        string_append(filename, MAX_FILENAME_SIZE, filename, score);
        string_append(filename, MAX_FILENAME_SIZE, filename, "/");
        string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
        string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
    }
    openfile = fopen(filename, "r");
    if (openfile == NULL) {
        fprintf(stderr, "Error opening library file for import: %s\n", filename);
        return 0;
    }
    printf("Info: Starting parsing lib file for import: %s\n", filename);
    size_t length = 0;
    string source = read_source(openfile, &length);
    fclose(openfile);
    Code* code = parse_code(create_lexer(source, length), builtin_scope, create_parser());
    printf("Info: Finished parsing lib file for import: %s\n", filename);
    if (code == 0) {
        fprintf(stderr, "Error parsing library file for import: %s\n", filename);
        return 0;
    }
    list(Node*) names = ((((code))->global_scope))->names;
    Node* current = ((names))->head;
    while (current != 0) {
        Node* node_ptr = (current);
        Name* current_name = (Name*)node_ptr->content;
        if (string_equal(current_name->name, import_name)) {
            name = current_name;
            break;
        }
        current = node_ptr->next;
    }
    if (name != 0) {
        Scope* scope_ptr = (scope);
        list_append(scope_ptr->names, (pointer)name);
    }
    return name;
}

// operator helper functions
OperatorType string_to_operator(string str) {
    if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
    else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
    else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
    else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
    else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
    else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
    else if (string_equal(str, AND_SYMBOL)) return OP_AND;
    else if (string_equal(str, OR_SYMBOL)) return OP_OR;
    else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
    else if (string_equal(str, NE_SYMBOL)) return OP_NE;
    else if (string_equal(str, LT_SYMBOL)) return OP_LT;
    else if (string_equal(str, GT_SYMBOL)) return OP_GT;
    else if (string_equal(str, LE_SYMBOL)) return OP_LE;
    else if (string_equal(str, GE_SYMBOL)) return OP_GE;
    else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
    else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
    else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
    else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
    else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
    else return OP_NONE;
}

int operator_precedence(OperatorType op) {
    switch (op) {
        case OP_ASSIGN:      // =
        case OP_ADD_ASSIGN:  // +=
        case OP_SUB_ASSIGN:  // -=
        case OP_MUL_ASSIGN:  // *=
        case OP_DIV_ASSIGN:  // /=
        case OP_MOD_ASSIGN:  // %=
            return 1;
        case OP_AND:  // &&
        case OP_OR:   // ||
            return 2;
        case OP_EQ:  // ==
        case OP_NE:  // !=
        case OP_LT:  // <
        case OP_GT:  // >
        case OP_LE:  // <=
        case OP_GE:  // >=
            return 3;
        case OP_ADD:  // +
        case OP_SUB:  // -
            return 4;
        case OP_MUL:  // *
        case OP_DIV:  // /
        case OP_MOD:  // %
            return 5;
        case OP_NONE:
        default:
            return 0;
    }
}

string operator_to_string(OperatorType op) {
    switch (op) {
        case OP_ASSIGN: return ASSIGN_SYMBOL;
        case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
        case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
        case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
        case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
        case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
        case OP_AND: return AND_SYMBOL;
        case OP_OR: return OR_SYMBOL;
        case OP_EQ: return EQ_SYMBOL;
        case OP_NE: return NE_SYMBOL;
        case OP_LT: return LT_SYMBOL;
        case OP_GT: return GT_SYMBOL;
        case OP_LE: return LE_SYMBOL;
        case OP_GE: return GE_SYMBOL;
        case OP_ADD: return ADD_SYMBOL;
        case OP_SUB: return SUB_SYMBOL;
        case OP_MUL: return MUL_SYMBOL;
        case OP_DIV: return DIV_SYMBOL;
        case OP_MOD: return MOD_SYMBOL;
        case OP_NONE:
        default: return 0;
    }
}
