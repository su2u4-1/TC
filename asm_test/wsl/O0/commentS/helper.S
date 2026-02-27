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
; src/helper.c:9:     new_list->head = 0;
	movq	-8(%rbp), %rax	; new_list, tmp85
	movq	$0, (%rax)	;, new_list_3->head
; src/helper.c:10:     new_list->tail = 0;
	movq	-8(%rbp), %rax	; new_list, tmp86
	movq	$0, 8(%rax)	;, new_list_3->tail
; src/helper.c:11:     return new_list;
	movq	-8(%rbp), %rax	; new_list, _6
; src/helper.c:12: }
	leave	
	ret	
	.size	create_list, .-create_list
	.globl	create_node
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
; src/helper.c:16:     new_node->next = 0;
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
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; list, list
	movq	%rsi, -32(%rbp)	; item, item
; src/helper.c:22:     Node* new_node = create_node(item);
	movq	-32(%rbp), %rax	; item, tmp84
	movq	%rax, %rdi	; tmp84,
	call	create_node	;
	movq	%rax, -8(%rbp)	; tmp85, new_node
; src/helper.c:23:     if (list->head == 0) {
	movq	-24(%rbp), %rax	; list, tmp86
	movq	(%rax), %rax	; list_8(D)->head, _1
; src/helper.c:23:     if (list->head == 0) {
	testq	%rax, %rax	; _1
	jne	.L6	;,
; src/helper.c:24:         list->head = new_node;
	movq	-24(%rbp), %rax	; list, tmp87
	movq	-8(%rbp), %rdx	; new_node, tmp88
	movq	%rdx, (%rax)	; tmp88, list_8(D)->head
; src/helper.c:25:         list->tail = new_node;
	movq	-24(%rbp), %rax	; list, tmp89
	movq	-8(%rbp), %rdx	; new_node, tmp90
	movq	%rdx, 8(%rax)	; tmp90, list_8(D)->tail
; src/helper.c:30: }
	jmp	.L8	;
.L6:
; src/helper.c:27:         list->tail->next = new_node;
	movq	-24(%rbp), %rax	; list, tmp91
	movq	8(%rax), %rax	; list_8(D)->tail, _2
; src/helper.c:27:         list->tail->next = new_node;
	movq	-8(%rbp), %rdx	; new_node, tmp92
	movq	%rdx, (%rax)	; tmp92, _2->next
; src/helper.c:28:         list->tail = new_node;
	movq	-24(%rbp), %rax	; list, tmp93
	movq	-8(%rbp), %rdx	; new_node, tmp94
	movq	%rdx, 8(%rax)	; tmp94, list_8(D)->tail
.L8:
; src/helper.c:30: }
	nop	
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
; src/helper.c:33:     list() new_list = create_list();
	call	create_list	;
	movq	%rax, -8(%rbp)	; tmp86, new_list
; src/helper.c:34:     new_list->head = original->head;
	movq	-24(%rbp), %rax	; original, tmp87
	movq	(%rax), %rdx	; original_6(D)->head, _1
; src/helper.c:34:     new_list->head = original->head;
	movq	-8(%rbp), %rax	; new_list, tmp88
	movq	%rdx, (%rax)	; _1, new_list_5->head
; src/helper.c:35:     new_list->tail = original->tail;
	movq	-24(%rbp), %rax	; original, tmp89
	movq	8(%rax), %rdx	; original_6(D)->tail, _2
; src/helper.c:35:     new_list->tail = original->tail;
	movq	-8(%rbp), %rax	; new_list, tmp90
	movq	%rdx, 8(%rax)	; _2, new_list_5->tail
; src/helper.c:36:     return new_list;
	movq	-8(%rbp), %rax	; new_list, _9
; src/helper.c:37: }
	leave	
	ret	
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -24(%rbp)	; list, list
; src/helper.c:40:     if (list->head == 0)
	movq	-24(%rbp), %rax	; list, tmp87
	movq	(%rax), %rax	; list_8(D)->head, _1
; src/helper.c:40:     if (list->head == 0)
	testq	%rax, %rax	; _1
	jne	.L12	;,
; src/helper.c:41:         return 0;
	movl	$0, %eax	;, _4
	jmp	.L13	;
.L12:
; src/helper.c:42:     Node* head_node = list->head;
	movq	-24(%rbp), %rax	; list, tmp88
	movq	(%rax), %rax	; list_8(D)->head, tmp89
	movq	%rax, -8(%rbp)	; tmp89, head_node
; src/helper.c:43:     list->head = head_node->next;
	movq	-8(%rbp), %rax	; head_node, tmp90
	movq	(%rax), %rdx	; head_node_9->next, _2
; src/helper.c:43:     list->head = head_node->next;
	movq	-24(%rbp), %rax	; list, tmp91
	movq	%rdx, (%rax)	; _2, list_8(D)->head
; src/helper.c:44:     if (list->head == 0)
	movq	-24(%rbp), %rax	; list, tmp92
	movq	(%rax), %rax	; list_8(D)->head, _3
; src/helper.c:44:     if (list->head == 0)
	testq	%rax, %rax	; _3
	jne	.L14	;,
; src/helper.c:45:         list->tail = 0;
	movq	-24(%rbp), %rax	; list, tmp93
	movq	$0, 8(%rax)	;, list_8(D)->tail
.L14:
; src/helper.c:46:     return head_node->content;
	movq	-8(%rbp), %rax	; head_node, tmp94
	movq	8(%rax), %rax	; head_node_9->content, _4
.L13:
; src/helper.c:47: }
	popq	%rbp	;
	ret	
	.size	list_pop, .-list_pop
	.section	.rodata
	.align 8
.LC0:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
.LC1:
	.string	"type\n"
.LC2:
	.string	"variable\n"
.LC3:
	.string	"function\n"
.LC4:
	.string	"method\n"
.LC5:
	.string	"class\n"
.LC6:
	.string	"attribute\n"
.LC7:
	.string	"unknown\n"
	.align 8
.LC8:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
	.align 8
.LC9:
	.string	"Error creating name: unknown NameType %u\n"
	.text
	.globl	create_name
	.type	create_name, @function
create_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movl	%esi, -28(%rbp)	; kind, kind
	movq	%rdx, -40(%rbp)	; name_info, name_info
	movq	%rcx, -48(%rbp)	; scope_info, scope_info
	movq	%r8, -56(%rbp)	; scope, scope
; src/helper.c:52:     Name* result = search(scope, name);
	movq	-24(%rbp), %rdx	; name, tmp99
	movq	-56(%rbp), %rax	; scope, tmp100
	movq	%rdx, %rsi	; tmp99,
	movq	%rax, %rdi	; tmp100,
	call	search	;
	movq	%rax, -8(%rbp)	; tmp101, result
; src/helper.c:53:     if (result != NULL) {
	cmpq	$0, -8(%rbp)	;, result
	je	.L16	;,
; src/helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	movq	stderr(%rip), %rax	; stderr, stderr.0_1
	movq	-24(%rbp), %rdx	; name, tmp102
	leaq	.LC0(%rip), %rcx	;, tmp103
	movq	%rcx, %rsi	; tmp103,
	movq	%rax, %rdi	; stderr.0_1,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:55:         switch (result->kind) {
	movq	-8(%rbp), %rax	; result, tmp104
	movl	24(%rax), %eax	; result_25->kind, _2
; src/helper.c:55:         switch (result->kind) {
	cmpl	$5, %eax	;, _2
	ja	.L17	;,
	movl	%eax, %eax	; _2, tmp105
	leaq	0(,%rax,4), %rdx	;, tmp106
	leaq	.L19(%rip), %rax	;, tmp107
	movl	(%rdx,%rax), %eax	;, tmp108
	cltq
	leaq	.L19(%rip), %rdx	;, tmp111
	addq	%rdx, %rax	; tmp111, tmp110
	jmp	*%rax	; tmp110
	.section	.rodata
	.align 4
	.align 4
.L19:
	.long	.L24-.L19
	.long	.L23-.L19
	.long	.L22-.L19
	.long	.L21-.L19
	.long	.L20-.L19
	.long	.L18-.L19
	.text
.L24:
; src/helper.c:57:                 fprintf(stderr, "type\n");
	movq	stderr(%rip), %rax	; stderr, stderr.1_3
	movq	%rax, %rcx	; stderr.1_3,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:58:                 break;
	jmp	.L16	;
.L23:
; src/helper.c:60:                 fprintf(stderr, "variable\n");
	movq	stderr(%rip), %rax	; stderr, stderr.2_4
	movq	%rax, %rcx	; stderr.2_4,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:61:                 break;
	jmp	.L16	;
.L22:
; src/helper.c:63:                 fprintf(stderr, "function\n");
	movq	stderr(%rip), %rax	; stderr, stderr.3_5
	movq	%rax, %rcx	; stderr.3_5,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:64:                 break;
	jmp	.L16	;
.L21:
; src/helper.c:66:                 fprintf(stderr, "method\n");
	movq	stderr(%rip), %rax	; stderr, stderr.4_6
	movq	%rax, %rcx	; stderr.4_6,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:67:                 break;
	jmp	.L16	;
.L20:
; src/helper.c:69:                 fprintf(stderr, "class\n");
	movq	stderr(%rip), %rax	; stderr, stderr.5_7
	movq	%rax, %rcx	; stderr.5_7,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rax	;, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:70:                 break;
	jmp	.L16	;
.L18:
; src/helper.c:72:                 fprintf(stderr, "attribute\n");
	movq	stderr(%rip), %rax	; stderr, stderr.6_8
	movq	%rax, %rcx	; stderr.6_8,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rax	;, tmp117
	movq	%rax, %rdi	; tmp117,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:73:                 break;
	jmp	.L16	;
.L17:
; src/helper.c:75:                 fprintf(stderr, "unknown\n");
	movq	stderr(%rip), %rax	; stderr, stderr.7_9
	movq	%rax, %rcx	; stderr.7_9,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp118
	movq	%rax, %rdi	; tmp118,
	call	*fwrite@GOTPCREL(%rip)	;
; src/helper.c:76:                 break;
	nop	
.L16:
; src/helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp119, new_name
; src/helper.c:80:     new_name->name = name;
	movq	-16(%rbp), %rax	; new_name, tmp120
	movq	-24(%rbp), %rdx	; name, tmp121
	movq	%rdx, (%rax)	; tmp121, new_name_35->name
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, id_counter.8_10
	addq	$1, %rax	;, _11
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	id_counter.0(%rip), %rdx	; id_counter, id_counter.9_12
	movq	-16(%rbp), %rax	; new_name, tmp122
	movq	%rdx, 8(%rax)	; id_counter.9_12, new_name_35->id
; src/helper.c:82:     new_name->kind = kind;
	movq	-16(%rbp), %rax	; new_name, tmp123
	movl	-28(%rbp), %edx	; kind, tmp124
	movl	%edx, 24(%rax)	; tmp124, new_name_35->kind
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$1, -28(%rbp)	;, kind
	je	.L25	;,
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$5, -28(%rbp)	;, kind
	je	.L25	;,
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$2, -28(%rbp)	;, kind
	je	.L25	;,
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$3, -28(%rbp)	;, kind
	jne	.L26	;,
.L25:
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpq	$0, -40(%rbp)	;, name_info
	je	.L26	;,
; src/helper.c:84:         new_name->info.type = name_info;
	movq	-16(%rbp), %rax	; new_name, tmp125
	movq	-40(%rbp), %rdx	; name_info, tmp126
	movq	%rdx, 16(%rax)	; tmp126, new_name_35->info.type
	jmp	.L27	;
.L26:
; src/helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, -28(%rbp)	;, kind
	jne	.L28	;,
; src/helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpq	$0, -48(%rbp)	;, scope_info
	je	.L28	;,
; src/helper.c:86:         new_name->info.scope = scope_info;
	movq	-16(%rbp), %rax	; new_name, tmp127
	movq	-48(%rbp), %rdx	; scope_info, tmp128
	movq	%rdx, 16(%rax)	; tmp128, new_name_35->info.scope
	jmp	.L27	;
.L28:
; src/helper.c:87:     else if (kind == NAME_TYPE)
	cmpl	$0, -28(%rbp)	;, kind
	jne	.L29	;,
; src/helper.c:88:         new_name->info.type = NULL;
	movq	-16(%rbp), %rax	; new_name, tmp129
	movq	$0, 16(%rax)	;, new_name_35->info.type
	jmp	.L27	;
.L29:
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	cmpq	$0, -40(%rbp)	;, name_info
	jne	.L30	;,
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	cmpq	$0, -48(%rbp)	;, scope_info
	jne	.L30	;,
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	cmpl	$0, -28(%rbp)	;, kind
	je	.L30	;,
; src/helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.10_13
	movl	-28(%rbp), %edx	; kind, tmp130
	leaq	.LC8(%rip), %rcx	;, tmp131
	movq	%rcx, %rsi	; tmp131,
	movq	%rax, %rdi	; stderr.10_13,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L31	;
.L30:
; src/helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.11_14
	movl	-28(%rbp), %edx	; kind, tmp132
	leaq	.LC9(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.11_14,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L31:
; src/helper.c:94:         return NULL;
	movl	$0, %eax	;, _16
	jmp	.L32	;
.L27:
; src/helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	-56(%rbp), %rax	; scope, tmp134
	movq	8(%rax), %rax	; scope_22(D)->names, _15
	movq	-16(%rbp), %rdx	; new_name, tmp135
	movq	%rdx, %rsi	; tmp135,
	movq	%rax, %rdi	; _15,
	call	list_append	;
; src/helper.c:97:     return new_name;
	movq	-16(%rbp), %rax	; new_name, _16
.L32:
; src/helper.c:98: }
	leave	
	ret	
	.size	create_name, .-create_name
	.globl	create_scope
	.type	create_scope, @function
create_scope:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; parent, parent
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, new_scope
; src/helper.c:102:     Scope* scope_ptr = (new_scope);
	movq	-8(%rbp), %rax	; new_scope, tmp86
	movq	%rax, -16(%rbp)	; tmp86, scope_ptr
; src/helper.c:103:     scope_ptr->parent = parent;
	movq	-16(%rbp), %rax	; scope_ptr, tmp87
	movq	-24(%rbp), %rdx	; parent, tmp88
	movq	%rdx, (%rax)	; tmp88, scope_ptr_5->parent
; src/helper.c:104:     scope_ptr->names = create_list();
	call	create_list	;
; src/helper.c:104:     scope_ptr->names = create_list();
	movq	-16(%rbp), %rdx	; scope_ptr, tmp89
	movq	%rax, 8(%rdx)	; _1, scope_ptr_5->names
; src/helper.c:105:     return new_scope;
	movq	-8(%rbp), %rax	; new_scope, _10
; src/helper.c:106: }
	leave	
	ret	
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; scope, scope
	movq	%rsi, -64(%rbp)	; name, name
; src/helper.c:109:     Scope* scope_ptr = (scope);
	movq	-56(%rbp), %rax	; scope, tmp86
	movq	%rax, -8(%rbp)	; tmp86, scope_ptr
; src/helper.c:110:     while (scope_ptr != NULL) {
	jmp	.L36	;
.L41:
; src/helper.c:111:         list(Name*) names = scope_ptr->names;
	movq	-8(%rbp), %rax	; scope_ptr, tmp87
	movq	8(%rax), %rax	; scope_ptr_3->names, tmp88
	movq	%rax, -24(%rbp)	; tmp88, names
; src/helper.c:112:         Node* current = ((names))->head;
	movq	-24(%rbp), %rax	; names, tmp89
	movq	(%rax), %rax	; names_13->head, tmp90
	movq	%rax, -16(%rbp)	; tmp90, current
; src/helper.c:113:         while (current != 0) {
	jmp	.L37	;
.L40:
; src/helper.c:114:             Node* node_ptr = (current);
	movq	-16(%rbp), %rax	; current, tmp91
	movq	%rax, -32(%rbp)	; tmp91, node_ptr
; src/helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	-32(%rbp), %rax	; node_ptr, tmp92
	movq	8(%rax), %rax	; node_ptr_16->content, tmp93
	movq	%rax, -40(%rbp)	; tmp93, current_name
; src/helper.c:116:             if (string_equal(current_name->name, name))
	movq	-40(%rbp), %rax	; current_name, tmp94
	movq	(%rax), %rax	; current_name_17->name, _1
	movq	-64(%rbp), %rdx	; name, tmp95
	movq	%rdx, %rsi	; tmp95,
	movq	%rax, %rdi	; _1,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	; _2
	je	.L38	;,
; src/helper.c:117:                 return current_name;
	movq	-40(%rbp), %rax	; current_name, _5
	jmp	.L39	;
.L38:
; src/helper.c:118:             current = node_ptr->next;
	movq	-32(%rbp), %rax	; node_ptr, tmp96
	movq	(%rax), %rax	; node_ptr_16->next, tmp97
	movq	%rax, -16(%rbp)	; tmp97, current
.L37:
; src/helper.c:113:         while (current != 0) {
	cmpq	$0, -16(%rbp)	;, current
	jne	.L40	;,
; src/helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	-8(%rbp), %rax	; scope_ptr, tmp98
	movq	(%rax), %rax	; scope_ptr_3->parent, tmp99
	movq	%rax, -8(%rbp)	; tmp99, scope_ptr
.L36:
; src/helper.c:110:     while (scope_ptr != NULL) {
	cmpq	$0, -8(%rbp)	;, scope_ptr
	jne	.L41	;,
; src/helper.c:122:     return NULL;
	movl	$0, %eax	;, _5
.L39:
; src/helper.c:123: }
	leave	
	ret	
	.size	search, .-search
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; type, type
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rdx	; INT_KEYWORD, INT_KEYWORD.13_1
	movq	-8(%rbp), %rax	; type, tmp95
	movq	%rdx, %rsi	; INT_KEYWORD.13_1,
	movq	%rax, %rdi	; tmp95,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _2
	jne	.L43	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rdx	; FLOAT_KEYWORD, FLOAT_KEYWORD.14_3
	movq	-8(%rbp), %rax	; type, tmp96
	movq	%rdx, %rsi	; FLOAT_KEYWORD.14_3,
	movq	%rax, %rdi	; tmp96,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _4
	jne	.L43	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rdx	; STRING_KEYWORD, STRING_KEYWORD.15_5
	movq	-8(%rbp), %rax	; type, tmp97
	movq	%rdx, %rsi	; STRING_KEYWORD.15_5,
	movq	%rax, %rdi	; tmp97,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _6
	jne	.L43	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rdx	; BOOL_KEYWORD, BOOL_KEYWORD.16_7
	movq	-8(%rbp), %rax	; type, tmp98
	movq	%rdx, %rsi	; BOOL_KEYWORD.16_7,
	movq	%rax, %rdi	; tmp98,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _8
	jne	.L43	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	VOID_KEYWORD(%rip), %rdx	; VOID_KEYWORD, VOID_KEYWORD.17_9
	movq	-8(%rbp), %rax	; type, tmp99
	movq	%rdx, %rsi	; VOID_KEYWORD.17_9,
	movq	%rax, %rdi	; tmp99,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; _10
	je	.L44	;,
.L43:
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.12_11
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L45	;
.L44:
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$0, %eax	;, iftmp.12_11
.L45:
; src/helper.c:127: }
	leave	
	ret	
	.size	is_builtin_type, .-is_builtin_type
	.globl	is_type
	.type	is_type, @function
is_type:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -24(%rbp)	; type, type
; src/helper.c:130:     Name* type_ptr = (type);
	movq	-24(%rbp), %rax	; type, tmp87
	movq	%rax, -8(%rbp)	; tmp87, type_ptr
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movq	-8(%rbp), %rax	; type_ptr, tmp88
	movl	24(%rax), %eax	; type_ptr_5->kind, _1
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	testl	%eax, %eax	; _1
	je	.L48	;,
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movq	-8(%rbp), %rax	; type_ptr, tmp89
	movl	24(%rax), %eax	; type_ptr_5->kind, _2
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	cmpl	$4, %eax	;, _2
	jne	.L49	;,
.L48:
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movl	$1, %eax	;, iftmp.18_3
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	jmp	.L50	;
.L49:
; src/helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movl	$0, %eax	;, iftmp.18_3
.L50:
; src/helper.c:132: }
	popq	%rbp	;
	ret	
	.size	is_type, .-is_type
	.section	.rodata
	.align 8
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; message, message
	movq	%rsi, -16(%rbp)	; token, token
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	-16(%rbp), %rax	; token, tmp87
	movq	16(%rax), %rax	; token_7(D)->column, _1
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rcx	;, _2
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	-16(%rbp), %rax	; token, tmp88
	movq	8(%rax), %rax	; token_7(D)->line, _3
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rdx	;, _4
	movq	stderr(%rip), %rax	; stderr, stderr.19_5
	movq	-8(%rbp), %rsi	; message, tmp89
	movq	%rsi, %r8	; tmp89,
	leaq	.LC10(%rip), %rsi	;, tmp90
	movq	%rax, %rdi	; stderr.19_5,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:136: }
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
	movl	%edx, %eax	; value, tmp99
	movb	%al, -36(%rbp)	; tmp100, value
; src/helper.c:139:     char word = bool_list[index / 8];
	movq	-32(%rbp), %rax	; index, tmp101
	shrq	$3, %rax	;, tmp101
	movq	%rax, %rdx	; tmp101, _1
; src/helper.c:139:     char word = bool_list[index / 8];
	movq	-24(%rbp), %rax	; bool_list, tmp102
	addq	%rdx, %rax	; _1, _2
; src/helper.c:139:     char word = bool_list[index / 8];
	movzbl	(%rax), %eax	; *_2, tmp103
	movb	%al, -1(%rbp)	; tmp103, word
; src/helper.c:140:     if (value)
	cmpb	$0, -36(%rbp)	;, value
	je	.L54	;,
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	-32(%rbp), %rax	; index, tmp104
	andl	$7, %eax	;, _4
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %edx	;, tmp105
	movl	%eax, %ecx	; _4, tmp115
	sall	%cl, %edx	; tmp115, tmp105
	movl	%edx, %eax	; tmp105, _5
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%eax, %ecx	; _5, _6
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	-32(%rbp), %rax	; index, tmp106
	shrq	$3, %rax	;, tmp106
	movq	%rax, %rdx	; tmp106, _7
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	-24(%rbp), %rax	; bool_list, tmp107
	addq	%rax, %rdx	; tmp107, _8
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ecx, %eax	; _6, _6
	orb	-1(%rbp), %al	; word, _6
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movb	%al, (%rdx)	; _9, *_8
; src/helper.c:144: }
	jmp	.L56	;
.L54:
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	-32(%rbp), %rax	; index, tmp108
	andl	$7, %eax	;, _11
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	$1, %edx	;, tmp109
	movl	%eax, %ecx	; _11, tmp119
	sall	%cl, %edx	; tmp119, tmp109
	movl	%edx, %eax	; tmp109, _12
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	; _14
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	-32(%rbp), %rdx	; index, tmp110
	movq	%rdx, %rcx	; tmp110, tmp110
	shrq	$3, %rcx	;, tmp110
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	-24(%rbp), %rdx	; bool_list, tmp111
	addq	%rcx, %rdx	; _15, _16
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	andb	-1(%rbp), %al	; word, _17
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movb	%al, (%rdx)	; _17, *_16
.L56:
; src/helper.c:144: }
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
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	-16(%rbp), %rax	; index, tmp93
	shrq	$3, %rax	;, tmp93
	movq	%rax, %rdx	; tmp93, _1
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	-8(%rbp), %rax	; bool_list, tmp94
	addq	%rdx, %rax	; _1, _2
	movzbl	(%rax), %eax	; *_2, _3
	movsbl	%al, %edx	; _3, _4
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	-16(%rbp), %rax	; index, tmp95
	andl	$7, %eax	;, _6
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%eax, %ecx	; _6, tmp100
	sarl	%cl, %edx	; tmp100, _4
	movl	%edx, %eax	; _4, _7
	andl	$1, %eax	;, _8
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	testl	%eax, %eax	; _8
	setne	%al	;, _9
; src/helper.c:148: }
	popq	%rbp	;
	ret	
	.size	get_bool_list, .-get_bool_list
	.section	.rodata
.LC11:
	.string	"\342\224\202   "
.LC12:
	.string	"    "
.LC13:
	.string	"\342\224\224\342\224\200\342\224\200 "
.LC14:
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
	movl	%edx, %eax	; is_last, tmp89
	movq	%rcx, -48(%rbp)	; parser, parser
	movb	%al, -36(%rbp)	; tmp90, is_last
; src/helper.c:151:     Parser* parser_ptr = (parser);
	movq	-48(%rbp), %rax	; parser, tmp91
	movq	%rax, -16(%rbp)	; tmp91, parser_ptr
; src/helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	cmpb	$0, -36(%rbp)	;, is_last
	sete	%al	;, _1
	movzbl	%al, %edx	; _1, _2
; src/helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	movq	-16(%rbp), %rax	; parser_ptr, tmp92
	leaq	3(%rax), %rcx	;, _3
; src/helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	movq	-32(%rbp), %rax	; indent, tmp93
	movq	%rax, %rsi	; tmp93,
	movq	%rcx, %rdi	; _3,
	call	set_bool_list	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movq	$1, -8(%rbp)	;, i
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	jmp	.L60	;
.L63:
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-16(%rbp), %rax	; parser_ptr, tmp94
	leaq	3(%rax), %rdx	;, _4
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-8(%rbp), %rax	; i, tmp95
	movq	%rax, %rsi	; tmp95,
	movq	%rdx, %rdi	; _4,
	call	get_bool_list	;
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	%al, %al	; _5
	je	.L61	;,
	leaq	.LC11(%rip), %rax	;, iftmp.20_7
	jmp	.L62	;
.L61:
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %rax	;, iftmp.20_7
.L62:
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-24(%rbp), %rdx	; out, tmp96
	movq	%rax, %rsi	; iftmp.20_7,
	movq	%rdx, %rdi	; tmp96,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, -8(%rbp)	;, i
.L60:
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movq	-8(%rbp), %rax	; i, tmp97
	cmpq	-32(%rbp), %rax	; indent, tmp97
	jb	.L63	;,
; src/helper.c:155:     if (indent > 0)
	cmpq	$0, -32(%rbp)	;, indent
	je	.L67	;,
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, -36(%rbp)	;, is_last
	je	.L65	;,
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC13(%rip), %rax	;, iftmp.21_8
	jmp	.L66	;
.L65:
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC14(%rip), %rax	;, iftmp.21_8
.L66:
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	movq	-24(%rbp), %rdx	; out, tmp98
	movq	%rax, %rsi	; iftmp.21_8,
	movq	%rdx, %rdi	; tmp98,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L67:
; src/helper.c:157: }
	nop	
	leave	
	ret	
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, new_parser
; src/helper.c:161:     Parser* parser_ptr = (new_parser);
	movq	-8(%rbp), %rax	; new_parser, tmp85
	movq	%rax, -16(%rbp)	; tmp85, parser_ptr
; src/helper.c:162:     parser_ptr->in_function = false;
	movq	-16(%rbp), %rax	; parser_ptr, tmp86
	movb	$0, (%rax)	;, parser_ptr_4->in_function
; src/helper.c:163:     parser_ptr->in_method = false;
	movq	-16(%rbp), %rax	; parser_ptr, tmp87
	movb	$0, 1(%rax)	;, parser_ptr_4->in_method
; src/helper.c:164:     parser_ptr->in_loop = false;
	movq	-16(%rbp), %rax	; parser_ptr, tmp88
	movb	$0, 2(%rax)	;, parser_ptr_4->in_loop
; src/helper.c:165:     return new_parser;
	movq	-8(%rbp), %rax	; new_parser, _8
; src/helper.c:166: }
	leave	
	ret	
	.size	create_parser, .-create_parser
	.section	.rodata
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
	.align 8
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
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
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%r12	;
	pushq	%rbx	;
	subq	$1152, %rsp	;,
	movq	%rdi, -1144(%rbp)	; import_name, import_name
	movq	%rsi, -1152(%rbp)	; source, source
	movq	%rdx, -1160(%rbp)	; scope, scope
; src/helper.c:169:     Name* name = 0;
	movq	$0, -24(%rbp)	;, name
; src/helper.c:173:     filename[0] = '\0';
	movb	$0, -1120(%rbp)	;, filename[0]
; src/helper.c:174:     if (source == 0) {
	cmpq	$0, -1152(%rbp)	;, source
	jne	.L71	;,
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	movq	-1144(%rbp), %rax	; import_name, tmp97
	leaq	.LC15(%rip), %rdx	;, tmp98
	movq	%rdx, %rsi	; tmp98,
	movq	%rax, %rdi	; tmp97,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	; _1
	jne	.L72	;,
; src/helper.c:176:             strcpy(filename, "./std/print.tc");
	leaq	-1120(%rbp), %rax	;, tmp99
	movabsq	$8246143026212319022, %rbx	;, tmp151
	movq	%rbx, (%rax)	; tmp151, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rbx	;, tmp152
	movq	%rbx, 7(%rax)	; tmp152, MEM <char[1:15]> [(void *)&filename]
	jmp	.L73	;
.L72:
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	movq	-1144(%rbp), %rax	; import_name, tmp100
	leaq	.LC16(%rip), %rdx	;, tmp101
	movq	%rdx, %rsi	; tmp101,
	movq	%rax, %rdi	; tmp100,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	; _2
	jne	.L74	;,
; src/helper.c:178:             strcpy(filename, "./std/arr.tc");
	leaq	-1120(%rbp), %rax	;, tmp102
	movabsq	$8241920901561659182, %rbx	;, tmp153
	movq	%rbx, (%rax)	; tmp153, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rbx	;, tmp154
	movq	%rbx, 5(%rax)	; tmp154, MEM <char[1:13]> [(void *)&filename]
	jmp	.L73	;
.L74:
; src/helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.22_3
	leaq	-1120(%rbp), %rdx	;, tmp103
	leaq	.LC17(%rip), %rcx	;, tmp104
	movq	%rcx, %rsi	; tmp104,
	movq	%rax, %rdi	; stderr.22_3,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:181:             return 0;
	movl	$0, %eax	;, _16
	jmp	.L83	;
.L71:
; src/helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	movq	-1152(%rbp), %rcx	; source, tmp105
	leaq	-1120(%rbp), %rdx	;, tmp106
	leaq	-1120(%rbp), %rax	;, tmp107
	movl	$1024, %esi	;,
	movq	%rax, %rdi	; tmp107,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	leaq	-1120(%rbp), %rdx	;, tmp108
	leaq	-1120(%rbp), %rax	;, tmp109
	leaq	.LC18(%rip), %rcx	;, tmp110
	movl	$1024, %esi	;,
	movq	%rax, %rdi	; tmp109,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	-1144(%rbp), %rcx	; import_name, tmp111
	leaq	-1120(%rbp), %rdx	;, tmp112
	leaq	-1120(%rbp), %rax	;, tmp113
	movl	$1024, %esi	;,
	movq	%rax, %rdi	; tmp113,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	leaq	-1120(%rbp), %rdx	;, tmp114
	leaq	-1120(%rbp), %rax	;, tmp115
	leaq	.LC19(%rip), %rcx	;, tmp116
	movl	$1024, %esi	;,
	movq	%rax, %rdi	; tmp115,
	call	*string_append@GOTPCREL(%rip)	;
.L73:
; src/helper.c:189:     openfile = fopen(filename, "r");
	leaq	-1120(%rbp), %rax	;, tmp117
	leaq	.LC20(%rip), %rdx	;, tmp118
	movq	%rdx, %rsi	; tmp118,
	movq	%rax, %rdi	; tmp117,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp119, openfile
; src/helper.c:190:     if (openfile == NULL) {
	cmpq	$0, -40(%rbp)	;, openfile
	jne	.L76	;,
; src/helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.23_4
	leaq	-1120(%rbp), %rdx	;, tmp120
	leaq	.LC21(%rip), %rcx	;, tmp121
	movq	%rcx, %rsi	; tmp121,
	movq	%rax, %rdi	; stderr.23_4,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:192:         return 0;
	movl	$0, %eax	;, _16
	jmp	.L83	;
.L76:
; src/helper.c:194:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	leaq	-1120(%rbp), %rax	;, tmp122
	movq	%rax, %rsi	; tmp122,
	leaq	.LC22(%rip), %rax	;, tmp123
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*printf@GOTPCREL(%rip)	;
; src/helper.c:195:     size_t length = 0;
	movq	$0, -1128(%rbp)	;, length
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	-1128(%rbp), %rdx	;, tmp124
	movq	-40(%rbp), %rax	; openfile, tmp125
	movq	%rdx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp125,
	call	*read_source@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp126, source_code
; src/helper.c:197:     fclose(openfile);
	movq	-40(%rbp), %rax	; openfile, tmp127
	movq	%rax, %rdi	; tmp127,
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	create_parser	;
	movq	%rax, %r12	;, _5
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	builtin_scope(%rip), %rbx	; builtin_scope, builtin_scope.24_6
	movq	-1128(%rbp), %rdx	; length, length.25_7
	movq	-48(%rbp), %rax	; source_code, tmp128
	movq	%rdx, %rsi	; length.25_7,
	movq	%rax, %rdi	; tmp128,
	call	*create_lexer@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%r12, %rdx	; _5,
	movq	%rbx, %rsi	; builtin_scope.24_6,
	movq	%rax, %rdi	; _8,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp129, code
; src/helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	leaq	-1120(%rbp), %rax	;, tmp130
	movq	%rax, %rsi	; tmp130,
	leaq	.LC23(%rip), %rax	;, tmp131
	movq	%rax, %rdi	; tmp131,
	movl	$0, %eax	;,
	call	*printf@GOTPCREL(%rip)	;
; src/helper.c:200:     if (code == 0) {
	cmpq	$0, -56(%rbp)	;, code
	jne	.L77	;,
; src/helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	stderr(%rip), %rax	; stderr, stderr.26_9
	leaq	-1120(%rbp), %rdx	;, tmp132
	leaq	.LC24(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.26_9,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/helper.c:202:         return 0;
	movl	$0, %eax	;, _16
	jmp	.L83	;
.L77:
; src/helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	-56(%rbp), %rax	; code, tmp134
	movq	8(%rax), %rax	; code_45->global_scope, _10
; src/helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rax), %rax	; _10->names, tmp135
	movq	%rax, -64(%rbp)	; tmp135, names
; src/helper.c:205:     Node* current = ((names))->head;
	movq	-64(%rbp), %rax	; names, tmp136
	movq	(%rax), %rax	; names_47->head, tmp137
	movq	%rax, -32(%rbp)	; tmp137, current
; src/helper.c:206:     while (current != 0) {
	jmp	.L78	;
.L81:
; src/helper.c:207:         Node* node_ptr = (current);
	movq	-32(%rbp), %rax	; current, tmp138
	movq	%rax, -72(%rbp)	; tmp138, node_ptr
; src/helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	-72(%rbp), %rax	; node_ptr, tmp139
	movq	8(%rax), %rax	; node_ptr_49->content, tmp140
	movq	%rax, -80(%rbp)	; tmp140, current_name
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	-80(%rbp), %rax	; current_name, tmp141
	movq	(%rax), %rax	; current_name_50->name, _11
	movq	-1144(%rbp), %rdx	; import_name, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _11,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	; _12
	je	.L79	;,
; src/helper.c:210:             name = current_name;
	movq	-80(%rbp), %rax	; current_name, tmp143
	movq	%rax, -24(%rbp)	; tmp143, name
; src/helper.c:211:             break;
	jmp	.L80	;
.L79:
; src/helper.c:213:         current = node_ptr->next;
	movq	-72(%rbp), %rax	; node_ptr, tmp144
	movq	(%rax), %rax	; node_ptr_49->next, tmp145
	movq	%rax, -32(%rbp)	; tmp145, current
.L78:
; src/helper.c:206:     while (current != 0) {
	cmpq	$0, -32(%rbp)	;, current
	jne	.L81	;,
.L80:
; src/helper.c:215:     if (name != 0) {
	cmpq	$0, -24(%rbp)	;, name
	je	.L82	;,
; src/helper.c:216:         Scope* scope_ptr = (scope);
	movq	-1160(%rbp), %rax	; scope, tmp146
	movq	%rax, -88(%rbp)	; tmp146, scope_ptr
; src/helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	-88(%rbp), %rax	; scope_ptr, tmp147
	movq	8(%rax), %rax	; scope_ptr_55->names, _13
	movq	-24(%rbp), %rdx	; name, tmp148
	movq	%rdx, %rsi	; tmp148,
	movq	%rax, %rdi	; _13,
	call	list_append	;
.L82:
; src/helper.c:219:     return name;
	movq	-24(%rbp), %rax	; name, _16
.L83:
; src/helper.c:220: }
	addq	$1152, %rsp	;,
	popq	%rbx	;
	popq	%r12	;
	popq	%rbp	;
	ret	
	.size	parse_import_file, .-parse_import_file
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; str, str
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	ASSIGN_SYMBOL(%rip), %rdx	; ASSIGN_SYMBOL, ASSIGN_SYMBOL.27_1
	movq	-8(%rbp), %rax	; str, tmp122
	movq	%rdx, %rsi	; ASSIGN_SYMBOL.27_1,
	movq	%rax, %rdi	; tmp122,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%al, %al	; _2
	je	.L85	;,
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	;, _39
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	jmp	.L86	;
.L85:
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rdx	; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.28_3
	movq	-8(%rbp), %rax	; str, tmp123
	movq	%rdx, %rsi	; ADD_ASSIGN_SYMBOL.28_3,
	movq	%rax, %rdi	; tmp123,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%al, %al	; _4
	je	.L87	;,
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, _39
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	jmp	.L86	;
.L87:
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rdx	; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.29_5
	movq	-8(%rbp), %rax	; str, tmp124
	movq	%rdx, %rsi	; SUB_ASSIGN_SYMBOL.29_5,
	movq	%rax, %rdi	; tmp124,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%al, %al	; _6
	je	.L88	;,
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, _39
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	jmp	.L86	;
.L88:
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rdx	; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.30_7
	movq	-8(%rbp), %rax	; str, tmp125
	movq	%rdx, %rsi	; MUL_ASSIGN_SYMBOL.30_7,
	movq	%rax, %rdi	; tmp125,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%al, %al	; _8
	je	.L89	;,
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, _39
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	jmp	.L86	;
.L89:
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rdx	; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.31_9
	movq	-8(%rbp), %rax	; str, tmp126
	movq	%rdx, %rsi	; DIV_ASSIGN_SYMBOL.31_9,
	movq	%rax, %rdi	; tmp126,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%al, %al	; _10
	je	.L90	;,
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, _39
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	jmp	.L86	;
.L90:
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rdx	; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.32_11
	movq	-8(%rbp), %rax	; str, tmp127
	movq	%rdx, %rsi	; MOD_ASSIGN_SYMBOL.32_11,
	movq	%rax, %rdi	; tmp127,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%al, %al	; _12
	je	.L91	;,
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, _39
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	jmp	.L86	;
.L91:
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rdx	; AND_SYMBOL, AND_SYMBOL.33_13
	movq	-8(%rbp), %rax	; str, tmp128
	movq	%rdx, %rsi	; AND_SYMBOL.33_13,
	movq	%rax, %rdi	; tmp128,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%al, %al	; _14
	je	.L92	;,
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, _39
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	jmp	.L86	;
.L92:
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rdx	; OR_SYMBOL, OR_SYMBOL.34_15
	movq	-8(%rbp), %rax	; str, tmp129
	movq	%rdx, %rsi	; OR_SYMBOL.34_15,
	movq	%rax, %rdi	; tmp129,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%al, %al	; _16
	je	.L93	;,
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, _39
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	jmp	.L86	;
.L93:
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rdx	; EQ_SYMBOL, EQ_SYMBOL.35_17
	movq	-8(%rbp), %rax	; str, tmp130
	movq	%rdx, %rsi	; EQ_SYMBOL.35_17,
	movq	%rax, %rdi	; tmp130,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%al, %al	; _18
	je	.L94	;,
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, _39
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	jmp	.L86	;
.L94:
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rdx	; NE_SYMBOL, NE_SYMBOL.36_19
	movq	-8(%rbp), %rax	; str, tmp131
	movq	%rdx, %rsi	; NE_SYMBOL.36_19,
	movq	%rax, %rdi	; tmp131,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%al, %al	; _20
	je	.L95	;,
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, _39
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	jmp	.L86	;
.L95:
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rdx	; LT_SYMBOL, LT_SYMBOL.37_21
	movq	-8(%rbp), %rax	; str, tmp132
	movq	%rdx, %rsi	; LT_SYMBOL.37_21,
	movq	%rax, %rdi	; tmp132,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%al, %al	; _22
	je	.L96	;,
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, _39
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	jmp	.L86	;
.L96:
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rdx	; GT_SYMBOL, GT_SYMBOL.38_23
	movq	-8(%rbp), %rax	; str, tmp133
	movq	%rdx, %rsi	; GT_SYMBOL.38_23,
	movq	%rax, %rdi	; tmp133,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%al, %al	; _24
	je	.L97	;,
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, _39
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	jmp	.L86	;
.L97:
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rdx	; LE_SYMBOL, LE_SYMBOL.39_25
	movq	-8(%rbp), %rax	; str, tmp134
	movq	%rdx, %rsi	; LE_SYMBOL.39_25,
	movq	%rax, %rdi	; tmp134,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%al, %al	; _26
	je	.L98	;,
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, _39
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	jmp	.L86	;
.L98:
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rdx	; GE_SYMBOL, GE_SYMBOL.40_27
	movq	-8(%rbp), %rax	; str, tmp135
	movq	%rdx, %rsi	; GE_SYMBOL.40_27,
	movq	%rax, %rdi	; tmp135,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%al, %al	; _28
	je	.L99	;,
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, _39
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	jmp	.L86	;
.L99:
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rdx	; ADD_SYMBOL, ADD_SYMBOL.41_29
	movq	-8(%rbp), %rax	; str, tmp136
	movq	%rdx, %rsi	; ADD_SYMBOL.41_29,
	movq	%rax, %rdi	; tmp136,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%al, %al	; _30
	je	.L100	;,
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	;, _39
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	jmp	.L86	;
.L100:
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rdx	; SUB_SYMBOL, SUB_SYMBOL.42_31
	movq	-8(%rbp), %rax	; str, tmp137
	movq	%rdx, %rsi	; SUB_SYMBOL.42_31,
	movq	%rax, %rdi	; tmp137,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%al, %al	; _32
	je	.L101	;,
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, _39
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	jmp	.L86	;
.L101:
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rdx	; MUL_SYMBOL, MUL_SYMBOL.43_33
	movq	-8(%rbp), %rax	; str, tmp138
	movq	%rdx, %rsi	; MUL_SYMBOL.43_33,
	movq	%rax, %rdi	; tmp138,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	; _34
	je	.L102	;,
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, _39
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	jmp	.L86	;
.L102:
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rdx	; DIV_SYMBOL, DIV_SYMBOL.44_35
	movq	-8(%rbp), %rax	; str, tmp139
	movq	%rdx, %rsi	; DIV_SYMBOL.44_35,
	movq	%rax, %rdi	; tmp139,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	; _36
	je	.L103	;,
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, _39
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	jmp	.L86	;
.L103:
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rdx	; MOD_SYMBOL, MOD_SYMBOL.45_37
	movq	-8(%rbp), %rax	; str, tmp140
	movq	%rdx, %rsi	; MOD_SYMBOL.45_37,
	movq	%rax, %rdi	; tmp140,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	testb	%al, %al	; _38
	je	.L104	;,
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movl	$4, %eax	;, _39
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	jmp	.L86	;
.L104:
; src/helper.c:243:     else return OP_NONE;
	movl	$19, %eax	;, _39
.L86:
; src/helper.c:244: }
	leave	
	ret	
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; src/helper.c:247:     switch (op) {
	cmpl	$18, -4(%rbp)	;, op
	ja	.L106	;,
	movl	-4(%rbp), %eax	; op, tmp84
	leaq	0(,%rax,4), %rdx	;, tmp85
	leaq	.L108(%rip), %rax	;, tmp86
	movl	(%rdx,%rax), %eax	;, tmp87
	cltq
	leaq	.L108(%rip), %rdx	;, tmp90
	addq	%rdx, %rax	; tmp90, tmp89
	jmp	*%rax	; tmp89
	.section	.rodata
	.align 4
	.align 4
.L108:
	.long	.L112-.L108
	.long	.L112-.L108
	.long	.L111-.L108
	.long	.L111-.L108
	.long	.L111-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L110-.L108
	.long	.L109-.L108
	.long	.L109-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.long	.L107-.L108
	.text
.L107:
; src/helper.c:254:             return 1;
	movl	$1, %eax	;, _1
	jmp	.L113	;
.L109:
; src/helper.c:257:             return 2;
	movl	$2, %eax	;, _1
	jmp	.L113	;
.L110:
; src/helper.c:264:             return 3;
	movl	$3, %eax	;, _1
	jmp	.L113	;
.L112:
; src/helper.c:267:             return 4;
	movl	$4, %eax	;, _1
	jmp	.L113	;
.L111:
; src/helper.c:271:             return 5;
	movl	$5, %eax	;, _1
	jmp	.L113	;
.L106:
; src/helper.c:274:             return 0;
	movl	$0, %eax	;, _1
.L113:
; src/helper.c:276: }
	popq	%rbp	;
	ret	
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; src/helper.c:279:     switch (op) {
	cmpl	$18, -4(%rbp)	;, op
	ja	.L115	;,
	movl	-4(%rbp), %eax	; op, tmp84
	leaq	0(,%rax,4), %rdx	;, tmp85
	leaq	.L117(%rip), %rax	;, tmp86
	movl	(%rdx,%rax), %eax	;, tmp87
	cltq
	leaq	.L117(%rip), %rdx	;, tmp90
	addq	%rdx, %rax	; tmp90, tmp89
	jmp	*%rax	; tmp89
	.section	.rodata
	.align 4
	.align 4
.L117:
	.long	.L135-.L117
	.long	.L134-.L117
	.long	.L133-.L117
	.long	.L132-.L117
	.long	.L131-.L117
	.long	.L130-.L117
	.long	.L129-.L117
	.long	.L128-.L117
	.long	.L127-.L117
	.long	.L126-.L117
	.long	.L125-.L117
	.long	.L124-.L117
	.long	.L123-.L117
	.long	.L122-.L117
	.long	.L121-.L117
	.long	.L120-.L117
	.long	.L119-.L117
	.long	.L118-.L117
	.long	.L116-.L117
	.text
.L122:
; src/helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, _1
	jmp	.L136	;
.L121:
; src/helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, _1
	jmp	.L136	;
.L120:
; src/helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, _1
	jmp	.L136	;
.L119:
; src/helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, _1
	jmp	.L136	;
.L118:
; src/helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, _1
	jmp	.L136	;
.L116:
; src/helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, _1
	jmp	.L136	;
.L124:
; src/helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, _1
	jmp	.L136	;
.L123:
; src/helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, _1
	jmp	.L136	;
.L130:
; src/helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, _1
	jmp	.L136	;
.L129:
; src/helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, _1
	jmp	.L136	;
.L128:
; src/helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, _1
	jmp	.L136	;
.L127:
; src/helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, _1
	jmp	.L136	;
.L126:
; src/helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, _1
	jmp	.L136	;
.L125:
; src/helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, _1
	jmp	.L136	;
.L135:
; src/helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, _1
	jmp	.L136	;
.L134:
; src/helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, _1
	jmp	.L136	;
.L133:
; src/helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, _1
	jmp	.L136	;
.L132:
; src/helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, _1
	jmp	.L136	;
.L131:
; src/helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, _1
	jmp	.L136	;
.L115:
; src/helper.c:300:         default: return 0;
	movl	$0, %eax	;, _1
.L136:
; src/helper.c:302: }
	popq	%rbp	;
	ret	
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
