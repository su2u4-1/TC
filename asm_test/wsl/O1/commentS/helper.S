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
; src/helper.c:9:     new_list->head = 0;
	movq	$0, (%rax)	;, new_list_3->head
; src/helper.c:10:     new_list->tail = 0;
	movq	$0, 8(%rax)	;, new_list_3->tail
; src/helper.c:12: }
	addq	$8, %rsp	;,
	ret	
	.size	create_list, .-create_list
	.globl	create_node
	.type	create_node, @function
create_node:
	pushq	%rbx	;
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
	.globl	list_append
	.type	list_append, @function
list_append:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp87, list
	movq	%rsi, %rdi	; tmp88, item
; src/helper.c:22:     Node* new_node = create_node(item);
	call	create_node	;
; src/helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	;, list_8(D)->head
	je	.L9	;,
; src/helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; list_8(D)->tail, _2
; src/helper.c:27:         list->tail->next = new_node;
	movq	%rax, (%rdx)	; new_node, _2->next
.L7:
; src/helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_8(D)->tail
; src/helper.c:30: }
	popq	%rbx	;
	ret	
.L9:
; src/helper.c:24:         list->head = new_node;
	movq	%rax, (%rbx)	; new_node, list_8(D)->head
	jmp	.L7	;
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp87, original
; src/helper.c:33:     list() new_list = create_list();
	call	create_list	;
; src/helper.c:34:     new_list->head = original->head;
	movq	(%rbx), %rdx	; original_6(D)->head, _1
; src/helper.c:34:     new_list->head = original->head;
	movq	%rdx, (%rax)	; _1, new_list_5->head
; src/helper.c:35:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	; original_6(D)->tail, _2
; src/helper.c:35:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	; _2, new_list_5->tail
; src/helper.c:37: }
	popq	%rbx	;
	ret	
	.size	list_copy, .-list_copy
	.globl	list_pop
	.type	list_pop, @function
list_pop:
; src/helper.c:40:     if (list->head == 0)
	movq	(%rdi), %rax	; list_7(D)->head, <retval>
; src/helper.c:40:     if (list->head == 0)
	testq	%rax, %rax	; <retval>
	je	.L12	;,
; src/helper.c:43:     list->head = head_node->next;
	movq	(%rax), %rdx	; _1->next, _2
; src/helper.c:43:     list->head = head_node->next;
	movq	%rdx, (%rdi)	; _2, list_7(D)->head
; src/helper.c:44:     if (list->head == 0)
	testq	%rdx, %rdx	; _2
	je	.L15	;,
.L14:
; src/helper.c:46:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
.L12:
; src/helper.c:47: }
	ret	
.L15:
; src/helper.c:45:         list->tail = 0;
	movq	$0, 8(%rdi)	;, list_7(D)->tail
	jmp	.L14	;
	.size	list_pop, .-list_pop
	.globl	create_scope
	.type	create_scope, @function
create_scope:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, parent
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp87, <retval>
; src/helper.c:103:     scope_ptr->parent = parent;
	movq	%rbp, (%rax)	; parent, new_scope_4->parent
; src/helper.c:104:     scope_ptr->names = create_list();
	call	create_list	;
; src/helper.c:104:     scope_ptr->names = create_list();
	movq	%rax, 8(%rbx)	; tmp88, new_scope_4->names
; src/helper.c:106: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp92, scope
	movq	%rsi, %r12	; tmp93, name
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%rdi, %rdi	; scope
	je	.L23	;,
.L22:
; src/helper.c:112:         Node* current = ((names))->head;
	movq	8(%r13), %rax	; scope_ptr_22->names, scope_ptr_22->names
	movq	(%rax), %rbx	; names_11->head, current
; src/helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	; current
	je	.L20	;,
.L21:
; src/helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rbp	; current_23->content, <retval>
; src/helper.c:116:             if (string_equal(current_name->name, name))
	movq	0(%rbp), %rdi	; current_name_14->name, current_name_14->name
	movq	%r12, %rsi	; name,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp94
	jne	.L18	;,
; src/helper.c:118:             current = node_ptr->next;
	movq	(%rbx), %rbx	; current_23->next, current
; src/helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	; current
	jne	.L21	;,
.L20:
; src/helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	0(%r13), %r13	; scope_ptr_22->parent, scope
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%r13, %r13	; scope
	jne	.L22	;,
; src/helper.c:122:     return NULL;
	movq	%r13, %rbp	; scope, <retval>
	jmp	.L18	;
.L23:
	movq	%rdi, %rbp	; scope, <retval>
.L18:
; src/helper.c:123: }
	movq	%rbp, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search, .-search
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Warning: Name '%s' already exists in the current scope, returning existing name, kind: "
	.section	.rodata.str1.1,"aMS",@progbits,1
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
	.section	.rodata.str1.8
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r12	; tmp152, name
	movl	%esi, %ebp	; tmp153, kind
	movq	%rdx, %r14	; tmp154, name_info
	movq	%rcx, %r15	; tmp155, scope_info
	movq	%r8, %r13	; tmp156, scope
; src/helper.c:52:     Name* result = search(scope, name);
	movq	%rdi, %rsi	; name,
	movq	%r8, %rdi	; scope,
	call	search	;
; src/helper.c:53:     if (result != NULL) {
	testq	%rax, %rax	; result
	je	.L28	;,
	movq	%rax, %rbx	; tmp157, result
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rcx	; name,
	leaq	.LC0(%rip), %rdx	;, tmp114
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:55:         switch (result->kind) {
	cmpl	$5, 24(%rbx)	;, result_34->kind
	ja	.L29	;,
	movl	24(%rbx), %eax	; result_34->kind, result_34->kind
	leaq	.L31(%rip), %rdx	;, tmp116
	movslq	(%rdx,%rax,4), %rax	;, tmp118
	addq	%rdx, %rax	; tmp116, tmp119
	jmp	*%rax	; tmp119
	.section	.rodata
	.align 4
	.align 4
.L31:
	.long	.L36-.L31
	.long	.L35-.L31
	.long	.L34-.L31
	.long	.L33-.L31
	.long	.L32-.L31
	.long	.L30-.L31
	.text
.L36:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
.L28:
; src/helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp158, <retval>
; src/helper.c:80:     new_name->name = name;
	movq	%r12, (%rax)	; name, new_name_36->name
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp161
	addq	$1, %rax	;, _11
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	%rax, 8(%rbx)	; _11, new_name_36->id
; src/helper.c:82:     new_name->kind = kind;
	movl	%ebp, 24(%rbx)	; kind, new_name_36->kind
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	leal	-1(%rbp), %eax	;, tmp136
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$2, %eax	;, tmp136
	jbe	.L37	;,
	cmpl	$5, %ebp	;, kind
	je	.L37	;,
; src/helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, %ebp	;, kind
	jne	.L40	;,
	testq	%r15, %r15	; scope_info
	je	.L40	;,
; src/helper.c:86:         new_name->info.scope = scope_info;
	movq	%r15, 16(%rbx)	; scope_info, new_name_36->info.scope
	jmp	.L42	;
.L35:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp124
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L34:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp126
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L33:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp128
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L32:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp130
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L30:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp132
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L29:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp134
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L28	;
.L37:
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	testq	%r14, %r14	; name_info
	je	.L41	;,
; src/helper.c:84:         new_name->info.type = name_info;
	movq	%r14, 16(%rbx)	; name_info, new_name_36->info.type
.L42:
; src/helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	8(%r13), %rdi	; scope_31(D)->names, scope_31(D)->names
	movq	%rbx, %rsi	; <retval>,
	call	list_append	;
.L27:
; src/helper.c:98: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L40:
; src/helper.c:87:     else if (kind == NAME_TYPE)
	testl	%ebp, %ebp	; kind
	jne	.L41	;,
; src/helper.c:88:         new_name->info.type = NULL;
	movq	$0, 16(%rbx)	;, new_name_36->info.type
	jmp	.L42	;
.L41:
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	orq	%r14, %r15	; name_info, tmp159
	jne	.L43	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; kind,
	leaq	.LC8(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:94:         return NULL;
	movl	$0, %ebx	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L27	;
.L43:
	movl	%ebp, %ecx	; kind,
	leaq	.LC9(%rip), %rdx	;, tmp149
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:94:         return NULL;
	movl	$0, %ebx	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L27	;
	.size	create_name, .-create_name
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp104, type
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rsi	; INT_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp105
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.12_11
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp105
	je	.L53	;,
.L47:
; src/helper.c:127: }
	popq	%rbx	;
	ret	
.L53:
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rsi	; FLOAT_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp106
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.12_11
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp106
	jne	.L47	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rsi	; STRING_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp107
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.12_11
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp107
	jne	.L47	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rsi	; BOOL_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp108
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.12_11
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	; tmp108
	jne	.L47	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	VOID_KEYWORD(%rip), %rsi	; VOID_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp109
	setne	%al	;, iftmp.12_11
	movzbl	%al, %eax	; iftmp.12_11, iftmp.12_11
	jmp	.L47	;
	.size	is_builtin_type, .-is_builtin_type
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
	.globl	parser_error
	.type	parser_error, @function
parser_error:
	subq	$8, %rsp	;,
	movq	%rdi, %r9	; message, tmp95
; src/helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	16(%rsi), %rax	; token_7(D)->column, token_7(D)->column
	movq	8(%rsi), %rcx	; token_7(D)->line, token_7(D)->line
	addq	$1, %rcx	;, tmp91
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	1(%rax), %r8	;,
	leaq	.LC10(%rip), %rdx	;, tmp94
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:136: }
	addq	$8, %rsp	;,
	ret	
	.size	parser_error, .-parser_error
	.section	.rodata.str1.1
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r13	; tmp133, out
	movq	%rsi, %rbp	; tmp134, indent
	movl	%edx, %edi	; tmp135, is_last
	movl	%edx, 12(%rsp)	; is_last, %sfp
; src/helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	3(%rcx), %r12	;, _3
; src/helper.c:139:     char word = bool_list[index / 8];
	movq	%rsi, %rax	; indent, tmp112
	shrq	$3, %rax	;, tmp112
; src/helper.c:139:     char word = bool_list[index / 8];
	addq	%r12, %rax	; _3, _21
; src/helper.c:139:     char word = bool_list[index / 8];
	movzbl	(%rax), %edx	; *_21, word
; src/helper.c:140:     if (value)
	testb	%dil, %dil	; is_last
	jne	.L58	;,
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%esi, %ecx	; indent, tmp113
	andl	$7, %ecx	;, tmp113
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %esi	;, tmp115
	sall	%cl, %esi	; tmp113, tmp114
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%esi, %edx	; tmp114, cstore_19
.L61:
	movb	%dl, (%rax)	; cstore_19, *_21
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebx	;, i
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %r15	;, tmp127
	leaq	.LC11(%rip), %r14	;, tmp128
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rbp	;, indent
	jbe	.L73	;,
.L59:
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	%rbx, %rax	; i, tmp120
	shrq	$3, %rax	;, tmp120
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movsbl	(%r12,%rax), %eax	; *_35, *_35
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%ebx, %ecx	; i, tmp122
	andl	$7, %ecx	;, tmp122
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	sarl	%cl, %eax	; tmp122, tmp123
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	;, tmp123
	movq	%r14, %rdx	; tmp128, iftmp.19_6
	cmove	%r15, %rdx	; tmp127,, iftmp.19_6
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; out,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	;, i
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rbp	; i, indent
	jne	.L59	;,
.L63:
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 12(%rsp)	;, %sfp
	leaq	.LC14(%rip), %rdx	;, tmp129
	leaq	.LC13(%rip), %rax	;, tmp130
	cmovne	%rax, %rdx	; tmp129,, tmp130, iftmp.20_7
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; out,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:157: }
	jmp	.L57	;
.L58:
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	%esi, %ecx	; indent, tmp116
	andl	$7, %ecx	;, tmp116
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	$1, %esi	;, tmp118
	sall	%cl, %esi	; tmp116, tmp117
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%esi	; tmp119
	andl	%esi, %edx	; tmp119, cstore_19
	jmp	.L61	;
.L73:
; src/helper.c:155:     if (indent > 0)
	testq	%rbp, %rbp	; indent
	jne	.L63	;,
.L57:
; src/helper.c:157: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
	subq	$8, %rsp	;,
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:162:     parser_ptr->in_function = false;
	movb	$0, (%rax)	;, new_parser_3->in_function
; src/helper.c:163:     parser_ptr->in_method = false;
	movb	$0, 1(%rax)	;, new_parser_3->in_method
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
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$1048, %rsp	;,
	movq	%rdi, %r12	; tmp145, import_name
	movq	%rsi, %rbx	; tmp146, source
	movq	%rdx, %r13	; tmp147, scope
; src/helper.c:173:     filename[0] = '\0';
	movb	$0, 16(%rsp)	;, filename[0]
; src/helper.c:174:     if (source == 0) {
	testq	%rsi, %rsi	; source
	je	.L88	;,
; src/helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	leaq	16(%rsp), %rbp	;, tmp115
	movq	%rsi, %rcx	; source,
	movq	%rbp, %rdx	; tmp115,
	movl	$1024, %esi	;,
	movq	%rbp, %rdi	; tmp115,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	leaq	.LC18(%rip), %rcx	;, tmp119
	movq	%rbp, %rdx	; tmp115,
	movl	$1024, %esi	;,
	movq	%rbp, %rdi	; tmp115,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	%r12, %rcx	; import_name,
	movq	%rbp, %rdx	; tmp115,
	movl	$1024, %esi	;,
	movq	%rbp, %rdi	; tmp115,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	leaq	.LC19(%rip), %rcx	;, tmp124
	movq	%rbp, %rdx	; tmp115,
	movl	$1024, %esi	;,
	movq	%rbp, %rdi	; tmp115,
	call	*string_append@GOTPCREL(%rip)	;
.L79:
; src/helper.c:189:     openfile = fopen(filename, "r");
	leaq	16(%rsp), %rdi	;, tmp125
	leaq	.LC20(%rip), %rsi	;, tmp126
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp150, <retval>
; src/helper.c:190:     if (openfile == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L89	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	leaq	16(%rsp), %r14	;, tmp131
	movq	%r14, %rdx	; tmp131,
	leaq	.LC22(%rip), %rsi	;, tmp132
	movl	$2, %edi	;,
	movl	$0, %eax	;,
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:195:     size_t length = 0;
	movq	$0, 8(%rsp)	;, length
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	8(%rsp), %rsi	;, tmp133
	movq	%rbx, %rdi	; <retval>,
	call	*read_source@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp151, source_code
; src/helper.c:197:     fclose(openfile);
	movq	%rbx, %rdi	; <retval>,
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	create_parser	;
	movq	%rax, %rbx	; tmp152, _5
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	builtin_scope(%rip), %r15	; builtin_scope, builtin_scope.23_6
	movq	8(%rsp), %rsi	; length,
	movq	%rbp, %rdi	; source_code,
	call	*create_lexer@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp153, _8
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rbx, %rdx	; _5,
	movq	%r15, %rsi	; builtin_scope.23_6,
	call	*parse_code@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp154, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%r14, %rdx	; tmp131,
	leaq	.LC23(%rip), %rsi	;, tmp136
	movl	$2, %edi	;,
	movl	$0, %eax	;,
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:200:     if (code == 0) {
	testq	%rbx, %rbx	; <retval>
	je	.L90	;,
; src/helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rbx), %rax	; code_38->global_scope, code_38->global_scope
; src/helper.c:205:     Node* current = ((names))->head;
	movq	8(%rax), %rax	; _10->names, _10->names
	movq	(%rax), %rbx	; names_39->head, <retval>
; src/helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	; <retval>
	je	.L76	;,
.L85:
; src/helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rbp	; current_57->content, current_name
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	0(%rbp), %rdi	; current_name_41->name, current_name_41->name
	movq	%r12, %rsi	; import_name,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	; tmp155
	jne	.L84	;,
; src/helper.c:213:         current = node_ptr->next;
	movq	(%rbx), %rbx	; current_57->next, <retval>
; src/helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	; <retval>
	jne	.L85	;,
	jmp	.L76	;
.L88:
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	leaq	.LC15(%rip), %rsi	;, tmp103
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	; tmp148
	je	.L91	;,
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	leaq	.LC16(%rip), %rsi	;, tmp108
	movq	%r12, %rdi	; import_name,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	; tmp149
	jne	.L80	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movabsq	$8241920901561659182, %rax	;, tmp159
	movq	%rax, 16(%rsp)	; tmp159, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rax	;, tmp160
	movq	%rax, 21(%rsp)	; tmp160, MEM <char[1:13]> [(void *)&filename]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L79	;
.L91:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movabsq	$8246143026212319022, %rax	;, tmp157
	movq	%rax, 16(%rsp)	; tmp157, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rax	;, tmp158
	movq	%rax, 23(%rsp)	; tmp158, MEM <char[1:15]> [(void *)&filename]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L79	;
.L80:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	16(%rsp), %rcx	;, tmp112
	leaq	.LC17(%rip), %rdx	;, tmp114
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:181:             return 0;
	jmp	.L76	;
.L89:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	16(%rsp), %rcx	;, tmp128
	leaq	.LC21(%rip), %rdx	;, tmp130
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:192:         return 0;
	jmp	.L76	;
.L90:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r14, %rcx	; tmp131, tmp137
	leaq	.LC24(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:202:         return 0;
	jmp	.L76	;
.L84:
; src/helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	8(%r13), %rdi	; scope_44(D)->names, scope_44(D)->names
	movq	%rbp, %rsi	; current_name,
	call	list_append	;
; src/helper.c:219:     return name;
	movq	%rbp, %rbx	; current_name, <retval>
.L76:
; src/helper.c:220: }
	movq	%rbx, %rax	; <retval>,
	addq	$1048, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_import_file, .-parse_import_file
	.globl	string_to_operator
	.type	string_to_operator, @function
string_to_operator:
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp144, str
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp145
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	;, <retval>
; src/helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	; tmp145
	jne	.L92	;,
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp146
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, <retval>
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	; tmp146
	jne	.L92	;,
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp147
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, <retval>
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	; tmp147
	jne	.L92	;,
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp148
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, <retval>
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	; tmp148
	jne	.L92	;,
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp149
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, <retval>
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	; tmp149
	jne	.L92	;,
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp150
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, <retval>
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	; tmp150
	jne	.L92	;,
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp151
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, <retval>
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	; tmp151
	jne	.L92	;,
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp152
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, <retval>
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	; tmp152
	jne	.L92	;,
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp153
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, <retval>
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	; tmp153
	jne	.L92	;,
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp154
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, <retval>
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	; tmp154
	jne	.L92	;,
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp155
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, <retval>
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	; tmp155
	jne	.L92	;,
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp156
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, <retval>
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	; tmp156
	jne	.L92	;,
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp157
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, <retval>
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	; tmp157
	jne	.L92	;,
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp158
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, <retval>
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	; tmp158
	jne	.L92	;,
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp159
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	;, <retval>
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	; tmp159
	je	.L114	;,
.L92:
; src/helper.c:244: }
	popq	%rbx	;
	ret	
.L114:
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp160
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, <retval>
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	; tmp160
	jne	.L92	;,
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	; tmp161
	jne	.L110	;,
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	; tmp162
	jne	.L111	;,
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	;, _38
	sbbl	%eax, %eax	; <retval>
	andl	$15, %eax	;, <retval>
	addl	$4, %eax	;, <retval>
	jmp	.L92	;
.L110:
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, <retval>
	jmp	.L92	;
.L111:
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, <retval>
	jmp	.L92	;
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
; src/helper.c:247:     switch (op) {
	cmpl	$18, %edi	;, op
	ja	.L116	;,
	movl	%edi, %edi	; op, op
	leaq	.L118(%rip), %rdx	;, tmp85
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L118:
	.long	.L122-.L118
	.long	.L122-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L121-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L120-.L118
	.long	.L123-.L118
	.long	.L123-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.long	.L117-.L118
	.text
.L117:
; src/helper.c:254:             return 1;
	movl	$1, %eax	;, <retval>
	ret	
.L120:
; src/helper.c:264:             return 3;
	movl	$3, %eax	;, <retval>
	ret	
.L122:
; src/helper.c:267:             return 4;
	movl	$4, %eax	;, <retval>
	ret	
.L121:
; src/helper.c:271:             return 5;
	movl	$5, %eax	;, <retval>
	ret	
.L116:
; src/helper.c:274:             return 0;
	movl	$0, %eax	;, <retval>
	ret	
.L123:
; src/helper.c:247:     switch (op) {
	movl	$2, %eax	;, <retval>
; src/helper.c:276: }
	ret	
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
; src/helper.c:279:     switch (op) {
	cmpl	$18, %edi	;, op
	ja	.L146	;,
	movl	%edi, %edi	; op, op
	leaq	.L127(%rip), %rdx	;, tmp85
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L127:
	.long	.L145-.L127
	.long	.L144-.L127
	.long	.L143-.L127
	.long	.L142-.L127
	.long	.L141-.L127
	.long	.L140-.L127
	.long	.L139-.L127
	.long	.L138-.L127
	.long	.L137-.L127
	.long	.L136-.L127
	.long	.L135-.L127
	.long	.L134-.L127
	.long	.L133-.L127
	.long	.L132-.L127
	.long	.L131-.L127
	.long	.L130-.L127
	.long	.L129-.L127
	.long	.L128-.L127
	.long	.L126-.L127
	.text
.L132:
; src/helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, <retval>
	ret	
.L131:
; src/helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, <retval>
	ret	
.L130:
; src/helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, <retval>
	ret	
.L129:
; src/helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, <retval>
	ret	
.L128:
; src/helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, <retval>
	ret	
.L126:
; src/helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, <retval>
	ret	
.L134:
; src/helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, <retval>
	ret	
.L133:
; src/helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, <retval>
	ret	
.L140:
; src/helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, <retval>
	ret	
.L139:
; src/helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, <retval>
	ret	
.L138:
; src/helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, <retval>
	ret	
.L137:
; src/helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, <retval>
	ret	
.L136:
; src/helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, <retval>
	ret	
.L135:
; src/helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, <retval>
	ret	
.L145:
; src/helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, <retval>
	ret	
.L144:
; src/helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, <retval>
	ret	
.L143:
; src/helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, <retval>
	ret	
.L142:
; src/helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, <retval>
	ret	
.L141:
; src/helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, <retval>
	ret	
.L146:
; src/helper.c:279:     switch (op) {
	movl	$0, %eax	;, <retval>
; src/helper.c:302: }
	ret	
	.size	operator_to_string, .-operator_to_string
	.local	id_counter.0
	.comm	id_counter.0,8,8
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
