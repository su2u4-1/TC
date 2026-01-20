#include "parser.h"

#include "lexer.h"
#include "lib.h"

#define list(type) offset(List(type)*)

// helper functions

// `static list<void*> create_list()`
static list() create_list(void) {
    offset(List*) new_list = alloc_memory(sizeof(List));
    List* list_ptr = (List*)offset_to_ptr(new_list);
    list_ptr->head = 0;
    list_ptr->tail = 0;
    return new_list;
}
// `static Node* create_node(void* content)`
static offset(Node*) create_node(offset() content) {
    offset(Node*) new_node = alloc_memory(sizeof(Node));
    Node* node_ptr = (Node*)offset_to_ptr(new_node);
    node_ptr->next = 0;
    node_ptr->content = content;
    return new_node;
}
// `static Name* create_name(string name, size_t id)`
static offset(Name*) create_name(string name, size_t id) {
    offset(Name*) new_name = alloc_memory(sizeof(Name));
    Name* name_ptr = (Name*)offset_to_ptr(new_name);
    name_ptr->name = name;
    name_ptr->id = id;
    return new_name;
}
// `static Scope* create_scope(offset(Scope*) parent)`
static offset(Scope*) create_scope(offset(Scope*) parent) {
    offset(Scope*) new_scope = alloc_memory(sizeof(Scope));
    Scope* scope_ptr = (Scope*)offset_to_ptr(new_scope);
    scope_ptr->parent = parent;
    scope_ptr->names = create_list();
    return new_scope;
}
// `static Name* search(Scope* scope, string name)`
static offset(Name*) search(offset(Scope*) scope, string name) {
    Scope* scope_ptr = (Scope*)offset_to_ptr(scope);
    while (scope_ptr != NULL) {
        list(Name*) names = scope_ptr->names;
        offset(Node*) current = ((List*)offset_to_ptr(names))->head;
        while (current != 0) {
            Node* node_ptr = (Node*)offset_to_ptr(current);
            offset(Name*) current_name = (node_ptr)->content;
            if (string_equal(((Name*)offset_to_ptr(current_name))->name, name))
                return current_name;
            current = node_ptr->next;
        }
        scope_ptr = (Scope*)offset_to_ptr(scope_ptr->parent);
    }
    return 0;
}
// `static void list_append(list<void*>* list, void* item)`
static void list_append(list() list, offset() item) {
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

#undef list
