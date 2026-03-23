	.file	"D:\\TC\\src\\helper.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	create_list
	.def	create_list;	.scl	2;	.type	32;	.endef
create_list:
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:8:     List* new_list = (List*)alloc_memory(sizeof(List));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:10:     new_list->tail = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, new_list_3->head
	movq	%rdx, 8(%rax)	 ;, new_list_3->tail
 ; D:\TC\src\helper.c:12: }
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
 ; D:\TC\src\helper.c:22:     if (list == NULL) {
	testq	%rcx, %rcx	 ; list
	jne	.L4	 ;,
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	call	__getreent	 ;
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	leaq	.LC0(%rip), %rcx	 ;, tmp90
	movq	24(%rax), %rdx	 ; _14->_stderr, _14->_stderr
 ; D:\TC\src\helper.c:34: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\src\helper.c:23:         fprintf(stderr, "Error: list_append received NULL list\n");
	jmp	fputs	 ;
.L4:
	movq	%rcx, %rbx	 ; tmp92, list
 ; D:\TC\src\helper.c:15:     Node* new_node = (Node*)alloc_memory(sizeof(Node));
	movl	$16, %ecx	 ;,
	movq	%rdx, %rsi	 ; tmp93, item
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:16:     new_node->next = NULL;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\helper.c:27:     if (list->head == NULL) {
	cmpq	$0, (%rbx)	 ;, list_3(D)->head
 ; D:\TC\src\helper.c:16:     new_node->next = NULL;
	movq	%rdx, (%rax)	 ;, new_node_16->next
 ; D:\TC\src\helper.c:17:     new_node->content = content;
	movq	%rsi, 8(%rax)	 ; item, new_node_16->content
 ; D:\TC\src\helper.c:27:     if (list->head == NULL) {
	jne	.L5	 ;,
 ; D:\TC\src\helper.c:28:         list->head = new_node;
	movq	%rax, (%rbx)	 ; new_node, list_3(D)->head
	jmp	.L8	 ;
.L5:
 ; D:\TC\src\helper.c:31:         list->tail->next = new_node;
	movq	8(%rbx), %rdx	 ; list_3(D)->tail, list_3(D)->tail
	movq	%rax, (%rdx)	 ; new_node, _2->next
.L8:
 ; D:\TC\src\helper.c:32:         list->tail = new_node;
	movq	%rax, 8(%rbx)	 ; new_node, list_3(D)->tail
 ; D:\TC\src\helper.c:34: }
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
 ; D:\TC\src\helper.c:37:     if (original == NULL)
	testq	%rcx, %rcx	 ; original
	je	.L11	 ;,
 ; D:\TC\src\helper.c:39:     list() new_list = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:40:     new_list->head = original->head;
	movq	(%rbx), %rdx	 ; original_5(D)->head, _1
 ; D:\TC\src\helper.c:40:     new_list->head = original->head;
	movq	%rdx, (%rax)	 ; _1, new_list_8->head
 ; D:\TC\src\helper.c:41:     new_list->tail = original->tail;
	movq	8(%rbx), %rdx	 ; original_5(D)->tail, _2
 ; D:\TC\src\helper.c:42:     return new_list;
	movq	%rax, %rbx	 ; new_list, original
 ; D:\TC\src\helper.c:41:     new_list->tail = original->tail;
	movq	%rdx, 8(%rax)	 ; _2, new_list_8->tail
.L11:
 ; D:\TC\src\helper.c:43: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; original,
	popq	%rbx	 ;
	ret	
	.globl	list_pop
	.def	list_pop;	.scl	2;	.type	32;	.endef
list_pop:
 ; D:\TC\src\helper.c:47:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L16	 ;,
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_6(D)->head, <retval>
 ; D:\TC\src\helper.c:46:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L16	 ;,
 ; D:\TC\src\helper.c:49:     list->head = head_node->next;
	movq	(%rax), %rdx	 ; _1->next, _2
 ; D:\TC\src\helper.c:49:     list->head = head_node->next;
	movq	%rdx, (%rcx)	 ; _2, list_6(D)->head
 ; D:\TC\src\helper.c:50:     if (list->head == NULL)
	testq	%rdx, %rdx	 ; _2
	jne	.L18	 ;,
 ; D:\TC\src\helper.c:51:         list->tail = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rcx)	 ;, list_6(D)->tail
.L18:
 ; D:\TC\src\helper.c:52:     return head_node->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
.L16:
 ; D:\TC\src\helper.c:53: }
	ret	
	.globl	list_pop_back
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
list_pop_back:
 ; D:\TC\src\helper.c:57:         return NULL;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rcx, %rcx	 ; list
	je	.L23	 ;,
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	movq	(%rcx), %rax	 ; list_8(D)->head, <retval>
 ; D:\TC\src\helper.c:56:     if (list == NULL || list->head == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L23	 ;,
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	movq	8(%rcx), %r8	 ; list_8(D)->tail, _3
 ; D:\TC\src\helper.c:58:     if (list->head == list->tail) {
	cmpq	%r8, %rax	 ; _3, <retval>
	jne	.L25	 ;,
 ; D:\TC\src\helper.c:61:         list->tail = NULL;
	xorl	%r9d, %r9d	 ;
 ; D:\TC\src\helper.c:59:         pointer content = list->head->content;
	movq	8(%rax), %rax	 ; _1->content, <retval>
 ; D:\TC\src\helper.c:61:         list->tail = NULL;
	movq	%r9, (%rcx)	 ;, list_8(D)->head
	movq	%r9, 8(%rcx)	 ;, list_8(D)->tail
 ; D:\TC\src\helper.c:62:         return content;
	ret	
.L25:
	movq	%rax, %rdx	 ; <retval>, current
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	movq	(%rax), %rax	 ; current_5->next, <retval>
 ; D:\TC\src\helper.c:65:     while (current->next != list->tail)
	cmpq	%rax, %r8	 ; <retval>, _3
	jne	.L25	 ;,
 ; D:\TC\src\helper.c:68:     current->next = NULL;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\helper.c:67:     pointer content = list->tail->content;
	movq	8(%rax), %rax	 ; _3->content, <retval>
 ; D:\TC\src\helper.c:68:     current->next = NULL;
	movq	%r8, (%rdx)	 ;, current_2->next
 ; D:\TC\src\helper.c:69:     list->tail = current;
	movq	%rdx, 8(%rcx)	 ; current, list_8(D)->tail
.L23:
 ; D:\TC\src\helper.c:71: }
	ret	
	.globl	create_symbol_table
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
create_symbol_table:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, parent
 ; D:\TC\src\helper.c:93:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\helper.c:92: SymbolTable* create_symbol_table(SymbolTable* parent) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\helper.c:93:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:94:     new_scope->parent = parent;
	movq	%rsi, (%rax)	 ; parent, new_scope_4->parent
 ; D:\TC\src\helper.c:93:     SymbolTable* new_scope = (SymbolTable*)alloc_memory(sizeof(SymbolTable));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\src\helper.c:95:     new_scope->symbols = create_list();
	call	create_list	 ;
 ; D:\TC\src\helper.c:95:     new_scope->symbols = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, new_scope_4->symbols
 ; D:\TC\src\helper.c:97: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
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
.L35:
 ; D:\TC\src\helper.c:100:     while (scope != NULL) {
	testq	%rbx, %rbx	 ; scope
	je	.L41	 ;,
 ; D:\TC\src\helper.c:102:         Node* current = names->head;
	movq	8(%rbx), %rax	 ; scope_3->symbols, scope_3->symbols
	movq	(%rax), %rsi	 ; names_12->head, current
.L36:
 ; D:\TC\src\helper.c:103:         while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	je	.L42	 ;,
 ; D:\TC\src\helper.c:105:             Symbol* current_name = (Symbol*)node_ptr->content;
	movq	8(%rsi), %rdi	 ; current_4->content, <retval>
 ; D:\TC\src\helper.c:106:             if (string_equal(current_name->original_name, name))
	movq	%rbp, %rdx	 ; name,
	movq	16(%rdi), %rcx	 ; current_name_15->original_name, current_name_15->original_name
	call	string_equal	 ;
 ; D:\TC\src\helper.c:106:             if (string_equal(current_name->original_name, name))
	testb	%al, %al	 ; tmp94
	jne	.L34	 ;,
 ; D:\TC\src\helper.c:108:             current = node_ptr->next;
	movq	(%rsi), %rsi	 ; current_4->next, current
	jmp	.L36	 ;
.L42:
 ; D:\TC\src\helper.c:110:         scope = scope->parent;
	movq	(%rbx), %rbx	 ; scope_3->parent, scope
	jmp	.L35	 ;
.L41:
 ; D:\TC\src\helper.c:112:     return NULL;
	xorl	%edi, %edi	 ; <retval>
.L34:
 ; D:\TC\src\helper.c:113: }
	addq	$40, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\12\0"
	.text
	.globl	create_symbol
	.def	create_symbol;	.scl	2;	.type	32;	.endef
create_symbol:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp109, type
	pushq	%rbp	 ;
	movl	%edx, %ebp	 ; tmp108, kind
 ; D:\TC\src\helper.c:76:     Symbol* result = search_name(scope, original_name);
	movq	%rcx, %rdx	 ; original_name,
 ; D:\TC\src\helper.c:74: Symbol* create_symbol(string original_name, SymbolType kind, Symbol* type, SymbolTable* scope) {
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp107, original_name
 ; D:\TC\src\helper.c:76:     Symbol* result = search_name(scope, original_name);
	movq	%r9, %rcx	 ; scope,
 ; D:\TC\src\helper.c:74: Symbol* create_symbol(string original_name, SymbolType kind, Symbol* type, SymbolTable* scope) {
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp110, scope
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:\TC\src\helper.c:76:     Symbol* result = search_name(scope, original_name);
	call	search_name	 ;
 ; D:\TC\src\helper.c:77:     if (result != NULL)
	testq	%rax, %rax	 ; result
	je	.L44	 ;,
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	id_counter.0(%rip), %rdx	 ; id_counter, tmp115
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movl	32(%rax), %r9d	 ; result_18->kind, _4
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movq	24(%rax), %r13	 ; result_18->id, _3
	leaq	1(%rdx), %rbx	 ;, _2
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movl	%r9d, 60(%rsp)	 ; _4, %sfp
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:78:         fprintf(stderr, "Warning: Name '%s' already exists in the current scope, kind: %d, id: %zu %zu\n", original_name, result->kind, result->id, id_counter + 1);
	movl	60(%rsp), %r9d	 ; %sfp, _4
	movq	%rdi, %r8	 ; original_name,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rbx, 40(%rsp)	 ; _2,
	movq	%r13, 32(%rsp)	 ; _3,
	call	fprintf	 ;
.L44:
 ; D:\TC\src\helper.c:79:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:80:     new_name->original_name = original_name;
	movq	%rdi, 16(%rax)	 ; original_name, new_name_22->original_name
 ; D:\TC\src\helper.c:79:     Symbol* new_name = (Symbol*)alloc_memory(sizeof(Symbol));
	movq	%rax, %rbx	 ; tmp113, <retval>
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	id_counter.0(%rip), %rax	 ; id_counter, tmp116
 ; D:\TC\src\helper.c:82:     new_name->kind = kind;
	movl	%ebp, 32(%rbx)	 ; kind, new_name_22->kind
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	incq	%rax	 ; _8
 ; D:\TC\src\helper.c:83:     new_name->type = type;
	movq	%r12, (%rbx)	 ; type, new_name_22->type
 ; D:\TC\src\helper.c:81:     new_name->id = ++id_counter;
	movq	%rax, id_counter.0(%rip)	 ; _8, id_counter
	movq	%rax, 24(%rbx)	 ; _8, new_name_22->id
 ; D:\TC\src\helper.c:84:     new_name->scope = scope;
	movq	%rsi, 8(%rbx)	 ; scope, new_name_22->scope
 ; D:\TC\src\helper.c:85:     if (kind == SYMBOL_CLASS || kind == SYMBOL_SUBROUTINE)
	cmpl	$1, %ebp	 ;, kind
	ja	.L45	 ;,
 ; D:\TC\src\helper.c:86:         list_append(scope->parent->symbols, (pointer)new_name);
	movq	(%rsi), %rax	 ; scope_15(D)->parent, scope_15(D)->parent
	movq	8(%rax), %rcx	 ; _9->symbols, _9->symbols
	jmp	.L51	 ;
.L45:
 ; D:\TC\src\helper.c:88:         list_append(scope->symbols, (pointer)new_name);
	movq	8(%rsi), %rcx	 ; scope_15(D)->symbols, scope_15(D)->symbols
.L51:
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
 ; D:\TC\src\helper.c:90: }
	addq	$72, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.globl	is_builtin_type
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
is_builtin_type:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp104, type
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp96
	movq	(%rax), %rdx	 ; INT_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp105
	je	.L53	 ;,
.L55:
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movl	$1, %eax	 ;, iftmp.3_11
	jmp	.L54	 ;
.L53:
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp97
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; FLOAT_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp106
	jne	.L55	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp98
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; STRING_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp107
	jne	.L55	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp99
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; BOOL_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp108
	jne	.L55	 ;,
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp100
	movq	%rbx, %rcx	 ; type,
	movq	(%rax), %rdx	 ; VOID_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:116:     return string_equal(type, INT_KEYWORD) || string_equal(type, FLOAT_KEYWORD) || string_equal(type, STRING_KEYWORD) || string_equal(type, BOOL_KEYWORD) || string_equal(type, VOID_KEYWORD);
	testb	%al, %al	 ; tmp109
	setne	%al	 ;, iftmp.3_11
	movzbl	%al, %eax	 ; iftmp.3_11, iftmp.3_11
.L54:
 ; D:\TC\src\helper.c:117: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
.LC2:
	.ascii "Parser Error at %s:%zu:%zu: %s\12\0"
	.text
	.globl	parser_error
	.def	parser_error;	.scl	2;	.type	32;	.endef
parser_error:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp95, message
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	8(%rdx), %r9	 ; token_8(D)->line, token_8(D)->line
	movq	16(%rdx), %rax	 ; token_8(D)->column, tmp100
 ; D:\TC\src\helper.c:119: inline void parser_error(const string message, Token* token, string file_name) {
	movq	%r8, 112(%rsp)	 ; file_name, file_name
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	incq	%r9	 ; _4
	leaq	1(%rax), %rbx	 ;, _2
	movq	%r9, 56(%rsp)	 ; _4, %sfp
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:120:     fprintf(stderr, "Parser Error at %s:%zu:%zu: %s\n", file_name, token->line + 1, token->column + 1, message);
	movq	56(%rsp), %r9	 ; %sfp, _4
	movq	112(%rsp), %r8	 ; file_name, file_name
	leaq	.LC2(%rip), %rdx	 ;, tmp94
	movq	24(%rax), %rcx	 ; _5->_stderr, _5->_stderr
	movq	%rsi, 40(%rsp)	 ; message,
	movq	%rbx, 32(%rsp)	 ; _2,
	call	fprintf	 ;
 ; D:\TC\src\helper.c:121: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
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
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	$1, %eax	 ;, tmp111
 ; D:\TC\src\helper.c:135: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%r13	 ;
	pushq	%r12	 ;
 ; D:\TC\src\helper.c:137:     set_bool_list(parser_ptr->indent_has_next, indent, !is_last);
	leaq	11(%r9), %r12	 ;, _3
 ; D:\TC\src\helper.c:135: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%rbp	 ;
	movl	%r8d, %ebp	 ; tmp138, is_last
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movq	%rdx, %r8	 ; indent, tmp108
 ; D:\TC\src\helper.c:135: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%rdi	 ;
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	shrq	$3, %r8	 ;, tmp108
 ; D:\TC\src\helper.c:135: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	movq	%rcx, %rdi	 ; tmp136, out
	pushq	%rsi	 ;
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	addq	%r12, %r8	 ; _3, _21
 ; D:\TC\src\helper.c:135: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp137, indent
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	movl	%ebx, %ecx	 ; indent, tmp109
	andl	$7, %ecx	 ;, tmp109
 ; D:\TC\src\helper.c:135: void indention(FILE* out, size_t indent, bool is_last, Parser* parser) {
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	sall	%cl, %eax	 ; tmp109, tmp110
 ; D:\TC\src\helper.c:124:     char word = bool_list[index / 8];
	movb	(%r8), %dl	 ; *_21, word
 ; D:\TC\src\helper.c:125:     if (value)
	testb	%bpl, %bpl	 ; is_last
	jne	.L60	 ;,
 ; D:\TC\src\helper.c:126:         bool_list[index / 8] = (char)(word | (1 << (index % 8)));
	orl	%eax, %edx	 ; tmp110, cstore_4
.L62:
	movb	%dl, (%r8)	 ; cstore_4, *_21
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movl	$1, %esi	 ;, i
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	leaq	.LC4(%rip), %r13	 ;, tmp134
	leaq	.LC3(%rip), %r14	 ;, tmp135
	jmp	.L61	 ;
.L60:
 ; D:\TC\src\helper.c:128:         bool_list[index / 8] = (char)(word & ~(1 << (index % 8)));
	notl	%eax	 ; tmp112
	andl	%eax, %edx	 ; tmp112, cstore_4
	jmp	.L62	 ;
.L61:
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	cmpq	%rbx, %rsi	 ; indent, i
	jnb	.L70	 ;,
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movq	%rsi, %rax	 ; i, tmp113
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movl	%esi, %ecx	 ; i, tmp115
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%r14, %rdx	 ; tmp135, iftmp.9_6
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	shrq	$3, %rax	 ;, tmp113
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	andl	$7, %ecx	 ;, tmp115
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	movsbl	(%r12,%rax), %eax	 ; *_35, *_35
 ; D:\TC\src\helper.c:132:     return (bool_list[index / 8] & (1 << (index % 8))) != 0;
	sarl	%cl, %eax	 ; tmp115, tmp116
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	movq	%rdi, %rcx	 ; out,
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	testb	$1, %al	 ;, tmp116
	cmove	%r13, %rdx	 ; tmp134,, iftmp.9_6
 ; D:\TC\src\helper.c:138:     for (size_t i = 1; i < indent; ++i)
	incq	%rsi	 ; i
 ; D:\TC\src\helper.c:139:         fprintf(out, get_bool_list(parser_ptr->indent_has_next, i) ? "│   " : "    ");
	call	fprintf	 ;
	jmp	.L61	 ;
.L70:
 ; D:\TC\src\helper.c:140:     if (indent > 0)
	testq	%rbx, %rbx	 ; indent
	je	.L59	 ;,
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	testb	%bpl, %bpl	 ; is_last
	leaq	.LC6(%rip), %rdx	 ;, tmp130
	leaq	.LC5(%rip), %rax	 ;, tmp131
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	movq	%rdi, %rcx	 ; out,
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	cmovne	%rax, %rdx	 ; tmp130,, tmp131, iftmp.10_7
 ; D:\TC\src\helper.c:142: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\helper.c:141:         fprintf(out, is_last ? "└── " : "├── ");
	jmp	fprintf	 ;
.L59:
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
	movq	%rcx, %rbx	 ; tmp85, file
 ; D:\TC\src\helper.c:145:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	movl	$48, %ecx	 ;,
 ; D:\TC\src\helper.c:144: Parser* create_parser(File* file) {
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:145:     Parser* new_parser = (Parser*)alloc_memory(sizeof(Parser));
	call	alloc_memory	 ;
 ; D:\TC\src\helper.c:146:     new_parser->in_function = false;
	movw	$0, 8(%rax)	 ;, MEM <unsigned short> [(char *)new_parser_3 + 8B]
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
.LC11:
	.ascii "Error opening library file for import: %s\12\0"
.LC12:
	.ascii "Info: Starting parsing lib file for import: %s\12\0"
.LC13:
	.ascii "Info: Finished parsing lib file for import: %s\12\0"
.LC14:
	.ascii "Error parsing library file for import: %s\12\0"
.LC15:
	.ascii "Error: Imported symbol '%s' was not found in %s\12\0"
	.text
	.globl	parse_import_file
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
parse_import_file:
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp138, scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp136, import_name
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:\TC\src\helper.c:157:     if (source == NULL) {
	testq	%rdx, %rdx	 ; source
	jne	.L74	 ;,
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	call	strlen	 ;
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	leaq	.LC7(%rip), %rcx	 ;, tmp116
	leaq	4(%rax), %rdx	 ;, tmp115
	call	create_string_not_check	 ;
 ; D:\TC\src\helper.c:160:         sprintf(temp_import_name, "%s.tc", import_name);
	leaq	.LC8(%rip), %rdx	 ;, tmp117
	movq	%rsi, %r8	 ; import_name,
	movq	%rax, %rcx	 ; temp_import_name,
 ; D:\TC\src\helper.c:159:         string temp_import_name = create_string_not_check("", strlen(import_name) + 4);
	movq	%rax, %rbx	 ; tmp141, temp_import_name
 ; D:\TC\src\helper.c:160:         sprintf(temp_import_name, "%s.tc", import_name);
	call	sprintf	 ;
 ; D:\TC\src\helper.c:161:         filename = absolute_path(temp_import_name, std_path);
	leaq	.LC9(%rip), %rdx	 ;, tmp118
	jmp	.L86	 ;
.L74:
	movq	%r9, %rcx	 ; tmp139, source_file
	movq	%rdx, %rbx	 ; tmp137, source
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	call	get_file_dir	 ;
	movq	%rax, %rdx	 ; tmp143, _3
.L86:
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rbx, %rcx	 ; source,
	call	absolute_path	 ;
 ; D:\TC\src\helper.c:164:     openfile = fopen(filename, "r");
	leaq	.LC10(%rip), %rdx	 ;, tmp119
	movq	%rax, %rcx	 ; filename,
 ; D:\TC\src\helper.c:163:         filename = absolute_path(source, get_file_dir(source_file));
	movq	%rax, %rbx	 ; tmp144, filename
 ; D:\TC\src\helper.c:164:     openfile = fopen(filename, "r");
	call	fopen	 ;
	movq	%rax, %rdi	 ; tmp145, openfile
 ; D:\TC\src\helper.c:165:     if (openfile == NULL) {
	testq	%rax, %rax	 ; openfile
	jne	.L76	 ;,
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:166:         fprintf(stderr, "Error opening library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; filename,
	leaq	.LC11(%rip), %rdx	 ;, tmp121
	movq	24(%rax), %rcx	 ; _4->_stderr, _4->_stderr
	jmp	.L87	 ;
.L76:
 ; D:\TC\src\helper.c:169:     printf("Info: Starting parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; filename,
	leaq	.LC12(%rip), %rcx	 ;, tmp122
	call	printf	 ;
 ; D:\TC\src\helper.c:171:     string source_code = read_source(openfile, &length);
	leaq	56(%rsp), %rdx	 ;, tmp123
 ; D:\TC\src\helper.c:170:     size_t length = 0;
	xorl	%eax, %eax	 ;
 ; D:\TC\src\helper.c:171:     string source_code = read_source(openfile, &length);
	movq	%rdi, %rcx	 ; openfile,
 ; D:\TC\src\helper.c:170:     size_t length = 0;
	movq	%rax, 56(%rsp)	 ;, length
 ; D:\TC\src\helper.c:171:     string source_code = read_source(openfile, &length);
	call	read_source	 ;
 ; D:\TC\src\helper.c:172:     fclose(openfile);
	movq	%rdi, %rcx	 ; openfile,
 ; D:\TC\src\helper.c:171:     string source_code = read_source(openfile, &length);
	movq	%rax, %rbp	 ; tmp147, source_code
 ; D:\TC\src\helper.c:172:     fclose(openfile);
	call	fclose	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rbx, %rcx	 ; filename,
	call	create_file	 ;
	movq	%rax, %rcx	 ; tmp148, _6
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	create_parser	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	56(%rsp), %rdx	 ; length,
	movq	%rbp, %rcx	 ; source_code,
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, 40(%rsp)	 ; _7, %sfp
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp124
	movq	(%rax), %rdi	 ; builtin_scope, builtin_scope.11_8
	call	create_lexer	 ;
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	40(%rsp), %r8	 ; %sfp, _7
	movq	%rdi, %rdx	 ; builtin_scope.11_8,
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rcx	 ; tmp150, _10
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	call	parse_code	 ;
 ; D:\TC\src\helper.c:174:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	movq	%rbx, %rdx	 ; filename,
	leaq	.LC13(%rip), %rcx	 ;, tmp126
 ; D:\TC\src\helper.c:173:     Code* code = parse_code(create_lexer(source_code, length), builtin_scope, create_parser(create_file(filename)));
	movq	%rax, %rdi	 ; tmp151, code
 ; D:\TC\src\helper.c:174:     printf("Info: Finished parsing lib file for import: %s\n", filename);
	call	printf	 ;
 ; D:\TC\src\helper.c:175:     if (code == NULL) {
	testq	%rdi, %rdi	 ; code
	jne	.L78	 ;,
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:176:         fprintf(stderr, "Error parsing library file for import: %s\n", filename);
	movq	%rbx, %r8	 ; filename,
	leaq	.LC14(%rip), %rdx	 ;, tmp128
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
.L87:
	call	fprintf	 ;
.L77:
 ; D:\TC\src\helper.c:167:         return NULL;
	xorl	%edi, %edi	 ; <retval>
	jmp	.L73	 ;
.L78:
 ; D:\TC\src\helper.c:179:     list(Node*) names = code->global_scope->symbols;
	movq	8(%rdi), %rax	 ; code_51->global_scope, code_51->global_scope
 ; D:\TC\src\helper.c:180:     Node* current = names->head;
	movq	8(%rax), %rax	 ; _13->symbols, _13->symbols
	movq	(%rax), %rbp	 ; names_53->head, current
.L80:
 ; D:\TC\src\helper.c:181:     while (current != NULL) {
	testq	%rbp, %rbp	 ; current
	je	.L88	 ;,
 ; D:\TC\src\helper.c:183:         Symbol* current_name = (Symbol*)node_ptr->content;
	movq	8(%rbp), %rdi	 ; current_21->content, <retval>
 ; D:\TC\src\helper.c:184:         if (string_equal(current_name->original_name, import_name)) {
	movq	%rsi, %rdx	 ; import_name,
	movq	16(%rdi), %rcx	 ; current_name_56->original_name, current_name_56->original_name
	call	string_equal	 ;
 ; D:\TC\src\helper.c:184:         if (string_equal(current_name->original_name, import_name)) {
	testb	%al, %al	 ; tmp153
	jne	.L81	 ;,
 ; D:\TC\src\helper.c:188:         current = node_ptr->next;
	movq	0(%rbp), %rbp	 ; current_21->next, current
	jmp	.L80	 ;
.L81:
 ; D:\TC\src\helper.c:191:         list_append(scope->symbols, (pointer)name);
	movq	8(%r12), %rcx	 ; scope_61(D)->symbols, scope_61(D)->symbols
	movq	%rdi, %rdx	 ; <retval>,
	call	list_append	 ;
	jmp	.L73	 ;
.L88:
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	call	__getreent	 ;
 ; D:\TC\src\helper.c:193:         fprintf(stderr, "Error: Imported symbol '%s' was not found in %s\n", import_name, filename);
	movq	%rbx, %r9	 ; filename,
	movq	%rsi, %r8	 ; import_name,
	leaq	.LC15(%rip), %rdx	 ;, tmp135
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
	call	fprintf	 ;
	jmp	.L77	 ;
.L73:
 ; D:\TC\src\helper.c:195: }
	addq	$64, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.globl	string_to_operator
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
string_to_operator:
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp144, str
	subq	$32, %rsp	 ;,
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp122
	movq	(%rax), %rdx	 ; ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp145
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	movl	$13, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:199:     if (string_equal(str, ASSIGN_SYMBOL)) return OP_ASSIGN;
	testb	%dl, %dl	 ; tmp145
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp123
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp146
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	movl	$14, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:200:     else if (string_equal(str, ADD_ASSIGN_SYMBOL)) return OP_ADD_ASSIGN;
	testb	%dl, %dl	 ; tmp146
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp124
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp147
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	movl	$15, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:201:     else if (string_equal(str, SUB_ASSIGN_SYMBOL)) return OP_SUB_ASSIGN;
	testb	%dl, %dl	 ; tmp147
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp125
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp148
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	movl	$16, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:202:     else if (string_equal(str, MUL_ASSIGN_SYMBOL)) return OP_MUL_ASSIGN;
	testb	%dl, %dl	 ; tmp148
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp126
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp149
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	movl	$17, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:203:     else if (string_equal(str, DIV_ASSIGN_SYMBOL)) return OP_DIV_ASSIGN;
	testb	%dl, %dl	 ; tmp149
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp127
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_ASSIGN_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp150
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	movl	$18, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:204:     else if (string_equal(str, MOD_ASSIGN_SYMBOL)) return OP_MOD_ASSIGN;
	testb	%dl, %dl	 ; tmp150
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp128
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; AND_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp151
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	movl	$11, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:205:     else if (string_equal(str, AND_SYMBOL)) return OP_AND;
	testb	%dl, %dl	 ; tmp151
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp129
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; OR_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp152
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	movl	$12, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:206:     else if (string_equal(str, OR_SYMBOL)) return OP_OR;
	testb	%dl, %dl	 ; tmp152
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp130
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; EQ_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp153
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	movl	$5, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:207:     else if (string_equal(str, EQ_SYMBOL)) return OP_EQ;
	testb	%dl, %dl	 ; tmp153
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp131
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; NE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp154
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	movl	$6, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:208:     else if (string_equal(str, NE_SYMBOL)) return OP_NE;
	testb	%dl, %dl	 ; tmp154
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp132
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LT_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp155
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	movl	$7, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:209:     else if (string_equal(str, LT_SYMBOL)) return OP_LT;
	testb	%dl, %dl	 ; tmp155
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp133
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GT_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp156
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:210:     else if (string_equal(str, GT_SYMBOL)) return OP_GT;
	testb	%dl, %dl	 ; tmp156
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp134
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; LE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp157
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	movl	$9, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:211:     else if (string_equal(str, LE_SYMBOL)) return OP_LE;
	testb	%dl, %dl	 ; tmp157
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp135
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; GE_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp158
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	movl	$10, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:212:     else if (string_equal(str, GE_SYMBOL)) return OP_GE;
	testb	%dl, %dl	 ; tmp158
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp136
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; ADD_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp159
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\src\helper.c:213:     else if (string_equal(str, ADD_SYMBOL)) return OP_ADD;
	testb	%dl, %dl	 ; tmp159
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp137
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp160
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:214:     else if (string_equal(str, SUB_SYMBOL)) return OP_SUB;
	testb	%dl, %dl	 ; tmp160
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp138
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MUL_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp161
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	movl	$2, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:215:     else if (string_equal(str, MUL_SYMBOL)) return OP_MUL;
	testb	%dl, %dl	 ; tmp161
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp139
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; DIV_SYMBOL,
	call	string_equal	 ;
	movl	%eax, %edx	 ;, tmp162
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	movl	$3, %eax	 ;, <retval>
 ; D:\TC\src\helper.c:216:     else if (string_equal(str, DIV_SYMBOL)) return OP_DIV;
	testb	%dl, %dl	 ; tmp162
	jne	.L89	 ;,
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp140
	movq	%rbx, %rcx	 ; str,
	movq	(%rax), %rdx	 ; MOD_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\helper.c:217:     else if (string_equal(str, MOD_SYMBOL)) return OP_MOD;
	cmpb	$1, %al	 ;, _38
	sbbl	%eax, %eax	 ; <retval>
	andl	$15, %eax	 ;, <retval>
	addl	$4, %eax	 ;, <retval>
.L89:
 ; D:\TC\src\helper.c:219: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.globl	operator_precedence
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
operator_precedence:
 ; D:\TC\src\helper.c:221: int operator_precedence(OperatorType op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L111	 ;,
	movl	%ecx, %ecx	 ; op, op
	leaq	CSWTCH.50(%rip), %rax	 ;, tmp85
	movsbl	(%rax,%rcx), %eax	 ; CSWTCH.50[op_2(D)], <retval>
.L111:
 ; D:\TC\src\helper.c:251: }
	ret	
	.globl	operator_to_string
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
operator_to_string:
 ; D:\TC\src\helper.c:254:     switch (op) {
	xorl	%eax, %eax	 ; <retval>
	cmpl	$18, %ecx	 ;, op
	ja	.L114	 ;,
	leaq	.L117(%rip), %rdx	 ;, tmp85
	movl	%ecx, %ecx	 ; op, op
	movslq	(%rdx,%rcx,4), %rax	 ;, tmp87
	addq	%rdx, %rax	 ; tmp85, tmp88
	jmp	*%rax	 ; tmp88
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
 ; D:\TC\src\helper.c:255:         case OP_ASSIGN: return ASSIGN_SYMBOL;
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rax	 ;, tmp90
	jmp	.L137	 ;
.L121:
 ; D:\TC\src\helper.c:256:         case OP_ADD_ASSIGN: return ADD_ASSIGN_SYMBOL;
	movq	.refptr.ADD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp91
	jmp	.L137	 ;
.L120:
 ; D:\TC\src\helper.c:257:         case OP_SUB_ASSIGN: return SUB_ASSIGN_SYMBOL;
	movq	.refptr.SUB_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp92
	jmp	.L137	 ;
.L119:
 ; D:\TC\src\helper.c:258:         case OP_MUL_ASSIGN: return MUL_ASSIGN_SYMBOL;
	movq	.refptr.MUL_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp93
	jmp	.L137	 ;
.L118:
 ; D:\TC\src\helper.c:259:         case OP_DIV_ASSIGN: return DIV_ASSIGN_SYMBOL;
	movq	.refptr.DIV_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp94
	jmp	.L137	 ;
.L116:
 ; D:\TC\src\helper.c:260:         case OP_MOD_ASSIGN: return MOD_ASSIGN_SYMBOL;
	movq	.refptr.MOD_ASSIGN_SYMBOL(%rip), %rax	 ;, tmp95
	jmp	.L137	 ;
.L124:
 ; D:\TC\src\helper.c:261:         case OP_AND: return AND_SYMBOL;
	movq	.refptr.AND_SYMBOL(%rip), %rax	 ;, tmp96
	jmp	.L137	 ;
.L123:
 ; D:\TC\src\helper.c:262:         case OP_OR: return OR_SYMBOL;
	movq	.refptr.OR_SYMBOL(%rip), %rax	 ;, tmp97
	jmp	.L137	 ;
.L130:
 ; D:\TC\src\helper.c:263:         case OP_EQ: return EQ_SYMBOL;
	movq	.refptr.EQ_SYMBOL(%rip), %rax	 ;, tmp98
	jmp	.L137	 ;
.L129:
 ; D:\TC\src\helper.c:264:         case OP_NE: return NE_SYMBOL;
	movq	.refptr.NE_SYMBOL(%rip), %rax	 ;, tmp99
	jmp	.L137	 ;
.L128:
 ; D:\TC\src\helper.c:265:         case OP_LT: return LT_SYMBOL;
	movq	.refptr.LT_SYMBOL(%rip), %rax	 ;, tmp100
	jmp	.L137	 ;
.L127:
 ; D:\TC\src\helper.c:266:         case OP_GT: return GT_SYMBOL;
	movq	.refptr.GT_SYMBOL(%rip), %rax	 ;, tmp101
	jmp	.L137	 ;
.L126:
 ; D:\TC\src\helper.c:267:         case OP_LE: return LE_SYMBOL;
	movq	.refptr.LE_SYMBOL(%rip), %rax	 ;, tmp102
	jmp	.L137	 ;
.L125:
 ; D:\TC\src\helper.c:268:         case OP_GE: return GE_SYMBOL;
	movq	.refptr.GE_SYMBOL(%rip), %rax	 ;, tmp103
	jmp	.L137	 ;
.L135:
 ; D:\TC\src\helper.c:269:         case OP_ADD: return ADD_SYMBOL;
	movq	.refptr.ADD_SYMBOL(%rip), %rax	 ;, tmp104
	jmp	.L137	 ;
.L134:
 ; D:\TC\src\helper.c:270:         case OP_SUB: return SUB_SYMBOL;
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp105
	jmp	.L137	 ;
.L133:
 ; D:\TC\src\helper.c:271:         case OP_MUL: return MUL_SYMBOL;
	movq	.refptr.MUL_SYMBOL(%rip), %rax	 ;, tmp106
	jmp	.L137	 ;
.L132:
 ; D:\TC\src\helper.c:272:         case OP_DIV: return DIV_SYMBOL;
	movq	.refptr.DIV_SYMBOL(%rip), %rax	 ;, tmp107
	jmp	.L137	 ;
.L131:
 ; D:\TC\src\helper.c:273:         case OP_MOD: return MOD_SYMBOL;
	movq	.refptr.MOD_SYMBOL(%rip), %rax	 ;, tmp108
.L137:
	movq	(%rax), %rax	 ;, <retval>
.L114:
 ; D:\TC\src\helper.c:277: }
	ret	
	.section .rdata,"dr"
	.align 16
CSWTCH.50:
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
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
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
