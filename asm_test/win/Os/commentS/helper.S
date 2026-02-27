	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os
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
 ; D:\TC\src\helper.c:10:     new_list->tail = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, new_list_3->head
	movq	%rdx, 8(%rax)	 ;, new_list_3->tail
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
 ; D:\TC\src\helper.c:14: Node* create_node(pointer content) {
	movq	%rcx, %rbx	 ; tmp85, content
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, new_node_3->next
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
 ; D:\TC\src\helper.c:21: void list_append(list() list, pointer item) {
	movq	%rcx, %rbx	 ; tmp88, list
	movq	%rdx, %rcx	 ; tmp89, item
 ; D:\TC\src\helper.c:22:     Node* new_node = create_node(item);
	call	create_node	 ;
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	 ;, list_8(D)->head
	jne	.L4	 ;,
 ; D:\TC\src\helper.c:24:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_8(D)->head
	jmp	.L5	 ;
.L4:
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_8(D)->tail, list_8(D)->tail
	movq	%rax, (%rdx)	 ; new_node, _2->next
.L5:
 ; D:\TC\src\helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_8(D)->tail
 ; D:\TC\src\helper.c:30: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
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
 ; D:\TC\src\helper.c:32: list() list_copy(list() original) {
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
	jne	.L10	 ;,
 ; D:\TC\src\helper.c:45:         list->tail = 0;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rcx)	 ;, list_7(D)->tail
.L10:
 ; D:\TC\src\helper.c:46:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
.L8:
 ; D:\TC\src\helper.c:47: }
	ret	
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
 ; D:\TC\src\helper.c:100: Scope* create_scope(Scope* parent) {
	movq	%rcx, %rsi	 ; tmp86, parent
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:103:     scope_ptr->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movq	%rax, %rbx	 ; tmp87, <retval>
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
	movq	%rcx, %rbx	 ; tmp91, scope
	movq	%rdx, %rbp	 ; tmp92, name
.L16:
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%rbx, %rbx	 ; scope
	je	.L21	 ;,
 ; D:\TC\src\helper.c:112:         Node* current = ((names))->head;
	movq	8(%rbx), %rax	 ; scope_ptr_3->names, scope_ptr_3->names
	movq	(%rax), %rsi	 ; names_12->head, current
.L17:
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rsi, %rsi	 ; current
	je	.L22	 ;,
 ; D:\TC\src\helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rsi), %rdi	 ; current_4->content, <retval>
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	movq	%rbp, %rdx	 ; name,
	movq	(%rdi), %rcx	 ; current_name_15->name,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp93
	jne	.L15	 ;,
 ; D:\TC\src\helper.c:118:             current = node_ptr->next;
	movq	(%rsi), %rsi	 ; current_4->next, current
	jmp	.L17	 ;
.L22:
 ; D:\TC\src\helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	(%rbx), %rbx	 ; scope_ptr_3->parent, scope
	jmp	.L16	 ;
.L21:
 ; D:\TC\src\helper.c:122:     return NULL;
	xorl	%edi, %edi	 ; <retval>
.L15:
 ; D:\TC\src\helper.c:123: }
	movq	%rdi, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
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
.LC8:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
.LC9:
	.ascii "Error creating name: unknown NameType %u\12\0"
	.text
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
	.seh_proc	create_name
create_name:
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
 ; D:\TC\src\helper.c:50: Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
	movq	%rcx, %r12	 ; tmp162, name
	movl	%edx, %esi	 ; tmp163, kind
 ; D:\TC\src\helper.c:52:     Name* result = search(scope, name);
	movq	%rcx, %rdx	 ; name,
	movq	112(%rsp), %rcx	 ; scope,
 ; D:\TC\src\helper.c:50: Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
	movq	%r8, %rbp	 ; tmp164, name_info
	movq	%r9, %rdi	 ; tmp165, scope_info
 ; D:\TC\src\helper.c:52:     Name* result = search(scope, name);
	call	search	 ;
	movq	%rax, %rbx	 ; tmp166, result
 ; D:\TC\src\helper.c:53:     if (result != NULL) {
	testq	%rax, %rax	 ; result
	je	.L24	 ;,
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	movq	%r12, %r8	 ; name,
	leaq	.LC0(%rip), %rdx	 ;, tmp124
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
	call	fprintf	 ;
 ; D:\TC\src\helper.c:55:         switch (result->kind) {
	cmpl	$5, 24(%rbx)	 ;, result_44->kind
	ja	.L25	 ;,
	movl	24(%rbx), %eax	 ; result_44->kind, result_44->kind
	leaq	.L27(%rip), %rdx	 ;, tmp126
	movslq	(%rdx,%rax,4), %rax	 ;, tmp128
	addq	%rdx, %rax	 ; tmp126, tmp129
	jmp	*%rax	 ; tmp129
	.section .rdata,"dr"
	.align 4
.L27:
	.long	.L32-.L27
	.long	.L31-.L27
	.long	.L30-.L27
	.long	.L29-.L27
	.long	.L28-.L27
	.long	.L26-.L27
	.text
.L32:
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	leaq	.LC1(%rip), %rcx	 ;, tmp132
	movq	24(%rax), %rdx	 ;, _4->_stderr
	jmp	.L51	 ;
.L31:
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	leaq	.LC2(%rip), %rcx	 ;, tmp134
	movq	24(%rax), %rdx	 ;, _6->_stderr
	jmp	.L51	 ;
.L30:
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	leaq	.LC3(%rip), %rcx	 ;, tmp136
	movq	24(%rax), %rdx	 ;, _8->_stderr
	jmp	.L51	 ;
.L29:
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	leaq	.LC4(%rip), %rcx	 ;, tmp138
	movq	24(%rax), %rdx	 ;, _10->_stderr
	jmp	.L51	 ;
.L28:
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	leaq	.LC5(%rip), %rcx	 ;, tmp140
	movq	24(%rax), %rdx	 ;, _12->_stderr
	jmp	.L51	 ;
.L26:
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	leaq	.LC6(%rip), %rcx	 ;, tmp142
	movq	24(%rax), %rdx	 ;, _14->_stderr
	jmp	.L51	 ;
.L25:
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	leaq	.LC7(%rip), %rcx	 ;, tmp144
	movq	24(%rax), %rdx	 ; _16->_stderr, _16->_stderr
.L51:
	call	fputs	 ;
.L24:
 ; D:\TC\src\helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:80:     new_name->name = name;
	movq	%r12, (%rax)	 ; name, new_name_62->name
 ; D:\TC\src\helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movq	%rax, %rbx	 ; tmp175, <retval>
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp180
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movl	%esi, 24(%rbx)	 ; kind, new_name_62->kind
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	incq	%rax	 ; _19
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _19, id_counter
	movq	%rax, 8(%rbx)	 ; _19, new_name_62->id
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	leal	-1(%rsi), %eax	 ;, tmp146
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$2, %eax	 ;, tmp146
	jbe	.L33	 ;,
	cmpl	$5, %esi	 ;, kind
	je	.L33	 ;,
 ; D:\TC\src\helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, %esi	 ;, kind
	jne	.L36	 ;,
	testq	%rdi, %rdi	 ; scope_info
	je	.L36	 ;,
 ; D:\TC\src\helper.c:86:         new_name->info.scope = scope_info;
	movq	%rdi, 16(%rbx)	 ; scope_info, new_name_62->info.scope
	jmp	.L38	 ;
.L33:
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	testq	%rbp, %rbp	 ; name_info
	je	.L37	 ;,
 ; D:\TC\src\helper.c:84:         new_name->info.type = name_info;
	movq	%rbp, 16(%rbx)	 ; name_info, new_name_62->info.type
	jmp	.L38	 ;
.L36:
 ; D:\TC\src\helper.c:87:     else if (kind == NAME_TYPE)
	testl	%esi, %esi	 ; kind
	jne	.L37	 ;,
 ; D:\TC\src\helper.c:88:         new_name->info.type = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 16(%rbx)	 ;, new_name_62->info.type
	jmp	.L38	 ;
.L37:
 ; D:\TC\src\helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	orq	%rbp, %rdi	 ; name_info, tmp178
	jne	.L39	 ;,
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC8(%rip), %rdx	 ;, tmp157
	movq	24(%rax), %rcx	 ;, _30->_stderr
	jmp	.L52	 ;
.L39:
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC9(%rip), %rdx	 ;, tmp159
	movq	24(%rax), %rcx	 ;, _32->_stderr
.L52:
	call	fprintf	 ;
 ; D:\TC\src\helper.c:94:         return NULL;
	xorl	%ebx, %ebx	 ; <retval>
	jmp	.L23	 ;
.L38:
 ; D:\TC\src\helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	112(%rsp), %rax	 ; scope, tmp181
	movq	%rbx, %rdx	 ; <retval>,
	movq	8(%rax), %rcx	 ; scope_41(D)->names, scope_41(D)->names
	call	list_append	 ;
.L23:
 ; D:\TC\src\helper.c:98: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
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
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp96
	movq	(%rax), %rdx	 ; INT_KEYWORD,
 ; D:\TC\src\helper.c:125: bool is_builtin_type(string type) {
	movq	%rcx, %rbx	 ; tmp104, type
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp105
	je	.L54	 ;,
.L56:
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.2_11
	jmp	.L55	 ;
.L54:
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp106
	jne	.L56	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp98
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; STRING_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp107
	jne	.L56	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp99
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; BOOL_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp108
	jne	.L56	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp100
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; VOID_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp109
	setne	%al	 ;, iftmp.2_11
	movzbl	%al, %eax	 ; iftmp.2_11, iftmp.2_11
.L55:
 ; D:\TC\src\helper.c:127: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
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
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.seh_proc	parser_error
parser_error:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp98
	movq	8(%rdx), %r8	 ; token_8(D)->line, token_8(D)->line
	leaq	1(%rax), %r9	 ;, _2
	incq	%r8	 ; _4
 ; D:\TC\src\helper.c:134: void parser_error(const string message, Token* token) {
	movq	%rcx, %rbx	 ; tmp94, message
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	%r9, 56(%rsp)	 ; _2, %sfp
	movq	%r8, 48(%rsp)	 ; _4, %sfp
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	56(%rsp), %r9	 ; %sfp, _2
	movq	48(%rsp), %r8	 ; %sfp, _4
	leaq	.LC10(%rip), %rdx	 ;, tmp93
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rbx, 32(%rsp)	 ; message,
	call	fprintf	 ;
	nop	
 ; D:\TC\src\helper.c:136: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
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
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %eax	 ;, tmp111
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movq	%rdx, %rbx	 ; tmp137, indent
	movl	%r8d, %ebp	 ; tmp138, is_last
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movq	%rdx, %r8	 ; indent, tmp108
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movq	%rcx, %rdi	 ; tmp136, out
 ; D:\TC\src\helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	3(%r9), %r12	 ;, _3
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	shrq	$3, %r8	 ;, tmp108
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ebx, %ecx	 ; indent, tmp109
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	addq	%r12, %r8	 ; _3, _21
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	andl	$7, %ecx	 ;, tmp109
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movb	(%r8), %dl	 ; *_21, word
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	sall	%cl, %eax	 ; tmp109, tmp110
 ; D:\TC\src\helper.c:140:     if (value)
	testb	%bpl, %bpl	 ; is_last
	jne	.L60	 ;,
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%eax, %edx	 ; tmp110, cstore_4
.L62:
	movb	%dl, (%r8)	 ; cstore_4, *_21
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movl	$1, %esi	 ;, i
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %r13	 ;, tmp134
	leaq	.LC11(%rip), %r14	 ;, tmp135
	jmp	.L61	 ;
.L60:
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	 ; tmp112
	andl	%eax, %edx	 ; tmp112, cstore_4
	jmp	.L62	 ;
.L61:
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; indent, i
	jnb	.L69	 ;,
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	%rsi, %rax	 ; i, tmp113
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%esi, %ecx	 ; i, tmp115
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%r14, %rdx	 ; tmp135, iftmp.8_6
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	shrq	$3, %rax	 ;, tmp113
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	andl	$7, %ecx	 ;, tmp115
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movsbl	(%r12,%rax), %eax	 ; *_35, *_35
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	sarl	%cl, %eax	 ; tmp115, tmp116
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%rdi, %rcx	 ; out,
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	 ;, tmp116
	cmove	%r13, %rdx	 ; tmp134,, iftmp.8_6
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	incq	%rsi	 ; i
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	call	fprintf	 ;
	jmp	.L61	 ;
.L69:
 ; D:\TC\src\helper.c:155:     if (indent > 0)
	testq	%rbx, %rbx	 ; indent
	je	.L59	 ;,
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%bpl, %bpl	 ; is_last
	leaq	.LC13(%rip), %rax	 ;, tmp131
	leaq	.LC14(%rip), %rdx	 ;, tmp130
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rdi, %rcx	 ; out,
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	cmovne	%rax, %rdx	 ; tmp130,, tmp131, iftmp.9_7
 ; D:\TC\src\helper.c:157: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	jmp	fprintf	 ;
.L59:
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
	movw	$0, (%rax)	 ;, MEM <unsigned short> [(char *)new_parser_3]
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
	.ascii "./std/print.tc\0"
.LC17:
	.ascii "arr\0"
.LC18:
	.ascii "./std/arr.tc\0"
.LC19:
	.ascii "Error: Standard library file for import not found: %s\12\0"
.LC20:
	.ascii "/\0"
.LC21:
	.ascii ".tc\0"
.LC22:
	.ascii "r\0"
.LC23:
	.ascii "Error opening library file for import: %s\12\0"
.LC24:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC25:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC26:
	.ascii "Error parsing library file for import: %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.seh_proc	parse_import_file
parse_import_file:
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
	subq	$1088, %rsp	 ;,
	.seh_stackalloc	1088
	.seh_endprologue
 ; D:\TC\src\helper.c:174:     if (source == 0) {
	testq	%rdx, %rdx	 ; source
 ; D:\TC\src\helper.c:173:     filename[0] = '\0';
	movb	$0, 64(%rsp)	 ;, filename[0]
 ; D:\TC\src\helper.c:168: Name* parse_import_file(string import_name, string source, Scope* scope) {
	movq	%rcx, %rsi	 ; tmp146, import_name
	movq	%rdx, %r9	 ; tmp147, source
	movq	%r8, %rbp	 ; tmp148, scope
	leaq	64(%rsp), %rbx	 ;, tmp145
 ; D:\TC\src\helper.c:174:     if (source == 0) {
	jne	.L72	 ;,
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	leaq	.LC15(%rip), %rdx	 ;, tmp108
	call	strcmp	 ;
 ; D:\TC\src\helper.c:176:             strcpy(filename, "./std/print.tc");
	leaq	.LC16(%rip), %rdx	 ;, tmp110
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	 ; tmp149
	je	.L84	 ;,
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	leaq	.LC17(%rip), %rdx	 ;, tmp112
	movq	%rsi, %rcx	 ; import_name,
	call	strcmp	 ;
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	 ; tmp150
	jne	.L75	 ;,
 ; D:\TC\src\helper.c:178:             strcpy(filename, "./std/arr.tc");
	leaq	.LC18(%rip), %rdx	 ;, tmp114
.L84:
	movq	%rbx, %rcx	 ; tmp145,
	call	strcpy	 ;
	jmp	.L74	 ;
.L75:
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	movq	%rbx, %r8	 ; tmp145,
	leaq	.LC19(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	jmp	.L85	 ;
.L72:
 ; D:\TC\src\helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	movq	%rbx, %r8	 ; tmp145,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp145,
	call	string_append	 ;
 ; D:\TC\src\helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	movq	%rbx, %r8	 ; tmp145,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp145,
	leaq	.LC20(%rip), %r9	 ;,
	call	string_append	 ;
 ; D:\TC\src\helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	%rsi, %r9	 ; import_name,
	movq	%rbx, %r8	 ; tmp145,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp145,
	call	string_append	 ;
 ; D:\TC\src\helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	movq	%rbx, %r8	 ; tmp145,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp145,
	leaq	.LC21(%rip), %r9	 ;,
	call	string_append	 ;
.L74:
 ; D:\TC\src\helper.c:189:     openfile = fopen(filename, "r");
	leaq	.LC22(%rip), %rdx	 ;, tmp127
	movq	%rbx, %rcx	 ; tmp145,
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp152, openfile
 ; D:\TC\src\helper.c:190:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	jne	.L77	 ;,
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; tmp145,
	leaq	.LC23(%rip), %rdx	 ;, tmp130
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
.L85:
	call	fprintf	 ;
 ; D:\TC\src\helper.c:181:             return 0;
	xorl	%ebx, %ebx	 ; <retval>
	jmp	.L71	 ;
.L77:
 ; D:\TC\src\helper.c:194:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; tmp145,
	leaq	.LC24(%rip), %rcx	 ;, tmp132
	call	printf	 ;
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	56(%rsp), %rdx	 ;, tmp133
 ; D:\TC\src\helper.c:195:     size_t length = 0;
	xorl	%eax, %eax	 ;
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	movq	%rdi, %rcx	 ; openfile,
 ; D:\TC\src\helper.c:195:     size_t length = 0;
	movq	%rax, 56(%rsp)	 ;, length
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	call	read_source	 ;
 ; D:\TC\src\helper.c:197:     fclose(openfile);
	movq	%rdi, %rcx	 ; openfile,
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	movq	%rax, %r12	 ; tmp154, source_code
 ; D:\TC\src\helper.c:197:     fclose(openfile);
	call	fclose	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	create_parser	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	56(%rsp), %rdx	 ; length,
	movq	%r12, %rcx	 ; source_code,
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, 40(%rsp)	 ; _7, %sfp
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdi	 ; builtin_scope, builtin_scope.10_8
	call	create_lexer	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	40(%rsp), %r8	 ; %sfp, _7
	movq	%rdi, %rdx	 ; builtin_scope.10_8,
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rcx	 ; tmp156, _10
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	parse_code	 ;
 ; D:\TC\src\helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; tmp145,
	leaq	.LC25(%rip), %rcx	 ;, tmp137
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rdi	 ; tmp157, code
 ; D:\TC\src\helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	call	printf	 ;
 ; D:\TC\src\helper.c:200:     if (code == 0) {
	testq	%rdi, %rdi	 ; code
	jne	.L79	 ;,
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; tmp145,
	leaq	.LC26(%rip), %rdx	 ;, tmp140
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	jmp	.L85	 ;
.L79:
 ; D:\TC\src\helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rdi), %rax	 ; code_47->global_scope, code_47->global_scope
 ; D:\TC\src\helper.c:205:     Node* current = ((names))->head;
	movq	8(%rax), %rax	 ; _13->names, _13->names
	movq	(%rax), %rbx	 ; names_49->head, <retval>
.L80:
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L71	 ;,
 ; D:\TC\src\helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rdi	 ; current_18->content, current_name
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	%rsi, %rdx	 ; import_name,
	movq	(%rdi), %rcx	 ; current_name_52->name,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	 ; tmp159
	jne	.L81	 ;,
 ; D:\TC\src\helper.c:213:         current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_18->next, <retval>
	jmp	.L80	 ;
.L81:
 ; D:\TC\src\helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	8(%rbp), %rcx	 ; scope_55(D)->names, scope_55(D)->names
	movq	%rdi, %rdx	 ; current_name,
 ; D:\TC\src\helper.c:210:             name = current_name;
	movq	%rdi, %rbx	 ; current_name, <retval>
 ; D:\TC\src\helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	call	list_append	 ;
.L71:
 ; D:\TC\src\helper.c:220: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$1088, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
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
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL,
 ; D:\TC\src\helper.c:223: OperatorType string_to_operator(string str) {
	movq	%rcx, %rbx	 ; tmp144, str
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp145
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp145
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp123
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp146
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp146
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp147
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp147
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp125
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp148
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp148
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp149
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp149
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp127
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp150
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp150
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp128
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; AND_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp151
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp151
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp129
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; OR_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp152
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp152
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp130
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; EQ_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp153
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp153
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp131
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; NE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp154
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp154
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp132
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LT_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp155
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp155
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp133
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GT_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp156
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp156
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp134
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp157
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp157
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp135
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp158
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp158
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp136
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp159
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp159
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp137
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp160
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp138
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%dl, %dl	 ; tmp161
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp139
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%dl, %dl	 ; tmp162
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp140
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
.L86:
 ; D:\TC\src\helper.c:244: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.seh_endproc
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_precedence
operator_precedence:
	.seh_endprologue
 ; D:\TC\src\helper.c:246: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L107	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	CSWTCH.49(%rip), %rax	 ;, tmp85
	movsbl	(%rax,%rcx), %eax	 ; CSWTCH.49[op_2(D)], <retval>
.L107:
 ; D:\TC\src\helper.c:276: }
	ret	
	.seh_endproc
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.seh_proc	operator_to_string
operator_to_string:
	.seh_endprologue
 ; D:\TC\src\helper.c:279:     switch (op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L110	 ;,
	leaq	.L113(%rip), %rdx	 ;, tmp85
	movl	%ecx, %ecx	 ; op, op
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L113:
	.long	.L131-.L113
	.long	.L130-.L113
	.long	.L129-.L113
	.long	.L128-.L113
	.long	.L127-.L113
	.long	.L126-.L113
	.long	.L125-.L113
	.long	.L124-.L113
	.long	.L123-.L113
	.long	.L122-.L113
	.long	.L121-.L113
	.long	.L120-.L113
	.long	.L119-.L113
	.long	.L118-.L113
	.long	.L117-.L113
	.long	.L116-.L113
	.long	.L115-.L113
	.long	.L114-.L113
	.long	.L112-.L113
	.text
.L118:
 ; D:\TC\src\helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	jmp	.L133	 ;
.L117:
 ; D:\TC\src\helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	jmp	.L133	 ;
.L116:
 ; D:\TC\src\helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	jmp	.L133	 ;
.L115:
 ; D:\TC\src\helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	jmp	.L133	 ;
.L114:
 ; D:\TC\src\helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	jmp	.L133	 ;
.L112:
 ; D:\TC\src\helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	jmp	.L133	 ;
.L120:
 ; D:\TC\src\helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	jmp	.L133	 ;
.L119:
 ; D:\TC\src\helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	jmp	.L133	 ;
.L126:
 ; D:\TC\src\helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	jmp	.L133	 ;
.L125:
 ; D:\TC\src\helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	jmp	.L133	 ;
.L124:
 ; D:\TC\src\helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	jmp	.L133	 ;
.L123:
 ; D:\TC\src\helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	jmp	.L133	 ;
.L122:
 ; D:\TC\src\helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	jmp	.L133	 ;
.L121:
 ; D:\TC\src\helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	jmp	.L133	 ;
.L131:
 ; D:\TC\src\helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	jmp	.L133	 ;
.L130:
 ; D:\TC\src\helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	jmp	.L133	 ;
.L129:
 ; D:\TC\src\helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	jmp	.L133	 ;
.L128:
 ; D:\TC\src\helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	jmp	.L133	 ;
.L127:
 ; D:\TC\src\helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
.L133:
	movq	(%rax), %rax	 ;, <retval>
.L110:
 ; D:\TC\src\helper.c:302: }
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 16
CSWTCH.49:
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
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
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
