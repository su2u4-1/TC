	.file	"helper.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.globl	create_list
	.type	create_list, @function
create_list:
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
; src/helper.c:7: list() create_list(void) {
	pushq	%rax	;
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:10:     new_list->tail = NULL;
	xorl	%edx, %edx	;
	movq	%rdx, (%rax)	;, new_list_3->head
	movq	%rdx, 8(%rax)	;, new_list_3->tail
; src/helper.c:12: }
	popq	%rcx	;
	ret	
	.size	create_list, .-create_list
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error: list_append received NULL list\n"
	.text
	.globl	list_append
	.type	list_append, @function
list_append:
; src/helper.c:22:     if (list == NULL) {
	testq	%rdi, %rdi	; list
	jne	.L4	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC0(%rip), %rdi	;, tmp89
	jmp	*fputs@GOTPCREL(%rip)	;
.L4:
; src/helper.c:21: void list_append(list() list, pointer item) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp92, item
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp91, list
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
; src/helper.c:21: void list_append(list() list, pointer item) {
	pushq	%rdx	;
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:16:     new_node->next = NULL;
	xorl	%ecx, %ecx	;
; src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	;, list_3(D)->head
; src/helper.c:16:     new_node->next = NULL;
	movq	%rcx, (%rax)	;, new_node_15->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbp, 8(%rax)	; item, new_node_15->content
; src/helper.c:27:     if (list->head == NULL) {
	jne	.L5	;,
; src/helper.c:28:         list->head = new_node;
	movq	%rax, (%rbx)	; new_node, list_3(D)->head
	jmp	.L9	;
.L5:
; src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; list_3(D)->tail, list_3(D)->tail
	movq	%rax, (%rdx)	; new_node, _2->next
.L9:
; src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_3(D)->tail
; src/helper.c:34: }
	popq	%rax	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx	;
; src/helper.c:36: list() list_copy(list() original) {
	movq	%rdi, %rbx	; tmp88, original
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
; src/helper.c:42:     return new_list;
	movq	%rax, %rbx	; new_list, original
; src/helper.c:41:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	; _2, new_list_8->tail
.L12:
; src/helper.c:43: }
	movq	%rbx, %rax	; original,
	popq	%rbx	;
	ret	
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
; src/helper.c:47:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rdi, %rdi	; list
	je	.L17	;,
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rdi), %rax	; list_6(D)->head, <retval>
; src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; <retval>
	je	.L17	;,
; src/helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	; _1->next, _2
; src/helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rdi)	; _2, list_6(D)->head
; src/helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	; _2
	jne	.L19	;,
; src/helper.c:51:         list->tail = NULL;
	xorl	%edx, %edx	;
	movq	%rdx, 8(%rdi)	;, list_6(D)->tail
.L19:
; src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
.L17:
; src/helper.c:53: }
	ret	
	.size	list_pop, .-list_pop
	.globl	list_pop_back
	.type	list_pop_back, @function
list_pop_back:
; src/helper.c:57:         return NULL;
	xorl	%eax, %eax	; <retval>
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rdi, %rdi	; list
	je	.L24	;,
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rdi), %rax	; list_8(D)->head, <retval>
; src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	; <retval>
	je	.L24	;,
; src/helper.c:58:     if (list->head == list->tail) {
	movq	8(%rdi), %rcx	; list_8(D)->tail, _3
; src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%rcx, %rax	; _3, <retval>
	jne	.L26	;,
; src/helper.c:61:         list->tail = NULL;
	xorl	%esi, %esi	;
; src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	; _1->content, <retval>
; src/helper.c:61:         list->tail = NULL;
	movq	%rsi, (%rdi)	;, list_8(D)->head
	movq	%rsi, 8(%rdi)	;, list_8(D)->tail
; src/helper.c:62:         return content;
	ret	
.L26:
	movq	%rax, %rdx	; <retval>, current
; src/helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	; current_5->next, <retval>
; src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rcx	; <retval>, _3
	jne	.L26	;,
; src/helper.c:68:     current->next = NULL;
	xorl	%ecx, %ecx	;
; src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	; _3->content, <retval>
; src/helper.c:68:     current->next = NULL;
	movq	%rcx, (%rdx)	;, current_2->next
; src/helper.c:69:     list->tail = current;
	movq	%rdx, 8(%rdi)	; current, list_8(D)->tail
.L24:
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
	je	.L34	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, (%rdi)	;, list_4(D)->head
	je	.L34	;,
; src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	xorl	%eax, %eax	; iftmp.1_3
	cmpq	$0, 8(%rdi)	;, list_4(D)->tail
	sete	%al	;, iftmp.1_3
.L34:
; src/helper.c:75: }
	ret	
	.size	list_is_empty, .-list_is_empty
	.globl	create_symbol_table
	.type	create_symbol_table, @function
create_symbol_table:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, parent
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %edi	;,
; src/helper.c:120: SymbolTable* create_symbol_table(SymbolTable* parent) {
	pushq	%rbx	;
	pushq	%rax	;
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:122:     new_scope->parent = parent;
	movq	%rbp, (%rax)	; parent, new_scope_4->parent
; src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movq	%rax, %rbx	; tmp87, <retval>
; src/helper.c:123:     new_scope->symbols = create_list();
	call	create_list	;
; src/helper.c:123:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	; tmp88, new_scope_4->symbols
; src/helper.c:125: }
	movq	%rbx, %rax	; <retval>,
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_symbol_table, .-create_symbol_table
	.globl	search_name_use_strcmp
	.type	search_name_use_strcmp, @function
search_name_use_strcmp:
	pushq	%r13	;
	movq	%rsi, %r13	; tmp94, name
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp93, scope
	pushq	%rcx	;
.L40:
; src/helper.c:128:     while (scope != NULL) {
	testq	%rbx, %rbx	; scope
	je	.L49	;,
; src/helper.c:130:         Node* current = names->head;
	movq	8(%rbx), %rax	; scope_3->symbols, scope_3->symbols
	movq	(%rax), %rbp	; names_9->head, current
.L41:
; src/helper.c:131:         while (current != NULL) {
	testq	%rbp, %rbp	; current
	je	.L50	;,
; src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbp), %r12	; current_4->content, <retval>
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	%r13, %rsi	; name,
	movq	8(%r12), %rdi	; current_name_12->name, current_name_12->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	; tmp95
	je	.L39	;,
; src/helper.c:135:             current = current->next;
	movq	0(%rbp), %rbp	; current_4->next, current
	jmp	.L41	;
.L50:
; src/helper.c:137:         scope = scope->parent;
	movq	(%rbx), %rbx	; scope_3->parent, scope
	jmp	.L40	;
.L49:
; src/helper.c:139:     return NULL;
	xorl	%r12d, %r12d	; <retval>
.L39:
; src/helper.c:140: }
	popq	%rdx	;
	movq	%r12, %rax	; <retval>,
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
	movq	%rsi, %r13	; tmp93, name
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp92, scope
	pushq	%rcx	;
.L52:
; src/helper.c:143:     while (scope != NULL) {
	testq	%rbx, %rbx	; scope
	je	.L58	;,
; src/helper.c:145:         Node* current = names->head;
	movq	8(%rbx), %rax	; scope_3->symbols, scope_3->symbols
	movq	(%rax), %rbp	; names_11->head, current
.L53:
; src/helper.c:146:         while (current != NULL) {
	testq	%rbp, %rbp	; current
	je	.L59	;,
; src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbp), %r12	; current_4->content, <retval>
; src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	%r13, %rsi	; name,
	movq	8(%r12), %rdi	; current_name_14->name, current_name_14->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp94
	jne	.L51	;,
; src/helper.c:150:             current = current->next;
	movq	0(%rbp), %rbp	; current_4->next, current
	jmp	.L53	;
.L59:
; src/helper.c:152:         scope = scope->parent;
	movq	(%rbx), %rbx	; scope_3->parent, scope
	jmp	.L52	;
.L58:
; src/helper.c:154:     return NULL;
	xorl	%r12d, %r12d	; <retval>
.L51:
; src/helper.c:155: }
	popq	%rdx	;
	movq	%r12, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search_name, .-search_name
	.section	.rodata.str1.1
.LC1:
	.string	"Warning: Creating symbol with unknown SymbolType: %u\n"
.LC2:
	.string	"Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n"
.LC3:
	.string	"Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n"
.LC4:
	.string	"Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n"
	.text
	.globl	create_symbol
	.type	create_symbol, @function
create_symbol:
	pushq	%r15	;
	movq	%rdx, %r15	; tmp129, type
	pushq	%r14	;
	movq	%rdi, %r14	; tmp127, name
	pushq	%r13	;
	pushq	%r12	;
	movq	%rcx, %r12	; tmp130, ast_node
	pushq	%rbp	;
	movl	%esi, %ebp	; tmp128, kind
	pushq	%rbx	;
	pushq	%r8	;
; src/helper.c:81:     switch (kind) {
	cmpl	$2, %esi	;, kind
	je	.L80	;,
	ja	.L62	;,
	testl	%esi, %esi	; kind
	jne	.L80	;,
; src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%rcx), %rax	; MEM[(struct Class *)ast_node_22(D)].class_scope, MEM[(struct Class *)ast_node_22(D)].class_scope
	jmp	.L84	;
.L62:
; src/helper.c:81:     switch (kind) {
	leal	-3(%rsi), %eax	;, tmp106
	movq	%rcx, %r13	; ast_node, scope
	cmpl	$3, %eax	;, tmp106
	jbe	.L66	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%esi, %ecx	; kind,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC1(%rip), %rdx	;, tmp111
; src/helper.c:80:     SymbolTable* scope = NULL;
	xorl	%r13d, %r13d	; scope
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L66	;
.L80:
; src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	32(%r12), %rax	;, MEM[(struct Function *)ast_node_22(D)].function_scope
.L84:
	movq	(%rax), %r13	;* MEM[(struct Function *)ast_node_22(D)].function_scope, scope
.L66:
; src/helper.c:93:     Symbol* result = search_name(scope, name);
	movq	%r14, %rsi	; name,
	movq	%r13, %rdi	; scope,
	call	search_name	;
; src/helper.c:94:     if (result != NULL)
	testq	%rax, %rax	; result
	je	.L67	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rax), %r9	; result_29->id, result_29->id
	movl	32(%rax), %r8d	; result_29->kind, result_29->kind
	movl	$2, %esi	;,
	pushq	%rcx	;
; src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	; id_counter, tmp134
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r14, %rcx	; name,
	leaq	.LC2(%rip), %rdx	;, tmp117
; src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	incq	%rax	; tmp115
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rax	; tmp115
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	popq	%rsi	;
	popq	%rdi	;
.L67:
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:97:     new_name->name = name;
	movq	%r14, 8(%rax)	; name, new_name_31->name
; src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %rbx	; tmp132, <retval>
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp135
; src/helper.c:99:     new_name->kind = kind;
	movl	%ebp, 32(%rbx)	; kind, new_name_31->kind
; src/helper.c:98:     new_name->id = ++id_counter;
	incq	%rax	; _11
; src/helper.c:100:     new_name->type = type;
	movq	%r15, (%rbx)	; type, new_name_31->type
; src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	%rax, 16(%rbx)	; _11, new_name_31->id
; src/helper.c:101:     switch (kind) {
	cmpl	$2, %ebp	;, kind
	je	.L82	;,
	jbe	.L82	;,
	leal	-3(%rbp), %eax	;, tmp119
	cmpl	$3, %eax	;, tmp119
	ja	.L85	;,
.L82:
; src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	movq	%r12, 24(%rbx)	; ast_node,
; src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	jmp	.L74	;
.L85:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	%ebp, %ecx	; kind,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rdx	;, tmp121
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L74:
; src/helper.c:113:     if (scope == NULL)
	testq	%r13, %r13	; scope
	jne	.L75	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	16(%rbx), %r9	; new_name_31->id,
	movq	stderr(%rip), %rdi	; stderr,
	movl	%ebp, %r8d	; kind,
	xorl	%eax, %eax	;
	movq	%r14, %rcx	; name,
	leaq	.LC4(%rip), %rdx	;, tmp124
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L60	;
.L75:
; src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%r13), %rdi	; scope_16->symbols, scope_16->symbols
	movq	%rbx, %rsi	; <retval>,
	call	list_append	;
.L60:
; src/helper.c:118: }
	popq	%rdx	;
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	create_symbol, .-create_symbol
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rsi	; INT_KEYWORD,
; src/helper.c:157: inline bool is_builtin_type(string type) {
	movq	%rdi, %rbx	; tmp104, type
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp105
	je	.L87	;,
.L89:
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.9_11
	jmp	.L88	;
.L87:
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rsi	; FLOAT_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp106
	jne	.L89	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rsi	; STRING_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp107
	jne	.L89	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rsi	; BOOL_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp108
	jne	.L89	;,
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	VOID_KEYWORD(%rip), %rsi	; VOID_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp109
	setne	%al	;, iftmp.9_11
	movzbl	%al, %eax	; iftmp.9_11, iftmp.9_11
.L88:
; src/helper.c:159: }
	popq	%rbx	;
	ret	
	.size	is_builtin_type, .-is_builtin_type
	.section	.rodata.str1.1
.LC5:
	.string	"Parser Error at %s:%zu:%zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$16, %rsp	;,
; src/helper.c:161: inline void parser_error(const string message, Token* token, string file_name) {
	movq	%rdx, %rcx	; tmp98, file_name
; src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
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
	.section	.rodata.str1.1
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
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %eax	;, tmp110
; src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%r14	;
	movq	%rcx, %r14	; tmp137, indent_has_next
	pushq	%r13	;
	movl	%edx, %r13d	; tmp136, is_last
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp135, indent
; src/helper.c:166:     char word = bool_list[index / 8];
	shrq	$3, %rsi	;, tmp107
; src/helper.c:166:     char word = bool_list[index / 8];
	addq	%rcx, %rsi	; indent_has_next, _20
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	%ebx, %ecx	; indent, tmp108
	andl	$7, %ecx	;, tmp108
; src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	subq	$16, %rsp	;,
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	sall	%cl, %eax	; tmp108, tmp109
; src/helper.c:166:     char word = bool_list[index / 8];
	movb	(%rsi), %dl	; *_20, word
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	testb	%r13b, %r13b	; is_last
	jne	.L94	;,
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orl	%eax, %edx	; tmp109, iftmp.18_33
	jmp	.L95	;
.L94:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%eax	; tmp111
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andl	%eax, %edx	; tmp111, iftmp.18_33
.L95:
; src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movb	%dl, (%rsi)	; iftmp.18_33, *_20
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebp	;, i
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC7(%rip), %r15	;, tmp133
.L96:
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rbp	; indent, i
	jnb	.L104	;,
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%rbp, %rax	; i, tmp112
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%ebp, %ecx	; i, tmp114
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, 8(%rsp)	; out, %sfp
	movl	$2, %esi	;,
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	shrq	$3, %rax	;, tmp112
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	andl	$7, %ecx	;, tmp114
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC6(%rip), %rdx	;, tmp124
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	(%r14,%rax), %eax	; *_35, *_35
; src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	sarl	%cl, %eax	; tmp114, tmp115
; src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	;, tmp115
	cmove	%r15, %rdx	; tmp133,, iftmp.16_5
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	incq	%rbp	; i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movq	8(%rsp), %rdi	; %sfp, out
	jmp	.L96	;
.L104:
; src/helper.c:178:     if (indent > 0)
	testq	%rbx, %rbx	; indent
	je	.L93	;,
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r13b, %r13b	; is_last
	leaq	.LC8(%rip), %rax	;, tmp130
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC9(%rip), %rdx	;, tmp129
	cmovne	%rax, %rdx	; tmp129,, tmp130, iftmp.17_6
; src/helper.c:180: }
	addq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/helper.c:180: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L93:
; src/helper.c:180: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	indention, .-indention
	.globl	indention_tac
	.type	indention_tac, @function
indention_tac:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp86, out
	pushq	%rbp	;
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	xorl	%ebp, %ebp	; i
; src/helper.c:182: void indention_tac(FILE* out, size_t indent) {
	pushq	%rbx	;
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	leaq	0(,%rsi,4), %rbx	;, _1
.L106:
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rbx, %rbp	; _1, i
	jnb	.L109	;,
; src/helper.c:184:         putc(' ', out);
	movq	%r12, %rsi	; out,
	movl	$32, %edi	;,
; src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	incq	%rbp	; i
; src/helper.c:184:         putc(' ', out);
	call	*putc@GOTPCREL(%rip)	;
	jmp	.L106	;
.L109:
; src/helper.c:185: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	indention_tac, .-indention_tac
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbx	;
; src/helper.c:187: Parser* create_parser(File* file) {
	movq	%rdi, %rbx	; tmp85, file
; src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:189:     new_parser->in_function = false;
	movw	$0, 8(%rax)	;, MEM <unsigned short> [(char *)new_parser_3 + 8B]
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
.LC14:
	.string	"Error opening library file for import: %s\n"
.LC15:
	.string	"Info: Starting parsing lib file for import: %s\n"
.LC16:
	.string	"Info: Finished parsing lib file for import: %s\n"
.LC17:
	.string	"Error parsing library file for import: %s\n"
.LC18:
	.string	"Error: Imported symbol '%s' was not found in %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdx, %r13	; tmp129, scope
	pushq	%r12	;
	movq	%rdi, %r12	; tmp127, import_name
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
; src/helper.c:200:     if (source == NULL) {
	testq	%rsi, %rsi	; source
	jne	.L113	;,
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	.LC10(%rip), %rdi	;, tmp109
	leaq	4(%rax), %rsi	;, tmp108
	call	*create_string_not_check@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$2, %esi	;,
	movq	%r12, %r8	; import_name,
	orq	$-1, %rdx	;,
	movq	%rax, %rdi	; temp_import_name,
; src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	%rax, %rbx	; tmp132, temp_import_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC11(%rip), %rcx	;, tmp110
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC12(%rip), %rsi	;, tmp111
	jmp	.L121	;
.L113:
	movq	%rsi, %rbx	; tmp128, source
	movq	%rcx, %rdi	; tmp130, source_file
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	*get_file_dir@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp134, _3
.L121:
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rdi	; source,
	call	*absolute_path@GOTPCREL(%rip)	;
; src/helper.c:207:     openfile = fopen(filename, "r");
	leaq	.LC13(%rip), %rsi	;, tmp112
; src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rbx	; tmp135, filename
; src/helper.c:207:     openfile = fopen(filename, "r");
	movq	%rax, %rdi	; filename,
	call	*fopen@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; filename,
	leaq	.LC14(%rip), %rdx	;, tmp115
; src/helper.c:207:     openfile = fopen(filename, "r");
	movq	%rax, %rbp	; tmp136, tmp113
; src/helper.c:208:     if (openfile == NULL) {
	testq	%rax, %rax	; tmp113
	je	.L122	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%rbx, %rdx	; filename,
	leaq	.LC15(%rip), %rsi	;, tmp116
	movl	$2, %edi	;,
	xorl	%eax, %eax	;
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:213:     size_t length = 0;
	xorl	%eax, %eax	;
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	24(%rsp), %rsi	;, tmp117
	movq	%rbp, %rdi	; tmp113,
; src/helper.c:213:     size_t length = 0;
	movq	%rax, 24(%rsp)	;, length
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	call	*read_source@GOTPCREL(%rip)	;
; src/helper.c:215:     fclose(openfile);
	movq	%rbp, %rdi	; tmp113,
; src/helper.c:214:     string source_code = read_source(openfile, &length);
	movq	%rax, %r14	; tmp137, source_code
; src/helper.c:215:     fclose(openfile);
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %rdi	; filename,
	call	*create_file@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp138, _5
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	create_parser	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	builtin_scope(%rip), %rbp	; builtin_scope, builtin_scope.20_7
	movq	24(%rsp), %rsi	; length,
	movq	%r14, %rdi	; source_code,
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %r15	; tmp139, _6
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	*create_lexer@GOTPCREL(%rip)	;
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rbp, %rsi	; builtin_scope.20_7,
	movq	%r15, %rdx	; _6,
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rdi	; tmp140, _9
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	*parse_code@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%rbx, %rdx	; filename,
	movl	$2, %edi	;,
	leaq	.LC16(%rip), %rsi	;, tmp119
; src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rbp	; tmp141, code
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	;
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:218:     if (code == NULL) {
	testq	%rbp, %rbp	; code
	jne	.L117	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; filename,
	leaq	.LC17(%rip), %rdx	;, tmp121
.L122:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L116:
; src/helper.c:210:         return NULL;
	xorl	%eax, %eax	; <retval>
	jmp	.L112	;
.L117:
; src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%rbp), %rdi	; code_41->global_scope, code_41->global_scope
	movq	%r12, %rsi	; import_name,
	call	search_name_use_strcmp	;
; src/helper.c:223:     if (name != NULL)
	testq	%rax, %rax	; <retval>
	je	.L119	;,
; src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	8(%r13), %rdi	; scope_44(D)->symbols, scope_44(D)->symbols
	movq	%rax, %rsi	; <retval>,
	movq	%rax, 8(%rsp)	; <retval>, %sfp
	call	list_append	;
	movq	8(%rsp), %rax	; %sfp, <retval>
	jmp	.L112	;
.L119:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbx, %r8	; filename,
	movq	%r12, %rcx	; import_name,
	xorl	%eax, %eax	;
	leaq	.LC18(%rip), %rdx	;, tmp125
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L116	;
.L112:
; src/helper.c:228: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_import_file, .-parse_import_file
	.section	.rodata.str1.1
.LC19:
	.string	"%s.%s"
	.text
	.globl	make_method_name
	.type	make_method_name, @function
make_method_name:
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp101, method_name
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rdi, 8(%rsp)	; class_name, %sfp
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rbp, %rdi	; method_name,
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	; tmp102, tmp90
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	*strlen@GOTPCREL(%rip)	;
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	leaq	.LC10(%rip), %rdi	;, tmp97
	leaq	2(%rbx,%rax), %rsi	;, tmp96
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	8(%rsp), %r8	; %sfp, class_name
	movq	%rbp, %r9	; method_name,
	orq	$-1, %rdx	;,
; src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	; tmp104, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; <retval>,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC19(%rip), %rcx	;, tmp98
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:234: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	make_method_name, .-make_method_name
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
	jne	.L125	;,
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp146
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, <retval>
; src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	; tmp146
	jne	.L125	;,
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp147
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, <retval>
; src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	; tmp147
	jne	.L125	;,
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp148
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, <retval>
; src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	; tmp148
	jne	.L125	;,
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp149
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, <retval>
; src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	; tmp149
	jne	.L125	;,
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp150
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, <retval>
; src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	; tmp150
	jne	.L125	;,
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp151
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, <retval>
; src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	; tmp151
	jne	.L125	;,
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp152
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, <retval>
; src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	; tmp152
	jne	.L125	;,
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp153
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, <retval>
; src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	; tmp153
	jne	.L125	;,
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp154
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, <retval>
; src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	; tmp154
	jne	.L125	;,
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp155
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, <retval>
; src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	; tmp155
	jne	.L125	;,
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp156
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, <retval>
; src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	; tmp156
	jne	.L125	;,
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp157
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, <retval>
; src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	; tmp157
	jne	.L125	;,
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp158
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, <retval>
; src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	; tmp158
	jne	.L125	;,
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp159
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	; <retval>
; src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	; tmp159
	jne	.L125	;,
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp160
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, <retval>
; src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	; tmp160
	jne	.L125	;,
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp161
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, <retval>
; src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%dl, %dl	; tmp161
	jne	.L125	;,
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp162
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, <retval>
; src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%dl, %dl	; tmp162
	jne	.L125	;,
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	;, _38
	sbbl	%eax, %eax	; <retval>
	andl	$15, %eax	;, <retval>
	addl	$4, %eax	;, <retval>
.L125:
; src/helper.c:258: }
	popq	%rbx	;
	ret	
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
; src/helper.c:260: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	; <retval>
	cmpl	$18, %edi	;, op
	ja	.L147	;,
	movl	%edi, %edi	; op, op
	leaq	CSWTCH.68(%rip), %rax	;, tmp85
	movsbl	(%rax,%rdi), %eax	; CSWTCH.68[op_2(D)], <retval>
.L147:
; src/helper.c:290: }
	ret	
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
; src/helper.c:293:     switch (op) {
	xorl	%eax, %eax	; <retval>
	cmpl	$18, %edi	;, op
	ja	.L150	;,
	leaq	.L153(%rip), %rdx	;, tmp85
	movl	%edi, %edi	; op, op
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L153:
	.long	.L171-.L153
	.long	.L170-.L153
	.long	.L169-.L153
	.long	.L168-.L153
	.long	.L167-.L153
	.long	.L166-.L153
	.long	.L165-.L153
	.long	.L164-.L153
	.long	.L163-.L153
	.long	.L162-.L153
	.long	.L161-.L153
	.long	.L160-.L153
	.long	.L159-.L153
	.long	.L158-.L153
	.long	.L157-.L153
	.long	.L156-.L153
	.long	.L155-.L153
	.long	.L154-.L153
	.long	.L152-.L153
	.text
.L158:
; src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, <retval>
	ret	
.L157:
; src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, <retval>
	ret	
.L156:
; src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, <retval>
	ret	
.L155:
; src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, <retval>
	ret	
.L154:
; src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, <retval>
	ret	
.L152:
; src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, <retval>
	ret	
.L160:
; src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, <retval>
	ret	
.L159:
; src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, <retval>
	ret	
.L166:
; src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, <retval>
	ret	
.L165:
; src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, <retval>
	ret	
.L164:
; src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, <retval>
	ret	
.L163:
; src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, <retval>
	ret	
.L162:
; src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, <retval>
	ret	
.L161:
; src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, <retval>
	ret	
.L171:
; src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, <retval>
	ret	
.L170:
; src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, <retval>
	ret	
.L169:
; src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, <retval>
	ret	
.L168:
; src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, <retval>
	ret	
.L167:
; src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, <retval>
.L150:
; src/helper.c:316: }
	ret	
	.size	operator_to_string, .-operator_to_string
	.section	.rodata
	.align 16
	.type	CSWTCH.68, @object
	.size	CSWTCH.68, 19
CSWTCH.68:
	.byte	4
	.byte	4
	.byte	5
	.byte	5
	.byte	5
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
