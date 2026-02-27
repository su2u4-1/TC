	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
	.seh_proc	create_list
create_list:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_list
 ; D:\TC\src\helper.c:9:     new_list->head = 0;
	movq	-8(%rbp), %rax	 ; new_list, tmp85
	movq	$0, (%rax)	 ;, new_list_3->head
 ; D:\TC\src\helper.c:10:     new_list->tail = 0;
	movq	-8(%rbp), %rax	 ; new_list, tmp86
	movq	$0, 8(%rax)	 ;, new_list_3->tail
 ; D:\TC\src\helper.c:11:     return new_list;
	movq	-8(%rbp), %rax	 ; new_list, _6
 ; D:\TC\src\helper.c:12: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
	.seh_proc	create_node
create_node:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; content, content
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_node
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	movq	-8(%rbp), %rax	 ; new_node, tmp85
	movq	$0, (%rax)	 ;, new_node_3->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	-8(%rbp), %rax	 ; new_node, tmp86
	movq	16(%rbp), %rdx	 ; content, tmp87
	movq	%rdx, 8(%rax)	 ; tmp87, new_node_3->content
 ; D:\TC\src\helper.c:18:     return new_node;
	movq	-8(%rbp), %rax	 ; new_node, _7
 ; D:\TC\src\helper.c:19: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
	.seh_proc	list_append
list_append:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; list, list
	movq	%rdx, 24(%rbp)	 ; item, item
 ; D:\TC\src\helper.c:22:     Node* new_node = create_node(item);
	movq	24(%rbp), %rax	 ; item, tmp84
	movq	%rax, %rcx	 ; tmp84,
	call	create_node	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, new_node
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	movq	16(%rbp), %rax	 ; list, tmp86
	movq	(%rax), %rax	 ; list_8(D)->head, _1
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	testq	%rax, %rax	 ; _1
	jne	.L6	 ;,
 ; D:\TC\src\helper.c:24:         list->head = new_node;
	movq	16(%rbp), %rax	 ; list, tmp87
	movq	-8(%rbp), %rdx	 ; new_node, tmp88
	movq	%rdx, (%rax)	 ; tmp88, list_8(D)->head
 ; D:\TC\src\helper.c:25:         list->tail = new_node;
	movq	16(%rbp), %rax	 ; list, tmp89
	movq	-8(%rbp), %rdx	 ; new_node, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, list_8(D)->tail
 ; D:\TC\src\helper.c:30: }
	jmp	.L8	 ;
.L6:
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	16(%rbp), %rax	 ; list, tmp91
	movq	8(%rax), %rax	 ; list_8(D)->tail, _2
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	-8(%rbp), %rdx	 ; new_node, tmp92
	movq	%rdx, (%rax)	 ; tmp92, _2->next
 ; D:\TC\src\helper.c:28:         list->tail = new_node;
	movq	16(%rbp), %rax	 ; list, tmp93
	movq	-8(%rbp), %rdx	 ; new_node, tmp94
	movq	%rdx, 8(%rax)	 ; tmp94, list_8(D)->tail
.L8:
 ; D:\TC\src\helper.c:30: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.seh_proc	list_copy
list_copy:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; original, original
 ; D:\TC\src\helper.c:33:     list() new_list = create_list();
	call	create_list	 ;
	movq	%rax, -8(%rbp)	 ; tmp86, new_list
 ; D:\TC\src\helper.c:34:     new_list->head = original->head;
	movq	16(%rbp), %rax	 ; original, tmp87
	movq	(%rax), %rdx	 ; original_6(D)->head, _1
 ; D:\TC\src\helper.c:34:     new_list->head = original->head;
	movq	-8(%rbp), %rax	 ; new_list, tmp88
	movq	%rdx, (%rax)	 ; _1, new_list_5->head
 ; D:\TC\src\helper.c:35:     new_list->tail = original->tail;
	movq	16(%rbp), %rax	 ; original, tmp89
	movq	8(%rax), %rdx	 ; original_6(D)->tail, _2
 ; D:\TC\src\helper.c:35:     new_list->tail = original->tail;
	movq	-8(%rbp), %rax	 ; new_list, tmp90
	movq	%rdx, 8(%rax)	 ; _2, new_list_5->tail
 ; D:\TC\src\helper.c:36:     return new_list;
	movq	-8(%rbp), %rax	 ; new_list, _9
 ; D:\TC\src\helper.c:37: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.seh_proc	list_pop
list_pop:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$16, %rsp	 ;,
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; list, list
 ; D:\TC\src\helper.c:40:     if (list->head == 0)
	movq	16(%rbp), %rax	 ; list, tmp87
	movq	(%rax), %rax	 ; list_8(D)->head, _1
 ; D:\TC\src\helper.c:40:     if (list->head == 0)
	testq	%rax, %rax	 ; _1
	jne	.L12	 ;,
 ; D:\TC\src\helper.c:41:         return 0;
	movl	$0, %eax	 ;, _4
	jmp	.L13	 ;
.L12:
 ; D:\TC\src\helper.c:42:     Node* head_node = list->head;
	movq	16(%rbp), %rax	 ; list, tmp88
	movq	(%rax), %rax	 ; list_8(D)->head, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, head_node
 ; D:\TC\src\helper.c:43:     list->head = head_node->next;
	movq	-8(%rbp), %rax	 ; head_node, tmp90
	movq	(%rax), %rdx	 ; head_node_9->next, _2
 ; D:\TC\src\helper.c:43:     list->head = head_node->next;
	movq	16(%rbp), %rax	 ; list, tmp91
	movq	%rdx, (%rax)	 ; _2, list_8(D)->head
 ; D:\TC\src\helper.c:44:     if (list->head == 0)
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	(%rax), %rax	 ; list_8(D)->head, _3
 ; D:\TC\src\helper.c:44:     if (list->head == 0)
	testq	%rax, %rax	 ; _3
	jne	.L14	 ;,
 ; D:\TC\src\helper.c:45:         list->tail = 0;
	movq	16(%rbp), %rax	 ; list, tmp93
	movq	$0, 8(%rax)	 ;, list_8(D)->tail
.L14:
 ; D:\TC\src\helper.c:46:     return head_node->content;
	movq	-8(%rbp), %rax	 ; head_node, tmp94
	movq	8(%rax), %rax	 ; head_node_9->content, _4
.L13:
 ; D:\TC\src\helper.c:47: }
	addq	$16, %rsp	 ;,
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movl	%edx, 24(%rbp)	 ; kind, kind
	movq	%r8, 32(%rbp)	 ; name_info, name_info
	movq	%r9, 40(%rbp)	 ; scope_info, scope_info
 ; D:\TC\src\helper.c:52:     Name* result = search(scope, name);
	movq	16(%rbp), %rdx	 ; name, tmp109
	movq	48(%rbp), %rax	 ; scope, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	search	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, result
 ; D:\TC\src\helper.c:53:     if (result != NULL) {
	cmpq	$0, -8(%rbp)	 ;, result
	je	.L16	 ;,
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	movq	16(%rbp), %rdx	 ; name, tmp112
	movq	%rdx, %r8	 ; tmp112,
	leaq	.LC0(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; _2,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:55:         switch (result->kind) {
	movq	-8(%rbp), %rax	 ; result, tmp114
	movl	24(%rax), %eax	 ; result_35->kind, _3
 ; D:\TC\src\helper.c:55:         switch (result->kind) {
	cmpl	$5, %eax	 ;, _3
	ja	.L17	 ;,
	movl	%eax, %eax	 ; _3, tmp115
	leaq	0(,%rax,4), %rdx	 ;, tmp116
	leaq	.L19(%rip), %rax	 ;, tmp117
	movl	(%rdx,%rax), %eax	 ;, tmp118
	cltq
	leaq	.L19(%rip), %rdx	 ;, tmp121
	addq	%rdx, %rax	 ; tmp121, tmp120
	jmp	*%rax	 ; tmp120
	.section .rdata,"dr"
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
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	movq	%rax, %r9	 ; _5,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:58:                 break;
	jmp	.L16	 ;
.L23:
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	movq	24(%rax), %rax	 ; _6->_stderr, _7
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	movq	%rax, %r9	 ; _7,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:61:                 break;
	jmp	.L16	 ;
.L22:
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	movq	%rax, %r9	 ; _9,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:64:                 break;
	jmp	.L16	 ;
.L21:
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	movq	24(%rax), %rax	 ; _10->_stderr, _11
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	movq	%rax, %r9	 ; _11,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:67:                 break;
	jmp	.L16	 ;
.L20:
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	movq	24(%rax), %rax	 ; _12->_stderr, _13
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	movq	%rax, %r9	 ; _13,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rax	 ;, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:70:                 break;
	jmp	.L16	 ;
.L18:
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	movq	24(%rax), %rax	 ; _14->_stderr, _15
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	movq	%rax, %r9	 ; _15,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:73:                 break;
	jmp	.L16	 ;
.L17:
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	movq	24(%rax), %rax	 ; _16->_stderr, _17
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	movq	%rax, %r9	 ; _17,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:76:                 break;
	nop	
.L16:
 ; D:\TC\src\helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -16(%rbp)	 ; tmp129, new_name
 ; D:\TC\src\helper.c:80:     new_name->name = name;
	movq	-16(%rbp), %rax	 ; new_name, tmp130
	movq	16(%rbp), %rdx	 ; name, tmp131
	movq	%rdx, (%rax)	 ; tmp131, new_name_53->name
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, id_counter.0_18
	addq	$1, %rax	 ;, _19
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _19, id_counter
	movq	id_counter.0(%rip), %rdx	 ; id_counter, id_counter.1_20
	movq	-16(%rbp), %rax	 ; new_name, tmp132
	movq	%rdx, 8(%rax)	 ; id_counter.1_20, new_name_53->id
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movq	-16(%rbp), %rax	 ; new_name, tmp133
	movl	24(%rbp), %edx	 ; kind, tmp134
	movl	%edx, 24(%rax)	 ; tmp134, new_name_53->kind
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$1, 24(%rbp)	 ;, kind
	je	.L25	 ;,
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$5, 24(%rbp)	 ;, kind
	je	.L25	 ;,
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$2, 24(%rbp)	 ;, kind
	je	.L25	 ;,
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$3, 24(%rbp)	 ;, kind
	jne	.L26	 ;,
.L25:
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpq	$0, 32(%rbp)	 ;, name_info
	je	.L26	 ;,
 ; D:\TC\src\helper.c:84:         new_name->info.type = name_info;
	movq	-16(%rbp), %rax	 ; new_name, tmp135
	movq	32(%rbp), %rdx	 ; name_info, tmp136
	movq	%rdx, 16(%rax)	 ; tmp136, new_name_53->info.type
	jmp	.L27	 ;
.L26:
 ; D:\TC\src\helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, 24(%rbp)	 ;, kind
	jne	.L28	 ;,
 ; D:\TC\src\helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpq	$0, 40(%rbp)	 ;, scope_info
	je	.L28	 ;,
 ; D:\TC\src\helper.c:86:         new_name->info.scope = scope_info;
	movq	-16(%rbp), %rax	 ; new_name, tmp137
	movq	40(%rbp), %rdx	 ; scope_info, tmp138
	movq	%rdx, 16(%rax)	 ; tmp138, new_name_53->info.scope
	jmp	.L27	 ;
.L28:
 ; D:\TC\src\helper.c:87:     else if (kind == NAME_TYPE)
	cmpl	$0, 24(%rbp)	 ;, kind
	jne	.L29	 ;,
 ; D:\TC\src\helper.c:88:         new_name->info.type = NULL;
	movq	-16(%rbp), %rax	 ; new_name, tmp139
	movq	$0, 16(%rax)	 ;, new_name_53->info.type
	jmp	.L27	 ;
.L29:
 ; D:\TC\src\helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	cmpq	$0, 32(%rbp)	 ;, name_info
	jne	.L30	 ;,
 ; D:\TC\src\helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	cmpq	$0, 40(%rbp)	 ;, scope_info
	jne	.L30	 ;,
 ; D:\TC\src\helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	cmpl	$0, 24(%rbp)	 ;, kind
	je	.L30	 ;,
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movq	24(%rax), %rax	 ; _21->_stderr, _22
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movl	24(%rbp), %edx	 ; kind, tmp140
	movl	%edx, %r8d	 ; tmp140,
	leaq	.LC8(%rip), %rdx	 ;, tmp141
	movq	%rax, %rcx	 ; _22,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	jmp	.L31	 ;
.L30:
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movq	24(%rax), %rax	 ; _23->_stderr, _24
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movl	24(%rbp), %edx	 ; kind, tmp142
	movl	%edx, %r8d	 ; tmp142,
	leaq	.LC9(%rip), %rdx	 ;, tmp143
	movq	%rax, %rcx	 ; _24,
	call	fprintf	 ;
.L31:
 ; D:\TC\src\helper.c:94:         return NULL;
	movl	$0, %eax	 ;, _26
	jmp	.L32	 ;
.L27:
 ; D:\TC\src\helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	48(%rbp), %rax	 ; scope, tmp144
	movq	8(%rax), %rax	 ; scope_32(D)->names, _25
	movq	-16(%rbp), %rdx	 ; new_name, tmp145
	movq	%rax, %rcx	 ; _25,
	call	list_append	 ;
 ; D:\TC\src\helper.c:97:     return new_name;
	movq	-16(%rbp), %rax	 ; new_name, _26
.L32:
 ; D:\TC\src\helper.c:98: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.seh_proc	create_scope
create_scope:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; parent, parent
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, new_scope
 ; D:\TC\src\helper.c:102:     Scope* scope_ptr = (new_scope);
	movq	-8(%rbp), %rax	 ; new_scope, tmp86
	movq	%rax, -16(%rbp)	 ; tmp86, scope_ptr
 ; D:\TC\src\helper.c:103:     scope_ptr->parent = parent;
	movq	-16(%rbp), %rax	 ; scope_ptr, tmp87
	movq	16(%rbp), %rdx	 ; parent, tmp88
	movq	%rdx, (%rax)	 ; tmp88, scope_ptr_5->parent
 ; D:\TC\src\helper.c:104:     scope_ptr->names = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:104:     scope_ptr->names = create_list();
	movq	-16(%rbp), %rdx	 ; scope_ptr, tmp89
	movq	%rax, 8(%rdx)	 ; _1, scope_ptr_5->names
 ; D:\TC\src\helper.c:105:     return new_scope;
	movq	-8(%rbp), %rax	 ; new_scope, _10
 ; D:\TC\src\helper.c:106: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
	.seh_proc	search
search:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; scope, scope
	movq	%rdx, 24(%rbp)	 ; name, name
 ; D:\TC\src\helper.c:109:     Scope* scope_ptr = (scope);
	movq	16(%rbp), %rax	 ; scope, tmp86
	movq	%rax, -8(%rbp)	 ; tmp86, scope_ptr
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	jmp	.L36	 ;
.L41:
 ; D:\TC\src\helper.c:111:         list(Name*) names = scope_ptr->names;
	movq	-8(%rbp), %rax	 ; scope_ptr, tmp87
	movq	8(%rax), %rax	 ; scope_ptr_3->names, tmp88
	movq	%rax, -24(%rbp)	 ; tmp88, names
 ; D:\TC\src\helper.c:112:         Node* current = ((names))->head;
	movq	-24(%rbp), %rax	 ; names, tmp89
	movq	(%rax), %rax	 ; names_13->head, tmp90
	movq	%rax, -16(%rbp)	 ; tmp90, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	jmp	.L37	 ;
.L40:
 ; D:\TC\src\helper.c:114:             Node* node_ptr = (current);
	movq	-16(%rbp), %rax	 ; current, tmp91
	movq	%rax, -32(%rbp)	 ; tmp91, node_ptr
 ; D:\TC\src\helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	-32(%rbp), %rax	 ; node_ptr, tmp92
	movq	8(%rax), %rax	 ; node_ptr_16->content, tmp93
	movq	%rax, -40(%rbp)	 ; tmp93, current_name
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	movq	-40(%rbp), %rax	 ; current_name, tmp94
	movq	(%rax), %rax	 ; current_name_17->name, _1
	movq	24(%rbp), %rdx	 ; name, tmp95
	movq	%rax, %rcx	 ; _1,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; _2
	je	.L38	 ;,
 ; D:\TC\src\helper.c:117:                 return current_name;
	movq	-40(%rbp), %rax	 ; current_name, _5
	jmp	.L39	 ;
.L38:
 ; D:\TC\src\helper.c:118:             current = node_ptr->next;
	movq	-32(%rbp), %rax	 ; node_ptr, tmp96
	movq	(%rax), %rax	 ; node_ptr_16->next, tmp97
	movq	%rax, -16(%rbp)	 ; tmp97, current
.L37:
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	cmpq	$0, -16(%rbp)	 ;, current
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	-8(%rbp), %rax	 ; scope_ptr, tmp98
	movq	(%rax), %rax	 ; scope_ptr_3->parent, tmp99
	movq	%rax, -8(%rbp)	 ; tmp99, scope_ptr
.L36:
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	cmpq	$0, -8(%rbp)	 ;, scope_ptr
	jne	.L41	 ;,
 ; D:\TC\src\helper.c:122:     return NULL;
	movl	$0, %eax	 ;, _5
.L39:
 ; D:\TC\src\helper.c:123: }
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_builtin_type
is_builtin_type:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; type, type
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp95
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD.3_1
	movq	16(%rbp), %rax	 ; type, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _2
	jne	.L43	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD.4_3
	movq	16(%rbp), %rax	 ; type, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _4
	jne	.L43	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp99
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD.5_5
	movq	16(%rbp), %rax	 ; type, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _6
	jne	.L43	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp101
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD.6_7
	movq	16(%rbp), %rax	 ; type, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _8
	jne	.L43	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp103
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD.7_9
	movq	16(%rbp), %rax	 ; type, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _10
	je	.L44	 ;,
.L43:
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.2_11
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L45	 ;
.L44:
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$0, %eax	 ;, iftmp.2_11
.L45:
 ; D:\TC\src\helper.c:127: }
	addq	$32, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
	.seh_proc	is_type
is_type:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$16, %rsp	 ;,
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; type, type
 ; D:\TC\src\helper.c:130:     Name* type_ptr = (type);
	movq	16(%rbp), %rax	 ; type, tmp87
	movq	%rax, -8(%rbp)	 ; tmp87, type_ptr
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movq	-8(%rbp), %rax	 ; type_ptr, tmp88
	movl	24(%rax), %eax	 ; type_ptr_5->kind, _1
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	testl	%eax, %eax	 ; _1
	je	.L48	 ;,
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movq	-8(%rbp), %rax	 ; type_ptr, tmp89
	movl	24(%rax), %eax	 ; type_ptr_5->kind, _2
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	cmpl	$4, %eax	 ;, _2
	jne	.L49	 ;,
.L48:
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movl	$1, %eax	 ;, iftmp.8_3
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	jmp	.L50	 ;
.L49:
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	movl	$0, %eax	 ;, iftmp.8_3
.L50:
 ; D:\TC\src\helper.c:132: }
	addq	$16, %rsp	 ;,
	popq	%rbp	 ;
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	leaq	48(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)	 ; message, message
	movq	%rdx, 40(%rbp)	 ; token, token
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	40(%rbp), %rax	 ; token, tmp88
	movq	16(%rax), %rax	 ; token_8(D)->column, _1
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rsi	 ;, _2
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	40(%rbp), %rax	 ; token, tmp89
	movq	8(%rax), %rax	 ; token_8(D)->line, _3
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rbx	 ;, _4
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	32(%rbp), %rdx	 ; message, tmp90
	movq	%rdx, 32(%rsp)	 ; tmp90,
	movq	%rsi, %r9	 ; _2,
	movq	%rbx, %r8	 ; _4,
	leaq	.LC10(%rip), %rdx	 ;, tmp91
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:136: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	set_bool_list;	.scl	3;	.type	32;	.endef
	.seh_proc	set_bool_list
set_bool_list:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$16, %rsp	 ;,
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; bool_list, bool_list
	movq	%rdx, 24(%rbp)	 ; index, index
	movl	%r8d, %eax	 ; value, tmp99
	movb	%al, 32(%rbp)	 ; tmp100, value
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movq	24(%rbp), %rax	 ; index, tmp101
	shrq	$3, %rax	 ;, tmp101
	movq	%rax, %rdx	 ; tmp101, _1
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movq	16(%rbp), %rax	 ; bool_list, tmp102
	addq	%rdx, %rax	 ; _1, _2
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movzbl	(%rax), %eax	 ; *_2, tmp103
	movb	%al, -1(%rbp)	 ; tmp103, word
 ; D:\TC\src\helper.c:140:     if (value)
	cmpb	$0, 32(%rbp)	 ;, value
	je	.L54	 ;,
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	24(%rbp), %rax	 ; index, tmp104
	andl	$7, %eax	 ;, _4
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %edx	 ;, tmp105
	movl	%eax, %ecx	 ; _4, tmp115
	sall	%cl, %edx	 ; tmp115, tmp105
	movl	%edx, %eax	 ; tmp105, _5
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%eax, %ecx	 ; _5, _6
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	24(%rbp), %rax	 ; index, tmp106
	shrq	$3, %rax	 ;, tmp106
	movq	%rax, %rdx	 ; tmp106, _7
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	16(%rbp), %rax	 ; bool_list, tmp107
	addq	%rax, %rdx	 ; tmp107, _8
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ecx, %eax	 ; _6, _6
	orb	-1(%rbp), %al	 ; word, _6
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movb	%al, (%rdx)	 ; _9, *_8
 ; D:\TC\src\helper.c:144: }
	jmp	.L56	 ;
.L54:
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	24(%rbp), %rax	 ; index, tmp108
	andl	$7, %eax	 ;, _11
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	$1, %edx	 ;, tmp109
	movl	%eax, %ecx	 ; _11, tmp119
	sall	%cl, %edx	 ; tmp119, tmp109
	movl	%edx, %eax	 ; tmp109, _12
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	 ; _14
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	24(%rbp), %rdx	 ; index, tmp110
	movq	%rdx, %rcx	 ; tmp110, tmp110
	shrq	$3, %rcx	 ;, tmp110
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	16(%rbp), %rdx	 ; bool_list, tmp111
	addq	%rcx, %rdx	 ; _15, _16
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	andb	-1(%rbp), %al	 ; word, _17
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movb	%al, (%rdx)	 ; _17, *_16
.L56:
 ; D:\TC\src\helper.c:144: }
	nop	
	addq	$16, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	get_bool_list;	.scl	3;	.type	32;	.endef
	.seh_proc	get_bool_list
get_bool_list:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; bool_list, bool_list
	movq	%rdx, 24(%rbp)	 ; index, index
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	24(%rbp), %rax	 ; index, tmp93
	shrq	$3, %rax	 ;, tmp93
	movq	%rax, %rdx	 ; tmp93, _1
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	16(%rbp), %rax	 ; bool_list, tmp94
	addq	%rdx, %rax	 ; _1, _2
	movzbl	(%rax), %eax	 ; *_2, _3
	movsbl	%al, %edx	 ; _3, _4
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	24(%rbp), %rax	 ; index, tmp95
	andl	$7, %eax	 ;, _6
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%eax, %ecx	 ; _6, tmp100
	sarl	%cl, %edx	 ; tmp100, _4
	movl	%edx, %eax	 ; _4, _7
	andl	$1, %eax	 ;, _8
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	testl	%eax, %eax	 ; _8
	setne	%al	 ;, _9
 ; D:\TC\src\helper.c:148: }
	popq	%rbp	 ;
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; out, out
	movq	%rdx, 24(%rbp)	 ; indent, indent
	movl	%r8d, %eax	 ; is_last, tmp89
	movq	%r9, 40(%rbp)	 ; parser, parser
	movb	%al, 32(%rbp)	 ; tmp90, is_last
 ; D:\TC\src\helper.c:151:     Parser* parser_ptr = (parser);
	movq	40(%rbp), %rax	 ; parser, tmp91
	movq	%rax, -16(%rbp)	 ; tmp91, parser_ptr
 ; D:\TC\src\helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	cmpb	$0, 32(%rbp)	 ;, is_last
	sete	%al	 ;, _1
	movzbl	%al, %edx	 ; _1, _2
 ; D:\TC\src\helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp92
	leaq	3(%rax), %rcx	 ;, _3
 ; D:\TC\src\helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	movq	24(%rbp), %rax	 ; indent, tmp93
	movl	%edx, %r8d	 ; _2,
	movq	%rax, %rdx	 ; tmp93,
	call	set_bool_list	 ;
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movq	$1, -8(%rbp)	 ;, i
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	jmp	.L60	 ;
.L63:
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp94
	leaq	3(%rax), %rcx	 ;, _4
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-8(%rbp), %rax	 ; i, tmp95
	movq	%rax, %rdx	 ; tmp95,
	call	get_bool_list	 ;
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	%al, %al	 ; _5
	je	.L61	 ;,
	leaq	.LC11(%rip), %rax	 ;, iftmp.9_7
	jmp	.L62	 ;
.L61:
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %rax	 ;, iftmp.9_7
.L62:
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	16(%rbp), %rcx	 ; out, tmp96
	movq	%rax, %rdx	 ; iftmp.9_7,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, -8(%rbp)	 ;, i
.L60:
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	movq	-8(%rbp), %rax	 ; i, tmp97
	cmpq	24(%rbp), %rax	 ; indent, tmp97
	jb	.L63	 ;,
 ; D:\TC\src\helper.c:155:     if (indent > 0)
	cmpq	$0, 24(%rbp)	 ;, indent
	je	.L67	 ;,
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 32(%rbp)	 ;, is_last
	je	.L65	 ;,
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC13(%rip), %rax	 ;, iftmp.10_8
	jmp	.L66	 ;
.L65:
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC14(%rip), %rax	 ;, iftmp.10_8
.L66:
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	movq	16(%rbp), %rcx	 ; out, tmp98
	movq	%rax, %rdx	 ; iftmp.10_8,
	call	fprintf	 ;
.L67:
 ; D:\TC\src\helper.c:157: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
	.seh_proc	create_parser
create_parser:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
 ; D:\TC\src\helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_parser
 ; D:\TC\src\helper.c:161:     Parser* parser_ptr = (new_parser);
	movq	-8(%rbp), %rax	 ; new_parser, tmp85
	movq	%rax, -16(%rbp)	 ; tmp85, parser_ptr
 ; D:\TC\src\helper.c:162:     parser_ptr->in_function = false;
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp86
	movb	$0, (%rax)	 ;, parser_ptr_4->in_function
 ; D:\TC\src\helper.c:163:     parser_ptr->in_method = false;
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp87
	movb	$0, 1(%rax)	 ;, parser_ptr_4->in_method
 ; D:\TC\src\helper.c:164:     parser_ptr->in_loop = false;
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp88
	movb	$0, 2(%rax)	 ;, parser_ptr_4->in_loop
 ; D:\TC\src\helper.c:165:     return new_parser;
	movq	-8(%rbp), %rax	 ; new_parser, _8
 ; D:\TC\src\helper.c:166: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
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
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$1152, %rsp	 ;,
	.seh_stackalloc	1152
	leaq	128(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 1056(%rbp)	 ; import_name, import_name
	movq	%rdx, 1064(%rbp)	 ; source, source
	movq	%r8, 1072(%rbp)	 ; scope, scope
 ; D:\TC\src\helper.c:169:     Name* name = 0;
	movq	$0, 1016(%rbp)	 ;, name
 ; D:\TC\src\helper.c:173:     filename[0] = '\0';
	movb	$0, -80(%rbp)	 ;, filename[0]
 ; D:\TC\src\helper.c:174:     if (source == 0) {
	cmpq	$0, 1064(%rbp)	 ;, source
	jne	.L71	 ;,
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	movq	1056(%rbp), %rax	 ; import_name, tmp100
	leaq	.LC15(%rip), %rdx	 ;, tmp101
	movq	%rax, %rcx	 ; tmp100,
	call	strcmp	 ;
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	 ; _1
	jne	.L72	 ;,
 ; D:\TC\src\helper.c:176:             strcpy(filename, "./std/print.tc");
	leaq	-80(%rbp), %rax	 ;, tmp102
	movabsq	$8246143026212319022, %rbx	 ;, tmp153
	movq	%rbx, (%rax)	 ; tmp153, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rsi	 ;, tmp154
	movq	%rsi, 7(%rax)	 ; tmp154, MEM <char[1:15]> [(void *)&filename]
	jmp	.L73	 ;
.L72:
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	movq	1056(%rbp), %rax	 ; import_name, tmp103
	leaq	.LC16(%rip), %rdx	 ;, tmp104
	movq	%rax, %rcx	 ; tmp103,
	call	strcmp	 ;
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	 ; _2
	jne	.L74	 ;,
 ; D:\TC\src\helper.c:178:             strcpy(filename, "./std/arr.tc");
	leaq	-80(%rbp), %rax	 ;, tmp105
	movabsq	$8241920901561659182, %rbx	 ;, tmp155
	movq	%rbx, (%rax)	 ; tmp155, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rsi	 ;, tmp156
	movq	%rsi, 5(%rax)	 ; tmp156, MEM <char[1:13]> [(void *)&filename]
	jmp	.L73	 ;
.L74:
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	leaq	-80(%rbp), %rdx	 ;, tmp106
	movq	%rdx, %r8	 ; tmp106,
	leaq	.LC17(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:181:             return 0;
	movl	$0, %eax	 ;, _19
	jmp	.L83	 ;
.L71:
 ; D:\TC\src\helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	movq	1064(%rbp), %rcx	 ; source, tmp108
	leaq	-80(%rbp), %rdx	 ;, tmp109
	leaq	-80(%rbp), %rax	 ;, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movq	%rdx, %r8	 ; tmp109,
	movl	$1024, %edx	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	string_append	 ;
 ; D:\TC\src\helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	leaq	-80(%rbp), %rdx	 ;, tmp111
	leaq	-80(%rbp), %rax	 ;, tmp112
	leaq	.LC18(%rip), %r9	 ;,
	movq	%rdx, %r8	 ; tmp111,
	movl	$1024, %edx	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	string_append	 ;
 ; D:\TC\src\helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	1056(%rbp), %rcx	 ; import_name, tmp113
	leaq	-80(%rbp), %rdx	 ;, tmp114
	leaq	-80(%rbp), %rax	 ;, tmp115
	movq	%rcx, %r9	 ; tmp113,
	movq	%rdx, %r8	 ; tmp114,
	movl	$1024, %edx	 ;,
	movq	%rax, %rcx	 ; tmp115,
	call	string_append	 ;
 ; D:\TC\src\helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	leaq	-80(%rbp), %rdx	 ;, tmp116
	leaq	-80(%rbp), %rax	 ;, tmp117
	leaq	.LC19(%rip), %r9	 ;,
	movq	%rdx, %r8	 ; tmp116,
	movl	$1024, %edx	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	string_append	 ;
.L73:
 ; D:\TC\src\helper.c:189:     openfile = fopen(filename, "r");
	leaq	-80(%rbp), %rax	 ;, tmp118
	leaq	.LC20(%rip), %rdx	 ;, tmp119
	movq	%rax, %rcx	 ; tmp118,
	call	fopen	 ;
	movq	%rax, 1000(%rbp)	 ; tmp120, openfile
 ; D:\TC\src\helper.c:190:     if (openfile == NULL) {
	cmpq	$0, 1000(%rbp)	 ;, openfile
	jne	.L76	 ;,
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	leaq	-80(%rbp), %rdx	 ;, tmp121
	movq	%rdx, %r8	 ; tmp121,
	leaq	.LC21(%rip), %rdx	 ;, tmp122
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:192:         return 0;
	movl	$0, %eax	 ;, _19
	jmp	.L83	 ;
.L76:
 ; D:\TC\src\helper.c:194:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	leaq	-80(%rbp), %rax	 ;, tmp123
	movq	%rax, %rdx	 ; tmp123,
	leaq	.LC22(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	printf	 ;
 ; D:\TC\src\helper.c:195:     size_t length = 0;
	movq	$0, -88(%rbp)	 ;, length
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	-88(%rbp), %rdx	 ;, tmp125
	movq	1000(%rbp), %rax	 ; openfile, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	read_source	 ;
	movq	%rax, 992(%rbp)	 ; tmp127, source_code
 ; D:\TC\src\helper.c:197:     fclose(openfile);
	movq	1000(%rbp), %rax	 ; openfile, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	fclose	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	create_parser	 ;
	movq	%rax, %rsi	 ;, _7
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp129
	movq	(%rax), %rbx	 ; builtin_scope, builtin_scope.11_8
	movq	-88(%rbp), %rdx	 ; length, length.12_9
	movq	992(%rbp), %rax	 ; source_code, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	create_lexer	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rsi, %r8	 ; _7,
	movq	%rbx, %rdx	 ; builtin_scope.11_8,
	movq	%rax, %rcx	 ; _10,
	call	parse_code	 ;
	movq	%rax, 984(%rbp)	 ; tmp131, code
 ; D:\TC\src\helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	leaq	-80(%rbp), %rax	 ;, tmp132
	movq	%rax, %rdx	 ; tmp132,
	leaq	.LC23(%rip), %rax	 ;, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	printf	 ;
 ; D:\TC\src\helper.c:200:     if (code == 0) {
	cmpq	$0, 984(%rbp)	 ;, code
	jne	.L77	 ;,
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rax	 ; _11->_stderr, _12
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	leaq	-80(%rbp), %rdx	 ;, tmp134
	movq	%rdx, %r8	 ; tmp134,
	leaq	.LC24(%rip), %rdx	 ;, tmp135
	movq	%rax, %rcx	 ; _12,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:202:         return 0;
	movl	$0, %eax	 ;, _19
	jmp	.L83	 ;
.L77:
 ; D:\TC\src\helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	984(%rbp), %rax	 ; code, tmp136
	movq	8(%rax), %rax	 ; code_49->global_scope, _13
 ; D:\TC\src\helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rax), %rax	 ; _13->names, tmp137
	movq	%rax, 976(%rbp)	 ; tmp137, names
 ; D:\TC\src\helper.c:205:     Node* current = ((names))->head;
	movq	976(%rbp), %rax	 ; names, tmp138
	movq	(%rax), %rax	 ; names_51->head, tmp139
	movq	%rax, 1008(%rbp)	 ; tmp139, current
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	jmp	.L78	 ;
.L81:
 ; D:\TC\src\helper.c:207:         Node* node_ptr = (current);
	movq	1008(%rbp), %rax	 ; current, tmp140
	movq	%rax, 968(%rbp)	 ; tmp140, node_ptr
 ; D:\TC\src\helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	968(%rbp), %rax	 ; node_ptr, tmp141
	movq	8(%rax), %rax	 ; node_ptr_53->content, tmp142
	movq	%rax, 960(%rbp)	 ; tmp142, current_name
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	960(%rbp), %rax	 ; current_name, tmp143
	movq	(%rax), %rax	 ; current_name_54->name, _14
	movq	1056(%rbp), %rdx	 ; import_name, tmp144
	movq	%rax, %rcx	 ; _14,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	 ; _15
	je	.L79	 ;,
 ; D:\TC\src\helper.c:210:             name = current_name;
	movq	960(%rbp), %rax	 ; current_name, tmp145
	movq	%rax, 1016(%rbp)	 ; tmp145, name
 ; D:\TC\src\helper.c:211:             break;
	jmp	.L80	 ;
.L79:
 ; D:\TC\src\helper.c:213:         current = node_ptr->next;
	movq	968(%rbp), %rax	 ; node_ptr, tmp146
	movq	(%rax), %rax	 ; node_ptr_53->next, tmp147
	movq	%rax, 1008(%rbp)	 ; tmp147, current
.L78:
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	cmpq	$0, 1008(%rbp)	 ;, current
	jne	.L81	 ;,
.L80:
 ; D:\TC\src\helper.c:215:     if (name != 0) {
	cmpq	$0, 1016(%rbp)	 ;, name
	je	.L82	 ;,
 ; D:\TC\src\helper.c:216:         Scope* scope_ptr = (scope);
	movq	1072(%rbp), %rax	 ; scope, tmp148
	movq	%rax, 952(%rbp)	 ; tmp148, scope_ptr
 ; D:\TC\src\helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	952(%rbp), %rax	 ; scope_ptr, tmp149
	movq	8(%rax), %rax	 ; scope_ptr_59->names, _16
	movq	1016(%rbp), %rdx	 ; name, tmp150
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
.L82:
 ; D:\TC\src\helper.c:219:     return name;
	movq	1016(%rbp), %rax	 ; name, _19
.L83:
 ; D:\TC\src\helper.c:220: }
	addq	$1152, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.seh_proc	string_to_operator
string_to_operator:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; str, str
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.13_1
	movq	16(%rbp), %rax	 ; str, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%al, %al	 ; _2
	je	.L85	 ;,
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, _39
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	jmp	.L86	 ;
.L85:
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.14_3
	movq	16(%rbp), %rax	 ; str, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%al, %al	 ; _4
	je	.L87	 ;,
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, _39
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	jmp	.L86	 ;
.L87:
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.15_5
	movq	16(%rbp), %rax	 ; str, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%al, %al	 ; _6
	je	.L88	 ;,
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, _39
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	jmp	.L86	 ;
.L88:
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.16_7
	movq	16(%rbp), %rax	 ; str, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%al, %al	 ; _8
	je	.L89	 ;,
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, _39
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	jmp	.L86	 ;
.L89:
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.17_9
	movq	16(%rbp), %rax	 ; str, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%al, %al	 ; _10
	je	.L90	 ;,
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, _39
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	jmp	.L86	 ;
.L90:
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.18_11
	movq	16(%rbp), %rax	 ; str, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%al, %al	 ; _12
	je	.L91	 ;,
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, _39
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	jmp	.L86	 ;
.L91:
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL.19_13
	movq	16(%rbp), %rax	 ; str, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%al, %al	 ; _14
	je	.L92	 ;,
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, _39
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	jmp	.L86	 ;
.L92:
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL.20_15
	movq	16(%rbp), %rax	 ; str, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%al, %al	 ; _16
	je	.L93	 ;,
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, _39
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	jmp	.L86	 ;
.L93:
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL.21_17
	movq	16(%rbp), %rax	 ; str, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%al, %al	 ; _18
	je	.L94	 ;,
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, _39
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	jmp	.L86	 ;
.L94:
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL.22_19
	movq	16(%rbp), %rax	 ; str, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%al, %al	 ; _20
	je	.L95	 ;,
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, _39
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	jmp	.L86	 ;
.L95:
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL.23_21
	movq	16(%rbp), %rax	 ; str, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%al, %al	 ; _22
	je	.L96	 ;,
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, _39
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	jmp	.L86	 ;
.L96:
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL.24_23
	movq	16(%rbp), %rax	 ; str, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%al, %al	 ; _24
	je	.L97	 ;,
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, _39
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	jmp	.L86	 ;
.L97:
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL.25_25
	movq	16(%rbp), %rax	 ; str, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%al, %al	 ; _26
	je	.L98	 ;,
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, _39
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	jmp	.L86	 ;
.L98:
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL.26_27
	movq	16(%rbp), %rax	 ; str, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%al, %al	 ; _28
	je	.L99	 ;,
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, _39
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	jmp	.L86	 ;
.L99:
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL.27_29
	movq	16(%rbp), %rax	 ; str, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%al, %al	 ; _30
	je	.L100	 ;,
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	 ;, _39
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	jmp	.L86	 ;
.L100:
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL.28_31
	movq	16(%rbp), %rax	 ; str, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%al, %al	 ; _32
	je	.L101	 ;,
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, _39
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	jmp	.L86	 ;
.L101:
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; MUL_SYMBOL, MUL_SYMBOL.29_33
	movq	16(%rbp), %rax	 ; str, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; _34
	je	.L102	 ;,
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, _39
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	jmp	.L86	 ;
.L102:
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp156
	movq	(%rax), %rdx	 ; DIV_SYMBOL, DIV_SYMBOL.30_35
	movq	16(%rbp), %rax	 ; str, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; _36
	je	.L103	 ;,
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, _39
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	jmp	.L86	 ;
.L103:
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp158
	movq	(%rax), %rdx	 ; MOD_SYMBOL, MOD_SYMBOL.31_37
	movq	16(%rbp), %rax	 ; str, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	testb	%al, %al	 ; _38
	je	.L104	 ;,
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movl	$4, %eax	 ;, _39
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	jmp	.L86	 ;
.L104:
 ; D:\TC\src\helper.c:243:     else return OP_NONE;
	movl	$19, %eax	 ;, _39
.L86:
 ; D:\TC\src\helper.c:244: }
	addq	$32, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:\TC\src\helper.c:247:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L106	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L108(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L108(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
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
 ; D:\TC\src\helper.c:254:             return 1;
	movl	$1, %eax	 ;, _1
	jmp	.L113	 ;
.L109:
 ; D:\TC\src\helper.c:257:             return 2;
	movl	$2, %eax	 ;, _1
	jmp	.L113	 ;
.L110:
 ; D:\TC\src\helper.c:264:             return 3;
	movl	$3, %eax	 ;, _1
	jmp	.L113	 ;
.L112:
 ; D:\TC\src\helper.c:267:             return 4;
	movl	$4, %eax	 ;, _1
	jmp	.L113	 ;
.L111:
 ; D:\TC\src\helper.c:271:             return 5;
	movl	$5, %eax	 ;, _1
	jmp	.L113	 ;
.L106:
 ; D:\TC\src\helper.c:274:             return 0;
	movl	$0, %eax	 ;, _1
.L113:
 ; D:\TC\src\helper.c:276: }
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:\TC\src\helper.c:279:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L115	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L117(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L117(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
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
 ; D:\TC\src\helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, _1
	jmp	.L136	 ;
.L121:
 ; D:\TC\src\helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, _1
	jmp	.L136	 ;
.L120:
 ; D:\TC\src\helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, _1
	jmp	.L136	 ;
.L119:
 ; D:\TC\src\helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, _1
	jmp	.L136	 ;
.L118:
 ; D:\TC\src\helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, _1
	jmp	.L136	 ;
.L116:
 ; D:\TC\src\helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, _1
	jmp	.L136	 ;
.L124:
 ; D:\TC\src\helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; AND_SYMBOL, _1
	jmp	.L136	 ;
.L123:
 ; D:\TC\src\helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; OR_SYMBOL, _1
	jmp	.L136	 ;
.L130:
 ; D:\TC\src\helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; EQ_SYMBOL, _1
	jmp	.L136	 ;
.L129:
 ; D:\TC\src\helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; NE_SYMBOL, _1
	jmp	.L136	 ;
.L128:
 ; D:\TC\src\helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; LT_SYMBOL, _1
	jmp	.L136	 ;
.L127:
 ; D:\TC\src\helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; GT_SYMBOL, _1
	jmp	.L136	 ;
.L126:
 ; D:\TC\src\helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; LE_SYMBOL, _1
	jmp	.L136	 ;
.L125:
 ; D:\TC\src\helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; GE_SYMBOL, _1
	jmp	.L136	 ;
.L135:
 ; D:\TC\src\helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; ADD_SYMBOL, _1
	jmp	.L136	 ;
.L134:
 ; D:\TC\src\helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; SUB_SYMBOL, _1
	jmp	.L136	 ;
.L133:
 ; D:\TC\src\helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; MUL_SYMBOL, _1
	jmp	.L136	 ;
.L132:
 ; D:\TC\src\helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; DIV_SYMBOL, _1
	jmp	.L136	 ;
.L131:
 ; D:\TC\src\helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp109
	movq	(%rax), %rax	 ; MOD_SYMBOL, _1
	jmp	.L136	 ;
.L115:
 ; D:\TC\src\helper.c:300:         default: return 0;
	movl	$0, %eax	 ;, _1
.L136:
 ; D:\TC\src\helper.c:302: }
	popq	%rbp	 ;
	ret	
	.seh_endproc
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_append;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
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
