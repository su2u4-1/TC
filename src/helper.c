#include "helper.h"

// list helper functions
list() create_list(void) {
    offset(List*) new_list = alloc_memory(sizeof(List));
    List* list_ptr = (List*)offset_to_ptr(new_list);
    list_ptr->head = 0;
    list_ptr->tail = 0;
    return new_list;
}

offset(Node*) create_node(offset() content) {
    offset(Node*) new_node = alloc_memory(sizeof(Node));
    Node* node_ptr = (Node*)offset_to_ptr(new_node);
    node_ptr->next = 0;
    node_ptr->content = content;
    return new_node;
}

void list_append(list() list, offset() item) {
    offset(Node*) new_node = create_node(item);
    List* list_ptr = (List*)offset_to_ptr(list);
    if (list_ptr->head == 0) {
        list_ptr->head = new_node;
        list_ptr->tail = new_node;
    } else {
        Node* tail_ptr = (Node*)offset_to_ptr(list_ptr->tail);
        tail_ptr->next = new_node;
        list_ptr->tail = new_node;
    }
}

list() list_copy(list() original) {
    list() new_list = create_list();
    List* original_ptr = (List*)offset_to_ptr(original);
    List* new_list_ptr = (List*)offset_to_ptr(new_list);
    new_list_ptr->head = original_ptr->head;
    new_list_ptr->tail = original_ptr->tail;
    return new_list;
}

offset() list_pop(list() lst) {
    List* list_ptr = (List*)offset_to_ptr(lst);
    if (list_ptr->head == 0)
        return 0;
    offset(Node*) head_node = list_ptr->head;
    Node* head_node_ptr = (Node*)offset_to_ptr(head_node);
    list_ptr->head = head_node_ptr->next;
    if (list_ptr->head == 0)
        list_ptr->tail = 0;
    return head_node_ptr->content;
}

// parser helper functions
offset(Name*) create_name(string name, NameType kind, offset(Name* | Scope*) info, offset(Scope*) scope) {
    static size_t id_counter = 0;
    offset(Name*) result = search(scope, name);
    if (result != 0)
        return result;
    offset(Name*) new_name = alloc_memory(sizeof(Name));
    Name* name_ptr = (Name*)offset_to_ptr(new_name);
    name_ptr->name = name;
    name_ptr->id = ++id_counter;
    name_ptr->kind = kind;
    if (kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD)
        name_ptr->info.type = info;
    else if (kind == NAME_CLASS)
        name_ptr->info.scope = info;
    else
        name_ptr->info.type = 0;
    Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
    list_append(scope_ptr->names, new_name);
    return new_name;
}

offset(Scope*) create_scope(offset(Scope*) parent) {
    offset(Scope*) new_scope = alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (Scope*)offset_to_ptr(new_scope);
    scope_ptr->parent = parent;
    scope_ptr->names = create_list();
    return new_scope;
}

offset(Name*) search(offset(Scope*) scope, string name) {
    Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
    while (scope_ptr != NULL) {
        list(Name*) names = scope_ptr->names;
        offset(Node*) current = ((List*)offset_to_ptr(names))->head;
        while (current != 0) {
            Node* node_ptr = (Node*)offset_to_ptr(current);
            offset(Name*) current_name = node_ptr->content;
            if (string_equal(((Name*)offset_to_ptr(current_name))->name, name))
                return current_name;
            current = node_ptr->next;
        }
        scope_ptr = (Scope*)offset_to_ptr(scope_ptr->parent);
    }
    return 0;
}

bool is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}

bool is_type(offset(Name*) type) {
    Name* type_ptr = (Name*)offset_to_ptr(type);
    return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
}

size_t parser_error(const char* message, offset(Token*) token_) {
    Token* ptr = (Token*)offset_to_ptr(token_);
    fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", ptr->line + 1, ptr->column + 1, message);
    return 0;
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

void indention(FILE* out, size_t indent, bool is_last, offset(Parser*) parser) {
    Parser* parser_ptr = (Parser*)offset_to_ptr(parser);
    set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
    for (size_t i = 1; i < indent; ++i)
        fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}

offset(Parser*) create_parser(void) {
    offset(Parser*) new_parser = alloc_memory(sizeof(Parser));
    Parser* parser_ptr = (Parser*)offset_to_ptr(new_parser);
    parser_ptr->current_token = 0;
    parser_ptr->in_function = false;
    parser_ptr->in_method = false;
    parser_ptr->in_loop = false;
    return new_parser;
}

offset(Name*) parse_import_std(offset(Name*) import_name, offset(Scope*) scope) {
    offset(Name*) name = 0;
    FILE* openfile;
    // temporary hack to recognize std library imports
    // temp, need path system
    if (strcmp(string_to_cstr(import_name), "print") == 0)
        openfile = fopen("./std/print.tc", "r");
    else if (strcmp(string_to_cstr(import_name), "arr") == 0) {
        openfile = fopen("./std/arr.tc", "r");
    } else
        return 0;
    if (openfile == NULL) {
        fprintf(stderr, "Error opening standard library file for import: %s\n", string_to_cstr(import_name));
        return 0;
    }
    fseek(openfile, 0, SEEK_END);
    size_t length = (size_t)ftell(openfile);
    fseek(openfile, 0, SEEK_SET);
    char* source = string_to_cstr(alloc_memory(length + 1));
    fread(source, 1, length, openfile);
    source[length] = '\0';
    fclose(openfile);
    offset(Lexer*) lexer = create_lexer(source, length);
    offset(Parser*) parser = create_parser();
    offset(Code*) code = parse_code(lexer, 0, parser);
    if (code == 0) {
        fprintf(stderr, "Error parsing standard library file for import: %s\n", string_to_cstr(import_name));
        return 0;
    }
    list(Node*) names = ((Scope*)offset_to_ptr(((Code*)offset_to_ptr(code))->global_scope))->names;
    offset(Node*) current = ((List*)offset_to_ptr(names))->head;
    while (current != 0) {
        Node* node_ptr = (Node*)offset_to_ptr(current);
        offset(Name*) current_name = node_ptr->content;
        if (string_equal(((Name*)offset_to_ptr(current_name))->name, import_name)) {
            name = current_name;
            break;
        }
        current = node_ptr->next;
    }
    if (name != 0) {
        Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
        list_append(scope_ptr->names, name);
    }
    return name;
}

// token helper functions
offset(Token*) next_token(offset(Lexer*) lexer, offset(Parser*) parser) {
    offset(Token*) token;
    while (true) {
        token = get_next_token(lexer);
        if (token == 0) {
            fprintf(stderr, "Error: get_next_token returned NULL\n");
            ((Parser*)offset_to_ptr(parser))->current_token = 0;
            return token;
        }
        if (((Token*)offset_to_ptr(token))->type != COMMENT)
            break;
    }
    ((Parser*)offset_to_ptr(parser))->current_token = token;
    return token;
}

inline offset(Token*) peek_current_token(offset(Parser*) parser) {
    return ((Parser*)offset_to_ptr(parser))->current_token;
}

inline offset(Token*) peek_token(offset(Lexer*) lexer) {
    return peek_next_token(lexer);
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
    if (op == OP_ASSIGN) return ASSIGN_SYMBOL;
    else if (op == OP_ADD_ASSIGN) return ADD_ASSIGN_SYMBOL;
    else if (op == OP_SUB_ASSIGN) return SUB_ASSIGN_SYMBOL;
    else if (op == OP_MUL_ASSIGN) return MUL_ASSIGN_SYMBOL;
    else if (op == OP_DIV_ASSIGN) return DIV_ASSIGN_SYMBOL;
    else if (op == OP_MOD_ASSIGN) return MOD_ASSIGN_SYMBOL;
    else if (op == OP_AND) return AND_SYMBOL;
    else if (op == OP_OR) return OR_SYMBOL;
    else if (op == OP_EQ) return EQ_SYMBOL;
    else if (op == OP_NE) return NE_SYMBOL;
    else if (op == OP_LT) return LT_SYMBOL;
    else if (op == OP_GT) return GT_SYMBOL;
    else if (op == OP_LE) return LE_SYMBOL;
    else if (op == OP_GE) return GE_SYMBOL;
    else if (op == OP_ADD) return ADD_SYMBOL;
    else if (op == OP_SUB) return SUB_SYMBOL;
    else if (op == OP_MUL) return MUL_SYMBOL;
    else if (op == OP_DIV) return DIV_SYMBOL;
    else if (op == OP_MOD) return MOD_SYMBOL;
    else return 0;
}
