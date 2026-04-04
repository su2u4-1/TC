	.file	"helper.c"
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
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_list
 ; D:/TC/src/helper.c:9:     new_list->head = NULL;
	movq	-8(%rbp), %rax	 ; new_list, tmp85
	movq	$0, (%rax)	 ;, new_list_3->head
 ; D:/TC/src/helper.c:10:     new_list->tail = NULL;
	movq	-8(%rbp), %rax	 ; new_list, tmp86
	movq	$0, 8(%rax)	 ;, new_list_3->tail
 ; D:/TC/src/helper.c:11:     return new_list;
	movq	-8(%rbp), %rax	 ; new_list, _6
 ; D:/TC/src/helper.c:12: }
	leave	
	ret	
	.def	create_node;	.scl	3;	.type	32;	.endef
create_node:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; content, content
 ; D:/TC/src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_node
 ; D:/TC/src/helper.c:16:     new_node->next = NULL;
	movq	-8(%rbp), %rax	 ; new_node, tmp85
	movq	$0, (%rax)	 ;, new_node_3->next
 ; D:/TC/src/helper.c:17:     new_node->content = content;
	movq	-8(%rbp), %rax	 ; new_node, tmp86
	movq	16(%rbp), %rdx	 ; content, tmp87
	movq	%rdx, 8(%rax)	 ; tmp87, new_node_3->content
 ; D:/TC/src/helper.c:18:     return new_node;
	movq	-8(%rbp), %rax	 ; new_node, _7
 ; D:/TC/src/helper.c:19: }
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
 ; D:/TC/src/helper.c:22:     if (list == NULL) {
	cmpq	$0, 16(%rbp)	 ;, list
	jne	.L6	 ;,
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	%rax, %r9	 ; _2,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/helper.c:24:         return;
	jmp	.L5	 ;
.L6:
 ; D:/TC/src/helper.c:26:     Node* new_node = create_node(item);
	movq	24(%rbp), %rax	 ; item, tmp87
	movq	%rax, %rcx	 ; tmp87,
	call	create_node	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, new_node
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	movq	16(%rbp), %rax	 ; list, tmp89
	movq	(%rax), %rax	 ; list_6(D)->head, _3
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	testq	%rax, %rax	 ; _3
	jne	.L8	 ;,
 ; D:/TC/src/helper.c:28:         list->head = new_node;
	movq	16(%rbp), %rax	 ; list, tmp90
	movq	-8(%rbp), %rdx	 ; new_node, tmp91
	movq	%rdx, (%rax)	 ; tmp91, list_6(D)->head
 ; D:/TC/src/helper.c:29:         list->tail = new_node;
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	-8(%rbp), %rdx	 ; new_node, tmp93
	movq	%rdx, 8(%rax)	 ; tmp93, list_6(D)->tail
	jmp	.L5	 ;
.L8:
 ; D:/TC/src/helper.c:31:         list->tail->next = new_node;
	movq	16(%rbp), %rax	 ; list, tmp94
	movq	8(%rax), %rax	 ; list_6(D)->tail, _4
 ; D:/TC/src/helper.c:31:         list->tail->next = new_node;
	movq	-8(%rbp), %rdx	 ; new_node, tmp95
	movq	%rdx, (%rax)	 ; tmp95, _4->next
 ; D:/TC/src/helper.c:32:         list->tail = new_node;
	movq	16(%rbp), %rax	 ; list, tmp96
	movq	-8(%rbp), %rdx	 ; new_node, tmp97
	movq	%rdx, 8(%rax)	 ; tmp97, list_6(D)->tail
.L5:
 ; D:/TC/src/helper.c:34: }
	leave	
	ret	
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; original, original
 ; D:/TC/src/helper.c:37:     if (original == NULL)
	cmpq	$0, 16(%rbp)	 ;, original
	jne	.L10	 ;,
 ; D:/TC/src/helper.c:38:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L11	 ;
.L10:
 ; D:/TC/src/helper.c:39:     list() new_list = create_list();
	call	create_list	 ;
	movq	%rax, -8(%rbp)	 ; tmp86, new_list
 ; D:/TC/src/helper.c:40:     new_list->head = original->head;
	movq	16(%rbp), %rax	 ; original, tmp87
	movq	(%rax), %rdx	 ; original_5(D)->head, _1
 ; D:/TC/src/helper.c:40:     new_list->head = original->head;
	movq	-8(%rbp), %rax	 ; new_list, tmp88
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; D:/TC/src/helper.c:41:     new_list->tail = original->tail;
	movq	16(%rbp), %rax	 ; original, tmp89
	movq	8(%rax), %rdx	 ; original_5(D)->tail, _2
 ; D:/TC/src/helper.c:41:     new_list->tail = original->tail;
	movq	-8(%rbp), %rax	 ; new_list, tmp90
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
 ; D:/TC/src/helper.c:42:     return new_list;
	movq	-8(%rbp), %rax	 ; new_list, _3
.L11:
 ; D:/TC/src/helper.c:43: }
	leave	
	ret	
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$16, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; list, list
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	cmpq	$0, 16(%rbp)	 ;, list
	je	.L13	 ;,
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	16(%rbp), %rax	 ; list, tmp87
	movq	(%rax), %rax	 ; list_7(D)->head, _1
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L14	 ;,
.L13:
 ; D:/TC/src/helper.c:47:         return NULL;
	movl	$0, %eax	 ;, _4
	jmp	.L15	 ;
.L14:
 ; D:/TC/src/helper.c:48:     Node* head_node = list->head;
	movq	16(%rbp), %rax	 ; list, tmp88
	movq	(%rax), %rax	 ; list_7(D)->head, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, head_node
 ; D:/TC/src/helper.c:49:     list->head = head_node->next;
	movq	-8(%rbp), %rax	 ; head_node, tmp90
	movq	(%rax), %rdx	 ; head_node_9->next, _2
 ; D:/TC/src/helper.c:49:     list->head = head_node->next;
	movq	16(%rbp), %rax	 ; list, tmp91
	movq	%rdx, (%rax)	 ; _2, list_7(D)->head
 ; D:/TC/src/helper.c:50:     if (list->head == NULL)
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	(%rax), %rax	 ; list_7(D)->head, _3
 ; D:/TC/src/helper.c:50:     if (list->head == NULL)
	testq	%rax, %rax	 ; _3
	jne	.L16	 ;,
 ; D:/TC/src/helper.c:51:         list->tail = NULL;
	movq	16(%rbp), %rax	 ; list, tmp93
	movq	$0, 8(%rax)	 ;, list_7(D)->tail
.L16:
 ; D:/TC/src/helper.c:52:     return head_node->content;
	movq	-8(%rbp), %rax	 ; head_node, tmp94
	movq	8(%rax), %rax	 ; head_node_9->content, _4
.L15:
 ; D:/TC/src/helper.c:53: }
	leave	
	ret	
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; list, list
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	cmpq	$0, 16(%rbp)	 ;, list
	je	.L18	 ;,
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	16(%rbp), %rax	 ; list, tmp91
	movq	(%rax), %rax	 ; list_11(D)->head, _1
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L19	 ;,
.L18:
 ; D:/TC/src/helper.c:57:         return NULL;
	movl	$0, %eax	 ;, _9
	jmp	.L20	 ;
.L19:
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	movq	16(%rbp), %rax	 ; list, tmp92
	movq	(%rax), %rdx	 ; list_11(D)->head, _2
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	movq	16(%rbp), %rax	 ; list, tmp93
	movq	8(%rax), %rax	 ; list_11(D)->tail, _3
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%rax, %rdx	 ; _3, _2
	jne	.L21	 ;,
 ; D:/TC/src/helper.c:59:         pointer content = list->head->content;
	movq	16(%rbp), %rax	 ; list, tmp94
	movq	(%rax), %rax	 ; list_11(D)->head, _4
 ; D:/TC/src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	 ; _4->content, tmp95
	movq	%rax, -24(%rbp)	 ; tmp95, content
 ; D:/TC/src/helper.c:60:         list->head = NULL;
	movq	16(%rbp), %rax	 ; list, tmp96
	movq	$0, (%rax)	 ;, list_11(D)->head
 ; D:/TC/src/helper.c:61:         list->tail = NULL;
	movq	16(%rbp), %rax	 ; list, tmp97
	movq	$0, 8(%rax)	 ;, list_11(D)->tail
 ; D:/TC/src/helper.c:62:         return content;
	movq	-24(%rbp), %rax	 ; content, _9
	jmp	.L20	 ;
.L21:
 ; D:/TC/src/helper.c:64:     Node* current = list->head;
	movq	16(%rbp), %rax	 ; list, tmp98
	movq	(%rax), %rax	 ; list_11(D)->head, tmp99
	movq	%rax, -8(%rbp)	 ; tmp99, current
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	jmp	.L22	 ;
.L23:
 ; D:/TC/src/helper.c:66:         current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp100
	movq	(%rax), %rax	 ; current_8->next, tmp101
	movq	%rax, -8(%rbp)	 ; tmp101, current
.L22:
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	movq	-8(%rbp), %rax	 ; current, tmp102
	movq	(%rax), %rdx	 ; current_8->next, _5
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	movq	16(%rbp), %rax	 ; list, tmp103
	movq	8(%rax), %rax	 ; list_11(D)->tail, _6
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	 ; _6, _5
	jne	.L23	 ;,
 ; D:/TC/src/helper.c:67:     pointer content = list->tail->content;
	movq	16(%rbp), %rax	 ; list, tmp104
	movq	8(%rax), %rax	 ; list_11(D)->tail, _7
 ; D:/TC/src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	 ; _7->content, tmp105
	movq	%rax, -16(%rbp)	 ; tmp105, content
 ; D:/TC/src/helper.c:68:     current->next = NULL;
	movq	-8(%rbp), %rax	 ; current, tmp106
	movq	$0, (%rax)	 ;, current_8->next
 ; D:/TC/src/helper.c:69:     list->tail = current;
	movq	16(%rbp), %rax	 ; list, tmp107
	movq	-8(%rbp), %rdx	 ; current, tmp108
	movq	%rdx, 8(%rax)	 ; tmp108, list_11(D)->tail
 ; D:/TC/src/helper.c:70:     return content;
	movq	-16(%rbp), %rax	 ; content, _9
.L20:
 ; D:/TC/src/helper.c:71: }
	leave	
	ret	
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; list, list
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, 16(%rbp)	 ;, list
	je	.L25	 ;,
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movq	16(%rbp), %rax	 ; list, tmp87
	movq	(%rax), %rax	 ; list_4(D)->head, _1
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rax, %rax	 ; _1
	je	.L25	 ;,
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movq	16(%rbp), %rax	 ; list, tmp88
	movq	8(%rax), %rax	 ; list_4(D)->tail, _2
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rax, %rax	 ; _2
	jne	.L26	 ;,
.L25:
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movl	$1, %eax	 ;, iftmp.0_3
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	jmp	.L27	 ;
.L26:
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movl	$0, %eax	 ;, iftmp.0_3
.L27:
 ; D:/TC/src/helper.c:75: }
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Warning: Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC2:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\12\0"
	.align 8
.LC3:
	.ascii "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC4:
	.ascii "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$88, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
	movl	%edx, 24(%rbp)	 ; kind, kind
	movq	%r8, 32(%rbp)	 ; type, type
	movq	%r9, 40(%rbp)	 ; ast_node, ast_node
 ; D:/TC/src/helper.c:80:     SymbolTable* scope = NULL;
	movq	$0, -40(%rbp)	 ;, scope
 ; D:/TC/src/helper.c:81:     switch (kind) {
	cmpl	$6, 24(%rbp)	 ;, kind
	ja	.L30	 ;,
	cmpl	$3, 24(%rbp)	 ;, kind
	jnb	.L31	 ;,
	cmpl	$2, 24(%rbp)	 ;, kind
	je	.L32	 ;,
	cmpl	$2, 24(%rbp)	 ;, kind
	ja	.L30	 ;,
	cmpl	$0, 24(%rbp)	 ;, kind
	je	.L33	 ;,
	cmpl	$1, 24(%rbp)	 ;, kind
	je	.L34	 ;,
	jmp	.L30	 ;
.L33:
 ; D:/TC/src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	40(%rbp), %rax	 ; ast_node, tmp104
	movq	16(%rax), %rax	 ; MEM[(struct Class *)ast_node_28(D)].class_scope, _1
 ; D:/TC/src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	(%rax), %rax	 ; _1->parent, tmp105
	movq	%rax, -40(%rbp)	 ; tmp105, scope
 ; D:/TC/src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	jmp	.L35	 ;
.L34:
 ; D:/TC/src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	40(%rbp), %rax	 ; ast_node, tmp106
	movq	32(%rax), %rax	 ; MEM[(struct Function *)ast_node_28(D)].function_scope, _2
 ; D:/TC/src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	(%rax), %rax	 ; _2->parent, tmp107
	movq	%rax, -40(%rbp)	 ; tmp107, scope
 ; D:/TC/src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	jmp	.L35	 ;
.L32:
 ; D:/TC/src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	40(%rbp), %rax	 ; ast_node, tmp108
	movq	32(%rax), %rax	 ; MEM[(struct Method *)ast_node_28(D)].method_scope, _3
 ; D:/TC/src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	(%rax), %rax	 ; _3->parent, tmp109
	movq	%rax, -40(%rbp)	 ; tmp109, scope
 ; D:/TC/src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	jmp	.L35	 ;
.L31:
 ; D:/TC/src/helper.c:88:         case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
	movq	40(%rbp), %rax	 ; ast_node, tmp110
	movq	%rax, -40(%rbp)	 ; tmp110, scope
 ; D:/TC/src/helper.c:88:         case SYMBOL_TYPE: scope = (SymbolTable*)ast_node; break;
	jmp	.L35	 ;
.L30:
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
	movl	24(%rbp), %edx	 ; kind, tmp111
	movl	%edx, %r8d	 ; tmp111,
	leaq	.LC1(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:91:             break;
	nop	
.L35:
 ; D:/TC/src/helper.c:93:     Symbol* result = search_name(scope, name);
	movq	16(%rbp), %rdx	 ; name, tmp113
	movq	-40(%rbp), %rax	 ; scope, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	search_name	 ;
	movq	%rax, -48(%rbp)	 ; tmp115, result
 ; D:/TC/src/helper.c:94:     if (result != NULL)
	cmpq	$0, -48(%rbp)	 ;, result
	je	.L36	 ;,
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	 ; id_counter, id_counter.1_6
	leaq	1(%rax), %rsi	 ;, _7
	movq	-48(%rbp), %rax	 ; result, tmp116
	movq	16(%rax), %rbx	 ; result_38->id, _8
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	-48(%rbp), %rax	 ; result, tmp117
	movl	32(%rax), %edi	 ; result_38->kind, _9
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	24(%rax), %rax	 ; _10->_stderr, _11
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	16(%rbp), %rdx	 ; name, tmp118
	movq	%rsi, 40(%rsp)	 ; _7,
	movq	%rbx, 32(%rsp)	 ; _8,
	movl	%edi, %r9d	 ; _9,
	movq	%rdx, %r8	 ; tmp118,
	leaq	.LC2(%rip), %rdx	 ;, tmp119
	movq	%rax, %rcx	 ; _11,
	call	fprintf	 ;
.L36:
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -56(%rbp)	 ; tmp120, new_name
 ; D:/TC/src/helper.c:97:     new_name->name = name;
	movq	-56(%rbp), %rax	 ; new_name, tmp121
	movq	16(%rbp), %rdx	 ; name, tmp122
	movq	%rdx, 8(%rax)	 ; tmp122, new_name_42->name
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, id_counter.2_12
	addq	$1, %rax	 ;, _13
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _13, id_counter
	movq	id_counter.0(%rip), %rdx	 ; id_counter, id_counter.3_14
	movq	-56(%rbp), %rax	 ; new_name, tmp123
	movq	%rdx, 16(%rax)	 ; id_counter.3_14, new_name_42->id
 ; D:/TC/src/helper.c:99:     new_name->kind = kind;
	movq	-56(%rbp), %rax	 ; new_name, tmp124
	movl	24(%rbp), %edx	 ; kind, tmp125
	movl	%edx, 32(%rax)	 ; tmp125, new_name_42->kind
 ; D:/TC/src/helper.c:100:     new_name->type = type;
	movq	-56(%rbp), %rax	 ; new_name, tmp126
	movq	32(%rbp), %rdx	 ; type, tmp127
	movq	%rdx, (%rax)	 ; tmp127, new_name_42->type
 ; D:/TC/src/helper.c:101:     switch (kind) {
	cmpl	$6, 24(%rbp)	 ;, kind
	ja	.L37	 ;,
	cmpl	$3, 24(%rbp)	 ;, kind
	jnb	.L38	 ;,
	cmpl	$2, 24(%rbp)	 ;, kind
	je	.L39	 ;,
	cmpl	$2, 24(%rbp)	 ;, kind
	ja	.L37	 ;,
	cmpl	$0, 24(%rbp)	 ;, kind
	je	.L40	 ;,
	cmpl	$1, 24(%rbp)	 ;, kind
	je	.L41	 ;,
	jmp	.L37	 ;
.L40:
 ; D:/TC/src/helper.c:102:         case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
	movq	-56(%rbp), %rax	 ; new_name, tmp128
	movq	40(%rbp), %rdx	 ; ast_node, tmp129
	movq	%rdx, 24(%rax)	 ; tmp129, new_name_42->ast_node.class
 ; D:/TC/src/helper.c:102:         case SYMBOL_CLASS: new_name->ast_node.class = (Class*)ast_node; break;
	jmp	.L42	 ;
.L41:
 ; D:/TC/src/helper.c:103:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	movq	-56(%rbp), %rax	 ; new_name, tmp130
	movq	40(%rbp), %rdx	 ; ast_node, tmp131
	movq	%rdx, 24(%rax)	 ; tmp131, new_name_42->ast_node.function
 ; D:/TC/src/helper.c:103:         case SYMBOL_FUNCTION: new_name->ast_node.function = (Function*)ast_node; break;
	jmp	.L42	 ;
.L39:
 ; D:/TC/src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	-56(%rbp), %rax	 ; new_name, tmp132
	movq	40(%rbp), %rdx	 ; ast_node, tmp133
	movq	%rdx, 24(%rax)	 ; tmp133, new_name_42->ast_node.method
 ; D:/TC/src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	jmp	.L42	 ;
.L38:
 ; D:/TC/src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	movq	-56(%rbp), %rax	 ; new_name, tmp134
	movq	40(%rbp), %rdx	 ; ast_node, tmp135
	movq	%rdx, 24(%rax)	 ; tmp135, new_name_42->ast_node.scope
 ; D:/TC/src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	jmp	.L42	 ;
.L37:
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movl	24(%rbp), %edx	 ; kind, tmp136
	movl	%edx, %r8d	 ; tmp136,
	leaq	.LC3(%rip), %rdx	 ;, tmp137
	movq	%rax, %rcx	 ; _16,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:111:             break;
	nop	
.L42:
 ; D:/TC/src/helper.c:113:     if (scope == NULL)
	cmpq	$0, -40(%rbp)	 ;, scope
	jne	.L43	 ;,
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	-56(%rbp), %rax	 ; new_name, tmp138
	movq	16(%rax), %rbx	 ; new_name_42->id, _17
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	24(%rax), %rax	 ; _18->_stderr, _19
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movl	24(%rbp), %ecx	 ; kind, tmp139
	movq	16(%rbp), %rdx	 ; name, tmp140
	movq	%rbx, 32(%rsp)	 ; _17,
	movl	%ecx, %r9d	 ; tmp139,
	movq	%rdx, %r8	 ; tmp140,
	leaq	.LC4(%rip), %rdx	 ;, tmp141
	movq	%rax, %rcx	 ; _19,
	call	fprintf	 ;
	jmp	.L44	 ;
.L43:
 ; D:/TC/src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	-40(%rbp), %rax	 ; scope, tmp142
	movq	8(%rax), %rax	 ; scope_21->symbols, _20
	movq	-56(%rbp), %rdx	 ; new_name, tmp143
	movq	%rax, %rcx	 ; _20,
	call	list_append	 ;
.L44:
 ; D:/TC/src/helper.c:117:     return new_name;
	movq	-56(%rbp), %rax	 ; new_name, _58
 ; D:/TC/src/helper.c:118: }
	addq	$88, %rsp	 ;,
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
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, new_scope
 ; D:/TC/src/helper.c:122:     new_scope->parent = parent;
	movq	-8(%rbp), %rax	 ; new_scope, tmp86
	movq	16(%rbp), %rdx	 ; parent, tmp87
	movq	%rdx, (%rax)	 ; tmp87, new_scope_4->parent
 ; D:/TC/src/helper.c:123:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; D:/TC/src/helper.c:123:     new_scope->symbols = create_list();
	movq	-8(%rbp), %rdx	 ; new_scope, tmp88
	movq	%rax, 8(%rdx)	 ; _1, new_scope_4->symbols
 ; D:/TC/src/helper.c:124:     return new_scope;
	movq	-8(%rbp), %rax	 ; new_scope, _9
 ; D:/TC/src/helper.c:125: }
	leave	
	ret	
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; scope, scope
	movq	%rdx, 24(%rbp)	 ; name, name
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	jmp	.L49	 ;
.L54:
 ; D:/TC/src/helper.c:129:         list(Symbol*) names = scope->symbols;
	movq	16(%rbp), %rax	 ; scope, tmp86
	movq	8(%rax), %rax	 ; scope_3->symbols, tmp87
	movq	%rax, -16(%rbp)	 ; tmp87, names
 ; D:/TC/src/helper.c:130:         Node* current = names->head;
	movq	-16(%rbp), %rax	 ; names, tmp88
	movq	(%rax), %rax	 ; names_9->head, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, current
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	jmp	.L50	 ;
.L53:
 ; D:/TC/src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	-8(%rbp), %rax	 ; current, tmp90
	movq	8(%rax), %rax	 ; current_4->content, tmp91
	movq	%rax, -24(%rbp)	 ; tmp91, current_name
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	-24(%rbp), %rax	 ; current_name, tmp92
	movq	8(%rax), %rax	 ; current_name_12->name, _1
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	24(%rbp), %rdx	 ; name, tmp93
	movq	%rax, %rcx	 ; _1,
	call	strcmp	 ;
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	 ; _2
	jne	.L51	 ;,
 ; D:/TC/src/helper.c:134:                 return current_name;
	movq	-24(%rbp), %rax	 ; current_name, _5
	jmp	.L52	 ;
.L51:
 ; D:/TC/src/helper.c:135:             current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp94
	movq	(%rax), %rax	 ; current_4->next, tmp95
	movq	%rax, -8(%rbp)	 ; tmp95, current
.L50:
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L53	 ;,
 ; D:/TC/src/helper.c:137:         scope = scope->parent;
	movq	16(%rbp), %rax	 ; scope, tmp96
	movq	(%rax), %rax	 ; scope_3->parent, tmp97
	movq	%rax, 16(%rbp)	 ; tmp97, scope
.L49:
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	cmpq	$0, 16(%rbp)	 ;, scope
	jne	.L54	 ;,
 ; D:/TC/src/helper.c:139:     return NULL;
	movl	$0, %eax	 ;, _5
.L52:
 ; D:/TC/src/helper.c:140: }
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
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	jmp	.L56	 ;
.L61:
 ; D:/TC/src/helper.c:144:         list(Symbol*) names = scope->symbols;
	movq	16(%rbp), %rax	 ; scope, tmp86
	movq	8(%rax), %rax	 ; scope_3->symbols, tmp87
	movq	%rax, -16(%rbp)	 ; tmp87, names
 ; D:/TC/src/helper.c:145:         Node* current = names->head;
	movq	-16(%rbp), %rax	 ; names, tmp88
	movq	(%rax), %rax	 ; names_12->head, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, current
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	jmp	.L57	 ;
.L60:
 ; D:/TC/src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	-8(%rbp), %rax	 ; current, tmp90
	movq	8(%rax), %rax	 ; current_4->content, tmp91
	movq	%rax, -24(%rbp)	 ; tmp91, current_name
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	-24(%rbp), %rax	 ; current_name, tmp92
	movq	8(%rax), %rax	 ; current_name_15->name, _1
	movq	24(%rbp), %rdx	 ; name, tmp93
	movq	%rax, %rcx	 ; _1,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; _2
	je	.L58	 ;,
 ; D:/TC/src/helper.c:149:                 return current_name;
	movq	-24(%rbp), %rax	 ; current_name, _5
	jmp	.L59	 ;
.L58:
 ; D:/TC/src/helper.c:150:             current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp94
	movq	(%rax), %rax	 ; current_4->next, tmp95
	movq	%rax, -8(%rbp)	 ; tmp95, current
.L57:
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L60	 ;,
 ; D:/TC/src/helper.c:152:         scope = scope->parent;
	movq	16(%rbp), %rax	 ; scope, tmp96
	movq	(%rax), %rax	 ; scope_3->parent, tmp97
	movq	%rax, 16(%rbp)	 ; tmp97, scope
.L56:
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	cmpq	$0, 16(%rbp)	 ;, scope
	jne	.L61	 ;,
 ; D:/TC/src/helper.c:154:     return NULL;
	movl	$0, %eax	 ;, _5
.L59:
 ; D:/TC/src/helper.c:155: }
	leave	
	ret	
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; type, type
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp95
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD.5_1
	movq	16(%rbp), %rax	 ; type, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _2
	jne	.L63	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD.6_3
	movq	16(%rbp), %rax	 ; type, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _4
	jne	.L63	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp99
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD.7_5
	movq	16(%rbp), %rax	 ; type, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _6
	jne	.L63	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp101
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD.8_7
	movq	16(%rbp), %rax	 ; type, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _8
	jne	.L63	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp103
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD.9_9
	movq	16(%rbp), %rax	 ; type, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; _10
	je	.L64	 ;,
.L63:
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.4_11
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L65	 ;
.L64:
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$0, %eax	 ;, iftmp.4_11
.L65:
 ; D:/TC/src/helper.c:159: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC5:
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
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rbp), %rax	 ; token, tmp88
	movq	16(%rax), %rax	 ; token_8(D)->column, _1
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rbx	 ;, _2
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rbp), %rax	 ; token, tmp89
	movq	8(%rax), %rax	 ; token_8(D)->line, _3
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	leaq	1(%rax), %rsi	 ;, _4
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	32(%rbp), %rcx	 ; file_name, tmp90
	movq	16(%rbp), %rdx	 ; message, tmp91
	movq	%rdx, 40(%rsp)	 ; tmp91,
	movq	%rbx, 32(%rsp)	 ; _2,
	movq	%rsi, %r9	 ; _4,
	movq	%rcx, %r8	 ; tmp90,
	leaq	.LC5(%rip), %rdx	 ;, tmp92
	movq	%rax, %rcx	 ; _6,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:163: }
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
	movl	%r8d, %eax	 ; value, tmp96
	movb	%al, 32(%rbp)	 ; tmp97, value
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	movq	24(%rbp), %rax	 ; index, tmp98
	shrq	$3, %rax	 ;, tmp98
	movq	%rax, %rdx	 ; tmp98, _1
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	movq	16(%rbp), %rax	 ; bool_list, tmp99
	addq	%rdx, %rax	 ; _1, _2
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	movzbl	(%rax), %eax	 ; *_2, tmp100
	movb	%al, -1(%rbp)	 ; tmp100, word
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	cmpb	$0, 32(%rbp)	 ;, value
	je	.L69	 ;,
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	24(%rbp), %rax	 ; index, tmp101
	andl	$7, %eax	 ;, _4
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %edx	 ;, tmp102
	movl	%eax, %ecx	 ; _4, tmp110
	sall	%cl, %edx	 ; tmp110, tmp102
	movl	%edx, %eax	 ; tmp102, _5
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orb	-1(%rbp), %al	 ; word, iftmp.10_14
	jmp	.L70	 ;
.L69:
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	24(%rbp), %rax	 ; index, tmp103
	andl	$7, %eax	 ;, _8
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %edx	 ;, tmp104
	movl	%eax, %ecx	 ; _8, tmp112
	sall	%cl, %edx	 ; tmp112, tmp104
	movl	%edx, %eax	 ; tmp104, _9
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%eax	 ; _11
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andb	-1(%rbp), %al	 ; word, iftmp.10_14
.L70:
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	24(%rbp), %rdx	 ; index, tmp105
	movq	%rdx, %rcx	 ; tmp105, tmp105
	shrq	$3, %rcx	 ;, tmp105
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movq	16(%rbp), %rdx	 ; bool_list, tmp106
	addq	%rcx, %rdx	 ; _12, _13
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movb	%al, (%rdx)	 ; iftmp.10_14, *_13
 ; D:/TC/src/helper.c:168: }
	nop	
	leave	
	ret	
	.def	get_bool_list;	.scl	3;	.type	32;	.endef
get_bool_list:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movq	%rcx, 16(%rbp)	 ; bool_list, bool_list
	movq	%rdx, 24(%rbp)	 ; index, index
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	24(%rbp), %rax	 ; index, tmp93
	shrq	$3, %rax	 ;, tmp93
	movq	%rax, %rdx	 ; tmp93, _1
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	16(%rbp), %rax	 ; bool_list, tmp94
	addq	%rdx, %rax	 ; _1, _2
	movzbl	(%rax), %eax	 ; *_2, _3
	movsbl	%al, %edx	 ; _3, _4
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	24(%rbp), %rax	 ; index, tmp95
	andl	$7, %eax	 ;, _6
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%eax, %ecx	 ; _6, tmp100
	sarl	%cl, %edx	 ; tmp100, _4
	movl	%edx, %eax	 ; _4, _7
	andl	$1, %eax	 ;, _8
	testl	%eax, %eax	 ; _8
	setne	%al	 ;, _9
 ; D:/TC/src/helper.c:172: }
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC6:
	.ascii "\342\224\202   \0"
.LC7:
	.ascii "    \0"
.LC8:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC9:
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
	movl	%r8d, %eax	 ; is_last, tmp87
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
	movb	%al, 32(%rbp)	 ; tmp88, is_last
 ; D:/TC/src/helper.c:175:     set_bool_list(indent_has_next, indent, !is_last);
	cmpb	$0, 32(%rbp)	 ;, is_last
	sete	%al	 ;, _1
	movzbl	%al, %ecx	 ; _1, _2
	movq	24(%rbp), %rdx	 ; indent, tmp89
	movq	40(%rbp), %rax	 ; indent_has_next, tmp90
	movl	%ecx, %r8d	 ; _2,
	movq	%rax, %rcx	 ; tmp90,
	call	set_bool_list	 ;
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movq	$1, -8(%rbp)	 ;, i
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	jmp	.L74	 ;
.L77:
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	-8(%rbp), %rdx	 ; i, tmp91
	movq	40(%rbp), %rax	 ; indent_has_next, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	get_bool_list	 ;
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	testb	%al, %al	 ; _3
	je	.L75	 ;,
	leaq	.LC6(%rip), %rax	 ;, iftmp.11_5
	jmp	.L76	 ;
.L75:
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC7(%rip), %rax	 ;, iftmp.11_5
.L76:
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	16(%rbp), %rcx	 ; out, tmp93
	movq	%rax, %rdx	 ; iftmp.11_5,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, -8(%rbp)	 ;, i
.L74:
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movq	-8(%rbp), %rax	 ; i, tmp94
	cmpq	24(%rbp), %rax	 ; indent, tmp94
	jb	.L77	 ;,
 ; D:/TC/src/helper.c:178:     if (indent > 0)
	cmpq	$0, 24(%rbp)	 ;, indent
	je	.L81	 ;,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	cmpb	$0, 32(%rbp)	 ;, is_last
	je	.L79	 ;,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC8(%rip), %rax	 ;, iftmp.12_6
	jmp	.L80	 ;
.L79:
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC9(%rip), %rax	 ;, iftmp.12_6
.L80:
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	movq	16(%rbp), %rcx	 ; out, tmp95
	movq	%rax, %rdx	 ; iftmp.12_6,
	call	fprintf	 ;
.L81:
 ; D:/TC/src/helper.c:180: }
	nop	
	leave	
	ret	
	.globl	indention_tac
	.def	indention_tac;	.scl	2;	.type	32;	.endef
indention_tac:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; out, out
	movq	%rdx, 24(%rbp)	 ; indent, indent
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	movq	$0, -8(%rbp)	 ;, i
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	jmp	.L83	 ;
.L84:
 ; D:/TC/src/helper.c:184:         putc(' ', out);
	movq	16(%rbp), %rax	 ; out, tmp83
	movq	%rax, %rdx	 ; tmp83,
	movl	$32, %ecx	 ;,
	call	putc	 ;
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	addq	$1, -8(%rbp)	 ;, i
.L83:
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	movq	24(%rbp), %rax	 ; indent, tmp84
	salq	$2, %rax	 ;, _1
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rax, -8(%rbp)	 ; _1, i
	jb	.L84	 ;,
 ; D:/TC/src/helper.c:185: }
	nop	
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
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, new_parser
 ; D:/TC/src/helper.c:189:     new_parser->in_function = false;
	movq	-8(%rbp), %rax	 ; new_parser, tmp85
	movb	$0, 8(%rax)	 ;, new_parser_3->in_function
 ; D:/TC/src/helper.c:190:     new_parser->in_method = false;
	movq	-8(%rbp), %rax	 ; new_parser, tmp86
	movb	$0, 9(%rax)	 ;, new_parser_3->in_method
 ; D:/TC/src/helper.c:191:     new_parser->in_loop = false;
	movq	-8(%rbp), %rax	 ; new_parser, tmp87
	movb	$0, 11(%rax)	 ;, new_parser_3->in_loop
 ; D:/TC/src/helper.c:192:     new_parser->source_file = file;
	movq	-8(%rbp), %rax	 ; new_parser, tmp88
	movq	16(%rbp), %rdx	 ; file, tmp89
	movq	%rdx, (%rax)	 ; tmp89, new_parser_3->source_file
 ; D:/TC/src/helper.c:193:     return new_parser;
	movq	-8(%rbp), %rax	 ; new_parser, _9
 ; D:/TC/src/helper.c:194: }
	leave	
	ret	
	.section .rdata,"dr"
.LC10:
	.ascii "\0"
.LC11:
	.ascii "%s.tc\0"
.LC12:
	.ascii "D:/TC/std/\0"
.LC13:
	.ascii "r\0"
	.align 8
.LC14:
	.ascii "Error opening library file for import: %s\12\0"
	.align 8
.LC15:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
	.align 8
.LC16:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
	.align 8
.LC17:
	.ascii "Error parsing library file for import: %s\12\0"
	.align 8
.LC18:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; import_name, import_name
	movq	%rdx, 24(%rbp)	 ; source, source
	movq	%r8, 32(%rbp)	 ; scope, scope
	movq	%r9, 40(%rbp)	 ; source_file, source_file
 ; D:/TC/src/helper.c:197:     Symbol* name = NULL;
	movq	$0, -32(%rbp)	 ;, name
 ; D:/TC/src/helper.c:200:     if (source == NULL) {
	cmpq	$0, 24(%rbp)	 ;, source
	jne	.L88	 ;,
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	16(%rbp), %rax	 ; import_name, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	strlen	 ;
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	addq	$4, %rax	 ;, _2
	movq	%rax, %rdx	 ; _2,
	leaq	.LC10(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	create_string_not_check	 ;
	movq	%rax, -40(%rbp)	 ; tmp102, temp_import_name
 ; D:/TC/src/helper.c:203:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	16(%rbp), %rdx	 ; import_name, tmp103
	movq	-40(%rbp), %rax	 ; temp_import_name, tmp104
	movq	%rdx, %r8	 ; tmp103,
	leaq	.LC11(%rip), %rdx	 ;, tmp105
	movq	%rax, %rcx	 ; tmp104,
	call	sprintf	 ;
 ; D:/TC/src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	movq	-40(%rbp), %rax	 ; temp_import_name, tmp106
	leaq	.LC12(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; tmp106,
	call	absolute_path	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, filename
	jmp	.L89	 ;
.L88:
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	40(%rbp), %rax	 ; source_file, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	get_file_dir	 ;
	movq	%rax, %rdx	 ;, _3
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	24(%rbp), %rax	 ; source, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	absolute_path	 ;
	movq	%rax, -24(%rbp)	 ; tmp111, filename
.L89:
 ; D:/TC/src/helper.c:207:     openfile = fopen(filename, "r");
	movq	-24(%rbp), %rax	 ; filename, tmp112
	leaq	.LC13(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; tmp112,
	call	fopen	 ;
	movq	%rax, -48(%rbp)	 ; tmp114, openfile
 ; D:/TC/src/helper.c:208:     if (openfile == NULL) {
	cmpq	$0, -48(%rbp)	 ;, openfile
	jne	.L90	 ;,
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	-24(%rbp), %rdx	 ; filename, tmp115
	movq	%rdx, %r8	 ; tmp115,
	leaq	.LC14(%rip), %rdx	 ;, tmp116
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:210:         return NULL;
	movl	$0, %eax	 ;, _18
	jmp	.L95	 ;
.L90:
 ; D:/TC/src/helper.c:212:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	-24(%rbp), %rax	 ; filename, tmp117
	movq	%rax, %rdx	 ; tmp117,
	leaq	.LC15(%rip), %rax	 ;, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	printf	 ;
 ; D:/TC/src/helper.c:213:     size_t length = 0;
	movq	$0, -72(%rbp)	 ;, length
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	-72(%rbp), %rdx	 ;, tmp119
	movq	-48(%rbp), %rax	 ; openfile, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	read_source	 ;
	movq	%rax, -56(%rbp)	 ; tmp121, source_code
 ; D:/TC/src/helper.c:215:     fclose(openfile);
	movq	-48(%rbp), %rax	 ; openfile, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	fclose	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	-24(%rbp), %rax	 ; filename, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	create_file	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rcx	 ; _6,
	call	create_parser	 ;
	movq	%rax, %rsi	 ;, _7
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp124
	movq	(%rax), %rbx	 ; builtin_scope, builtin_scope.13_8
	movq	-72(%rbp), %rdx	 ; length, length.14_9
	movq	-56(%rbp), %rax	 ; source_code, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	create_lexer	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rsi, %r8	 ; _7,
	movq	%rbx, %rdx	 ; builtin_scope.13_8,
	movq	%rax, %rcx	 ; _10,
	call	parse_code	 ;
	movq	%rax, -64(%rbp)	 ; tmp126, code
 ; D:/TC/src/helper.c:217:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	-24(%rbp), %rax	 ; filename, tmp127
	movq	%rax, %rdx	 ; tmp127,
	leaq	.LC16(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	printf	 ;
 ; D:/TC/src/helper.c:218:     if (code == NULL) {
	cmpq	$0, -64(%rbp)	 ;, code
	jne	.L92	 ;,
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rax	 ; _11->_stderr, _12
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	-24(%rbp), %rdx	 ; filename, tmp129
	movq	%rdx, %r8	 ; tmp129,
	leaq	.LC17(%rip), %rdx	 ;, tmp130
	movq	%rax, %rcx	 ; _12,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:220:         return NULL;
	movl	$0, %eax	 ;, _18
	jmp	.L95	 ;
.L92:
 ; D:/TC/src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	-64(%rbp), %rax	 ; code, tmp131
	movq	8(%rax), %rax	 ; code_46->global_scope, _13
	movq	16(%rbp), %rdx	 ; import_name, tmp132
	movq	%rax, %rcx	 ; _13,
	call	search_name_use_strcmp	 ;
	movq	%rax, -32(%rbp)	 ; tmp133, name
 ; D:/TC/src/helper.c:223:     if (name != NULL)
	cmpq	$0, -32(%rbp)	 ;, name
	je	.L93	 ;,
 ; D:/TC/src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	32(%rbp), %rax	 ; scope, tmp134
	movq	8(%rax), %rax	 ; scope_52(D)->symbols, _14
	movq	-32(%rbp), %rdx	 ; name, tmp135
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
	jmp	.L94	 ;
.L93:
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	-24(%rbp), %rcx	 ; filename, tmp136
	movq	16(%rbp), %rdx	 ; import_name, tmp137
	movq	%rcx, %r9	 ; tmp136,
	movq	%rdx, %r8	 ; tmp137,
	leaq	.LC18(%rip), %rdx	 ;, tmp138
	movq	%rax, %rcx	 ; _16,
	call	fprintf	 ;
.L94:
 ; D:/TC/src/helper.c:227:     return name;
	movq	-32(%rbp), %rax	 ; name, _18
.L95:
 ; D:/TC/src/helper.c:228: }
	addq	$96, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class_name, class_name
	movq	%rdx, 24(%rbp)	 ; method_name, method_name
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	16(%rbp), %rax	 ; class_name, tmp88
	movq	%rax, %rcx	 ; tmp88,
	call	strlen	 ;
	movq	%rax, %rbx	 ;, _1
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	24(%rbp), %rax	 ; method_name, tmp89
	movq	%rax, %rcx	 ; tmp89,
	call	strlen	 ;
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	addq	%rbx, %rax	 ; _1, _3
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	addq	$2, %rax	 ;, _4
	movq	%rax, %rdx	 ; _4,
	leaq	.LC10(%rip), %rax	 ;, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	create_string	 ;
	movq	%rax, -24(%rbp)	 ; tmp91, name
 ; D:/TC/src/helper.c:232:     sprintf(name, "%s.%s", class_name, method_name);
	movq	24(%rbp), %rcx	 ; method_name, tmp92
	movq	16(%rbp), %rdx	 ; class_name, tmp93
	movq	-24(%rbp), %rax	 ; name, tmp94
	movq	%rcx, %r9	 ; tmp92,
	movq	%rdx, %r8	 ; tmp93,
	leaq	.LC19(%rip), %rdx	 ;, tmp95
	movq	%rax, %rcx	 ; tmp94,
	call	sprintf	 ;
 ; D:/TC/src/helper.c:233:     return name;
	movq	-24(%rbp), %rax	 ; name, _11
 ; D:/TC/src/helper.c:234: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; str, str
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL.15_1
	movq	16(%rbp), %rax	 ; str, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%al, %al	 ; _2
	je	.L99	 ;,
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, _39
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	jmp	.L100	 ;
.L99:
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL.16_3
	movq	16(%rbp), %rax	 ; str, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%al, %al	 ; _4
	je	.L101	 ;,
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, _39
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	jmp	.L100	 ;
.L101:
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL.17_5
	movq	16(%rbp), %rax	 ; str, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%al, %al	 ; _6
	je	.L102	 ;,
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, _39
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	jmp	.L100	 ;
.L102:
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL.18_7
	movq	16(%rbp), %rax	 ; str, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%al, %al	 ; _8
	je	.L103	 ;,
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, _39
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	jmp	.L100	 ;
.L103:
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL.19_9
	movq	16(%rbp), %rax	 ; str, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%al, %al	 ; _10
	je	.L104	 ;,
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, _39
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	jmp	.L100	 ;
.L104:
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL.20_11
	movq	16(%rbp), %rax	 ; str, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%al, %al	 ; _12
	je	.L105	 ;,
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, _39
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	jmp	.L100	 ;
.L105:
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL.21_13
	movq	16(%rbp), %rax	 ; str, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%al, %al	 ; _14
	je	.L106	 ;,
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, _39
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	jmp	.L100	 ;
.L106:
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL.22_15
	movq	16(%rbp), %rax	 ; str, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%al, %al	 ; _16
	je	.L107	 ;,
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, _39
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	jmp	.L100	 ;
.L107:
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL.23_17
	movq	16(%rbp), %rax	 ; str, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%al, %al	 ; _18
	je	.L108	 ;,
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, _39
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	jmp	.L100	 ;
.L108:
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL.24_19
	movq	16(%rbp), %rax	 ; str, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%al, %al	 ; _20
	je	.L109	 ;,
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, _39
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	jmp	.L100	 ;
.L109:
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL.25_21
	movq	16(%rbp), %rax	 ; str, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%al, %al	 ; _22
	je	.L110	 ;,
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, _39
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	jmp	.L100	 ;
.L110:
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL.26_23
	movq	16(%rbp), %rax	 ; str, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%al, %al	 ; _24
	je	.L111	 ;,
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, _39
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	jmp	.L100	 ;
.L111:
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL.27_25
	movq	16(%rbp), %rax	 ; str, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%al, %al	 ; _26
	je	.L112	 ;,
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, _39
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	jmp	.L100	 ;
.L112:
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL.28_27
	movq	16(%rbp), %rax	 ; str, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%al, %al	 ; _28
	je	.L113	 ;,
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, _39
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	jmp	.L100	 ;
.L113:
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL.29_29
	movq	16(%rbp), %rax	 ; str, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%al, %al	 ; _30
	je	.L114	 ;,
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	 ;, _39
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	jmp	.L100	 ;
.L114:
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL.30_31
	movq	16(%rbp), %rax	 ; str, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%al, %al	 ; _32
	je	.L115	 ;,
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, _39
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	jmp	.L100	 ;
.L115:
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; MUL_SYMBOL, MUL_SYMBOL.31_33
	movq	16(%rbp), %rax	 ; str, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; _34
	je	.L116	 ;,
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, _39
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	jmp	.L100	 ;
.L116:
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp156
	movq	(%rax), %rdx	 ; DIV_SYMBOL, DIV_SYMBOL.32_35
	movq	16(%rbp), %rax	 ; str, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; _36
	je	.L117	 ;,
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, _39
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	jmp	.L100	 ;
.L117:
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp158
	movq	(%rax), %rdx	 ; MOD_SYMBOL, MOD_SYMBOL.33_37
	movq	16(%rbp), %rax	 ; str, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	testb	%al, %al	 ; _38
	je	.L118	 ;,
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movl	$4, %eax	 ;, _39
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	jmp	.L100	 ;
.L118:
 ; D:/TC/src/helper.c:257:     else return OP_NONE;
	movl	$19, %eax	 ;, _39
.L100:
 ; D:/TC/src/helper.c:258: }
	leave	
	ret	
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:/TC/src/helper.c:261:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L120	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L122(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L122(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
	.align 4
.L122:
	.long	.L126-.L122
	.long	.L126-.L122
	.long	.L125-.L122
	.long	.L125-.L122
	.long	.L125-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L124-.L122
	.long	.L123-.L122
	.long	.L123-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.long	.L121-.L122
	.text
.L121:
 ; D:/TC/src/helper.c:268:             return 1;
	movl	$1, %eax	 ;, _1
	jmp	.L127	 ;
.L123:
 ; D:/TC/src/helper.c:271:             return 2;
	movl	$2, %eax	 ;, _1
	jmp	.L127	 ;
.L124:
 ; D:/TC/src/helper.c:278:             return 3;
	movl	$3, %eax	 ;, _1
	jmp	.L127	 ;
.L126:
 ; D:/TC/src/helper.c:281:             return 4;
	movl	$4, %eax	 ;, _1
	jmp	.L127	 ;
.L125:
 ; D:/TC/src/helper.c:285:             return 5;
	movl	$5, %eax	 ;, _1
	jmp	.L127	 ;
.L120:
 ; D:/TC/src/helper.c:288:             return 0;
	movl	$0, %eax	 ;, _1
.L127:
 ; D:/TC/src/helper.c:290: }
	popq	%rbp	 ;
	ret	
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:/TC/src/helper.c:293:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L129	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L131(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L131(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
	.align 4
.L131:
	.long	.L149-.L131
	.long	.L148-.L131
	.long	.L147-.L131
	.long	.L146-.L131
	.long	.L145-.L131
	.long	.L144-.L131
	.long	.L143-.L131
	.long	.L142-.L131
	.long	.L141-.L131
	.long	.L140-.L131
	.long	.L139-.L131
	.long	.L138-.L131
	.long	.L137-.L131
	.long	.L136-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L130-.L131
	.text
.L136:
 ; D:/TC/src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, _1
	jmp	.L150	 ;
.L135:
 ; D:/TC/src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, _1
	jmp	.L150	 ;
.L134:
 ; D:/TC/src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, _1
	jmp	.L150	 ;
.L133:
 ; D:/TC/src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, _1
	jmp	.L150	 ;
.L132:
 ; D:/TC/src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, _1
	jmp	.L150	 ;
.L130:
 ; D:/TC/src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, _1
	jmp	.L150	 ;
.L138:
 ; D:/TC/src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; AND_SYMBOL, _1
	jmp	.L150	 ;
.L137:
 ; D:/TC/src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; OR_SYMBOL, _1
	jmp	.L150	 ;
.L144:
 ; D:/TC/src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; EQ_SYMBOL, _1
	jmp	.L150	 ;
.L143:
 ; D:/TC/src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; NE_SYMBOL, _1
	jmp	.L150	 ;
.L142:
 ; D:/TC/src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; LT_SYMBOL, _1
	jmp	.L150	 ;
.L141:
 ; D:/TC/src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; GT_SYMBOL, _1
	jmp	.L150	 ;
.L140:
 ; D:/TC/src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; LE_SYMBOL, _1
	jmp	.L150	 ;
.L139:
 ; D:/TC/src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; GE_SYMBOL, _1
	jmp	.L150	 ;
.L149:
 ; D:/TC/src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; ADD_SYMBOL, _1
	jmp	.L150	 ;
.L148:
 ; D:/TC/src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; SUB_SYMBOL, _1
	jmp	.L150	 ;
.L147:
 ; D:/TC/src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; MUL_SYMBOL, _1
	jmp	.L150	 ;
.L146:
 ; D:/TC/src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; DIV_SYMBOL, _1
	jmp	.L150	 ;
.L145:
 ; D:/TC/src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp109
	movq	(%rax), %rax	 ; MOD_SYMBOL, _1
	jmp	.L150	 ;
.L129:
 ; D:/TC/src/helper.c:314:         default: return NULL;
	movl	$0, %eax	 ;, _1
.L150:
 ; D:/TC/src/helper.c:316: }
	popq	%rbp	 ;
	ret	
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
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
	.def	create_string;	.scl	2;	.type	32;	.endef
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
