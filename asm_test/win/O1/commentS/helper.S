	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:9:     new_list->head = NULL;
	movq	$0, (%rax)	 ;, new_list_3->head
 ; D:\TC\src\helper.c:10:     new_list->tail = NULL;
	movq	$0, 8(%rax)	 ;, new_list_3->tail
 ; D:\TC\src\helper.c:12: }
	addq	$40, %rsp	 ;,
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error: list_append received NULL list\12\0"
	.text
	.globl	list_append
	.def	list_append;	.scl	2;	.type	32;	.endef
list_append:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:22:     if (list == NULL) {
	testq	%rcx, %rcx	 ; list
	je	.L8	 ;,
	movq	%rcx, %rbx	 ; tmp91, list
	movq	%rdx, %rsi	 ; tmp92, item
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:16:     new_node->next = NULL;
	movq	$0, (%rax)	 ;, new_node_17->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_17->content
 ; D:\TC\src\helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, list_6(D)->head
	je	.L9	 ;,
 ; D:\TC\src\helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_6(D)->tail, _4
 ; D:\TC\src\helper.c:31:         list->tail->next = new_node;
	movq	%rax, (%rdx)	 ; new_node, _4->next
 ; D:\TC\src\helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_6(D)->tail
.L3:
 ; D:\TC\src\helper.c:34: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L8:
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	movq	24(%rax), %r9	 ; _1->_stderr,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp90
	call	fwrite	 ;
 ; D:\TC\src\helper.c:24:         return;
	jmp	.L3	 ;
.L9:
 ; D:\TC\src\helper.c:28:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_6(D)->head
 ; D:\TC\src\helper.c:29:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_6(D)->tail
	jmp	.L3	 ;
	.globl	list_copy
	.def	list_copy;	.scl	2;	.type	32;	.endef
list_copy:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp87, original
 ; D:\TC\src\helper.c:37:     if (original == NULL)
	testq	%rcx, %rcx	 ; original
	je	.L12	 ;,
 ; D:\TC\src\helper.c:39:     list() new_list = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:40:     new_list->head = original->head;
	movq	(%rbx), %rdx	 ; original_5(D)->head, _1
 ; D:\TC\src\helper.c:40:     new_list->head = original->head;
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; D:\TC\src\helper.c:41:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	 ; original_5(D)->tail, _2
 ; D:\TC\src\helper.c:41:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
.L10:
 ; D:\TC\src\helper.c:43: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L12:
 ; D:\TC\src\helper.c:38:         return NULL;
	movq	%rcx, %rax	 ; original, <retval>
	jmp	.L10	 ;
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L17	 ;,
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_6(D)->head, <retval>
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L14	 ;,
 ; D:\TC\src\helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; D:\TC\src\helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_6(D)->head
 ; D:\TC\src\helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	 ; _2
	je	.L18	 ;,
.L16:
 ; D:\TC\src\helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
	ret	
.L18:
 ; D:\TC\src\helper.c:51:         list->tail = NULL;
	movq	$0, 8(%rcx)	 ;, list_6(D)->tail
	jmp	.L16	 ;
.L17:
 ; D:\TC\src\helper.c:47:         return NULL;
	movq	%rcx, %rax	 ; list, <retval>
.L14:
 ; D:\TC\src\helper.c:53: }
	ret	
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L22	 ;,
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_7(D)->head, <retval>
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L19	 ;,
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	movq	8(%rcx), %rdx	 ; list_7(D)->tail, _2
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	cmpq	%rdx, %rax	 ; _2, <retval>
	je	.L25	 ;,
.L21:
	movq	%rax, %r8	 ; <retval>, current
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	 ; current_4->next, <retval>
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %rdx	 ; <retval>, _2
	jne	.L21	 ;,
 ; D:\TC\src\helper.c:67:     pointer content = list->tail->content;
	movq	8(%rdx), %rax	 ; _2->content, <retval>
 ; D:\TC\src\helper.c:68:     current->next = NULL;
	movq	$0, (%r8)	 ;, current_15->next
 ; D:\TC\src\helper.c:69:     list->tail = current;
	movq	%r8, 8(%rcx)	 ; current, list_7(D)->tail
 ; D:\TC\src\helper.c:70:     return content;
	ret	
.L25:
 ; D:\TC\src\helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
 ; D:\TC\src\helper.c:60:         list->head = NULL;
	movq	$0, (%rcx)	 ;, list_7(D)->head
 ; D:\TC\src\helper.c:61:         list->tail = NULL;
	movq	$0, 8(%rcx)	 ;, list_7(D)->tail
 ; D:\TC\src\helper.c:62:         return content;
	ret	
.L22:
 ; D:\TC\src\helper.c:57:         return NULL;
	movq	%rcx, %rax	 ; list, <retval>
.L19:
 ; D:\TC\src\helper.c:71: }
	ret	
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp86, parent
 ; D:\TC\src\helper.c:93:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\src\helper.c:94:     new_scope->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; D:\TC\src\helper.c:95:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:95:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, new_scope_4->symbols
 ; D:\TC\src\helper.c:97: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	search_name
	.def	search_name;	.scl	2;	.type	32;	.endef
search_name:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp92, scope
	movq	%rdx, %rdi	 ; tmp93, name
 ; D:\TC\src\helper.c:100:     while (scope != NULL) {
	testq	%rcx, %rcx	 ; scope
	je	.L33	 ;,
.L32:
 ; D:\TC\src\helper.c:102:         Node* current = names->head;
	movq	8(%rbp), %rax	 ; scope_22->symbols, scope_22->symbols
	movq	(%rax), %rbx	 ; names_11->head, current
 ; D:\TC\src\helper.c:103:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L30	 ;,
.L31:
 ; D:\TC\src\helper.c:105:             Symbol* current_name = (Symbol*)node_ptr->content;
	movq	8(%rbx), %rsi	 ; current_23->content, <retval>
 ; D:\TC\src\helper.c:106:             if (string_equal(current_name->original_name, name))
	movq	16(%rsi), %rcx	 ; current_name_14->original_name, current_name_14->original_name
	movq	%rdi, %rdx	 ; name,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:106:             if (string_equal(current_name->original_name, name))
	testb	%al, %al	 ; tmp94
	jne	.L28	 ;,
 ; D:\TC\src\helper.c:108:             current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_23->next, current
 ; D:\TC\src\helper.c:103:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L31	 ;,
.L30:
 ; D:\TC\src\helper.c:110:         scope = scope->parent;
	movq	0(%rbp), %rbp	 ; scope_22->parent, scope
 ; D:\TC\src\helper.c:100:     while (scope != NULL) {
	testq	%rbp, %rbp	 ; scope
	jne	.L32	 ;,
 ; D:\TC\src\helper.c:112:     return NULL;
	movq	%rbp, %rsi	 ; scope, <retval>
	jmp	.L28	 ;
.L33:
	movq	%rcx, %rsi	 ; scope, <retval>
.L28:
 ; D:\TC\src\helper.c:113: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %r12	 ; tmp107, original_name
	movl	%edx, %edi	 ; tmp108, kind
	movq	%r8, %rbp	 ; tmp109, type
	movq	%r9, %rsi	 ; tmp110, scope
 ; D:\TC\src\helper.c:76:     Symbol* result = search_name(scope, original_name);
	movq	%rcx, %rdx	 ; original_name,
	movq	%r9, %rcx	 ; scope,
	call	search_name	 ;
 ; D:\TC\src\helper.c:77:     if (result != NULL)
	testq	%rax, %rax	 ; result
	je	.L38	 ;,
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rdx	 ; id_counter, tmp115
	leaq	1(%rdx), %rbx	 ;, _2
	movq	24(%rax), %r13	 ; result_18->id, _3
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movl	32(%rax), %r14d	 ; result_18->kind, _4
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rbx, 40(%rsp)	 ; _2,
	movq	%r13, 32(%rsp)	 ; _3,
	movl	%r14d, %r9d	 ; _4,
	movq	%r12, %r8	 ; original_name,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	call	fprintf	 ;
.L38:
 ; D:\TC\src\helper.c:79:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp113, <retval>
 ; D:\TC\src\helper.c:80:     new_name->original_name = original_name;
	movq	%r12, 16(%rax)	 ; original_name, new_name_22->original_name
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp116
	addq	$1, %rax	 ;, _8
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _8, id_counter
	movq	%rax, 24(%rbx)	 ; _8, new_name_22->id
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movl	%edi, 32(%rbx)	 ; kind, new_name_22->kind
 ; D:\TC\src\helper.c:83:     new_name->type = type;
	movq	%rbp, (%rbx)	 ; type, new_name_22->type
 ; D:\TC\src\helper.c:84:     new_name->scope = scope;
	movq	%rsi, 8(%rbx)	 ; scope, new_name_22->scope
 ; D:\TC\src\helper.c:85:     if (kind == SYMBOL_CLASS || kind == SYMBOL_SUBROUTINE)
	cmpl	$1, %edi	 ;, kind
	jbe	.L42	 ;,
 ; D:\TC\src\helper.c:88:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%rsi), %rcx	 ; scope_15(D)->symbols, scope_15(D)->symbols
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
.L37:
 ; D:\TC\src\helper.c:90: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L42:
 ; D:\TC\src\helper.c:86:         list_append(scope->parent->symbols, (pointer)new_name);
	movq	(%rsi), %rax	 ; scope_15(D)->parent, scope_15(D)->parent
	movq	8(%rax), %rcx	 ; _9->symbols, _9->symbols
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
	jmp	.L37	 ;
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp109, type
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp96
	movq	(%rax), %rdx	 ; INT_KEYWORD, INT_KEYWORD
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp110
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.3_11
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp110
	je	.L50	 ;,
.L44:
 ; D:\TC\src\helper.c:117: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L50:
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp98
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp111
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.3_11
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp111
	jne	.L44	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp100
	movq	(%rax), %rdx	 ; STRING_KEYWORD, STRING_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp112
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.3_11
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp112
	jne	.L44	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp102
	movq	(%rax), %rdx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp113
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.3_11
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%dl, %dl	 ; tmp113
	jne	.L44	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp104
	movq	(%rax), %rdx	 ; VOID_KEYWORD, VOID_KEYWORD
	movq	%rbx, %rcx	 ; type,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp114
	setne	%al	 ;, iftmp.3_11
	movzbl	%al, %eax	 ; iftmp.3_11, iftmp.3_11
	jmp	.L44	 ;
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp95, message
	movq	%r8, %rbx	 ; tmp97, file_name
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp100
	leaq	1(%rax), %rdi	 ;, _2
	movq	8(%rdx), %rsi	 ; token_8(D)->line, token_8(D)->line
	addq	$1, %rsi	 ;, _4
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rbp, 40(%rsp)	 ; message,
	movq	%rdi, 32(%rsp)	 ; _2,
	movq	%rsi, %r9	 ; _4,
	movq	%rbx, %r8	 ; file_name,
	leaq	.LC2(%rip), %rdx	 ;, tmp94
	call	fprintf	 ;
 ; D:\TC\src\helper.c:121: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
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
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp133, out
	movq	%rdx, %rsi	 ; tmp134, indent
	movl	%r8d, %r14d	 ; tmp135, is_last
 ; D:\TC\src\helper.c:137:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	11(%r9), %rdi	 ;, _3
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movq	%rdx, %rax	 ; indent, tmp112
	shrq	$3, %rax	 ;, tmp112
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	addq	%rdi, %rax	 ; _3, _28
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movzbl	(%rax), %edx	 ; *_28, word
 ; D:\TC\src\helper.c:125:     if (value)
	testb	%r8b, %r8b	 ; is_last
	jne	.L54	 ;,
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%esi, %ecx	 ; indent, tmp113
	andl	$7, %ecx	 ;, tmp113
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %r8d	 ;, tmp115
	sall	%cl, %r8d	 ; tmp113, tmp114
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%r8d, %edx	 ; tmp114, cstore_26
.L57:
	movb	%dl, (%rax)	 ; cstore_26, *_28
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	movl	$1, %ebx	 ;, i
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC4(%rip), %r13	 ;, tmp127
	leaq	.LC3(%rip), %r12	 ;, tmp128
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	cmpq	$1, %rsi	 ;, indent
	jbe	.L69	 ;,
.L55:
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%rbx, %rax	 ; i, tmp120
	shrq	$3, %rax	 ;, tmp120
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	(%rdi,%rax), %eax	 ; *_19, *_19
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%ebx, %ecx	 ; i, tmp122
	andl	$7, %ecx	 ;, tmp122
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	sarl	%cl, %eax	 ; tmp122, tmp123
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	 ;, tmp123
	movq	%r12, %rdx	 ; tmp128, iftmp.9_5
	cmove	%r13, %rdx	 ; tmp127,, iftmp.9_5
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%rbp, %rcx	 ; out,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	addq	$1, %rbx	 ;, i
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; i, indent
	jne	.L55	 ;,
.L59:
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%r14b, %r14b	 ; is_last
	leaq	.LC6(%rip), %rdx	 ;, tmp129
	leaq	.LC5(%rip), %rax	 ;, tmp130
	cmovne	%rax, %rdx	 ; tmp129,, tmp130, iftmp.10_6
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rbp, %rcx	 ; out,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:142: }
	jmp	.L53	 ;
.L54:
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	%esi, %ecx	 ; indent, tmp116
	andl	$7, %ecx	 ;, tmp116
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	movl	$1, %r8d	 ;, tmp118
	sall	%cl, %r8d	 ; tmp116, tmp117
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%r8d	 ; tmp119
	andl	%r8d, %edx	 ; tmp119, cstore_26
	jmp	.L57	 ;
.L69:
 ; D:\TC\src\helper.c:140:     if (indent > 0)
	testq	%rsi, %rsi	 ; indent
	jne	.L59	 ;,
.L53:
 ; D:\TC\src\helper.c:142: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	create_parser
	.def	create_parser;	.scl	2;	.type	32;	.endef
create_parser:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp85, file
 ; D:\TC\src\helper.c:145:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$48, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:146:     new_parser->in_function = false;
	movb	$0, 8(%rax)	 ;, new_parser_3->in_function
 ; D:\TC\src\helper.c:147:     new_parser->in_method = false;
	movb	$0, 9(%rax)	 ;, new_parser_3->in_method
 ; D:\TC\src\helper.c:148:     new_parser->in_loop = false;
	movb	$0, 10(%rax)	 ;, new_parser_3->in_loop
 ; D:\TC\src\helper.c:149:     new_parser->source_file = file;
	movq	%rbx, (%rax)	 ; file, new_parser_3->source_file
 ; D:\TC\src\helper.c:151: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
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
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp134, import_name
	movq	%r8, %r12	 ; tmp136, scope
 ; D:\TC\src\helper.c:157:     if (source == NULL) {
	testq	%rdx, %rdx	 ; source
	je	.L83	 ;,
	movq	%rdx, %rbx	 ; tmp135, source
	movq	%r9, %rcx	 ; tmp137, source_file
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	call	get_file_dir	 ;
	movq	%rax, %rdx	 ; tmp141, _3
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rcx	 ; source,
	call	absolute_path	 ;
	movq	%rax, %rbp	 ; tmp142, filename
.L74:
 ; D:\TC\src\helper.c:164:     openfile = fopen(filename, "r");
	leaq	.LC10(%rip), %rdx	 ;, tmp117
	movq	%rbp, %rcx	 ; filename,
	call	fopen	 ;
	movq	%rax, %rsi	 ; tmp143, <retval>
 ; D:\TC\src\helper.c:165:     if (openfile == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L84	 ;,
 ; D:\TC\src\helper.c:169:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rbp, %rdx	 ; filename,
	leaq	.LC12(%rip), %rcx	 ;, tmp120
	call	printf	 ;
 ; D:\TC\src\helper.c:170:     size_t length = 0;
	movq	$0, 40(%rsp)	 ;, length
 ; D:\TC\src\helper.c:171:     string source_code = read_source(openfile, &length);
	leaq	40(%rsp), %rdx	 ;, tmp121
	movq	%rsi, %rcx	 ; <retval>,
	call	read_source	 ;
	movq	%rax, %r13	 ; tmp145, source_code
 ; D:\TC\src\helper.c:172:     fclose(openfile);
	movq	%rsi, %rcx	 ; <retval>,
	call	fclose	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rbp, %rcx	 ; filename,
	call	create_file	 ;
	movq	%rax, %rcx	 ; tmp146, _6
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	create_parser	 ;
	movq	%rax, %rbx	 ; tmp147, _7
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp122
	movq	(%rax), %rsi	 ; builtin_scope, builtin_scope.11_8
	movq	40(%rsp), %rdx	 ; length,
	movq	%r13, %rcx	 ; source_code,
	call	create_lexer	 ;
	movq	%rax, %rcx	 ; tmp148, _10
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %r8	 ; _7,
	movq	%rsi, %rdx	 ; builtin_scope.11_8,
	call	parse_code	 ;
	movq	%rax, %rsi	 ; tmp149, <retval>
 ; D:\TC\src\helper.c:174:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rbp, %rdx	 ; filename,
	leaq	.LC13(%rip), %rcx	 ;, tmp124
	call	printf	 ;
 ; D:\TC\src\helper.c:175:     if (code == NULL) {
	testq	%rsi, %rsi	 ; <retval>
	je	.L85	 ;,
 ; D:\TC\src\helper.c:179:     list(Node*) names = code->global_scope->symbols;
	movq	8(%rsi), %rax	 ; code_50->global_scope, code_50->global_scope
 ; D:\TC\src\helper.c:180:     Node* current = names->head;
	movq	8(%rax), %rax	 ; _13->symbols, _13->symbols
	movq	(%rax), %rbx	 ; names_52->head, current
 ; D:\TC\src\helper.c:181:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L78	 ;,
.L80:
 ; D:\TC\src\helper.c:183:         Symbol* current_name = (Symbol*)node_ptr->content;
	movq	8(%rbx), %rsi	 ; current_68->content, <retval>
 ; D:\TC\src\helper.c:184:         if (string_equal(current_name->original_name, import_name)) {
	movq	16(%rsi), %rcx	 ; current_name_54->original_name, current_name_54->original_name
	movq	%rdi, %rdx	 ; import_name,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:184:         if (string_equal(current_name->original_name, import_name)) {
	testb	%al, %al	 ; tmp151
	jne	.L79	 ;,
 ; D:\TC\src\helper.c:188:         current = node_ptr->next;
	movq	(%rbx), %rbx	 ; current_68->next, current
 ; D:\TC\src\helper.c:181:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L80	 ;,
.L78:
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
	movq	%rbp, %r9	 ; filename,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC15(%rip), %rdx	 ;, tmp131
	call	fprintf	 ;
 ; D:\TC\src\helper.c:194:     return name;
	movl	$0, %esi	 ;, <retval>
	jmp	.L72	 ;
.L83:
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	strlen	 ;
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	4(%rax), %rdx	 ;, tmp113
	leaq	.LC7(%rip), %rcx	 ;, tmp114
	call	create_string_not_check	 ;
	movq	%rax, %rbx	 ; tmp139, temp_import_name
 ; D:\TC\src\helper.c:160:         sprintf(temp_import_name, "%s.tc", import_name);
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC8(%rip), %rdx	 ;, tmp115
	movq	%rax, %rcx	 ; temp_import_name,
	call	sprintf	 ;
 ; D:\TC\src\helper.c:161:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC9(%rip), %rdx	 ;, tmp116
	movq	%rbx, %rcx	 ; temp_import_name,
	call	absolute_path	 ;
	movq	%rax, %rbp	 ; tmp140, filename
	jmp	.L74	 ;
.L84:
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	movq	%rbp, %r8	 ; filename,
	leaq	.LC11(%rip), %rdx	 ;, tmp119
	call	fprintf	 ;
 ; D:\TC\src\helper.c:167:         return NULL;
	jmp	.L72	 ;
.L85:
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	movq	%rbp, %r8	 ; filename,
	leaq	.LC14(%rip), %rdx	 ;, tmp126
	call	fprintf	 ;
 ; D:\TC\src\helper.c:177:         return NULL;
	jmp	.L72	 ;
.L79:
 ; D:\TC\src\helper.c:191:         list_append(scope->symbols, (pointer)name);
	movq	8(%r12), %rcx	 ; scope_59(D)->symbols, scope_59(D)->symbols
	movq	%rsi, %rdx	 ; <retval>,
	call	list_append	 ;
.L72:
 ; D:\TC\src\helper.c:195: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp159, str
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp160
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL, ADD_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp161
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL, SUB_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp162
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp128
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL, MUL_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp163
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp163
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL, DIV_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp164
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp164
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL, MOD_ASSIGN_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp165
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp165
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp134
	movq	(%rax), %rdx	 ; AND_SYMBOL, AND_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp166
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp166
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp136
	movq	(%rax), %rdx	 ; OR_SYMBOL, OR_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp167
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp167
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rax), %rdx	 ; EQ_SYMBOL, EQ_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp168
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp168
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp140
	movq	(%rax), %rdx	 ; NE_SYMBOL, NE_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp169
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp169
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp142
	movq	(%rax), %rdx	 ; LT_SYMBOL, LT_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp170
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp170
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp144
	movq	(%rax), %rdx	 ; GT_SYMBOL, GT_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp171
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp171
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp146
	movq	(%rax), %rdx	 ; LE_SYMBOL, LE_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp172
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp172
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp148
	movq	(%rax), %rdx	 ; GE_SYMBOL, GE_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp173
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp173
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; ADD_SYMBOL, ADD_SYMBOL
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp174
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movl	$0, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp174
	je	.L108	 ;,
.L86:
 ; D:\TC\src\helper.c:219: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L108:
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp152
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp175
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp175
	jne	.L86	 ;,
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp153
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%al, %al	 ; tmp176
	jne	.L104	 ;,
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp154
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%al, %al	 ; tmp177
	jne	.L105	 ;,
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp155
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	movq	%rbx, %rcx	 ; str,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
	jmp	.L86	 ;
.L104:
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
	jmp	.L86	 ;
.L105:
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
	jmp	.L86	 ;
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
 ; D:\TC\src\helper.c:222:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L110	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	.L112(%rip), %rdx	 ;, tmp85
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L112:
	.long	.L116-.L112
	.long	.L116-.L112
	.long	.L115-.L112
	.long	.L115-.L112
	.long	.L115-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L114-.L112
	.long	.L117-.L112
	.long	.L117-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.long	.L111-.L112
	.text
.L111:
 ; D:\TC\src\helper.c:229:             return 1;
	movl	$1, %eax	 ;, <retval>
	ret	
.L114:
 ; D:\TC\src\helper.c:239:             return 3;
	movl	$3, %eax	 ;, <retval>
	ret	
.L116:
 ; D:\TC\src\helper.c:242:             return 4;
	movl	$4, %eax	 ;, <retval>
	ret	
.L115:
 ; D:\TC\src\helper.c:246:             return 5;
	movl	$5, %eax	 ;, <retval>
	ret	
.L110:
 ; D:\TC\src\helper.c:249:             return 0;
	movl	$0, %eax	 ;, <retval>
	ret	
.L117:
 ; D:\TC\src\helper.c:222:     switch (op) {
	movl	$2, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:251: }
	ret	
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
 ; D:\TC\src\helper.c:254:     switch (op) {
	cmpl	$18, %ecx	 ;, op
	ja	.L140	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	.L121(%rip), %rdx	 ;, tmp85
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
	.section .rdata,"dr"
	.align 4
.L121:
	.long	.L139-.L121
	.long	.L138-.L121
	.long	.L137-.L121
	.long	.L136-.L121
	.long	.L135-.L121
	.long	.L134-.L121
	.long	.L133-.L121
	.long	.L132-.L121
	.long	.L131-.L121
	.long	.L130-.L121
	.long	.L129-.L121
	.long	.L128-.L121
	.long	.L127-.L121
	.long	.L126-.L121
	.long	.L125-.L121
	.long	.L124-.L121
	.long	.L123-.L121
	.long	.L122-.L121
	.long	.L120-.L121
	.text
.L126:
 ; D:\TC\src\helper.c:255:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	movq	(%rax), %rax	 ; ASSIGN_SYMBOL, <retval>
	ret	
.L125:
 ; D:\TC\src\helper.c:256:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	movq	(%rax), %rax	 ; ADD_ASSIGN_SYMBOL, <retval>
	ret	
.L124:
 ; D:\TC\src\helper.c:257:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	movq	(%rax), %rax	 ; SUB_ASSIGN_SYMBOL, <retval>
	ret	
.L123:
 ; D:\TC\src\helper.c:258:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	movq	(%rax), %rax	 ; MUL_ASSIGN_SYMBOL, <retval>
	ret	
.L122:
 ; D:\TC\src\helper.c:259:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; DIV_ASSIGN_SYMBOL, <retval>
	ret	
.L120:
 ; D:\TC\src\helper.c:260:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; MOD_ASSIGN_SYMBOL, <retval>
	ret	
.L128:
 ; D:\TC\src\helper.c:261:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; AND_SYMBOL, <retval>
	ret	
.L127:
 ; D:\TC\src\helper.c:262:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; OR_SYMBOL, <retval>
	ret	
.L134:
 ; D:\TC\src\helper.c:263:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; EQ_SYMBOL, <retval>
	ret	
.L133:
 ; D:\TC\src\helper.c:264:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	movq	(%rax), %rax	 ; NE_SYMBOL, <retval>
	ret	
.L132:
 ; D:\TC\src\helper.c:265:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	movq	(%rax), %rax	 ; LT_SYMBOL, <retval>
	ret	
.L131:
 ; D:\TC\src\helper.c:266:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	movq	(%rax), %rax	 ; GT_SYMBOL, <retval>
	ret	
.L130:
 ; D:\TC\src\helper.c:267:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	movq	(%rax), %rax	 ; LE_SYMBOL, <retval>
	ret	
.L129:
 ; D:\TC\src\helper.c:268:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; GE_SYMBOL, <retval>
	ret	
.L139:
 ; D:\TC\src\helper.c:269:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	movq	(%rax), %rax	 ; ADD_SYMBOL, <retval>
	ret	
.L138:
 ; D:\TC\src\helper.c:270:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; SUB_SYMBOL, <retval>
	ret	
.L137:
 ; D:\TC\src\helper.c:271:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	movq	(%rax), %rax	 ; MUL_SYMBOL, <retval>
	ret	
.L136:
 ; D:\TC\src\helper.c:272:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; DIV_SYMBOL, <retval>
	ret	
.L135:
 ; D:\TC\src\helper.c:273:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
	movq	(%rax), %rax	 ; MOD_SYMBOL, <retval>
	ret	
.L140:
 ; D:\TC\src\helper.c:254:     switch (op) {
	movl	$0, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:277: }
	ret	
.lcomm id_counter.0,8,8
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	read_source;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	create_file;	.scl	2;	.type	32;	.endef
	.def	create_lexer;	.scl	2;	.type	32;	.endef
	.def	parse_code;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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
