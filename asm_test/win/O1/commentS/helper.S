	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
	.seh_proc	create_list
create_list:
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:9:     new_list->head = 0;
	movq	$0, (%rax)	 ;, new_list_3->head
 ; D:\TC\src\helper.c:10:     new_list->tail = 0;
	movq	$0, 8(%rax)	 ;, new_list_3->tail
 ; D:\TC\src\helper.c:12: }
	addq	$40, %rsp	 ;,
	ret	
	.seh_endproc
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
	.seh_proc	create_node
create_node:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp85, content
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	 ;, new_node_3->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rbx, 8(%rax)	 ; content, new_node_3->content
 ; D:\TC\src\helper.c:19: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.seh_endproc
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
	.seh_proc	list_append
list_append:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp87, list
	movq	%rdx, %rcx	 ; tmp88, item
 ; D:\TC\src\helper.c:22:     Node* new_node = create_node(item);
	call	create_node	 ;
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	 ;, list_8(D)->head
	je	.L6	 ;,
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_8(D)->tail, _2
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	%rax, (%rdx)	 ; new_node, _2->next
.L5:
 ; D:\TC\src\helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_8(D)->tail
 ; D:\TC\src\helper.c:30: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L6:
 ; D:\TC\src\helper.c:24:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_8(D)->head
	jmp	.L5	 ;
	.seh_endproc
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.seh_proc	list_copy
list_copy:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp87, original
 ; D:\TC\src\helper.c:33:     list() new_list = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:34:     new_list->head = original->head;
	movq	(%rbx), %rdx	 ; original_6(D)->head, _1
 ; D:\TC\src\helper.c:34:     new_list->head = original->head;
	movq	%rdx, (%rax)	 ; _1, new_list_5->head
 ; D:\TC\src\helper.c:35:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	 ; original_6(D)->tail, _2
 ; D:\TC\src\helper.c:35:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	 ; _2, new_list_5->tail
 ; D:\TC\src\helper.c:37: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.seh_endproc
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	list_pop
list_pop:
	.seh_endprologue
 ; D:\TC\src\helper.c:40:     if (list->head == 0)
	movq	(%rcx), %rax	 ; list_7(D)->head, <retval>
 ; D:\TC\src\helper.c:40:     if (list->head == 0)
	testq	%rax, %rax	 ; <retval>
	je	.L8	 ;,
 ; D:\TC\src\helper.c:43:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; D:\TC\src\helper.c:43:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_7(D)->head
 ; D:\TC\src\helper.c:44:     if (list->head == 0)
	testq	%rdx, %rdx	 ; _2
	je	.L11	 ;,
.L10:
 ; D:\TC\src\helper.c:46:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
.L8:
 ; D:\TC\src\helper.c:47: }
	ret	
.L11:
 ; D:\TC\src\helper.c:45:         list->tail = 0;
	movq	$0, 8(%rcx)	 ;, list_7(D)->tail
	jmp	.L10	 ;
	.seh_endproc
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.seh_proc	create_scope
create_scope:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rsi	 ; tmp86, parent
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\src\helper.c:103:     scope_ptr->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; D:\TC\src\helper.c:104:     scope_ptr->names = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:104:     scope_ptr->names = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, new_scope_4->names
 ; D:\TC\src\helper.c:106: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.seh_endproc
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
	.seh_proc	search
search:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbp	 ; tmp92, scope
	movq	%rdx, %rdi	 ; tmp93, name
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L18	 ;,
.L17:
 ; D:\TC\src\helper.c:112:         Node* current = ((names))->head;
	movq	8(%rbp), %rax	 ; scope_ptr_22->names, scope_ptr_22->names
	movq	(%rax), %rbx	 ; names_11->head, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L15	 ;,
.L16:
 ; D:\TC\src\helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rsi	 ; current_23->content, <retval>
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	movq	(%rsi), %rcx	 ; current_name_14->name, current_name_14->name
	movq	%rdi, %rdx	 ; name,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp94
	jne	.L13	 ;,
 ; D:\TC\src\helper.c:118:             current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_23->next, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	 ; current
	jne	.L16	 ;,
.L15:
 ; D:\TC\src\helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	0(%rbp), %rbp	 ; scope_ptr_22->parent, scope
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%rbp, %rbp	 ; scope
	jne	.L17	 ;,
 ; D:\TC\src\helper.c:122:     return NULL;
	movq	%rbp, %rsi	 ; scope, <retval>
	jmp	.L13	 ;
.L18:
	movq	%rcx, %rsi	 ; scope, <retval>
.L13:
 ; D:\TC\src\helper.c:123: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
.LC1:
	.ascii "type\12\0"
.LC2:
	.ascii "variable\12\0"
.LC3:
	.ascii "function\12\0"
.LC4:
	.ascii "method\12\0"
.LC5:
	.ascii "class\12\0"
.LC6:
	.ascii "attribute\12\0"
.LC7:
	.ascii "unknown\12\0"
	.align 8
.LC8:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
	.align 8
.LC9:
	.ascii "Error creating name: unknown NameType %u\12\0"
	.text
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
	.seh_proc	create_name
create_name:
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rdi	 ; tmp162, name
	movl	%edx, %esi	 ; tmp163, kind
	movq	%r8, %rbp	 ; tmp164, name_info
	movq	%r9, %r12	 ; tmp165, scope_info
	movq	128(%rsp), %r13	 ; scope, scope
 ; D:\TC\src\helper.c:52:     Name* result = search(scope, name);
	movq	%rcx, %rdx	 ; name,
	movq	%r13, %rcx	 ; scope,
	call	search	 ;
	movq	%rax, %rbx	 ; tmp166, result
 ; D:\TC\src\helper.c:53:     if (result != NULL) {
	testq	%rax, %rax	 ; result
	je	.L22	 ;,
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
	movq	%rdi, %r8	 ; name,
	leaq	.LC0(%rip), %rdx	 ;, tmp124
	call	fprintf	 ;
 ; D:\TC\src\helper.c:55:         switch (result->kind) {
	cmpl	$5, 24(%rbx)	 ;, result_44->kind
	ja	.L23	 ;,
	movl	24(%rbx), %eax	 ; result_44->kind, result_44->kind
	leaq	.L25(%rip), %rdx	 ;, tmp126
	movslq	(%rdx,%rax,4), %rax	 ;, tmp128
	addq	%rdx, %rax	 ; tmp126, tmp129
	jmp	*%rax	 ; tmp129
	.section .rdata,"dr"
	.align 4
.L25:
	.long	.L30-.L25
	.long	.L29-.L25
	.long	.L28-.L25
	.long	.L27-.L25
	.long	.L26-.L25
	.long	.L24-.L25
	.text
.L30:
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
.L22:
 ; D:\TC\src\helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp175, <retval>
 ; D:\TC\src\helper.c:80:     new_name->name = name;
	movq	%rdi, (%rax)	 ; name, new_name_62->name
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp180
	addq	$1, %rax	 ;, _19
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _19, id_counter
	movq	%rax, 8(%rbx)	 ; _19, new_name_62->id
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movl	%esi, 24(%rbx)	 ; kind, new_name_62->kind
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	leal	-1(%rsi), %eax	 ;, tmp146
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$2, %eax	 ;, tmp146
	jbe	.L31	 ;,
	cmpl	$5, %esi	 ;, kind
	je	.L31	 ;,
 ; D:\TC\src\helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, %esi	 ;, kind
	jne	.L34	 ;,
	testq	%r12, %r12	 ; scope_info
	je	.L34	 ;,
 ; D:\TC\src\helper.c:86:         new_name->info.scope = scope_info;
	movq	%r12, 16(%rbx)	 ; scope_info, new_name_62->info.scope
	jmp	.L36	 ;
.L29:
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	movq	24(%rax), %r9	 ; _6->_stderr,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp134
	call	fwrite	 ;
 ; D:\TC\src\helper.c:61:                 break;
	jmp	.L22	 ;
.L28:
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	movq	24(%rax), %r9	 ; _8->_stderr,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:\TC\src\helper.c:64:                 break;
	jmp	.L22	 ;
.L27:
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	movq	24(%rax), %r9	 ; _10->_stderr,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp138
	call	fwrite	 ;
 ; D:\TC\src\helper.c:67:                 break;
	jmp	.L22	 ;
.L26:
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	movq	24(%rax), %r9	 ; _12->_stderr,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp140
	call	fwrite	 ;
 ; D:\TC\src\helper.c:70:                 break;
	jmp	.L22	 ;
.L24:
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	movq	24(%rax), %r9	 ; _14->_stderr,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp142
	call	fwrite	 ;
 ; D:\TC\src\helper.c:73:                 break;
	jmp	.L22	 ;
.L23:
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	movq	24(%rax), %r9	 ; _16->_stderr,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp144
	call	fwrite	 ;
 ; D:\TC\src\helper.c:76:                 break;
	jmp	.L22	 ;
.L31:
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	testq	%rbp, %rbp	 ; name_info
	je	.L35	 ;,
 ; D:\TC\src\helper.c:84:         new_name->info.type = name_info;
	movq	%rbp, 16(%rbx)	 ; name_info, new_name_62->info.type
.L36:
 ; D:\TC\src\helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	8(%r13), %rcx	 ; scope_41(D)->names, scope_41(D)->names
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
.L21:
 ; D:\TC\src\helper.c:98: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
.L34:
 ; D:\TC\src\helper.c:87:     else if (kind == NAME_TYPE)
	testl	%esi, %esi	 ; kind
	jne	.L35	 ;,
 ; D:\TC\src\helper.c:88:         new_name->info.type = NULL;
	movq	$0, 16(%rbx)	 ;, new_name_62->info.type
	jmp	.L36	 ;
.L35:
 ; D:\TC\src\helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	orq	%rbp, %r12	 ; name_info, tmp178
	jne	.L37	 ;,
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movq	24(%rax), %rcx	 ; _30->_stderr, _30->_stderr
	movl	%esi, %r8d	 ; kind,
	leaq	.LC8(%rip), %rdx	 ;, tmp157
	call	fprintf	 ;
 ; D:\TC\src\helper.c:94:         return NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	jmp	.L21	 ;
.L37:
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movq	24(%rax), %rcx	 ; _32->_stderr, _32->_stderr
	movl	%esi, %r8d	 ; kind,
	leaq	.LC9(%rip), %rdx	 ;, tmp159
	call	fprintf	 ;
 ; D:\TC\src\helper.c:94:         return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L21	 ;
	.seh_endproc
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_builtin_type
is_builtin_type:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp109, type
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp96
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp110
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.2_11
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp110
	je	.L45	 ;,
.L40:
 ; D:\TC\src\helper.c:127: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L45:
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp98
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp111
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.2_11
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp111
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp100
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp112
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.2_11
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp112
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp102
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp113
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.2_11
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp113
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp104
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp114
	setne	%al	 ;, iftmp.2_11
	movzbl	%al, %eax	 ; iftmp.2_11, iftmp.2_11
	jmp	.L40	 ;
	.seh_endproc
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_type
is_type:
	.seh_endprologue
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	testl	$-5, 24(%rcx)	 ;, type_4(D)->kind
	sete	%al	 ;, tmp90
 ; D:\TC\src\helper.c:132: }
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.seh_proc	parser_error
parser_error:
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rdi	 ; tmp94, message
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp98
	leaq	1(%rax), %rsi	 ;, _2
	movq	8(%rdx), %rbx	 ; token_8(D)->line, token_8(D)->line
	addq	$1, %rbx	 ;, _4
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rdi, 32(%rsp)	 ; message,
	movq	%rsi, %r9	 ; _2,
	movq	%rbx, %r8	 ; _4,
	leaq	.LC10(%rip), %rdx	 ;, tmp93
	call	fprintf	 ;
	nop	
 ; D:\TC\src\helper.c:136: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "\342\224\202   \0"
.LC12:
	.ascii "    \0"
.LC13:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC14:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
	.seh_proc	indention
indention:
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbp	 ; tmp133, out
	movq	%rdx, %rsi	 ; tmp134, indent
	movl	%r8d, %r14d	 ; tmp135, is_last
 ; D:\TC\src\helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	3(%r9), %rdi	 ;, _3
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movq	%rdx, %rax	 ; indent, tmp112
	shrq	$3, %rax	 ;, tmp112
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	addq	%rdi, %rax	 ; _3, _21
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movzbl	(%rax), %edx	 ; *_21, word
 ; D:\TC\src\helper.c:140:     if (value)
	testb	%r8b, %r8b	 ; is_last
	jne	.L49	 ;,
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%esi, %ecx	 ; indent, tmp113
	andl	$7, %ecx	 ;, tmp113
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %r8d	 ;, tmp115
	sall	%cl, %r8d	 ; tmp113, tmp114
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%r8d, %edx	 ; tmp114, cstore_19
.L52:
	movb	%dl, (%rax)	 ; cstore_19, *_21
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebx	 ;, i
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %r13	 ;, tmp127
	leaq	.LC11(%rip), %r12	 ;, tmp128
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	jbe	.L63	 ;,
.L50:
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	%rbx, %rax	 ; i, tmp120
	shrq	$3, %rax	 ;, tmp120
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movsbl	(%rdi,%rax), %eax	 ; *_35, *_35
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%ebx, %ecx	 ; i, tmp122
	andl	$7, %ecx	 ;, tmp122
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	sarl	%cl, %eax	 ; tmp122, tmp123
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	 ;, tmp123
	movq	%r12, %rdx	 ; tmp128, iftmp.8_6
	cmove	%r13, %rdx	 ; tmp127,, iftmp.8_6
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%rbp, %rcx	 ; out,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	 ;, i
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; i, indent
	jne	.L50	 ;,
.L54:
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r14b, %r14b	 ; is_last
	leaq	.LC14(%rip), %rdx	 ;, tmp129
	leaq	.LC13(%rip), %rax	 ;, tmp130
	cmovne	%rax, %rdx	 ; tmp129,, tmp130, iftmp.9_7
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rbp, %rcx	 ; out,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:157: }
	jmp	.L48	 ;
.L49:
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	%esi, %ecx	 ; indent, tmp116
	andl	$7, %ecx	 ;, tmp116
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	$1, %r8d	 ;, tmp118
	sall	%cl, %r8d	 ; tmp116, tmp117
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%r8d	 ; tmp119
	andl	%r8d, %edx	 ; tmp119, cstore_19
	jmp	.L52	 ;
.L63:
 ; D:\TC\src\helper.c:155:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	jne	.L54	 ;,
.L48:
 ; D:\TC\src\helper.c:157: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.seh_endproc
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.seh_proc	create_parser
create_parser:
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:162:     parser_ptr->in_function = false;
	movb	$0, (%rax)	 ;, new_parser_3->in_function
 ; D:\TC\src\helper.c:163:     parser_ptr->in_method = false;
	movb	$0, 1(%rax)	 ;, new_parser_3->in_method
 ; D:\TC\src\helper.c:164:     parser_ptr->in_loop = false;
	movb	$0, 2(%rax)	 ;, new_parser_3->in_loop
 ; D:\TC\src\helper.c:166: }
	addq	$40, %rsp	 ;,
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "print\0"
.LC16:
	.ascii "arr\0"
	.align 8
.LC17:
	.ascii "Error: Standard library file for import not found: %s\12\0"
.LC18:
	.ascii "/\0"
.LC19:
	.ascii ".tc\0"
.LC20:
	.ascii "r\0"
	.align 8
.LC21:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC22:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC23:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC24:
	.ascii "Error parsing library file for import: %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_import_file
parse_import_file:
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$1080, %rsp	 ;,
	.seh_stackalloc	1080
	.seh_endprologue
	movq	%rcx, %rdi	 ; tmp146, import_name
	movq	%rdx, %rbx	 ; tmp147, source
	movq	%r8, %rbp	 ; tmp148, scope
 ; D:\TC\src\helper.c:173:     filename[0] = '\0';
	movb	$0, 48(%rsp)	 ;, filename[0]
 ; D:\TC\src\helper.c:174:     if (source == 0) {
	testq	%rdx, %rdx	 ; source
	je	.L76	 ;,
 ; D:\TC\src\helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	leaq	48(%rsp), %rsi	 ;, tmp118
	movq	%rdx, %r9	 ; source,
	movq	%rsi, %r8	 ; tmp118,
	movl	$1024, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp118,
	call	string_append	 ;
 ; D:\TC\src\helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	leaq	.LC18(%rip), %r9	 ;,
	movq	%rsi, %r8	 ; tmp118,
	movl	$1024, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp118,
	call	string_append	 ;
 ; D:\TC\src\helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	%rdi, %r9	 ; import_name,
	movq	%rsi, %r8	 ; tmp118,
	movl	$1024, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp118,
	call	string_append	 ;
 ; D:\TC\src\helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	leaq	.LC19(%rip), %r9	 ;,
	movq	%rsi, %r8	 ; tmp118,
	movl	$1024, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp118,
	call	string_append	 ;
.L68:
 ; D:\TC\src\helper.c:189:     openfile = fopen(filename, "r");
	leaq	48(%rsp), %rcx	 ;, tmp126
	leaq	.LC20(%rip), %rdx	 ;, tmp127
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp152, <retval>
 ; D:\TC\src\helper.c:190:     if (openfile == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L77	 ;,
 ; D:\TC\src\helper.c:194:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	leaq	48(%rsp), %rsi	 ;, tmp131
	movq	%rsi, %rdx	 ; tmp131,
	leaq	.LC22(%rip), %rcx	 ;, tmp132
	call	printf	 ;
 ; D:\TC\src\helper.c:195:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	40(%rsp), %rdx	 ;, tmp133
	movq	%rbx, %rcx	 ; <retval>,
	call	read_source	 ;
	movq	%rax, %r12	 ; tmp154, source_code
 ; D:\TC\src\helper.c:197:     fclose(openfile);
	movq	%rbx, %rcx	 ; <retval>,
	call	fclose	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	create_parser	 ;
	movq	%rax, %rbx	 ; tmp155, _7
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp134
	movq	(%rax), %r13	 ; builtin_scope, builtin_scope.10_8
	movq	40(%rsp), %rdx	 ; length,
	movq	%r12, %rcx	 ; source_code,
	call	create_lexer	 ;
	movq	%rax, %rcx	 ; tmp156, _10
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rbx, %r8	 ; _7,
	movq	%r13, %rdx	 ; builtin_scope.10_8,
	call	parse_code	 ;
	movq	%rax, %rbx	 ; tmp157, <retval>
 ; D:\TC\src\helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rsi, %rdx	 ; tmp131,
	leaq	.LC23(%rip), %rcx	 ;, tmp137
	call	printf	 ;
 ; D:\TC\src\helper.c:200:     if (code == 0) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L78	 ;,
 ; D:\TC\src\helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rbx), %rax	 ; code_46->global_scope, code_46->global_scope
 ; D:\TC\src\helper.c:205:     Node* current = ((names))->head;
	movq	8(%rax), %rax	 ; _13->names, _13->names
	movq	(%rax), %rbx	 ; names_48->head, <retval>
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L65	 ;,
.L74:
 ; D:\TC\src\helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rsi	 ; current_63->content, current_name
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	(%rsi), %rcx	 ; current_name_50->name, current_name_50->name
	movq	%rdi, %rdx	 ; import_name,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	 ; tmp159
	jne	.L73	 ;,
 ; D:\TC\src\helper.c:213:         current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_63->next, <retval>
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	 ; <retval>
	jne	.L74	 ;,
	jmp	.L65	 ;
.L76:
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	leaq	.LC15(%rip), %rdx	 ;, tmp106
	call	strcmp	 ;
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	 ; tmp149
	je	.L79	 ;,
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	leaq	.LC16(%rip), %rdx	 ;, tmp111
	movq	%rdi, %rcx	 ; import_name,
	call	strcmp	 ;
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	 ; tmp150
	jne	.L69	 ;,
 ; D:\TC\src\helper.c:178:             strcpy(filename, "./std/arr.tc");
	movabsq	$8241920901561659182, %rax	 ;, tmp163
	movq	%rax, 48(%rsp)	 ; tmp163, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rax	 ;, tmp164
	movq	%rax, 53(%rsp)	 ; tmp164, MEM <char[1:13]> [(void *)&filename]
	jmp	.L68	 ;
.L79:
 ; D:\TC\src\helper.c:176:             strcpy(filename, "./std/print.tc");
	movabsq	$8246143026212319022, %rax	 ;, tmp161
	movq	%rax, 48(%rsp)	 ; tmp161, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rax	 ;, tmp162
	movq	%rax, 55(%rsp)	 ; tmp162, MEM <char[1:15]> [(void *)&filename]
	jmp	.L68	 ;
.L69:
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	leaq	48(%rsp), %r8	 ;,
	leaq	.LC17(%rip), %rdx	 ;, tmp117
	call	fprintf	 ;
 ; D:\TC\src\helper.c:181:             return 0;
	jmp	.L65	 ;
.L77:
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	leaq	48(%rsp), %r8	 ;,
	leaq	.LC21(%rip), %rdx	 ;, tmp130
	call	fprintf	 ;
 ; D:\TC\src\helper.c:192:         return 0;
	jmp	.L65	 ;
.L78:
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	movq	%rsi, %r8	 ; tmp131,
	leaq	.LC24(%rip), %rdx	 ;, tmp140
	call	fprintf	 ;
 ; D:\TC\src\helper.c:202:         return 0;
	jmp	.L65	 ;
.L73:
 ; D:\TC\src\helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	8(%rbp), %rcx	 ; scope_53(D)->names, scope_53(D)->names
	movq	%rsi, %rdx	 ; current_name,
	call	list_append	 ;
 ; D:\TC\src\helper.c:219:     return name;
	movq	%rsi, %rbx	 ; current_name, <retval>
.L65:
 ; D:\TC\src\helper.c:220: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$1080, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.seh_endproc
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.seh_proc	string_to_operator
string_to_operator:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp159, str
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp160
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp161
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp162
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp163
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp163
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp164
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp164
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp165
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp165
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp166
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp166
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp167
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp167
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp168
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp168
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp169
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp169
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp170
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp170
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp171
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp171
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp172
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp172
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp173
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp173
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp174
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp174
	je	.L101	 ;,
.L80:
 ; D:\TC\src\helper.c:244: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L101:
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp175
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp175
	jne	.L80	 ;,
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp153
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; tmp176
	jne	.L98	 ;,
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; tmp177
	jne	.L99	 ;,
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp155
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
	jmp	.L80	 ;
.L98:
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
	jmp	.L80	 ;
.L99:
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
	jmp	.L80	 ;
	.seh_endproc
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	.seh_endprologue
 ; D:\TC\src\helper.c:247:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L103	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	.L105(%rip), %rdx	 ;, tmp85
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L105:
	.long	.L109-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L108-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L107-.L105
	.long	.L110-.L105
	.long	.L110-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.long	.L104-.L105
	.text
.L104:
 ; D:\TC\src\helper.c:254:             return 1;
	movl	$1, %eax	 ;, <retval>
.L102:
 ; D:\TC\src\helper.c:276: }
	ret	
.L107:
 ; D:\TC\src\helper.c:264:             return 3;
	movl	$3, %eax	 ;, <retval>
	jmp	.L102	 ;
.L109:
 ; D:\TC\src\helper.c:267:             return 4;
	movl	$4, %eax	 ;, <retval>
	jmp	.L102	 ;
.L108:
 ; D:\TC\src\helper.c:271:             return 5;
	movl	$5, %eax	 ;, <retval>
	jmp	.L102	 ;
.L103:
 ; D:\TC\src\helper.c:274:             return 0;
	movl	$0, %eax	 ;, <retval>
	jmp	.L102	 ;
.L110:
 ; D:\TC\src\helper.c:247:     switch (op) {
	movl	$2, %eax	 ;, <retval>
	jmp	.L102	 ;
	.seh_endproc
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	.seh_endprologue
 ; D:\TC\src\helper.c:279:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L133	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	.L114(%rip), %rdx	 ;, tmp85
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L114:
	.long	.L132-.L114
	.long	.L131-.L114
	.long	.L130-.L114
	.long	.L129-.L114
	.long	.L128-.L114
	.long	.L127-.L114
	.long	.L126-.L114
	.long	.L125-.L114
	.long	.L124-.L114
	.long	.L123-.L114
	.long	.L122-.L114
	.long	.L121-.L114
	.long	.L120-.L114
	.long	.L119-.L114
	.long	.L118-.L114
	.long	.L117-.L114
	.long	.L116-.L114
	.long	.L115-.L114
	.long	.L113-.L114
	.text
.L119:
 ; D:\TC\src\helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, <retval>
.L111:
 ; D:\TC\src\helper.c:302: }
	ret	
.L118:
 ; D:\TC\src\helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, <retval>
	jmp	.L111	 ;
.L117:
 ; D:\TC\src\helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, <retval>
	jmp	.L111	 ;
.L116:
 ; D:\TC\src\helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, <retval>
	jmp	.L111	 ;
.L115:
 ; D:\TC\src\helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, <retval>
	jmp	.L111	 ;
.L113:
 ; D:\TC\src\helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, <retval>
	jmp	.L111	 ;
.L121:
 ; D:\TC\src\helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; AND_SYMBOL, <retval>
	jmp	.L111	 ;
.L120:
 ; D:\TC\src\helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; OR_SYMBOL, <retval>
	jmp	.L111	 ;
.L127:
 ; D:\TC\src\helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; EQ_SYMBOL, <retval>
	jmp	.L111	 ;
.L126:
 ; D:\TC\src\helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; NE_SYMBOL, <retval>
	jmp	.L111	 ;
.L125:
 ; D:\TC\src\helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; LT_SYMBOL, <retval>
	jmp	.L111	 ;
.L124:
 ; D:\TC\src\helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; GT_SYMBOL, <retval>
	jmp	.L111	 ;
.L123:
 ; D:\TC\src\helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; LE_SYMBOL, <retval>
	jmp	.L111	 ;
.L122:
 ; D:\TC\src\helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; GE_SYMBOL, <retval>
	jmp	.L111	 ;
.L132:
 ; D:\TC\src\helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; ADD_SYMBOL, <retval>
	jmp	.L111	 ;
.L131:
 ; D:\TC\src\helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; SUB_SYMBOL, <retval>
	jmp	.L111	 ;
.L130:
 ; D:\TC\src\helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; MUL_SYMBOL, <retval>
	jmp	.L111	 ;
.L129:
 ; D:\TC\src\helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; DIV_SYMBOL, <retval>
	jmp	.L111	 ;
.L128:
 ; D:\TC\src\helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; MOD_SYMBOL, <retval>
	jmp	.L111	 ;
.L133:
 ; D:\TC\src\helper.c:279:     switch (op) {
	movl	$0, %eax	 ;, <retval>
	jmp	.L111	 ;
	.seh_endproc
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_append;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.MOD_SYMBOL, "dr"
	.globl	.refptr.MOD_SYMBOL
	.linkonce	discard
.refptr.MOD_SYMBOL:
	.quad	MOD_SYMBOL
	.section	.rdata$.refptr.DIV_SYMBOL, "dr"
	.globl	.refptr.DIV_SYMBOL
	.linkonce	discard
.refptr.DIV_SYMBOL:
	.quad	DIV_SYMBOL
	.section	.rdata$.refptr.MUL_SYMBOL, "dr"
	.globl	.refptr.MUL_SYMBOL
	.linkonce	discard
.refptr.MUL_SYMBOL:
	.quad	MUL_SYMBOL
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.ADD_SYMBOL, "dr"
	.globl	.refptr.ADD_SYMBOL
	.linkonce	discard
.refptr.ADD_SYMBOL:
	.quad	ADD_SYMBOL
	.section	.rdata$.refptr.GE_SYMBOL, "dr"
	.globl	.refptr.GE_SYMBOL
	.linkonce	discard
.refptr.GE_SYMBOL:
	.quad	GE_SYMBOL
	.section	.rdata$.refptr.LE_SYMBOL, "dr"
	.globl	.refptr.LE_SYMBOL
	.linkonce	discard
.refptr.LE_SYMBOL:
	.quad	LE_SYMBOL
	.section	.rdata$.refptr.GT_SYMBOL, "dr"
	.globl	.refptr.GT_SYMBOL
	.linkonce	discard
.refptr.GT_SYMBOL:
	.quad	GT_SYMBOL
	.section	.rdata$.refptr.LT_SYMBOL, "dr"
	.globl	.refptr.LT_SYMBOL
	.linkonce	discard
.refptr.LT_SYMBOL:
	.quad	LT_SYMBOL
	.section	.rdata$.refptr.NE_SYMBOL, "dr"
	.globl	.refptr.NE_SYMBOL
	.linkonce	discard
.refptr.NE_SYMBOL:
	.quad	NE_SYMBOL
	.section	.rdata$.refptr.EQ_SYMBOL, "dr"
	.globl	.refptr.EQ_SYMBOL
	.linkonce	discard
.refptr.EQ_SYMBOL:
	.quad	EQ_SYMBOL
	.section	.rdata$.refptr.OR_SYMBOL, "dr"
	.globl	.refptr.OR_SYMBOL
	.linkonce	discard
.refptr.OR_SYMBOL:
	.quad	OR_SYMBOL
	.section	.rdata$.refptr.AND_SYMBOL, "dr"
	.globl	.refptr.AND_SYMBOL
	.linkonce	discard
.refptr.AND_SYMBOL:
	.quad	AND_SYMBOL
	.section	.rdata$.refptr.MOD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MOD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MOD_ASSIGN_SYMBOL:
	.quad	MOD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.DIV_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.DIV_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.DIV_ASSIGN_SYMBOL:
	.quad	DIV_ASSIGN_SYMBOL
	.section	.rdata$.refptr.MUL_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.MUL_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.MUL_ASSIGN_SYMBOL:
	.quad	MUL_ASSIGN_SYMBOL
	.section	.rdata$.refptr.SUB_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.SUB_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.SUB_ASSIGN_SYMBOL:
	.quad	SUB_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ADD_ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ADD_ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ADD_ASSIGN_SYMBOL:
	.quad	ADD_ASSIGN_SYMBOL
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD
