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
; src/helper.c:10:     new_list->tail = 0;
	xorl	%edx, %edx	;
	movq	%rdx, (%rax)	;, new_list_3->head
	movq	%rdx, 8(%rax)	;, new_list_3->tail
; src/helper.c:12: }
	popq	%rcx	;
	ret	
	.size	create_list, .-create_list
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
	xorl	%edx, %edx	;
	movq	%rdx, (%rax)	;, new_node_3->next
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
; src/helper.c:21: void list_append(list() list, pointer item) {
	movq	%rdi, %rbx	; tmp88, list
	movq	%rsi, %rdi	; tmp89, item
; src/helper.c:22:     Node* new_node = create_node(item);
	call	create_node	;
; src/helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	;, list_8(D)->head
	jne	.L6	;,
; src/helper.c:24:         list->head = new_node;
	movq	%rax, (%rbx)	; new_node, list_8(D)->head
	jmp	.L7	;
.L6:
; src/helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	; list_8(D)->tail, list_8(D)->tail
	movq	%rax, (%rdx)	; new_node, _2->next
.L7:
; src/helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	; new_node, list_8(D)->tail
; src/helper.c:30: }
	popq	%rbx	;
	ret	
	.size	list_append, .-list_append
	.globl	list_copy
	.type	list_copy, @function
list_copy:
	pushq	%rbx	;
; src/helper.c:32: list() list_copy(list() original) {
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
	jne	.L14	;,
; src/helper.c:45:         list->tail = 0;
	xorl	%edx, %edx	;
	movq	%rdx, 8(%rdi)	;, list_7(D)->tail
.L14:
; src/helper.c:46:     return head_node->content;
	movq	8(%rax), %rax	; _1->content, <retval>
.L12:
; src/helper.c:47: }
	ret	
	.size	list_pop, .-list_pop
	.globl	create_scope
	.type	create_scope, @function
create_scope:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, parent
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %edi	;,
; src/helper.c:100: Scope* create_scope(Scope* parent) {
	pushq	%rbx	;
	pushq	%rax	;
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:103:     scope_ptr->parent = parent;
	movq	%rbp, (%rax)	; parent, new_scope_4->parent
; src/helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movq	%rax, %rbx	; tmp87, <retval>
; src/helper.c:104:     scope_ptr->names = create_list();
	call	create_list	;
; src/helper.c:104:     scope_ptr->names = create_list();
	movq	%rax, 8(%rbx)	; tmp88, new_scope_4->names
; src/helper.c:106: }
	movq	%rbx, %rax	; <retval>,
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_scope, .-create_scope
	.globl	search
	.type	search, @function
search:
	pushq	%r13	;
	movq	%rsi, %r13	; tmp92, name
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp91, scope
	pushq	%rcx	;
.L21:
; src/helper.c:110:     while (scope_ptr != NULL) {
	testq	%rbx, %rbx	; scope
	je	.L27	;,
; src/helper.c:112:         Node* current = ((names))->head;
	movq	8(%rbx), %rax	; scope_ptr_3->names, scope_ptr_3->names
	movq	(%rax), %rbp	; names_12->head, current
.L22:
; src/helper.c:113:         while (current != 0) {
	testq	%rbp, %rbp	; current
	je	.L28	;,
; src/helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbp), %r12	; current_4->content, <retval>
; src/helper.c:116:             if (string_equal(current_name->name, name))
	movq	%r13, %rsi	; name,
	movq	(%r12), %rdi	; current_name_15->name,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	; tmp93
	jne	.L20	;,
; src/helper.c:118:             current = node_ptr->next;
	movq	0(%rbp), %rbp	; current_4->next, current
	jmp	.L22	;
.L28:
; src/helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	(%rbx), %rbx	; scope_ptr_3->parent, scope
	jmp	.L21	;
.L27:
; src/helper.c:122:     return NULL;
	xorl	%r12d, %r12d	; <retval>
.L20:
; src/helper.c:123: }
	popq	%rdx	;
	movq	%r12, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	search, .-search
	.section	.rodata.str1.1,"aMS",@progbits,1
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
.LC8:
	.string	"Error creating name: name_info and scope_info are both NULL for kind %u\n"
.LC9:
	.string	"Error creating name: unknown NameType %u\n"
	.text
	.globl	create_name
	.type	create_name, @function
create_name:
	pushq	%r15	;
	movq	%r8, %r15	; tmp154, scope
	pushq	%r14	;
	movq	%rdi, %r14	; tmp150, name
	pushq	%r13	;
	movq	%rdx, %r13	; tmp152, name_info
	pushq	%r12	;
	movq	%rcx, %r12	; tmp153, scope_info
	pushq	%rbp	;
	movl	%esi, %ebp	; tmp151, kind
; src/helper.c:52:     Name* result = search(scope, name);
	movq	%rdi, %rsi	; name,
	movq	%r8, %rdi	; scope,
; src/helper.c:50: Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
	pushq	%rbx	;
	pushq	%r9	;
; src/helper.c:52:     Name* result = search(scope, name);
	call	search	;
; src/helper.c:53:     if (result != NULL) {
	testq	%rax, %rax	; result
	je	.L30	;,
	movq	%rax, %rbx	; tmp155, result
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	movq	%r14, %rcx	; name,
	movl	$2, %esi	;,
	leaq	.LC0(%rip), %rdx	;, tmp113
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:55:         switch (result->kind) {
	cmpl	$5, 24(%rbx)	;, result_34->kind
	movq	stderr(%rip), %rsi	; stderr, stderr
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC7(%rip), %rdi	;, tmp133
; src/helper.c:55:         switch (result->kind) {
	ja	.L58	;,
	movl	24(%rbx), %eax	; result_34->kind, result_34->kind
	leaq	.L33(%rip), %rdx	;, tmp115
	movslq	(%rdx,%rax,4), %rax	;, tmp117
	addq	%rdx, %rax	; tmp115, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
	.align 4
.L33:
	.long	.L38-.L33
	.long	.L37-.L33
	.long	.L36-.L33
	.long	.L35-.L33
	.long	.L34-.L33
	.long	.L32-.L33
	.text
.L38:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC1(%rip), %rdi	;, tmp121
	jmp	.L58	;
.L37:
	leaq	.LC2(%rip), %rdi	;, tmp123
	jmp	.L58	;
.L36:
	leaq	.LC3(%rip), %rdi	;, tmp125
	jmp	.L58	;
.L35:
	leaq	.LC4(%rip), %rdi	;, tmp127
	jmp	.L58	;
.L34:
	leaq	.LC5(%rip), %rdi	;, tmp129
	jmp	.L58	;
.L32:
	leaq	.LC6(%rip), %rdi	;, tmp131
.L58:
	call	*fputs@GOTPCREL(%rip)	;
.L30:
; src/helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:80:     new_name->name = name;
	movq	%r14, (%rax)	; name, new_name_36->name
; src/helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movq	%rax, %rbx	; tmp156, <retval>
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	; id_counter, tmp159
; src/helper.c:82:     new_name->kind = kind;
	movl	%ebp, 24(%rbx)	; kind, new_name_36->kind
; src/helper.c:81:     new_name->id = ++id_counter;
	incq	%rax	; _11
; src/helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	; _11, id_counter
	movq	%rax, 8(%rbx)	; _11, new_name_36->id
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	leal	-1(%rbp), %eax	;, tmp135
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$2, %eax	;, tmp135
	jbe	.L39	;,
	cmpl	$5, %ebp	;, kind
	je	.L39	;,
; src/helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, %ebp	;, kind
	jne	.L42	;,
	testq	%r12, %r12	; scope_info
	je	.L42	;,
; src/helper.c:86:         new_name->info.scope = scope_info;
	movq	%r12, 16(%rbx)	; scope_info, new_name_36->info.scope
	jmp	.L44	;
.L39:
; src/helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	testq	%r13, %r13	; name_info
	je	.L43	;,
; src/helper.c:84:         new_name->info.type = name_info;
	movq	%r13, 16(%rbx)	; name_info, new_name_36->info.type
	jmp	.L44	;
.L42:
; src/helper.c:87:     else if (kind == NAME_TYPE)
	testl	%ebp, %ebp	; kind
	jne	.L43	;,
; src/helper.c:88:         new_name->info.type = NULL;
	xorl	%ecx, %ecx	;
	movq	%rcx, 16(%rbx)	;, new_name_36->info.type
	jmp	.L44	;
.L43:
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	orq	%r13, %r12	; name_info, tmp157
; src/helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movq	stderr(%rip), %rdi	; stderr, pretmp_21
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; kind,
	leaq	.LC8(%rip), %rdx	;, tmp145
; src/helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	je	.L59	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC9(%rip), %rdx	;, tmp146
.L59:
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/helper.c:94:         return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L29	;
.L44:
; src/helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	8(%r15), %rdi	; scope_31(D)->names, scope_31(D)->names
	movq	%rbx, %rsi	; <retval>,
	call	list_append	;
.L29:
; src/helper.c:98: }
	popq	%rdx	;
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	create_name, .-create_name
	.globl	is_builtin_type
	.type	is_builtin_type, @function
is_builtin_type:
	pushq	%rbx	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	INT_KEYWORD(%rip), %rsi	; INT_KEYWORD,
; src/helper.c:125: bool is_builtin_type(string type) {
	movq	%rdi, %rbx	; tmp104, type
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp105
	je	.L61	;,
.L63:
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	;, iftmp.12_11
	jmp	.L62	;
.L61:
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	FLOAT_KEYWORD(%rip), %rsi	; FLOAT_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp106
	jne	.L63	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	STRING_KEYWORD(%rip), %rsi	; STRING_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp107
	jne	.L63	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	BOOL_KEYWORD(%rip), %rsi	; BOOL_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp108
	jne	.L63	;,
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	VOID_KEYWORD(%rip), %rsi	; VOID_KEYWORD,
	movq	%rbx, %rdi	; type,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	; tmp109
	setne	%al	;, iftmp.12_11
	movzbl	%al, %eax	; iftmp.12_11, iftmp.12_11
.L62:
; src/helper.c:127: }
	popq	%rbx	;
	ret	
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
	.section	.rodata.str1.1
.LC10:
	.string	"Parser Error at line %zu, column %zu: %s\n"
	.text
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
	incq	%rcx	; tmp91
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
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
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %eax	;, tmp111
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%r14	;
; src/helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	3(%rcx), %r14	;, _3
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%r13	;
	movl	%edx, %r13d	; tmp137, is_last
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp136, indent
; src/helper.c:139:     char word = bool_list[index / 8];
	shrq	$3, %rsi	;, tmp108
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ebx, %ecx	; indent, tmp109
; src/helper.c:139:     char word = bool_list[index / 8];
	addq	%r14, %rsi	; _3, _21
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	andl	$7, %ecx	;, tmp109
; src/helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	subq	$16, %rsp	;,
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	sall	%cl, %eax	; tmp109, tmp110
; src/helper.c:139:     char word = bool_list[index / 8];
	movb	(%rsi), %dl	; *_21, word
; src/helper.c:140:     if (value)
	testb	%r13b, %r13b	; is_last
	jne	.L68	;,
; src/helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%eax, %edx	; tmp110, cstore_4
.L70:
	movb	%dl, (%rsi)	; cstore_4, *_21
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movl	$1, %ebp	;, i
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %r15	;, tmp134
	jmp	.L69	;
.L68:
; src/helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	; tmp112
	andl	%eax, %edx	; tmp112, cstore_4
	jmp	.L70	;
.L69:
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rbp	; indent, i
	jnb	.L78	;,
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	%rbp, %rax	; i, tmp113
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%ebp, %ecx	; i, tmp115
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, 8(%rsp)	; out, %sfp
	movl	$2, %esi	;,
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	shrq	$3, %rax	;, tmp113
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	andl	$7, %ecx	;, tmp115
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC11(%rip), %rdx	;, tmp125
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movsbl	(%r14,%rax), %eax	; *_35, *_35
; src/helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	sarl	%cl, %eax	; tmp115, tmp116
; src/helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	;, tmp116
	cmove	%r15, %rdx	; tmp134,, iftmp.19_6
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	incq	%rbp	; i
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movq	8(%rsp), %rdi	; %sfp, out
	jmp	.L69	;
.L78:
; src/helper.c:155:     if (indent > 0)
	testq	%rbx, %rbx	; indent
	je	.L67	;,
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r13b, %r13b	; is_last
	leaq	.LC13(%rip), %rax	;, tmp131
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC14(%rip), %rdx	;, tmp130
	cmovne	%rax, %rdx	; tmp130,, tmp131, iftmp.20_7
; src/helper.c:157: }
	addq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/helper.c:157: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L67:
; src/helper.c:157: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	indention, .-indention
	.globl	create_parser
	.type	create_parser, @function
create_parser:
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %edi	;,
; src/helper.c:159: Parser* create_parser(void) {
	pushq	%rax	;
; src/helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/helper.c:162:     parser_ptr->in_function = false;
	movw	$0, (%rax)	;, MEM <unsigned short> [(char *)new_parser_3]
; src/helper.c:164:     parser_ptr->in_loop = false;
	movb	$0, 2(%rax)	;, new_parser_3->in_loop
; src/helper.c:166: }
	popq	%rdx	;
	ret	
	.size	create_parser, .-create_parser
	.section	.rodata.str1.1
.LC15:
	.string	"print"
.LC16:
	.string	"arr"
.LC17:
	.string	"Error: Standard library file for import not found: %s\n"
.LC18:
	.string	"/"
.LC19:
	.string	".tc"
.LC20:
	.string	"r"
.LC21:
	.string	"Error opening library file for import: %s\n"
.LC22:
	.string	"Info: Starting parsing lib file for import: %s\n"
.LC23:
	.string	"Info: Finished parsing lib file for import: %s\n"
.LC24:
	.string	"Error parsing library file for import: %s\n"
	.text
	.globl	parse_import_file
	.type	parse_import_file, @function
parse_import_file:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdx, %r13	; tmp149, scope
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp147, import_name
	pushq	%rbx	;
	subq	$1048, %rsp	;,
; src/helper.c:174:     if (source == 0) {
	testq	%rsi, %rsi	; source
; src/helper.c:173:     filename[0] = '\0';
	movb	$0, 16(%rsp)	;, filename[0]
	leaq	16(%rsp), %rbx	;, tmp146
; src/helper.c:174:     if (source == 0) {
	jne	.L82	;,
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	leaq	.LC15(%rip), %rsi	;, tmp105
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	; tmp150
	jne	.L83	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movabsq	$8246143026212319022, %rax	;, tmp159
	movq	%rax, 16(%rsp)	; tmp159, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rax	;, tmp160
	movq	%rax, 23(%rsp)	; tmp160, MEM <char[1:15]> [(void *)&filename]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L84	;
.L83:
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	leaq	.LC16(%rip), %rsi	;, tmp110
	movq	%rbp, %rdi	; import_name,
	call	*strcmp@GOTPCREL(%rip)	;
; src/helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	; tmp151
	jne	.L85	;,
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	movabsq	$8241920901561659182, %rax	;, tmp161
	movq	%rax, 16(%rsp)	; tmp161, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rax	;, tmp162
	movq	%rax, 21(%rsp)	; tmp162, MEM <char[1:13]> [(void *)&filename]
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:79:   return __builtin___strcpy_chk (__dest, __src, __glibc_objsize (__dest));
	jmp	.L84	;
.L85:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; tmp146,
	leaq	.LC17(%rip), %rdx	;, tmp116
	jmp	.L95	;
.L82:
	movq	%rsi, %rcx	; tmp148, source
; src/helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	movq	%rbx, %rdx	; tmp146,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp146,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	movq	%rbx, %rdx	; tmp146,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp146,
	leaq	.LC18(%rip), %rcx	;, tmp121
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	%rbp, %rcx	; import_name,
	movq	%rbx, %rdx	; tmp146,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp146,
	call	*string_append@GOTPCREL(%rip)	;
; src/helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	movq	%rbx, %rdx	; tmp146,
	movl	$1024, %esi	;,
	movq	%rbx, %rdi	; tmp146,
	leaq	.LC19(%rip), %rcx	;, tmp126
	call	*string_append@GOTPCREL(%rip)	;
.L84:
; src/helper.c:189:     openfile = fopen(filename, "r");
	leaq	.LC20(%rip), %rsi	;, tmp128
	movq	%rbx, %rdi	; tmp146,
	call	*fopen@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp152, tmp129
; src/helper.c:190:     if (openfile == NULL) {
	testq	%rax, %rax	; tmp129
	jne	.L87	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; tmp146,
	leaq	.LC21(%rip), %rdx	;, tmp132
.L95:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/helper.c:181:             return 0;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L81	;
.L87:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%rbx, %rdx	; tmp146,
	leaq	.LC22(%rip), %rsi	;, tmp134
	movl	$2, %edi	;,
	xorl	%eax, %eax	;
	call	*__printf_chk@GOTPCREL(%rip)	;
; src/helper.c:195:     size_t length = 0;
	xorl	%eax, %eax	;
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	8(%rsp), %rsi	;, tmp135
	movq	%r12, %rdi	; tmp129,
; src/helper.c:195:     size_t length = 0;
	movq	%rax, 8(%rsp)	;, length
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	call	*read_source@GOTPCREL(%rip)	;
; src/helper.c:197:     fclose(openfile);
	movq	%r12, %rdi	; tmp129,
; src/helper.c:196:     string source_code = read_source(openfile, &length);
	movq	%rax, %r14	; tmp153, source_code
; src/helper.c:197:     fclose(openfile);
	call	*fclose@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	create_parser	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	builtin_scope(%rip), %r12	; builtin_scope, builtin_scope.23_6
	movq	8(%rsp), %rsi	; length,
	movq	%r14, %rdi	; source_code,
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %r15	; tmp154, _5
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	*create_lexer@GOTPCREL(%rip)	;
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%r12, %rsi	; builtin_scope.23_6,
	movq	%r15, %rdx	; _5,
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rdi	; tmp155, _8
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	*parse_code@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movq	%rbx, %rdx	; tmp146,
	movl	$2, %edi	;,
	leaq	.LC23(%rip), %rsi	;, tmp138
; src/helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %r12	; tmp156, code
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	xorl	%eax, %eax	;
	call	*__printf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbx, %rcx	; tmp146,
	leaq	.LC24(%rip), %rdx	;, tmp141
; src/helper.c:200:     if (code == 0) {
	testq	%r12, %r12	; code
	je	.L95	;,
; src/helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%r12), %rax	; code_39->global_scope, code_39->global_scope
; src/helper.c:205:     Node* current = ((names))->head;
	movq	8(%rax), %rax	; _10->names, _10->names
	movq	(%rax), %rbx	; names_40->head, <retval>
.L90:
; src/helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	; <retval>
	je	.L81	;,
; src/helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %r12	; current_15->content, current_name
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	%rbp, %rsi	; import_name,
	movq	(%r12), %rdi	; current_name_43->name,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	; tmp157
	jne	.L91	;,
; src/helper.c:213:         current = node_ptr->next;
	movq	(%rbx), %rbx	; current_15->next, <retval>
	jmp	.L90	;
.L91:
; src/helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	8(%r13), %rdi	; scope_46(D)->names, scope_46(D)->names
	movq	%r12, %rsi	; current_name,
; src/helper.c:210:             name = current_name;
	movq	%r12, %rbx	; current_name, <retval>
; src/helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	call	list_append	;
.L81:
; src/helper.c:220: }
	addq	$1048, %rsp	;,
	movq	%rbx, %rax	; <retval>,
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
	jne	.L96	;,
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rsi	; ADD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp146
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	;, <retval>
; src/helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	; tmp146
	jne	.L96	;,
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rsi	; SUB_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp147
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	;, <retval>
; src/helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	; tmp147
	jne	.L96	;,
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rsi	; MUL_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp148
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	;, <retval>
; src/helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	; tmp148
	jne	.L96	;,
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rsi	; DIV_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp149
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	;, <retval>
; src/helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	; tmp149
	jne	.L96	;,
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rsi	; MOD_ASSIGN_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp150
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	;, <retval>
; src/helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	; tmp150
	jne	.L96	;,
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	AND_SYMBOL(%rip), %rsi	; AND_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp151
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	;, <retval>
; src/helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	; tmp151
	jne	.L96	;,
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	OR_SYMBOL(%rip), %rsi	; OR_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp152
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	;, <retval>
; src/helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	; tmp152
	jne	.L96	;,
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	EQ_SYMBOL(%rip), %rsi	; EQ_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp153
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	;, <retval>
; src/helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	; tmp153
	jne	.L96	;,
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	NE_SYMBOL(%rip), %rsi	; NE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp154
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	;, <retval>
; src/helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	; tmp154
	jne	.L96	;,
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	LT_SYMBOL(%rip), %rsi	; LT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp155
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	;, <retval>
; src/helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	; tmp155
	jne	.L96	;,
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	GT_SYMBOL(%rip), %rsi	; GT_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp156
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	;, <retval>
; src/helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	; tmp156
	jne	.L96	;,
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	LE_SYMBOL(%rip), %rsi	; LE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp157
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	;, <retval>
; src/helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	; tmp157
	jne	.L96	;,
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	GE_SYMBOL(%rip), %rsi	; GE_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp158
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	;, <retval>
; src/helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	; tmp158
	jne	.L96	;,
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	ADD_SYMBOL(%rip), %rsi	; ADD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp159
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	; <retval>
; src/helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	; tmp159
	jne	.L96	;,
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp160
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	;, <retval>
; src/helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	; tmp160
	jne	.L96	;,
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	MUL_SYMBOL(%rip), %rsi	; MUL_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp161
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	;, <retval>
; src/helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%dl, %dl	; tmp161
	jne	.L96	;,
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	DIV_SYMBOL(%rip), %rsi	; DIV_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %edx	;, tmp162
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	;, <retval>
; src/helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%dl, %dl	; tmp162
	jne	.L96	;,
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	MOD_SYMBOL(%rip), %rsi	; MOD_SYMBOL,
	movq	%rbx, %rdi	; str,
	call	*string_equal@GOTPCREL(%rip)	;
; src/helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	;, _38
	sbbl	%eax, %eax	; <retval>
	andl	$15, %eax	;, <retval>
	addl	$4, %eax	;, <retval>
.L96:
; src/helper.c:244: }
	popq	%rbx	;
	ret	
	.size	string_to_operator, .-string_to_operator
	.globl	operator_precedence
	.type	operator_precedence, @function
operator_precedence:
; src/helper.c:246: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	; <retval>
	cmpl	$18, %edi	;, op
	ja	.L118	;,
	movl	%edi, %edi	; op, op
	leaq	CSWTCH.66(%rip), %rax	;, tmp85
	movsbl	(%rax,%rdi), %eax	; CSWTCH.66[op_2(D)], <retval>
.L118:
; src/helper.c:276: }
	ret	
	.size	operator_precedence, .-operator_precedence
	.globl	operator_to_string
	.type	operator_to_string, @function
operator_to_string:
; src/helper.c:279:     switch (op) {
	xorl	%eax, %eax	; <retval>
	cmpl	$18, %edi	;, op
	ja	.L121	;,
	leaq	.L124(%rip), %rdx	;, tmp85
	movl	%edi, %edi	; op, op
	movslq	(%rdx,%rdi,4), %rax	;, tmp87
	addq	%rdx, %rax	; tmp85, tmp88
	jmp	*%rax	; tmp88
	.section	.rodata
	.align 4
	.align 4
.L124:
	.long	.L142-.L124
	.long	.L141-.L124
	.long	.L140-.L124
	.long	.L139-.L124
	.long	.L138-.L124
	.long	.L137-.L124
	.long	.L136-.L124
	.long	.L135-.L124
	.long	.L134-.L124
	.long	.L133-.L124
	.long	.L132-.L124
	.long	.L131-.L124
	.long	.L130-.L124
	.long	.L129-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L126-.L124
	.long	.L125-.L124
	.long	.L123-.L124
	.text
.L129:
; src/helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	ASSIGN_SYMBOL(%rip), %rax	; ASSIGN_SYMBOL, <retval>
	ret	
.L128:
; src/helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	ADD_ASSIGN_SYMBOL(%rip), %rax	; ADD_ASSIGN_SYMBOL, <retval>
	ret	
.L127:
; src/helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	SUB_ASSIGN_SYMBOL(%rip), %rax	; SUB_ASSIGN_SYMBOL, <retval>
	ret	
.L126:
; src/helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	MUL_ASSIGN_SYMBOL(%rip), %rax	; MUL_ASSIGN_SYMBOL, <retval>
	ret	
.L125:
; src/helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	DIV_ASSIGN_SYMBOL(%rip), %rax	; DIV_ASSIGN_SYMBOL, <retval>
	ret	
.L123:
; src/helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	MOD_ASSIGN_SYMBOL(%rip), %rax	; MOD_ASSIGN_SYMBOL, <retval>
	ret	
.L131:
; src/helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	AND_SYMBOL(%rip), %rax	; AND_SYMBOL, <retval>
	ret	
.L130:
; src/helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	OR_SYMBOL(%rip), %rax	; OR_SYMBOL, <retval>
	ret	
.L137:
; src/helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	EQ_SYMBOL(%rip), %rax	; EQ_SYMBOL, <retval>
	ret	
.L136:
; src/helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	NE_SYMBOL(%rip), %rax	; NE_SYMBOL, <retval>
	ret	
.L135:
; src/helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	LT_SYMBOL(%rip), %rax	; LT_SYMBOL, <retval>
	ret	
.L134:
; src/helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	GT_SYMBOL(%rip), %rax	; GT_SYMBOL, <retval>
	ret	
.L133:
; src/helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	LE_SYMBOL(%rip), %rax	; LE_SYMBOL, <retval>
	ret	
.L132:
; src/helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	GE_SYMBOL(%rip), %rax	; GE_SYMBOL, <retval>
	ret	
.L142:
; src/helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	ADD_SYMBOL(%rip), %rax	; ADD_SYMBOL, <retval>
	ret	
.L141:
; src/helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	SUB_SYMBOL(%rip), %rax	; SUB_SYMBOL, <retval>
	ret	
.L140:
; src/helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	MUL_SYMBOL(%rip), %rax	; MUL_SYMBOL, <retval>
	ret	
.L139:
; src/helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	DIV_SYMBOL(%rip), %rax	; DIV_SYMBOL, <retval>
	ret	
.L138:
; src/helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	MOD_SYMBOL(%rip), %rax	; MOD_SYMBOL, <retval>
.L121:
; src/helper.c:302: }
	ret	
	.size	operator_to_string, .-operator_to_string
	.section	.rodata
	.align 16
	.type	CSWTCH.66, @object
	.size	CSWTCH.66, 19
CSWTCH.66:
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
