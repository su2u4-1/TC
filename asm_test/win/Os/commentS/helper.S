	.file	"helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:10:     new_list->tail = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, new_list_3->head
	movq	%rdx, 8(%rax)	 ;, new_list_3->tail
 ; D:/TC/src/helper.c:12: }
	addq	$40, %rsp	 ;,
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:22:     if (list == NULL) {
	testq	%rcx, %rcx	 ; list
	jne	.L4	 ;,
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	leaq	.LC0(%rip), %rcx	 ;, tmp90
	movq	24(%rax), %rdx	 ; _14->_stderr, _14->_stderr
 ; D:/TC/src/helper.c:34: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	jmp	fputs	 ;
.L4:
	movq	%rcx, %rbx	 ; tmp92, list
 ; D:/TC/src/helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp93, item
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:16:     new_node->next = NULL;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, list_3(D)->head
 ; D:/TC/src/helper.c:16:     new_node->next = NULL;
	movq	%rdx, (%rax)	 ;, new_node_16->next
 ; D:/TC/src/helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_16->content
 ; D:/TC/src/helper.c:27:     if (list->head == NULL) {
	jne	.L5	 ;,
 ; D:/TC/src/helper.c:28:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_3(D)->head
	jmp	.L8	 ;
.L5:
 ; D:/TC/src/helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_3(D)->tail, list_3(D)->tail
	movq	%rax, (%rdx)	 ; new_node, _2->next
.L8:
 ; D:/TC/src/helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_3(D)->tail
 ; D:/TC/src/helper.c:34: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp88, original
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:37:     if (original == NULL)
	testq	%rcx, %rcx	 ; original
	je	.L11	 ;,
 ; D:/TC/src/helper.c:39:     list() new_list = create_list();
	call	create_list	 ;
 ; D:/TC/src/helper.c:40:     new_list->head = original->head;
	movq	(%rbx), %rdx	 ; original_5(D)->head, _1
 ; D:/TC/src/helper.c:40:     new_list->head = original->head;
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; D:/TC/src/helper.c:41:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	 ; original_5(D)->tail, _2
 ; D:/TC/src/helper.c:42:     return new_list;
	movq	%rax, %rbx	 ; new_list, original
 ; D:/TC/src/helper.c:41:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
.L11:
 ; D:/TC/src/helper.c:43: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; original,
	popq	%rbx	 ;
	ret	
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
 ; D:/TC/src/helper.c:47:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L16	 ;,
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_6(D)->head, <retval>
 ; D:/TC/src/helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L16	 ;,
 ; D:/TC/src/helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; D:/TC/src/helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_6(D)->head
 ; D:/TC/src/helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	 ; _2
	jne	.L18	 ;,
 ; D:/TC/src/helper.c:51:         list->tail = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rcx)	 ;, list_6(D)->tail
.L18:
 ; D:/TC/src/helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
.L16:
 ; D:/TC/src/helper.c:53: }
	ret	
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
 ; D:/TC/src/helper.c:57:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L23	 ;,
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_8(D)->head, <retval>
 ; D:/TC/src/helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L23	 ;,
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	movq	8(%rcx), %r8	 ; list_8(D)->tail, _3
 ; D:/TC/src/helper.c:58:     if (list->head == list->tail) {
	cmpq	%r8, %rax	 ; _3, <retval>
	jne	.L25	 ;,
 ; D:/TC/src/helper.c:61:         list->tail = NULL;
	xorl	%r9d, %r9d	 ;
 ; D:/TC/src/helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
 ; D:/TC/src/helper.c:61:         list->tail = NULL;
	movq	%r9, (%rcx)	 ;, list_8(D)->head
	movq	%r9, 8(%rcx)	 ;, list_8(D)->tail
 ; D:/TC/src/helper.c:62:         return content;
	ret	
.L25:
	movq	%rax, %rdx	 ; <retval>, current
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	 ; current_5->next, <retval>
 ; D:/TC/src/helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %r8	 ; <retval>, _3
	jne	.L25	 ;,
 ; D:/TC/src/helper.c:68:     current->next = NULL;
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	 ; _3->content, <retval>
 ; D:/TC/src/helper.c:68:     current->next = NULL;
	movq	%r8, (%rdx)	 ;, current_2->next
 ; D:/TC/src/helper.c:69:     list->tail = current;
	movq	%rdx, 8(%rcx)	 ; current, list_8(D)->tail
.L23:
 ; D:/TC/src/helper.c:71: }
	ret	
	.globl	list_is_empty
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
list_is_empty:
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	movl	$1, %eax	 ;, iftmp.0_3
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	testq	%rcx, %rcx	 ; list
	je	.L33	 ;,
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	cmpq	$0, (%rcx)	 ;, list_4(D)->head
	je	.L33	 ;,
 ; D:/TC/src/helper.c:74:     return list == NULL || list->head == NULL || list->tail == NULL;
	xorl	%eax, %eax	 ; iftmp.0_3
	cmpq	$0, 8(%rcx)	 ;, list_4(D)->tail
	sete	%al	 ;, iftmp.0_3
.L33:
 ; D:/TC/src/helper.c:75: }
	ret	
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, parent
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:120: SymbolTable* create_symbol_table(SymbolTable* parent) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:122:     new_scope->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; D:/TC/src/helper.c:121:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:/TC/src/helper.c:123:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; D:/TC/src/helper.c:123:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, new_scope_4->symbols
 ; D:/TC/src/helper.c:125: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	search_name_use_strcmp
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
search_name_use_strcmp:
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp94, name
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp93, scope
	subq	$40, %rsp	 ;,
.L39:
 ; D:/TC/src/helper.c:128:     while (scope != NULL) {
	testq	%rbx, %rbx	 ; scope
	je	.L48	 ;,
 ; D:/TC/src/helper.c:130:         Node* current = names->head;
	movq	8(%rbx), %rax	 ; scope_3->symbols, scope_3->symbols
	movq	(%rax), %rsi	 ; names_9->head, current
.L40:
 ; D:/TC/src/helper.c:131:         while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	je	.L49	 ;,
 ; D:/TC/src/helper.c:132:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rsi), %rdi	 ; current_4->content, <retval>
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	movq	%rbp, %rdx	 ; name,
	movq	8(%rdi), %rcx	 ; current_name_12->name, current_name_12->name
	call	strcmp	 ;
 ; D:/TC/src/helper.c:133:             if (strcmp(current_name->name, name) == 0)
	testl	%eax, %eax	 ; tmp95
	je	.L38	 ;,
 ; D:/TC/src/helper.c:135:             current = current->next;
	movq	(%rsi), %rsi	 ; current_4->next, current
	jmp	.L40	 ;
.L49:
 ; D:/TC/src/helper.c:137:         scope = scope->parent;
	movq	(%rbx), %rbx	 ; scope_3->parent, scope
	jmp	.L39	 ;
.L48:
 ; D:/TC/src/helper.c:139:     return NULL;
	xorl	%edi, %edi	 ; <retval>
.L38:
 ; D:/TC/src/helper.c:140: }
	addq	$40, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp93, name
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp92, scope
	subq	$40, %rsp	 ;,
.L51:
 ; D:/TC/src/helper.c:143:     while (scope != NULL) {
	testq	%rbx, %rbx	 ; scope
	je	.L57	 ;,
 ; D:/TC/src/helper.c:145:         Node* current = names->head;
	movq	8(%rbx), %rax	 ; scope_3->symbols, scope_3->symbols
	movq	(%rax), %rsi	 ; names_11->head, current
.L52:
 ; D:/TC/src/helper.c:146:         while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	je	.L58	 ;,
 ; D:/TC/src/helper.c:147:             Symbol* current_name = (Symbol*)current->content;
	movq	8(%rsi), %rdi	 ; current_4->content, <retval>
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	movq	%rbp, %rdx	 ; name,
	movq	8(%rdi), %rcx	 ; current_name_14->name, current_name_14->name
	call	string_equal	 ;
 ; D:/TC/src/helper.c:148:             if (string_equal(current_name->name, name))
	testb	%al, %al	 ; tmp94
	jne	.L50	 ;,
 ; D:/TC/src/helper.c:150:             current = current->next;
	movq	(%rsi), %rsi	 ; current_4->next, current
	jmp	.L52	 ;
.L58:
 ; D:/TC/src/helper.c:152:         scope = scope->parent;
	movq	(%rbx), %rbx	 ; scope_3->parent, scope
	jmp	.L51	 ;
.L57:
 ; D:/TC/src/helper.c:154:     return NULL;
	xorl	%edi, %edi	 ; <retval>
.L50:
 ; D:/TC/src/helper.c:155: }
	addq	$40, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "Warning: Creating symbol with unknown SymbolType: %u\12\0"
.LC2:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\12\0"
.LC3:
	.ascii "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\12\0"
.LC4:
	.ascii "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r14	 ;
	pushq	%r13	 ;
	movq	%r8, %r13	 ; tmp129, type
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp127, name
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp130, ast_node
	pushq	%rsi	 ;
	movl	%edx, %esi	 ; tmp128, kind
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:/TC/src/helper.c:81:     switch (kind) {
	cmpl	$2, %edx	 ;, kind
	je	.L79	 ;,
	ja	.L61	 ;,
	testl	%edx, %edx	 ; kind
	jne	.L79	 ;,
 ; D:/TC/src/helper.c:82:         case SYMBOL_CLASS: scope = ((Class*)ast_node)->class_scope->parent; break;
	movq	16(%r9), %rax	 ; MEM[(struct Class *)ast_node_26(D)].class_scope, MEM[(struct Class *)ast_node_26(D)].class_scope
	jmp	.L83	 ;
.L61:
 ; D:/TC/src/helper.c:81:     switch (kind) {
	leal	-3(%rdx), %eax	 ;, tmp110
	movq	%r9, %rbp	 ; ast_node, scope
	cmpl	$3, %eax	 ;, tmp110
	jbe	.L65	 ;,
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC1(%rip), %rdx	 ;, tmp115
 ; D:/TC/src/helper.c:80:     SymbolTable* scope = NULL;
	xorl	%ebp, %ebp	 ; scope
 ; D:/TC/src/helper.c:90:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType: %u\n", kind);
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	call	fprintf	 ;
 ; D:/TC/src/helper.c:91:             break;
	jmp	.L65	 ;
.L79:
 ; D:/TC/src/helper.c:83:         case SYMBOL_FUNCTION: scope = ((Function*)ast_node)->function_scope->parent; break;
	movq	32(%rdi), %rax	 ;, MEM[(struct Function *)ast_node_26(D)].function_scope
.L83:
	movq	(%rax), %rbp	 ;* MEM[(struct Function *)ast_node_26(D)].function_scope, scope
.L65:
 ; D:/TC/src/helper.c:93:     Symbol* result = search_name(scope, name);
	movq	%r12, %rdx	 ; name,
	movq	%rbp, %rcx	 ; scope,
	call	search_name	 ;
 ; D:/TC/src/helper.c:94:     if (result != NULL)
	testq	%rax, %rax	 ; result
	je	.L66	 ;,
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	32(%rax), %r9d	 ; result_35->kind, _9
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rbx	 ; id_counter, tmp138
	movq	16(%rax), %r14	 ; result_35->id, _8
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	%r9d, 60(%rsp)	 ; _9, %sfp
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	incq	%rbx	 ; _7
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:95:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %u, id: %zu %zu\n", name, result->kind, result->id, id_counter + 1);
	movl	60(%rsp), %r9d	 ; %sfp, _9
	movq	%r12, %r8	 ; name,
	leaq	.LC2(%rip), %rdx	 ;, tmp118
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	movq	%rbx, 40(%rsp)	 ; _7,
	movq	%r14, 32(%rsp)	 ; _8,
	call	fprintf	 ;
.L66:
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:97:     new_name->name = name;
	movq	%r12, 8(%rax)	 ; name, new_name_39->name
 ; D:/TC/src/helper.c:96:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %rbx	 ; tmp134, <retval>
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp139
 ; D:/TC/src/helper.c:99:     new_name->kind = kind;
	movl	%esi, 32(%rbx)	 ; kind, new_name_39->kind
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	incq	%rax	 ; _13
 ; D:/TC/src/helper.c:100:     new_name->type = type;
	movq	%r13, (%rbx)	 ; type, new_name_39->type
 ; D:/TC/src/helper.c:98:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _13, id_counter
	movq	%rax, 16(%rbx)	 ; _13, new_name_39->id
 ; D:/TC/src/helper.c:101:     switch (kind) {
	cmpl	$2, %esi	 ;, kind
	je	.L81	 ;,
	jbe	.L81	 ;,
	leal	-3(%rsi), %eax	 ;, tmp120
	cmpl	$3, %eax	 ;, tmp120
	ja	.L84	 ;,
.L81:
 ; D:/TC/src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	movq	%rdi, 24(%rbx)	 ; ast_node,
 ; D:/TC/src/helper.c:108:         case SYMBOL_TYPE: new_name->ast_node.scope = (SymbolTable*)ast_node; break;
	jmp	.L73	 ;
.L84:
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:110:             fprintf(stderr, "Warning: Creating symbol with unknown SymbolType for ast_node assignment: %u\n", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC3(%rip), %rdx	 ;, tmp122
	movq	24(%rax), %rcx	 ; _14->_stderr, _14->_stderr
	call	fprintf	 ;
.L73:
 ; D:/TC/src/helper.c:113:     if (scope == NULL)
	testq	%rbp, %rbp	 ; scope
	jne	.L74	 ;,
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movq	16(%rbx), %rdi	 ; new_name_39->id, _16
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:114:         fprintf(stderr, "Warning: Creating symbol '%s' with NULL scope, kind: %u, id: %zu\n", name, kind, new_name->id);
	movl	%esi, %r9d	 ; kind,
	movq	%r12, %r8	 ; name,
	leaq	.LC4(%rip), %rdx	 ;, tmp124
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
	movq	%rdi, 32(%rsp)	 ; _16,
	call	fprintf	 ;
	jmp	.L59	 ;
.L74:
 ; D:/TC/src/helper.c:116:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%rbp), %rcx	 ; scope_20->symbols, scope_20->symbols
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
.L59:
 ; D:/TC/src/helper.c:118: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp104, type
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp96
	movq	(%rax), %rdx	 ; INT_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp105
	je	.L86	 ;,
.L88:
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.4_11
	jmp	.L87	 ;
.L86:
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp106
	jne	.L88	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp98
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; STRING_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp107
	jne	.L88	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp99
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; BOOL_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp108
	jne	.L88	 ;,
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp100
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; VOID_KEYWORD,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:158:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp109
	setne	%al	 ;, iftmp.4_11
	movzbl	%al, %eax	 ; iftmp.4_11, iftmp.4_11
.L87:
 ; D:/TC/src/helper.c:159: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
.LC5:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp95, message
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	8(%rdx), %r9	 ; token_8(D)->line, token_8(D)->line
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp100
 ; D:/TC/src/helper.c:161: inline void parser_error(const string message, Token* token, string file_name) {
	movq	%r8, 112(%rsp)	 ; file_name, file_name
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	incq	%r9	 ; _4
	leaq	1(%rax), %rbx	 ;, _2
	movq	%r9, 56(%rsp)	 ; _4, %sfp
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:162:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	56(%rsp), %r9	 ; %sfp, _4
	movq	112(%rsp), %r8	 ; file_name, file_name
	leaq	.LC5(%rip), %rdx	 ;, tmp94
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rsi, 40(%rsp)	 ; message,
	movq	%rbx, 32(%rsp)	 ; _2,
	call	fprintf	 ;
 ; D:/TC/src/helper.c:163: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
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
	pushq	%r14	 ;
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	$1, %eax	 ;, tmp110
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r9, %r12	 ; tmp138, indent_has_next
	pushq	%rbp	 ;
	movl	%r8d, %ebp	 ; tmp137, is_last
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	movq	%rdx, %r8	 ; indent, tmp107
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%rdi	 ;
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	shrq	$3, %r8	 ;, tmp107
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	movq	%rcx, %rdi	 ; tmp135, out
	pushq	%rsi	 ;
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	addq	%r9, %r8	 ; indent_has_next, _20
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp136, indent
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movl	%ebx, %ecx	 ; indent, tmp108
	andl	$7, %ecx	 ;, tmp108
 ; D:/TC/src/helper.c:174: void indention(FILE* out, size_t indent, bool is_last, char indent_has_next[32]) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	sall	%cl, %eax	 ; tmp108, tmp109
 ; D:/TC/src/helper.c:166:     char word = bool_list[index / 8];
	movb	(%r8), %dl	 ; *_20, word
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	testb	%bpl, %bpl	 ; is_last
	jne	.L93	 ;,
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	orl	%eax, %edx	 ; tmp109, iftmp.12_33
	jmp	.L94	 ;
.L93:
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	notl	%eax	 ; tmp111
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	andl	%eax, %edx	 ; tmp111, iftmp.12_33
.L94:
 ; D:/TC/src/helper.c:167:     bool_list[index / 8] = (char)(value ? (word | (1 << (index % 8))) : (word & ~(1 << (index % 8))));
	movb	%dl, (%r8)	 ; iftmp.12_33, *_20
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %esi	 ;, i
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	leaq	.LC7(%rip), %r13	 ;, tmp133
	leaq	.LC6(%rip), %r14	 ;, tmp134
.L95:
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; indent, i
	jnb	.L103	 ;,
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%rsi, %rax	 ; i, tmp112
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%esi, %ecx	 ; i, tmp114
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	%r14, %rdx	 ; tmp134, iftmp.10_5
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	shrq	$3, %rax	 ;, tmp112
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	andl	$7, %ecx	 ;, tmp114
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	(%r12,%rax), %eax	 ; *_35, *_35
 ; D:/TC/src/helper.c:171:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	sarl	%cl, %eax	 ; tmp114, tmp115
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	movq	%rdi, %rcx	 ; out,
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	 ;, tmp115
	cmove	%r13, %rdx	 ; tmp133,, iftmp.10_5
 ; D:/TC/src/helper.c:176:     for (size_t i = 1; i < indent; ++i)
	incq	%rsi	 ; i
 ; D:/TC/src/helper.c:177:         fprintf(out, get_bool_list(indent_has_next, i) ? "│   " : "    ");
	call	fprintf	 ;
	jmp	.L95	 ;
.L103:
 ; D:/TC/src/helper.c:178:     if (indent > 0)
	testq	%rbx, %rbx	 ; indent
	je	.L92	 ;,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%bpl, %bpl	 ; is_last
	leaq	.LC9(%rip), %rdx	 ;, tmp129
	leaq	.LC8(%rip), %rax	 ;, tmp130
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rdi, %rcx	 ; out,
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	cmovne	%rax, %rdx	 ; tmp129,, tmp130, iftmp.11_6
 ; D:/TC/src/helper.c:180: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:/TC/src/helper.c:179:         fprintf(out, is_last ? "└── " : "├── ");
	jmp	fprintf	 ;
.L92:
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
	.globl	indention_tac
	.def	indention_tac;	.scl	2;	.type	32;	.endef
indention_tac:
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp86, out
	pushq	%rsi	 ;
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	xorl	%esi, %esi	 ; i
 ; D:/TC/src/helper.c:182: void indention_tac(FILE* out, size_t indent) {
	pushq	%rbx	 ;
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	leaq	0(,%rdx,4), %rbx	 ;, _1
 ; D:/TC/src/helper.c:182: void indention_tac(FILE* out, size_t indent) {
	subq	$32, %rsp	 ;,
.L105:
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	cmpq	%rbx, %rsi	 ; _1, i
	jnb	.L108	 ;,
 ; D:/TC/src/helper.c:184:         putc(' ', out);
	movq	%rdi, %rdx	 ; out,
	movl	$32, %ecx	 ;,
 ; D:/TC/src/helper.c:183:     for (size_t i = 0; i < indent * 4; ++i)
	incq	%rsi	 ; i
 ; D:/TC/src/helper.c:184:         putc(' ', out);
	call	putc	 ;
	jmp	.L105	 ;
.L108:
 ; D:/TC/src/helper.c:185: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp85, file
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/helper.c:187: Parser* create_parser(File* file) {
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:188:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	alloc_memory	 ;
 ; D:/TC/src/helper.c:189:     new_parser->in_function = false;
	movw	$0, 8(%rax)	 ;, MEM <unsigned short> [(char *)new_parser_3 + 8B]
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
.LC14:
	.ascii "Error opening library file for import: %s\12\0"
.LC15:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC16:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC17:
	.ascii "Error parsing library file for import: %s\12\0"
.LC18:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp132, scope
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp130, import_name
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:/TC/src/helper.c:200:     if (source == NULL) {
	testq	%rdx, %rdx	 ; source
	jne	.L112	 ;,
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	strlen	 ;
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	.LC10(%rip), %rcx	 ;, tmp112
	leaq	4(%rax), %rdx	 ;, tmp111
	call	create_string_not_check	 ;
 ; D:/TC/src/helper.c:203:         sprintf(temp_import_name, "%s.tc", import_name);
	leaq	.LC11(%rip), %rdx	 ;, tmp113
	movq	%rdi, %r8	 ; import_name,
	movq	%rax, %rcx	 ; temp_import_name,
 ; D:/TC/src/helper.c:202:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	%rax, %rbx	 ; tmp135, temp_import_name
 ; D:/TC/src/helper.c:203:         sprintf(temp_import_name, "%s.tc", import_name);
	call	sprintf	 ;
 ; D:/TC/src/helper.c:204:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC12(%rip), %rdx	 ;, tmp114
	jmp	.L120	 ;
.L112:
	movq	%r9, %rcx	 ; tmp133, source_file
	movq	%rdx, %rbx	 ; tmp131, source
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	call	get_file_dir	 ;
	movq	%rax, %rdx	 ; tmp137, _3
.L120:
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rcx	 ; source,
	call	absolute_path	 ;
 ; D:/TC/src/helper.c:207:     openfile = fopen(filename, "r");
	leaq	.LC13(%rip), %rdx	 ;, tmp115
	movq	%rax, %rcx	 ; filename,
 ; D:/TC/src/helper.c:206:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rbx	 ; tmp138, filename
 ; D:/TC/src/helper.c:207:     openfile = fopen(filename, "r");
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp139, openfile
 ; D:/TC/src/helper.c:208:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	jne	.L114	 ;,
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:209:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; filename,
	leaq	.LC14(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	jmp	.L121	 ;
.L114:
 ; D:/TC/src/helper.c:212:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; filename,
	leaq	.LC15(%rip), %rcx	 ;, tmp118
	call	printf	 ;
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	leaq	56(%rsp), %rdx	 ;, tmp119
 ; D:/TC/src/helper.c:213:     size_t length = 0;
	xorl	%eax, %eax	 ;
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	movq	%rsi, %rcx	 ; openfile,
 ; D:/TC/src/helper.c:213:     size_t length = 0;
	movq	%rax, 56(%rsp)	 ;, length
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	call	read_source	 ;
 ; D:/TC/src/helper.c:215:     fclose(openfile);
	movq	%rsi, %rcx	 ; openfile,
 ; D:/TC/src/helper.c:214:     string source_code = read_source(openfile, &length);
	movq	%rax, %r12	 ; tmp141, source_code
 ; D:/TC/src/helper.c:215:     fclose(openfile);
	call	fclose	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %rcx	 ; filename,
	call	create_file	 ;
	movq	%rax, %rcx	 ; tmp142, _6
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	create_parser	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	56(%rsp), %rdx	 ; length,
	movq	%r12, %rcx	 ; source_code,
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, 40(%rsp)	 ; _7, %sfp
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp120
	movq	(%rax), %rsi	 ; builtin_scope, builtin_scope.13_8
	call	create_lexer	 ;
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	40(%rsp), %r8	 ; %sfp, _7
	movq	%rsi, %rdx	 ; builtin_scope.13_8,
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rcx	 ; tmp144, _10
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	parse_code	 ;
 ; D:/TC/src/helper.c:217:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; filename,
	leaq	.LC16(%rip), %rcx	 ;, tmp122
 ; D:/TC/src/helper.c:216:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rsi	 ; tmp145, code
 ; D:/TC/src/helper.c:217:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	call	printf	 ;
 ; D:/TC/src/helper.c:218:     if (code == NULL) {
	testq	%rsi, %rsi	 ; code
	jne	.L116	 ;,
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:219:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; filename,
	leaq	.LC17(%rip), %rdx	 ;, tmp124
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
.L121:
	call	fprintf	 ;
.L115:
 ; D:/TC/src/helper.c:210:         return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L111	 ;
.L116:
 ; D:/TC/src/helper.c:222:     name = search_name_use_strcmp(code->global_scope, import_name);
	movq	8(%rsi), %rcx	 ; code_46->global_scope, code_46->global_scope
	movq	%rdi, %rdx	 ; import_name,
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/helper.c:223:     if (name != NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L118	 ;,
 ; D:/TC/src/helper.c:224:         list_append(scope->symbols, (pointer)name);
	movq	8(%rbp), %rcx	 ; scope_51(D)->symbols, scope_51(D)->symbols
	movq	%rax, %rdx	 ; <retval>,
	movq	%rax, 40(%rsp)	 ; <retval>, %sfp
	call	list_append	 ;
	movq	40(%rsp), %rax	 ; %sfp, <retval>
	jmp	.L111	 ;
.L118:
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	__getreent	 ;
 ; D:/TC/src/helper.c:226:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	%rbx, %r9	 ; filename,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC18(%rip), %rdx	 ;, tmp128
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
	call	fprintf	 ;
	jmp	.L115	 ;
.L111:
 ; D:/TC/src/helper.c:228: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC19:
	.ascii "%s.%s\0"
	.text
	.globl	make_method_name
	.def	make_method_name;	.scl	2;	.type	32;	.endef
make_method_name:
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp101, method_name
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rcx, 64(%rsp)	 ; class_name, class_name
	call	strlen	 ;
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rsi, %rcx	 ; method_name,
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	 ; tmp102, tmp90
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	call	strlen	 ;
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	leaq	.LC10(%rip), %rcx	 ;, tmp97
	leaq	2(%rbx,%rax), %rdx	 ;, tmp96
	call	create_string	 ;
 ; D:/TC/src/helper.c:232:     sprintf(name, "%s.%s", class_name, method_name);
	movq	64(%rsp), %r8	 ; class_name, class_name
	movq	%rsi, %r9	 ; method_name,
	leaq	.LC19(%rip), %rdx	 ;, tmp98
	movq	%rax, %rcx	 ; <retval>,
 ; D:/TC/src/helper.c:231:     string name = create_string("", strlen(class_name) + strlen(method_name) + 2);
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; D:/TC/src/helper.c:232:     sprintf(name, "%s.%s", class_name, method_name);
	call	sprintf	 ;
 ; D:/TC/src/helper.c:234: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp144, str
	subq	$32, %rsp	 ;,
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp145
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:238:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp145
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp123
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp146
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:239:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp146
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp147
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:240:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp147
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp125
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp148
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:241:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp148
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp149
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:242:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp149
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp127
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp150
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:243:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp150
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp128
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; AND_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp151
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:244:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp151
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp129
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; OR_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp152
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:245:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp152
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp130
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; EQ_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp153
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:246:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp153
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp131
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; NE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp154
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:247:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp154
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp132
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LT_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp155
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:248:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp155
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp133
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GT_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp156
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:249:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp156
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp134
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp157
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:250:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp157
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp135
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp158
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:251:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp158
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp136
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp159
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/helper.c:252:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp159
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp137
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:253:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp160
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp138
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:254:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%dl, %dl	 ; tmp161
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp139
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
 ; D:/TC/src/helper.c:255:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%dl, %dl	 ; tmp162
	jne	.L124	 ;,
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp140
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	call	string_equal	 ;
 ; D:/TC/src/helper.c:256:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
.L124:
 ; D:/TC/src/helper.c:258: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
 ; D:/TC/src/helper.c:260: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L146	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	CSWTCH.56(%rip), %rax	 ;, tmp85
	movsbl	(%rax,%rcx), %eax	 ; CSWTCH.56[op_2(D)], <retval>
.L146:
 ; D:/TC/src/helper.c:290: }
	ret	
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
 ; D:/TC/src/helper.c:293:     switch (op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L149	 ;,
	leaq	.L152(%rip), %rdx	 ;, tmp85
	movl	%ecx, %ecx	 ; op, op
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L152:
	.long	.L170-.L152
	.long	.L169-.L152
	.long	.L168-.L152
	.long	.L167-.L152
	.long	.L166-.L152
	.long	.L165-.L152
	.long	.L164-.L152
	.long	.L163-.L152
	.long	.L162-.L152
	.long	.L161-.L152
	.long	.L160-.L152
	.long	.L159-.L152
	.long	.L158-.L152
	.long	.L157-.L152
	.long	.L156-.L152
	.long	.L155-.L152
	.long	.L154-.L152
	.long	.L153-.L152
	.long	.L151-.L152
	.text
.L157:
 ; D:/TC/src/helper.c:294:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	jmp	.L172	 ;
.L156:
 ; D:/TC/src/helper.c:295:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	jmp	.L172	 ;
.L155:
 ; D:/TC/src/helper.c:296:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	jmp	.L172	 ;
.L154:
 ; D:/TC/src/helper.c:297:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	jmp	.L172	 ;
.L153:
 ; D:/TC/src/helper.c:298:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	jmp	.L172	 ;
.L151:
 ; D:/TC/src/helper.c:299:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	jmp	.L172	 ;
.L159:
 ; D:/TC/src/helper.c:300:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	jmp	.L172	 ;
.L158:
 ; D:/TC/src/helper.c:301:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	jmp	.L172	 ;
.L165:
 ; D:/TC/src/helper.c:302:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	jmp	.L172	 ;
.L164:
 ; D:/TC/src/helper.c:303:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	jmp	.L172	 ;
.L163:
 ; D:/TC/src/helper.c:304:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	jmp	.L172	 ;
.L162:
 ; D:/TC/src/helper.c:305:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	jmp	.L172	 ;
.L161:
 ; D:/TC/src/helper.c:306:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	jmp	.L172	 ;
.L160:
 ; D:/TC/src/helper.c:307:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	jmp	.L172	 ;
.L170:
 ; D:/TC/src/helper.c:308:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	jmp	.L172	 ;
.L169:
 ; D:/TC/src/helper.c:309:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	jmp	.L172	 ;
.L168:
 ; D:/TC/src/helper.c:310:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	jmp	.L172	 ;
.L167:
 ; D:/TC/src/helper.c:311:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	jmp	.L172	 ;
.L166:
 ; D:/TC/src/helper.c:312:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
.L172:
	movq	(%rax), %rax	 ;, <retval>
.L149:
 ; D:/TC/src/helper.c:316: }
	ret	
	.section .rdata,"dr"
	.align 16
CSWTCH.56:
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
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	putc;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
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
