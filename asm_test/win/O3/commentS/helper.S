	.file	"helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.p2align 4
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	pushq	%rbp	 ;
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:7: list() create_list(void) {
	movq	%rsp, %rbp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:9:     new_list->head = NULL;
	pxor	%xmm0, %xmm0	 ; tmp83
	movups	%xmm0, (%rax)	 ; tmp83, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_3]
 ; D:/TC/src/helper.c:12: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.p2align 4
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:22:     if (list == NULL) {
	testq	%rcx, %rcx	 ; list
	je	.L9	 ;,
	movq	%rcx, %rbx	 ; tmp95, list
 ; D:/TC/src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp96, item
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, list_3(D)->head
 ; D:/TC/src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	 ;, new_node_11->next
 ; D:/TC/src/helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_11->content
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	je	.L10	 ;,
 ; D:/TC/src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_3(D)->tail, list_3(D)->tail
	movq	%rax, (%rdx)	 ; new_node, _2->next
 ; D:/TC/src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_3(D)->tail
 ; D:/TC/src/helper.c:34: }
	leaq	-16(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:/TC/src/helper.c:28:         list->head = new_node;
	movq	%rax, %xmm0	 ; new_node, tmp93
	punpcklqdq	%xmm0, %xmm0	 ; tmp93
	movups	%xmm0, (%rbx)	 ; tmp93, MEM <vector(2) long unsigned int> [(struct Node * *)list_3(D)]
 ; D:/TC/src/helper.c:34: }
	leaq	-16(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp92
	movq	24(%rax), %r9	 ; _16->_stderr,
 ; D:/TC/src/helper.c:34: }
	leaq	-16(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	jmp	fwrite	 ;
	.p2align 4
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
 ; D:/TC/src/helper.c:37:     if (original == NULL)
	testq	%rcx, %rcx	 ; original
	je	.L13	 ;,
 ; D:/TC/src/helper.c:36: list() list_copy(list() original) {
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp88, original
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:36: list() list_copy(list() original) {
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:9:     new_list->head = NULL;
	pxor	%xmm0, %xmm0	 ; tmp85
	movups	%xmm0, (%rax)	 ; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_9]
 ; D:/TC/src/helper.c:40:     new_list->head = original->head;
	movdqu	(%rbx), %xmm1	 ; MEM <vector(2) long unsigned int> [(struct Node * *)original_5(D)], tmp91
 ; D:/TC/src/helper.c:43: }
	movq	-8(%rbp), %rbx	 ;,
 ; D:/TC/src/helper.c:40:     new_list->head = original->head;
	movups	%xmm1, (%rax)	 ; tmp91, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_9]
 ; D:/TC/src/helper.c:43: }
	leave	
	ret	
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:/TC/src/helper.c:38:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/helper.c:43: }
	ret	
	.p2align 4
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L21	 ;,
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_6(D)->head, <retval>
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L18	 ;,
 ; D:/TC/src/helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; D:/TC/src/helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_6(D)->head
 ; D:/TC/src/helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	 ; _2
	je	.L25	 ;,
 ; D:/TC/src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:/TC/src/helper.c:47:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L18:
 ; D:/TC/src/helper.c:53: }
	ret	
	.p2align 4,,10
	.p2align 3
.L25:
 ; D:/TC/src/helper.c:51:         list->tail = NULL;
	movq	$0, 8(%rcx)	 ;, list_6(D)->tail
 ; D:/TC/src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
	ret	
	.p2align 4
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	andq	$-16, %rsp	 ;,
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L29	 ;,
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_8(D)->head, <retval>
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L26	 ;,
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	movq	8(%rcx), %rdx	 ; list_8(D)->tail, _3
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%rdx, %rax	 ; _3, <retval>
	je	.L36	 ;,
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%rax, %r8	 ; <retval>, current
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	 ; current_5->next, <retval>
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	 ; <retval>, _3
	jne	.L28	 ;,
 ; D:/TC/src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	 ; _3->content, <retval>
 ; D:/TC/src/helper.c:68:     current->next = NULL;
	movq	$0, (%r8)	 ;, current_16->next
 ; D:/TC/src/helper.c:69:     list->tail = current;
	movq	%r8, 8(%rcx)	 ; current, list_8(D)->tail
.L26:
 ; D:/TC/src/helper.c:71: }
	leave	
	ret	
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:/TC/src/helper.c:60:         list->head = NULL;
	pxor	%xmm0, %xmm0	 ; tmp86
 ; D:/TC/src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
 ; D:/TC/src/helper.c:60:         list->head = NULL;
	movups	%xmm0, (%rcx)	 ; tmp86, MEM <vector(2) long unsigned int> [(struct Node * *)list_8(D)]
 ; D:/TC/src/helper.c:71: }
	leave	
	ret	
	.p2align 4,,10
	.p2align 3
.L29:
	leave	
 ; D:/TC/src/helper.c:57:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/helper.c:71: }
	ret	
	.p2align 4
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
	movl	$1, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rcx, %rcx	 ; list
	je	.L37	 ;,
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, (%rcx)	 ;, list_4(D)->head
	je	.L37	 ;,
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, 8(%rcx)	 ;, list_4(D)->tail
	sete	%al	 ;, <retval>
.L37:
 ; D:/TC/src/helper.c:75: }
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[Warning] Creating symbol with unknown SymbolType: %u\12\0"
	.align 8
.LC2:
	.ascii "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
	.align 8
.LC3:
	.ascii "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.align 8
.LC4:
	.ascii "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\12\0"
	.text
	.p2align 4
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	movq	%r9, %r13	 ; tmp148, ast_node
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movl	%edx, %edi	 ; tmp146, kind
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp145, name
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/helper.c:78: Symbol* create_symbol(string name, SymbolType kind, Symbol* type, void* ast_node) {
	movq	%r8, 32(%rbp)	 ; tmp147, type
 ; D:/TC/src/helper.c:81:     switch (kind) {
	cmpl	$2, %edx	 ;, kind
	je	.L43	 ;,
	ja	.L44	 ;,
	testl	%edx, %edx	 ; kind
	je	.L77	 ;,
.L43:
 ; D:/TC/src/helper.c:84:         case SYMBOL_METHOD: scope = ((Method*)ast_node)->method_scope->parent; break;
	movq	32(%r13), %rax	 ;, MEM[(struct Method *)ast_node_26(D)].method_scope
	movq	(%rax), %r15	 ;* MEM[(struct Method *)ast_node_26(D)].method_scope, scope
.L48:
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	testq	%r15, %r15	 ; scope
	je	.L50	 ;,
	movq	%r15, %r12	 ; scope, scope
.L54:
 ; D:/TC/src/helper.c:145:         Node* current = names->head;
	movq	8(%r12), %rax	 ; scope_52->symbols, scope_52->symbols
	movq	(%rax), %rbx	 ; names_56->head, current
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L53	 ;,
	jmp	.L51	 ;
	.p2align 4,,10
	.p2align 3
.L78:
 ; D:/TC/src/helper.c:150:             current = current->next;
	movq	(%rbx), %rbx	 ; current_34->next, current
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L51	 ;,
.L53:
 ; D:/TC/src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %r14	 ; current_34->content, current_name
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	%rsi, %rdx	 ; name,
	movq	8(%r14), %rcx	 ; current_name_59->name, current_name_59->name
	call	string_equal	 ;
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp152
	je	.L78	 ;,
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp164
	movq	16(%r14), %r12	 ; current_name_59->id, _8
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	32(%r14), %r14d	 ; current_name_59->kind, _9
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	leaq	1(%rax), %rbx	 ;, _7
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "[Warning] Name '%s' already exists in the current scope, kind: %u, exists id: %zu, new id %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	%r14d, %r9d	 ; _9,
	movq	%rsi, %r8	 ; name,
	leaq	.LC4(%rip), %rdx	 ;, tmp144
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	movq	%rbx, 40(%rsp)	 ; _7,
	movq	%r12, 32(%rsp)	 ; _8,
	call	fprintf	 ;
.L50:
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:97:     new_name->name = name;
	movq	%rsi, 8(%rax)	 ; name, new_name_39->name
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %rbx	 ; tmp153, <retval>
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp161
 ; D:/TC/src/helper.c:99:     new_name->kind = kind;
	movl	%edi, 32(%rbx)	 ; kind, new_name_39->kind
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	addq	$1, %rax	 ;, _13
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _13, id_counter
	movq	%rax, 16(%rbx)	 ; _13, new_name_39->id
 ; D:/TC/src/helper.c:100:     new_name->type = type;
	movq	32(%rbp), %rax	 ; type, tmp162
 ; D:/TC/src/helper.c:104:         case SYMBOL_METHOD: new_name->ast_node.method = (Method*)ast_node; break;
	movq	%r13, 24(%rbx)	 ; ast_node,
 ; D:/TC/src/helper.c:100:     new_name->type = type;
	movq	%rax, (%rbx)	 ; tmp162, new_name_39->type
 ; D:/TC/src/helper.c:113:     if (scope == NULL)
	testq	%r15, %r15	 ; scope
	je	.L74	 ;,
 ; D:/TC/src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%r15), %rsi	 ; scope_106->symbols, _19
 ; D:/TC/src/helper.c:22:     if (list == NULL) {
	testq	%rsi, %rsi	 ; _19
	je	.L79	 ;,
 ; D:/TC/src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rsi)	 ;, _19->head
 ; D:/TC/src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	 ;, new_node_66->next
 ; D:/TC/src/helper.c:17:     new_node->content = content;
	movq	%rbx, 8(%rax)	 ; <retval>, new_node_66->content
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	je	.L80	 ;,
 ; D:/TC/src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rsi), %rdx	 ; _19->tail, _19->tail
	movq	%rax, (%rdx)	 ; new_node, _68->next
 ; D:/TC/src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rsi)	 ; new_node, _19->tail
.L42:
 ; D:/TC/src/helper.c:118: }
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
.L44:
 ; D:/TC/src/helper.c:81:     switch (kind) {
	leal	-3(%rdx), %eax	 ;, tmp123
	movq	%r9, %r15	 ; ast_node, scope
	cmpl	$3, %eax	 ;, tmp123
	jbe	.L48	 ;,
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType: %u\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType: %u\n", kind);
	movl	%edi, %r8d	 ; kind,
	leaq	.LC1(%rip), %rdx	 ;, tmp128
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	call	fprintf	 ;
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:97:     new_name->name = name;
	movq	%rsi, 8(%rax)	 ; name, new_name_65->name
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %rbx	 ; tmp150, <retval>
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp159
 ; D:/TC/src/helper.c:99:     new_name->kind = kind;
	movl	%edi, 32(%rbx)	 ; kind, new_name_65->kind
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	addq	$1, %rax	 ;, _35
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _35, id_counter
	movq	%rax, 16(%rbx)	 ; _35, new_name_65->id
 ; D:/TC/src/helper.c:100:     new_name->type = type;
	movq	32(%rbp), %rax	 ; type, tmp160
	movq	%rax, (%rbx)	 ; tmp160, new_name_65->type
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "[Warning] Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movl	%edi, %r8d	 ; kind,
	leaq	.LC2(%rip), %rdx	 ;, tmp131
	movq	24(%rax), %rcx	 ; _14->_stderr, _14->_stderr
	call	fprintf	 ;
.L74:
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	16(%rbx), %r12	 ; new_name_103->id, _16
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "[Warning] Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movl	%edi, %r9d	 ; kind,
	movq	%rsi, %r8	 ; name,
	leaq	.LC3(%rip), %rdx	 ;, tmp136
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
	movq	%r12, 32(%rsp)	 ; _16,
	call	fprintf	 ;
	jmp	.L42	 ;
	.p2align 4,,10
	.p2align 3
.L51:
 ; D:/TC/src/helper.c:152:         scope = scope->parent;
	movq	(%r12), %r12	 ; scope_52->parent, scope
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	testq	%r12, %r12	 ; scope
	jne	.L54	 ;,
	jmp	.L50	 ;
	.p2align 4,,10
	.p2align 3
.L77:
 ; D:/TC/src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%r9), %rax	 ; MEM[(struct Class *)ast_node_26(D)].class_scope, MEM[(struct Class *)ast_node_26(D)].class_scope
	movq	(%rax), %r15	 ;* MEM[(struct Class *)ast_node_26(D)].class_scope, scope
 ; D:/TC/src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L80:
 ; D:/TC/src/helper.c:28:         list->head = new_node;
	movq	%rax, %xmm0	 ; new_node, tmp139
	punpcklqdq	%xmm0, %xmm0	 ; tmp139
	movups	%xmm0, (%rsi)	 ; tmp139, MEM <vector(2) long unsigned int> [(struct Node * *)_19]
	jmp	.L42	 ;
.L79:
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp138
	movq	24(%rax), %r9	 ; _69->_stderr,
	call	fwrite	 ;
	jmp	.L42	 ;
	.p2align 4
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp87, parent
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:120: SymbolTable* create_symbol_table(SymbolTable* parent) {
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:122:     new_scope->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_3->parent
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movq	%rax, %rbx	 ; tmp88, <retval>
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:9:     new_list->head = NULL;
	pxor	%xmm0, %xmm0	 ; tmp85
	movups	%xmm0, (%rax)	 ; tmp85, MEM <vector(2) long unsigned int> [(struct Node * *)new_list_7]
 ; D:/TC/src/helper.c:123:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	 ; new_list, new_scope_3->symbols
 ; D:/TC/src/helper.c:125: }
	leaq	-16(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L88	 ;,
	movq	%rcx, %rbp	 ; tmp93, scope
	movq	%rdx, %rdi	 ; tmp94, name
.L87:
 ; D:/TC/src/helper.c:130:         Node* current = names->head;
	movq	8(%rbp), %rax	 ; scope_16->symbols, scope_16->symbols
	movq	(%rax), %rbx	 ; names_9->head, current
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L86	 ;,
	jmp	.L85	 ;
	.p2align 4,,10
	.p2align 3
.L98:
 ; D:/TC/src/helper.c:135:             current = current->next;
	movq	(%rbx), %rbx	 ; current_17->next, current
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L85	 ;,
.L86:
 ; D:/TC/src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rsi	 ; current_17->content, <retval>
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	%rdi, %rdx	 ; name,
	movq	8(%rsi), %rcx	 ; current_name_12->name, current_name_12->name
	call	strcmp	 ;
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	 ; tmp95
	jne	.L98	 ;,
 ; D:/TC/src/helper.c:140: }
	addq	$40, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:/TC/src/helper.c:137:         scope = scope->parent;
	movq	0(%rbp), %rbp	 ; scope_16->parent, scope
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	testq	%rbp, %rbp	 ; scope
	jne	.L87	 ;,
.L88:
 ; D:/TC/src/helper.c:140: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:139:     return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:/TC/src/helper.c:140: }
	popq	%rbx	 ;
	movq	%rsi, %rax	 ; <retval>,
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L100	 ;,
	movq	%rcx, %rbp	 ; tmp92, scope
	movq	%rdx, %rdi	 ; tmp93, name
.L104:
 ; D:/TC/src/helper.c:145:         Node* current = names->head;
	movq	8(%rbp), %rax	 ; scope_22->symbols, scope_22->symbols
	movq	(%rax), %rbx	 ; names_11->head, current
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L103	 ;,
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L114:
 ; D:/TC/src/helper.c:150:             current = current->next;
	movq	(%rbx), %rbx	 ; current_23->next, current
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L101	 ;,
.L103:
 ; D:/TC/src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rsi	 ; current_23->content, <retval>
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	%rdi, %rdx	 ; name,
	movq	8(%rsi), %rcx	 ; current_name_14->name, current_name_14->name
	call	string_equal	 ;
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp94
	je	.L114	 ;,
 ; D:/TC/src/helper.c:155: }
	addq	$40, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L101:
 ; D:/TC/src/helper.c:152:         scope = scope->parent;
	movq	0(%rbp), %rbp	 ; scope_22->parent, scope
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	testq	%rbp, %rbp	 ; scope
	jne	.L104	 ;,
.L100:
 ; D:/TC/src/helper.c:155: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:154:     return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:/TC/src/helper.c:155: }
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
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp95
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp108
	je	.L116	 ;,
.L118:
 ; D:/TC/src/helper.c:157: inline bool is_builtin_type(string type) {
	movl	$1, %eax	 ;, <retval>
.L115:
 ; D:/TC/src/helper.c:159: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp109
	jne	.L118	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp99
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp110
	jne	.L118	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp101
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp111
	jne	.L118	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp103
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp112
	setne	%al	 ;, <retval>
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	jmp	.L115	 ;
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[Parser Error] at %s:%zu:%zu: %s\12\0"
	.text
	.p2align 4
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp95, message
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp97, file_name
	subq	$56, %rsp	 ;,
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp100
	movq	8(%rdx), %rsi	 ; token_8(D)->line, token_8(D)->line
	leaq	1(%rax), %rdi	 ;, _2
	addq	$1, %rsi	 ;, _4
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "[Parser Error] at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	%rsi, %r9	 ; _4,
	movq	%rbx, %r8	 ; file_name,
	leaq	.LC5(%rip), %rdx	 ;, tmp94
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rbp, 40(%rsp)	 ; message,
	movq	%rdi, 32(%rsp)	 ; _2,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:163: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC6:
	.ascii "\342\224\224\342\224\200\342\224\200 \0"
.LC7:
	.ascii "\342\224\234\342\224\200\342\224\200 \0"
.LC8:
	.ascii "\342\224\202   \0"
.LC9:
	.ascii "    \0"
	.text
	.p2align 4
	.globl	indention
	.def	indention;	.scl	2;	.type	32;	.endef
indention:
	pushq	%r14	 ;
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %eax	 ;, tmp110
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	movl	%r8d, %r14d	 ; tmp125, is_last
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp123, out
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp126, indent_has_next
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp124, indent
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	shrq	$3, %rdx	 ;, tmp107
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%rbx	 ;
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	%esi, %ecx	 ; indent, tmp108
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	addq	%r9, %rdx	 ; indent_has_next, _15
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andl	$7, %ecx	 ;, tmp108
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	sall	%cl, %eax	 ; tmp108, tmp109
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	movzbl	(%rdx), %r8d	 ; *_15, word
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	testb	%r14b, %r14b	 ; is_last
	jne	.L123	 ;,
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orl	%eax, %r8d	 ; tmp109, tmp111
	movb	%r8b, (%rdx)	 ; tmp111, *_15
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	jbe	.L135	 ;,
.L124:
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebx	 ;, i
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC9(%rip), %r13	 ;, tmp121
	leaq	.LC8(%rip), %r12	 ;, tmp122
	.p2align 4,,10
	.p2align 3
.L128:
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%rbx, %rax	 ; i, tmp114
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	%rbp, %r9	 ; out,
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	shrq	$3, %rax	 ;, tmp114
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	(%rdi,%rax), %edx	 ; *_30, *_30
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%ebx, %eax	 ; i, tmp116
	andl	$7, %eax	 ;, tmp116
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	btl	%eax, %edx	 ; tmp116, *_30
	jnc	.L130	 ;,
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r12, %rcx	 ; tmp122,
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	 ;, i
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	call	fwrite	 ;
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; i, indent
	jne	.L128	 ;,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r14b, %r14b	 ; is_last
	je	.L125	 ;,
	.p2align 4,,10
	.p2align 3
.L129:
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC6(%rip), %rdx	 ;, iftmp.11_3
.L133:
 ; D:/TC/src/helper.c:180: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rbp, %rcx	 ; out,
 ; D:/TC/src/helper.c:180: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; tmp121,
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	 ;, i
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	call	fwrite	 ;
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; i, indent
	jne	.L128	 ;,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r14b, %r14b	 ; is_last
	jne	.L129	 ;,
.L125:
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	leaq	.LC7(%rip), %rdx	 ;, iftmp.11_3
	jmp	.L133	 ;
	.p2align 4,,10
	.p2align 3
.L123:
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%eax	 ; tmp112
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andl	%r8d, %eax	 ; word, tmp113
	movb	%al, (%rdx)	 ; tmp113, *_15
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	ja	.L124	 ;,
 ; D:/TC/src/helper.c:178:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	jne	.L129	 ;,
.L122:
 ; D:/TC/src/helper.c:180: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L135:
 ; D:/TC/src/helper.c:178:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	je	.L122	 ;,
	jmp	.L125	 ;
	.p2align 4
	.globl	indention_tac
	.def	indention_tac;	.scl	2;	.type	32;	.endef
indention_tac:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	movq	%rdx, %rsi	 ; tmp87, tmp87
 ; D:/TC/src/helper.c:182: void indention_tac(FILE* out, size_t indent) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	salq	$2, %rsi	 ;, tmp87
	je	.L136	 ;,
	movq	%rcx, %rdi	 ; tmp86, out
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	xorl	%ebx, %ebx	 ; i
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:/TC/src/helper.c:184:         putc(' ', out);
	movq	%rdi, %rdx	 ; out,
	movl	$32, %ecx	 ;,
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	addq	$1, %rbx	 ;, i
 ; D:/TC/src/helper.c:184:         putc(' ', out);
	call	putc	 ;
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rsi, %rbx	 ; _11, i
	jne	.L138	 ;,
.L136:
 ; D:/TC/src/helper.c:185: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp86, file
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:187: Parser* create_parser(File* file) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:189:     new_parser->in_function = false;
	xorl	%edx, %edx	 ;
	movw	%dx, 8(%rax)	 ;, MEM <vector(2) char> [(char *)new_parser_3 + 8B]
 ; D:/TC/src/helper.c:191:     new_parser->in_loop = false;
	movb	$0, 11(%rax)	 ;, new_parser_3->in_loop
 ; D:/TC/src/helper.c:192:     new_parser->source_file = file;
	movq	%rbx, (%rax)	 ; file, new_parser_3->source_file
 ; D:/TC/src/helper.c:194: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
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
	.p2align 4
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	movq	%r8, %r13	 ; tmp155, scope
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp153, import_name
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/helper.c:200:     if (source == NULL) {
	testq	%rdx, %rdx	 ; source
	je	.L172	 ;,
	movq	%r9, %rcx	 ; tmp156, source_file
	movq	%rdx, %rbx	 ; tmp154, source
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	get_file_dir	 ;
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rcx	 ; source,
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rdx	 ; tmp160, _3
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	absolute_path	 ;
	movq	%rax, %r12	 ; tmp161, filename
.L148:
 ; D:/TC/src/helper.c:207:     openfile = fopen(filename, "r");
	leaq	.LC13(%rip), %rdx	 ;, tmp130
	movq	%r12, %rcx	 ; filename,
	call	fopen	 ;
	movq	%rax, %rbx	 ; tmp162, openfile
 ; D:/TC/src/helper.c:208:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	je	.L173	 ;,
 ; D:/TC/src/helper.c:212:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:212:     fprintf(stderr, "Info: Starting parsing lib file for import: %s\n", filename);
	movq	%r12, %r8	 ; filename,
	leaq	.LC15(%rip), %rdx	 ;, tmp134
	movq	24(%rax), %rcx	 ;, _6->_stderr
	call	fprintf	 ;
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	40(%rsp), %rdx	 ;, tmp135
	movq	%rbx, %rcx	 ; openfile,
 ; D:/TC/src/helper.c:213:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	call	read_source	 ;
 ; D:/TC/src/helper.c:215:     fclose(openfile);
	movq	%rbx, %rcx	 ; openfile,
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	movq	%rax, %rsi	 ; tmp165, source_code
 ; D:/TC/src/helper.c:215:     fclose(openfile);
	call	fclose	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%r12, %rcx	 ; filename,
	call	create_file	 ;
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %r14	 ; tmp166, _8
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	40(%rsp), %rdx	 ; length,
	movq	%r12, %r8	 ; filename,
	movq	%rsi, %rcx	 ; source_code,
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movq	%rax, %rbx	 ; tmp167, new_parser
 ; D:/TC/src/helper.c:189:     new_parser->in_function = false;
	xorl	%eax, %eax	 ;
	movw	%ax, 8(%rbx)	 ;, MEM <vector(2) char> [(char *)new_parser_52 + 8B]
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp137
 ; D:/TC/src/helper.c:192:     new_parser->source_file = file;
	movq	%r14, (%rbx)	 ; _8, new_parser_52->source_file
 ; D:/TC/src/helper.c:191:     new_parser->in_loop = false;
	movb	$0, 11(%rbx)	 ;, new_parser_52->in_loop
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	(%rax), %r14	 ; builtin_scope, builtin_scope.13_9
	call	create_lexer	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %r8	 ; new_parser,
	movq	%r14, %rdx	 ; builtin_scope.13_9,
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rcx	 ; tmp168, _11
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length, filename), builtin_scope, create_parser(create_file(filename)));
	call	parse_code	 ;
	movq	%rax, %rbx	 ; tmp169, code
 ; D:/TC/src/helper.c:217:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:217:     fprintf(stderr, "Info: Finished parsing lib file for import: %s\n", filename);
	movq	%r12, %r8	 ; filename,
	leaq	.LC16(%rip), %rdx	 ;, tmp140
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	call	fprintf	 ;
 ; D:/TC/src/helper.c:218:     if (code == NULL) {
	testq	%rbx, %rbx	 ; code
	je	.L174	 ;,
 ; D:/TC/src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%rbx), %r14	 ; code_49->global_scope, scope
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	testq	%r14, %r14	 ; scope
	je	.L153	 ;,
.L157:
 ; D:/TC/src/helper.c:130:         Node* current = names->head;
	movq	8(%r14), %rax	 ; scope_25->symbols, scope_25->symbols
	movq	(%rax), %rbx	 ; names_69->head, current
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L156	 ;,
	jmp	.L154	 ;
	.p2align 4,,10
	.p2align 3
.L175:
 ; D:/TC/src/helper.c:135:             current = current->next;
	movq	(%rbx), %rbx	 ; current_78->next, current
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L154	 ;,
.L156:
 ; D:/TC/src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rbx), %rsi	 ; current_78->content, <retval>
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	%rdi, %rdx	 ; import_name,
	movq	8(%rsi), %rcx	 ; current_name_72->name, current_name_72->name
	call	strcmp	 ;
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	 ; tmp172
	jne	.L175	 ;,
 ; D:/TC/src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	8(%r13), %rbx	 ; scope_56(D)->symbols, _17
 ; D:/TC/src/helper.c:22:     if (list == NULL) {
	testq	%rbx, %rbx	 ; _17
	je	.L176	 ;,
 ; D:/TC/src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, _17->head
 ; D:/TC/src/helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	 ;, new_node_79->next
 ; D:/TC/src/helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; <retval>, new_node_79->content
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	je	.L177	 ;,
 ; D:/TC/src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; _17->tail, _17->tail
	movq	%rax, (%rdx)	 ; new_node, _81->next
 ; D:/TC/src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, _17->tail
.L146:
 ; D:/TC/src/helper.c:228: }
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
.L154:
 ; D:/TC/src/helper.c:137:         scope = scope->parent;
	movq	(%r14), %r14	 ; scope_25->parent, scope
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	testq	%r14, %r14	 ; scope
	jne	.L157	 ;,
.L153:
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	%r12, %r9	 ; filename,
	movq	%rdi, %r8	 ; import_name,
 ; D:/TC/src/helper.c:210:         return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	24(%rax), %rcx	 ; _18->_stderr, _18->_stderr
	leaq	.LC18(%rip), %rdx	 ;, tmp151
	call	fprintf	 ;
	jmp	.L146	 ;
	.p2align 4,,10
	.p2align 3
.L172:
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	strlen	 ;
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	.LC10(%rip), %rcx	 ;, tmp127
	leaq	4(%rax), %rdx	 ;, tmp126
	call	create_string_not_check	 ;
 ; D:/TC/src/helper.c:203:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC11(%rip), %rdx	 ;, tmp128
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	%rax, %rbx	 ; tmp158, temp_import_name
 ; D:/TC/src/helper.c:203:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	%rax, %rcx	 ; temp_import_name,
	call	sprintf	 ;
 ; D:/TC/src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC12(%rip), %rdx	 ;, tmp129
	movq	%rbx, %rcx	 ; temp_import_name,
	call	absolute_path	 ;
	movq	%rax, %r12	 ; tmp159, filename
	jmp	.L148	 ;
.L176:
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp147
	movq	24(%rax), %r9	 ; _82->_stderr,
	call	fwrite	 ;
	jmp	.L146	 ;
	.p2align 4,,10
	.p2align 3
.L177:
 ; D:/TC/src/helper.c:28:         list->head = new_node;
	movq	%rax, %xmm0	 ; new_node, tmp148
	punpcklqdq	%xmm0, %xmm0	 ; tmp148
	movups	%xmm0, (%rbx)	 ; tmp148, MEM <vector(2) long unsigned int> [(struct Node * *)_17]
	jmp	.L146	 ;
.L173:
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%r12, %r8	 ; filename,
	leaq	.LC14(%rip), %rdx	 ;, tmp132
 ; D:/TC/src/helper.c:210:         return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ;, _4->_stderr
	call	fprintf	 ;
	jmp	.L146	 ;
.L174:
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%r12, %r8	 ; filename,
	leaq	.LC17(%rip), %rdx	 ;, tmp142
 ; D:/TC/src/helper.c:210:         return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ; _14->_stderr, _14->_stderr
	call	fprintf	 ;
	jmp	.L146	 ;
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.p2align 4
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp101, method_name
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp100, class_name
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	strlen	 ;
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rdi, %rcx	 ; method_name,
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	 ; tmp102, tmp90
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	strlen	 ;
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	leaq	.LC10(%rip), %rcx	 ;, tmp97
	leaq	2(%rbx,%rax), %rdx	 ;, tmp96
	call	create_string	 ;
 ; D:/TC/src/helper.c:232:     sprintf(name, "%s.%s", class_name, method_name);
	movq	%rdi, %r9	 ; method_name,
	movq	%rsi, %r8	 ; class_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp98
	movq	%rax, %rcx	 ; <retval>,
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; D:/TC/src/helper.c:232:     sprintf(name, "%s.%s", class_name, method_name);
	call	sprintf	 ;
 ; D:/TC/src/helper.c:234: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp159, str
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp160
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp161
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp162
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp163
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp163
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp164
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp164
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp165
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp165
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp166
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp166
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp167
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp167
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp168
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp168
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp169
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp169
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp170
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp170
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp171
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp171
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp172
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp172
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp173
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp173
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp174
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp174
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp175
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp175
	jne	.L180	 ;,
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp153
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; tmp176
	jne	.L198	 ;,
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp154
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; tmp177
	jne	.L199	 ;,
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp155
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
.L180:
 ; D:/TC/src/helper.c:258: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L198:
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
	jmp	.L180	 ;
.L199:
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
	jmp	.L180	 ;
	.p2align 4
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
 ; D:/TC/src/helper.c:260: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L202	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	CSWTCH.56(%rip), %rax	 ;, tmp84
	movl	(%rax,%rcx,4), %eax	 ; CSWTCH.56[op_2(D)], <retval>
.L202:
 ; D:/TC/src/helper.c:290: }
	ret	
	.section	.text.unlikely,"x"
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
 ; D:/TC/src/helper.c:293:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L227	 ;,
	leaq	.L208(%rip), %rdx	 ;, tmp85
	movl	%ecx, %ecx	 ; op, op
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L208:
	.long	.L226-.L208
	.long	.L225-.L208
	.long	.L224-.L208
	.long	.L223-.L208
	.long	.L222-.L208
	.long	.L221-.L208
	.long	.L220-.L208
	.long	.L219-.L208
	.long	.L218-.L208
	.long	.L217-.L208
	.long	.L216-.L208
	.long	.L215-.L208
	.long	.L214-.L208
	.long	.L213-.L208
	.long	.L212-.L208
	.long	.L211-.L208
	.long	.L210-.L208
	.long	.L209-.L208
	.long	.L207-.L208
	.text
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:/TC/src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L210:
 ; D:/TC/src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L211:
 ; D:/TC/src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:/TC/src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L213:
 ; D:/TC/src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L214:
 ; D:/TC/src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; OR_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L215:
 ; D:/TC/src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; AND_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:/TC/src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; GE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L217:
 ; D:/TC/src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; LE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L218:
 ; D:/TC/src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; GT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L219:
 ; D:/TC/src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; LT_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:/TC/src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; NE_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L221:
 ; D:/TC/src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; EQ_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L222:
 ; D:/TC/src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; MOD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L223:
 ; D:/TC/src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; DIV_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L224:
 ; D:/TC/src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; MUL_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L225:
 ; D:/TC/src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; SUB_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L226:
 ; D:/TC/src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; ADD_SYMBOL, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L207:
 ; D:/TC/src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, <retval>
	ret	
	.section	.text.unlikely,"x"
	.def	operator_to_string.cold;	.scl	3;	.type	32;	.endef
operator_to_string.cold:
.L227:
 ; D:/TC/src/helper.c:293:     switch (op) {
	xorl	%eax, %eax	 ; <retval>
	ret	
	.text
	.section	.text.unlikely,"x"
.LCOLDE20:
	.text
.LHOTE20:
	.section .rdata,"dr"
	.align 32
CSWTCH.56:
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
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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
