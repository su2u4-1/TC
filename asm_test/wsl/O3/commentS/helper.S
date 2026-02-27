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
; src/helper.c:9:     new_list->head = 0;
	pxor	%xmm0, %xmm0	; tmp83
	movups	%xmm0, (%rax)	; tmp83, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_3]
; src/helper.c:12: }
	addq	$8, %rsp	;,
	ret	
	.size	create_list, .-create_list
	.p2align 4
	.globl	create_node
	.type	create_node, @function
create_node:
	pushq	%rbx	;
; src/helper.c:14: Node* create_node(pointer content) {
	movq	%rdi, %rbx	; tmp85, content
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	;, new_node_3->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbx, 8(%rax)	; content, new_node_3->content
; src/helper.c:19: }
	popq	%rbx	;
	ret	
	.size	create_node, .-create_node
	.p2align 4
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp89, item
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp88, list
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
; src/helper.c:21: void list_append(list() list, pointer item) {
	subq	$8, %rsp	;,
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	;, list_6(D)->head
; src/helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	;, new_node_11->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbp, 8(%rax)	; item, new_node_11->content
; src/helper.c:23:     if (list->head == 0) {
	je	.L10	;,
; src/helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; list_6(D)->tail, list_6(D)->tail
	movq	%rax, (%rdx)	; new_node, _2->next
; src/helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_6(D)->tail
; src/helper.c:30: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
; src/helper.c:24:         list->head = new_node;
	movq	%rax, (%rbx)	; new_node, list_6(D)->head
; src/helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_6(D)->tail
; src/helper.c:30: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	list_append, .-list_append
	.p2align 4
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx	;
; src/helper.c:32: list() list_copy(list() original) {
	movq	%rdi, %rbx	; tmp88, original
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:9:     new_list->head = 0;
	pxor	%xmm0, %xmm0	; tmp85
	movups	%xmm0, (%rax)	; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
; src/helper.c:34:     new_list->head = original->head;
	movdqu	(%rbx), %xmm1	; MEM <vector(2) long unsigned int> [(struct Node * *)original_4(D)], tmp91
	movups	%xmm1, (%rax)	; tmp91, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
; src/helper.c:37: }
	popq	%rbx	;
	ret	
	.size	list_copy, .-list_copy
	.p2align 4
	.globl	list_pop
	.type	list_pop, @function
list_pop:
; src/helper.c:40:     if (list->head == 0)
	movq	(%rdi), %rax	; list_7(D)->head, <retval>
; src/helper.c:40:     if (list->head == 0)
	testq	%rax, %rax	; <retval>
	je	.L13	;,
; src/helper.c:43:     list->head = head_node->next;
	movq	(%rax), %rdx	; _1->next, _2
; src/helper.c:43:     list->head = head_node->next;
	movq	%rdx, (%rdi)	; _2, list_7(D)->head
; src/helper.c:44:     if (list->head == 0)
	testq	%rdx, %rdx	; _2
	je	.L19	;,
.L15:
; src/helper.c:46:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
.L13:
; src/helper.c:47: }
	ret	
	.p2align 4,,10
	.p2align 3
.L19:
; src/helper.c:45:         list->tail = 0;
	movq	$0, 8(%rdi)	;, list_7(D)->tail
	jmp	.L15	;
	.size	list_pop, .-list_pop
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"type\n"
.LC1:
	.string	"variable\n"
.LC2:
	.string	"function\n"
.LC3:
	.string	"method\n"
.LC4:
	.string	"class\n"
.LC5:
	.string	"attribute\n"
.LC6:
	.string	"unknown\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
	.align 8
.LC8:
	.string	"Error creating name: unknown NameType %u\n"
	.align 8
.LC9:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
	.text
	.p2align 4
	.globl	create_name
	.type	create_name, @function
create_name:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movl	%esi, %r12d	; tmp158, kind
	pushq	%rbp	;
	movq	%r8, %rbp	; tmp161, scope
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp157, name
	subq	$24, %rsp	;,
; src/helper.c:50: Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
	movq	%rdx, (%rsp)	; tmp159, %sfp
	movq	%rcx, 8(%rsp)	; tmp160, %sfp
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%r8, %r8	; scope
	je	.L22	;,
	movq	%r8, %r13	; scope, scope_ptr
.L21:
; src/helper.c:112:         Node* current = ((names))->head;
	movq	8(%r13), %rax	; scope_ptr_34->names, scope_ptr_34->names
	movq	(%rax), %r14	; names_59->head, current
; src/helper.c:113:         while (current != 0) {
	testq	%r14, %r14	; current
	jne	.L23	;,
	jmp	.L26	;
	.p2align 4,,10
	.p2align 3
.L64:
; src/helper.c:118:             current = node_ptr->next;
	movq	(%r14), %r14	; current_47->next, current
; src/helper.c:113:         while (current != 0) {
	testq	%r14, %r14	; current
	je	.L26	;,
.L23:
; src/helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%r14), %r15	; current_47->content, current_name
; src/helper.c:116:             if (string_equal(current_name->name, name))
	movq	%rbx, %rsi	; name,
	movq	(%r15), %rdi	; current_name_62->name, current_name_62->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp162
	je	.L64	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movq	%rbx, %rcx	; name,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC9(%rip), %rdx	;, tmp150
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:55:         switch (result->kind) {
	cmpl	$5, 24(%r15)	;, current_name_62->kind
	ja	.L33	;,
	movl	24(%r15), %eax	; current_name_62->kind, current_name_62->kind
	leaq	.L44(%rip), %rdx	;, tmp152
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
; src/helper.c:55:         switch (result->kind) {
	movslq	(%rdx,%rax,4), %rax	;, tmp154
	addq	%rdx, %rax	; tmp152, tmp155
	jmp	*%rax	; tmp155
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L27-.L44
	.long	.L28-.L44
	.long	.L29-.L44
	.long	.L30-.L44
	.long	.L31-.L44
	.long	.L32-.L44
	.text
.L27:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp123
	call	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L22:
; src/helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:80:     new_name->name = name;
	movq	%rbx, (%rax)	; name, new_name_36->name
; src/helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movq	%rax, %r13	; tmp163, <retval>
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp167
; src/helper.c:82:     new_name->kind = kind;
	movl	%r12d, 24(%r13)	; kind, new_name_36->kind
; src/helper.c:81:     new_name->id = ++id_counter;
	addq	$1, %rax	;, _11
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	%rax, 8(%r13)	; _11, new_name_36->id
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	movl	%r12d, %eax	; kind, tmp137
	andl	$-5, %eax	;, tmp137
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$1, %eax	;, tmp137
	je	.L34	;,
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	leal	-2(%r12), %eax	;, tmp138
	cmpl	$1, %eax	;, tmp138
	jbe	.L34	;,
; src/helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, %r12d	;, kind
	jne	.L38	;,
	movq	8(%rsp), %rax	; %sfp, scope_info
	testq	%rax, %rax	; scope_info
	je	.L38	;,
.L63:
; src/helper.c:86:         new_name->info.scope = scope_info;
	movq	%rax, 16(%r13)	; scope_info,
.L37:
; src/helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	8(%rbp), %rbx	; scope_31(D)->names, _24
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	;, _24->head
; src/helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	;, new_node_69->next
; src/helper.c:17:     new_node->content = content;
	movq	%r13, 8(%rax)	; <retval>, new_node_69->content
; src/helper.c:23:     if (list->head == 0) {
	je	.L65	;,
; src/helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; _24->tail, _24->tail
	movq	%rax, (%rdx)	; new_node, _71->next
; src/helper.c:28:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, _24->tail
.L20:
; src/helper.c:98: }
	addq	$24, %rsp	;,
	movq	%r13, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L34:
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	movq	(%rsp), %rax	; %sfp, name_info
	testq	%rax, %rax	; name_info
	jne	.L63	;,
.L36:
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	movq	(%rsp), %rax	; %sfp, name_info
	orq	8(%rsp), %rax	; %sfp, name_info
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r12d, %ecx	; kind,
; src/helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movq	stderr(%rip), %rdi	; stderr, pretmp_90
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	jne	.L39	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC7(%rip), %rdx	;, tmp144
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L40:
; src/helper.c:94:         return NULL;
	xorl	%r13d, %r13d	; <retval>
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L26:
; src/helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	0(%r13), %r13	; scope_ptr_34->parent, scope_ptr
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%r13, %r13	; scope_ptr
	jne	.L21	;,
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L65:
; src/helper.c:24:         list->head = new_node;
	movq	%rax, %xmm0	; new_node, tmp146
	punpcklqdq	%xmm0, %xmm0	; tmp146
	movups	%xmm0, (%rbx)	; tmp146, MEM <vector(2) long unsigned int> [(struct Node * *)_24]
	jmp	.L20	;
.L28:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp125
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L22	;
.L29:
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L22	;
.L30:
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp129
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L22	;
.L32:
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp133
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L22	;
.L31:
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L22	;
.L33:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L22	;
.L38:
; src/helper.c:87:     else if (kind == NAME_TYPE)
	testl	%r12d, %r12d	; kind
	jne	.L36	;,
; src/helper.c:88:         new_name->info.type = NULL;
	movq	$0, 16(%r13)	;, new_name_36->info.type
	jmp	.L37	;
.L39:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC8(%rip), %rdx	;, tmp145
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L40	;
	.size	create_name, .-create_name
	.p2align 4
	.globl	create_scope
	.type	create_scope, @function
create_scope:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp87, parent
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %edi	;,
; src/helper.c:100: Scope* create_scope(Scope* parent) {
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %edi	;,
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movq	%rax, %rbx	; tmp88, <retval>
; src/helper.c:103:     scope_ptr->parent = parent;
	movq	%rbp, (%rax)	; parent, new_scope_3->parent
; src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:9:     new_list->head = 0;
	pxor	%xmm0, %xmm0	; tmp85
	movups	%xmm0, (%rax)	; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
; src/helper.c:104:     scope_ptr->names = create_list();
	movq	%rax, 8(%rbx)	; new_list, new_scope_3->names
; src/helper.c:106: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_scope, .-create_scope
	.p2align 4
	.globl	search
	.type	search, @function
search:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%rdi, %rdi	; scope
	je	.L69	;,
	movq	%rdi, %r13	; tmp92, scope
	movq	%rsi, %r12	; tmp93, name
.L73:
; src/helper.c:112:         Node* current = ((names))->head;
	movq	8(%r13), %rax	; scope_ptr_22->names, scope_ptr_22->names
	movq	(%rax), %rbx	; names_12->head, current
; src/helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	; current
	jne	.L72	;,
	jmp	.L70	;
	.p2align 4,,10
	.p2align 3
.L83:
; src/helper.c:118:             current = node_ptr->next;
	movq	(%rbx), %rbx	; current_23->next, current
; src/helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L70	;,
.L72:
; src/helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rbp	; current_23->content, <retval>
; src/helper.c:116:             if (string_equal(current_name->name, name))
	movq	%r12, %rsi	; name,
	movq	0(%rbp), %rdi	; current_name_15->name, current_name_15->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp94
	je	.L83	;,
; src/helper.c:123: }
	addq	$8, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L70:
; src/helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	0(%r13), %r13	; scope_ptr_22->parent, scope
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%r13, %r13	; scope
	jne	.L73	;,
.L69:
; src/helper.c:123: }
	addq	$8, %rsp	;,
; src/helper.c:122:     return NULL;
	xorl	%ebp, %ebp	; <retval>
; src/helper.c:123: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search, .-search
	.p2align 4
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rsi	; INT_KEYWORD,
; src/helper.c:125: bool is_builtin_type(string type) {
	movq	%rdi, %rbx	; tmp102, type
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp103
	je	.L85	;,
.L87:
; src/helper.c:125: bool is_builtin_type(string type) {
	movl	$1, %eax	;, <retval>
; src/helper.c:127: }
	popq	%rbx	;
	ret	
	.p2align 4,,10
	.p2align 3
.L85:
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rsi	; FLOAT_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp104
	jne	.L87	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rsi	; STRING_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp105
	jne	.L87	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rsi	; BOOL_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp106
	jne	.L87	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	%rbx, %rdi	; type,
	movq	VOID_KEYWORD(%rip), %rsi	; VOID_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:127: }
	popq	%rbx	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp107
	setne	%al	;, <retval>
; src/helper.c:127: }
	ret	
	.size	is_builtin_type, .-is_builtin_type
	.p2align 4
	.globl	is_type
	.type	is_type, @function
is_type:
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	testl	$-5, 24(%rdi)	;, type_4(D)->kind
	sete	%al	;, tmp90
; src/helper.c:132: }
	ret	
	.size	is_type, .-is_type
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.p2align 4
	.globl	parser_error
	.type	parser_error, @function
parser_error:
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	16(%rsi), %rax	; token_7(D)->column, token_7(D)->column
	movq	8(%rsi), %rcx	; token_7(D)->line, token_7(D)->line
; src/helper.c:134: void parser_error(const string message, Token* token) {
	movq	%rdi, %r9	; message, tmp95
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC10(%rip), %rdx	;, tmp94
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	1(%rax), %r8	;,
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	addq	$1, %rcx	;, tmp91
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1
.LC11:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC12:
	.string	"\342\224\234\342\224\200\342\224\200 "
.LC13:
	.string	"\342\224\202   "
.LC14:
	.string	"    "
	.text
	.p2align 4
	.globl	indention
	.type	indention, @function
indention:
	pushq	%r15	;
; src/helper.c:139:     char word = bool_list[index / 8];
	movq	%rsi, %rax	; indent, tmp108
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%r14	;
; src/helper.c:139:     char word = bool_list[index / 8];
	shrq	$3, %rax	;, tmp108
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp124, out
	movl	%edx, %edi	; tmp126, is_last
	pushq	%rbp	;
; src/helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	3(%rcx), %rbp	;, _3
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp125, indent
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ebx, %ecx	; indent, tmp109
	andl	$7, %ecx	;, tmp109
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	subq	$24, %rsp	;,
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movl	%edx, 12(%rsp)	; is_last, %sfp
; src/helper.c:139:     char word = bool_list[index / 8];
	movq	%rax, %rdx	; tmp108, tmp108
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %eax	;, tmp111
; src/helper.c:139:     char word = bool_list[index / 8];
	addq	%rbp, %rdx	; _3, _16
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	sall	%cl, %eax	; tmp109, tmp110
; src/helper.c:139:     char word = bool_list[index / 8];
	movzbl	(%rdx), %esi	; *_16, word
; src/helper.c:140:     if (value)
	testb	%dil, %dil	; is_last
	jne	.L92	;,
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%eax, %esi	; tmp110, tmp112
	movb	%sil, (%rdx)	; tmp112, *_16
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rbx	;, indent
	jbe	.L104	;,
.L93:
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movl	$1, %r15d	;, i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC14(%rip), %r14	;, tmp122
	leaq	.LC13(%rip), %r13	;, tmp123
	.p2align 4,,10
	.p2align 3
.L97:
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	%r15, %rax	; i, tmp115
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; out,
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	shrq	$3, %rax	;, tmp115
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movsbl	0(%rbp,%rax), %edx	; *_30, *_30
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%r15d, %eax	; i, tmp117
	andl	$7, %eax	;, tmp117
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	btl	%eax, %edx	; tmp117, *_30
	jnc	.L99	;,
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %r15	;, i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	movq	%r13, %rdi	; tmp123,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%r15, %rbx	; i, indent
	jne	.L97	;,
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 12(%rsp)	;, %sfp
	je	.L94	;,
	.p2align 4,,10
	.p2align 3
.L98:
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC11(%rip), %rdx	;, iftmp.20_6
.L102:
; src/helper.c:157: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdi	; out,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/helper.c:157: }
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
.L99:
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %r15	;, i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	movq	%r14, %rdi	; tmp122,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%r15, %rbx	; i, indent
	jne	.L97	;,
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 12(%rsp)	;, %sfp
	jne	.L98	;,
.L94:
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC12(%rip), %rdx	;, iftmp.20_6
	jmp	.L102	;
	.p2align 4,,10
	.p2align 3
.L92:
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	; tmp113
	andl	%esi, %eax	; word, tmp114
	movb	%al, (%rdx)	; tmp114, *_16
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rbx	;, indent
	ja	.L93	;,
; src/helper.c:155:     if (indent > 0)
	testq	%rbx, %rbx	; indent
	jne	.L98	;,
.L91:
; src/helper.c:157: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L104:
; src/helper.c:155:     if (indent > 0)
	testq	%rbx, %rbx	; indent
	je	.L91	;,
	jmp	.L94	;
	.size	indention, .-indention
	.p2align 4
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	subq	$8, %rsp	;,
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:162:     parser_ptr->in_function = false;
	xorl	%edx, %edx	;
	movw	%dx, (%rax)	;, MEM <vector(2) char> [(char *)new_parser_3]
; src/helper.c:164:     parser_ptr->in_loop = false;
	movb	$0, 2(%rax)	;, new_parser_3->in_loop
; src/helper.c:166: }
	addq	$8, %rsp	;,
	ret	
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
	.section	.rodata.str1.1
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Error opening library file for import: %s\n"
	.align 8
.LC22:
	.string	"Info: Starting parsing lib file for import: %s\n"
	.align 8
.LC23:
	.string	"Info: Finished parsing lib file for import: %s\n"
	.align 8
.LC24:
	.string	"Error parsing library file for import: %s\n"
	.text
	.p2align 4
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdx, %r13	; tmp157, scope
	pushq	%r12	;
	movq	%rdi, %r12	; tmp155, import_name
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$1048, %rsp	;,
; src/helper.c:173:     filename[0] = '\0';
	movb	$0, 16(%rsp)	;, filename[0]
; src/helper.c:174:     if (source == 0) {
	testq	%rsi, %rsi	; source
	je	.L128	;,
; src/helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	leaq	16(%rsp), %rbx	;, tmp154
	movq	%rsi, %rcx	; source,
	movl	$1024, %esi	;,
	movq	%rbx, %rdx	; tmp154,
	movq	%rbx, %rdi	; tmp154,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	movq	%rbx, %rdx	; tmp154,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp154,
	leaq	.LC18(%rip), %rcx	;, tmp126
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	%r12, %rcx	; import_name,
	movq	%rbx, %rdx	; tmp154,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp154,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	movq	%rbx, %rdx	; tmp154,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp154,
	leaq	.LC19(%rip), %rcx	;, tmp131
	call	*string_append@GOTPCREL(%rip)	;
.L110:
; src/helper.c:189:     openfile = fopen(filename, "r");
	leaq	.LC20(%rip), %rsi	;, tmp133
	movq	%rbx, %rdi	; tmp154,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp160, tmp134
; src/helper.c:190:     if (openfile == NULL) {
	testq	%rax, %rax	; tmp134
	je	.L129	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%rbx, %rdx	; tmp154,
	leaq	.LC22(%rip), %rsi	;, tmp139
	movl	$2, %edi	;,
	xorl	%eax, %eax	;
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	8(%rsp), %rsi	;, tmp140
	movq	%rbp, %rdi	; tmp134,
; src/helper.c:195:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	call	*read_source@GOTPCREL(%rip)	;
; src/helper.c:197:     fclose(openfile);
	movq	%rbp, %rdi	; tmp134,
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	movq	%rax, %r14	; tmp161, source_code
; src/helper.c:197:     fclose(openfile);
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%r14, %rdi	; source_code,
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movq	%rax, %rbp	; tmp162, new_parser
; src/helper.c:162:     parser_ptr->in_function = false;
	xorl	%eax, %eax	;
	movw	%ax, 0(%rbp)	;, MEM <vector(2) char> [(char *)new_parser_48]
; src/helper.c:164:     parser_ptr->in_loop = false;
	movb	$0, 2(%rbp)	;, new_parser_48->in_loop
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	builtin_scope(%rip), %r15	; builtin_scope, builtin_scope.23_5
	movq	8(%rsp), %rsi	; length,
	call	*create_lexer@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rbp, %rdx	; new_parser,
	movq	%r15, %rsi	; builtin_scope.23_5,
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rdi	; tmp163, _7
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	*parse_code@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%rbx, %rdx	; tmp154,
	movl	$2, %edi	;,
	leaq	.LC23(%rip), %rsi	;, tmp144
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rbp	; tmp164, code
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	;
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:200:     if (code == 0) {
	testq	%rbp, %rbp	; code
	je	.L130	;,
; src/helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rbp), %rax	; code_37->global_scope, code_37->global_scope
; src/helper.c:205:     Node* current = ((names))->head;
	movq	8(%rax), %rax	; _9->names, _9->names
	movq	(%rax), %rbx	; names_38->head, current
; src/helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	; current
	jne	.L118	;,
	jmp	.L112	;
	.p2align 4,,10
	.p2align 3
.L131:
; src/helper.c:213:         current = node_ptr->next;
	movq	(%rbx), %rbx	; current_40->next, current
; src/helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L112	;,
.L118:
; src/helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rbp	; current_40->content, <retval>
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	%r12, %rsi	; import_name,
	movq	0(%rbp), %rdi	; current_name_41->name, current_name_41->name
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	; tmp165
	je	.L131	;,
; src/helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	8(%r13), %rbx	; scope_44(D)->names, _12
; src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	;, _12->head
; src/helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	;, new_node_60->next
; src/helper.c:17:     new_node->content = content;
	movq	%rbp, 8(%rax)	; <retval>, new_node_60->content
; src/helper.c:23:     if (list->head == 0) {
	je	.L132	;,
; src/helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; _12->tail, _12->tail
	movq	%rax, (%rdx)	; new_node, _62->next
; src/helper.c:28:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, _12->tail
.L107:
; src/helper.c:220: }
	addq	$1048, %rsp	;,
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
.L128:
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	leaq	.LC15(%rip), %rsi	;, tmp110
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	; tmp158
	je	.L133	;,
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	leaq	.LC16(%rip), %rsi	;, tmp115
	movq	%r12, %rdi	; import_name,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	; tmp159
	jne	.L111	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movabsq	$8241920901561659182, %rax	;, tmp170
	leaq	16(%rsp), %rbx	;, tmp154
	movq	%rax, 16(%rsp)	; tmp170, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rax	;, tmp171
	movq	%rax, 21(%rsp)	; tmp171, MEM <char[1:13]> [(void *)&filename]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L110	;
	.p2align 4,,10
	.p2align 3
.L133:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movabsq	$8246143026212319022, %rax	;, tmp168
	leaq	16(%rsp), %rbx	;, tmp154
	movq	%rax, 16(%rsp)	; tmp168, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rax	;, tmp169
	movq	%rax, 23(%rsp)	; tmp169, MEM <char[1:15]> [(void *)&filename]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L110	;
	.p2align 4,,10
	.p2align 3
.L132:
; src/helper.c:24:         list->head = new_node;
	movq	%rax, %xmm0	; new_node, tmp151
	punpcklqdq	%xmm0, %xmm0	; tmp151
	movups	%xmm0, (%rbx)	; tmp151, MEM <vector(2) long unsigned int> [(struct Node * *)_12]
	jmp	.L107	;
.L111:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	16(%rsp), %rcx	;, tmp119
	leaq	.LC17(%rip), %rdx	;, tmp121
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L112:
; src/helper.c:181:             return 0;
	xorl	%ebp, %ebp	; <retval>
	jmp	.L107	;
	.p2align 4,,10
	.p2align 3
.L130:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbx, %rcx	; tmp154,
	xorl	%eax, %eax	;
; src/helper.c:181:             return 0;
	xorl	%ebp, %ebp	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC24(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L107	;
.L129:
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbx, %rcx	; tmp154,
	xorl	%eax, %eax	;
; src/helper.c:181:             return 0;
	xorl	%ebp, %ebp	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC21(%rip), %rdx	;, tmp137
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L107	;
	.size	parse_import_file, .-parse_import_file
	.p2align 4
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx	;
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
; src/helper.c:223: OperatorType string_to_operator(string str) {
	movq	%rdi, %rbx	; tmp144, str
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp145
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	;, <retval>
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	; tmp145
	jne	.L134	;,
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp146
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, <retval>
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	; tmp146
	jne	.L134	;,
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp147
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, <retval>
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	; tmp147
	jne	.L134	;,
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp148
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, <retval>
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	; tmp148
	jne	.L134	;,
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp149
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, <retval>
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	; tmp149
	jne	.L134	;,
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp150
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, <retval>
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	; tmp150
	jne	.L134	;,
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp151
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, <retval>
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	; tmp151
	jne	.L134	;,
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp152
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, <retval>
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	; tmp152
	jne	.L134	;,
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp153
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, <retval>
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	; tmp153
	jne	.L134	;,
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp154
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, <retval>
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	; tmp154
	jne	.L134	;,
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp155
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, <retval>
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	; tmp155
	jne	.L134	;,
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp156
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, <retval>
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	; tmp156
	jne	.L134	;,
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp157
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, <retval>
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	; tmp157
	jne	.L134	;,
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp158
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, <retval>
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	; tmp158
	jne	.L134	;,
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp159
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	; <retval>
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	; tmp159
	jne	.L134	;,
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp160
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, <retval>
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	; tmp160
	jne	.L134	;,
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	; tmp161
	jne	.L152	;,
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	; tmp162
	jne	.L153	;,
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	;, _38
	sbbl	%eax, %eax	; <retval>
	andl	$15, %eax	;, <retval>
	addl	$4, %eax	;, <retval>
.L134:
; src/helper.c:244: }
	popq	%rbx	;
	ret	
.L152:
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, <retval>
; src/helper.c:244: }
	popq	%rbx	;
	ret	
.L153:
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, <retval>
; src/helper.c:244: }
	popq	%rbx	;
	ret	
	.size	string_to_operator, .-string_to_operator
	.p2align 4
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
; src/helper.c:246: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	; <retval>
	cmpl	$18, %edi	;, op
	ja	.L156	;,
	movl	%edi, %edi	; op, op
	leaq	CSWTCH.66(%rip), %rax	;, tmp84
	movl	(%rax,%rdi,4), %eax	; CSWTCH.66[op_2(D)], <retval>
.L156:
; src/helper.c:276: }
	ret	
	.size	operator_precedence, .-operator_precedence
	.section	.text.unlikely,"ax",@progbits
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
; src/helper.c:279:     switch (op) {
	cmpl	$18, %edi	;, op
	ja	.L181	;,
	leaq	.L162(%rip), %rdx	;, tmp85
	movl	%edi, %edi	; op, op
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L162:
	.long	.L180-.L162
	.long	.L179-.L162
	.long	.L178-.L162
	.long	.L177-.L162
	.long	.L176-.L162
	.long	.L175-.L162
	.long	.L174-.L162
	.long	.L173-.L162
	.long	.L172-.L162
	.long	.L171-.L162
	.long	.L170-.L162
	.long	.L169-.L162
	.long	.L168-.L162
	.long	.L167-.L162
	.long	.L166-.L162
	.long	.L165-.L162
	.long	.L164-.L162
	.long	.L163-.L162
	.long	.L161-.L162
	.text
	.p2align 4,,10
	.p2align 3
.L163:
; src/helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L164:
; src/helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L165:
; src/helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L166:
; src/helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L167:
; src/helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L168:
; src/helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L169:
; src/helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L170:
; src/helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L171:
; src/helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L172:
; src/helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L173:
; src/helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L174:
; src/helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L175:
; src/helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L176:
; src/helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L177:
; src/helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L178:
; src/helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L179:
; src/helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L180:
; src/helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L161:
; src/helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, <retval>
	ret	
	.section	.text.unlikely
	.type	operator_to_string.cold, @function
operator_to_string.cold:
.L181:
; src/helper.c:279:     switch (op) {
	xorl	%eax, %eax	; <retval>
	ret	
	.text
	.size	operator_to_string, .-operator_to_string
	.section	.text.unlikely
	.size	operator_to_string.cold, .-operator_to_string.cold
.LCOLDE25:
	.text
.LHOTE25:
	.section	.rodata
	.align 32
	.type	CSWTCH.66, @object
	.size	CSWTCH.66, 76
CSWTCH.66:
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
