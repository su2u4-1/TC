	.file	"helper.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, new_list
; src/helper.c:9:     new_list->head = NULL;
	movq	-8(%rbp), %rax	; new_list, tmp85
	movq	$0, (%rax)	;, new_list_3->head
; src/helper.c:10:     new_list->tail = NULL;
	movq	-8(%rbp), %rax	; new_list, tmp86
	movq	$0, 8(%rax)	;, new_list_3->tail
; src/helper.c:11:     return new_list;
	movq	-8(%rbp), %rax	; new_list, _6
; src/helper.c:12: }
	leave	
	ret	
	.size	create_list, .-create_list
	.type	create_node, @function
create_node:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; content, content
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, new_node
; src/helper.c:16:     new_node->next = NULL;
	movq	-8(%rbp), %rax	; new_node, tmp85
	movq	$0, (%rax)	;, new_node_3->next
; src/helper.c:17:     new_node->content = content;
	movq	-8(%rbp), %rax	; new_node, tmp86
	movq	-24(%rbp), %rdx	; content, tmp87
	movq	%rdx, 8(%rax)	; tmp87, new_node_3->content
; src/helper.c:18:     return new_node;
	movq	-8(%rbp), %rax	; new_node, _7
; src/helper.c:19: }
	leave	
	ret	
	.size	create_node, .-create_node
	.section	.rodata
	.align 8
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; list, list
	movq	%rsi, -32(%rbp)	; item, item
; src/helper.c:22:     if (list == NULL) {
	cmpq	$0, -24(%rbp)	;, list
	jne	.L6	;,
; src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	stderr(%rip), %rax	; stderr, stderr.0_1
	movq	%rax, %rcx	; stderr.0_1,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:24:         return;
	jmp	.L5	;
.L6:
; src/helper.c:26:     Node* new_node = create_node(item);
	movq	-32(%rbp), %rax	; item, tmp86
	movq	%rax, %rdi	; tmp86,
	call	create_node	;
	movq	%rax, -8(%rbp)	; tmp87, new_node
; src/helper.c:27:     if (list->head == NULL) {
	movq	-24(%rbp), %rax	; list, tmp88
	movq	(%rax), %rax	; list_5(D)->head, _2
; src/helper.c:27:     if (list->head == NULL) {
	testq	%rax, %rax	; _2
	jne	.L8	;,
; src/helper.c:28:         list->head = new_node;
	movq	-24(%rbp), %rax	; list, tmp89
	movq	-8(%rbp), %rdx	; new_node, tmp90
	movq	%rdx, (%rax)	; tmp90, list_5(D)->head
; src/helper.c:29:         list->tail = new_node;
	movq	-24(%rbp), %rax	; list, tmp91
	movq	-8(%rbp), %rdx	; new_node, tmp92
	movq	%rdx, 8(%rax)	; tmp92, list_5(D)->tail
	jmp	.L5	;
.L8:
; src/helper.c:31:         list->tail->next = new_node;
	movq	-24(%rbp), %rax	; list, tmp93
	movq	8(%rax), %rax	; list_5(D)->tail, _3
; src/helper.c:31:         list->tail->next = new_node;
	movq	-8(%rbp), %rdx	; new_node, tmp94
	movq	%rdx, (%rax)	; tmp94, _3->next
; src/helper.c:32:         list->tail = new_node;
	movq	-24(%rbp), %rax	; list, tmp95
	movq	-8(%rbp), %rdx	; new_node, tmp96
	movq	%rdx, 8(%rax)	; tmp96, list_5(D)->tail
.L5:
; src/helper.c:34: }
	leave	
	ret	
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; original, original
; src/helper.c:37:     if (original == NULL)
	cmpq	$0, -24(%rbp)	;, original
	jne	.L10	;,
; src/helper.c:38:         return NULL;
	movl	$0, %eax	;, _3
	jmp	.L11	;
.L10:
; src/helper.c:39:     list() new_list = create_list();
	call	create_list	;
	movq	%rax, -8(%rbp)	; tmp86, new_list
; src/helper.c:40:     new_list->head = original->head;
	movq	-24(%rbp), %rax	; original, tmp87
	movq	(%rax), %rdx	; original_5(D)->head, _1
; src/helper.c:40:     new_list->head = original->head;
	movq	-8(%rbp), %rax	; new_list, tmp88
	movq	%rdx, (%rax)	; _1, new_list_8->head
; src/helper.c:41:     new_list->tail = original->tail;
	movq	-24(%rbp), %rax	; original, tmp89
	movq	8(%rax), %rdx	; original_5(D)->tail, _2
; src/helper.c:41:     new_list->tail = original->tail;
	movq	-8(%rbp), %rax	; new_list, tmp90
	movq	%rdx, 8(%rax)	; _2, new_list_8->tail
; src/helper.c:42:     return new_list;
	movq	-8(%rbp), %rax	; new_list, _3
.L11:
; src/helper.c:43: }
	leave	
	ret	
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -24(%rbp)	; list, list
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	cmpq	$0, -24(%rbp)	;, list
	je	.L13	;,
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	-24(%rbp), %rax	; list, tmp87
	movq	(%rax), %rax	; list_7(D)->head, _1
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; _1
	jne	.L14	;,
.L13:
; src/helper.c:47:         return NULL;
	movl	$0, %eax	;, _4
	jmp	.L15	;
.L14:
; src/helper.c:48:     Node* head_node = list->head;
	movq	-24(%rbp), %rax	; list, tmp88
	movq	(%rax), %rax	; list_7(D)->head, tmp89
	movq	%rax, -8(%rbp)	; tmp89, head_node
; src/helper.c:49:     list->head = head_node->next;
	movq	-8(%rbp), %rax	; head_node, tmp90
	movq	(%rax), %rdx	; head_node_9->next, _2
; src/helper.c:49:     list->head = head_node->next;
	movq	-24(%rbp), %rax	; list, tmp91
	movq	%rdx, (%rax)	; _2, list_7(D)->head
; src/helper.c:50:     if (list->head == NULL)
	movq	-24(%rbp), %rax	; list, tmp92
	movq	(%rax), %rax	; list_7(D)->head, _3
; src/helper.c:50:     if (list->head == NULL)
	testq	%rax, %rax	; _3
	jne	.L16	;,
; src/helper.c:51:         list->tail = NULL;
	movq	-24(%rbp), %rax	; list, tmp93
	movq	$0, 8(%rax)	;, list_7(D)->tail
.L16:
; src/helper.c:52:     return head_node->content;
	movq	-8(%rbp), %rax	; head_node, tmp94
	movq	8(%rax), %rax	; head_node_9->content, _4
.L15:
; src/helper.c:53: }
	popq	%rbp	;
	ret	
	.size	list_pop, .-list_pop
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -40(%rbp)	; list, list
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	cmpq	$0, -40(%rbp)	;, list
	je	.L18	;,
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	-40(%rbp), %rax	; list, tmp91
	movq	(%rax), %rax	; list_11(D)->head, _1
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; _1
	jne	.L19	;,
.L18:
; src/helper.c:57:         return NULL;
	movl	$0, %eax	;, _9
	jmp	.L20	;
.L19:
; src/helper.c:58:     if (list->head == list->tail) {
	movq	-40(%rbp), %rax	; list, tmp92
	movq	(%rax), %rdx	; list_11(D)->head, _2
; src/helper.c:58:     if (list->head == list->tail) {
	movq	-40(%rbp), %rax	; list, tmp93
	movq	8(%rax), %rax	; list_11(D)->tail, _3
; src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%rax, %rdx	; _3, _2
	jne	.L21	;,
; src/helper.c:59:         pointer content = list->head->content;
	movq	-40(%rbp), %rax	; list, tmp94
	movq	(%rax), %rax	; list_11(D)->head, _4
; src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	; _4->content, tmp95
	movq	%rax, -24(%rbp)	; tmp95, content
; src/helper.c:60:         list->head = NULL;
	movq	-40(%rbp), %rax	; list, tmp96
	movq	$0, (%rax)	;, list_11(D)->head
; src/helper.c:61:         list->tail = NULL;
	movq	-40(%rbp), %rax	; list, tmp97
	movq	$0, 8(%rax)	;, list_11(D)->tail
; src/helper.c:62:         return content;
	movq	-24(%rbp), %rax	; content, _9
	jmp	.L20	;
.L21:
; src/helper.c:64:     Node* current = list->head;
	movq	-40(%rbp), %rax	; list, tmp98
	movq	(%rax), %rax	; list_11(D)->head, tmp99
	movq	%rax, -8(%rbp)	; tmp99, current
; src/helper.c:65:     while (current->next != list->tail)
	jmp	.L22	;
.L23:
; src/helper.c:66:         current = current->next;
	movq	-8(%rbp), %rax	; current, tmp100
	movq	(%rax), %rax	; current_8->next, tmp101
	movq	%rax, -8(%rbp)	; tmp101, current
.L22:
; src/helper.c:65:     while (current->next != list->tail)
	movq	-8(%rbp), %rax	; current, tmp102
	movq	(%rax), %rdx	; current_8->next, _5
; src/helper.c:65:     while (current->next != list->tail)
	movq	-40(%rbp), %rax	; list, tmp103
	movq	8(%rax), %rax	; list_11(D)->tail, _6
; src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	; _6, _5
	jne	.L23	;,
; src/helper.c:67:     pointer content = list->tail->content;
	movq	-40(%rbp), %rax	; list, tmp104
	movq	8(%rax), %rax	; list_11(D)->tail, _7
; src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	; _7->content, tmp105
	movq	%rax, -16(%rbp)	; tmp105, content
; src/helper.c:68:     current->next = NULL;
	movq	-8(%rbp), %rax	; current, tmp106
	movq	$0, (%rax)	;, current_8->next
; src/helper.c:69:     list->tail = current;
	movq	-40(%rbp), %rax	; list, tmp107
	movq	-8(%rbp), %rdx	; current, tmp108
	movq	%rdx, 8(%rax)	; tmp108, list_11(D)->tail
; src/helper.c:70:     return content;
	movq	-16(%rbp), %rax	; content, _9
.L20:
; src/helper.c:71: }
	popq	%rbp	;
	ret	
	.size	list_pop_back, .-list_pop_back
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; list, list
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, -8(%rbp)	;, list
	je	.L25	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movq	-8(%rbp), %rax	; list, tmp87
	movq	(%rax), %rax	; list_4(D)->head, _1
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rax, %rax	; _1
	je	.L25	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movq	-8(%rbp), %rax	; list, tmp88
	movq	8(%rax), %rax	; list_4(D)->tail, _2
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rax, %rax	; _2
	jne	.L26	;,
.L25:
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movl	$1, %eax	;, iftmp.1_3
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	jmp	.L27	;
.L26:
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movl	$0, %eax	;, iftmp.1_3
.L27:
; src/helper.c:75: }
	popq	%rbp	;
	ret	
	.size	list_is_empty, .-list_is_empty
	.section	.rodata
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; name, name
	movl	%esi, -44(%rbp)	; kind, kind
	movq	%rdx, -56(%rbp)	; type, type
	movq	%rcx, -64(%rbp)	; ast_node, ast_node
; src/helper.c:80:     SymbolTable* scope = NULL;
	movq	$0, -8(%rbp)	;, scope
; src/helper.c:81:     switch (kind) {
	cmpl	$6, -44(%rbp)	;, kind
	ja	.L30	;,
	cmpl	$3, -44(%rbp)	;, kind
	jnb	.L31	;,
	cmpl	$2, -44(%rbp)	;, kind
	je	.L32	;,
	cmpl	$2, -44(%rbp)	;, kind
	ja	.L30	;,
	cmpl	$0, -44(%rbp)	;, kind
	je	.L33	;,
	cmpl	$1, -44(%rbp)	;, kind
	je	.L34	;,
	jmp	.L30	;
.L33:
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	-64(%rbp), %rax	; ast_node, tmp100
	movq	16(%rax), %rax	; MEM[(struct Class *)ast_node_24(D)].class_scope, _1
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	(%rax), %rax	; _1->parent, tmp101
	movq	%rax, -8(%rbp)	; tmp101, scope
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	jmp	.L35	;
.L34:
; src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	-64(%rbp), %rax	; ast_node, tmp102
	movq	32(%rax), %rax	; MEM[(struct Function *)ast_node_24(D)].function_scope, _2
; src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	(%rax), %rax	; _2->parent, tmp103
	movq	%rax, -8(%rbp)	; tmp103, scope
; src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	jmp	.L35	;
.L32:
; src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	-64(%rbp), %rax	; ast_node, tmp104
	movq	32(%rax), %rax	; MEM[(struct Method *)ast_node_24(D)].method_scope, _3
; src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	(%rax), %rax	; _3->parent, tmp105
	movq	%rax, -8(%rbp)	; tmp105, scope
; src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	jmp	.L35	;
.L31:
; src/helper.c:88:         case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
	movq	-64(%rbp), %rax	; ast_node, tmp106
	movq	%rax, -8(%rbp)	; tmp106, scope
; src/helper.c:88:         case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
	jmp	.L35	;
.L30:
; src/helper.c:90:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType: %u\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.2_4
	movl	-44(%rbp), %edx	; kind, tmp107
	leaq	.LC1(%rip), %rcx	;, tmp108
	movq	%rcx, %rsi	; tmp108,
	movq	%rax, %rdi	; stderr.2_4,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:91:             break;
	nop	
.L35:
; src/helper.c:93:     Symbol* result = search_name(scope, name);
	movq	-40(%rbp), %rdx	; name, tmp109
	movq	-8(%rbp), %rax	; scope, tmp110
	movq	%rdx, %rsi	; tmp109,
	movq	%rax, %rdi	; tmp110,
	call	search_name	;
	movq	%rax, -16(%rbp)	; tmp111, result
; src/helper.c:94:     if (result != NULL)
	cmpq	$0, -16(%rbp)	;, result
	je	.L36	;,
; src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	; id_counter, id_counter.3_5
	leaq	1(%rax), %rdi	;, _6
	movq	-16(%rbp), %rax	; result, tmp112
	movq	16(%rax), %rsi	; result_33->id, _7
; src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	-16(%rbp), %rax	; result, tmp113
	movl	32(%rax), %ecx	; result_33->kind, _8
; src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	stderr(%rip), %rax	; stderr, stderr.4_9
	movq	-40(%rbp), %rdx	; name, tmp114
	movq	%rdi, %r9	; _6,
	movq	%rsi, %r8	; _7,
	leaq	.LC2(%rip), %rsi	;, tmp115
	movq	%rax, %rdi	; stderr.4_9,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L36:
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp116, new_name
; src/helper.c:97:     new_name->name = name;
	movq	-24(%rbp), %rax	; new_name, tmp117
	movq	-40(%rbp), %rdx	; name, tmp118
	movq	%rdx, 8(%rax)	; tmp118, new_name_36->name
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, id_counter.5_10
	addq	$1, %rax	;, _11
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	id_counter.0(%rip), %rdx	; id_counter, id_counter.6_12
	movq	-24(%rbp), %rax	; new_name, tmp119
	movq	%rdx, 16(%rax)	; id_counter.6_12, new_name_36->id
; src/helper.c:99:     new_name->kind = kind;
	movq	-24(%rbp), %rax	; new_name, tmp120
	movl	-44(%rbp), %edx	; kind, tmp121
	movl	%edx, 32(%rax)	; tmp121, new_name_36->kind
; src/helper.c:100:     new_name->type = type;
	movq	-24(%rbp), %rax	; new_name, tmp122
	movq	-56(%rbp), %rdx	; type, tmp123
	movq	%rdx, (%rax)	; tmp123, new_name_36->type
; src/helper.c:101:     switch (kind) {
	cmpl	$6, -44(%rbp)	;, kind
	ja	.L37	;,
	cmpl	$3, -44(%rbp)	;, kind
	jnb	.L38	;,
	cmpl	$2, -44(%rbp)	;, kind
	je	.L39	;,
	cmpl	$2, -44(%rbp)	;, kind
	ja	.L37	;,
	cmpl	$0, -44(%rbp)	;, kind
	je	.L40	;,
	cmpl	$1, -44(%rbp)	;, kind
	je	.L41	;,
	jmp	.L37	;
.L40:
; src/helper.c:102:         case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
	movq	-24(%rbp), %rax	; new_name, tmp124
	movq	-64(%rbp), %rdx	; ast_node, tmp125
	movq	%rdx, 24(%rax)	; tmp125, new_name_36->ast_node.class
; src/helper.c:102:         case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
	jmp	.L42	;
.L41:
; src/helper.c:103:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	movq	-24(%rbp), %rax	; new_name, tmp126
	movq	-64(%rbp), %rdx	; ast_node, tmp127
	movq	%rdx, 24(%rax)	; tmp127, new_name_36->ast_node.function
; src/helper.c:103:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	jmp	.L42	;
.L39:
; src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	-24(%rbp), %rax	; new_name, tmp128
	movq	-64(%rbp), %rdx	; ast_node, tmp129
	movq	%rdx, 24(%rax)	; tmp129, new_name_36->ast_node.method
; src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	jmp	.L42	;
.L38:
; src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	movq	-24(%rbp), %rax	; new_name, tmp130
	movq	-64(%rbp), %rdx	; ast_node, tmp131
	movq	%rdx, 24(%rax)	; tmp131, new_name_36->ast_node.scope
; src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	jmp	.L42	;
.L37:
; src/helper.c:110:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.7_13
	movl	-44(%rbp), %edx	; kind, tmp132
	leaq	.LC3(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.7_13,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:111:             break;
	nop	
.L42:
; src/helper.c:113:     if (scope == NULL)
	cmpq	$0, -8(%rbp)	;, scope
	jne	.L43	;,
; src/helper.c:114:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	-24(%rbp), %rax	; new_name, tmp134
	movq	16(%rax), %rsi	; new_name_36->id, _14
	movq	stderr(%rip), %rax	; stderr, stderr.8_15
	movl	-44(%rbp), %ecx	; kind, tmp135
	movq	-40(%rbp), %rdx	; name, tmp136
	movq	%rsi, %r8	; _14,
	leaq	.LC4(%rip), %rsi	;, tmp137
	movq	%rax, %rdi	; stderr.8_15,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L44	;
.L43:
; src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	-8(%rbp), %rax	; scope, tmp138
	movq	8(%rax), %rax	; scope_17->symbols, _16
	movq	-24(%rbp), %rdx	; new_name, tmp139
	movq	%rdx, %rsi	; tmp139,
	movq	%rax, %rdi	; _16,
	call	list_append	;
.L44:
; src/helper.c:117:     return new_name;
	movq	-24(%rbp), %rax	; new_name, _50
; src/helper.c:118: }
	leave	
	ret	
	.size	create_symbol, .-create_symbol
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; parent, parent
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, new_scope
; src/helper.c:122:     new_scope->parent = parent;
	movq	-8(%rbp), %rax	; new_scope, tmp86
	movq	-24(%rbp), %rdx	; parent, tmp87
	movq	%rdx, (%rax)	; tmp87, new_scope_4->parent
; src/helper.c:123:     new_scope->symbols = create_list();
	call	create_list	;
; src/helper.c:123:     new_scope->symbols = create_list();
	movq	-8(%rbp), %rdx	; new_scope, tmp88
	movq	%rax, 8(%rdx)	; _1, new_scope_4->symbols
; src/helper.c:124:     return new_scope;
	movq	-8(%rbp), %rax	; new_scope, _9
; src/helper.c:125: }
	leave	
	ret	
	.size	create_symbol_table, .-create_symbol_table
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; scope, scope
	movq	%rsi, -48(%rbp)	; name, name
; src/helper.c:128:     while (scope != NULL) {
	jmp	.L49	;
.L54:
; src/helper.c:129:         list(Symbol*) names = scope->symbols;
	movq	-40(%rbp), %rax	; scope, tmp86
	movq	8(%rax), %rax	; scope_3->symbols, tmp87
	movq	%rax, -16(%rbp)	; tmp87, names
; src/helper.c:130:         Node* current = names->head;
	movq	-16(%rbp), %rax	; names, tmp88
	movq	(%rax), %rax	; names_9->head, tmp89
	movq	%rax, -8(%rbp)	; tmp89, current
; src/helper.c:131:         while (current != NULL) {
	jmp	.L50	;
.L53:
; src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	-8(%rbp), %rax	; current, tmp90
	movq	8(%rax), %rax	; current_4->content, tmp91
	movq	%rax, -24(%rbp)	; tmp91, current_name
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	-24(%rbp), %rax	; current_name, tmp92
	movq	8(%rax), %rax	; current_name_12->name, _1
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	-48(%rbp), %rdx	; name, tmp93
	movq	%rdx, %rsi	; tmp93,
	movq	%rax, %rdi	; _1,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	; _2
	jne	.L51	;,
; src/helper.c:134:                 return current_name;
	movq	-24(%rbp), %rax	; current_name, _5
	jmp	.L52	;
.L51:
; src/helper.c:135:             current = current->next;
	movq	-8(%rbp), %rax	; current, tmp94
	movq	(%rax), %rax	; current_4->next, tmp95
	movq	%rax, -8(%rbp)	; tmp95, current
.L50:
; src/helper.c:131:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L53	;,
; src/helper.c:137:         scope = scope->parent;
	movq	-40(%rbp), %rax	; scope, tmp96
	movq	(%rax), %rax	; scope_3->parent, tmp97
	movq	%rax, -40(%rbp)	; tmp97, scope
.L49:
; src/helper.c:128:     while (scope != NULL) {
	cmpq	$0, -40(%rbp)	;, scope
	jne	.L54	;,
; src/helper.c:139:     return NULL;
	movl	$0, %eax	;, _5
.L52:
; src/helper.c:140: }
	leave	
	ret	
	.size	search_name_use_strcmp, .-search_name_use_strcmp
	.globl	search_name
	.type	search_name, @function
search_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; scope, scope
	movq	%rsi, -48(%rbp)	; name, name
; src/helper.c:143:     while (scope != NULL) {
	jmp	.L56	;
.L61:
; src/helper.c:144:         list(Symbol*) names = scope->symbols;
	movq	-40(%rbp), %rax	; scope, tmp86
	movq	8(%rax), %rax	; scope_3->symbols, tmp87
	movq	%rax, -16(%rbp)	; tmp87, names
; src/helper.c:145:         Node* current = names->head;
	movq	-16(%rbp), %rax	; names, tmp88
	movq	(%rax), %rax	; names_12->head, tmp89
	movq	%rax, -8(%rbp)	; tmp89, current
; src/helper.c:146:         while (current != NULL) {
	jmp	.L57	;
.L60:
; src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	-8(%rbp), %rax	; current, tmp90
	movq	8(%rax), %rax	; current_4->content, tmp91
	movq	%rax, -24(%rbp)	; tmp91, current_name
; src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	-24(%rbp), %rax	; current_name, tmp92
	movq	8(%rax), %rax	; current_name_15->name, _1
	movq	-48(%rbp), %rdx	; name, tmp93
	movq	%rdx, %rsi	; tmp93,
	movq	%rax, %rdi	; _1,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	; _2
	je	.L58	;,
; src/helper.c:149:                 return current_name;
	movq	-24(%rbp), %rax	; current_name, _5
	jmp	.L59	;
.L58:
; src/helper.c:150:             current = current->next;
	movq	-8(%rbp), %rax	; current, tmp94
	movq	(%rax), %rax	; current_4->next, tmp95
	movq	%rax, -8(%rbp)	; tmp95, current
.L57:
; src/helper.c:146:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L60	;,
; src/helper.c:152:         scope = scope->parent;
	movq	-40(%rbp), %rax	; scope, tmp96
	movq	(%rax), %rax	; scope_3->parent, tmp97
	movq	%rax, -40(%rbp)	; tmp97, scope
.L56:
; src/helper.c:143:     while (scope != NULL) {
	cmpq	$0, -40(%rbp)	;, scope
	jne	.L61	;,
; src/helper.c:154:     return NULL;
	movl	$0, %eax	;, _5
.L59:
; src/helper.c:155: }
	leave	
	ret	
	.size	search_name, .-search_name
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; type, type
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rdx	; INT_KEYWORD, INT_KEYWORD.10_1
	movq	-8(%rbp), %rax	; type, tmp95
	movq	%rdx, %rsi	; INT_KEYWORD.10_1,
	movq	%rax, %rdi	; tmp95,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _2
	jne	.L63	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rdx	; FLOAT_KEYWORD, FLOAT_KEYWORD.11_3
	movq	-8(%rbp), %rax	; type, tmp96
	movq	%rdx, %rsi	; FLOAT_KEYWORD.11_3,
	movq	%rax, %rdi	; tmp96,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _4
	jne	.L63	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rdx	; STRING_KEYWORD, STRING_KEYWORD.12_5
	movq	-8(%rbp), %rax	; type, tmp97
	movq	%rdx, %rsi	; STRING_KEYWORD.12_5,
	movq	%rax, %rdi	; tmp97,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _6
	jne	.L63	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rdx	; BOOL_KEYWORD, BOOL_KEYWORD.13_7
	movq	-8(%rbp), %rax	; type, tmp98
	movq	%rdx, %rsi	; BOOL_KEYWORD.13_7,
	movq	%rax, %rdi	; tmp98,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _8
	jne	.L63	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	VOID_KEYWORD(%rip), %rdx	; VOID_KEYWORD, VOID_KEYWORD.14_9
	movq	-8(%rbp), %rax	; type, tmp99
	movq	%rdx, %rsi	; VOID_KEYWORD.14_9,
	movq	%rax, %rdi	; tmp99,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _10
	je	.L64	;,
.L63:
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.9_11
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L65	;
.L64:
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$0, %eax	;, iftmp.9_11
.L65:
; src/helper.c:159: }
	leave	
	ret	
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata
	.align 8
.LC5:
	.string	"[Parser Error] at %s:%zu:%zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; message, message
	movq	%rsi, -16(%rbp)	; token, token
	movq	%rdx, -24(%rbp)	; file_name, file_name
; src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	-16(%rbp), %rax	; token, tmp87
	movq	16(%rax), %rax	; token_7(D)->column, _1
; src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rdi	;, _2
; src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	-16(%rbp), %rax	; token, tmp88
	movq	8(%rax), %rax	; token_7(D)->line, _3
; src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rcx	;, _4
	movq	stderr(%rip), %rax	; stderr, stderr.15_5
	movq	-8(%rbp), %rsi	; message, tmp89
	movq	-24(%rbp), %rdx	; file_name, tmp90
	movq	%rsi, %r9	; tmp89,
	movq	%rdi, %r8	; _2,
	leaq	.LC5(%rip), %rsi	;, tmp91
	movq	%rax, %rdi	; stderr.15_5,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:163: }
	nop	
	leave	
	ret	
	.size	parser_error, .-parser_error
	.type	set_bool_list, @function
set_bool_list:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -24(%rbp)	; bool_list, bool_list
	movq	%rsi, -32(%rbp)	; index, index
	movl	%edx, %eax	; value, tmp96
	movb	%al, -36(%rbp)	; tmp97, value
; src/helper.c:166:     char word = bool_list[index / 8];
	movq	-32(%rbp), %rax	; index, tmp98
	shrq	$3, %rax	;, tmp98
	movq	%rax, %rdx	; tmp98, _1
; src/helper.c:166:     char word = bool_list[index / 8];
	movq	-24(%rbp), %rax	; bool_list, tmp99
	addq	%rdx, %rax	; _1, _2
; src/helper.c:166:     char word = bool_list[index / 8];
	movzbl	(%rax), %eax	; *_2, tmp100
	movb	%al, -1(%rbp)	; tmp100, word
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	cmpb	$0, -36(%rbp)	;, value
	je	.L69	;,
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	-32(%rbp), %rax	; index, tmp101
	andl	$7, %eax	;, _4
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %edx	;, tmp102
	movl	%eax, %ecx	; _4, tmp110
	sall	%cl, %edx	; tmp110, tmp102
	movl	%edx, %eax	; tmp102, _5
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orb	-1(%rbp), %al	; word, iftmp.16_14
	jmp	.L70	;
.L69:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	-32(%rbp), %rax	; index, tmp103
	andl	$7, %eax	;, _8
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %edx	;, tmp104
	movl	%eax, %ecx	; _8, tmp112
	sall	%cl, %edx	; tmp112, tmp104
	movl	%edx, %eax	; tmp104, _9
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%eax	; _11
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andb	-1(%rbp), %al	; word, iftmp.16_14
.L70:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	-32(%rbp), %rdx	; index, tmp105
	movq	%rdx, %rcx	; tmp105, tmp105
	shrq	$3, %rcx	;, tmp105
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	-24(%rbp), %rdx	; bool_list, tmp106
	addq	%rcx, %rdx	; _12, _13
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movb	%al, (%rdx)	; iftmp.16_14, *_13
; src/helper.c:168: }
	nop	
	popq	%rbp	;
	ret	
	.size	set_bool_list, .-set_bool_list
	.type	get_bool_list, @function
get_bool_list:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -8(%rbp)	; bool_list, bool_list
	movq	%rsi, -16(%rbp)	; index, index
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	-16(%rbp), %rax	; index, tmp93
	shrq	$3, %rax	;, tmp93
	movq	%rax, %rdx	; tmp93, _1
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	-8(%rbp), %rax	; bool_list, tmp94
	addq	%rdx, %rax	; _1, _2
	movzbl	(%rax), %eax	; *_2, _3
	movsbl	%al, %edx	; _3, _4
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	-16(%rbp), %rax	; index, tmp95
	andl	$7, %eax	;, _6
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%eax, %ecx	; _6, tmp100
	sarl	%cl, %edx	; tmp100, _4
	movl	%edx, %eax	; _4, _7
	andl	$1, %eax	;, _8
	testl	%eax, %eax	; _8
	setne	%al	;, _9
; src/helper.c:172: }
	popq	%rbp	;
	ret	
	.size	get_bool_list, .-get_bool_list
	.section	.rodata
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; out, out
	movq	%rsi, -32(%rbp)	; indent, indent
	movl	%edx, %eax	; is_last, tmp87
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
	movb	%al, -36(%rbp)	; tmp88, is_last
; src/helper.c:175:     set_bool_list(indent_has_next, indent, !is_last);
	cmpb	$0, -36(%rbp)	;, is_last
	sete	%al	;, _1
	movzbl	%al, %edx	; _1, _2
	movq	-32(%rbp), %rcx	; indent, tmp89
	movq	-48(%rbp), %rax	; indent_has_next, tmp90
	movq	%rcx, %rsi	; tmp89,
	movq	%rax, %rdi	; tmp90,
	call	set_bool_list	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movq	$1, -8(%rbp)	;, i
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	jmp	.L74	;
.L77:
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	-8(%rbp), %rdx	; i, tmp91
	movq	-48(%rbp), %rax	; indent_has_next, tmp92
	movq	%rdx, %rsi	; tmp91,
	movq	%rax, %rdi	; tmp92,
	call	get_bool_list	;
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	testb	%al, %al	; _3
	je	.L75	;,
	leaq	.LC6(%rip), %rax	;, iftmp.17_5
	jmp	.L76	;
.L75:
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC7(%rip), %rax	;, iftmp.17_5
.L76:
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	-24(%rbp), %rdx	; out, tmp93
	movq	%rax, %rsi	; iftmp.17_5,
	movq	%rdx, %rdi	; tmp93,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, -8(%rbp)	;, i
.L74:
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movq	-8(%rbp), %rax	; i, tmp94
	cmpq	-32(%rbp), %rax	; indent, tmp94
	jb	.L77	;,
; src/helper.c:178:     if (indent > 0)
	cmpq	$0, -32(%rbp)	;, indent
	je	.L81	;,
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, -36(%rbp)	;, is_last
	je	.L79	;,
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC8(%rip), %rax	;, iftmp.18_6
	jmp	.L80	;
.L79:
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC9(%rip), %rax	;, iftmp.18_6
.L80:
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	movq	-24(%rbp), %rdx	; out, tmp95
	movq	%rax, %rsi	; iftmp.18_6,
	movq	%rdx, %rdi	; tmp95,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L81:
; src/helper.c:180: }
	nop	
	leave	
	ret	
	.size	indention, .-indention
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; out, out
	movq	%rsi, -32(%rbp)	; indent, indent
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	movq	$0, -8(%rbp)	;, i
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	jmp	.L83	;
.L84:
; src/helper.c:184:         putc(' ', out);
	movq	-24(%rbp), %rax	; out, tmp83
	movq	%rax, %rsi	; tmp83,
	movl	$32, %edi	;,
	call	*putc@GOTPCREL(%rip)	;
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	addq	$1, -8(%rbp)	;, i
.L83:
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	movq	-32(%rbp), %rax	; indent, tmp84
	salq	$2, %rax	;, _1
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rax, -8(%rbp)	; _1, i
	jb	.L84	;,
; src/helper.c:185: }
	nop	
	nop	
	leave	
	ret	
	.size	indention_tac, .-indention_tac
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; file, file
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, new_parser
; src/helper.c:189:     new_parser->in_function = false;
	movq	-8(%rbp), %rax	; new_parser, tmp85
	movb	$0, 8(%rax)	;, new_parser_3->in_function
; src/helper.c:190:     new_parser->in_method = false;
	movq	-8(%rbp), %rax	; new_parser, tmp86
	movb	$0, 9(%rax)	;, new_parser_3->in_method
; src/helper.c:191:     new_parser->in_loop = false;
	movq	-8(%rbp), %rax	; new_parser, tmp87
	movb	$0, 11(%rax)	;, new_parser_3->in_loop
; src/helper.c:192:     new_parser->source_file = file;
	movq	-8(%rbp), %rax	; new_parser, tmp88
	movq	-24(%rbp), %rdx	; file, tmp89
	movq	%rdx, (%rax)	; tmp89, new_parser_3->source_file
; src/helper.c:193:     return new_parser;
	movq	-8(%rbp), %rax	; new_parser, _9
; src/helper.c:194: }
	leave	
	ret	
	.size	create_parser, .-create_parser
	.section	.rodata
.LC10:
	.string	""
.LC11:
	.string	"%s.tc"
.LC12:
	.string	"/home/su2u4/code/TC/std/"
.LC13:
	.string	"r"
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%r12	;
	pushq	%rbx	;
	subq	$96, %rsp	;,
	movq	%rdi, -88(%rbp)	; import_name, import_name
	movq	%rsi, -96(%rbp)	; source, source
	movq	%rdx, -104(%rbp)	; scope, scope
	movq	%rcx, -112(%rbp)	; source_file, source_file
; src/helper.c:197:     Symbol* name = NULL;
	movq	$0, -32(%rbp)	;, name
; src/helper.c:200:     if (source == NULL) {
	cmpq	$0, -96(%rbp)	;, source
	jne	.L88	;,
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	-88(%rbp), %rax	; import_name, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	addq	$4, %rax	;, _2
	movq	%rax, %rsi	; _2,
	leaq	.LC10(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*create_string_not_check@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp101, temp_import_name
; src/helper.c:203:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	-88(%rbp), %rdx	; import_name, tmp102
	movq	-40(%rbp), %rax	; temp_import_name, tmp103
	leaq	.LC11(%rip), %rcx	;, tmp104
	movq	%rcx, %rsi	; tmp104,
	movq	%rax, %rdi	; tmp103,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
; src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	movq	-40(%rbp), %rax	; temp_import_name, tmp105
	leaq	.LC12(%rip), %rdx	;, tmp106
	movq	%rdx, %rsi	; tmp106,
	movq	%rax, %rdi	; tmp105,
	call	*absolute_path@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp107, filename
	jmp	.L89	;
.L88:
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	-112(%rbp), %rax	; source_file, tmp108
	movq	%rax, %rdi	; tmp108,
	call	*get_file_dir@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _3
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	-96(%rbp), %rax	; source, tmp109
	movq	%rdx, %rsi	; _3,
	movq	%rax, %rdi	; tmp109,
	call	*absolute_path@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp110, filename
.L89:
; src/helper.c:207:     openfile = fopen(filename, "r");
	movq	-24(%rbp), %rax	; filename, tmp111
	leaq	.LC13(%rip), %rdx	;, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; tmp111,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp113, openfile
; src/helper.c:208:     if (openfile == NULL) {
	cmpq	$0, -48(%rbp)	;, openfile
	jne	.L90	;,
; src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.19_4
	movq	-24(%rbp), %rdx	; filename, tmp114
	leaq	.LC14(%rip), %rcx	;, tmp115
	movq	%rcx, %rsi	; tmp115,
	movq	%rax, %rdi	; stderr.19_4,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:210:         return NULL;
	movl	$0, %eax	;, _17
	jmp	.L95	;
.L90:
; src/helper.c:212:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.20_5
	movq	-24(%rbp), %rdx	; filename, tmp116
	leaq	.LC15(%rip), %rcx	;, tmp117
	movq	%rcx, %rsi	; tmp117,
	movq	%rax, %rdi	; stderr.20_5,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:213:     size_t length = 0;
	movq	$0, -72(%rbp)	;, length
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	-72(%rbp), %rdx	;, tmp118
	movq	-48(%rbp), %rax	; openfile, tmp119
	movq	%rdx, %rsi	; tmp118,
	movq	%rax, %rdi	; tmp119,
	call	*read_source@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp120, source_code
; src/helper.c:215:     fclose(openfile);
	movq	-48(%rbp), %rax	; openfile, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	-24(%rbp), %rax	; filename, tmp122
	movq	%rax, %rdi	; tmp122,
	call	*create_file@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rdi	; _6,
	call	create_parser	;
	movq	%rax, %r12	;, _7
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	builtin_scope(%rip), %rbx	; builtin_scope, builtin_scope.21_8
	movq	-72(%rbp), %rcx	; length, length.22_9
	movq	-24(%rbp), %rdx	; filename, tmp123
	movq	-56(%rbp), %rax	; source_code, tmp124
	movq	%rcx, %rsi	; length.22_9,
	movq	%rax, %rdi	; tmp124,
	call	*create_lexer@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%r12, %rdx	; _7,
	movq	%rbx, %rsi	; builtin_scope.21_8,
	movq	%rax, %rdi	; _10,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp125, code
; src/helper.c:217:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.23_11
	movq	-24(%rbp), %rdx	; filename, tmp126
	leaq	.LC16(%rip), %rcx	;, tmp127
	movq	%rcx, %rsi	; tmp127,
	movq	%rax, %rdi	; stderr.23_11,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:218:     if (code == NULL) {
	cmpq	$0, -64(%rbp)	;, code
	jne	.L92	;,
; src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.24_12
	movq	-24(%rbp), %rdx	; filename, tmp128
	leaq	.LC17(%rip), %rcx	;, tmp129
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; stderr.24_12,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:220:         return NULL;
	movl	$0, %eax	;, _17
	jmp	.L95	;
.L92:
; src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	-64(%rbp), %rax	; code, tmp130
	movq	8(%rax), %rax	; code_45->global_scope, _13
	movq	-88(%rbp), %rdx	; import_name, tmp131
	movq	%rdx, %rsi	; tmp131,
	movq	%rax, %rdi	; _13,
	call	search_name_use_strcmp	;
	movq	%rax, -32(%rbp)	; tmp132, name
; src/helper.c:223:     if (name != NULL)
	cmpq	$0, -32(%rbp)	;, name
	je	.L93	;,
; src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	-104(%rbp), %rax	; scope, tmp133
	movq	8(%rax), %rax	; scope_50(D)->symbols, _14
	movq	-32(%rbp), %rdx	; name, tmp134
	movq	%rdx, %rsi	; tmp134,
	movq	%rax, %rdi	; _14,
	call	list_append	;
	jmp	.L94	;
.L93:
; src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	stderr(%rip), %rax	; stderr, stderr.25_15
	movq	-24(%rbp), %rcx	; filename, tmp135
	movq	-88(%rbp), %rdx	; import_name, tmp136
	leaq	.LC18(%rip), %rsi	;, tmp137
	movq	%rax, %rdi	; stderr.25_15,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L94:
; src/helper.c:227:     return name;
	movq	-32(%rbp), %rax	; name, _17
.L95:
; src/helper.c:228: }
	addq	$96, %rsp	;,
	popq	%rbx	;
	popq	%r12	;
	popq	%rbp	;
	ret	
	.size	parse_import_file, .-parse_import_file
	.section	.rodata
.LC19:
	.string	"%s.%s"
	.text
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$40, %rsp	;,
	movq	%rdi, -40(%rbp)	; class_name, class_name
	movq	%rsi, -48(%rbp)	; method_name, method_name
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	-40(%rbp), %rax	; class_name, tmp88
	movq	%rax, %rdi	; tmp88,
	call	*strlen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	;, _1
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	-48(%rbp), %rax	; method_name, tmp89
	movq	%rax, %rdi	; tmp89,
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	addq	%rbx, %rax	; _1, _3
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	addq	$2, %rax	;, _4
	movq	%rax, %rsi	; _4,
	leaq	.LC10(%rip), %rax	;, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp91, name
; src/helper.c:232:     sprintf(name, "%s.%s", class_name, method_name);
	movq	-48(%rbp), %rcx	; method_name, tmp92
	movq	-40(%rbp), %rdx	; class_name, tmp93
	movq	-24(%rbp), %rax	; name, tmp94
	leaq	.LC19(%rip), %rsi	;, tmp95
	movq	%rax, %rdi	; tmp94,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
; src/helper.c:233:     return name;
	movq	-24(%rbp), %rax	; name, _11
; src/helper.c:234: }
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	make_method_name, .-make_method_name
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; str, str
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	ASSIGN_SYMBOL(%rip), %rdx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.26_1
	movq	-8(%rbp), %rax	; str, tmp122
	movq	%rdx, %rsi	; ASSIGN_SYMBOL.26_1,
	movq	%rax, %rdi	; tmp122,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%al, %al	; _2
	je	.L99	;,
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	;, _39
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	jmp	.L100	;
.L99:
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rdx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.27_3
	movq	-8(%rbp), %rax	; str, tmp123
	movq	%rdx, %rsi	; ADD_ASSIGN_SYMBOL.27_3,
	movq	%rax, %rdi	; tmp123,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%al, %al	; _4
	je	.L101	;,
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, _39
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	jmp	.L100	;
.L101:
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rdx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.28_5
	movq	-8(%rbp), %rax	; str, tmp124
	movq	%rdx, %rsi	; SUB_ASSIGN_SYMBOL.28_5,
	movq	%rax, %rdi	; tmp124,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%al, %al	; _6
	je	.L102	;,
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, _39
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	jmp	.L100	;
.L102:
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rdx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.29_7
	movq	-8(%rbp), %rax	; str, tmp125
	movq	%rdx, %rsi	; MUL_ASSIGN_SYMBOL.29_7,
	movq	%rax, %rdi	; tmp125,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%al, %al	; _8
	je	.L103	;,
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, _39
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	jmp	.L100	;
.L103:
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rdx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.30_9
	movq	-8(%rbp), %rax	; str, tmp126
	movq	%rdx, %rsi	; DIV_ASSIGN_SYMBOL.30_9,
	movq	%rax, %rdi	; tmp126,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%al, %al	; _10
	je	.L104	;,
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, _39
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	jmp	.L100	;
.L104:
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rdx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.31_11
	movq	-8(%rbp), %rax	; str, tmp127
	movq	%rdx, %rsi	; MOD_ASSIGN_SYMBOL.31_11,
	movq	%rax, %rdi	; tmp127,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%al, %al	; _12
	je	.L105	;,
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, _39
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	jmp	.L100	;
.L105:
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rdx	; AND_SYMBOL, AND_SYMBOL.32_13
	movq	-8(%rbp), %rax	; str, tmp128
	movq	%rdx, %rsi	; AND_SYMBOL.32_13,
	movq	%rax, %rdi	; tmp128,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%al, %al	; _14
	je	.L106	;,
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, _39
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	jmp	.L100	;
.L106:
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rdx	; OR_SYMBOL, OR_SYMBOL.33_15
	movq	-8(%rbp), %rax	; str, tmp129
	movq	%rdx, %rsi	; OR_SYMBOL.33_15,
	movq	%rax, %rdi	; tmp129,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%al, %al	; _16
	je	.L107	;,
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, _39
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	jmp	.L100	;
.L107:
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rdx	; EQ_SYMBOL, EQ_SYMBOL.34_17
	movq	-8(%rbp), %rax	; str, tmp130
	movq	%rdx, %rsi	; EQ_SYMBOL.34_17,
	movq	%rax, %rdi	; tmp130,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%al, %al	; _18
	je	.L108	;,
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, _39
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	jmp	.L100	;
.L108:
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rdx	; NE_SYMBOL, NE_SYMBOL.35_19
	movq	-8(%rbp), %rax	; str, tmp131
	movq	%rdx, %rsi	; NE_SYMBOL.35_19,
	movq	%rax, %rdi	; tmp131,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%al, %al	; _20
	je	.L109	;,
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, _39
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	jmp	.L100	;
.L109:
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rdx	; LT_SYMBOL, LT_SYMBOL.36_21
	movq	-8(%rbp), %rax	; str, tmp132
	movq	%rdx, %rsi	; LT_SYMBOL.36_21,
	movq	%rax, %rdi	; tmp132,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%al, %al	; _22
	je	.L110	;,
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, _39
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	jmp	.L100	;
.L110:
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rdx	; GT_SYMBOL, GT_SYMBOL.37_23
	movq	-8(%rbp), %rax	; str, tmp133
	movq	%rdx, %rsi	; GT_SYMBOL.37_23,
	movq	%rax, %rdi	; tmp133,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%al, %al	; _24
	je	.L111	;,
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, _39
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	jmp	.L100	;
.L111:
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rdx	; LE_SYMBOL, LE_SYMBOL.38_25
	movq	-8(%rbp), %rax	; str, tmp134
	movq	%rdx, %rsi	; LE_SYMBOL.38_25,
	movq	%rax, %rdi	; tmp134,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%al, %al	; _26
	je	.L112	;,
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, _39
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	jmp	.L100	;
.L112:
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rdx	; GE_SYMBOL, GE_SYMBOL.39_27
	movq	-8(%rbp), %rax	; str, tmp135
	movq	%rdx, %rsi	; GE_SYMBOL.39_27,
	movq	%rax, %rdi	; tmp135,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%al, %al	; _28
	je	.L113	;,
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, _39
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	jmp	.L100	;
.L113:
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rdx	; ADD_SYMBOL, ADD_SYMBOL.40_29
	movq	-8(%rbp), %rax	; str, tmp136
	movq	%rdx, %rsi	; ADD_SYMBOL.40_29,
	movq	%rax, %rdi	; tmp136,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%al, %al	; _30
	je	.L114	;,
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	;, _39
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	jmp	.L100	;
.L114:
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rdx	; SUB_SYMBOL, SUB_SYMBOL.41_31
	movq	-8(%rbp), %rax	; str, tmp137
	movq	%rdx, %rsi	; SUB_SYMBOL.41_31,
	movq	%rax, %rdi	; tmp137,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%al, %al	; _32
	je	.L115	;,
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, _39
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	jmp	.L100	;
.L115:
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rdx	; MUL_SYMBOL, MUL_SYMBOL.42_33
	movq	-8(%rbp), %rax	; str, tmp138
	movq	%rdx, %rsi	; MUL_SYMBOL.42_33,
	movq	%rax, %rdi	; tmp138,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	; _34
	je	.L116	;,
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, _39
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	jmp	.L100	;
.L116:
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rdx	; DIV_SYMBOL, DIV_SYMBOL.43_35
	movq	-8(%rbp), %rax	; str, tmp139
	movq	%rdx, %rsi	; DIV_SYMBOL.43_35,
	movq	%rax, %rdi	; tmp139,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	; _36
	je	.L117	;,
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, _39
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	jmp	.L100	;
.L117:
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rdx	; MOD_SYMBOL, MOD_SYMBOL.44_37
	movq	-8(%rbp), %rax	; str, tmp140
	movq	%rdx, %rsi	; MOD_SYMBOL.44_37,
	movq	%rax, %rdi	; tmp140,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	testb	%al, %al	; _38
	je	.L118	;,
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movl	$4, %eax	;, _39
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	jmp	.L100	;
.L118:
; src/helper.c:257:     else return OP_NONE;
	movl	$19, %eax	;, _39
.L100:
; src/helper.c:258: }
	leave	
	ret	
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; src/helper.c:261:     switch (op) {
	cmpl	$18, -4(%rbp)	;, op
	ja	.L120	;,
	movl	-4(%rbp), %eax	; op, tmp84
	leaq	0(,%rax,4), %rdx	;, tmp85
	leaq	.L122(%rip), %rax	;, tmp86
	movl	(%rdx,%rax), %eax	;, tmp87
	cltq
	leaq	.L122(%rip), %rdx	;, tmp90
	addq	%rdx, %rax	; tmp90, tmp89
	jmp	*%rax	; tmp89
	.section	.rodata
	.align 4
	.align 4
.L122:
	.long	.L126-.L122
	.long	.L126-.L122
	.long	.L125-.L122
	.long	.L125-.L122
	.long	.L125-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L123-.L122
	.long	.L123-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.text
.L121:
; src/helper.c:268:             return 1;
	movl	$1, %eax	;, _1
	jmp	.L127	;
.L123:
; src/helper.c:271:             return 2;
	movl	$2, %eax	;, _1
	jmp	.L127	;
.L124:
; src/helper.c:278:             return 3;
	movl	$3, %eax	;, _1
	jmp	.L127	;
.L126:
; src/helper.c:281:             return 4;
	movl	$4, %eax	;, _1
	jmp	.L127	;
.L125:
; src/helper.c:285:             return 5;
	movl	$5, %eax	;, _1
	jmp	.L127	;
.L120:
; src/helper.c:288:             return 0;
	movl	$0, %eax	;, _1
.L127:
; src/helper.c:290: }
	popq	%rbp	;
	ret	
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; src/helper.c:293:     switch (op) {
	cmpl	$18, -4(%rbp)	;, op
	ja	.L129	;,
	movl	-4(%rbp), %eax	; op, tmp84
	leaq	0(,%rax,4), %rdx	;, tmp85
	leaq	.L131(%rip), %rax	;, tmp86
	movl	(%rdx,%rax), %eax	;, tmp87
	cltq
	leaq	.L131(%rip), %rdx	;, tmp90
	addq	%rdx, %rax	; tmp90, tmp89
	jmp	*%rax	; tmp89
	.section	.rodata
	.align 4
	.align 4
.L131:
	.long	.L149-.L131
	.long	.L148-.L131
	.long	.L147-.L131
	.long	.L146-.L131
	.long	.L145-.L131
	.long	.L144-.L131
	.long	.L143-.L131
	.long	.L142-.L131
	.long	.L141-.L131
	.long	.L140-.L131
	.long	.L139-.L131
	.long	.L138-.L131
	.long	.L137-.L131
	.long	.L136-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L130-.L131
	.text
.L136:
; src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, _1
	jmp	.L150	;
.L135:
; src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, _1
	jmp	.L150	;
.L134:
; src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, _1
	jmp	.L150	;
.L133:
; src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, _1
	jmp	.L150	;
.L132:
; src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, _1
	jmp	.L150	;
.L130:
; src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, _1
	jmp	.L150	;
.L138:
; src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, _1
	jmp	.L150	;
.L137:
; src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, _1
	jmp	.L150	;
.L144:
; src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, _1
	jmp	.L150	;
.L143:
; src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, _1
	jmp	.L150	;
.L142:
; src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, _1
	jmp	.L150	;
.L141:
; src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, _1
	jmp	.L150	;
.L140:
; src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, _1
	jmp	.L150	;
.L139:
; src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, _1
	jmp	.L150	;
.L149:
; src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, _1
	jmp	.L150	;
.L148:
; src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, _1
	jmp	.L150	;
.L147:
; src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, _1
	jmp	.L150	;
.L146:
; src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, _1
	jmp	.L150	;
.L145:
; src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, _1
	jmp	.L150	;
.L129:
; src/helper.c:314:         default: return NULL;
	movl	$0, %eax	;, _1
.L150:
; src/helper.c:316: }
	popq	%rbp	;
	ret	
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
