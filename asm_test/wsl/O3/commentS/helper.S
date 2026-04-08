	.file	"helper.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.p2align 4
	.globl	create_list
	.type	create_list, @function
create_list:
	subq	$8, %rsp	;,
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:9:     new_list->head = NULL;
	pxor	%xmm0, %xmm0	; tmp83
	movups	%xmm0, (%rax)	; tmp83, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_3]
; src/helper.c:12: }
	addq	$8, %rsp	;,
	ret	
	.size	create_list, .-create_list
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.p2align 4
	.globl	list_append
	.type	list_append, @function
list_append:
; src/helper.c:22:     if (list == NULL) {
	testq	%rdi, %rdi	; list
	je	.L10	;,
; src/helper.c:21: void list_append(list() list, pointer item) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp95, item
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp94, list
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
; src/helper.c:21: void list_append(list() list, pointer item) {
	subq	$8, %rsp	;,
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	;, list_3(D)->head
; src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	;, new_node_11->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbp, 8(%rax)	; item, new_node_11->content
; src/helper.c:27:     if (list->head == NULL) {
	je	.L11	;,
; src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; list_3(D)->tail, list_3(D)->tail
	movq	%rax, (%rdx)	; new_node, _2->next
; src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_3(D)->tail
; src/helper.c:34: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L11:
; src/helper.c:28:         list->head = new_node;
	movq	%rax, %xmm0	; new_node, tmp92
	punpcklqdq	%xmm0, %xmm0	; tmp92
	movups	%xmm0, (%rbx)	; tmp92, MEM <vector(2) long unsigned int> [(struct Node * *)list_3(D)]
; src/helper.c:34: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp91
	jmp	*fwrite@GOTPCREL(%rip)	;
	.size	list_append, .-list_append
	.p2align 4
	.globl	list_copy
	.type	list_copy, @function
list_copy:
; src/helper.c:37:     if (original == NULL)
	testq	%rdi, %rdi	; original
	je	.L14	;,
; src/helper.c:36: list() list_copy(list() original) {
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp88, original
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:9:     new_list->head = NULL;
	pxor	%xmm0, %xmm0	; tmp85
	movups	%xmm0, (%rax)	; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_9]
; src/helper.c:40:     new_list->head = original->head;
	movdqu	(%rbx), %xmm1	; MEM <vector(2) long unsigned int> [(struct Node * *)original_5(D)], tmp91
	movups	%xmm1, (%rax)	; tmp91, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_9]
; src/helper.c:43: }
	popq	%rbx	;
	ret	
	.p2align 4,,10
	.p2align 3
.L14:
; src/helper.c:38:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/helper.c:43: }
	ret	
	.size	list_copy, .-list_copy
	.p2align 4
	.globl	list_pop
	.type	list_pop, @function
list_pop:
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rdi, %rdi	; list
	je	.L22	;,
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rdi), %rax	; list_6(D)->head, <retval>
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; <retval>
	je	.L19	;,
; src/helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	; _1->next, _2
; src/helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rdi)	; _2, list_6(D)->head
; src/helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	; _2
	je	.L26	;,
; src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L22:
; src/helper.c:47:         return NULL;
	xorl	%eax, %eax	; <retval>
.L19:
; src/helper.c:53: }
	ret	
	.p2align 4,,10
	.p2align 3
.L26:
; src/helper.c:51:         list->tail = NULL;
	movq	$0, 8(%rdi)	;, list_6(D)->tail
; src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
	ret	
	.size	list_pop, .-list_pop
	.p2align 4
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rdi, %rdi	; list
	je	.L30	;,
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rdi), %rax	; list_8(D)->head, <retval>
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; <retval>
	je	.L27	;,
; src/helper.c:58:     if (list->head == list->tail) {
	movq	8(%rdi), %rdx	; list_8(D)->tail, _3
; src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%rdx, %rax	; _3, <retval>
	je	.L36	;,
	.p2align 4,,10
	.p2align 3
.L29:
	movq	%rax, %rcx	; <retval>, current
; src/helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	; current_5->next, <retval>
; src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	; <retval>, _3
	jne	.L29	;,
; src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	; _3->content, <retval>
; src/helper.c:68:     current->next = NULL;
	movq	$0, (%rcx)	;, current_16->next
; src/helper.c:69:     list->tail = current;
	movq	%rcx, 8(%rdi)	; current, list_8(D)->tail
; src/helper.c:70:     return content;
	ret	
	.p2align 4,,10
	.p2align 3
.L30:
; src/helper.c:57:         return NULL;
	xorl	%eax, %eax	; <retval>
.L27:
; src/helper.c:71: }
	ret	
	.p2align 4,,10
	.p2align 3
.L36:
; src/helper.c:60:         list->head = NULL;
	pxor	%xmm0, %xmm0	; tmp86
; src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	; _1->content, <retval>
; src/helper.c:60:         list->head = NULL;
	movups	%xmm0, (%rdi)	; tmp86, MEM <vector(2) long unsigned int> [(struct Node * *)list_8(D)]
; src/helper.c:62:         return content;
	ret	
	.size	list_pop_back, .-list_pop_back
	.p2align 4
	.globl	list_is_empty
	.type	list_is_empty, @function
list_is_empty:
	movl	$1, %eax	;, <retval>
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rdi, %rdi	; list
	je	.L37	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, (%rdi)	;, list_4(D)->head
	je	.L37	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, 8(%rdi)	;, list_4(D)->tail
	sete	%al	;, <retval>
.L37:
; src/helper.c:75: }
	ret	
	.size	list_is_empty, .-list_is_empty
	.section	.rodata.str1.8
	.align 8
.LC1:
	.string	"[Warning] Creating symbol with unknown SymbolType: %u\n"
	.align 8
.LC2:
	.string	"[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n"
	.align 8
.LC3:
	.string	"[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n"
	.align 8
.LC4:
	.string	"[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n"
	.text
	.p2align 4
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movl	%esi, %ebp	; tmp145, kind
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp144, name
	subq	$24, %rsp	;,
; src/helper.c:78: Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node) {
	movq	%rdx, 8(%rsp)	; tmp146, %sfp
	movq	%rcx, (%rsp)	; tmp147, %sfp
; src/helper.c:81:     switch (kind) {
	cmpl	$2, %esi	;, kind
	je	.L43	;,
	ja	.L44	;,
	testl	%esi, %esi	; kind
	je	.L77	;,
.L43:
; src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	32(%rcx), %rax	;, MEM[(struct Method *)ast_node_22(D)].method_scope
	movq	(%rax), %r15	;* MEM[(struct Method *)ast_node_22(D)].method_scope, scope
.L48:
; src/helper.c:143:     while (scope != NULL) {
	testq	%r15, %r15	; scope
	je	.L50	;,
	movq	%r15, %r12	; scope, scope
.L54:
; src/helper.c:145:         Node* current = names->head;
	movq	8(%r12), %rax	; scope_42->symbols, scope_42->symbols
	movq	(%rax), %r13	; names_48->head, current
; src/helper.c:146:         while (current != NULL) {
	testq	%r13, %r13	; current
	jne	.L53	;,
	jmp	.L51	;
	.p2align 4,,10
	.p2align 3
.L78:
; src/helper.c:150:             current = current->next;
	movq	0(%r13), %r13	; current_28->next, current
; src/helper.c:146:         while (current != NULL) {
	testq	%r13, %r13	; current
	je	.L51	;,
.L53:
; src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%r13), %r14	; current_28->content, current_name
; src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	%rbx, %rsi	; name,
	movq	8(%r14), %rdi	; current_name_51->name, current_name_51->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp149
	je	.L78	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	movq	16(%r14), %r9	; current_name_51->id, current_name_51->id
	movl	32(%r14), %r8d	; current_name_51->kind, current_name_51->kind
	movq	%rbx, %rcx	; name,
; src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	; id_counter, tmp165
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC4(%rip), %rdx	;, tmp143
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
; src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	addq	$1, %rax	;, tmp141
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rax	; tmp141
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	popq	%rax	;
	popq	%rdx	;
.L50:
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:97:     new_name->name = name;
	movq	%rbx, 8(%rax)	; name, new_name_31->name
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %r12	; tmp150, <retval>
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp158
; src/helper.c:99:     new_name->kind = kind;
	movl	%ebp, 32(%r12)	; kind, new_name_31->kind
; src/helper.c:98:     new_name->id = ++id_counter;
	addq	$1, %rax	;, _11
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	%rax, 16(%r12)	; _11, new_name_31->id
; src/helper.c:100:     new_name->type = type;
	movq	8(%rsp), %rax	; %sfp, type
	movq	%rax, (%r12)	; type, new_name_31->type
; src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	(%rsp), %rax	; %sfp, ast_node
	movq	%rax, 24(%r12)	; ast_node,
; src/helper.c:113:     if (scope == NULL)
	testq	%r15, %r15	; scope
	je	.L74	;,
; src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%r15), %rbx	; scope_96->symbols, _15
; src/helper.c:22:     if (list == NULL) {
	testq	%rbx, %rbx	; _15
	je	.L79	;,
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	;, _15->head
; src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	;, new_node_58->next
; src/helper.c:17:     new_node->content = content;
	movq	%r12, 8(%rax)	; <retval>, new_node_58->content
; src/helper.c:27:     if (list->head == NULL) {
	je	.L80	;,
; src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; _15->tail, _15->tail
	movq	%rax, (%rdx)	; new_node, _60->next
; src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, _15->tail
.L42:
; src/helper.c:118: }
	addq	$24, %rsp	;,
	movq	%r12, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L44:
; src/helper.c:81:     switch (kind) {
	leal	-3(%rsi), %eax	;, tmp118
	movq	%rcx, %r15	; tmp147, scope
	cmpl	$3, %eax	;, tmp118
	jbe	.L48	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%esi, %ecx	; kind,
	leaq	.LC1(%rip), %rdx	;, tmp123
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	%ebp, %ecx	; kind,
	leaq	.LC2(%rip), %rdx	;, tmp126
; src/helper.c:97:     new_name->name = name;
	movq	%rbx, 8(%rax)	; name, new_name_57->name
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %r12	; tmp148, <retval>
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp156
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/helper.c:99:     new_name->kind = kind;
	movl	%ebp, 32(%r12)	; kind, new_name_57->kind
; src/helper.c:98:     new_name->id = ++id_counter;
	addq	$1, %rax	;, _29
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _29, id_counter
	movq	%rax, 16(%r12)	; _29, new_name_57->id
; src/helper.c:100:     new_name->type = type;
	movq	8(%rsp), %rax	; %sfp, type
	movq	%rax, (%r12)	; type, new_name_57->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L74:
	movq	16(%r12), %r9	; new_name_93->id,
	movl	%ebp, %r8d	; kind,
	movq	%rbx, %rcx	; name,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC3(%rip), %rdx	;, tmp132
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L42	;
	.p2align 4,,10
	.p2align 3
.L51:
; src/helper.c:152:         scope = scope->parent;
	movq	(%r12), %r12	; scope_42->parent, scope
; src/helper.c:143:     while (scope != NULL) {
	testq	%r12, %r12	; scope
	jne	.L54	;,
	jmp	.L50	;
	.p2align 4,,10
	.p2align 3
.L77:
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%rcx), %rax	; MEM[(struct Class *)ast_node_22(D)].class_scope, MEM[(struct Class *)ast_node_22(D)].class_scope
	movq	(%rax), %r15	;* MEM[(struct Class *)ast_node_22(D)].class_scope, scope
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	jmp	.L48	;
	.p2align 4,,10
	.p2align 3
.L80:
; src/helper.c:28:         list->head = new_node;
	movq	%rax, %xmm0	; new_node, tmp135
	punpcklqdq	%xmm0, %xmm0	; tmp135
	movups	%xmm0, (%rbx)	; tmp135, MEM <vector(2) long unsigned int> [(struct Node * *)_15]
	jmp	.L42	;
.L79:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp134
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L42	;
	.size	create_symbol, .-create_symbol
	.p2align 4
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp87, parent
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %edi	;,
; src/helper.c:120: SymbolTable* create_symbol_table(SymbolTable* parent) {
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movq	%rax, %rbx	; tmp88, <retval>
; src/helper.c:122:     new_scope->parent = parent;
	movq	%rbp, (%rax)	; parent, new_scope_3->parent
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:9:     new_list->head = NULL;
	pxor	%xmm0, %xmm0	; tmp85
	movups	%xmm0, (%rax)	; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
; src/helper.c:123:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	; new_list, new_scope_3->symbols
; src/helper.c:125: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_symbol_table, .-create_symbol_table
	.p2align 4
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/helper.c:128:     while (scope != NULL) {
	testq	%rdi, %rdi	; scope
	je	.L88	;,
	movq	%rdi, %r13	; tmp93, scope
	movq	%rsi, %r12	; tmp94, name
.L87:
; src/helper.c:130:         Node* current = names->head;
	movq	8(%r13), %rax	; scope_16->symbols, scope_16->symbols
	movq	(%rax), %rbx	; names_9->head, current
; src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L86	;,
	jmp	.L85	;
	.p2align 4,,10
	.p2align 3
.L98:
; src/helper.c:135:             current = current->next;
	movq	(%rbx), %rbx	; current_17->next, current
; src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L85	;,
.L86:
; src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rbp	; current_17->content, <retval>
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	%r12, %rsi	; name,
	movq	8(%rbp), %rdi	; current_name_12->name, current_name_12->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	; tmp95
	jne	.L98	;,
; src/helper.c:140: }
	addq	$8, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L85:
; src/helper.c:137:         scope = scope->parent;
	movq	0(%r13), %r13	; scope_16->parent, scope
; src/helper.c:128:     while (scope != NULL) {
	testq	%r13, %r13	; scope
	jne	.L87	;,
.L88:
; src/helper.c:140: }
	addq	$8, %rsp	;,
; src/helper.c:139:     return NULL;
	xorl	%ebp, %ebp	; <retval>
; src/helper.c:140: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search_name_use_strcmp, .-search_name_use_strcmp
	.p2align 4
	.globl	search_name
	.type	search_name, @function
search_name:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/helper.c:143:     while (scope != NULL) {
	testq	%rdi, %rdi	; scope
	je	.L100	;,
	movq	%rdi, %r13	; tmp92, scope
	movq	%rsi, %r12	; tmp93, name
.L104:
; src/helper.c:145:         Node* current = names->head;
	movq	8(%r13), %rax	; scope_22->symbols, scope_22->symbols
	movq	(%rax), %rbx	; names_11->head, current
; src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L103	;,
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L114:
; src/helper.c:150:             current = current->next;
	movq	(%rbx), %rbx	; current_23->next, current
; src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L101	;,
.L103:
; src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rbp	; current_23->content, <retval>
; src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	%r12, %rsi	; name,
	movq	8(%rbp), %rdi	; current_name_14->name, current_name_14->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp94
	je	.L114	;,
; src/helper.c:155: }
	addq	$8, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L101:
; src/helper.c:152:         scope = scope->parent;
	movq	0(%r13), %r13	; scope_22->parent, scope
; src/helper.c:143:     while (scope != NULL) {
	testq	%r13, %r13	; scope
	jne	.L104	;,
.L100:
; src/helper.c:155: }
	addq	$8, %rsp	;,
; src/helper.c:154:     return NULL;
	xorl	%ebp, %ebp	; <retval>
; src/helper.c:155: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search_name, .-search_name
	.p2align 4
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rsi	; INT_KEYWORD,
; src/helper.c:157: inline bool is_builtin_type(string type) {
	movq	%rdi, %rbx	; tmp102, type
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp103
	je	.L116	;,
.L118:
; src/helper.c:157: inline bool is_builtin_type(string type) {
	movl	$1, %eax	;, <retval>
; src/helper.c:159: }
	popq	%rbx	;
	ret	
	.p2align 4,,10
	.p2align 3
.L116:
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rsi	; FLOAT_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp104
	jne	.L118	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rsi	; STRING_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp105
	jne	.L118	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rsi	; BOOL_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp106
	jne	.L118	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	%rbx, %rdi	; type,
	movq	VOID_KEYWORD(%rip), %rsi	; VOID_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:159: }
	popq	%rbx	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp107
	setne	%al	;, <retval>
; src/helper.c:159: }
	ret	
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[Parser Error] at %s:%zu:%zu: %s\n"
	.text
	.p2align 4
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$16, %rsp	;,
; src/helper.c:161: inline void parser_error(const string message, Token* token, string file_name) {
	movq	%rdx, %rcx	; tmp98, file_name
; src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	8(%rsi), %rax	; token_7(D)->line, token_7(D)->line
	movq	16(%rsi), %rdx	; token_7(D)->column, token_7(D)->column
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rdi	; tmp96
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	1(%rdx), %r9	;,
	leaq	1(%rax), %r8	;,
	xorl	%eax, %eax	;
	leaq	.LC5(%rip), %rdx	;, tmp95
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:163: }
	addq	$24, %rsp	;,
	ret	
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC6:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC7:
	.string	"\342\224\234\342\224\200\342\224\200 "
.LC8:
	.string	"\342\224\202   "
.LC9:
	.string	"    "
	.text
	.p2align 4
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15	;
; src/helper.c:166:     char word = bool_list[index / 8];
	movq	%rsi, %rax	; indent, tmp107
; src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%r14	;
; src/helper.c:166:     char word = bool_list[index / 8];
	shrq	$3, %rax	;, tmp107
; src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp123, out
	movl	%edx, %edi	; tmp125, is_last
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp126, indent_has_next
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp124, indent
	subq	$24, %rsp	;,
; src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	movl	%edx, 12(%rsp)	; is_last, %sfp
; src/helper.c:166:     char word = bool_list[index / 8];
	movq	%rax, %rdx	; tmp107, tmp107
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %eax	;, tmp110
; src/helper.c:166:     char word = bool_list[index / 8];
	addq	%rcx, %rdx	; indent_has_next, _13
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	%ebx, %ecx	; indent, tmp108
	andl	$7, %ecx	;, tmp108
; src/helper.c:166:     char word = bool_list[index / 8];
	movzbl	(%rdx), %esi	; *_13, word
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	sall	%cl, %eax	; tmp108, tmp109
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	testb	%dil, %dil	; is_last
	jne	.L123	;,
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orl	%eax, %esi	; tmp109, tmp111
	movb	%sil, (%rdx)	; tmp111, *_13
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rbx	;, indent
	jbe	.L135	;,
.L124:
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %r15d	;, i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC9(%rip), %r14	;, tmp121
	leaq	.LC8(%rip), %r13	;, tmp122
	.p2align 4,,10
	.p2align 3
.L128:
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%r15, %rax	; i, tmp114
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; out,
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	shrq	$3, %rax	;, tmp114
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	0(%rbp,%rax), %edx	; *_28, *_28
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%r15d, %eax	; i, tmp116
	andl	$7, %eax	;, tmp116
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	btl	%eax, %edx	; tmp116, *_28
	jnc	.L130	;,
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %r15	;, i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	movq	%r13, %rdi	; tmp122,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%r15, %rbx	; i, indent
	jne	.L128	;,
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 12(%rsp)	;, %sfp
	je	.L125	;,
	.p2align 4,,10
	.p2align 3
.L129:
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC6(%rip), %rdx	;, iftmp.17_3
.L133:
; src/helper.c:180: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdi	; out,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/helper.c:180: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L130:
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %r15	;, i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	movq	%r14, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%r15, %rbx	; i, indent
	jne	.L128	;,
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 12(%rsp)	;, %sfp
	jne	.L129	;,
.L125:
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC7(%rip), %rdx	;, iftmp.17_3
	jmp	.L133	;
	.p2align 4,,10
	.p2align 3
.L123:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%eax	; tmp112
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andl	%esi, %eax	; word, tmp113
	movb	%al, (%rdx)	; tmp113, *_13
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rbx	;, indent
	ja	.L124	;,
; src/helper.c:178:     if (indent > 0)
	testq	%rbx, %rbx	; indent
	jne	.L129	;,
.L122:
; src/helper.c:180: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L135:
; src/helper.c:178:     if (indent > 0)
	testq	%rbx, %rbx	; indent
	je	.L122	;,
	jmp	.L125	;
	.size	indention, .-indention
	.p2align 4
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	salq	$2, %rsi	;, tmp87
	je	.L144	;,
; src/helper.c:182: void indention_tac(FILE* out, size_t indent) {
	pushq	%r12	;
	movq	%rdi, %r12	; tmp86, out
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp87, _11
	pushq	%rbx	;
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	xorl	%ebx, %ebx	; i
	.p2align 4,,10
	.p2align 3
.L138:
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	addq	$1, %rbx	;, i
; src/helper.c:184:         putc(' ', out);
	movq	%r12, %rsi	; out,
	movl	$32, %edi	;,
	call	*putc@GOTPCREL(%rip)	;
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rbp, %rbx	; _11, i
	jne	.L138	;,
; src/helper.c:185: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L144:
	ret	
	.size	indention_tac, .-indention_tac
	.p2align 4
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbx	;
; src/helper.c:187: Parser* create_parser(File* file) {
	movq	%rdi, %rbx	; tmp86, file
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:189:     new_parser->in_function = false;
	xorl	%edx, %edx	;
	movw	%dx, 8(%rax)	;, MEM <vector(2) char> [(char *)new_parser_3 + 8B]
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
	.p2align 4
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15	;
	movq	%rdx, %r15	; tmp149, scope
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp147, import_name
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/helper.c:200:     if (source == NULL) {
	testq	%rsi, %rsi	; source
	je	.L175	;,
	movq	%rsi, %rbx	; tmp148, source
	movq	%rcx, %rdi	; tmp150, source_file
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	*get_file_dir@GOTPCREL(%rip)	;
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rdi	; source,
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rsi	; tmp154, _3
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	*absolute_path@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp155, filename
.L151:
; src/helper.c:207:     openfile = fopen(filename, "r");
	leaq	.LC13(%rip), %rsi	;, tmp124
	movq	%r13, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r13, %rcx	; filename,
; src/helper.c:207:     openfile = fopen(filename, "r");
	movq	%rax, %rbx	; tmp156, tmp125
; src/helper.c:208:     if (openfile == NULL) {
	testq	%rax, %rax	; tmp125
	je	.L176	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC15(%rip), %rdx	;, tmp129
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	8(%rsp), %rsi	;, tmp130
	movq	%rbx, %rdi	; tmp125,
; src/helper.c:213:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	call	*read_source@GOTPCREL(%rip)	;
; src/helper.c:215:     fclose(openfile);
	movq	%rbx, %rdi	; tmp125,
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	movq	%rax, %rbp	; tmp157, source_code
; src/helper.c:215:     fclose(openfile);
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%r13, %rdi	; filename,
	call	*create_file@GOTPCREL(%rip)	;
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %edi	;,
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %r14	; tmp158, _6
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	8(%rsp), %rsi	; length,
	movq	%r13, %rdx	; filename,
	movq	%rbp, %rdi	; source_code,
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movq	%rax, %rbx	; tmp159, new_parser
; src/helper.c:189:     new_parser->in_function = false;
	xorl	%eax, %eax	;
; src/helper.c:192:     new_parser->source_file = file;
	movq	%r14, (%rbx)	; _6, new_parser_47->source_file
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	builtin_scope(%rip), %r14	; builtin_scope, builtin_scope.21_7
; src/helper.c:189:     new_parser->in_function = false;
	movw	%ax, 8(%rbx)	;, MEM <vector(2) char> [(char *)new_parser_47 + 8B]
; src/helper.c:191:     new_parser->in_loop = false;
	movb	$0, 11(%rbx)	;, new_parser_47->in_loop
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	call	*create_lexer@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %rdx	; new_parser,
	movq	%r14, %rsi	; builtin_scope.21_7,
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rdi	; tmp160, _9
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	call	*parse_code@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r13, %rcx	; filename,
	leaq	.LC16(%rip), %rdx	;, tmp134
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rbx	; tmp161, code
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:218:     if (code == NULL) {
	testq	%rbx, %rbx	; code
	je	.L177	;,
; src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%rbx), %r14	; code_41->global_scope, scope
; src/helper.c:128:     while (scope != NULL) {
	testq	%r14, %r14	; scope
	je	.L156	;,
.L160:
; src/helper.c:130:         Node* current = names->head;
	movq	8(%r14), %rax	; scope_74->symbols, scope_74->symbols
	movq	(%rax), %rbx	; names_60->head, current
; src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L159	;,
	jmp	.L157	;
	.p2align 4,,10
	.p2align 3
.L178:
; src/helper.c:135:             current = current->next;
	movq	(%rbx), %rbx	; current_20->next, current
; src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L157	;,
.L159:
; src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rbp	; current_20->content, <retval>
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	%r12, %rsi	; import_name,
	movq	8(%rbp), %rdi	; current_name_63->name, current_name_63->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	; tmp162
	jne	.L178	;,
; src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	8(%r15), %rbx	; scope_44(D)->symbols, _13
; src/helper.c:22:     if (list == NULL) {
	testq	%rbx, %rbx	; _13
	je	.L179	;,
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	;, _13->head
; src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	;, new_node_70->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbp, 8(%rax)	; <retval>, new_node_70->content
; src/helper.c:27:     if (list->head == NULL) {
	je	.L180	;,
; src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; _13->tail, _13->tail
	movq	%rax, (%rdx)	; new_node, _72->next
; src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, _13->tail
.L149:
; src/helper.c:228: }
	addq	$24, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L157:
; src/helper.c:137:         scope = scope->parent;
	movq	(%r14), %r14	; scope_74->parent, scope
; src/helper.c:128:     while (scope != NULL) {
	testq	%r14, %r14	; scope
	jne	.L160	;,
.L156:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r13, %r8	; filename,
	movq	%r12, %rcx	; import_name,
	xorl	%eax, %eax	;
	leaq	.LC18(%rip), %rdx	;, tmp145
	movl	$2, %esi	;,
; src/helper.c:210:         return NULL;
	xorl	%ebp, %ebp	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L149	;
	.p2align 4,,10
	.p2align 3
.L175:
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	.LC10(%rip), %rdi	;, tmp121
	leaq	4(%rax), %rsi	;, tmp120
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r8	; import_name,
	movl	$2, %esi	;,
	leaq	.LC11(%rip), %rcx	;, tmp122
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	%rax, %rbx	; tmp152, temp_import_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; temp_import_name,
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC12(%rip), %rsi	;, tmp123
	movq	%rbx, %rdi	; temp_import_name,
	call	*absolute_path@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp153, filename
	jmp	.L151	;
	.p2align 4,,10
	.p2align 3
.L180:
; src/helper.c:28:         list->head = new_node;
	movq	%rax, %xmm0	; new_node, tmp142
	punpcklqdq	%xmm0, %xmm0	; tmp142
	movups	%xmm0, (%rbx)	; tmp142, MEM <vector(2) long unsigned int> [(struct Node * *)_13]
	jmp	.L149	;
.L179:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp141
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L149	;
.L177:
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r13, %rcx	; filename,
	xorl	%eax, %eax	;
; src/helper.c:210:         return NULL;
	xorl	%ebp, %ebp	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC17(%rip), %rdx	;, tmp136
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L149	;
.L176:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/helper.c:210:         return NULL;
	xorl	%ebp, %ebp	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC14(%rip), %rdx	;, tmp127
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L149	;
	.size	parse_import_file, .-parse_import_file
	.section	.rodata.str1.1
.LC19:
	.string	"%s.%s"
	.text
	.p2align 4
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp101, method_name
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp100, class_name
	pushq	%rbx	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%r12, %rdi	; method_name,
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	; tmp102, tmp90
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	leaq	.LC10(%rip), %rdi	;, tmp97
	leaq	2(%rbx,%rax), %rsi	;, tmp96
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; method_name,
	movq	%rbp, %r8	; class_name,
	movl	$2, %esi	;,
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	; tmp104, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; <retval>,
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	leaq	.LC19(%rip), %rcx	;, tmp98
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:234: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	make_method_name, .-make_method_name
	.p2align 4
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx	;
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
; src/helper.c:237: OperatorType string_to_operator(string str) {
	movq	%rdi, %rbx	; tmp144, str
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp145
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	;, <retval>
; src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	; tmp145
	jne	.L183	;,
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp146
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, <retval>
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	; tmp146
	jne	.L183	;,
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp147
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, <retval>
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	; tmp147
	jne	.L183	;,
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp148
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, <retval>
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	; tmp148
	jne	.L183	;,
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp149
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, <retval>
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	; tmp149
	jne	.L183	;,
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp150
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, <retval>
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	; tmp150
	jne	.L183	;,
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp151
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, <retval>
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	; tmp151
	jne	.L183	;,
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp152
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, <retval>
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	; tmp152
	jne	.L183	;,
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp153
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, <retval>
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	; tmp153
	jne	.L183	;,
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp154
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, <retval>
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	; tmp154
	jne	.L183	;,
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp155
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, <retval>
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	; tmp155
	jne	.L183	;,
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp156
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, <retval>
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	; tmp156
	jne	.L183	;,
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp157
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, <retval>
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	; tmp157
	jne	.L183	;,
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp158
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, <retval>
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	; tmp158
	jne	.L183	;,
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp159
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	; <retval>
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	; tmp159
	jne	.L183	;,
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp160
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, <retval>
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	; tmp160
	jne	.L183	;,
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	; tmp161
	jne	.L201	;,
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	; tmp162
	jne	.L202	;,
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	;, _38
	sbbl	%eax, %eax	; <retval>
	andl	$15, %eax	;, <retval>
	addl	$4, %eax	;, <retval>
.L183:
; src/helper.c:258: }
	popq	%rbx	;
	ret	
.L201:
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, <retval>
; src/helper.c:258: }
	popq	%rbx	;
	ret	
.L202:
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, <retval>
; src/helper.c:258: }
	popq	%rbx	;
	ret	
	.size	string_to_operator, .-string_to_operator
	.p2align 4
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
; src/helper.c:260: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	; <retval>
	cmpl	$18, %edi	;, op
	ja	.L205	;,
	movl	%edi, %edi	; op, op
	leaq	CSWTCH.69(%rip), %rax	;, tmp84
	movl	(%rax,%rdi,4), %eax	; CSWTCH.69[op_2(D)], <retval>
.L205:
; src/helper.c:290: }
	ret	
	.size	operator_precedence, .-operator_precedence
	.section	.text.unlikely,"ax",@progbits
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
; src/helper.c:293:     switch (op) {
	cmpl	$18, %edi	;, op
	ja	.L230	;,
	leaq	.L211(%rip), %rdx	;, tmp85
	movl	%edi, %edi	; op, op
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L211:
	.long	.L229-.L211
	.long	.L228-.L211
	.long	.L227-.L211
	.long	.L226-.L211
	.long	.L225-.L211
	.long	.L224-.L211
	.long	.L223-.L211
	.long	.L222-.L211
	.long	.L221-.L211
	.long	.L220-.L211
	.long	.L219-.L211
	.long	.L218-.L211
	.long	.L217-.L211
	.long	.L216-.L211
	.long	.L215-.L211
	.long	.L214-.L211
	.long	.L213-.L211
	.long	.L212-.L211
	.long	.L210-.L211
	.text
	.p2align 4,,10
	.p2align 3
.L212:
; src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L213:
; src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L214:
; src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L215:
; src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L216:
; src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L217:
; src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L218:
; src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L219:
; src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L220:
; src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L221:
; src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L222:
; src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L223:
; src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L224:
; src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L225:
; src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L226:
; src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L227:
; src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L228:
; src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L229:
; src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L210:
; src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, <retval>
	ret	
	.section	.text.unlikely
	.type	operator_to_string.cold, @function
operator_to_string.cold:
.L230:
; src/helper.c:293:     switch (op) {
	xorl	%eax, %eax	; <retval>
	ret	
	.text
	.size	operator_to_string, .-operator_to_string
	.section	.text.unlikely
	.size	operator_to_string.cold, .-operator_to_string.cold
.LCOLDE20:
	.text
.LHOTE20:
	.section	.rodata
	.align 32
	.type	CSWTCH.69, @object
	.size	CSWTCH.69, 76
CSWTCH.69:
	.long	4
	.long	4
	.long	5
	.long	5
	.long	5
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	3
	.long	2
	.long	2
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
