	.file	"helper.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
	subq	$8, %rsp	;,
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:9:     new_list->head = NULL;
	movq	$0, (%rax)	;, new_list_3->head
; src/helper.c:10:     new_list->tail = NULL;
	movq	$0, 8(%rax)	;, new_list_3->tail
; src/helper.c:12: }
	addq	$8, %rsp	;,
	ret	
	.size	create_list, .-create_list
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/helper.c:22:     if (list == NULL) {
	testq	%rdi, %rdi	; list
	je	.L8	;,
	movq	%rdi, %rbx	; tmp90, list
	movq	%rsi, %rbp	; tmp91, item
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	;, new_node_15->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbp, 8(%rax)	; item, new_node_15->content
; src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	;, list_5(D)->head
	je	.L9	;,
; src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; list_5(D)->tail, _3
; src/helper.c:31:         list->tail->next = new_node;
	movq	%rax, (%rdx)	; new_node, _3->next
; src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_5(D)->tail
.L3:
; src/helper.c:34: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L8:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:24:         return;
	jmp	.L3	;
.L9:
; src/helper.c:28:         list->head = new_node;
	movq	%rax, (%rbx)	; new_node, list_5(D)->head
; src/helper.c:29:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_5(D)->tail
	jmp	.L3	;
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp87, original
; src/helper.c:37:     if (original == NULL)
	testq	%rdi, %rdi	; original
	je	.L12	;,
; src/helper.c:39:     list() new_list = create_list();
	call	create_list	;
; src/helper.c:40:     new_list->head = original->head;
	movq	(%rbx), %rdx	; original_5(D)->head, _1
; src/helper.c:40:     new_list->head = original->head;
	movq	%rdx, (%rax)	; _1, new_list_8->head
; src/helper.c:41:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	; original_5(D)->tail, _2
; src/helper.c:41:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	; _2, new_list_8->tail
.L10:
; src/helper.c:43: }
	popq	%rbx	;
	ret	
.L12:
; src/helper.c:38:         return NULL;
	movq	%rdi, %rax	; original, <retval>
	jmp	.L10	;
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rdi, %rdi	; list
	je	.L17	;,
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rdi), %rax	; list_6(D)->head, <retval>
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; <retval>
	je	.L14	;,
; src/helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	; _1->next, _2
; src/helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rdi)	; _2, list_6(D)->head
; src/helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	; _2
	je	.L18	;,
.L16:
; src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
	ret	
.L18:
; src/helper.c:51:         list->tail = NULL;
	movq	$0, 8(%rdi)	;, list_6(D)->tail
	jmp	.L16	;
.L17:
; src/helper.c:47:         return NULL;
	movq	%rdi, %rax	; list, <retval>
.L14:
; src/helper.c:53: }
	ret	
	.size	list_pop, .-list_pop
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rdi, %rdi	; list
	je	.L22	;,
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rdi), %rax	; list_7(D)->head, <retval>
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; <retval>
	je	.L19	;,
; src/helper.c:58:     if (list->head == list->tail) {
	movq	8(%rdi), %rdx	; list_7(D)->tail, _2
; src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%rdx, %rax	; _2, <retval>
	je	.L25	;,
.L21:
	movq	%rax, %rcx	; <retval>, current
; src/helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	; current_4->next, <retval>
; src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	; <retval>, _2
	jne	.L21	;,
; src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rdx), %rax	; _2->content, <retval>
; src/helper.c:68:     current->next = NULL;
	movq	$0, (%rcx)	;, current_15->next
; src/helper.c:69:     list->tail = current;
	movq	%rcx, 8(%rdi)	; current, list_7(D)->tail
; src/helper.c:70:     return content;
	ret	
.L25:
; src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	; _1->content, <retval>
; src/helper.c:60:         list->head = NULL;
	movq	$0, (%rdi)	;, list_7(D)->head
; src/helper.c:61:         list->tail = NULL;
	movq	$0, 8(%rdi)	;, list_7(D)->tail
; src/helper.c:62:         return content;
	ret	
.L22:
; src/helper.c:57:         return NULL;
	movq	%rdi, %rax	; list, <retval>
.L19:
; src/helper.c:71: }
	ret	
	.size	list_pop_back, .-list_pop_back
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movl	$1, %eax	;, iftmp.1_3
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rdi, %rdi	; list
	je	.L27	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, (%rdi)	;, list_4(D)->head
	je	.L27	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, 8(%rdi)	;, list_4(D)->tail
	sete	%al	;, iftmp.1_3
	movzbl	%al, %eax	; iftmp.1_3, iftmp.1_3
.L27:
; src/helper.c:75: }
	ret	
	.size	list_is_empty, .-list_is_empty
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, parent
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp87, <retval>
; src/helper.c:122:     new_scope->parent = parent;
	movq	%rbp, (%rax)	; parent, new_scope_4->parent
; src/helper.c:123:     new_scope->symbols = create_list();
	call	create_list	;
; src/helper.c:123:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	; tmp88, new_scope_4->symbols
; src/helper.c:125: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_symbol_table, .-create_symbol_table
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp93, scope
	movq	%rsi, %r12	; tmp94, name
; src/helper.c:128:     while (scope != NULL) {
	testq	%rdi, %rdi	; scope
	je	.L37	;,
.L36:
; src/helper.c:130:         Node* current = names->head;
	movq	8(%r13), %rax	; scope_16->symbols, scope_16->symbols
	movq	(%rax), %rbx	; names_8->head, current
; src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L34	;,
.L35:
; src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rbp	; current_17->content, <retval>
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	8(%rbp), %rdi	; current_name_11->name, current_name_11->name
	movq	%r12, %rsi	; name,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	; tmp95
	je	.L32	;,
; src/helper.c:135:             current = current->next;
	movq	(%rbx), %rbx	; current_17->next, current
; src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L35	;,
.L34:
; src/helper.c:137:         scope = scope->parent;
	movq	0(%r13), %r13	; scope_16->parent, scope
; src/helper.c:128:     while (scope != NULL) {
	testq	%r13, %r13	; scope
	jne	.L36	;,
; src/helper.c:139:     return NULL;
	movq	%r13, %rbp	; scope, <retval>
	jmp	.L32	;
.L37:
	movq	%rdi, %rbp	; scope, <retval>
.L32:
; src/helper.c:140: }
	movq	%rbp, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search_name_use_strcmp, .-search_name_use_strcmp
	.globl	search_name
	.type	search_name, @function
search_name:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp92, scope
	movq	%rsi, %r12	; tmp93, name
; src/helper.c:143:     while (scope != NULL) {
	testq	%rdi, %rdi	; scope
	je	.L46	;,
.L45:
; src/helper.c:145:         Node* current = names->head;
	movq	8(%r13), %rax	; scope_22->symbols, scope_22->symbols
	movq	(%rax), %rbx	; names_11->head, current
; src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L43	;,
.L44:
; src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rbp	; current_23->content, <retval>
; src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	8(%rbp), %rdi	; current_name_14->name, current_name_14->name
	movq	%r12, %rsi	; name,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp94
	jne	.L41	;,
; src/helper.c:150:             current = current->next;
	movq	(%rbx), %rbx	; current_23->next, current
; src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L44	;,
.L43:
; src/helper.c:152:         scope = scope->parent;
	movq	0(%r13), %r13	; scope_22->parent, scope
; src/helper.c:143:     while (scope != NULL) {
	testq	%r13, %r13	; scope
	jne	.L45	;,
; src/helper.c:154:     return NULL;
	movq	%r13, %rbp	; scope, <retval>
	jmp	.L41	;
.L46:
	movq	%rdi, %rbp	; scope, <retval>
.L41:
; src/helper.c:155: }
	movq	%rbp, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search_name, .-search_name
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"[Warning] Creating symbol with unknown SymbolType: %u\n"
	.align 8
.LC2:
	.string	"[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n"
	.align 8
.LC3:
	.string	"[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n"
	.align 8
.LC4:
	.string	"[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n"
	.text
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r12	; tmp127, name
	movl	%esi, %ebx	; tmp128, kind
	movq	%rdx, %r14	; tmp129, type
	movq	%rcx, %r13	; tmp130, ast_node
; src/helper.c:81:     switch (kind) {
	cmpl	$2, %esi	;, kind
	je	.L51	;,
	ja	.L52	;,
	testl	%esi, %esi	; kind
	je	.L71	;,
; src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	32(%rcx), %rax	; MEM[(struct Function *)ast_node_22(D)].function_scope, MEM[(struct Function *)ast_node_22(D)].function_scope
	movq	(%rax), %r15	; _2->parent, scope
; src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	jmp	.L56	;
.L52:
; src/helper.c:81:     switch (kind) {
	leal	-3(%rsi), %eax	;, tmp106
	movq	%rcx, %r15	; ast_node, scope
	cmpl	$3, %eax	;, tmp106
	jbe	.L56	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%esi, %ecx	; kind,
	leaq	.LC1(%rip), %rdx	;, tmp111
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:80:     SymbolTable* scope = NULL;
	movl	$0, %r15d	;, scope
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L56	;
.L71:
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%rcx), %rax	; MEM[(struct Class *)ast_node_22(D)].class_scope, MEM[(struct Class *)ast_node_22(D)].class_scope
	movq	(%rax), %r15	; _1->parent, scope
.L56:
; src/helper.c:93:     Symbol* result = search_name(scope, name);
	movq	%r12, %rsi	; name,
	movq	%r15, %rdi	; scope,
	call	search_name	;
; src/helper.c:94:     if (result != NULL)
	testq	%rax, %rax	; result
	je	.L57	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rax), %r9	; result_29->id, result_29->id
	movl	32(%rax), %r8d	; result_29->kind, result_29->kind
	subq	$8, %rsp	;,
; src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	; id_counter, tmp134
	addq	$1, %rax	;, tmp115
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rax	; tmp115
	movq	%r12, %rcx	; name,
	leaq	.LC2(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	addq	$16, %rsp	;,
.L57:
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp132, <retval>
; src/helper.c:97:     new_name->name = name;
	movq	%r12, 8(%rax)	; name, new_name_31->name
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp135
	addq	$1, %rax	;, _11
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	%rax, 16(%rbp)	; _11, new_name_31->id
; src/helper.c:99:     new_name->kind = kind;
	movl	%ebx, 32(%rbp)	; kind, new_name_31->kind
; src/helper.c:100:     new_name->type = type;
	movq	%r14, 0(%rbp)	; type, new_name_31->type
; src/helper.c:101:     switch (kind) {
	cmpl	$2, %ebx	;, kind
	je	.L58	;,
	ja	.L59	;,
	testl	%ebx, %ebx	; kind
	je	.L72	;,
; src/helper.c:103:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	movq	%r13, 24(%rbp)	; ast_node, new_name_31->ast_node.function
; src/helper.c:103:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	jmp	.L64	;
.L51:
; src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	32(%rcx), %rax	; MEM[(struct Method *)ast_node_22(D)].method_scope, MEM[(struct Method *)ast_node_22(D)].method_scope
	movq	(%rax), %r15	; _3->parent, scope
; src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	jmp	.L56	;
.L59:
; src/helper.c:101:     switch (kind) {
	leal	-3(%rbx), %eax	;, tmp119
	cmpl	$3, %eax	;, tmp119
	ja	.L73	;,
; src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	movq	%r13, 24(%rbp)	; ast_node, new_name_31->ast_node.scope
; src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	jmp	.L64	;
.L72:
; src/helper.c:102:         case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
	movq	%r13, 24(%rbp)	; ast_node, new_name_31->ast_node.class
.L64:
; src/helper.c:113:     if (scope == NULL)
	testq	%r15, %r15	; scope
	je	.L74	;,
; src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%r15), %rdi	; scope_16->symbols, scope_16->symbols
	movq	%rbp, %rsi	; <retval>,
	call	list_append	;
.L50:
; src/helper.c:118: }
	movq	%rbp, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L58:
; src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	%r13, 24(%rbp)	; ast_node, new_name_31->ast_node.method
; src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	jmp	.L64	;
.L73:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; kind,
	leaq	.LC3(%rip), %rdx	;, tmp121
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L64	;
.L74:
	movq	16(%rbp), %r9	; new_name_31->id,
	movl	%ebx, %r8d	; kind,
	movq	%r12, %rcx	; name,
	leaq	.LC4(%rip), %rdx	;, tmp124
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L50	;
	.size	create_symbol, .-create_symbol
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp104, type
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rsi	; INT_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp105
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.9_11
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp105
	je	.L82	;,
.L76:
; src/helper.c:159: }
	popq	%rbx	;
	ret	
.L82:
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rsi	; FLOAT_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp106
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.9_11
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp106
	jne	.L76	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rsi	; STRING_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp107
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.9_11
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp107
	jne	.L76	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rsi	; BOOL_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp108
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.9_11
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp108
	jne	.L76	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	VOID_KEYWORD(%rip), %rsi	; VOID_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp109
	setne	%al	;, iftmp.9_11
	movzbl	%al, %eax	; iftmp.9_11, iftmp.9_11
	jmp	.L76	;
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[Parser Error] at %s:%zu:%zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$16, %rsp	;,
	movq	%rdx, %rcx	; tmp98, file_name
; src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	16(%rsi), %rdx	; token_7(D)->column, token_7(D)->column
	movq	8(%rsi), %rax	; token_7(D)->line, token_7(D)->line
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rdi	; tmp96
	leaq	1(%rdx), %r9	;,
	leaq	1(%rax), %r8	;,
	leaq	.LC5(%rip), %rdx	;, tmp95
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:163: }
	addq	$24, %rsp	;,
	ret	
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"\342\224\202   "
.LC7:
	.string	"    "
.LC8:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC9:
	.string	"\342\224\234\342\224\200\342\224\200 "
	.text
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r13	; tmp132, out
	movq	%rsi, %rbp	; tmp133, indent
	movl	%edx, %edi	; tmp134, is_last
	movl	%edx, 12(%rsp)	; is_last, %sfp
	movq	%rcx, %r12	; tmp135, indent_has_next
; src/helper.c:166:     char word = bool_list[index / 8];
	movq	%rsi, %rax	; indent, tmp111
	shrq	$3, %rax	;, tmp111
; src/helper.c:166:     char word = bool_list[index / 8];
	addq	%rcx, %rax	; indent_has_next, _27
; src/helper.c:166:     char word = bool_list[index / 8];
	movzbl	(%rax), %edx	; *_27, word
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	testb	%dil, %dil	; is_last
	jne	.L86	;,
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	%esi, %ecx	; indent, tmp112
	andl	$7, %ecx	;, tmp112
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %esi	;, tmp114
	sall	%cl, %esi	; tmp112, tmp113
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orl	%esi, %edx	; tmp113, iftmp.18_33
.L87:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movb	%dl, (%rax)	; iftmp.18_33, *_27
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rbp	;, indent
	jbe	.L88	;,
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebx	;, i
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC7(%rip), %r15	;, tmp126
	leaq	.LC6(%rip), %r14	;, tmp127
.L90:
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%rbx, %rax	; i, tmp119
	shrq	$3, %rax	;, tmp119
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	(%r12,%rax), %eax	; *_16, *_16
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%ebx, %ecx	; i, tmp121
	andl	$7, %ecx	;, tmp121
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	sarl	%cl, %eax	; tmp121, tmp122
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	;, tmp122
	movq	%r14, %rdx	; tmp127, iftmp.16_4
	cmove	%r15, %rdx	; tmp126,, iftmp.16_4
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; out,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	;, i
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rbp	; i, indent
	jne	.L90	;,
.L91:
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 12(%rsp)	;, %sfp
	leaq	.LC9(%rip), %rdx	;, tmp128
	leaq	.LC8(%rip), %rax	;, tmp129
	cmovne	%rax, %rdx	; tmp128,, tmp129, iftmp.17_5
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; out,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:180: }
	jmp	.L85	;
.L86:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	%esi, %ecx	; indent, tmp115
	andl	$7, %ecx	;, tmp115
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %esi	;, tmp117
	sall	%cl, %esi	; tmp115, tmp116
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%esi	; tmp118
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andl	%esi, %edx	; tmp118, iftmp.18_33
	jmp	.L87	;
.L88:
; src/helper.c:178:     if (indent > 0)
	testq	%rbp, %rbp	; indent
	jne	.L91	;,
.L85:
; src/helper.c:180: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	indention, .-indention
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	salq	$2, %rsi	;, tmp87
	je	.L103	;,
; src/helper.c:182: void indention_tac(FILE* out, size_t indent) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r12	; tmp86, out
	movq	%rsi, %rbp	; tmp87, _11
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	movl	$0, %ebx	;, i
.L100:
; src/helper.c:184:         putc(' ', out);
	movq	%r12, %rsi	; out,
	movl	$32, %edi	;,
	call	*putc@GOTPCREL(%rip)	;
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	addq	$1, %rbx	;, i
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rbp, %rbx	; _11, i
	jne	.L100	;,
; src/helper.c:185: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L103:
	ret	
	.size	indention_tac, .-indention_tac
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp85, file
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:189:     new_parser->in_function = false;
	movb	$0, 8(%rax)	;, new_parser_3->in_function
; src/helper.c:190:     new_parser->in_method = false;
	movb	$0, 9(%rax)	;, new_parser_3->in_method
; src/helper.c:191:     new_parser->in_loop = false;
	movb	$0, 11(%rax)	;, new_parser_3->in_loop
; src/helper.c:192:     new_parser->source_file = file;
	movq	%rbx, (%rax)	; file, new_parser_3->source_file
; src/helper.c:194: }
	popq	%rbx	;
	ret	
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC10:
	.string	""
.LC11:
	.string	"%s.tc"
.LC12:
	.string	"/home/su2u4/code/TC/std/"
.LC13:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"Error opening library file for import: %s\n"
	.align 8
.LC15:
	.string	"Info: Starting parsing lib file for import: %s\n"
	.align 8
.LC16:
	.string	"Info: Finished parsing lib file for import: %s\n"
	.align 8
.LC17:
	.string	"Error parsing library file for import: %s\n"
	.align 8
.LC18:
	.string	"Error: Imported symbol '%s' was not found in %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp129, import_name
	movq	%rdx, %r13	; tmp131, scope
; src/helper.c:200:     if (source == NULL) {
	testq	%rsi, %rsi	; source
	je	.L116	;,
	movq	%rsi, %rbx	; tmp130, source
	movq	%rcx, %rdi	; tmp132, source_file
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	*get_file_dir@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp136, _3
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rdi	; source,
	call	*absolute_path@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp137, filename
.L110:
; src/helper.c:207:     openfile = fopen(filename, "r");
	leaq	.LC13(%rip), %rsi	;, tmp112
	movq	%rbp, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp138, <retval>
; src/helper.c:208:     if (openfile == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L117	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; filename,
	leaq	.LC15(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:213:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	8(%rsp), %rsi	;, tmp118
	movq	%rbx, %rdi	; <retval>,
	call	*read_source@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp139, source_code
; src/helper.c:215:     fclose(openfile);
	movq	%rbx, %rdi	; <retval>,
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rbp, %rdi	; filename,
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp140, _6
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	call	create_parser	;
	movq	%rax, %rbx	; tmp141, _7
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	builtin_scope(%rip), %r15	; builtin_scope, builtin_scope.21_8
	movq	%rbp, %rdx	; filename,
	movq	8(%rsp), %rsi	; length,
	movq	%r14, %rdi	; source_code,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp142, _10
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %rdx	; _7,
	movq	%r15, %rsi	; builtin_scope.21_8,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp143, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; filename,
	leaq	.LC16(%rip), %rdx	;, tmp121
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:218:     if (code == NULL) {
	testq	%rbx, %rbx	; <retval>
	je	.L118	;,
; src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%rbx), %rdi	; code_41->global_scope, code_41->global_scope
	movq	%r12, %rsi	; import_name,
	call	search_name_use_strcmp	;
	movq	%rax, %rbx	; tmp144, <retval>
; src/helper.c:223:     if (name != NULL)
	testq	%rax, %rax	; <retval>
	je	.L114	;,
; src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	8(%r13), %rdi	; scope_44(D)->symbols, scope_44(D)->symbols
	movq	%rax, %rsi	; <retval>,
	call	list_append	;
.L108:
; src/helper.c:228: }
	movq	%rbx, %rax	; <retval>,
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L116:
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	4(%rax), %rsi	;, tmp108
	leaq	.LC10(%rip), %rdi	;, tmp109
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp134, temp_import_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r8	; import_name,
	leaq	.LC11(%rip), %rcx	;, tmp110
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; temp_import_name,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC12(%rip), %rsi	;, tmp111
	movq	%rbx, %rdi	; temp_import_name,
	call	*absolute_path@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp135, filename
	jmp	.L110	;
.L117:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; filename,
	leaq	.LC14(%rip), %rdx	;, tmp115
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:210:         return NULL;
	jmp	.L108	;
.L118:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; filename,
	leaq	.LC17(%rip), %rdx	;, tmp123
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:220:         return NULL;
	jmp	.L108	;
.L114:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %r8	; filename,
	movq	%r12, %rcx	; import_name,
	leaq	.LC18(%rip), %rdx	;, tmp127
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L108	;
	.size	parse_import_file, .-parse_import_file
	.section	.rodata.str1.1
.LC19:
	.string	"%s.%s"
	.text
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbp	; tmp100, class_name
	movq	%rsi, %r12	; tmp101, method_name
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp102, tmp90
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%r12, %rdi	; method_name,
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	leaq	2(%rbx,%rax), %rsi	;, tmp96
	leaq	.LC10(%rip), %rdi	;, tmp97
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp104, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; method_name,
	movq	%rbp, %r8	; class_name,
	leaq	.LC19(%rip), %rcx	;, tmp98
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rax, %rdi	; <retval>,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:234: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	make_method_name, .-make_method_name
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp144, str
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp145
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	;, <retval>
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	; tmp145
	jne	.L121	;,
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp146
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, <retval>
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	; tmp146
	jne	.L121	;,
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp147
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, <retval>
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	; tmp147
	jne	.L121	;,
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp148
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, <retval>
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	; tmp148
	jne	.L121	;,
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp149
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, <retval>
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	; tmp149
	jne	.L121	;,
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp150
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, <retval>
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	; tmp150
	jne	.L121	;,
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp151
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, <retval>
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	; tmp151
	jne	.L121	;,
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp152
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, <retval>
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	; tmp152
	jne	.L121	;,
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp153
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, <retval>
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	; tmp153
	jne	.L121	;,
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp154
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, <retval>
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	; tmp154
	jne	.L121	;,
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp155
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, <retval>
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	; tmp155
	jne	.L121	;,
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp156
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, <retval>
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	; tmp156
	jne	.L121	;,
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp157
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, <retval>
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	; tmp157
	jne	.L121	;,
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp158
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, <retval>
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	; tmp158
	jne	.L121	;,
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp159
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	;, <retval>
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	; tmp159
	je	.L143	;,
.L121:
; src/helper.c:258: }
	popq	%rbx	;
	ret	
.L143:
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp160
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, <retval>
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	; tmp160
	jne	.L121	;,
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	; tmp161
	jne	.L139	;,
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	; tmp162
	jne	.L140	;,
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	;, _38
	sbbl	%eax, %eax	; <retval>
	andl	$15, %eax	;, <retval>
	addl	$4, %eax	;, <retval>
	jmp	.L121	;
.L139:
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, <retval>
	jmp	.L121	;
.L140:
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, <retval>
	jmp	.L121	;
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
; src/helper.c:261:     switch (op) {
	cmpl	$18, %edi	;, op
	ja	.L145	;,
	movl	%edi, %edi	; op, op
	leaq	.L147(%rip), %rdx	;, tmp85
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L147:
	.long	.L151-.L147
	.long	.L151-.L147
	.long	.L150-.L147
	.long	.L150-.L147
	.long	.L150-.L147
	.long	.L149-.L147
	.long	.L149-.L147
	.long	.L149-.L147
	.long	.L149-.L147
	.long	.L149-.L147
	.long	.L149-.L147
	.long	.L152-.L147
	.long	.L152-.L147
	.long	.L146-.L147
	.long	.L146-.L147
	.long	.L146-.L147
	.long	.L146-.L147
	.long	.L146-.L147
	.long	.L146-.L147
	.text
.L146:
; src/helper.c:268:             return 1;
	movl	$1, %eax	;, <retval>
	ret	
.L149:
; src/helper.c:278:             return 3;
	movl	$3, %eax	;, <retval>
	ret	
.L151:
; src/helper.c:281:             return 4;
	movl	$4, %eax	;, <retval>
	ret	
.L150:
; src/helper.c:285:             return 5;
	movl	$5, %eax	;, <retval>
	ret	
.L145:
; src/helper.c:288:             return 0;
	movl	$0, %eax	;, <retval>
	ret	
.L152:
; src/helper.c:261:     switch (op) {
	movl	$2, %eax	;, <retval>
; src/helper.c:290: }
	ret	
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
; src/helper.c:293:     switch (op) {
	cmpl	$18, %edi	;, op
	ja	.L175	;,
	movl	%edi, %edi	; op, op
	leaq	.L156(%rip), %rdx	;, tmp85
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L156:
	.long	.L174-.L156
	.long	.L173-.L156
	.long	.L172-.L156
	.long	.L171-.L156
	.long	.L170-.L156
	.long	.L169-.L156
	.long	.L168-.L156
	.long	.L167-.L156
	.long	.L166-.L156
	.long	.L165-.L156
	.long	.L164-.L156
	.long	.L163-.L156
	.long	.L162-.L156
	.long	.L161-.L156
	.long	.L160-.L156
	.long	.L159-.L156
	.long	.L158-.L156
	.long	.L157-.L156
	.long	.L155-.L156
	.text
.L161:
; src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, <retval>
	ret	
.L160:
; src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, <retval>
	ret	
.L159:
; src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, <retval>
	ret	
.L158:
; src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, <retval>
	ret	
.L157:
; src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, <retval>
	ret	
.L155:
; src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, <retval>
	ret	
.L163:
; src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, <retval>
	ret	
.L162:
; src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, <retval>
	ret	
.L169:
; src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, <retval>
	ret	
.L168:
; src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, <retval>
	ret	
.L167:
; src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, <retval>
	ret	
.L166:
; src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, <retval>
	ret	
.L165:
; src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, <retval>
	ret	
.L164:
; src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, <retval>
	ret	
.L174:
; src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, <retval>
	ret	
.L173:
; src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, <retval>
	ret	
.L172:
; src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, <retval>
	ret	
.L171:
; src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, <retval>
	ret	
.L170:
; src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, <retval>
	ret	
.L175:
; src/helper.c:293:     switch (op) {
	movl	$0, %eax	;, <retval>
; src/helper.c:316: }
	ret	
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
