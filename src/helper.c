#include "helper.h"

#include "compiler.h"
#include "lexer.h"

// list helper functions
list() create_list(void) {
    List* new_list = (List*)alloc_memory(sizeof(List));
    new_list->head = NULL;
    new_list->tail = NULL;
    return new_list;
}

static Node* create_node(pointer content) {
    Node* new_node = (Node*)alloc_memory(sizeof(Node));
    new_node->next = NULL;
    new_node->content = content;
    return new_node;
}

void list_append(list() list, pointer item) {
    if (list == NULL) {
        fprintf(stderr, "Error: list_append received NULL list\n");
        return;
    }
    Node* new_node = create_node(item);
    if (list->head == NULL) {
        list->head = new_node;
        list->tail = new_node;
    } else {
        list->tail->next = new_node;
        list->tail = new_node;
    }
}

list() list_copy(list() original) {
    if (original == NULL)
        return NULL;
    list() new_list = create_list();
    new_list->head = original->head;
    new_list->tail = original->tail;
    return new_list;
}

pointer list_pop(list() list) {
    if (list == NULL || list->head == NULL)
        return NULL;
    Node* head_node = list->head;
    list->head = head_node->next;
    if (list->head == NULL)
        list->tail = NULL;
    return head_node->content;
}

pointer list_pop_back(list() list) {
    if (list == NULL || list->head == NULL)
        return NULL;
    if (list->head == list->tail) {
        pointer content = list->head->content;
        list->head = NULL;
        list->tail = NULL;
        return content;
    }
    Node* current = list->head;
    while (current->next != list->tail)
        current = current->next;
    pointer content = list->tail->content;
    current->next = NULL;
    list->tail = current;
    return content;
}

bool list_is_empty(list() list) {
    return list == NULL || list->head == NULL || list->tail == NULL;
}

// parser helper functions
Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node) {
    static size_t id_counter = 0;
    SymbolTable* scope = NULL;
    switch (kind) {
        case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
        case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
        case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
        case SYMBOL_VARIABLE:
        case SYMBOL_PARAM:
        case SYMBOL_ATTRIBUTE:
        case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
        default:
            fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
            break;
    }
    Symbol* result = search_name(scope, name);
    if (result != NULL)
        fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
    Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
    new_name->name = name;
    new_name->id = ++id_counter;
    new_name->kind = kind;
    new_name->type = type;
    switch (kind) {
        case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
        case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
        case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
        case SYMBOL_VARIABLE:
        case SYMBOL_PARAM:
        case SYMBOL_ATTRIBUTE:
        case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
        default:
            fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
            break;
    }
    if (scope == NULL)
        fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
    else
        list_append(scope->symbols, (pointer)new_name);
    return new_name;
}

SymbolTable* create_symbol_table(SymbolTable* parent) {
    SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
    new_scope->parent = parent;
    new_scope->symbols = create_list();
    return new_scope;
}

Symbol* search_name_use_strcmp(SymbolTable* scope, string name) {
    while (scope != NULL) {
        list(Symbol*) names = scope->symbols;
        Node* current = names->head;
        while (current != NULL) {
            Symbol* current_name = (Symbol*)current->content;
            if (strcmp(current_name->name, name) == 0)
                return current_name;
            current = current->next;
        }
        scope = scope->parent;
    }
    return NULL;
}

Symbol* search_name(SymbolTable* scope, string name) {
    while (scope != NULL) {
        list(Symbol*) names = scope->symbols;
        Node* current = names->head;
        while (current != NULL) {
            Symbol* current_name = (Symbol*)current->content;
            if (string_equal(current_name->name, name))
                return current_name;
            current = current->next;
        }
        scope = scope->parent;
    }
    return NULL;
}

inline bool is_builtin_type(string type) {
    return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
}

inline void parser_error(const string message, Token* token, string file_name) {
    fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
}

static void set_bool_list(char bool_list[32], size_t index, bool value) {
    char word = bool_list[index / 8];
    bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
}

static inline bool get_bool_list(char bool_list[32], size_t index) {
    return (bool_list[index / 8] & (1 << (index % 8))) != 0;
}

void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
    set_bool_list(indent_has_next, indent, !is_last);
    for (size_t i = 1; i < indent; ++i)
        fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
    if (indent > 0)
        fprintf(out, is_last ? "└── " : "├── ");
}

Parser* create_parser(File* file) {
    Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
    new_parser->in_function = false;
    new_parser->in_method = false;
    new_parser->in_loop = false;
    new_parser->source_file = file;
    return new_parser;
}

Symbol* parse_import_file(string import_name, string source, SymbolTable* scope, File* source_file) {
    Symbol* name = NULL;
    FILE* openfile;
    string filename;
    if (source == NULL) {
        // import_name += ".tc";
        string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
        sprintf(temp_import_name, "%s.tc", import_name);
        filename = absolute_path(temp_import_name, std_path);
    } else
        filename = absolute_path(source, get_file_dir(source_file));
    openfile = fopen(filename, "r");
    if (openfile == NULL) {
        fprintf(stderr, "Error opening library file for import: %s\n", filename);
        return NULL;
    }
    printf("Info: Starting parsing lib file for import: %s\n", filename);
    size_t length = 0;
    string source_code = read_source(openfile, &length);
    fclose(openfile);
    Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
    printf("Info: Finished parsing lib file for import: %s\n", filename);
    if (code == NULL) {
        fprintf(stderr, "Error parsing library file for import: %s\n", filename);
        return NULL;
    }
    name = search_name_use_strcmp(code->global_scope, import_name);
    if (name != NULL)
        list_append(scope->symbols, (pointer)name);
    else
        fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
    return name;
}

string make_method_name(string class_name, string method_name) {
    string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
    sprintf(name, "%s.%s", class_name, method_name);
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
        default: return NULL;
    }
}
