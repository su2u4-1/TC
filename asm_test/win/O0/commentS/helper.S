	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_list
 ; D:\TC\src\helper.c:9:     new_list->head = NULL;
	movq	-8(%rbp), %rax	 ; new_list, tmp85
	movq	$0, (%rax)	 ;, new_list_3->head
 ; D:\TC\src\helper.c:10:     new_list->tail = NULL;
	movq	-8(%rbp), %rax	 ; new_list, tmp86
	movq	$0, 8(%rax)	 ;, new_list_3->tail
 ; D:\TC\src\helper.c:11:     return new_list;
	movq	-8(%rbp), %rax	 ; new_list, _6
 ; D:\TC\src\helper.c:12: }
	leave	
	ret	
	.def	create_node;	.scl	3;	.type	32;	.endef
create_node:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; content, content
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_node
 ; D:\TC\src\helper.c:16:     new_node->next = NULL;
	movq	-8(%rbp), %rax	 ; new_node, tmp85
	movq	$0, (%rax)	 ;, new_node_3->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	-8(%rbp), %rax	 ; new_node, tmp86
	movq	16(%rbp), %rdx	 ; content, tmp87
	movq	%rdx, 8(%rax)	 ; tmp87, new_node_3->content
 ; D:\TC\src\helper.c:18:     return new_node;
	movq	-8(%rbp), %rax	 ; new_node, _7
 ; D:\TC\src\helper.c:19: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; list, list
	movq	%rdx, 24(%rbp)	 ; item, item
 ; D:\TC\src\helper.c:22:     if (list == NULL) {
	cmpq	$0, 16(%rbp)	 ;, list
	jne	.L6	 ;,
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	%rax, %r9	 ; _2,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\helper.c:24:         return;
	jmp	.L5	 ;
.L6:
 ; D:\TC\src\helper.c:26:     Node* new_node = create_node(item);
	movq	24(%rbp), %rax	 ; item, tmp87
	movq	%rax, %rcx	 ; tmp87,
	call	create_node	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, new_node
 ; D:\TC\src\helper.c:27:     if (list->head == NULL) {
	movq	16(%rbp), %rax	 ; list, tmp89
	movq	(%rax), %rax	 ; list_6(D)->head, _3
 ; D:\TC\src\helper.c:27:     if (list->head == NULL) {
	testq	%rax, %rax	 ; _3
	jne	.L8	 ;,
 ; D:\TC\src\helper.c:28:         list->head = new_node;
	movq	16(%rbp), %rax	 ; list, tmp90
	movq	-8(%rbp), %rdx	 ; new_node, tmp91
	movq	%rdx, (%rax)	 ; tmp91, list_6(D)->head
 ; D:\TC\src\helper.c:29:         list->tail = new_node;
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	-8(%rbp), %rdx	 ; new_node, tmp93
	movq	%rdx, 8(%rax)	 ; tmp93, list_6(D)->tail
	jmp	.L5	 ;
.L8:
 ; D:\TC\src\helper.c:31:         list->tail->next = new_node;
	movq	16(%rbp), %rax	 ; list, tmp94
	movq	8(%rax), %rax	 ; list_6(D)->tail, _4
 ; D:\TC\src\helper.c:31:         list->tail->next = new_node;
	movq	-8(%rbp), %rdx	 ; new_node, tmp95
	movq	%rdx, (%rax)	 ; tmp95, _4->next
 ; D:\TC\src\helper.c:32:         list->tail = new_node;
	movq	16(%rbp), %rax	 ; list, tmp96
	movq	-8(%rbp), %rdx	 ; new_node, tmp97
	movq	%rdx, 8(%rax)	 ; tmp97, list_6(D)->tail
.L5:
 ; D:\TC\src\helper.c:34: }
	leave	
	ret	
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; original, original
 ; D:\TC\src\helper.c:37:     if (original == NULL)
	cmpq	$0, 16(%rbp)	 ;, original
	jne	.L10	 ;,
 ; D:\TC\src\helper.c:38:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L11	 ;
.L10:
 ; D:\TC\src\helper.c:39:     list() new_list = create_list();
	call	create_list	 ;
	movq	%rax, -8(%rbp)	 ; tmp86, new_list
 ; D:\TC\src\helper.c:40:     new_list->head = original->head;
	movq	16(%rbp), %rax	 ; original, tmp87
	movq	(%rax), %rdx	 ; original_5(D)->head, _1
 ; D:\TC\src\helper.c:40:     new_list->head = original->head;
	movq	-8(%rbp), %rax	 ; new_list, tmp88
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; D:\TC\src\helper.c:41:     new_list->tail = original->tail;
	movq	16(%rbp), %rax	 ; original, tmp89
	movq	8(%rax), %rdx	 ; original_5(D)->tail, _2
 ; D:\TC\src\helper.c:41:     new_list->tail = original->tail;
	movq	-8(%rbp), %rax	 ; new_list, tmp90
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
 ; D:\TC\src\helper.c:42:     return new_list;
	movq	-8(%rbp), %rax	 ; new_list, _3
.L11:
 ; D:\TC\src\helper.c:43: }
	leave	
	ret	
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$16, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; list, list
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	cmpq	$0, 16(%rbp)	 ;, list
	je	.L13	 ;,
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	movq	16(%rbp), %rax	 ; list, tmp87
	movq	(%rax), %rax	 ; list_7(D)->head, _1
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L14	 ;,
.L13:
 ; D:\TC\src\helper.c:47:         return NULL;
	movl	$0, %eax	 ;, _4
	jmp	.L15	 ;
.L14:
 ; D:\TC\src\helper.c:48:     Node* head_node = list->head;
	movq	16(%rbp), %rax	 ; list, tmp88
	movq	(%rax), %rax	 ; list_7(D)->head, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, head_node
 ; D:\TC\src\helper.c:49:     list->head = head_node->next;
	movq	-8(%rbp), %rax	 ; head_node, tmp90
	movq	(%rax), %rdx	 ; head_node_9->next, _2
 ; D:\TC\src\helper.c:49:     list->head = head_node->next;
	movq	16(%rbp), %rax	 ; list, tmp91
	movq	%rdx, (%rax)	 ; _2, list_7(D)->head
 ; D:\TC\src\helper.c:50:     if (list->head == NULL)
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	(%rax), %rax	 ; list_7(D)->head, _3
 ; D:\TC\src\helper.c:50:     if (list->head == NULL)
	testq	%rax, %rax	 ; _3
	jne	.L16	 ;,
 ; D:\TC\src\helper.c:51:         list->tail = NULL;
	movq	16(%rbp), %rax	 ; list, tmp93
	movq	$0, 8(%rax)	 ;, list_7(D)->tail
.L16:
 ; D:\TC\src\helper.c:52:     return head_node->content;
	movq	-8(%rbp), %rax	 ; head_node, tmp94
	movq	8(%rax), %rax	 ; head_node_9->content, _4
.L15:
 ; D:\TC\src\helper.c:53: }
	leave	
	ret	
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; list, list
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	cmpq	$0, 16(%rbp)	 ;, list
	je	.L18	 ;,
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	movq	16(%rbp), %rax	 ; list, tmp91
	movq	(%rax), %rax	 ; list_11(D)->head, _1
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L19	 ;,
.L18:
 ; D:\TC\src\helper.c:57:         return NULL;
	movl	$0, %eax	 ;, _9
	jmp	.L20	 ;
.L19:
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	(%rax), %rdx	 ; list_11(D)->head, _2
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	movq	16(%rbp), %rax	 ; list, tmp93
	movq	8(%rax), %rax	 ; list_11(D)->tail, _3
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	cmpq	%rax, %rdx	 ; _3, _2
	jne	.L21	 ;,
 ; D:\TC\src\helper.c:59:         pointer content = list->head->content;
	movq	16(%rbp), %rax	 ; list, tmp94
	movq	(%rax), %rax	 ; list_11(D)->head, _4
 ; D:\TC\src\helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	 ; _4->content, tmp95
	movq	%rax, -24(%rbp)	 ; tmp95, content
 ; D:\TC\src\helper.c:60:         list->head = NULL;
	movq	16(%rbp), %rax	 ; list, tmp96
	movq	$0, (%rax)	 ;, list_11(D)->head
 ; D:\TC\src\helper.c:61:         list->tail = NULL;
	movq	16(%rbp), %rax	 ; list, tmp97
	movq	$0, 8(%rax)	 ;, list_11(D)->tail
 ; D:\TC\src\helper.c:62:         return content;
	movq	-24(%rbp), %rax	 ; content, _9
	jmp	.L20	 ;
.L21:
 ; D:\TC\src\helper.c:64:     Node* current = list->head;
	movq	16(%rbp), %rax	 ; list, tmp98
	movq	(%rax), %rax	 ; list_11(D)->head, tmp99
	movq	%rax, -8(%rbp)	 ; tmp99, current
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	jmp	.L22	 ;
.L23:
 ; D:\TC\src\helper.c:66:         current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp100
	movq	(%rax), %rax	 ; current_8->next, tmp101
	movq	%rax, -8(%rbp)	 ; tmp101, current
.L22:
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	movq	-8(%rbp), %rax	 ; current, tmp102
	movq	(%rax), %rdx	 ; current_8->next, _5
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	movq	16(%rbp), %rax	 ; list, tmp103
	movq	8(%rax), %rax	 ; list_11(D)->tail, _6
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	 ; _6, _5
	jne	.L23	 ;,
 ; D:\TC\src\helper.c:67:     pointer content = list->tail->content;
	movq	16(%rbp), %rax	 ; list, tmp104
	movq	8(%rax), %rax	 ; list_11(D)->tail, _7
 ; D:\TC\src\helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	 ; _7->content, tmp105
	movq	%rax, -16(%rbp)	 ; tmp105, content
 ; D:\TC\src\helper.c:68:     current->next = NULL;
	movq	-8(%rbp), %rax	 ; current, tmp106
	movq	$0, (%rax)	 ;, current_8->next
 ; D:\TC\src\helper.c:69:     list->tail = current;
	movq	16(%rbp), %rax	 ; list, tmp107
	movq	-8(%rbp), %rdx	 ; current, tmp108
	movq	%rdx, 8(%rax)	 ; tmp108, list_11(D)->tail
 ; D:\TC\src\helper.c:70:     return content;
	movq	-16(%rbp), %rax	 ; content, _9
.L20:
 ; D:\TC\src\helper.c:71: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; original_name, original_name
	movl	%edx, 24(%rbp)	 ; kind, kind
	movq	%r8, 32(%rbp)	 ; type, type
	movq	%r9, 40(%rbp)	 ; scope, scope
 ; D:\TC\src\helper.c:76:     Symbol* result = search_name(scope, original_name);
	movq	16(%rbp), %rdx	 ; original_name, tmp96
	movq	40(%rbp), %rax	 ; scope, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	search_name	 ;
	movq	%rax, -40(%rbp)	 ; tmp98, result
 ; D:\TC\src\helper.c:77:     if (result != NULL)
	cmpq	$0, -40(%rbp)	 ;, result
	je	.L25	 ;,
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	 ; id_counter, id_counter.0_1
	leaq	1(%rax), %rsi	 ;, _2
	movq	-40(%rbp), %rax	 ; result, tmp99
	movq	24(%rax), %rbx	 ; result_19->id, _3
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	-40(%rbp), %rax	 ; result, tmp100
	movl	32(%rax), %edi	 ; result_19->kind, _4
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	16(%rbp), %rdx	 ; original_name, tmp101
	movq	%rsi, 40(%rsp)	 ; _2,
	movq	%rbx, 32(%rsp)	 ; _3,
	movl	%edi, %r9d	 ; _4,
	movq	%rdx, %r8	 ; tmp101,
	leaq	.LC1(%rip), %rdx	 ;, tmp102
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
.L25:
 ; D:\TC\src\helper.c:79:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -48(%rbp)	 ; tmp103, new_name
 ; D:\TC\src\helper.c:80:     new_name->original_name = original_name;
	movq	-48(%rbp), %rax	 ; new_name, tmp104
	movq	16(%rbp), %rdx	 ; original_name, tmp105
	movq	%rdx, 16(%rax)	 ; tmp105, new_name_23->original_name
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, id_counter.1_7
	addq	$1, %rax	 ;, _8
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _8, id_counter
	movq	id_counter.0(%rip), %rdx	 ; id_counter, id_counter.2_9
	movq	-48(%rbp), %rax	 ; new_name, tmp106
	movq	%rdx, 24(%rax)	 ; id_counter.2_9, new_name_23->id
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movq	-48(%rbp), %rax	 ; new_name, tmp107
	movl	24(%rbp), %edx	 ; kind, tmp108
	movl	%edx, 32(%rax)	 ; tmp108, new_name_23->kind
 ; D:\TC\src\helper.c:83:     new_name->type = type;
	movq	-48(%rbp), %rax	 ; new_name, tmp109
	movq	32(%rbp), %rdx	 ; type, tmp110
	movq	%rdx, (%rax)	 ; tmp110, new_name_23->type
 ; D:\TC\src\helper.c:84:     new_name->scope = scope;
	movq	-48(%rbp), %rax	 ; new_name, tmp111
	movq	40(%rbp), %rdx	 ; scope, tmp112
	movq	%rdx, 8(%rax)	 ; tmp112, new_name_23->scope
 ; D:\TC\src\helper.c:85:     if (kind == SYMBOL_CLASS || kind == SYMBOL_SUBROUTINE)
	cmpl	$0, 24(%rbp)	 ;, kind
	je	.L26	 ;,
 ; D:\TC\src\helper.c:85:     if (kind == SYMBOL_CLASS || kind == SYMBOL_SUBROUTINE)
	cmpl	$1, 24(%rbp)	 ;, kind
	jne	.L27	 ;,
.L26:
 ; D:\TC\src\helper.c:86:         list_append(scope->parent->symbols, (pointer)new_name);
	movq	40(%rbp), %rax	 ; scope, tmp113
	movq	(%rax), %rax	 ; scope_16(D)->parent, _10
 ; D:\TC\src\helper.c:86:         list_append(scope->parent->symbols, (pointer)new_name);
	movq	8(%rax), %rax	 ; _10->symbols, _11
	movq	-48(%rbp), %rdx	 ; new_name, tmp114
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
	jmp	.L28	 ;
.L27:
 ; D:\TC\src\helper.c:88:         list_append(scope->symbols, (pointer)new_name);
	movq	40(%rbp), %rax	 ; scope, tmp115
	movq	8(%rax), %rax	 ; scope_16(D)->symbols, _12
	movq	-48(%rbp), %rdx	 ; new_name, tmp116
	movq	%rax, %rcx	 ; _12,
	call	list_append	 ;
.L28:
 ; D:\TC\src\helper.c:89:     return new_name;
	movq	-48(%rbp), %rax	 ; new_name, _34
 ; D:\TC\src\helper.c:90: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; parent, parent
 ; D:\TC\src\helper.c:93:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, new_scope
 ; D:\TC\src\helper.c:94:     new_scope->parent = parent;
	movq	-8(%rbp), %rax	 ; new_scope, tmp86
	movq	16(%rbp), %rdx	 ; parent, tmp87
	movq	%rdx, (%rax)	 ; tmp87, new_scope_4->parent
 ; D:\TC\src\helper.c:95:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:95:     new_scope->symbols = create_list();
	movq	-8(%rbp), %rdx	 ; new_scope, tmp88
	movq	%rax, 8(%rdx)	 ; _1, new_scope_4->symbols
 ; D:\TC\src\helper.c:96:     return new_scope;
	movq	-8(%rbp), %rax	 ; new_scope, _9
 ; D:\TC\src\helper.c:97: }
	leave	
	ret	
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; scope, scope
	movq	%rdx, 24(%rbp)	 ; name, name
 ; D:\TC\src\helper.c:100:     while (scope != NULL) {
	jmp	.L33	 ;
.L38:
 ; D:\TC\src\helper.c:101:         list(Symbol*) names = scope->symbols;
	movq	16(%rbp), %rax	 ; scope, tmp86
	movq	8(%rax), %rax	 ; scope_3->symbols, tmp87
	movq	%rax, -16(%rbp)	 ; tmp87, names
 ; D:\TC\src\helper.c:102:         Node* current = names->head;
	movq	-16(%rbp), %rax	 ; names, tmp88
	movq	(%rax), %rax	 ; names_12->head, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, current
 ; D:\TC\src\helper.c:103:         while (current != NULL) {
	jmp	.L34	 ;
.L37:
 ; D:\TC\src\helper.c:104:             Node* node_ptr = current;
	movq	-8(%rbp), %rax	 ; current, tmp90
	movq	%rax, -24(%rbp)	 ; tmp90, node_ptr
 ; D:\TC\src\helper.c:105:             Symbol* current_name = (Symbol*)node_ptr->content;
	movq	-24(%rbp), %rax	 ; node_ptr, tmp91
	movq	8(%rax), %rax	 ; node_ptr_15->content, tmp92
	movq	%rax, -32(%rbp)	 ; tmp92, current_name
 ; D:\TC\src\helper.c:106:             if (string_equal(current_name->original_name, name))
	movq	-32(%rbp), %rax	 ; current_name, tmp93
	movq	16(%rax), %rax	 ; current_name_16->original_name, _1
	movq	24(%rbp), %rdx	 ; name, tmp94
	movq	%rax, %rcx	 ; _1,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:106:             if (string_equal(current_name->original_name, name))
	testb	%al, %al	 ; _2
	je	.L35	 ;,
 ; D:\TC\src\helper.c:107:                 return current_name;
	movq	-32(%rbp), %rax	 ; current_name, _5
	jmp	.L36	 ;
.L35:
 ; D:\TC\src\helper.c:108:             current = node_ptr->next;
	movq	-24(%rbp), %rax	 ; node_ptr, tmp95
	movq	(%rax), %rax	 ; node_ptr_15->next, tmp96
	movq	%rax, -8(%rbp)	 ; tmp96, current
.L34:
 ; D:\TC\src\helper.c:103:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L37	 ;,
 ; D:\TC\src\helper.c:110:         scope = scope->parent;
	movq	16(%rbp), %rax	 ; scope, tmp97
	movq	(%rax), %rax	 ; scope_3->parent, tmp98
	movq	%rax, 16(%rbp)	 ; tmp98, scope
.L33:
 ; D:\TC\src\helper.c:100:     while (scope != NULL) {
	cmpq	$0, 16(%rbp)	 ;, scope
	jne	.L38	 ;,
 ; D:\TC\src\helper.c:112:     return NULL;
	movl	$0, %eax	 ;, _5
.L36:
 ; D:\TC\src\helper.c:113: }
	leave	
	ret	
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; type, type
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp95
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD.4_1
	movq	16(%rbp), %rax	 ; type, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _2
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD.5_3
	movq	16(%rbp), %rax	 ; type, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _4
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp99
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD.6_5
	movq	16(%rbp), %rax	 ; type, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _6
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp101
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD.7_7
	movq	16(%rbp), %rax	 ; type, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _8
	jne	.L40	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp103
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD.8_9
	movq	16(%rbp), %rax	 ; type, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _10
	je	.L41	 ;,
.L40:
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.3_11
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L42	 ;
.L41:
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$0, %eax	 ;, iftmp.3_11
.L42:
 ; D:\TC\src\helper.c:117: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; message, message
	movq	%rdx, 24(%rbp)	 ; token, token
	movq	%r8, 32(%rbp)	 ; file_name, file_name
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rbp), %rax	 ; token, tmp88
	movq	16(%rax), %rax	 ; token_8(D)->column, _1
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rbx	 ;, _2
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rbp), %rax	 ; token, tmp89
	movq	8(%rax), %rax	 ; token_8(D)->line, _3
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rsi	 ;, _4
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	32(%rbp), %rcx	 ; file_name, tmp90
	movq	16(%rbp), %rdx	 ; message, tmp91
	movq	%rdx, 40(%rsp)	 ; tmp91,
	movq	%rbx, 32(%rsp)	 ; _2,
	movq	%rsi, %r9	 ; _4,
	movq	%rcx, %r8	 ; tmp90,
	leaq	.LC2(%rip), %rdx	 ;, tmp92
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:121: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.def	set_bool_list;	.scl	3;	.type	32;	.endef
set_bool_list:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$16, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; bool_list, bool_list
	movq	%rdx, 24(%rbp)	 ; index, index
	movl	%r8d, %eax	 ; value, tmp99
	movb	%al, 32(%rbp)	 ; tmp100, value
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movq	24(%rbp), %rax	 ; index, tmp101
	shrq	$3, %rax	 ;, tmp101
	movq	%rax, %rdx	 ; tmp101, _1
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movq	16(%rbp), %rax	 ; bool_list, tmp102
	addq	%rdx, %rax	 ; _1, _2
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movzbl	(%rax), %eax	 ; *_2, tmp103
	movb	%al, -1(%rbp)	 ; tmp103, word
 ; D:\TC\src\helper.c:125:     if (value)
	cmpb	$0, 32(%rbp)	 ;, value
	je	.L46	 ;,
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	24(%rbp), %rax	 ; index, tmp104
	andl	$7, %eax	 ;, _4
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %edx	 ;, tmp105
	movl	%eax, %ecx	 ; _4, tmp115
	sall	%cl, %edx	 ; tmp115, tmp105
	movl	%edx, %eax	 ; tmp105, _5
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%eax, %ecx	 ; _5, _6
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	24(%rbp), %rax	 ; index, tmp106
	shrq	$3, %rax	 ;, tmp106
	movq	%rax, %rdx	 ; tmp106, _7
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movq	16(%rbp), %rax	 ; bool_list, tmp107
	addq	%rax, %rdx	 ; tmp107, _8
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ecx, %eax	 ; _6, _6
	orb	-1(%rbp), %al	 ; word, _6
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movb	%al, (%rdx)	 ; _9, *_8
 ; D:\TC\src\helper.c:129: }
	jmp	.L48	 ;
.L46:
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	24(%rbp), %rax	 ; index, tmp108
	andl	$7, %eax	 ;, _11
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	$1, %edx	 ;, tmp109
	movl	%eax, %ecx	 ; _11, tmp119
	sall	%cl, %edx	 ; tmp119, tmp109
	movl	%edx, %eax	 ; tmp109, _12
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	 ; _14
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	24(%rbp), %rdx	 ; index, tmp110
	movq	%rdx, %rcx	 ; tmp110, tmp110
	shrq	$3, %rcx	 ;, tmp110
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movq	16(%rbp), %rdx	 ; bool_list, tmp111
	addq	%rcx, %rdx	 ; _15, _16
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	andb	-1(%rbp), %al	 ; word, _17
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movb	%al, (%rdx)	 ; _17, *_16
.L48:
 ; D:\TC\src\helper.c:129: }
	nop	
	leave	
	ret	
	.def	get_bool_list;	.scl	3;	.type	32;	.endef
get_bool_list:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; bool_list, bool_list
	movq	%rdx, 24(%rbp)	 ; index, index
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	24(%rbp), %rax	 ; index, tmp93
	shrq	$3, %rax	 ;, tmp93
	movq	%rax, %rdx	 ; tmp93, _1
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	16(%rbp), %rax	 ; bool_list, tmp94
	addq	%rdx, %rax	 ; _1, _2
	movzbl	(%rax), %eax	 ; *_2, _3
	movsbl	%al, %edx	 ; _3, _4
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	24(%rbp), %rax	 ; index, tmp95
	andl	$7, %eax	 ;, _6
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%eax, %ecx	 ; _6, tmp100
	sarl	%cl, %edx	 ; tmp100, _4
	movl	%edx, %eax	 ; _4, _7
	andl	$1, %eax	 ;, _8
	testl	%eax, %eax	 ; _8
	setne	%al	 ;, _9
 ; D:\TC\src\helper.c:133: }
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC3:
	.ascii "\342\224\202   \0"
.LC4:
	.ascii "    \0"
.LC5:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC6:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
	.text
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
indention:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; out, out
	movq	%rdx, 24(%rbp)	 ; indent, indent
	movl	%r8d, %eax	 ; is_last, tmp89
	movq	%r9, 40(%rbp)	 ; parser, parser
	movb	%al, 32(%rbp)	 ; tmp90, is_last
 ; D:\TC\src\helper.c:136:     Parser* parser_ptr = parser;
	movq	40(%rbp), %rax	 ; parser, tmp91
	movq	%rax, -16(%rbp)	 ; tmp91, parser_ptr
 ; D:\TC\src\helper.c:137:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	cmpb	$0, 32(%rbp)	 ;, is_last
	sete	%al	 ;, _1
	movzbl	%al, %edx	 ; _1, _2
 ; D:\TC\src\helper.c:137:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp92
	leaq	11(%rax), %rcx	 ;, _3
 ; D:\TC\src\helper.c:137:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	movq	24(%rbp), %rax	 ; indent, tmp93
	movl	%edx, %r8d	 ; _2,
	movq	%rax, %rdx	 ; tmp93,
	call	set_bool_list	 ;
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	movq	$1, -8(%rbp)	 ;, i
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	jmp	.L52	 ;
.L55:
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-16(%rbp), %rax	 ; parser_ptr, tmp94
	leaq	11(%rax), %rcx	 ;, _4
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	-8(%rbp), %rax	 ; i, tmp95
	movq	%rax, %rdx	 ; tmp95,
	call	get_bool_list	 ;
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	%al, %al	 ; _5
	je	.L53	 ;,
	leaq	.LC3(%rip), %rax	 ;, iftmp.9_7
	jmp	.L54	 ;
.L53:
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC4(%rip), %rax	 ;, iftmp.9_7
.L54:
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	16(%rbp), %rcx	 ; out, tmp96
	movq	%rax, %rdx	 ; iftmp.9_7,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	addq	$1, -8(%rbp)	 ;, i
.L52:
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	movq	-8(%rbp), %rax	 ; i, tmp97
	cmpq	24(%rbp), %rax	 ; indent, tmp97
	jb	.L55	 ;,
 ; D:\TC\src\helper.c:140:     if (indent > 0)
	cmpq	$0, 24(%rbp)	 ;, indent
	je	.L59	 ;,
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 32(%rbp)	 ;, is_last
	je	.L57	 ;,
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC5(%rip), %rax	 ;, iftmp.10_8
	jmp	.L58	 ;
.L57:
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC6(%rip), %rax	 ;, iftmp.10_8
.L58:
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	movq	16(%rbp), %rcx	 ; out, tmp98
	movq	%rax, %rdx	 ; iftmp.10_8,
	call	fprintf	 ;
.L59:
 ; D:\TC\src\helper.c:142: }
	nop	
	leave	
	ret	
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; file, file
 ; D:\TC\src\helper.c:145:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$48, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_parser
 ; D:\TC\src\helper.c:146:     new_parser->in_function = false;
	movq	-8(%rbp), %rax	 ; new_parser, tmp85
	movb	$0, 8(%rax)	 ;, new_parser_3->in_function
 ; D:\TC\src\helper.c:147:     new_parser->in_method = false;
	movq	-8(%rbp), %rax	 ; new_parser, tmp86
	movb	$0, 9(%rax)	 ;, new_parser_3->in_method
 ; D:\TC\src\helper.c:148:     new_parser->in_loop = false;
	movq	-8(%rbp), %rax	 ; new_parser, tmp87
	movb	$0, 10(%rax)	 ;, new_parser_3->in_loop
 ; D:\TC\src\helper.c:149:     new_parser->source_file = file;
	movq	-8(%rbp), %rax	 ; new_parser, tmp88
	movq	16(%rbp), %rdx	 ; file, tmp89
	movq	%rdx, (%rax)	 ; tmp89, new_parser_3->source_file
 ; D:\TC\src\helper.c:150:     return new_parser;
	movq	-8(%rbp), %rax	 ; new_parser, _9
 ; D:\TC\src\helper.c:151: }
	leave	
	ret	
	.section .rdata,"dr"
.LC7:
	.ascii "\0"
.LC8:
	.ascii "%s.tc\0"
.LC9:
	.ascii "D:/TC/std/\0"
.LC10:
	.ascii "r\0"
	.align 8
.LC11:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC12:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC13:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC14:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC15:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	addq	$-128, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; import_name, import_name
	movq	%rdx, 24(%rbp)	 ; source, source
	movq	%r8, 32(%rbp)	 ; scope, scope
	movq	%r9, 40(%rbp)	 ; source_file, source_file
 ; D:\TC\src\helper.c:154:     Symbol* name = NULL;
	movq	$0, -24(%rbp)	 ;, name
 ; D:\TC\src\helper.c:157:     if (source == NULL) {
	cmpq	$0, 24(%rbp)	 ;, source
	jne	.L63	 ;,
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	16(%rbp), %rax	 ; import_name, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	strlen	 ;
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	addq	$4, %rax	 ;, _2
	movq	%rax, %rdx	 ; _2,
	leaq	.LC7(%rip), %rax	 ;, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	create_string_not_check	 ;
	movq	%rax, -48(%rbp)	 ; tmp104, temp_import_name
 ; D:\TC\src\helper.c:160:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	16(%rbp), %rdx	 ; import_name, tmp105
	movq	-48(%rbp), %rax	 ; temp_import_name, tmp106
	movq	%rdx, %r8	 ; tmp105,
	leaq	.LC8(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; tmp106,
	call	sprintf	 ;
 ; D:\TC\src\helper.c:161:         filename = absolute_path(temp_import_name, std_path);
	movq	-48(%rbp), %rax	 ; temp_import_name, tmp108
	leaq	.LC9(%rip), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; tmp108,
	call	absolute_path	 ;
	movq	%rax, -32(%rbp)	 ; tmp110, filename
	jmp	.L64	 ;
.L63:
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	movq	40(%rbp), %rax	 ; source_file, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	get_file_dir	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	movq	24(%rbp), %rax	 ; source, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	absolute_path	 ;
	movq	%rax, -32(%rbp)	 ; tmp113, filename
.L64:
 ; D:\TC\src\helper.c:164:     openfile = fopen(filename, "r");
	movq	-32(%rbp), %rax	 ; filename, tmp114
	leaq	.LC10(%rip), %rdx	 ;, tmp115
	movq	%rax, %rcx	 ; tmp114,
	call	fopen	 ;
	movq	%rax, -56(%rbp)	 ; tmp116, openfile
 ; D:\TC\src\helper.c:165:     if (openfile == NULL) {
	cmpq	$0, -56(%rbp)	 ;, openfile
	jne	.L65	 ;,
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	-32(%rbp), %rdx	 ; filename, tmp117
	movq	%rdx, %r8	 ; tmp117,
	leaq	.LC11(%rip), %rdx	 ;, tmp118
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:167:         return NULL;
	movl	$0, %eax	 ;, _22
	jmp	.L74	 ;
.L65:
 ; D:\TC\src\helper.c:169:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	-32(%rbp), %rax	 ; filename, tmp119
	movq	%rax, %rdx	 ; tmp119,
	leaq	.LC12(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	printf	 ;
 ; D:\TC\src\helper.c:170:     size_t length = 0;
	movq	$0, -104(%rbp)	 ;, length
 ; D:\TC\src\helper.c:171:     string source_code = read_source(openfile, &length);
	leaq	-104(%rbp), %rdx	 ;, tmp121
	movq	-56(%rbp), %rax	 ; openfile, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	read_source	 ;
	movq	%rax, -64(%rbp)	 ; tmp123, source_code
 ; D:\TC\src\helper.c:172:     fclose(openfile);
	movq	-56(%rbp), %rax	 ; openfile, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fclose	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	-32(%rbp), %rax	 ; filename, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	create_file	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rcx	 ; _6,
	call	create_parser	 ;
	movq	%rax, %rsi	 ;, _7
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp126
	movq	(%rax), %rbx	 ; builtin_scope, builtin_scope.11_8
	movq	-104(%rbp), %rdx	 ; length, length.12_9
	movq	-64(%rbp), %rax	 ; source_code, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	create_lexer	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rsi, %r8	 ; _7,
	movq	%rbx, %rdx	 ; builtin_scope.11_8,
	movq	%rax, %rcx	 ; _10,
	call	parse_code	 ;
	movq	%rax, -72(%rbp)	 ; tmp128, code
 ; D:\TC\src\helper.c:174:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	-32(%rbp), %rax	 ; filename, tmp129
	movq	%rax, %rdx	 ; tmp129,
	leaq	.LC13(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	printf	 ;
 ; D:\TC\src\helper.c:175:     if (code == NULL) {
	cmpq	$0, -72(%rbp)	 ;, code
	jne	.L67	 ;,
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rax	 ; _11->_stderr, _12
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	-32(%rbp), %rdx	 ; filename, tmp131
	movq	%rdx, %r8	 ; tmp131,
	leaq	.LC14(%rip), %rdx	 ;, tmp132
	movq	%rax, %rcx	 ; _12,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:177:         return NULL;
	movl	$0, %eax	 ;, _22
	jmp	.L74	 ;
.L67:
 ; D:\TC\src\helper.c:179:     list(Node*) names = code->global_scope->symbols;
	movq	-72(%rbp), %rax	 ; code, tmp133
	movq	8(%rax), %rax	 ; code_52->global_scope, _13
 ; D:\TC\src\helper.c:179:     list(Node*) names = code->global_scope->symbols;
	movq	8(%rax), %rax	 ; _13->symbols, tmp134
	movq	%rax, -80(%rbp)	 ; tmp134, names
 ; D:\TC\src\helper.c:180:     Node* current = names->head;
	movq	-80(%rbp), %rax	 ; names, tmp135
	movq	(%rax), %rax	 ; names_54->head, tmp136
	movq	%rax, -40(%rbp)	 ; tmp136, current
 ; D:\TC\src\helper.c:181:     while (current != NULL) {
	jmp	.L68	 ;
.L71:
 ; D:\TC\src\helper.c:182:         Node* node_ptr = current;
	movq	-40(%rbp), %rax	 ; current, tmp137
	movq	%rax, -88(%rbp)	 ; tmp137, node_ptr
 ; D:\TC\src\helper.c:183:         Symbol* current_name = (Symbol*)node_ptr->content;
	movq	-88(%rbp), %rax	 ; node_ptr, tmp138
	movq	8(%rax), %rax	 ; node_ptr_56->content, tmp139
	movq	%rax, -96(%rbp)	 ; tmp139, current_name
 ; D:\TC\src\helper.c:184:         if (string_equal(current_name->original_name, import_name)) {
	movq	-96(%rbp), %rax	 ; current_name, tmp140
	movq	16(%rax), %rax	 ; current_name_57->original_name, _14
	movq	16(%rbp), %rdx	 ; import_name, tmp141
	movq	%rax, %rcx	 ; _14,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:184:         if (string_equal(current_name->original_name, import_name)) {
	testb	%al, %al	 ; _15
	je	.L69	 ;,
 ; D:\TC\src\helper.c:185:             name = current_name;
	movq	-96(%rbp), %rax	 ; current_name, tmp142
	movq	%rax, -24(%rbp)	 ; tmp142, name
 ; D:\TC\src\helper.c:186:             break;
	jmp	.L70	 ;
.L69:
 ; D:\TC\src\helper.c:188:         current = node_ptr->next;
	movq	-88(%rbp), %rax	 ; node_ptr, tmp143
	movq	(%rax), %rax	 ; node_ptr_56->next, tmp144
	movq	%rax, -40(%rbp)	 ; tmp144, current
.L68:
 ; D:\TC\src\helper.c:181:     while (current != NULL) {
	cmpq	$0, -40(%rbp)	 ;, current
	jne	.L71	 ;,
.L70:
 ; D:\TC\src\helper.c:190:     if (name != NULL)
	cmpq	$0, -24(%rbp)	 ;, name
	je	.L72	 ;,
 ; D:\TC\src\helper.c:191:         list_append(scope->symbols, (pointer)name);
	movq	32(%rbp), %rax	 ; scope, tmp145
	movq	8(%rax), %rax	 ; scope_63(D)->symbols, _16
	movq	-24(%rbp), %rdx	 ; name, tmp146
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
	jmp	.L73	 ;
.L72:
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	24(%rax), %rax	 ; _17->_stderr, _18
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	-32(%rbp), %rcx	 ; filename, tmp147
	movq	16(%rbp), %rdx	 ; import_name, tmp148
	movq	%rcx, %r9	 ; tmp147,
	movq	%rdx, %r8	 ; tmp148,
	leaq	.LC15(%rip), %rdx	 ;, tmp149
	movq	%rax, %rcx	 ; _18,
	call	fprintf	 ;
.L73:
 ; D:\TC\src\helper.c:194:     return name;
	movq	-24(%rbp), %rax	 ; name, _22
.L74:
 ; D:\TC\src\helper.c:195: }
	subq	$-128, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; str, str
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.13_1
	movq	16(%rbp), %rax	 ; str, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%al, %al	 ; _2
	je	.L76	 ;,
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, _39
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	jmp	.L77	 ;
.L76:
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.14_3
	movq	16(%rbp), %rax	 ; str, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%al, %al	 ; _4
	je	.L78	 ;,
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, _39
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	jmp	.L77	 ;
.L78:
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.15_5
	movq	16(%rbp), %rax	 ; str, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%al, %al	 ; _6
	je	.L79	 ;,
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, _39
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	jmp	.L77	 ;
.L79:
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.16_7
	movq	16(%rbp), %rax	 ; str, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%al, %al	 ; _8
	je	.L80	 ;,
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, _39
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	jmp	.L77	 ;
.L80:
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.17_9
	movq	16(%rbp), %rax	 ; str, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%al, %al	 ; _10
	je	.L81	 ;,
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, _39
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	jmp	.L77	 ;
.L81:
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.18_11
	movq	16(%rbp), %rax	 ; str, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%al, %al	 ; _12
	je	.L82	 ;,
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, _39
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	jmp	.L77	 ;
.L82:
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL.19_13
	movq	16(%rbp), %rax	 ; str, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%al, %al	 ; _14
	je	.L83	 ;,
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, _39
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	jmp	.L77	 ;
.L83:
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL.20_15
	movq	16(%rbp), %rax	 ; str, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%al, %al	 ; _16
	je	.L84	 ;,
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, _39
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	jmp	.L77	 ;
.L84:
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL.21_17
	movq	16(%rbp), %rax	 ; str, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%al, %al	 ; _18
	je	.L85	 ;,
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, _39
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	jmp	.L77	 ;
.L85:
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL.22_19
	movq	16(%rbp), %rax	 ; str, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%al, %al	 ; _20
	je	.L86	 ;,
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, _39
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	jmp	.L77	 ;
.L86:
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL.23_21
	movq	16(%rbp), %rax	 ; str, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%al, %al	 ; _22
	je	.L87	 ;,
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, _39
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	jmp	.L77	 ;
.L87:
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL.24_23
	movq	16(%rbp), %rax	 ; str, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%al, %al	 ; _24
	je	.L88	 ;,
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, _39
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	jmp	.L77	 ;
.L88:
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL.25_25
	movq	16(%rbp), %rax	 ; str, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%al, %al	 ; _26
	je	.L89	 ;,
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, _39
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	jmp	.L77	 ;
.L89:
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL.26_27
	movq	16(%rbp), %rax	 ; str, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%al, %al	 ; _28
	je	.L90	 ;,
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, _39
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	jmp	.L77	 ;
.L90:
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL.27_29
	movq	16(%rbp), %rax	 ; str, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%al, %al	 ; _30
	je	.L91	 ;,
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	 ;, _39
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	jmp	.L77	 ;
.L91:
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL.28_31
	movq	16(%rbp), %rax	 ; str, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%al, %al	 ; _32
	je	.L92	 ;,
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, _39
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	jmp	.L77	 ;
.L92:
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; MUL_SYMBOL, MUL_SYMBOL.29_33
	movq	16(%rbp), %rax	 ; str, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; _34
	je	.L93	 ;,
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, _39
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	jmp	.L77	 ;
.L93:
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp156
	movq	(%rax), %rdx	 ; DIV_SYMBOL, DIV_SYMBOL.30_35
	movq	16(%rbp), %rax	 ; str, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; _36
	je	.L94	 ;,
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, _39
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	jmp	.L77	 ;
.L94:
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp158
	movq	(%rax), %rdx	 ; MOD_SYMBOL, MOD_SYMBOL.31_37
	movq	16(%rbp), %rax	 ; str, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	testb	%al, %al	 ; _38
	je	.L95	 ;,
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movl	$4, %eax	 ;, _39
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	jmp	.L77	 ;
.L95:
 ; D:\TC\src\helper.c:218:     else return OP_NONE;
	movl	$19, %eax	 ;, _39
.L77:
 ; D:\TC\src\helper.c:219: }
	leave	
	ret	
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:\TC\src\helper.c:222:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L97	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L99(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L99(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
	.align 4
.L99:
	.long	.L103-.L99
	.long	.L103-.L99
	.long	.L102-.L99
	.long	.L102-.L99
	.long	.L102-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L101-.L99
	.long	.L100-.L99
	.long	.L100-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.long	.L98-.L99
	.text
.L98:
 ; D:\TC\src\helper.c:229:             return 1;
	movl	$1, %eax	 ;, _1
	jmp	.L104	 ;
.L100:
 ; D:\TC\src\helper.c:232:             return 2;
	movl	$2, %eax	 ;, _1
	jmp	.L104	 ;
.L101:
 ; D:\TC\src\helper.c:239:             return 3;
	movl	$3, %eax	 ;, _1
	jmp	.L104	 ;
.L103:
 ; D:\TC\src\helper.c:242:             return 4;
	movl	$4, %eax	 ;, _1
	jmp	.L104	 ;
.L102:
 ; D:\TC\src\helper.c:246:             return 5;
	movl	$5, %eax	 ;, _1
	jmp	.L104	 ;
.L97:
 ; D:\TC\src\helper.c:249:             return 0;
	movl	$0, %eax	 ;, _1
.L104:
 ; D:\TC\src\helper.c:251: }
	popq	%rbp	 ;
	ret	
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:\TC\src\helper.c:254:     switch (op) {
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
	.long	.L126-.L108
	.long	.L125-.L108
	.long	.L124-.L108
	.long	.L123-.L108
	.long	.L122-.L108
	.long	.L121-.L108
	.long	.L120-.L108
	.long	.L119-.L108
	.long	.L118-.L108
	.long	.L117-.L108
	.long	.L116-.L108
	.long	.L115-.L108
	.long	.L114-.L108
	.long	.L113-.L108
	.long	.L112-.L108
	.long	.L111-.L108
	.long	.L110-.L108
	.long	.L109-.L108
	.long	.L107-.L108
	.text
.L113:
 ; D:\TC\src\helper.c:255:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, _1
	jmp	.L127	 ;
.L112:
 ; D:\TC\src\helper.c:256:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, _1
	jmp	.L127	 ;
.L111:
 ; D:\TC\src\helper.c:257:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, _1
	jmp	.L127	 ;
.L110:
 ; D:\TC\src\helper.c:258:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, _1
	jmp	.L127	 ;
.L109:
 ; D:\TC\src\helper.c:259:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, _1
	jmp	.L127	 ;
.L107:
 ; D:\TC\src\helper.c:260:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, _1
	jmp	.L127	 ;
.L115:
 ; D:\TC\src\helper.c:261:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; AND_SYMBOL, _1
	jmp	.L127	 ;
.L114:
 ; D:\TC\src\helper.c:262:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; OR_SYMBOL, _1
	jmp	.L127	 ;
.L121:
 ; D:\TC\src\helper.c:263:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; EQ_SYMBOL, _1
	jmp	.L127	 ;
.L120:
 ; D:\TC\src\helper.c:264:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; NE_SYMBOL, _1
	jmp	.L127	 ;
.L119:
 ; D:\TC\src\helper.c:265:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; LT_SYMBOL, _1
	jmp	.L127	 ;
.L118:
 ; D:\TC\src\helper.c:266:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; GT_SYMBOL, _1
	jmp	.L127	 ;
.L117:
 ; D:\TC\src\helper.c:267:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; LE_SYMBOL, _1
	jmp	.L127	 ;
.L116:
 ; D:\TC\src\helper.c:268:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; GE_SYMBOL, _1
	jmp	.L127	 ;
.L126:
 ; D:\TC\src\helper.c:269:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; ADD_SYMBOL, _1
	jmp	.L127	 ;
.L125:
 ; D:\TC\src\helper.c:270:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; SUB_SYMBOL, _1
	jmp	.L127	 ;
.L124:
 ; D:\TC\src\helper.c:271:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; MUL_SYMBOL, _1
	jmp	.L127	 ;
.L123:
 ; D:\TC\src\helper.c:272:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; DIV_SYMBOL, _1
	jmp	.L127	 ;
.L122:
 ; D:\TC\src\helper.c:273:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp109
	movq	(%rax), %rax	 ; MOD_SYMBOL, _1
	jmp	.L127	 ;
.L106:
 ; D:\TC\src\helper.c:275:         default: return NULL;
	movl	$0, %eax	 ;, _1
.L127:
 ; D:\TC\src\helper.c:277: }
	popq	%rbp	 ;
	ret	
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
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
