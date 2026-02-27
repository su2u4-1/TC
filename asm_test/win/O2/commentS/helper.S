	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.p2align 4
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	pushq	%rbp	 ;
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:7: list() create_list(void) {
	movq	%rsp, %rbp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:9:     new_list->head = 0;
	pxor	%xmm0, %xmm0	 ; tmp83
	movups	%xmm0, (%rax)	 ; tmp83, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_3]
 ; D:\TC\src\helper.c:12: }
	leave	
	ret	
	.p2align 4
	.globl	create_node
	.def	create_node;	.scl	2;	.type	32;	.endef
create_node:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp85, content
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:14: Node* create_node(pointer content) {
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	 ;, new_node_3->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rbx, 8(%rax)	 ; content, new_node_3->content
 ; D:\TC\src\helper.c:19: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.p2align 4
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp89, item
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp88, list
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:21: void list_append(list() list, pointer item) {
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	 ;, list_6(D)->head
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	 ;, new_node_11->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_11->content
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	je	.L10	 ;,
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_6(D)->tail, list_6(D)->tail
	movq	%rax, (%rdx)	 ; new_node, _2->next
 ; D:\TC\src\helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_6(D)->tail
 ; D:\TC\src\helper.c:30: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\helper.c:24:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_6(D)->head
 ; D:\TC\src\helper.c:25:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_6(D)->tail
 ; D:\TC\src\helper.c:30: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.p2align 4
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp88, original
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:32: list() list_copy(list() original) {
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:9:     new_list->head = 0;
	pxor	%xmm0, %xmm0	 ; tmp85
	movups	%xmm0, (%rax)	 ; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
 ; D:\TC\src\helper.c:34:     new_list->head = original->head;
	movdqu	(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(struct Node * *)original_4(D)], tmp91
 ; D:\TC\src\helper.c:37: }
	movq	-8(%rbp), %rbx	 ;,
 ; D:\TC\src\helper.c:34:     new_list->head = original->head;
	movups	%xmm1, (%rax)	 ; tmp91, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
 ; D:\TC\src\helper.c:37: }
	leave	
	ret	
	.p2align 4
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
 ; D:\TC\src\helper.c:40:     if (list->head == 0)
	movq	(%rcx), %rax	 ; list_7(D)->head, <retval>
 ; D:\TC\src\helper.c:40:     if (list->head == 0)
	testq	%rax, %rax	 ; <retval>
	je	.L13	 ;,
 ; D:\TC\src\helper.c:43:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; D:\TC\src\helper.c:43:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_7(D)->head
 ; D:\TC\src\helper.c:44:     if (list->head == 0)
	testq	%rdx, %rdx	 ; _2
	je	.L19	 ;,
.L15:
 ; D:\TC\src\helper.c:46:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
.L13:
 ; D:\TC\src\helper.c:47: }
	ret	
	.p2align 4,,10
	.p2align 3
.L19:
 ; D:\TC\src\helper.c:45:         list->tail = 0;
	movq	$0, 8(%rcx)	 ;, list_7(D)->tail
	jmp	.L15	 ;
	.section .rdata,"dr"
.LC0:
	.ascii "type\12\0"
.LC1:
	.ascii "variable\12\0"
.LC2:
	.ascii "function\12\0"
.LC3:
	.ascii "method\12\0"
.LC4:
	.ascii "class\12\0"
.LC5:
	.ascii "attribute\12\0"
.LC6:
	.ascii "unknown\12\0"
	.align 8
.LC7:
	.ascii "Error creating name: name_info and scope_info are both NULL for kind %u\12\0"
	.align 8
.LC8:
	.ascii "Error creating name: unknown NameType %u\12\0"
	.align 8
.LC9:
	.ascii "Warning: Name '%s' already exists in the current scope, returning existing name, kind: \0"
	.text
	.p2align 4
	.globl	create_name
	.def	create_name;	.scl	2;	.type	32;	.endef
create_name:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	movq	%r8, %r13	 ; tmp172, name_info
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movl	%edx, %edi	 ; tmp171, kind
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp170, name
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:50: Name* create_name(string name, NameType kind, Name* name_info, Scope* scope_info, Scope* scope) {
	movq	48(%rbp), %r14	 ; scope, scope
	movq	%r9, 40(%rbp)	 ; tmp173, scope_info
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%r14, %r14	 ; scope
	je	.L22	 ;,
	movq	%r14, %r12	 ; scope, scope_ptr
.L21:
 ; D:\TC\src\helper.c:112:         Node* current = ((names))->head;
	movq	8(%r12), %rax	 ; scope_ptr_44->names, scope_ptr_44->names
	movq	(%rax), %rbx	 ; names_79->head, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	 ; current
	jne	.L25	 ;,
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L65:
 ; D:\TC\src\helper.c:118:             current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_77->next, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L23	 ;,
.L25:
 ; D:\TC\src\helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %r15	 ; current_77->content, current_name
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	movq	%rsi, %rdx	 ; name,
	movq	(%r15), %rcx	 ; current_name_82->name, current_name_82->name
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp174
	je	.L65	 ;,
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:54:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, returning existing name, kind: ", name);
	movq	%rsi, %r8	 ; name,
	leaq	.LC9(%rip), %rdx	 ;, tmp163
	movq	24(%rax), %rcx	 ; _1->_stderr, _1->_stderr
	call	fprintf	 ;
 ; D:\TC\src\helper.c:55:         switch (result->kind) {
	cmpl	$5, 24(%r15)	 ;, current_name_82->kind
	ja	.L33	 ;,
	movl	24(%r15), %eax	 ; current_name_82->kind, current_name_82->kind
	leaq	.L44(%rip), %rdx	 ;, tmp165
	movslq	(%rdx,%rax,4), %rax	 ;, tmp167
	addq	%rdx, %rax	 ; tmp165, tmp168
	jmp	*%rax	 ; tmp168
	.section .rdata,"dr"
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
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:57:                 fprintf(stderr, "type\n");
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp134
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L22:
 ; D:\TC\src\helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:80:     new_name->name = name;
	movq	%rsi, (%rax)	 ; name, new_name_62->name
 ; D:\TC\src\helper.c:79:     Name* new_name = (Name*)alloc_memory(sizeof(Name));
	movq	%rax, %rbx	 ; tmp182, <retval>
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp189
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movl	%edi, 24(%rbx)	 ; kind, new_name_62->kind
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	addq	$1, %rax	 ;, _19
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _19, id_counter
	movq	%rax, 8(%rbx)	 ; _19, new_name_62->id
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	movl	%edi, %eax	 ; kind, tmp148
	andl	$-5, %eax	 ;, tmp148
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	cmpl	$1, %eax	 ;, tmp148
	je	.L34	 ;,
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	leal	-2(%rdi), %eax	 ;, tmp149
	cmpl	$1, %eax	 ;, tmp149
	jbe	.L34	 ;,
 ; D:\TC\src\helper.c:85:     else if (kind == NAME_CLASS && scope_info != NULL)
	cmpl	$4, %edi	 ;, kind
	jne	.L38	 ;,
	cmpq	$0, 40(%rbp)	 ;, scope_info
	je	.L38	 ;,
 ; D:\TC\src\helper.c:86:         new_name->info.scope = scope_info;
	movq	40(%rbp), %rax	 ; scope_info, tmp191
	movq	%rax, 16(%rbx)	 ; tmp191, new_name_62->info.scope
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L34:
 ; D:\TC\src\helper.c:83:     if ((kind == NAME_VARIABLE || kind == NAME_ATTRIBUTE || kind == NAME_FUNCTION || kind == NAME_METHOD) && name_info != NULL)
	testq	%r13, %r13	 ; name_info
	je	.L36	 ;,
 ; D:\TC\src\helper.c:84:         new_name->info.type = name_info;
	movq	%r13, 16(%rbx)	 ; name_info, new_name_62->info.type
.L37:
 ; D:\TC\src\helper.c:96:     list_append(scope->names, (pointer)new_name);
	movq	8(%r14), %rsi	 ; scope_41(D)->names, _34
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rsi)	 ;, _34->head
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	 ;, new_node_89->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rbx, 8(%rax)	 ; <retval>, new_node_89->content
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	je	.L66	 ;,
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	8(%rsi), %rdx	 ; _34->tail, _34->tail
	movq	%rax, (%rdx)	 ; new_node, _91->next
 ; D:\TC\src\helper.c:28:         list->tail = new_node;
	movq	%rax, 8(%rsi)	 ; new_node, _34->tail
.L20:
 ; D:\TC\src\helper.c:98: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:\TC\src\helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	(%r12), %r12	 ; scope_ptr_44->parent, scope_ptr
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%r12, %r12	 ; scope_ptr
	jne	.L21	 ;,
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L66:
 ; D:\TC\src\helper.c:24:         list->head = new_node;
	movq	%rax, %xmm0	 ; new_node, tmp159
	punpcklqdq	%xmm0, %xmm0	 ; tmp159
	movups	%xmm0, (%rsi)	 ; tmp159, MEM <vector(2) long unsigned int> [(struct Node * *)_34]
	jmp	.L20	 ;
.L28:
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:60:                 fprintf(stderr, "variable\n");
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp136
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:61:                 break;
	jmp	.L22	 ;
.L29:
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:63:                 fprintf(stderr, "function\n");
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp138
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:64:                 break;
	jmp	.L22	 ;
.L30:
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:66:                 fprintf(stderr, "method\n");
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rcx	 ;, tmp140
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:67:                 break;
	jmp	.L22	 ;
.L31:
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:69:                 fprintf(stderr, "class\n");
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp142
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:70:                 break;
	jmp	.L22	 ;
.L32:
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:72:                 fprintf(stderr, "attribute\n");
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp144
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:73:                 break;
	jmp	.L22	 ;
.L33:
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:75:                 fprintf(stderr, "unknown\n");
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp146
	movq	24(%rax), %r9	 ; _16->_stderr,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:76:                 break;
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:\TC\src\helper.c:90:         if (name_info == NULL && scope_info == NULL && kind != NAME_TYPE)
	orq	40(%rbp), %r13	 ; scope_info, tmp187
	jne	.L39	 ;,
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movl	%edi, %r8d	 ; kind,
	leaq	.LC7(%rip), %rdx	 ;, tmp156
 ; D:\TC\src\helper.c:94:         return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:\TC\src\helper.c:91:             fprintf(stderr, "Error creating name: name_info and scope_info are both NULL for kind %u\n", kind);
	movq	24(%rax), %rcx	 ;, _30->_stderr
	call	fprintf	 ;
	jmp	.L20	 ;
.L38:
 ; D:\TC\src\helper.c:87:     else if (kind == NAME_TYPE)
	testl	%edi, %edi	 ; kind
	jne	.L36	 ;,
 ; D:\TC\src\helper.c:88:         new_name->info.type = NULL;
	movq	$0, 16(%rbx)	 ;, new_name_62->info.type
	jmp	.L37	 ;
.L39:
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movl	%edi, %r8d	 ; kind,
	leaq	.LC8(%rip), %rdx	 ;, tmp158
 ; D:\TC\src\helper.c:94:         return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:\TC\src\helper.c:93:             fprintf(stderr, "Error creating name: unknown NameType %u\n", kind);
	movq	24(%rax), %rcx	 ;, _32->_stderr
	call	fprintf	 ;
	jmp	.L20	 ;
	.p2align 4
	.globl	create_scope
	.def	create_scope;	.scl	2;	.type	32;	.endef
create_scope:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp87, parent
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:100: Scope* create_scope(Scope* parent) {
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:103:     scope_ptr->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_3->parent
 ; D:\TC\src\helper.c:101:     Scope* new_scope = (Scope*)alloc_memory(sizeof(Scope));
	movq	%rax, %rbx	 ; tmp88, <retval>
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:9:     new_list->head = 0;
	pxor	%xmm0, %xmm0	 ; tmp85
	movups	%xmm0, (%rax)	 ; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
 ; D:\TC\src\helper.c:104:     scope_ptr->names = create_list();
	movq	%rax, 8(%rbx)	 ; new_list, new_scope_3->names
 ; D:\TC\src\helper.c:106: }
	leaq	-16(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	search
	.def	search;	.scl	2;	.type	32;	.endef
search:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L70	 ;,
	movq	%rcx, %rbp	 ; tmp92, scope
	movq	%rdx, %rdi	 ; tmp93, name
.L74:
 ; D:\TC\src\helper.c:112:         Node* current = ((names))->head;
	movq	8(%rbp), %rax	 ; scope_ptr_22->names, scope_ptr_22->names
	movq	(%rax), %rbx	 ; names_12->head, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	 ; current
	jne	.L73	 ;,
	jmp	.L71	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:\TC\src\helper.c:118:             current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_23->next, current
 ; D:\TC\src\helper.c:113:         while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L71	 ;,
.L73:
 ; D:\TC\src\helper.c:115:             Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rsi	 ; current_23->content, <retval>
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	movq	%rdi, %rdx	 ; name,
	movq	(%rsi), %rcx	 ; current_name_15->name, current_name_15->name
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp94
	je	.L84	 ;,
 ; D:\TC\src\helper.c:123: }
	addq	$40, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:\TC\src\helper.c:120:         scope_ptr = (scope_ptr->parent);
	movq	0(%rbp), %rbp	 ; scope_ptr_22->parent, scope
 ; D:\TC\src\helper.c:110:     while (scope_ptr != NULL) {
	testq	%rbp, %rbp	 ; scope
	jne	.L74	 ;,
.L70:
 ; D:\TC\src\helper.c:123: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:122:     return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\helper.c:123: }
	popq	%rbx	 ;
	movq	%rsi, %rax	 ; <retval>,
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp107, type
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp95
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp108
	je	.L86	 ;,
.L88:
 ; D:\TC\src\helper.c:125: bool is_builtin_type(string type) {
	movl	$1, %eax	 ;, <retval>
.L85:
 ; D:\TC\src\helper.c:127: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L86:
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp109
	jne	.L88	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp99
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp110
	jne	.L88	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp101
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp111
	jne	.L88	 ;,
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp103
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp112
	setne	%al	 ;, <retval>
 ; D:\TC\src\helper.c:126:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L85	 ;
	.p2align 4
	.globl	is_type
	.def	is_type;	.scl	2;	.type	32;	.endef
is_type:
 ; D:\TC\src\helper.c:131:     return type_ptr->kind == NAME_TYPE || type_ptr->kind == NAME_CLASS;
	testl	$-5, 24(%rcx)	 ;, type_4(D)->kind
	sete	%al	 ;, tmp90
 ; D:\TC\src\helper.c:132: }
	ret	
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Parser Error at line %zu, column %zu: %s\12\0"
	.text
	.p2align 4
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp94, message
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp98
	movq	8(%rdx), %rbx	 ; token_8(D)->line, token_8(D)->line
	leaq	1(%rax), %rsi	 ;, _2
	addq	$1, %rbx	 ;, _4
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:135:     fprintf(stderr, "Parser Error at line %zu, column %zu: %s\n", token->line + 1, token->column + 1, message);
	movq	%rsi, %r9	 ; _2,
	movq	%rbx, %r8	 ; _4,
	leaq	.LC10(%rip), %rdx	 ;, tmp93
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rdi, 32(%rsp)	 ; message,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:136: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
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
	.p2align 4
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
indention:
	pushq	%r14	 ;
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %eax	 ;, tmp112
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movl	%r8d, %r14d	 ; tmp125, is_last
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp123, out
	pushq	%rdi	 ;
 ; D:\TC\src\helper.c:152:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	3(%r9), %rdi	 ;, _3
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp124, indent
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	shrq	$3, %rdx	 ;, tmp109
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%rbx	 ;
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%esi, %ecx	 ; indent, tmp110
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	addq	%rdi, %rdx	 ; _3, _28
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	andl	$7, %ecx	 ;, tmp110
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	sall	%cl, %eax	 ; tmp110, tmp111
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:139:     char word = bool_list[index / 8];
	movzbl	(%rdx), %r8d	 ; *_28, word
 ; D:\TC\src\helper.c:140:     if (value)
	testb	%r14b, %r14b	 ; is_last
	jne	.L94	 ;,
 ; D:\TC\src\helper.c:141:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%eax, %r8d	 ; tmp111, tmp113
	movb	%r8b, (%rdx)	 ; tmp113, *_28
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	jbe	.L106	 ;,
.L95:
 ; D:\TC\src\helper.c:150: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movl	$1, %ebx	 ;, i
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC12(%rip), %r13	 ;, tmp121
	leaq	.LC11(%rip), %r12	 ;, tmp122
	.p2align 4,,10
	.p2align 3
.L101:
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movq	%rbx, %rax	 ; i, tmp116
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movl	%ebx, %ecx	 ; i, tmp118
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%r12, %rdx	 ; tmp122, iftmp.8_5
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	shrq	$3, %rax	 ;, tmp116
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	andl	$7, %ecx	 ;, tmp118
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	movsbl	(%rdi,%rax), %eax	 ; *_19, *_19
 ; D:\TC\src\helper.c:147:     return ((bool_list[index / 8] & (1 << (index % 8))) == 0 ? false : true);
	sarl	%cl, %eax	 ; tmp118, tmp119
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%rbp, %rcx	 ; out,
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	 ;, tmp119
	cmove	%r13, %rdx	 ; tmp121,, iftmp.8_5
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	 ;, i
 ; D:\TC\src\helper.c:154:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	call	fprintf	 ;
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; i, indent
	jne	.L101	 ;,
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r14b, %r14b	 ; is_last
	je	.L96	 ;,
.L98:
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC13(%rip), %rdx	 ;, iftmp.9_6
.L102:
 ; D:\TC\src\helper.c:157: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rbp, %rcx	 ; out,
 ; D:\TC\src\helper.c:157: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L94:
 ; D:\TC\src\helper.c:143:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	 ; tmp114
	andl	%r8d, %eax	 ; word, tmp115
	movb	%al, (%rdx)	 ; tmp115, *_28
 ; D:\TC\src\helper.c:153:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	ja	.L95	 ;,
 ; D:\TC\src\helper.c:155:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	jne	.L98	 ;,
.L93:
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
.L106:
 ; D:\TC\src\helper.c:155:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	je	.L93	 ;,
	.p2align 4,,10
	.p2align 3
.L96:
 ; D:\TC\src\helper.c:156:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC14(%rip), %rdx	 ;, iftmp.9_6
	jmp	.L102	 ;
	.p2align 4
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:162:     parser_ptr->in_function = false;
	xorl	%edx, %edx	 ;
	movw	%dx, (%rax)	 ;, MEM <vector(2) char> [(char *)new_parser_3]
 ; D:\TC\src\helper.c:164:     parser_ptr->in_loop = false;
	movb	$0, 2(%rax)	 ;, new_parser_3->in_loop
 ; D:\TC\src\helper.c:166: }
	addq	$40, %rsp	 ;,
	ret	
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
	.p2align 4
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp158, scope
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp156, import_name
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$1072, %rsp	 ;,
 ; D:\TC\src\helper.c:173:     filename[0] = '\0';
	movb	$0, 48(%rsp)	 ;, filename[0]
 ; D:\TC\src\helper.c:174:     if (source == 0) {
	testq	%rdx, %rdx	 ; source
	je	.L130	 ;,
 ; D:\TC\src\helper.c:184:         string_append(filename, MAX_FILENAME_SIZE, filename, source);
	leaq	48(%rsp), %rbx	 ;, tmp155
	movq	%rdx, %r9	 ; tmp157, source
	movl	$1024, %edx	 ;,
	movq	%rbx, %r8	 ; tmp155,
	movq	%rbx, %rcx	 ; tmp155,
	call	string_append	 ;
 ; D:\TC\src\helper.c:185:         string_append(filename, MAX_FILENAME_SIZE, filename, "/");
	movq	%rbx, %r8	 ; tmp155,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp155,
	leaq	.LC18(%rip), %r9	 ;,
	call	string_append	 ;
 ; D:\TC\src\helper.c:186:         string_append(filename, MAX_FILENAME_SIZE, filename, import_name);
	movq	%rdi, %r9	 ; import_name,
	movq	%rbx, %r8	 ; tmp155,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp155,
	call	string_append	 ;
 ; D:\TC\src\helper.c:187:         string_append(filename, MAX_FILENAME_SIZE, filename, ".tc");
	movq	%rbx, %r8	 ; tmp155,
	movl	$1024, %edx	 ;,
	movq	%rbx, %rcx	 ; tmp155,
	leaq	.LC19(%rip), %r9	 ;,
	call	string_append	 ;
.L112:
 ; D:\TC\src\helper.c:189:     openfile = fopen(filename, "r");
	leaq	.LC20(%rip), %rdx	 ;, tmp134
	movq	%rbx, %rcx	 ; tmp155,
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp162, openfile
 ; D:\TC\src\helper.c:190:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	je	.L131	 ;,
 ; D:\TC\src\helper.c:194:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; tmp155,
	leaq	.LC22(%rip), %rcx	 ;, tmp139
	call	printf	 ;
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	leaq	40(%rsp), %rdx	 ;, tmp140
	movq	%rsi, %rcx	 ; openfile,
 ; D:\TC\src\helper.c:195:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	call	read_source	 ;
 ; D:\TC\src\helper.c:197:     fclose(openfile);
	movq	%rsi, %rcx	 ; openfile,
 ; D:\TC\src\helper.c:196:     string source_code = read_source(openfile, &length);
	movq	%rax, %r13	 ; tmp164, source_code
 ; D:\TC\src\helper.c:197:     fclose(openfile);
	call	fclose	 ;
 ; D:\TC\src\helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$35, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%r13, %rcx	 ; source_code,
 ; D:\TC\src\helper.c:160:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movq	%rax, %rsi	 ; tmp165, new_parser
 ; D:\TC\src\helper.c:162:     parser_ptr->in_function = false;
	xorl	%eax, %eax	 ;
	movw	%ax, (%rsi)	 ;, MEM <vector(2) char> [(char *)new_parser_63]
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp142
 ; D:\TC\src\helper.c:164:     parser_ptr->in_loop = false;
	movb	$0, 2(%rsi)	 ;, new_parser_63->in_loop
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	40(%rsp), %rdx	 ; length,
	movq	(%rax), %r14	 ; builtin_scope, builtin_scope.10_8
	call	create_lexer	 ;
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rsi, %r8	 ; new_parser,
	movq	%r14, %rdx	 ; builtin_scope.10_8,
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rcx	 ; tmp166, _10
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	call	parse_code	 ;
 ; D:\TC\src\helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; tmp155,
	leaq	.LC23(%rip), %rcx	 ;, tmp145
 ; D:\TC\src\helper.c:198:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser());
	movq	%rax, %rsi	 ; tmp167, code
 ; D:\TC\src\helper.c:199:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	call	printf	 ;
 ; D:\TC\src\helper.c:200:     if (code == 0) {
	testq	%rsi, %rsi	 ; code
	je	.L132	 ;,
 ; D:\TC\src\helper.c:204:     list(Node*) names = ((((code))->global_scope))->names;
	movq	8(%rsi), %rax	 ; code_47->global_scope, code_47->global_scope
 ; D:\TC\src\helper.c:205:     Node* current = ((names))->head;
	movq	8(%rax), %rax	 ; _13->names, _13->names
	movq	(%rax), %rbx	 ; names_49->head, current
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	jne	.L120	 ;,
	jmp	.L114	 ;
	.p2align 4,,10
	.p2align 3
.L133:
 ; D:\TC\src\helper.c:213:         current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_51->next, current
 ; D:\TC\src\helper.c:206:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L114	 ;,
.L120:
 ; D:\TC\src\helper.c:208:         Name* current_name = (Name*)node_ptr->content;
	movq	8(%rbx), %rsi	 ; current_51->content, <retval>
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	movq	%rdi, %rdx	 ; import_name,
	movq	(%rsi), %rcx	 ; current_name_52->name, current_name_52->name
	call	string_equal	 ;
 ; D:\TC\src\helper.c:209:         if (string_equal(current_name->name, import_name)) {
	testb	%al, %al	 ; tmp169
	je	.L133	 ;,
 ; D:\TC\src\helper.c:217:         list_append(scope_ptr->names, (pointer)name);
	movq	8(%r12), %rbx	 ; scope_55(D)->names, _16
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	cmpq	$0, (%rbx)	 ;, _16->head
 ; D:\TC\src\helper.c:16:     new_node->next = 0;
	movq	$0, (%rax)	 ;, new_node_64->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; <retval>, new_node_64->content
 ; D:\TC\src\helper.c:23:     if (list->head == 0) {
	je	.L134	 ;,
 ; D:\TC\src\helper.c:27:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; _16->tail, _16->tail
	movq	%rax, (%rdx)	 ; new_node, _66->next
 ; D:\TC\src\helper.c:28:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, _16->tail
.L109:
 ; D:\TC\src\helper.c:220: }
	leaq	-48(%rbp), %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	leaq	.LC15(%rip), %rdx	 ;, tmp113
	call	strcmp	 ;
 ; D:\TC\src\helper.c:175:         if (strcmp(import_name, "print") == 0)
	testl	%eax, %eax	 ; tmp159
	je	.L135	 ;,
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	leaq	.LC16(%rip), %rdx	 ;, tmp118
	movq	%rdi, %rcx	 ; import_name,
	call	strcmp	 ;
 ; D:\TC\src\helper.c:177:         else if (strcmp(import_name, "arr") == 0)
	testl	%eax, %eax	 ; tmp160
	jne	.L113	 ;,
 ; D:\TC\src\helper.c:178:             strcpy(filename, "./std/arr.tc");
	movabsq	$8241920901561659182, %rax	 ;, tmp174
	leaq	48(%rsp), %rbx	 ;, tmp155
	movq	%rax, 48(%rsp)	 ; tmp174, MEM <char[1:13]> [(void *)&filename]
	movabsq	$27993765531771183, %rax	 ;, tmp175
	movq	%rax, 53(%rsp)	 ; tmp175, MEM <char[1:13]> [(void *)&filename]
	jmp	.L112	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:\TC\src\helper.c:176:             strcpy(filename, "./std/print.tc");
	movabsq	$8246143026212319022, %rax	 ;, tmp172
	leaq	48(%rsp), %rbx	 ;, tmp155
	movq	%rax, 48(%rsp)	 ; tmp172, MEM <char[1:15]> [(void *)&filename]
	movabsq	$27993765565065586, %rax	 ;, tmp173
	movq	%rax, 55(%rsp)	 ; tmp173, MEM <char[1:15]> [(void *)&filename]
	jmp	.L112	 ;
	.p2align 4,,10
	.p2align 3
.L134:
 ; D:\TC\src\helper.c:24:         list->head = new_node;
	movq	%rax, %xmm0	 ; new_node, tmp152
	punpcklqdq	%xmm0, %xmm0	 ; tmp152
	movups	%xmm0, (%rbx)	 ; tmp152, MEM <vector(2) long unsigned int> [(struct Node * *)_16]
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:191:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; tmp155,
	leaq	.LC21(%rip), %rdx	 ;, tmp137
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	call	fprintf	 ;
.L114:
 ; D:\TC\src\helper.c:181:             return 0;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L113:
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	leaq	48(%rsp), %r8	 ;,
	leaq	.LC17(%rip), %rdx	 ;, tmp124
 ; D:\TC\src\helper.c:181:             return 0;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\helper.c:180:             fprintf(stderr, "Error: Standard library file for import not found: %s\n", filename);
	movq	24(%rax), %rcx	 ; _3->_stderr, _3->_stderr
	call	fprintf	 ;
	jmp	.L109	 ;
.L132:
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; tmp155,
	leaq	.LC24(%rip), %rdx	 ;, tmp148
 ; D:\TC\src\helper.c:181:             return 0;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\helper.c:201:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	call	fprintf	 ;
	jmp	.L109	 ;
	.p2align 4
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp159, str
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:224:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp160
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:225:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp161
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:226:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp162
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp163
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:227:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp163
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp164
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:228:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp164
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp165
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:229:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp165
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp166
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:230:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp166
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp167
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:231:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp167
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp168
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:232:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp168
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp169
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:233:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp169
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp170
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:234:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp170
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp171
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:235:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp171
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp172
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:236:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp172
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp173
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:237:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp173
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp174
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\src\helper.c:238:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp174
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp175
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:239:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp175
	jne	.L136	 ;,
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp153
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; tmp176
	jne	.L154	 ;,
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp154
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; tmp177
	jne	.L155	 ;,
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp155
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:242:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
.L136:
 ; D:\TC\src\helper.c:244: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L154:
 ; D:\TC\src\helper.c:240:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
	jmp	.L136	 ;
.L155:
 ; D:\TC\src\helper.c:241:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
	jmp	.L136	 ;
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
 ; D:\TC\src\helper.c:246: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L158	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	CSWTCH.49(%rip), %rax	 ;, tmp84
	movl	(%rax,%rcx,4), %eax	 ; CSWTCH.49[op_2(D)], <retval>
.L158:
 ; D:\TC\src\helper.c:276: }
	ret	
	.section	.text.unlikely,"x"
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
 ; D:\TC\src\helper.c:279:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L183	 ;,
	leaq	.L164(%rip), %rdx	 ;, tmp85
	movl	%ecx, %ecx	 ; op, op
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L164:
	.long	.L182-.L164
	.long	.L181-.L164
	.long	.L180-.L164
	.long	.L179-.L164
	.long	.L178-.L164
	.long	.L177-.L164
	.long	.L176-.L164
	.long	.L175-.L164
	.long	.L174-.L164
	.long	.L173-.L164
	.long	.L172-.L164
	.long	.L171-.L164
	.long	.L170-.L164
	.long	.L169-.L164
	.long	.L168-.L164
	.long	.L167-.L164
	.long	.L166-.L164
	.long	.L165-.L164
	.long	.L163-.L164
	.text
	.p2align 4,,10
	.p2align 3
.L165:
 ; D:\TC\src\helper.c:284:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L166:
 ; D:\TC\src\helper.c:283:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L167:
 ; D:\TC\src\helper.c:282:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L168:
 ; D:\TC\src\helper.c:281:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L169:
 ; D:\TC\src\helper.c:280:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L170:
 ; D:\TC\src\helper.c:287:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; OR_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L171:
 ; D:\TC\src\helper.c:286:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; AND_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L172:
 ; D:\TC\src\helper.c:293:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; GE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L173:
 ; D:\TC\src\helper.c:292:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; LE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L174:
 ; D:\TC\src\helper.c:291:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; GT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L175:
 ; D:\TC\src\helper.c:290:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; LT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L176:
 ; D:\TC\src\helper.c:289:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; NE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L177:
 ; D:\TC\src\helper.c:288:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; EQ_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L178:
 ; D:\TC\src\helper.c:298:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; MOD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L179:
 ; D:\TC\src\helper.c:297:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; DIV_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L180:
 ; D:\TC\src\helper.c:296:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; MUL_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L181:
 ; D:\TC\src\helper.c:295:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; SUB_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L182:
 ; D:\TC\src\helper.c:294:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; ADD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L163:
 ; D:\TC\src\helper.c:285:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, <retval>
	ret	
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L183:
 ; D:\TC\src\helper.c:279:     switch (op) {
	xorl	%eax, %eax	 ; <retval>
	ret	
	.text
	.section	.text.unlikely,"x"
.LCOLDE25:
	.text
.LHOTE25:
	.section .rdata,"dr"
	.align 32
CSWTCH.49:
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
