	.file	"tac.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	create_attribute_table, @function
create_attribute_table:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	-8(%rbp), %rdx	; table, tmp86
	movq	%rax, (%rdx)	; _1, table_4->attributes
; src/tac.c:10:     table->name = name;
	movq	-8(%rbp), %rax	; table, tmp87
	movq	-24(%rbp), %rdx	; name, tmp88
	movq	%rdx, 8(%rax)	; tmp88, table_4->name
; src/tac.c:11:     table->size = 0;
	movq	-8(%rbp), %rax	; table, tmp89
	movq	$0, 16(%rax)	;, table_4->size
; src/tac.c:13:     return table;
	movq	-8(%rbp), %rax	; table, _10
; src/tac.c:14: }
	leave	
	ret	
	.size	create_attribute_table, .-create_attribute_table
	.section	.rodata
	.align 8
.LC0:
	.string	"[Warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; type, type
; src/tac.c:17:     size_t result = 8;
	movq	$8, -8(%rbp)	;, result
; src/tac.c:18:     if (type == NULL)
	cmpq	$0, -24(%rbp)	;, type
	jne	.L4	;,
; src/tac.c:19:         result = 0;
	movq	$0, -8(%rbp)	;, result
	jmp	.L5	;
.L4:
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	name_int(%rip), %rax	; name_int, name_int.0_1
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -24(%rbp)	; name_int.0_1, type
	je	.L6	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	name_float(%rip), %rax	; name_float, name_float.1_2
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -24(%rbp)	; name_float.1_2, type
	je	.L6	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	name_string(%rip), %rax	; name_string, name_string.2_3
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -24(%rbp)	; name_string.2_3, type
	jne	.L7	;,
.L6:
; src/tac.c:21:         result = 8;
	movq	$8, -8(%rbp)	;, result
	jmp	.L5	;
.L7:
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	name_bool(%rip), %rax	; name_bool, name_bool.3_4
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rax, -24(%rbp)	; name_bool.3_4, type
	je	.L8	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.4_5
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rax, -24(%rbp)	; name_void.4_5, type
	jne	.L9	;,
.L8:
; src/tac.c:23:         result = 1;
	movq	$1, -8(%rbp)	;, result
	jmp	.L5	;
.L9:
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movq	-24(%rbp), %rax	; type, tmp93
	movl	32(%rax), %eax	; type_13(D)->kind, _6
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _6
	jne	.L10	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	-24(%rbp), %rax	; type, tmp94
	movq	24(%rax), %rax	; type_13(D)->ast_node.class, _7
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	; _7->size, tmp95
	movq	%rax, -8(%rbp)	; tmp95, result
	jmp	.L5	;
.L10:
; src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	-24(%rbp), %rax	; type, tmp96
	movq	8(%rax), %rdx	; type_13(D)->name, _8
	movq	stderr(%rip), %rax	; stderr, stderr.5_9
	leaq	.LC0(%rip), %rcx	;, tmp97
	movq	%rcx, %rsi	; tmp97,
	movq	%rax, %rdi	; stderr.5_9,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L5:
; src/tac.c:29:     return result;
	movq	-8(%rbp), %rax	; result, _20
; src/tac.c:30: }
	leave	
	ret	
	.size	get_type_size, .-get_type_size
	.type	is_assignment_operator, @function
is_assignment_operator:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$13, -4(%rbp)	;, op
	je	.L13	;,
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$14, -4(%rbp)	;, op
	je	.L13	;,
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$15, -4(%rbp)	;, op
	je	.L13	;,
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$16, -4(%rbp)	;, op
	je	.L13	;,
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$17, -4(%rbp)	;, op
	je	.L13	;,
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$18, -4(%rbp)	;, op
	jne	.L14	;,
.L13:
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$1, %eax	;, iftmp.22_1
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	jmp	.L15	;
.L14:
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$0, %eax	;, iftmp.22_1
.L15:
; src/tac.c:33: }
	popq	%rbp	;
	ret	
	.size	is_assignment_operator, .-is_assignment_operator
	.type	get_instruction_type, @function
get_instruction_type:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; src/tac.c:35:     switch (op) {
	cmpl	$18, -4(%rbp)	;, op
	ja	.L18	;,
	movl	-4(%rbp), %eax	; op, tmp84
	leaq	0(,%rax,4), %rdx	;, tmp85
	leaq	.L20(%rip), %rax	;, tmp86
	movl	(%rdx,%rax), %eax	;, tmp87
	cltq
	leaq	.L20(%rip), %rdx	;, tmp90
	addq	%rdx, %rax	; tmp90, tmp89
	jmp	*%rax	; tmp89
	.section	.rodata
	.align 4
	.align 4
.L20:
	.long	.L24-.L20
	.long	.L23-.L20
	.long	.L22-.L20
	.long	.L21-.L20
	.long	.L19-.L20
	.long	.L33-.L20
	.long	.L32-.L20
	.long	.L31-.L20
	.long	.L30-.L20
	.long	.L29-.L20
	.long	.L28-.L20
	.long	.L27-.L20
	.long	.L26-.L20
	.long	.L25-.L20
	.long	.L24-.L20
	.long	.L23-.L20
	.long	.L22-.L20
	.long	.L21-.L20
	.long	.L19-.L20
	.text
.L24:
; src/tac.c:37:         case OP_ADD_ASSIGN: return INST_ADD;
	movl	$0, %eax	;, _1
	jmp	.L34	;
.L23:
; src/tac.c:39:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %eax	;, _1
	jmp	.L34	;
.L22:
; src/tac.c:41:         case OP_MUL_ASSIGN: return INST_MUL;
	movl	$2, %eax	;, _1
	jmp	.L34	;
.L21:
; src/tac.c:43:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %eax	;, _1
	jmp	.L34	;
.L19:
; src/tac.c:45:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %eax	;, _1
	jmp	.L34	;
.L25:
; src/tac.c:46:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %eax	;, _1
	jmp	.L34	;
.L33:
; src/tac.c:47:         case OP_EQ: return INST_EQ;
	movl	$5, %eax	;, _1
	jmp	.L34	;
.L32:
; src/tac.c:48:         case OP_NE: return INST_NE;
	movl	$6, %eax	;, _1
	jmp	.L34	;
.L31:
; src/tac.c:49:         case OP_LT: return INST_LT;
	movl	$7, %eax	;, _1
	jmp	.L34	;
.L30:
; src/tac.c:50:         case OP_GT: return INST_GT;
	movl	$8, %eax	;, _1
	jmp	.L34	;
.L29:
; src/tac.c:51:         case OP_LE: return INST_LE;
	movl	$9, %eax	;, _1
	jmp	.L34	;
.L28:
; src/tac.c:52:         case OP_GE: return INST_GE;
	movl	$10, %eax	;, _1
	jmp	.L34	;
.L27:
; src/tac.c:53:         case OP_AND: return INST_AND;
	movl	$11, %eax	;, _1
	jmp	.L34	;
.L26:
; src/tac.c:54:         case OP_OR: return INST_OR;
	movl	$12, %eax	;, _1
	jmp	.L34	;
.L18:
; src/tac.c:56:         default: return INST_NONE;
	movl	$25, %eax	;, _1
.L34:
; src/tac.c:58: }
	popq	%rbp	;
	ret	
	.size	get_instruction_type, .-get_instruction_type
	.type	create_tac, @function
create_tac:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
; src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, tac
; src/tac.c:62:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:62:     tac->attribute_tables = create_list();
	movq	-8(%rbp), %rdx	; tac, tmp88
	movq	%rax, (%rdx)	; _1, tac_6->attribute_tables
; src/tac.c:63:     tac->entry_point = NULL;
	movq	-8(%rbp), %rax	; tac, tmp89
	movq	$0, 8(%rax)	;, tac_6->entry_point
; src/tac.c:64:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:64:     tac->global_vars = create_list();
	movq	-8(%rbp), %rdx	; tac, tmp90
	movq	%rax, 16(%rdx)	; _2, tac_6->global_vars
; src/tac.c:65:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:65:     tac->subroutines = create_list();
	movq	-8(%rbp), %rdx	; tac, tmp91
	movq	%rax, 24(%rdx)	; _3, tac_6->subroutines
; src/tac.c:67:     return tac;
	movq	-8(%rbp), %rax	; tac, _14
; src/tac.c:68: }
	leave	
	ret	
	.size	create_tac, .-create_tac
	.type	create_tac_status, @function
create_tac_status:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; tac, tac
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, status
; src/tac.c:72:     status->tac = tac;
	movq	-8(%rbp), %rax	; status, tmp87
	movq	-24(%rbp), %rdx	; tac, tmp88
	movq	%rdx, (%rax)	; tmp88, status_5->tac
; src/tac.c:73:     status->current_subroutine = NULL;
	movq	-8(%rbp), %rax	; status, tmp89
	movq	$0, 8(%rax)	;, status_5->current_subroutine
; src/tac.c:74:     status->current_block = NULL;
	movq	-8(%rbp), %rax	; status, tmp90
	movq	$0, 16(%rax)	;, status_5->current_block
; src/tac.c:75:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:75:     status->end_labels = create_list();
	movq	-8(%rbp), %rdx	; status, tmp91
	movq	%rax, 32(%rdx)	; _1, status_5->end_labels
; src/tac.c:76:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:76:     status->start_labels = create_list();
	movq	-8(%rbp), %rdx	; status, tmp92
	movq	%rax, 40(%rdx)	; _2, status_5->start_labels
; src/tac.c:77:     status->attr_count = 0;
	movq	-8(%rbp), %rax	; status, tmp93
	movq	$0, 48(%rax)	;, status_5->attr_count
; src/tac.c:78:     status->param_count = 0;
	movq	-8(%rbp), %rax	; status, tmp94
	movq	$0, 56(%rax)	;, status_5->param_count
; src/tac.c:79:     status->var_count = 0;
	movq	-8(%rbp), %rax	; status, tmp95
	movq	$0, 64(%rax)	;, status_5->var_count
; src/tac.c:80:     status->temp_count = 0;
	movq	-8(%rbp), %rax	; status, tmp96
	movq	$0, 72(%rax)	;, status_5->temp_count
; src/tac.c:81:     status->block_count = 0;
	movq	-8(%rbp), %rax	; status, tmp97
	movq	$0, 80(%rax)	;, status_5->block_count
; src/tac.c:82:     status->subroutine_count = 0;
	movq	-8(%rbp), %rax	; status, tmp98
	movq	$0, 88(%rax)	;, status_5->subroutine_count
; src/tac.c:84:     return status;
	movq	-8(%rbp), %rax	; status, _20
; src/tac.c:85: }
	leave	
	ret	
	.size	create_tac_status, .-create_tac_status
	.type	create_subroutine, @function
create_subroutine:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; return_type, return_type
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, subroutine
; src/tac.c:89:     subroutine->name = name;
	movq	-8(%rbp), %rax	; subroutine, tmp88
	movq	-24(%rbp), %rdx	; name, tmp89
	movq	%rdx, (%rax)	; tmp89, subroutine_6->name
; src/tac.c:90:     subroutine->return_type = return_type;
	movq	-8(%rbp), %rax	; subroutine, tmp90
	movq	-32(%rbp), %rdx	; return_type, tmp91
	movq	%rdx, 8(%rax)	; tmp91, subroutine_6->return_type
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	-8(%rbp), %rdx	; subroutine, tmp92
	movq	%rax, 16(%rdx)	; _1, subroutine_6->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	-8(%rbp), %rdx	; subroutine, tmp93
	movq	%rax, 24(%rdx)	; _2, subroutine_6->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	-8(%rbp), %rdx	; subroutine, tmp94
	movq	%rax, 32(%rdx)	; _3, subroutine_6->blocks
; src/tac.c:95:     return subroutine;
	movq	-8(%rbp), %rax	; subroutine, _17
; src/tac.c:96: }
	leave	
	ret	
	.size	create_subroutine, .-create_subroutine
	.type	create_block, @function
create_block:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; label, label
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, block
; src/tac.c:100:     block->label = label;
	movq	-8(%rbp), %rax	; block, tmp86
	movq	-24(%rbp), %rdx	; label, tmp87
	movq	%rdx, (%rax)	; tmp87, block_4->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:101:     block->instructions = create_list();
	movq	-8(%rbp), %rdx	; block, tmp88
	movq	%rax, 8(%rdx)	; _1, block_4->instructions
; src/tac.c:103:     return block;
	movq	-8(%rbp), %rax	; block, _9
; src/tac.c:104: }
	leave	
	ret	
	.size	create_block, .-create_block
	.type	search_var, @function
search_var:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$96, %rsp	;,
	movq	%rdi, -88(%rbp)	; original_name, original_name
	movq	%rsi, -96(%rbp)	; status, status
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	-96(%rbp), %rax	; status, tmp118
	movq	8(%rax), %rax	; status_47(D)->current_subroutine, _1
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	; _1
	je	.L44	;,
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	-96(%rbp), %rax	; status, tmp119
	movq	8(%rax), %rax	; status_47(D)->current_subroutine, _2
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rax	; _2->local_vars, _3
	movq	%rax, %rdi	; _3,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	; _4
	jne	.L44	;,
; src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	-96(%rbp), %rax	; status, tmp120
	movq	8(%rax), %rax	; status_47(D)->current_subroutine, _5
; src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	24(%rax), %rax	; _5->local_vars, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp121, vars
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L45	;
.L47:
; src/tac.c:111:             if (var->original_name == original_name) {
	movq	-16(%rbp), %rax	; var, tmp122
	movq	(%rax), %rax	; var_52->original_name, _7
; src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	%rax, -88(%rbp)	; _7, original_name
	jne	.L45	;,
; src/tac.c:113:                 return var;
	movq	-16(%rbp), %rax	; var, _35
	jmp	.L46	;
.L45:
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	-8(%rbp), %rax	; vars, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp124, var
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	cmpq	$0, -16(%rbp)	;, var
	jne	.L47	;,
.L44:
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	-96(%rbp), %rax	; status, tmp125
	movq	8(%rax), %rax	; status_47(D)->current_subroutine, _8
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	; _8
	je	.L48	;,
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	-96(%rbp), %rax	; status, tmp126
	movq	8(%rax), %rax	; status_47(D)->current_subroutine, _9
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rax	; _9->parameters, _10
	movq	%rax, %rdi	; _10,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	; _11
	jne	.L48	;,
; src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	-96(%rbp), %rax	; status, tmp127
	movq	8(%rax), %rax	; status_47(D)->current_subroutine, _12
; src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	16(%rax), %rax	; _12->parameters, _13
	movq	%rax, %rdi	; _13,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp128, vars
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L49	;
.L50:
; src/tac.c:121:             if (var->original_name == original_name) {
	movq	-32(%rbp), %rax	; var, tmp129
	movq	(%rax), %rax	; var_59->original_name, _14
; src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	%rax, -88(%rbp)	; _14, original_name
	jne	.L49	;,
; src/tac.c:123:                 return var;
	movq	-32(%rbp), %rax	; var, _35
	jmp	.L46	;
.L49:
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	-24(%rbp), %rax	; vars, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp131, var
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	cmpq	$0, -32(%rbp)	;, var
	jne	.L50	;,
.L48:
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	-96(%rbp), %rax	; status, tmp132
	movq	24(%rax), %rax	; status_47(D)->current_class, _15
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testq	%rax, %rax	; _15
	je	.L51	;,
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	-96(%rbp), %rax	; status, tmp133
	movq	(%rax), %rax	; status_47(D)->tac, _16
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rax	; _16->attribute_tables, _17
	movq	%rax, %rdi	; _17,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	; _18
	jne	.L51	;,
; src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	-96(%rbp), %rax	; status, tmp134
	movq	(%rax), %rax	; status_47(D)->tac, _19
; src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rax), %rax	; _19->attribute_tables, _20
	movq	%rax, %rdi	; _20,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp135, tables
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	jmp	.L53	;
.L57:
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	-48(%rbp), %rax	; table, tmp136
	movq	8(%rax), %rdx	; table_65->name, _21
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	-96(%rbp), %rax	; status, tmp137
	movq	24(%rax), %rax	; status_47(D)->current_class, _22
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	; _22->name, _23
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	cmpq	%rax, %rdx	; _23, _21
	jne	.L53	;,
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	-48(%rbp), %rax	; table, tmp138
	movq	(%rax), %rax	; table_65->attributes, _24
	movq	%rax, %rdi	; _24,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	; _25
	jne	.L53	;,
; src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	-48(%rbp), %rax	; table, tmp139
	movq	(%rax), %rax	; table_65->attributes, _26
	movq	%rax, %rdi	; _26,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp140, attributes
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	jmp	.L55	;
.L56:
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	-64(%rbp), %rax	; attr, tmp141
	movq	(%rax), %rax	; attr_70->var, _27
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rax	; _27->original_name, _28
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	%rax, -88(%rbp)	; _28, original_name
	jne	.L55	;,
; src/tac.c:137:                         return attr->var;
	movq	-64(%rbp), %rax	; attr, tmp142
	movq	(%rax), %rax	; attr_70->var, _35
	jmp	.L46	;
.L55:
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	-56(%rbp), %rax	; attributes, tmp143
	movq	%rax, %rdi	; tmp143,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp144, attr
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	cmpq	$0, -64(%rbp)	;, attr
	jne	.L56	;,
.L53:
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	-40(%rbp), %rax	; tables, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp146, table
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	cmpq	$0, -48(%rbp)	;, table
	jne	.L57	;,
.L51:
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	-96(%rbp), %rax	; status, tmp147
	movq	(%rax), %rax	; status_47(D)->tac, _29
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	16(%rax), %rax	; _29->global_vars, _30
	movq	%rax, %rdi	; _30,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	; _31
	jne	.L58	;,
; src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	-96(%rbp), %rax	; status, tmp148
	movq	(%rax), %rax	; status_47(D)->tac, _32
; src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	16(%rax), %rax	; _32->global_vars, _33
	movq	%rax, %rdi	; _33,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp149, vars
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L59	;
.L60:
; src/tac.c:146:             if (var->original_name == original_name) {
	movq	-80(%rbp), %rax	; var, tmp150
	movq	(%rax), %rax	; var_76->original_name, _34
; src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	%rax, -88(%rbp)	; _34, original_name
	jne	.L59	;,
; src/tac.c:148:                 return var;
	movq	-80(%rbp), %rax	; var, _35
	jmp	.L46	;
.L59:
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	-72(%rbp), %rax	; vars, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp152, var
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	cmpq	$0, -80(%rbp)	;, var
	jne	.L60	;,
.L58:
; src/tac.c:153:     return NULL;
	movl	$0, %eax	;, _35
.L46:
; src/tac.c:154: }
	leave	
	ret	
	.size	search_var, .-search_var
	.section	.rodata
.LC1:
	.string	""
.LC2:
	.string	"$%d-error"
.LC3:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; original_name, original_name
	movq	%rsi, -48(%rbp)	; type, type
	movl	%edx, -52(%rbp)	; kind, kind
	movq	%rcx, -64(%rbp)	; status, status
; src/tac.c:157:     if (original_name != NULL) {
	cmpq	$0, -40(%rbp)	;, original_name
	je	.L62	;,
; src/tac.c:158:         Class* current_class = NULL;
	movq	$0, -8(%rbp)	;, current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movq	-48(%rbp), %rax	; type, tmp104
	movl	32(%rax), %eax	; type_40(D)->kind, _1
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _1
	jne	.L63	;,
; src/tac.c:160:             current_class = status->current_class;
	movq	-64(%rbp), %rax	; status, tmp105
	movq	24(%rax), %rax	; status_41(D)->current_class, tmp106
	movq	%rax, -8(%rbp)	; tmp106, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	-48(%rbp), %rax	; type, tmp107
	movq	24(%rax), %rdx	; type_40(D)->ast_node.class, _2
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	-64(%rbp), %rax	; status, tmp108
	movq	%rdx, 24(%rax)	; _2, status_41(D)->current_class
.L63:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	-64(%rbp), %rdx	; status, tmp109
	movq	-40(%rbp), %rax	; original_name, tmp110
	movq	%rdx, %rsi	; tmp109,
	movq	%rax, %rdi	; tmp110,
	call	search_var	;
	movq	%rax, -24(%rbp)	; tmp111, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movq	-48(%rbp), %rax	; type, tmp112
	movl	32(%rax), %eax	; type_40(D)->kind, _3
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _3
	jne	.L64	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	-64(%rbp), %rax	; status, tmp113
	movq	-8(%rbp), %rdx	; current_class, tmp114
	movq	%rdx, 24(%rax)	; tmp114, status_41(D)->current_class
.L64:
; src/tac.c:166:         if (var != NULL) {
	cmpq	$0, -24(%rbp)	;, var
	je	.L62	;,
; src/tac.c:168:             return var;
	movq	-24(%rbp), %rax	; var, _29
	jmp	.L65	;
.L62:
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp115, var
; src/tac.c:172:     var->original_name = original_name;
	movq	-32(%rbp), %rax	; var, tmp116
	movq	-40(%rbp), %rdx	; original_name, tmp117
	movq	%rdx, (%rax)	; tmp117, var_49->original_name
; src/tac.c:174:     switch (kind) {
	movl	-52(%rbp), %eax	; kind, tmp119
	subl	$97, %eax	;, tmp118
	cmpl	$21, %eax	;, tmp118
	ja	.L66	;,
	movl	%eax, %eax	; tmp118, tmp120
	leaq	0(,%rax,4), %rdx	;, tmp121
	leaq	.L68(%rip), %rax	;, tmp122
	movl	(%rdx,%rax), %eax	;, tmp123
	cltq
	leaq	.L68(%rip), %rdx	;, tmp126
	addq	%rdx, %rax	; tmp126, tmp125
	jmp	*%rax	; tmp125
	.section	.rodata
	.align 4
	.align 4
.L68:
	.long	.L73-.L68
	.long	.L72-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L71-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L70-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L66-.L68
	.long	.L69-.L68
	.long	.L66-.L68
	.long	.L67-.L68
	.text
.L73:
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	-64(%rbp), %rax	; status, tmp127
	movq	48(%rax), %rax	; status_41(D)->attr_count, _4
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rax), %rcx	;, _6
	movq	-64(%rbp), %rdx	; status, tmp128
	movq	%rcx, 48(%rdx)	; _6, status_41(D)->attr_count
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	%rax, -16(%rbp)	; _4, id
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L74	;
.L70:
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	-64(%rbp), %rax	; status, tmp129
	movq	56(%rax), %rax	; status_41(D)->param_count, _7
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rax), %rcx	;, _9
	movq	-64(%rbp), %rdx	; status, tmp130
	movq	%rcx, 56(%rdx)	; _9, status_41(D)->param_count
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	%rax, -16(%rbp)	; _7, id
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L74	;
.L67:
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	-64(%rbp), %rax	; status, tmp131
	movq	64(%rax), %rax	; status_41(D)->var_count, _10
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rax), %rcx	;, _12
	movq	-64(%rbp), %rdx	; status, tmp132
	movq	%rcx, 64(%rdx)	; _12, status_41(D)->var_count
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	%rax, -16(%rbp)	; _10, id
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L74	;
.L69:
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	-64(%rbp), %rax	; status, tmp133
	movq	72(%rax), %rax	; status_41(D)->temp_count, _13
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rax), %rcx	;, _15
	movq	-64(%rbp), %rdx	; status, tmp134
	movq	%rcx, 72(%rdx)	; _15, status_41(D)->temp_count
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	%rax, -16(%rbp)	; _13, id
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L74	;
.L72:
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	-64(%rbp), %rax	; status, tmp135
	movq	80(%rax), %rax	; status_41(D)->block_count, _16
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rax), %rcx	;, _18
	movq	-64(%rbp), %rdx	; status, tmp136
	movq	%rcx, 80(%rdx)	; _18, status_41(D)->block_count
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	%rax, -16(%rbp)	; _16, id
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L74	;
.L71:
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	-64(%rbp), %rax	; status, tmp137
	movq	88(%rax), %rax	; status_41(D)->subroutine_count, _19
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rax), %rcx	;, _21
	movq	-64(%rbp), %rdx	; status, tmp138
	movq	%rcx, 88(%rdx)	; _21, status_41(D)->subroutine_count
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	%rax, -16(%rbp)	; _19, id
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L74	;
.L66:
; src/tac.c:181:         default: id = (size_t)-1; break;
	movq	$-1, -16(%rbp)	;, id
; src/tac.c:181:         default: id = (size_t)-1; break;
	nop	
.L74:
; src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	-32(%rbp), %rdx	; var, tmp140
	movq	%rax, 8(%rdx)	; _22, var_49->name
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, -16(%rbp)	;, id
	jne	.L75	;,
; src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movq	-32(%rbp), %rax	; var, tmp141
	movq	8(%rax), %rax	; var_49->name, _23
	movl	-52(%rbp), %edx	; kind, tmp142
	leaq	.LC2(%rip), %rcx	;, tmp143
	movq	%rcx, %rsi	; tmp143,
	movq	%rax, %rdi	; _23,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
	jmp	.L76	;
.L75:
; src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	-32(%rbp), %rax	; var, tmp144
	movq	8(%rax), %rax	; var_49->name, _24
	movq	-16(%rbp), %rcx	; id, tmp145
	movl	-52(%rbp), %edx	; kind, tmp146
	leaq	.LC3(%rip), %rsi	;, tmp147
	movq	%rax, %rdi	; _24,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
.L76:
; src/tac.c:188:     var->type = type;
	movq	-32(%rbp), %rax	; var, tmp148
	movq	-48(%rbp), %rdx	; type, tmp149
	movq	%rdx, 16(%rax)	; tmp149, var_49->type
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, -52(%rbp)	;, kind
	je	.L77	;,
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$118, -52(%rbp)	;, kind
	jne	.L78	;,
.L77:
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	-64(%rbp), %rax	; status, tmp150
	movq	8(%rax), %rax	; status_41(D)->current_subroutine, _25
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rax	; _25->local_vars, _26
	movq	-32(%rbp), %rdx	; var, tmp151
	movq	%rdx, %rsi	; tmp151,
	movq	%rax, %rdi	; _26,
	call	*list_append@GOTPCREL(%rip)	;
.L78:
; src/tac.c:192:     return var;
	movq	-32(%rbp), %rax	; var, _29
.L65:
; src/tac.c:193: }
	leave	
	ret	
	.size	create_var, .-create_var
	.section	.rodata
	.align 8
.LC4:
	.string	"Error: create_attribute received NULL table\n"
	.align 8
.LC5:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.type	create_attribute, @function
create_attribute:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -24(%rbp)	; var, var
	movq	%rsi, -32(%rbp)	; type, type
	movq	%rdx, -40(%rbp)	; table, table
	movq	%rcx, -48(%rbp)	; offset, offset
	movq	%r8, -56(%rbp)	; status, status
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp93, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	-56(%rbp), %rdx	; status, tmp94
	movq	-32(%rbp), %rsi	; type, tmp95
	movq	-24(%rbp), %rax	; var, tmp96
	movq	%rdx, %rcx	; tmp94,
	movl	$97, %edx	;,
	movq	%rax, %rdi	; tmp96,
	call	create_var	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	-8(%rbp), %rdx	; attr, tmp97
	movq	%rax, (%rdx)	; _1, attr_13->var
; src/tac.c:198:     attr->type = type;
	movq	-8(%rbp), %rax	; attr, tmp98
	movq	-32(%rbp), %rdx	; type, tmp99
	movq	%rdx, 8(%rax)	; tmp99, attr_13->type
; src/tac.c:199:     attr->offset = offset;
	movq	-8(%rbp), %rax	; attr, tmp100
	movq	-48(%rbp), %rdx	; offset, tmp101
	movq	%rdx, 16(%rax)	; tmp101, attr_13->offset
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	cmpq	$0, -48(%rbp)	;, offset
	jne	.L80	;,
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	cmpq	$0, -40(%rbp)	;, table
	je	.L80	;,
; src/tac.c:201:         attr->offset = table->size;
	movq	-40(%rbp), %rax	; table, tmp102
	movq	16(%rax), %rdx	; table_22(D)->size, _2
; src/tac.c:201:         attr->offset = table->size;
	movq	-8(%rbp), %rax	; attr, tmp103
	movq	%rdx, 16(%rax)	; _2, attr_13->offset
; src/tac.c:202:         table->size += get_type_size(type);
	movq	-32(%rbp), %rax	; type, tmp104
	movq	%rax, %rdi	; tmp104,
	call	get_type_size	;
; src/tac.c:202:         table->size += get_type_size(type);
	movq	-40(%rbp), %rdx	; table, tmp105
	movq	16(%rdx), %rdx	; table_22(D)->size, _3
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, %rdx	; _25, _4
	movq	-40(%rbp), %rax	; table, tmp106
	movq	%rdx, 16(%rax)	; _4, table_22(D)->size
; src/tac.c:202:         table->size += get_type_size(type);
	jmp	.L81	;
.L80:
; src/tac.c:203:     } else if (table == NULL)
	cmpq	$0, -40(%rbp)	;, table
	jne	.L81	;,
; src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movq	stderr(%rip), %rax	; stderr, stderr.6_5
	movq	%rax, %rcx	; stderr.6_5,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*fwrite@GOTPCREL(%rip)	;
.L81:
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, -40(%rbp)	;, table
	je	.L82	;,
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	-40(%rbp), %rax	; table, tmp108
	movq	(%rax), %rax	; table_22(D)->attributes, _6
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	; _6
	jne	.L83	;,
.L82:
; src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	stderr(%rip), %rax	; stderr, stderr.7_7
	movq	%rax, %rcx	; stderr.7_7,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L84	;
.L83:
; src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	-40(%rbp), %rax	; table, tmp110
	movq	(%rax), %rax	; table_22(D)->attributes, _8
	movq	-8(%rbp), %rdx	; attr, tmp111
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; _8,
	call	*list_append@GOTPCREL(%rip)	;
.L84:
; src/tac.c:210:     return attr;
	movq	-8(%rbp), %rax	; attr, _30
; src/tac.c:211: }
	leave	
	ret	
	.size	create_attribute, .-create_attribute
	.type	create_instruction, @function
create_instruction:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; arg1, arg1
	movq	%rdx, -40(%rbp)	; arg2, arg2
	movq	%rcx, -48(%rbp)	; arg3, arg3
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, inst
; src/tac.c:215:     inst->type = type;
	movq	-8(%rbp), %rax	; inst, tmp85
	movl	-20(%rbp), %edx	; type, tmp86
	movl	%edx, 24(%rax)	; tmp86, inst_3->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	-8(%rbp), %rax	; inst, tmp87
	movq	-32(%rbp), %rdx	; arg1, tmp88
	movq	%rdx, (%rax)	; tmp88, inst_3->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	-8(%rbp), %rax	; inst, tmp89
	movq	-40(%rbp), %rdx	; arg2, tmp90
	movq	%rdx, 8(%rax)	; tmp90, inst_3->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	-8(%rbp), %rax	; inst, tmp91
	movq	-48(%rbp), %rdx	; arg3, tmp92
	movq	%rdx, 16(%rax)	; tmp92, inst_3->arg3
; src/tac.c:220:     return inst;
	movq	-8(%rbp), %rax	; inst, _12
; src/tac.c:221: }
	leave	
	ret	
	.size	create_instruction, .-create_instruction
	.section	.rodata
	.align 8
.LC6:
	.string	"[Warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movl	%edi, -20(%rbp)	; kind, kind
	movq	%rsi, -32(%rbp)	; value, value
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp97, arg
; src/tac.c:225:     arg->kind = kind;
	movq	-8(%rbp), %rax	; arg, tmp98
	movl	-20(%rbp), %edx	; kind, tmp99
	movl	%edx, 16(%rax)	; tmp99, arg_17->kind
; src/tac.c:226:     arg->type = NULL;
	movq	-8(%rbp), %rax	; arg, tmp100
	movq	$0, 8(%rax)	;, arg_17->type
; src/tac.c:227:     switch (kind) {
	cmpl	$8, -20(%rbp)	;, kind
	ja	.L89	;,
	movl	-20(%rbp), %eax	; kind, tmp101
	leaq	0(,%rax,4), %rdx	;, tmp102
	leaq	.L91(%rip), %rax	;, tmp103
	movl	(%rdx,%rax), %eax	;, tmp104
	cltq
	leaq	.L91(%rip), %rdx	;, tmp107
	addq	%rdx, %rax	; tmp107, tmp106
	jmp	*%rax	; tmp106
	.section	.rodata
	.align 4
	.align 4
.L91:
	.long	.L98-.L91
	.long	.L97-.L91
	.long	.L96-.L91
	.long	.L95-.L91
	.long	.L94-.L91
	.long	.L93-.L91
	.long	.L92-.L91
	.long	.L90-.L91
	.long	.L90-.L91
	.text
.L98:
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp108
	movq	-32(%rbp), %rdx	; value, tmp109
	movq	%rdx, (%rax)	; tmp109, arg_17->value.variable
; src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	; arg, tmp110
	movq	(%rax), %rax	; arg_17->value.variable, _1
; src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	16(%rax), %rdx	; _1->type, _2
; src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	; arg, tmp111
	movq	%rdx, 8(%rax)	; _2, arg_17->type
; src/tac.c:231:             break;
	jmp	.L99	;
.L97:
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	-32(%rbp), %rax	; value, tmp112
	movq	(%rax), %rdx	; MEM[(long long int *)value_21(D)], _3
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	-8(%rbp), %rax	; arg, tmp113
	movq	%rdx, (%rax)	; _3, arg_17->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rdx	; name_int, name_int.8_4
	movq	-8(%rbp), %rax	; arg, tmp114
	movq	%rdx, 8(%rax)	; name_int.8_4, arg_17->type
; src/tac.c:235:             break;
	jmp	.L99	;
.L96:
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	-32(%rbp), %rax	; value, tmp115
	movsd	(%rax), %xmm0	; MEM[(double *)value_21(D)], _5
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	-8(%rbp), %rax	; arg, tmp116
	movsd	%xmm0, (%rax)	; _5, arg_17->value.float_value
; src/tac.c:238:             arg->type = name_float;
	movq	name_float(%rip), %rdx	; name_float, name_float.9_6
	movq	-8(%rbp), %rax	; arg, tmp117
	movq	%rdx, 8(%rax)	; name_float.9_6, arg_17->type
; src/tac.c:239:             break;
	jmp	.L99	;
.L95:
; src/tac.c:241:             arg->value.string_value = (string)value;
	movq	-8(%rbp), %rax	; arg, tmp118
	movq	-32(%rbp), %rdx	; value, tmp119
	movq	%rdx, (%rax)	; tmp119, arg_17->value.string_value
; src/tac.c:242:             arg->type = name_string;
	movq	name_string(%rip), %rdx	; name_string, name_string.10_7
	movq	-8(%rbp), %rax	; arg, tmp120
	movq	%rdx, 8(%rax)	; name_string.10_7, arg_17->type
; src/tac.c:243:             break;
	jmp	.L99	;
.L94:
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movq	-32(%rbp), %rax	; value, tmp121
	movzbl	(%rax), %edx	; MEM[(char *)value_21(D)], _8
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movq	-8(%rbp), %rax	; arg, tmp122
	movb	%dl, (%rax)	; _8, arg_17->value.bool_value
; src/tac.c:246:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	; name_bool, name_bool.11_9
	movq	-8(%rbp), %rax	; arg, tmp123
	movq	%rdx, 8(%rax)	; name_bool.11_9, arg_17->type
; src/tac.c:247:             break;
	jmp	.L99	;
.L93:
; src/tac.c:249:             arg->value.string_value = NULL;
	movq	-8(%rbp), %rax	; arg, tmp124
	movq	$0, (%rax)	;, arg_17->value.string_value
; src/tac.c:250:             arg->type = name_void;
	movq	name_void(%rip), %rdx	; name_void, name_void.12_10
	movq	-8(%rbp), %rax	; arg, tmp125
	movq	%rdx, 8(%rax)	; name_void.12_10, arg_17->type
; src/tac.c:251:             break;
	jmp	.L99	;
.L92:
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp126
	movq	-32(%rbp), %rdx	; value, tmp127
	movq	%rdx, (%rax)	; tmp127, arg_17->value.label
; src/tac.c:254:             break;
	jmp	.L99	;
.L90:
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp128
	movq	-32(%rbp), %rdx	; value, tmp129
	movq	%rdx, (%rax)	; tmp129, arg_17->value.subroutine
; src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	; arg, tmp130
	movq	(%rax), %rax	; arg_17->value.subroutine, _11
; src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	16(%rax), %rdx	; _11->type, _12
; src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	; arg, tmp131
	movq	%rdx, 8(%rax)	; _12, arg_17->type
; src/tac.c:259:             break;
	jmp	.L99	;
.L89:
; src/tac.c:262:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.13_13
	movl	-20(%rbp), %edx	; kind, tmp132
	leaq	.LC6(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.13_13,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:263:             break;
	nop	
.L99:
; src/tac.c:265:     arg->is_get = false;
	movq	-8(%rbp), %rax	; arg, tmp134
	movb	$0, 20(%rax)	;, arg_17->is_get
; src/tac.c:267:     return arg;
	movq	-8(%rbp), %rax	; arg, _39
; src/tac.c:268: }
	leave	
	ret	
	.size	create_arg, .-create_arg
	.type	load_rvalue, @function
load_rvalue:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; arg, arg
	movq	%rsi, -32(%rbp)	; status, status
; src/tac.c:271:     if (arg == NULL) {
	cmpq	$0, -24(%rbp)	;, arg
	jne	.L102	;,
; src/tac.c:273:         return NULL;
	movl	$0, %eax	;, _7
	jmp	.L103	;
.L102:
; src/tac.c:275:     if (arg->is_get) {
	movq	-24(%rbp), %rax	; arg, tmp90
	movzbl	20(%rax), %eax	; arg_9(D)->is_get, _1
; src/tac.c:275:     if (arg->is_get) {
	testb	%al, %al	; _1
	je	.L104	;,
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	-24(%rbp), %rax	; arg, tmp91
	movq	8(%rax), %rax	; arg_9(D)->type, _2
	movq	-32(%rbp), %rdx	; status, tmp92
	movq	%rdx, %rcx	; tmp92,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _2,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _3,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp93, temp
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	-24(%rbp), %rdx	; arg, tmp94
	movq	-8(%rbp), %rax	; temp, tmp95
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp95,
	movl	$23, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _4
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	-32(%rbp), %rax	; status, tmp96
	movq	16(%rax), %rax	; status_12(D)->current_block, _5
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	%rdx, %rsi	; _4,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:279:         return temp;
	movq	-8(%rbp), %rax	; temp, _7
	jmp	.L103	;
.L104:
; src/tac.c:282:     return arg;
	movq	-24(%rbp), %rax	; arg, _7
.L103:
; src/tac.c:283: }
	leave	
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata
.LC7:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; code, code
; src/tac.c:287:     TAC* tac = create_tac();
	call	create_tac	;
	movq	%rax, -8(%rbp)	; tmp97, tac
; src/tac.c:288:     TACStatus* status = create_tac_status(tac);
	movq	-8(%rbp), %rax	; tac, tmp98
	movq	%rax, %rdi	; tmp98,
	call	create_tac_status	;
	movq	%rax, -16(%rbp)	; tmp99, status
; src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	-40(%rbp), %rax	; code, tmp100
	movq	(%rax), %rax	; code_20(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp101, members
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L106	;
.L110:
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movq	-32(%rbp), %rax	; code_member, tmp102
	movl	8(%rax), %eax	; code_member_24->type, _2
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	jne	.L107	;,
; src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	-32(%rbp), %rax	; code_member, tmp103
	movq	(%rax), %rax	; code_member_24->content.function, _3
	movq	-16(%rbp), %rdx	; status, tmp104
	movq	%rdx, %rsi	; tmp104,
	movq	%rax, %rdi	; _3,
	call	tac_function	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	-32(%rbp), %rax	; code_member, tmp105
	movq	(%rax), %rax	; code_member_24->content.function, _4
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rax	; _4->name, _5
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rax), %rax	; _5->name, _6
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC7(%rip), %rdx	;, tmp106
	movq	%rdx, %rsi	; tmp106,
	movq	%rax, %rdi	; _6,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; _7
	jne	.L106	;,
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	-32(%rbp), %rax	; code_member, tmp107
	movq	(%rax), %rax	; code_member_24->content.function, _8
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	(%rax), %rdx	; _8->name, _9
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	-8(%rbp), %rax	; tac, tmp108
	movq	%rdx, 8(%rax)	; _9, tac_17->entry_point
	jmp	.L106	;
.L107:
; src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	movq	-32(%rbp), %rax	; code_member, tmp109
	movl	8(%rax), %eax	; code_member_24->type, _10
; src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _10
	jne	.L109	;,
; src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	-32(%rbp), %rax	; code_member, tmp110
	movq	(%rax), %rax	; code_member_24->content.class, _11
	movq	-16(%rbp), %rdx	; status, tmp111
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; _11,
	call	tac_class	;
	jmp	.L106	;
.L109:
; src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	movq	-32(%rbp), %rax	; code_member, tmp112
	movl	8(%rax), %eax	; code_member_24->type, _12
; src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _12
	jne	.L106	;,
; src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	-32(%rbp), %rax	; code_member, tmp113
	movq	(%rax), %rax	; code_member_24->content.import, _13
	movq	-16(%rbp), %rdx	; status, tmp114
	movq	-8(%rbp), %rcx	; tac, tmp115
	movq	%rcx, %rsi	; tmp115,
	movq	%rax, %rdi	; _13,
	call	tac_import	;
.L106:
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	; members, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp117, code_member
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	cmpq	$0, -32(%rbp)	;, code_member
	jne	.L110	;,
; src/tac.c:303:     return tac;
	movq	-8(%rbp), %rax	; tac, _25
; src/tac.c:304: }
	leave	
	ret	
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 8
.LC8:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; import, import
	movq	%rsi, -16(%rbp)	; tac, tac
	movq	%rdx, -24(%rbp)	; status, status
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	-8(%rbp), %rax	; import, tmp105
	movq	(%rax), %rax	; import_26(D)->name, _1
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rax), %eax	; _1->kind, _2
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	;, _2
	jne	.L113	;,
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	-8(%rbp), %rax	; import, tmp106
	movq	(%rax), %rax	; import_26(D)->name, _3
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rax), %rsi	; _3->type, _4
	movq	-8(%rbp), %rax	; import, tmp107
	movq	(%rax), %rax	; import_26(D)->name, _5
	movq	-24(%rbp), %rdx	; status, tmp108
	movq	%rdx, %rcx	; tmp108,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _5,
	call	create_var	;
	movq	%rax, %rdx	;, _6
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	-16(%rbp), %rax	; tac, tmp109
	movq	16(%rax), %rax	; tac_31(D)->global_vars, _7
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; _7,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:317: }
	jmp	.L118	;
.L113:
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	-8(%rbp), %rax	; import, tmp110
	movq	(%rax), %rax	; import_26(D)->name, _8
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	; _8->kind, _9
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, _9
	je	.L115	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	-8(%rbp), %rax	; import, tmp111
	movq	(%rax), %rax	; import_26(D)->name, _10
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	; _10->kind, _11
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _11
	jne	.L116	;,
.L115:
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	-8(%rbp), %rax	; import, tmp112
	movq	(%rax), %rax	; import_26(D)->name, _12
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; _12->type, _13
	movq	-8(%rbp), %rax	; import, tmp113
	movq	(%rax), %rax	; import_26(D)->name, _14
	movq	-24(%rbp), %rdx	; status, tmp114
	movq	%rdx, %rcx	; tmp114,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; _14,
	call	create_var	;
	movq	%rax, %rdx	;, _15
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	-16(%rbp), %rax	; tac, tmp115
	movq	16(%rax), %rax	; tac_31(D)->global_vars, _16
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:317: }
	jmp	.L118	;
.L116:
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	movq	-8(%rbp), %rax	; import, tmp116
	movq	(%rax), %rax	; import_26(D)->name, _17
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _17->kind, _18
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _18
	jne	.L117	;,
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	-8(%rbp), %rax	; import, tmp117
	movq	(%rax), %rax	; import_26(D)->name, _19
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rax), %rax	; _19->ast_node.class, _20
	movq	-24(%rbp), %rdx	; status, tmp118
	movq	%rdx, %rsi	; tmp118,
	movq	%rax, %rdi	; _20,
	call	tac_class	;
; src/tac.c:317: }
	jmp	.L118	;
.L117:
; src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	-8(%rbp), %rax	; import, tmp119
	movq	(%rax), %rax	; import_26(D)->name, _21
; src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	32(%rax), %edx	; _21->kind, _22
; src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	stderr(%rip), %rax	; stderr, stderr.14_23
	leaq	.LC8(%rip), %rcx	;, tmp120
	movq	%rcx, %rsi	; tmp120,
	movq	%rax, %rdi	; stderr.14_23,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L118:
; src/tac.c:317: }
	nop	
	leave	
	ret	
	.size	tac_import, .-tac_import
	.globl	tac_function
	.type	tac_function, @function
tac_function:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; function, function
	movq	%rsi, -64(%rbp)	; status, status
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	-56(%rbp), %rax	; function, tmp94
	movq	8(%rax), %rdx	; function_16(D)->return_type, _1
	movq	-56(%rbp), %rax	; function, tmp95
	movq	(%rax), %rax	; function_16(D)->name, _2
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; _2,
	call	create_subroutine	;
	movq	%rax, -8(%rbp)	; tmp96, subroutine
; src/tac.c:322:     status->current_subroutine = subroutine;
	movq	-64(%rbp), %rax	; status, tmp97
	movq	-8(%rbp), %rdx	; subroutine, tmp98
	movq	%rdx, 8(%rax)	; tmp98, status_19(D)->current_subroutine
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	-64(%rbp), %rax	; status, tmp99
	movq	(%rax), %rax	; status_19(D)->tac, _3
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	; _3->subroutines, _4
	movq	-8(%rbp), %rdx	; subroutine, tmp100
	movq	%rdx, %rsi	; tmp100,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	-56(%rbp), %rax	; function, tmp101
	movq	16(%rax), %rax	; function_16(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, parameters
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L120	;
.L121:
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-24(%rbp), %rax	; parameter, tmp103
	movq	(%rax), %rsi	; parameter_25->type, _6
	movq	-24(%rbp), %rax	; parameter, tmp104
	movq	8(%rax), %rax	; parameter_25->name, _7
	movq	-64(%rbp), %rdx	; status, tmp105
	movq	%rdx, %rcx	; tmp105,
	movl	$112, %edx	;,
	movq	%rax, %rdi	; _7,
	call	create_var	;
	movq	%rax, %rdx	;, _8
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	; subroutine, tmp106
	movq	16(%rax), %rax	; subroutine_18->parameters, _9
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
.L120:
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	; parameters, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, parameter
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	;, parameter
	jne	.L121	;,
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	-64(%rbp), %rax	; status, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	; _10,
	call	create_block	;
	movq	%rax, -32(%rbp)	; tmp110, block
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	; subroutine, tmp111
	movq	32(%rax), %rax	; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	; block, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:332:     status->current_block = block;
	movq	-64(%rbp), %rax	; status, tmp113
	movq	-32(%rbp), %rdx	; block, tmp114
	movq	%rdx, 16(%rax)	; tmp114, status_19(D)->current_block
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	-56(%rbp), %rax	; function, tmp115
	movq	24(%rax), %rax	; function_16(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp116, statements
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L122	;
.L123:
; src/tac.c:337:         tac_statement(statement, status);
	movq	-64(%rbp), %rdx	; status, tmp117
	movq	-48(%rbp), %rax	; statement, tmp118
	movq	%rdx, %rsi	; tmp117,
	movq	%rax, %rdi	; tmp118,
	call	tac_statement	;
.L122:
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	; statements, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp120, statement
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L123	;,
; src/tac.c:339:     status->current_subroutine = NULL;
	movq	-64(%rbp), %rax	; status, tmp121
	movq	$0, 8(%rax)	;, status_19(D)->current_subroutine
; src/tac.c:341: }
	nop	
	leave	
	ret	
	.size	tac_function, .-tac_function
	.section	.rodata
	.align 8
.LC9:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$88, %rsp	;,
	movq	%rdi, -88(%rbp)	; method, method
	movq	%rsi, -96(%rbp)	; status, status
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	-88(%rbp), %rax	; method, tmp126
	movq	8(%rax), %rdx	; method_50(D)->return_type, _1
	movq	-88(%rbp), %rax	; method, tmp127
	movq	(%rax), %rax	; method_50(D)->name, _2
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; _2,
	call	create_subroutine	;
	movq	%rax, -24(%rbp)	; tmp128, subroutine
; src/tac.c:346:     status->current_subroutine = subroutine;
	movq	-96(%rbp), %rax	; status, tmp129
	movq	-24(%rbp), %rdx	; subroutine, tmp130
	movq	%rdx, 8(%rax)	; tmp130, status_53(D)->current_subroutine
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	-96(%rbp), %rax	; status, tmp131
	movq	(%rax), %rax	; status_53(D)->tac, _3
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	; _3->subroutines, _4
	movq	-24(%rbp), %rdx	; subroutine, tmp132
	movq	%rdx, %rsi	; tmp132,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	-88(%rbp), %rax	; method, tmp133
	movq	16(%rax), %rax	; method_50(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp134, parameters
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L125	;
.L126:
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-40(%rbp), %rax	; parameter, tmp135
	movq	(%rax), %rsi	; parameter_59->type, _6
	movq	-40(%rbp), %rax	; parameter, tmp136
	movq	8(%rax), %rax	; parameter_59->name, _7
	movq	-96(%rbp), %rdx	; status, tmp137
	movq	%rdx, %rcx	; tmp137,
	movl	$112, %edx	;,
	movq	%rax, %rdi	; _7,
	call	create_var	;
	movq	%rax, %rdx	;, _8
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-24(%rbp), %rax	; subroutine, tmp138
	movq	16(%rax), %rax	; subroutine_52->parameters, _9
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
.L125:
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-32(%rbp), %rax	; parameters, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp140, parameter
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -40(%rbp)	;, parameter
	jne	.L126	;,
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	-96(%rbp), %rax	; status, tmp141
	movq	%rax, %rcx	; tmp141,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	; _10,
	call	create_block	;
	movq	%rax, -48(%rbp)	; tmp142, block
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	-24(%rbp), %rax	; subroutine, tmp143
	movq	32(%rax), %rax	; subroutine_52->blocks, _11
	movq	-48(%rbp), %rdx	; block, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:356:     status->current_block = block;
	movq	-96(%rbp), %rax	; status, tmp145
	movq	-48(%rbp), %rdx	; block, tmp146
	movq	%rdx, 16(%rax)	; tmp146, status_53(D)->current_block
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	-88(%rbp), %rax	; method, tmp147
	movq	24(%rax), %rax	; method_50(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp148, statements
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.15_13
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	-96(%rbp), %rax	; status, tmp149
	movq	24(%rax), %rax	; status_53(D)->current_class, _14
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _14->name, _15
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	; _15->name, _16
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.15_13,
	movq	%rax, %rdi	; _16,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _17
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	-88(%rbp), %rax	; method, tmp150
	movq	(%rax), %rax	; method_50(D)->name, _18
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	; _18->name, _19
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	%rdx, %rsi	; _17,
	movq	%rax, %rdi	; _19,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; _20
	jne	.L131	;,
; src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	-56(%rbp), %rax	; statements, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -64(%rbp)	; tmp152, stmt
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	; stmt, tmp153
	movl	8(%rax), %eax	; stmt_69->type, _21
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	testl	%eax, %eax	; _21
	jne	.L128	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	; stmt, tmp154
	movq	(%rax), %rax	; stmt_69->stmt.expr, _22
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	24(%rax), %eax	; _22->operator, _23
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, %eax	;, _23
	jne	.L128	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	; stmt, tmp155
	movq	(%rax), %rax	; stmt_69->stmt.expr, _24
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	; _24->prim_left, _25
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	8(%rax), %eax	; _25->type, _26
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, %eax	;, _26
	jne	.L128	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	; stmt, tmp156
	movq	(%rax), %rax	; stmt_69->stmt.expr, _27
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	; _27->prim_left, _28
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; _28->value.var, _29
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	16(%rax), %eax	; _29->type, _30
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	testl	%eax, %eax	; _30
	je	.L129	;,
.L128:
; src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	-88(%rbp), %rax	; method, tmp157
	movq	(%rax), %rax	; method_50(D)->name, _31
; src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	8(%rax), %rdx	; _31->name, _32
	movq	stderr(%rip), %rax	; stderr, stderr.16_33
	leaq	.LC9(%rip), %rcx	;, tmp158
	movq	%rcx, %rsi	; tmp158,
	movq	%rax, %rdi	; stderr.16_33,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:363:             return;
	jmp	.L124	;
.L129:
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	-64(%rbp), %rax	; stmt, tmp159
	movq	(%rax), %rax	; stmt_69->stmt.expr, _34
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %rax	; _34->prim_left, _35
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	(%rax), %rax	; _35->value.var, _36
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %rax	; _36->content.name, tmp160
	movq	%rax, -72(%rbp)	; tmp160, self
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-96(%rbp), %rax	; status, tmp161
	movq	24(%rax), %rax	; status_53(D)->current_class, _37
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	addq	$24, %rax	;, _38
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; _38,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _39
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-72(%rbp), %rax	; self, tmp162
	movq	(%rax), %rsi	; self_70->type, _40
	movq	-96(%rbp), %rdx	; status, tmp163
	movq	-72(%rbp), %rax	; self, tmp164
	movq	%rdx, %rcx	; tmp163,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; tmp164,
	call	create_var	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; _41,
	movl	$0, %edi	;,
	call	create_arg	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %ecx	;,
	movq	%rbx, %rdx	; _39,
	movq	%rax, %rsi	; _42,
	movl	$18, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _43
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-48(%rbp), %rax	; block, tmp165
	movq	8(%rax), %rax	; block_62->instructions, _44
	movq	%rdx, %rsi	; _43,
	movq	%rax, %rdi	; _44,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L131	;
.L132:
; src/tac.c:371:         tac_statement(statement, status);
	movq	-96(%rbp), %rdx	; status, tmp166
	movq	-80(%rbp), %rax	; statement, tmp167
	movq	%rdx, %rsi	; tmp166,
	movq	%rax, %rdi	; tmp167,
	call	tac_statement	;
.L131:
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-56(%rbp), %rax	; statements, tmp168
	movq	%rax, %rdi	; tmp168,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp169, statement
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -80(%rbp)	;, statement
	jne	.L132	;,
; src/tac.c:373:     status->current_subroutine = NULL;
	movq	-96(%rbp), %rax	; status, tmp170
	movq	$0, 8(%rax)	;, status_53(D)->current_subroutine
.L124:
; src/tac.c:375: }
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	tac_method, .-tac_method
	.section	.rodata
	.align 8
.LC10:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; class, class
	movq	%rsi, -48(%rbp)	; status, status
; src/tac.c:378:     status->current_class = class;
	movq	-48(%rbp), %rax	; status, tmp91
	movq	-40(%rbp), %rdx	; class, tmp92
	movq	%rdx, 24(%rax)	; tmp92, status_12(D)->current_class
; src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	-40(%rbp), %rax	; class, tmp93
	movq	8(%rax), %rax	; class_13(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp94, members
; src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	-40(%rbp), %rax	; class, tmp95
	movq	(%rax), %rax	; class_13(D)->name, _2
	movq	%rax, %rdi	; _2,
	call	create_attribute_table	;
	movq	%rax, -16(%rbp)	; tmp96, attr_table
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	-48(%rbp), %rax	; status, tmp97
	movq	(%rax), %rax	; status_12(D)->tac, _3
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	; _3->attribute_tables, _4
	movq	-16(%rbp), %rdx	; attr_table, tmp98
	movq	%rdx, %rsi	; tmp98,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L134	;
.L139:
; src/tac.c:385:         switch (member->type) {
	movq	-24(%rbp), %rax	; member, tmp99
	movl	8(%rax), %eax	; member_21->type, _5
; src/tac.c:385:         switch (member->type) {
	testl	%eax, %eax	; _5
	je	.L135	;,
	cmpl	$1, %eax	;, _5
	je	.L136	;,
	jmp	.L140	;
.L135:
; src/tac.c:387:                 tac_method(member->content.method, status);
	movq	-24(%rbp), %rax	; member, tmp100
	movq	(%rax), %rax	; member_21->content.method, _6
	movq	-48(%rbp), %rdx	; status, tmp101
	movq	%rdx, %rsi	; tmp101,
	movq	%rax, %rdi	; _6,
	call	tac_method	;
; src/tac.c:388:                 break;
	jmp	.L134	;
.L136:
; src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	-24(%rbp), %rax	; member, tmp102
	movq	(%rax), %rax	; member_21->content.variable, _7
	movq	-48(%rbp), %rcx	; status, tmp103
	movl	$1, %edx	;,
	movq	%rcx, %rsi	; tmp103,
	movq	%rax, %rdi	; _7,
	call	tac_variable	;
; src/tac.c:391:                 break;
	jmp	.L134	;
.L140:
; src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	-24(%rbp), %rax	; member, tmp104
	movl	8(%rax), %edx	; member_21->type, _8
; src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	stderr(%rip), %rax	; stderr, stderr.17_9
	leaq	.LC10(%rip), %rcx	;, tmp105
	movq	%rcx, %rsi	; tmp105,
	movq	%rax, %rdi	; stderr.17_9,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:394:                 break;
	nop	
.L134:
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	-8(%rbp), %rax	; members, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp107, member
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	cmpq	$0, -24(%rbp)	;, member
	jne	.L139	;,
; src/tac.c:397:     status->current_class = NULL;
	movq	-48(%rbp), %rax	; status, tmp108
	movq	$0, 24(%rax)	;, status_12(D)->current_class
; src/tac.c:399: }
	nop	
	leave	
	ret	
	.size	tac_class, .-tac_class
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; variable, variable
	movq	%rsi, -48(%rbp)	; status, status
	movl	%edx, %eax	; is_attr, tmp97
	movb	%al, -52(%rbp)	; tmp98, is_attr
; src/tac.c:402:     Var* var = NULL;
	movq	$0, -16(%rbp)	;, var
; src/tac.c:403:     if (is_attr) {
	cmpb	$0, -52(%rbp)	;, is_attr
	je	.L142	;,
; src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	-48(%rbp), %rax	; status, tmp99
	movq	(%rax), %rax	; status_23(D)->tac, _1
; src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rax), %rax	; _1->attribute_tables, _2
	movq	%rax, %rdi	; _2,
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp100, attr_table
; src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	-48(%rbp), %rax	; status, tmp101
	movq	(%rax), %rax	; status_23(D)->tac, _3
; src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	; _3->attribute_tables, _4
	movq	-24(%rbp), %rdx	; attr_table, tmp102
	movq	%rdx, %rsi	; tmp102,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	-40(%rbp), %rax	; variable, tmp103
	movq	(%rax), %rsi	; variable_22(D)->type, _5
	movq	-40(%rbp), %rax	; variable, tmp104
	movq	8(%rax), %rax	; variable_22(D)->name, _6
	movq	-48(%rbp), %rcx	; status, tmp105
	movq	-24(%rbp), %rdx	; attr_table, tmp106
	movq	%rcx, %r8	; tmp105,
	movl	$0, %ecx	;,
	movq	%rax, %rdi	; _6,
	call	create_attribute	;
; src/tac.c:421: }
	jmp	.L146	;
.L142:
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	-40(%rbp), %rax	; variable, tmp107
	movq	(%rax), %rsi	; variable_22(D)->type, _7
	movq	-40(%rbp), %rax	; variable, tmp108
	movq	8(%rax), %rax	; variable_22(D)->name, _8
	movq	-48(%rbp), %rdx	; status, tmp109
	movq	%rdx, %rcx	; tmp109,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _8,
	call	create_var	;
	movq	%rax, -16(%rbp)	; tmp110, var
; src/tac.c:414:         if (variable->value != NULL)
	movq	-40(%rbp), %rax	; variable, tmp111
	movq	16(%rax), %rax	; variable_22(D)->value, _9
; src/tac.c:414:         if (variable->value != NULL)
	testq	%rax, %rax	; _9
	je	.L144	;,
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	-40(%rbp), %rax	; variable, tmp112
	movq	16(%rax), %rax	; variable_22(D)->value, _10
	movq	-48(%rbp), %rdx	; status, tmp113
	movq	%rdx, %rsi	; tmp113,
	movq	%rax, %rdi	; _10,
	call	tac_expression	;
	movq	%rax, %rdx	;, _11
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	-48(%rbp), %rax	; status, tmp114
	movq	%rax, %rsi	; tmp114,
	movq	%rdx, %rdi	; _11,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp115, value
	jmp	.L145	;
.L144:
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	$0, -32(%rbp)	;, D.5426
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	leaq	-32(%rbp), %rax	;, tmp116
	movq	%rax, %rsi	; tmp116,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp117, value
.L145:
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	-16(%rbp), %rax	; var, tmp118
	movq	%rax, %rsi	; tmp118,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _12
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	-8(%rbp), %rax	; value, tmp119
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp119,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _13
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	-48(%rbp), %rax	; status, tmp120
	movq	16(%rax), %rax	; status_23(D)->current_block, _14
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	8(%rax), %rax	; _14->instructions, _15
	movq	%rdx, %rsi	; _13,
	movq	%rax, %rdi	; _15,
	call	*list_append@GOTPCREL(%rip)	;
.L146:
; src/tac.c:421: }
	nop	
	leave	
	ret	
	.size	tac_variable, .-tac_variable
	.section	.rodata
	.align 8
.LC11:
	.string	"[Warning] 'break' statement used outside of loop\n"
	.align 8
.LC12:
	.string	"[Warning] 'continue' statement used outside of loop\n"
	.align 8
.LC13:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; statement, statement
	movq	%rsi, -64(%rbp)	; status, status
; src/tac.c:424:     switch (statement->type) {
	movq	-56(%rbp), %rax	; statement, tmp111
	movl	8(%rax), %eax	; statement_34(D)->type, _1
; src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %eax	;, _1
	ja	.L148	;,
	movl	%eax, %eax	; _1, tmp112
	leaq	0(,%rax,4), %rdx	;, tmp113
	leaq	.L150(%rip), %rax	;, tmp114
	movl	(%rdx,%rax), %eax	;, tmp115
	cltq
	leaq	.L150(%rip), %rdx	;, tmp118
	addq	%rdx, %rax	; tmp118, tmp117
	jmp	*%rax	; tmp117
	.section	.rodata
	.align 4
	.align 4
.L150:
	.long	.L157-.L150
	.long	.L156-.L150
	.long	.L155-.L150
	.long	.L154-.L150
	.long	.L153-.L150
	.long	.L152-.L150
	.long	.L151-.L150
	.long	.L149-.L150
	.text
.L157:
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	-56(%rbp), %rax	; statement, tmp119
	movq	(%rax), %rax	; statement_34(D)->stmt.expr, _2
	movq	-64(%rbp), %rdx	; status, tmp120
	movq	%rdx, %rsi	; tmp120,
	movq	%rax, %rdi	; _2,
	call	tac_expression	;
	movq	%rax, %rdx	;, _3
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	-64(%rbp), %rax	; status, tmp121
	movq	%rax, %rsi	; tmp121,
	movq	%rdx, %rdi	; _3,
	call	load_rvalue	;
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	jmp	.L158	;
.L156:
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	-56(%rbp), %rax	; statement, tmp122
	movq	(%rax), %rax	; statement_34(D)->stmt.var, _4
	movq	-64(%rbp), %rcx	; status, tmp123
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; _4,
	call	tac_variable	;
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	.L158	;
.L155:
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp124
	movq	(%rax), %rax	; statement_34(D)->stmt.if_stmt, _5
	movq	-64(%rbp), %rdx	; status, tmp125
	movq	%rdx, %rsi	; tmp125,
	movq	%rax, %rdi	; _5,
	call	tac_if	;
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L158	;
.L154:
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp126
	movq	(%rax), %rax	; statement_34(D)->stmt.while_stmt, _6
	movq	-64(%rbp), %rdx	; status, tmp127
	movq	%rdx, %rsi	; tmp127,
	movq	%rax, %rdi	; _6,
	call	tac_while	;
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L158	;
.L153:
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp128
	movq	(%rax), %rax	; statement_34(D)->stmt.for_stmt, _7
	movq	-64(%rbp), %rdx	; status, tmp129
	movq	%rdx, %rsi	; tmp129,
	movq	%rax, %rdi	; _7,
	call	tac_for	;
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L158	;
.L152:
; src/tac.c:431:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp130, return_value
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	-56(%rbp), %rax	; statement, tmp131
	movq	(%rax), %rax	; statement_34(D)->stmt.return_expr, _8
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rax, %rax	; _8
	je	.L159	;,
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	-56(%rbp), %rax	; statement, tmp132
	movq	(%rax), %rax	; statement_34(D)->stmt.return_expr, _9
	movq	-64(%rbp), %rdx	; status, tmp133
	movq	%rdx, %rsi	; tmp133,
	movq	%rax, %rdi	; _9,
	call	tac_expression	;
	movq	%rax, %rdx	;, _10
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	-64(%rbp), %rax	; status, tmp134
	movq	%rax, %rsi	; tmp134,
	movq	%rdx, %rdi	; _10,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp135, return_value
.L159:
; src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	-8(%rbp), %rax	; return_value, tmp136
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp136,
	movl	$21, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _11
; src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	-64(%rbp), %rax	; status, tmp137
	movq	16(%rax), %rax	; status_35(D)->current_block, _12
; src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	%rdx, %rsi	; _11,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:435:             break;
	jmp	.L158	;
.L151:
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	-64(%rbp), %rax	; status, tmp138
	movq	32(%rax), %rax	; status_35(D)->end_labels, _14
	movq	%rax, %rdi	; _14,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; _15
	jne	.L160	;,
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	-64(%rbp), %rax	; status, tmp139
	movq	32(%rax), %rax	; status_35(D)->end_labels, _16
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _16->tail, _17
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _17->content, tmp140
	movq	%rax, -32(%rbp)	; tmp140, label
; src/tac.c:440:                 if (label != NULL) {
	cmpq	$0, -32(%rbp)	;, label
	je	.L160	;,
; src/tac.c:441:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-32(%rbp), %rax	; label, tmp141
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp141,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -40(%rbp)	; tmp142, inst
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp143
	movq	16(%rax), %rax	; status_35(D)->current_block, _18
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _18->instructions, _19
	movq	-40(%rbp), %rdx	; inst, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _19,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:443:                     break;
	jmp	.L158	;
.L160:
; src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movq	stderr(%rip), %rax	; stderr, stderr.18_20
	movq	%rax, %rcx	; stderr.18_20,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:447:             break;
	jmp	.L158	;
.L149:
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	-64(%rbp), %rax	; status, tmp146
	movq	40(%rax), %rax	; status_35(D)->start_labels, _21
	movq	%rax, %rdi	; _21,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; _22
	jne	.L161	;,
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	-64(%rbp), %rax	; status, tmp147
	movq	40(%rax), %rax	; status_35(D)->start_labels, _23
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _23->tail, _24
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _24->content, tmp148
	movq	%rax, -16(%rbp)	; tmp148, label
; src/tac.c:451:                 if (label != NULL) {
	cmpq	$0, -16(%rbp)	;, label
	je	.L161	;,
; src/tac.c:452:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-16(%rbp), %rax	; label, tmp149
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp149,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp150, inst
; src/tac.c:453:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp151
	movq	16(%rax), %rax	; status_35(D)->current_block, _25
; src/tac.c:453:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _25->instructions, _26
	movq	-24(%rbp), %rdx	; inst, tmp152
	movq	%rdx, %rsi	; tmp152,
	movq	%rax, %rdi	; _26,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:454:                     break;
	jmp	.L158	;
.L161:
; src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movq	stderr(%rip), %rax	; stderr, stderr.19_27
	movq	%rax, %rcx	; stderr.19_27,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp153
	movq	%rax, %rdi	; tmp153,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:458:             break;
	jmp	.L158	;
.L148:
; src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	-56(%rbp), %rax	; statement, tmp154
	movl	8(%rax), %edx	; statement_34(D)->type, _28
; src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	stderr(%rip), %rax	; stderr, stderr.20_29
	leaq	.LC13(%rip), %rcx	;, tmp155
	movq	%rcx, %rsi	; tmp155,
	movq	%rax, %rdi	; stderr.20_29,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:461:             break;
	nop	
.L158:
; src/tac.c:464: }
	nop	
	leave	
	ret	
	.size	tac_statement, .-tac_statement
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$184, %rsp	;,
	movq	%rdi, -184(%rbp)	; if_, if_
	movq	%rsi, -192(%rbp)	; status, status
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp125
	movq	%rax, %rcx	; tmp125,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp126, then_label
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp127
	movq	%rax, %rcx	; tmp127,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp128, else_label
; src/tac.c:470:     Var* end_label = NULL;
	movq	$0, -32(%rbp)	;, end_label
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp129
	movq	16(%rax), %rax	; if__64(D)->else_if, _1
	movq	%rax, %rdi	; _1,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; _2
	je	.L163	;,
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp130
	movq	24(%rax), %rax	; if__64(D)->else_body, _3
	movq	%rax, %rdi	; _3,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; _4
	je	.L163	;,
; src/tac.c:472:         end_label = else_label;
	movq	-24(%rbp), %rax	; else_label, tmp131
	movq	%rax, -32(%rbp)	; tmp131, end_label
	jmp	.L164	;
.L163:
; src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp132
	movq	%rax, %rcx	; tmp132,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -32(%rbp)	; tmp133, end_label
.L164:
; src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	-32(%rbp), %rax	; end_label, tmp134
	movq	%rax, %rsi	; tmp134,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp135, end_block_arg
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	-184(%rbp), %rax	; if_, tmp136
	movq	(%rax), %rax	; if__64(D)->condition, _5
	movq	-192(%rbp), %rdx	; status, tmp137
	movq	%rdx, %rsi	; tmp137,
	movq	%rax, %rdi	; _5,
	call	tac_expression	;
	movq	%rax, %rdx	;, _6
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	-192(%rbp), %rax	; status, tmp138
	movq	%rax, %rsi	; tmp138,
	movq	%rdx, %rdi	; _6,
	call	load_rvalue	;
	movq	%rax, -56(%rbp)	; tmp139, condition
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	; else_label, tmp140
	movq	%rax, %rsi	; tmp140,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _7
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	; then_label, tmp141
	movq	%rax, %rsi	; tmp141,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _8
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	; condition, tmp142
	movq	%rbx, %rcx	; _7,
	movq	%rax, %rsi	; tmp142,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp143, inst
; src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp144
	movq	16(%rax), %rax	; status_58(D)->current_block, _9
; src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _9->instructions, _10
	movq	-64(%rbp), %rdx	; inst, tmp145
	movq	%rdx, %rsi	; tmp145,
	movq	%rax, %rdi	; _10,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:481:     Block* then_block = create_block(then_label);
	movq	-40(%rbp), %rax	; then_label, tmp146
	movq	%rax, %rdi	; tmp146,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp147, then_block
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	-192(%rbp), %rax	; status, tmp148
	movq	8(%rax), %rax	; status_58(D)->current_subroutine, _11
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	; _11->blocks, _12
	movq	-72(%rbp), %rdx	; then_block, tmp149
	movq	%rdx, %rsi	; tmp149,
	movq	%rax, %rdi	; _12,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:483:     status->current_block = then_block;
	movq	-192(%rbp), %rax	; status, tmp150
	movq	-72(%rbp), %rdx	; then_block, tmp151
	movq	%rdx, 16(%rax)	; tmp151, status_58(D)->current_block
; src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	-184(%rbp), %rax	; if_, tmp152
	movq	8(%rax), %rax	; if__64(D)->body, _13
	movq	%rax, %rdi	; _13,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp153, then_statements
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L165	;
.L166:
; src/tac.c:488:         tac_statement(statement, status);
	movq	-192(%rbp), %rdx	; status, tmp154
	movq	-88(%rbp), %rax	; statement, tmp155
	movq	%rdx, %rsi	; tmp154,
	movq	%rax, %rdi	; tmp155,
	call	tac_statement	;
.L165:
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	-80(%rbp), %rax	; then_statements, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp157, statement
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L166	;,
; src/tac.c:490:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp158
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp158,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp159, jump_to_end
; src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp160
	movq	16(%rax), %rax	; status_58(D)->current_block, _14
; src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _14->instructions, _15
	movq	-96(%rbp), %rdx	; jump_to_end, tmp161
	movq	%rdx, %rsi	; tmp161,
	movq	%rax, %rdi	; _15,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	-184(%rbp), %rax	; if_, tmp162
	movq	16(%rax), %rax	; if__64(D)->else_if, _16
	movq	%rax, %rdi	; _16,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; _17
	jne	.L167	;,
; src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	-184(%rbp), %rax	; if_, tmp163
	movq	16(%rax), %rax	; if__64(D)->else_if, _18
	movq	%rax, %rdi	; _18,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp164, elif_list
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L168	;
.L172:
; src/tac.c:499:             Block* else_if_block = create_block(else_label);
	movq	-24(%rbp), %rax	; else_label, tmp165
	movq	%rax, %rdi	; tmp165,
	call	create_block	;
	movq	%rax, -120(%rbp)	; tmp166, else_if_block
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	-192(%rbp), %rax	; status, tmp167
	movq	8(%rax), %rax	; status_58(D)->current_subroutine, _19
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	32(%rax), %rax	; _19->blocks, _20
	movq	-120(%rbp), %rdx	; else_if_block, tmp168
	movq	%rdx, %rsi	; tmp168,
	movq	%rax, %rdi	; _20,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:501:             status->current_block = else_if_block;
	movq	-192(%rbp), %rax	; status, tmp169
	movq	-120(%rbp), %rdx	; else_if_block, tmp170
	movq	%rdx, 16(%rax)	; tmp170, status_58(D)->current_block
; src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp171
	movq	%rax, %rcx	; tmp171,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp172, then_label
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp173
	movq	%rax, %rcx	; tmp173,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp174, else_label
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	-112(%rbp), %rax	; elif, tmp175
	movq	(%rax), %rax	; elif_95->condition, _21
	movq	-192(%rbp), %rdx	; status, tmp176
	movq	%rdx, %rsi	; tmp176,
	movq	%rax, %rdi	; _21,
	call	tac_expression	;
	movq	%rax, %rdx	;, _22
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	-192(%rbp), %rax	; status, tmp177
	movq	%rax, %rsi	; tmp177,
	movq	%rdx, %rdi	; _22,
	call	load_rvalue	;
	movq	%rax, -56(%rbp)	; tmp178, condition
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-104(%rbp), %rax	; elif_list, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; _23
	je	.L169	;,
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp180
	movq	24(%rax), %rax	; if__64(D)->else_body, _24
	movq	%rax, %rdi	; _24,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; _25
	je	.L169	;,
; src/tac.c:508:                 else_label = end_label;
	movq	-32(%rbp), %rax	; end_label, tmp181
	movq	%rax, -24(%rbp)	; tmp181, else_label
.L169:
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	; else_label, tmp182
	movq	%rax, %rsi	; tmp182,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _26
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	; then_label, tmp183
	movq	%rax, %rsi	; tmp183,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _27
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	; condition, tmp184
	movq	%rbx, %rcx	; _26,
	movq	%rax, %rsi	; tmp184,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp185, inst
; src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp186
	movq	16(%rax), %rax	; status_58(D)->current_block, _28
; src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _28->instructions, _29
	movq	-64(%rbp), %rdx	; inst, tmp187
	movq	%rdx, %rsi	; tmp187,
	movq	%rax, %rdi	; _29,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:512:             then_block = create_block(then_label);
	movq	-40(%rbp), %rax	; then_label, tmp188
	movq	%rax, %rdi	; tmp188,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp189, then_block
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	-192(%rbp), %rax	; status, tmp190
	movq	8(%rax), %rax	; status_58(D)->current_subroutine, _30
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	; _30->blocks, _31
	movq	-72(%rbp), %rdx	; then_block, tmp191
	movq	%rdx, %rsi	; tmp191,
	movq	%rax, %rdi	; _31,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:514:             status->current_block = then_block;
	movq	-192(%rbp), %rax	; status, tmp192
	movq	-72(%rbp), %rdx	; then_block, tmp193
	movq	%rdx, 16(%rax)	; tmp193, status_58(D)->current_block
; src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	-112(%rbp), %rax	; elif, tmp194
	movq	8(%rax), %rax	; elif_95->body, _32
	movq	%rax, %rdi	; _32,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp195, elif_statements
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L170	;
.L171:
; src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	-192(%rbp), %rdx	; status, tmp196
	movq	-136(%rbp), %rax	; elif_statement, tmp197
	movq	%rdx, %rsi	; tmp196,
	movq	%rax, %rdi	; tmp197,
	call	tac_statement	;
.L170:
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	-128(%rbp), %rax	; elif_statements, tmp198
	movq	%rax, %rdi	; tmp198,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -136(%rbp)	; tmp199, elif_statement
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	cmpq	$0, -136(%rbp)	;, elif_statement
	jne	.L171	;,
; src/tac.c:521:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp200
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp200,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp201, jump_to_end
; src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp202
	movq	16(%rax), %rax	; status_58(D)->current_block, _33
; src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _33->instructions, _34
	movq	-96(%rbp), %rdx	; jump_to_end, tmp203
	movq	%rdx, %rsi	; tmp203,
	movq	%rax, %rdi	; _34,
	call	*list_append@GOTPCREL(%rip)	;
.L168:
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	-104(%rbp), %rax	; elif_list, tmp204
	movq	%rax, %rdi	; tmp204,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp205, elif
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	cmpq	$0, -112(%rbp)	;, elif
	jne	.L172	;,
.L167:
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	-184(%rbp), %rax	; if_, tmp206
	movq	24(%rax), %rax	; if__64(D)->else_body, _35
	movq	%rax, %rdi	; _35,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; _36
	jne	.L173	;,
; src/tac.c:528:         Block* else_block = create_block(else_label);
	movq	-24(%rbp), %rax	; else_label, tmp207
	movq	%rax, %rdi	; tmp207,
	call	create_block	;
	movq	%rax, -144(%rbp)	; tmp208, else_block
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	-192(%rbp), %rax	; status, tmp209
	movq	8(%rax), %rax	; status_58(D)->current_subroutine, _37
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	32(%rax), %rax	; _37->blocks, _38
	movq	-144(%rbp), %rdx	; else_block, tmp210
	movq	%rdx, %rsi	; tmp210,
	movq	%rax, %rdi	; _38,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:530:         status->current_block = else_block;
	movq	-192(%rbp), %rax	; status, tmp211
	movq	-144(%rbp), %rdx	; else_block, tmp212
	movq	%rdx, 16(%rax)	; tmp212, status_58(D)->current_block
; src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	-184(%rbp), %rax	; if_, tmp213
	movq	24(%rax), %rax	; if__64(D)->else_body, _39
	movq	%rax, %rdi	; _39,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -152(%rbp)	; tmp214, else_statements
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L174	;
.L175:
; src/tac.c:535:             tac_statement(else_statement, status);
	movq	-192(%rbp), %rdx	; status, tmp215
	movq	-160(%rbp), %rax	; else_statement, tmp216
	movq	%rdx, %rsi	; tmp215,
	movq	%rax, %rdi	; tmp216,
	call	tac_statement	;
.L174:
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	-152(%rbp), %rax	; else_statements, tmp217
	movq	%rax, %rdi	; tmp217,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -160(%rbp)	; tmp218, else_statement
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	cmpq	$0, -160(%rbp)	;, else_statement
	jne	.L175	;,
; src/tac.c:537:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp219
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp219,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp220, jump_to_end
; src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp221
	movq	16(%rax), %rax	; status_58(D)->current_block, _40
; src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _40->instructions, _41
	movq	-96(%rbp), %rdx	; jump_to_end, tmp222
	movq	%rdx, %rsi	; tmp222,
	movq	%rax, %rdi	; _41,
	call	*list_append@GOTPCREL(%rip)	;
.L173:
; src/tac.c:541:     Block* end_block = create_block(end_label);
	movq	-32(%rbp), %rax	; end_label, tmp223
	movq	%rax, %rdi	; tmp223,
	call	create_block	;
	movq	%rax, -168(%rbp)	; tmp224, end_block
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-192(%rbp), %rax	; status, tmp225
	movq	8(%rax), %rax	; status_58(D)->current_subroutine, _42
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _42->blocks, _43
	movq	-168(%rbp), %rdx	; end_block, tmp226
	movq	%rdx, %rsi	; tmp226,
	movq	%rax, %rdi	; _43,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:543:     status->current_block = end_block;
	movq	-192(%rbp), %rax	; status, tmp227
	movq	-168(%rbp), %rdx	; end_block, tmp228
	movq	%rdx, 16(%rax)	; tmp228, status_58(D)->current_block
; src/tac.c:545: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	tac_if, .-tac_if
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$152, %rsp	;,
	movq	%rdi, -152(%rbp)	; for_, for_
	movq	%rsi, -160(%rbp)	; status, status
; src/tac.c:549:     if (for_->initializer != NULL)
	movq	-152(%rbp), %rax	; for_, tmp129
	movq	(%rax), %rax	; for__56(D)->initializer, _1
; src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rax, %rax	; _1
	je	.L177	;,
; src/tac.c:550:         tac_variable(for_->initializer, status, false);
	movq	-152(%rbp), %rax	; for_, tmp130
	movq	(%rax), %rax	; for__56(D)->initializer, _2
	movq	-160(%rbp), %rcx	; status, tmp131
	movl	$0, %edx	;,
	movq	%rcx, %rsi	; tmp131,
	movq	%rax, %rdi	; _2,
	call	tac_variable	;
.L177:
; src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp132
	movq	%rax, %rcx	; tmp132,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -32(%rbp)	; tmp133, condition_label
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp134
	movq	%rax, %rcx	; tmp134,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp135, body_label
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp136
	movq	%rax, %rcx	; tmp136,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -48(%rbp)	; tmp137, end_label
; src/tac.c:555:     if (for_->condition != NULL) {
	movq	-152(%rbp), %rax	; for_, tmp138
	movq	8(%rax), %rax	; for__56(D)->condition, _3
; src/tac.c:555:     if (for_->condition != NULL) {
	testq	%rax, %rax	; _3
	je	.L178	;,
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	; condition_label, tmp139
	movq	%rax, %rsi	; tmp139,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _4,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp140, inst
; src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp141
	movq	16(%rax), %rax	; status_57(D)->current_block, _5
; src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	-64(%rbp), %rdx	; inst, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:559:         Block* condition_block = create_block(condition_label);
	movq	-32(%rbp), %rax	; condition_label, tmp143
	movq	%rax, %rdi	; tmp143,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp144, condition_block
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	-160(%rbp), %rax	; status, tmp145
	movq	8(%rax), %rax	; status_57(D)->current_subroutine, _7
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	; _7->blocks, _8
	movq	-72(%rbp), %rdx	; condition_block, tmp146
	movq	%rdx, %rsi	; tmp146,
	movq	%rax, %rdi	; _8,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:561:         status->current_block = condition_block;
	movq	-160(%rbp), %rax	; status, tmp147
	movq	-72(%rbp), %rdx	; condition_block, tmp148
	movq	%rdx, 16(%rax)	; tmp148, status_57(D)->current_block
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	-152(%rbp), %rax	; for_, tmp149
	movq	8(%rax), %rax	; for__56(D)->condition, _9
	movq	-160(%rbp), %rdx	; status, tmp150
	movq	%rdx, %rsi	; tmp150,
	movq	%rax, %rdi	; _9,
	call	tac_expression	;
	movq	%rax, %rdx	;, _10
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	-160(%rbp), %rax	; status, tmp151
	movq	%rax, %rsi	; tmp151,
	movq	%rdx, %rdi	; _10,
	call	load_rvalue	;
	movq	%rax, -80(%rbp)	; tmp152, condition
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; end_label, tmp153
	movq	%rax, %rsi	; tmp153,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _11
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-40(%rbp), %rax	; body_label, tmp154
	movq	%rax, %rsi	; tmp154,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _12
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-80(%rbp), %rax	; condition, tmp155
	movq	%rbx, %rcx	; _11,
	movq	%rax, %rsi	; tmp155,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp156, inst
; src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp157
	movq	16(%rax), %rax	; status_57(D)->current_block, _13
; src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _13->instructions, _14
	movq	-64(%rbp), %rdx	; inst, tmp158
	movq	%rdx, %rsi	; tmp158,
	movq	%rax, %rdi	; _14,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L179	;
.L178:
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	; body_label, tmp159
	movq	%rax, %rsi	; tmp159,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _15,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -56(%rbp)	; tmp160, inst
; src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp161
	movq	16(%rax), %rax	; status_57(D)->current_block, _16
; src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _16->instructions, _17
	movq	-56(%rbp), %rdx	; inst, tmp162
	movq	%rdx, %rsi	; tmp162,
	movq	%rax, %rdi	; _17,
	call	*list_append@GOTPCREL(%rip)	;
.L179:
; src/tac.c:572:     Block* body_block = create_block(body_label);
	movq	-40(%rbp), %rax	; body_label, tmp163
	movq	%rax, %rdi	; tmp163,
	call	create_block	;
	movq	%rax, -88(%rbp)	; tmp164, body_block
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	-160(%rbp), %rax	; status, tmp165
	movq	8(%rax), %rax	; status_57(D)->current_subroutine, _18
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	; _18->blocks, _19
	movq	-88(%rbp), %rdx	; body_block, tmp166
	movq	%rdx, %rsi	; tmp166,
	movq	%rax, %rdi	; _19,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:574:     status->current_block = body_block;
	movq	-160(%rbp), %rax	; status, tmp167
	movq	-88(%rbp), %rdx	; body_block, tmp168
	movq	%rdx, 16(%rax)	; tmp168, status_57(D)->current_block
; src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp169
	movq	%rax, %rcx	; tmp169,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -96(%rbp)	; tmp170, increment_label
; src/tac.c:577:     if (for_->increment != NULL)
	movq	-152(%rbp), %rax	; for_, tmp171
	movq	16(%rax), %rax	; for__56(D)->increment, _20
; src/tac.c:577:     if (for_->increment != NULL)
	testq	%rax, %rax	; _20
	je	.L180	;,
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-96(%rbp), %rax	; increment_label, tmp172
	movq	%rax, %rsi	; tmp172,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _21
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-160(%rbp), %rax	; status, tmp173
	movq	40(%rax), %rax	; status_57(D)->start_labels, _22
	movq	%rdx, %rsi	; _21,
	movq	%rax, %rdi	; _22,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L181	;
.L180:
; src/tac.c:579:     else if (for_->condition != NULL)
	movq	-152(%rbp), %rax	; for_, tmp174
	movq	8(%rax), %rax	; for__56(D)->condition, _23
; src/tac.c:579:     else if (for_->condition != NULL)
	testq	%rax, %rax	; _23
	je	.L182	;,
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-32(%rbp), %rax	; condition_label, tmp175
	movq	%rax, %rsi	; tmp175,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _24
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-160(%rbp), %rax	; status, tmp176
	movq	40(%rax), %rax	; status_57(D)->start_labels, _25
	movq	%rdx, %rsi	; _24,
	movq	%rax, %rdi	; _25,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L181	;
.L182:
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-40(%rbp), %rax	; body_label, tmp177
	movq	%rax, %rsi	; tmp177,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _26
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-160(%rbp), %rax	; status, tmp178
	movq	40(%rax), %rax	; status_57(D)->start_labels, _27
	movq	%rdx, %rsi	; _26,
	movq	%rax, %rdi	; _27,
	call	*list_append@GOTPCREL(%rip)	;
.L181:
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; end_label, tmp179
	movq	%rax, %rsi	; tmp179,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _28
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-160(%rbp), %rax	; status, tmp180
	movq	32(%rax), %rax	; status_57(D)->end_labels, _29
	movq	%rdx, %rsi	; _28,
	movq	%rax, %rdi	; _29,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	-152(%rbp), %rax	; for_, tmp181
	movq	24(%rax), %rax	; for__56(D)->body, _30
	movq	%rax, %rdi	; _30,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp182, body_statements
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L183	;
.L184:
; src/tac.c:587:         tac_statement(statement, status);
	movq	-160(%rbp), %rdx	; status, tmp183
	movq	-112(%rbp), %rax	; statement, tmp184
	movq	%rdx, %rsi	; tmp183,
	movq	%rax, %rdi	; tmp184,
	call	tac_statement	;
.L183:
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-104(%rbp), %rax	; body_statements, tmp185
	movq	%rax, %rdi	; tmp185,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp186, statement
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -112(%rbp)	;, statement
	jne	.L184	;,
; src/tac.c:588:     list_pop_back(status->start_labels);
	movq	-160(%rbp), %rax	; status, tmp187
	movq	40(%rax), %rax	; status_57(D)->start_labels, _31
	movq	%rax, %rdi	; _31,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:589:     list_pop_back(status->end_labels);
	movq	-160(%rbp), %rax	; status, tmp188
	movq	32(%rax), %rax	; status_57(D)->end_labels, _32
	movq	%rax, %rdi	; _32,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:590:     if (for_->increment != NULL) {
	movq	-152(%rbp), %rax	; for_, tmp189
	movq	16(%rax), %rax	; for__56(D)->increment, _33
; src/tac.c:590:     if (for_->increment != NULL) {
	testq	%rax, %rax	; _33
	je	.L185	;,
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	-96(%rbp), %rax	; increment_label, tmp190
	movq	%rax, %rsi	; tmp190,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _34,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -120(%rbp)	; tmp191, inst
; src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp192
	movq	16(%rax), %rax	; status_57(D)->current_block, _35
; src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _35->instructions, _36
	movq	-120(%rbp), %rdx	; inst, tmp193
	movq	%rdx, %rsi	; tmp193,
	movq	%rax, %rdi	; _36,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:594:         Block* increment_block = create_block(increment_label);
	movq	-96(%rbp), %rax	; increment_label, tmp194
	movq	%rax, %rdi	; tmp194,
	call	create_block	;
	movq	%rax, -128(%rbp)	; tmp195, increment_block
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	-160(%rbp), %rax	; status, tmp196
	movq	8(%rax), %rax	; status_57(D)->current_subroutine, _37
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	32(%rax), %rax	; _37->blocks, _38
	movq	-128(%rbp), %rdx	; increment_block, tmp197
	movq	%rdx, %rsi	; tmp197,
	movq	%rax, %rdi	; _38,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:596:         status->current_block = increment_block;
	movq	-160(%rbp), %rax	; status, tmp198
	movq	-128(%rbp), %rdx	; increment_block, tmp199
	movq	%rdx, 16(%rax)	; tmp199, status_57(D)->current_block
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	-152(%rbp), %rax	; for_, tmp200
	movq	16(%rax), %rax	; for__56(D)->increment, _39
	movq	-160(%rbp), %rdx	; status, tmp201
	movq	%rdx, %rsi	; tmp201,
	movq	%rax, %rdi	; _39,
	call	tac_expression	;
	movq	%rax, %rdx	;, _40
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	-160(%rbp), %rax	; status, tmp202
	movq	%rax, %rsi	; tmp202,
	movq	%rdx, %rdi	; _40,
	call	load_rvalue	;
.L185:
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	; condition_label, tmp203
	movq	%rax, %rsi	; tmp203,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _41,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp204, inst
; src/tac.c:601:     if (for_->condition == NULL)
	movq	-152(%rbp), %rax	; for_, tmp205
	movq	8(%rax), %rax	; for__56(D)->condition, _42
; src/tac.c:601:     if (for_->condition == NULL)
	testq	%rax, %rax	; _42
	jne	.L186	;,
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	; body_label, tmp206
	movq	%rax, %rsi	; tmp206,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _43,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp207, inst
.L186:
; src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp208
	movq	16(%rax), %rax	; status_57(D)->current_block, _44
; src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _44->instructions, _45
	movq	-24(%rbp), %rdx	; inst, tmp209
	movq	%rdx, %rsi	; tmp209,
	movq	%rax, %rdi	; _45,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:605:     Block* end_block = create_block(end_label);
	movq	-48(%rbp), %rax	; end_label, tmp210
	movq	%rax, %rdi	; tmp210,
	call	create_block	;
	movq	%rax, -136(%rbp)	; tmp211, end_block
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-160(%rbp), %rax	; status, tmp212
	movq	8(%rax), %rax	; status_57(D)->current_subroutine, _46
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _46->blocks, _47
	movq	-136(%rbp), %rdx	; end_block, tmp213
	movq	%rdx, %rsi	; tmp213,
	movq	%rax, %rdi	; _47,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:607:     status->current_block = end_block;
	movq	-160(%rbp), %rax	; status, tmp214
	movq	-136(%rbp), %rdx	; end_block, tmp215
	movq	%rdx, 16(%rax)	; tmp215, status_57(D)->current_block
; src/tac.c:609: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	tac_for, .-tac_for
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$104, %rsp	;,
	movq	%rdi, -104(%rbp)	; while_, while_
	movq	%rsi, -112(%rbp)	; status, status
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp107
	movq	%rax, %rcx	; tmp107,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp108, condition_label
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	; condition_label, tmp109
	movq	%rax, %rsi	; tmp109,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _1,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp110, inst
; src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp111
	movq	16(%rax), %rax	; status_28(D)->current_block, _2
; src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _2->instructions, _3
	movq	-32(%rbp), %rdx	; inst, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; _3,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:616:     Block* condition_block = create_block(condition_label);
	movq	-24(%rbp), %rax	; condition_label, tmp113
	movq	%rax, %rdi	; tmp113,
	call	create_block	;
	movq	%rax, -40(%rbp)	; tmp114, condition_block
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	-112(%rbp), %rax	; status, tmp115
	movq	8(%rax), %rax	; status_28(D)->current_subroutine, _4
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	; _4->blocks, _5
	movq	-40(%rbp), %rdx	; condition_block, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; _5,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:618:     status->current_block = condition_block;
	movq	-112(%rbp), %rax	; status, tmp117
	movq	-40(%rbp), %rdx	; condition_block, tmp118
	movq	%rdx, 16(%rax)	; tmp118, status_28(D)->current_block
; src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -48(%rbp)	; tmp120, body_label
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp121
	movq	%rax, %rcx	; tmp121,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -56(%rbp)	; tmp122, end_label
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	-104(%rbp), %rax	; while_, tmp123
	movq	(%rax), %rax	; while__43(D)->condition, _6
	movq	-112(%rbp), %rdx	; status, tmp124
	movq	%rdx, %rsi	; tmp124,
	movq	%rax, %rdi	; _6,
	call	tac_expression	;
	movq	%rax, %rdx	;, _7
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	-112(%rbp), %rax	; status, tmp125
	movq	%rax, %rsi	; tmp125,
	movq	%rdx, %rdi	; _7,
	call	load_rvalue	;
	movq	%rax, -64(%rbp)	; tmp126, condition
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	; end_label, tmp127
	movq	%rax, %rsi	; tmp127,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _8
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; body_label, tmp128
	movq	%rax, %rsi	; tmp128,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _9
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-64(%rbp), %rax	; condition, tmp129
	movq	%rbx, %rcx	; _8,
	movq	%rax, %rsi	; tmp129,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp130, inst
; src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp131
	movq	16(%rax), %rax	; status_28(D)->current_block, _10
; src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _10->instructions, _11
	movq	-32(%rbp), %rdx	; inst, tmp132
	movq	%rdx, %rsi	; tmp132,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:626:     Block* body_block = create_block(body_label);
	movq	-48(%rbp), %rax	; body_label, tmp133
	movq	%rax, %rdi	; tmp133,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp134, body_block
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	-112(%rbp), %rax	; status, tmp135
	movq	8(%rax), %rax	; status_28(D)->current_subroutine, _12
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	; _12->blocks, _13
	movq	-72(%rbp), %rdx	; body_block, tmp136
	movq	%rdx, %rsi	; tmp136,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:628:     status->current_block = body_block;
	movq	-112(%rbp), %rax	; status, tmp137
	movq	-72(%rbp), %rdx	; body_block, tmp138
	movq	%rdx, 16(%rax)	; tmp138, status_28(D)->current_block
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-24(%rbp), %rax	; condition_label, tmp139
	movq	%rax, %rsi	; tmp139,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _14
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-112(%rbp), %rax	; status, tmp140
	movq	40(%rax), %rax	; status_28(D)->start_labels, _15
	movq	%rdx, %rsi	; _14,
	movq	%rax, %rdi	; _15,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	; end_label, tmp141
	movq	%rax, %rsi	; tmp141,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _16
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-112(%rbp), %rax	; status, tmp142
	movq	32(%rax), %rax	; status_28(D)->end_labels, _17
	movq	%rdx, %rsi	; _16,
	movq	%rax, %rdi	; _17,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	-104(%rbp), %rax	; while_, tmp143
	movq	8(%rax), %rax	; while__43(D)->body, _18
	movq	%rax, %rdi	; _18,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp144, body_statements
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L188	;
.L189:
; src/tac.c:635:         tac_statement(statement, status);
	movq	-112(%rbp), %rdx	; status, tmp145
	movq	-88(%rbp), %rax	; statement, tmp146
	movq	%rdx, %rsi	; tmp145,
	movq	%rax, %rdi	; tmp146,
	call	tac_statement	;
.L188:
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-80(%rbp), %rax	; body_statements, tmp147
	movq	%rax, %rdi	; tmp147,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp148, statement
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L189	;,
; src/tac.c:636:     list_pop_back(status->start_labels);
	movq	-112(%rbp), %rax	; status, tmp149
	movq	40(%rax), %rax	; status_28(D)->start_labels, _19
	movq	%rax, %rdi	; _19,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:637:     list_pop_back(status->end_labels);
	movq	-112(%rbp), %rax	; status, tmp150
	movq	32(%rax), %rax	; status_28(D)->end_labels, _20
	movq	%rax, %rdi	; _20,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	; condition_label, tmp151
	movq	%rax, %rsi	; tmp151,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _21,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp152, inst
; src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp153
	movq	16(%rax), %rax	; status_28(D)->current_block, _22
; src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _22->instructions, _23
	movq	-32(%rbp), %rdx	; inst, tmp154
	movq	%rdx, %rsi	; tmp154,
	movq	%rax, %rdi	; _23,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:642:     Block* end_block = create_block(end_label);
	movq	-56(%rbp), %rax	; end_label, tmp155
	movq	%rax, %rdi	; tmp155,
	call	create_block	;
	movq	%rax, -96(%rbp)	; tmp156, end_block
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-112(%rbp), %rax	; status, tmp157
	movq	8(%rax), %rax	; status_28(D)->current_subroutine, _24
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _24->blocks, _25
	movq	-96(%rbp), %rdx	; end_block, tmp158
	movq	%rdx, %rsi	; tmp158,
	movq	%rax, %rdi	; _25,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:644:     status->current_block = end_block;
	movq	-112(%rbp), %rax	; status, tmp159
	movq	-96(%rbp), %rdx	; end_block, tmp160
	movq	%rdx, 16(%rax)	; tmp160, status_28(D)->current_block
; src/tac.c:646: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	tac_while, .-tac_while
	.section	.rodata
	.align 8
.LC14:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -72(%rbp)	; expression, expression
	movq	%rsi, -80(%rbp)	; status, status
; src/tac.c:649:     if (expression->operator == OP_NONE) {
	movq	-72(%rbp), %rax	; expression, tmp105
	movl	24(%rax), %eax	; expression_31(D)->operator, _1
; src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	;, _1
	jne	.L191	;,
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	-72(%rbp), %rax	; expression, tmp106
	movq	8(%rax), %rax	; expression_31(D)->prim_left, _2
	movq	-80(%rbp), %rdx	; status, tmp107
	movq	%rdx, %rsi	; tmp107,
	movq	%rax, %rdi	; _2,
	call	tac_primary	;
	movq	%rax, -56(%rbp)	; tmp108, result
; src/tac.c:652:         return result;
	movq	-56(%rbp), %rax	; result, _25
	jmp	.L192	;
.L191:
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	-72(%rbp), %rax	; expression, tmp109
	movq	16(%rax), %rax	; expression_31(D)->right, _3
	movq	-80(%rbp), %rdx	; status, tmp110
	movq	%rdx, %rsi	; tmp110,
	movq	%rax, %rdi	; _3,
	call	tac_expression	;
	movq	%rax, %rdx	;, _4
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	-80(%rbp), %rax	; status, tmp111
	movq	%rax, %rsi	; tmp111,
	movq	%rdx, %rdi	; _4,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp112, right
; src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movq	-72(%rbp), %rax	; expression, tmp113
	movl	24(%rax), %eax	; expression_31(D)->operator, _5
	movl	%eax, %edi	; _5,
	call	get_instruction_type	;
	movl	%eax, -20(%rbp)	; tmp114, op
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	-72(%rbp), %rax	; expression, tmp115
	movq	(%rax), %rax	; expression_31(D)->expr_left, _6
	movq	-80(%rbp), %rdx	; status, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; _6,
	call	tac_expression	;
	movq	%rax, -32(%rbp)	; tmp117, left
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	movq	-72(%rbp), %rax	; expression, tmp118
	movl	24(%rax), %eax	; expression_31(D)->operator, _7
	movl	%eax, %edi	; _7,
	call	is_assignment_operator	;
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	testb	%al, %al	; _8
	je	.L193	;,
; src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, -20(%rbp)	;, op
	je	.L194	;,
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	; left, tmp119
	movq	8(%rax), %rax	; left_39->type, _9
	movq	-80(%rbp), %rdx	; status, tmp120
	movq	%rdx, %rcx	; tmp120,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _9,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _10,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp121, temp
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-80(%rbp), %rdx	; status, tmp122
	movq	-32(%rbp), %rax	; left, tmp123
	movq	%rdx, %rsi	; tmp122,
	movq	%rax, %rdi	; tmp123,
	call	load_rvalue	;
	movq	%rax, %rdi	;, _11
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %rdx	; right, tmp124
	movq	-48(%rbp), %rsi	; temp, tmp125
	movl	-20(%rbp), %eax	; op, tmp126
	movq	%rdx, %rcx	; tmp124,
	movq	%rdi, %rdx	; _11,
	movl	%eax, %edi	; tmp126,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp127, inst
; src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-80(%rbp), %rax	; status, tmp128
	movq	16(%rax), %rax	; status_32(D)->current_block, _12
; src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-16(%rbp), %rdx	; inst, tmp129
	movq	%rdx, %rsi	; tmp129,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:663:             right = temp;
	movq	-48(%rbp), %rax	; temp, tmp130
	movq	%rax, -8(%rbp)	; tmp130, right
.L194:
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movq	-32(%rbp), %rax	; left, tmp131
	movl	16(%rax), %eax	; left_39->kind, _14
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	testl	%eax, %eax	; _14
	je	.L195	;,
; src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movq	stderr(%rip), %rax	; stderr, stderr.21_15
	movq	%rax, %rcx	; stderr.21_15,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	*fwrite@GOTPCREL(%rip)	;
.L195:
; src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	-8(%rbp), %rdx	; right, tmp133
	movq	-32(%rbp), %rax	; left, tmp134
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp134,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp135, inst
; src/tac.c:668:         if (left->is_get)
	movq	-32(%rbp), %rax	; left, tmp136
	movzbl	20(%rax), %eax	; left_39->is_get, _16
; src/tac.c:668:         if (left->is_get)
	testb	%al, %al	; _16
	je	.L196	;,
; src/tac.c:669:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	-8(%rbp), %rdx	; right, tmp137
	movq	-32(%rbp), %rax	; left, tmp138
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp138,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp139, inst
	jmp	.L196	;
.L193:
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	; left, tmp140
	movq	8(%rax), %rax	; left_39->type, _17
	movq	-80(%rbp), %rdx	; status, tmp141
	movq	%rdx, %rcx	; tmp141,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _17,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _18,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp142, temp
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-80(%rbp), %rdx	; status, tmp143
	movq	-32(%rbp), %rax	; left, tmp144
	movq	%rdx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	load_rvalue	;
	movq	%rax, %rdi	;, _19
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %rdx	; right, tmp145
	movq	-40(%rbp), %rsi	; temp, tmp146
	movl	-20(%rbp), %eax	; op, tmp147
	movq	%rdx, %rcx	; tmp145,
	movq	%rdi, %rdx	; _19,
	movl	%eax, %edi	; tmp147,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp148, inst
; src/tac.c:673:         right = temp;
	movq	-40(%rbp), %rax	; temp, tmp149
	movq	%rax, -8(%rbp)	; tmp149, right
.L196:
; src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-80(%rbp), %rax	; status, tmp150
	movq	16(%rax), %rax	; status_32(D)->current_block, _20
; src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _20->instructions, _21
	movq	-16(%rbp), %rdx	; inst, tmp151
	movq	%rdx, %rsi	; tmp151,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:677:     return right;
	movq	-8(%rbp), %rax	; right, _25
.L192:
; src/tac.c:678: }
	leave	
	ret	
	.size	tac_expression, .-tac_expression
	.section	.rodata
	.align 8
.LC16:
	.string	"[Warning] Unsupported type for negation: %s\n"
	.align 8
.LC17:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -104(%rbp)	; primary, primary
	movq	%rsi, -112(%rbp)	; status, status
; src/tac.c:681:     switch (primary->type) {
	movq	-104(%rbp), %rax	; primary, tmp115
	movl	8(%rax), %eax	; primary_39(D)->type, _1
; src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %eax	;, _1
	ja	.L198	;,
	movl	%eax, %eax	; _1, tmp116
	leaq	0(,%rax,4), %rdx	;, tmp117
	leaq	.L200(%rip), %rax	;, tmp118
	movl	(%rdx,%rax), %eax	;, tmp119
	cltq
	leaq	.L200(%rip), %rdx	;, tmp122
	addq	%rdx, %rax	; tmp122, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L200:
	.long	.L208-.L200
	.long	.L207-.L200
	.long	.L206-.L200
	.long	.L205-.L200
	.long	.L204-.L200
	.long	.L203-.L200
	.long	.L202-.L200
	.long	.L201-.L200
	.long	.L199-.L200
	.text
.L208:
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	-104(%rbp), %rax	; primary, tmp123
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _2
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movl	$10, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _2,
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, -56(%rbp)	; _3, t
; src/tac.c:685:             return create_arg(ARG_INT, &t);
	leaq	-56(%rbp), %rax	;, tmp124
	movq	%rax, %rsi	; tmp124,
	movl	$1, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L207:
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	-104(%rbp), %rax	; primary, tmp125
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _4
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _4,
	call	*strtod@GOTPCREL(%rip)	;
	movq	%xmm0, %rax	;, _5
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	%rax, -64(%rbp)	; _5, t
; src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	leaq	-64(%rbp), %rax	;, tmp126
	movq	%rax, %rsi	; tmp126,
	movl	$2, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L206:
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	-104(%rbp), %rax	; primary, tmp127
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _6
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%rax, %rsi	; _6,
	movl	$3, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L205:
; src/tac.c:695:             bool t = true;
	movb	$1, -65(%rbp)	;, t
; src/tac.c:697:             return create_arg(ARG_BOOL, &t);
	leaq	-65(%rbp), %rax	;, tmp128
	movq	%rax, %rsi	; tmp128,
	movl	$4, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L204:
; src/tac.c:700:             bool t = false;
	movb	$0, -66(%rbp)	;, t
; src/tac.c:702:             return create_arg(ARG_BOOL, &t);
	leaq	-66(%rbp), %rax	;, tmp129
	movq	%rax, %rsi	; tmp129,
	movl	$4, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L203:
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	-104(%rbp), %rax	; primary, tmp130
	movq	(%rax), %rax	; primary_39(D)->value.expr, _7
	movq	-112(%rbp), %rdx	; status, tmp131
	movq	%rdx, %rsi	; tmp131,
	movq	%rax, %rdi	; _7,
	call	tac_expression	;
	jmp	.L209	;
.L202:
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-104(%rbp), %rax	; primary, tmp132
	movq	(%rax), %rax	; primary_39(D)->value.operand, _8
	movq	-112(%rbp), %rdx	; status, tmp133
	movq	%rdx, %rsi	; tmp133,
	movq	%rax, %rdi	; _8,
	call	tac_primary	;
	movq	%rax, %rdx	;, _9
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-112(%rbp), %rax	; status, tmp134
	movq	%rax, %rsi	; tmp134,
	movq	%rdx, %rdi	; _9,
	call	load_rvalue	;
	movq	%rax, -32(%rbp)	; tmp135, operand
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	name_bool(%rip), %rax	; name_bool, name_bool.23_10
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	-112(%rbp), %rdx	; status, tmp136
	movq	%rdx, %rcx	; tmp136,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; name_bool.23_10,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rsi	; _11,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp137, temp
; src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	-32(%rbp), %rdx	; operand, tmp138
	movq	-40(%rbp), %rax	; temp, tmp139
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp139,
	movl	$13, %edi	;,
	call	create_instruction	;
	movq	%rax, -48(%rbp)	; tmp140, inst
; src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp141
	movq	16(%rax), %rax	; status_40(D)->current_block, _12
; src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-48(%rbp), %rdx	; inst, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:713:             return temp;
	movq	-40(%rbp), %rax	; temp, _34
	jmp	.L209	;
.L201:
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-104(%rbp), %rax	; primary, tmp143
	movq	(%rax), %rax	; primary_39(D)->value.operand, _14
	movq	-112(%rbp), %rdx	; status, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _14,
	call	tac_primary	;
	movq	%rax, %rdx	;, _15
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-112(%rbp), %rax	; status, tmp145
	movq	%rax, %rsi	; tmp145,
	movq	%rdx, %rdi	; _15,
	call	load_rvalue	;
	movq	%rax, -16(%rbp)	; tmp146, operand
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	-16(%rbp), %rax	; operand, tmp147
	movq	8(%rax), %rax	; operand_45->type, _16
	movq	-112(%rbp), %rdx	; status, tmp148
	movq	%rdx, %rcx	; tmp148,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _16,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _17,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -24(%rbp)	; tmp149, temp
; src/tac.c:718:             Instruction* inst = NULL;
	movq	$0, -8(%rbp)	;, inst
; src/tac.c:719:             long long zero_int = 0;
	movq	$0, -80(%rbp)	;, zero_int
; src/tac.c:720:             double neg_one_float = -1.0;
	movsd	.LC15(%rip), %xmm0	;, tmp150
	movsd	%xmm0, -88(%rbp)	; tmp150, neg_one_float
; src/tac.c:721:             if (operand->type == name_int)
	movq	-16(%rbp), %rax	; operand, tmp151
	movq	8(%rax), %rdx	; operand_45->type, _18
; src/tac.c:721:             if (operand->type == name_int)
	movq	name_int(%rip), %rax	; name_int, name_int.24_19
; src/tac.c:721:             if (operand->type == name_int)
	cmpq	%rax, %rdx	; name_int.24_19, _18
	jne	.L210	;,
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	-80(%rbp), %rax	;, tmp152
	movq	%rax, %rsi	; tmp152,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _20
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	-16(%rbp), %rdx	; operand, tmp153
	movq	-24(%rbp), %rax	; temp, tmp154
	movq	%rdx, %rcx	; tmp153,
	movq	%rsi, %rdx	; _20,
	movq	%rax, %rsi	; tmp154,
	movl	$1, %edi	;,
	call	create_instruction	;
	movq	%rax, -8(%rbp)	; tmp155, inst
	jmp	.L211	;
.L210:
; src/tac.c:723:             else if (operand->type == name_float)
	movq	-16(%rbp), %rax	; operand, tmp156
	movq	8(%rax), %rdx	; operand_45->type, _21
; src/tac.c:723:             else if (operand->type == name_float)
	movq	name_float(%rip), %rax	; name_float, name_float.25_22
; src/tac.c:723:             else if (operand->type == name_float)
	cmpq	%rax, %rdx	; name_float.25_22, _21
	jne	.L212	;,
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	-88(%rbp), %rax	;, tmp157
	movq	%rax, %rsi	; tmp157,
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _23
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	-16(%rbp), %rdx	; operand, tmp158
	movq	-24(%rbp), %rax	; temp, tmp159
	movq	%rdx, %rcx	; tmp158,
	movq	%rsi, %rdx	; _23,
	movq	%rax, %rsi	; tmp159,
	movl	$2, %edi	;,
	call	create_instruction	;
	movq	%rax, -8(%rbp)	; tmp160, inst
	jmp	.L211	;
.L212:
; src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	-16(%rbp), %rax	; operand, tmp161
	movq	8(%rax), %rax	; operand_45->type, _24
; src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rdx	; _24->name, _25
	movq	stderr(%rip), %rax	; stderr, stderr.26_26
	leaq	.LC16(%rip), %rcx	;, tmp162
	movq	%rcx, %rsi	; tmp162,
	movq	%rax, %rdi	; stderr.26_26,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:728:                 return NULL;
	movl	$0, %eax	;, _34
	jmp	.L209	;
.L211:
; src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp163
	movq	16(%rax), %rax	; status_40(D)->current_block, _27
; src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _27->instructions, _28
	movq	-8(%rbp), %rdx	; inst, tmp164
	movq	%rdx, %rsi	; tmp164,
	movq	%rax, %rdi	; _28,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:732:             return temp;
	movq	-24(%rbp), %rax	; temp, _34
	jmp	.L209	;
.L199:
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	-104(%rbp), %rax	; primary, tmp165
	movq	(%rax), %rax	; primary_39(D)->value.var, _29
	movq	-112(%rbp), %rdx	; status, tmp166
	movq	%rdx, %rsi	; tmp166,
	movq	%rax, %rdi	; _29,
	call	tac_variable_access	;
	jmp	.L209	;
.L198:
; src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	-104(%rbp), %rax	; primary, tmp167
	movl	8(%rax), %edx	; primary_39(D)->type, _30
; src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	stderr(%rip), %rax	; stderr, stderr.27_31
	leaq	.LC17(%rip), %rcx	;, tmp168
	movq	%rcx, %rsi	; tmp168,
	movq	%rax, %rdi	; stderr.27_31,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:740:             return NULL;
	movl	$0, %eax	;, _34
.L209:
; src/tac.c:742: }
	leave	
	ret	
	.size	tac_primary, .-tac_primary
	.section	.rodata
	.align 8
.LC18:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC19:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC20:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC21:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC22:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC23:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC24:
	.string	"arr"
	.align 8
.LC25:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC26:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC27:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC28:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$192, %rsp	;,
	movq	%rdi, -184(%rbp)	; variable_access, variable_access
	movq	%rsi, -192(%rbp)	; status, status
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	-184(%rbp), %rax	; variable_access, tmp228
	movl	16(%rax), %eax	; variable_access_156(D)->type, _1
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testl	%eax, %eax	; _1
	jne	.L215	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	-184(%rbp), %rax	; variable_access, tmp229
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _2
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rax, %rax	; _2
	je	.L215	;,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movq	-184(%rbp), %rax	; variable_access, tmp230
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _3
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _3->kind, _4
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %eax	;, _4
	je	.L216	;,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movq	-184(%rbp), %rax	; variable_access, tmp231
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _5
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _5->kind, _6
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$2, %eax	;, _6
	jne	.L217	;,
.L216:
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	-184(%rbp), %rax	; variable_access, tmp232
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _7
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; _7->type, _8
	movq	-184(%rbp), %rax	; variable_access, tmp233
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _9
	movq	-192(%rbp), %rdx	; status, tmp234
	movq	%rdx, %rcx	; tmp234,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; _9,
	call	create_var	;
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _10,
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp235, result
; src/tac.c:749:             return result;
	movq	-40(%rbp), %rax	; result, _148
	jmp	.L218	;
.L217:
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	movq	-184(%rbp), %rax	; variable_access, tmp236
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _11
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	movl	32(%rax), %eax	; _11->kind, _12
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _12
	jne	.L219	;,
; src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	-184(%rbp), %rax	; variable_access, tmp237
	movq	8(%rax), %rsi	; variable_access_156(D)->content.name, _13
	movq	-184(%rbp), %rax	; variable_access, tmp238
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _14
	movq	-192(%rbp), %rdx	; status, tmp239
	movq	%rdx, %rcx	; tmp239,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _14,
	call	create_var	;
; src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rax, %rsi	; _15,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -32(%rbp)	; tmp240, result
; src/tac.c:753:             return result;
	movq	-32(%rbp), %rax	; result, _148
	jmp	.L218	;
.L219:
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	-184(%rbp), %rax	; variable_access, tmp241
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _16
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rax), %rsi	; _16->type, _17
	movq	-184(%rbp), %rax	; variable_access, tmp242
	movq	8(%rax), %rax	; variable_access_156(D)->content.name, _18
	movq	-192(%rbp), %rdx	; status, tmp243
	movq	%rdx, %rcx	; tmp243,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _18,
	call	create_var	;
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rsi	; _19,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -24(%rbp)	; tmp244, result
; src/tac.c:757:             return result;
	movq	-24(%rbp), %rax	; result, _148
	jmp	.L218	;
.L215:
; src/tac.c:760:     if (variable_access->base == NULL) {
	movq	-184(%rbp), %rax	; variable_access, tmp245
	movq	(%rax), %rax	; variable_access_156(D)->base, _20
; src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rax, %rax	; _20
	jne	.L220	;,
; src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	stderr(%rip), %rax	; stderr, stderr.28_21
	movq	%rax, %rcx	; stderr.28_21,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rax	;, tmp246
	movq	%rax, %rdi	; tmp246,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:763:         return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L220:
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	-184(%rbp), %rax	; variable_access, tmp247
	movq	(%rax), %rax	; variable_access_156(D)->base, _22
	movq	-192(%rbp), %rdx	; status, tmp248
	movq	%rdx, %rsi	; tmp248,
	movq	%rax, %rdi	; _22,
	call	tac_variable_access	;
	movq	%rax, %rdx	;, _23
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	-192(%rbp), %rax	; status, tmp249
	movq	%rax, %rsi	; tmp249,
	movq	%rdx, %rdi	; _23,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp250, base
; src/tac.c:766:     if (base == NULL) {
	cmpq	$0, -8(%rbp)	;, base
	jne	.L221	;,
; src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	stderr(%rip), %rax	; stderr, stderr.29_24
	movq	%rax, %rcx	; stderr.29_24,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rax	;, tmp251
	movq	%rax, %rdi	; tmp251,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:769:         return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L221:
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movq	-184(%rbp), %rax	; variable_access, tmp252
	movl	16(%rax), %eax	; variable_access_156(D)->type, _25
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %eax	;, _25
	jne	.L222	;,
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-8(%rbp), %rax	; base, tmp253
	movq	8(%rax), %rax	; base_172->type, _26
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _26->kind, _27
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %eax	;, _27
	je	.L223	;,
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-8(%rbp), %rax	; base, tmp254
	movq	8(%rax), %rax	; base_172->type, _28
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _28->kind, _29
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$2, %eax	;, _29
	jne	.L224	;,
.L223:
; src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	-8(%rbp), %rax	; base, tmp255
	movq	8(%rax), %rax	; base_172->type, _30
; src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rdx	; _30->name, _31
	movq	stderr(%rip), %rax	; stderr, stderr.30_32
	leaq	.LC20(%rip), %rcx	;, tmp256
	movq	%rcx, %rsi	; tmp256,
	movq	%rax, %rdi	; stderr.30_32,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:775:             return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L224:
; src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	-8(%rbp), %rax	; base, tmp257
	movq	8(%rax), %rax	; base_172->type, _33
; src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rax	; _33->ast_node.scope, tmp258
	movq	%rax, -16(%rbp)	; tmp258, scope
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	movq	-8(%rbp), %rax	; base, tmp259
	movq	8(%rax), %rax	; base_172->type, _34
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _34->kind, _35
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _35
	jne	.L225	;,
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	-8(%rbp), %rax	; base, tmp260
	movq	8(%rax), %rax	; base_172->type, _36
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	24(%rax), %rax	; _36->ast_node.class, _37
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rax), %rax	; _37->class_scope, tmp261
	movq	%rax, -16(%rbp)	; tmp261, scope
.L225:
; src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	-184(%rbp), %rax	; variable_access, tmp262
	movq	8(%rax), %rax	; variable_access_156(D)->content.attr_name, _38
; src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rax), %rdx	; _38->name, _39
	movq	-16(%rbp), %rax	; scope, tmp263
	movq	%rdx, %rsi	; _39,
	movq	%rax, %rdi	; tmp263,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -136(%rbp)	; tmp264, attr
; src/tac.c:781:         if (attr == NULL) {
	cmpq	$0, -136(%rbp)	;, attr
	jne	.L226	;,
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp265
	movq	8(%rax), %rax	; base_172->type, _40
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rcx	; _40->name, _41
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-184(%rbp), %rax	; variable_access, tmp266
	movq	8(%rax), %rax	; variable_access_156(D)->content.attr_name, _42
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rdx	; _42->name, _43
	movq	stderr(%rip), %rax	; stderr, stderr.31_44
	leaq	.LC21(%rip), %rsi	;, tmp267
	movq	%rax, %rdi	; stderr.31_44,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L226:
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movq	-136(%rbp), %rax	; attr, tmp268
	movl	32(%rax), %eax	; attr_242->kind, _45
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	;, _45
	jne	.L227	;,
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp269
	movq	8(%rax), %rax	; base_172->type, _46
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rcx	; _46->name, _47
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-184(%rbp), %rax	; variable_access, tmp270
	movq	8(%rax), %rax	; variable_access_156(D)->content.attr_name, _48
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rdx	; _48->name, _49
	movq	stderr(%rip), %rax	; stderr, stderr.32_50
	leaq	.LC22(%rip), %rsi	;, tmp271
	movq	%rax, %rdi	; stderr.32_50,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-136(%rbp), %rax	; attr, tmp272
	movq	(%rax), %rsi	; attr_242->type, _51
	movq	-192(%rbp), %rdx	; status, tmp273
	movq	-136(%rbp), %rax	; attr, tmp274
	movq	%rdx, %rcx	; tmp273,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp274,
	call	create_var	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _52,
	movl	$7, %edi	;,
	call	create_arg	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L218	;
.L227:
; src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	movq	-136(%rbp), %rax	; attr, tmp275
	movl	32(%rax), %eax	; attr_242->kind, _53
; src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _53
	jne	.L228	;,
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-136(%rbp), %rax	; attr, tmp276
	movq	(%rax), %rsi	; attr_242->type, _54
	movq	-192(%rbp), %rdx	; status, tmp277
	movq	-136(%rbp), %rax	; attr, tmp278
	movq	%rdx, %rcx	; tmp277,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp278,
	call	create_var	;
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _55,
	movl	$8, %edi	;,
	call	create_arg	;
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L218	;
.L228:
; src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	movq	-136(%rbp), %rax	; attr, tmp279
	movl	32(%rax), %eax	; attr_242->kind, _56
; src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _56
	je	.L229	;,
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp280
	movq	8(%rax), %rax	; base_172->type, _57
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rcx	; _57->name, _58
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	-184(%rbp), %rax	; variable_access, tmp281
	movq	8(%rax), %rax	; variable_access_156(D)->content.attr_name, _59
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rdx	; _59->name, _60
	movq	stderr(%rip), %rax	; stderr, stderr.33_61
	leaq	.LC23(%rip), %rsi	;, tmp282
	movq	%rax, %rdi	; stderr.33_61,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:795:             return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L229:
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	-136(%rbp), %rax	; attr, tmp283
	movq	(%rax), %rax	; attr_242->type, _62
	movq	-192(%rbp), %rdx	; status, tmp284
	movq	%rdx, %rcx	; tmp284,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _62,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _63,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -144(%rbp)	; tmp285, temp
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	-184(%rbp), %rax	; variable_access, tmp286
	movq	8(%rax), %rax	; variable_access_156(D)->content.attr_name, _64
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rax), %rsi	; _64->type, _65
	movq	-184(%rbp), %rax	; variable_access, tmp287
	movq	8(%rax), %rax	; variable_access_156(D)->content.attr_name, _66
	movq	-192(%rbp), %rdx	; status, tmp288
	movq	%rdx, %rcx	; tmp288,
	movl	$97, %edx	;,
	movq	%rax, %rdi	; _66,
	call	create_var	;
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rsi	; _67,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _68
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	-8(%rbp), %rdx	; base, tmp289
	movq	-144(%rbp), %rax	; temp, tmp290
	movq	%rax, %rsi	; tmp290,
	movl	$15, %edi	;,
	call	create_instruction	;
	movq	%rax, -152(%rbp)	; tmp291, inst
; src/tac.c:799:         temp->is_get = true;
	movq	-144(%rbp), %rax	; temp, tmp292
	movb	$1, 20(%rax)	;, temp_245->is_get
; src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp293
	movq	16(%rax), %rax	; status_157(D)->current_block, _69
; src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _69->instructions, _70
	movq	-152(%rbp), %rdx	; inst, tmp294
	movq	%rdx, %rsi	; tmp294,
	movq	%rax, %rdi	; _70,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:802:         return temp;
	movq	-144(%rbp), %rax	; temp, _148
	jmp	.L218	;
.L222:
; src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	movq	-184(%rbp), %rax	; variable_access, tmp295
	movl	16(%rax), %eax	; variable_access_156(D)->type, _71
; src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %eax	;, _71
	jne	.L230	;,
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	-8(%rbp), %rax	; base, tmp296
	movq	8(%rax), %rax	; base_172->type, _72
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	; _72->name, _73
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC24(%rip), %rdx	;, tmp297
	movq	%rdx, %rsi	; tmp297,
	movq	%rax, %rdi	; _73,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; _74
	je	.L231	;,
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	-8(%rbp), %rax	; base, tmp298
	movq	(%rax), %rax	; base_172->value.variable, _75
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	; _75->original_name, _76
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	8(%rax), %rdx	; _76->name, _77
	movq	stderr(%rip), %rax	; stderr, stderr.34_78
	leaq	.LC25(%rip), %rcx	;, tmp299
	movq	%rcx, %rsi	; tmp299,
	movq	%rax, %rdi	; stderr.34_78,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:808:             return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L231:
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	-184(%rbp), %rax	; variable_access, tmp300
	movq	8(%rax), %rax	; variable_access_156(D)->content.index, _79
	movq	-192(%rbp), %rdx	; status, tmp301
	movq	%rdx, %rsi	; tmp301,
	movq	%rax, %rdi	; _79,
	call	tac_expression	;
	movq	%rax, %rdx	;, _80
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	-192(%rbp), %rax	; status, tmp302
	movq	%rax, %rsi	; tmp302,
	movq	%rdx, %rdi	; _80,
	call	load_rvalue	;
	movq	%rax, -112(%rbp)	; tmp303, index
; src/tac.c:811:         if (index == NULL) {
	cmpq	$0, -112(%rbp)	;, index
	jne	.L232	;,
; src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	stderr(%rip), %rax	; stderr, stderr.35_81
	movq	%rax, %rcx	; stderr.35_81,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rax	;, tmp304
	movq	%rax, %rdi	; tmp304,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:814:             return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L232:
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	name_int(%rip), %rax	; name_int, name_int.36_82
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	-192(%rbp), %rdx	; status, tmp305
	movq	%rdx, %rcx	; tmp305,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; name_int.36_82,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rsi	; _83,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -120(%rbp)	; tmp306, temp
; src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	-112(%rbp), %rcx	; index, tmp307
	movq	-8(%rbp), %rdx	; base, tmp308
	movq	-120(%rbp), %rax	; temp, tmp309
	movq	%rax, %rsi	; tmp309,
	movl	$16, %edi	;,
	call	create_instruction	;
	movq	%rax, -128(%rbp)	; tmp310, inst
; src/tac.c:820:         temp->is_get = true;
	movq	-120(%rbp), %rax	; temp, tmp311
	movb	$1, 20(%rax)	;, temp_229->is_get
; src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp312
	movq	16(%rax), %rax	; status_157(D)->current_block, _84
; src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _84->instructions, _85
	movq	-128(%rbp), %rdx	; inst, tmp313
	movq	%rdx, %rsi	; tmp313,
	movq	%rax, %rdi	; _85,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:823:         return temp;
	movq	-120(%rbp), %rax	; temp, _148
	jmp	.L218	;
.L230:
; src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	movq	-184(%rbp), %rax	; variable_access, tmp314
	movl	16(%rax), %eax	; variable_access_156(D)->type, _86
; src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %eax	;, _86
	jne	.L233	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-8(%rbp), %rax	; base, tmp315
	movl	16(%rax), %eax	; base_172->kind, _87
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _87
	jne	.L234	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-8(%rbp), %rax	; base, tmp316
	movq	8(%rax), %rax	; base_172->type, _88
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %eax	; _88->kind, _89
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _89
	jne	.L234	;,
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.37_90
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-8(%rbp), %rax	; base, tmp317
	movq	8(%rax), %rax	; base_172->type, _91
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rax	; _91->name, _92
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.37_90,
	movq	%rax, %rdi	; _92,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _93
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-8(%rbp), %rax	; base, tmp318
	movq	8(%rax), %rax	; base_172->type, _94
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _94->ast_node.class, _95
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	16(%rax), %rax	; _95->class_scope, _96
	movq	%rdx, %rsi	; _93,
	movq	%rax, %rdi	; _96,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp319, attr
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-48(%rbp), %rax	; attr, tmp320
	movq	(%rax), %rsi	; attr_177->type, _97
	movq	-192(%rbp), %rdx	; status, tmp321
	movq	-48(%rbp), %rax	; attr, tmp322
	movq	%rdx, %rcx	; tmp321,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp322,
	call	create_var	;
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _98,
	movl	$8, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp323, base
.L234:
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movq	-8(%rbp), %rax	; base, tmp324
	movl	16(%rax), %eax	; base_145->kind, _99
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$8, %eax	;, _99
	je	.L235	;,
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movq	-8(%rbp), %rax	; base, tmp325
	movl	16(%rax), %eax	; base_145->kind, _100
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$7, %eax	;, _100
	je	.L235	;,
; src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp326
	movq	8(%rax), %rax	; base_145->type, _101
; src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rcx	; _101->name, _102
; src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp327
	movl	16(%rax), %edx	; base_145->kind, _103
; src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	stderr(%rip), %rax	; stderr, stderr.38_104
	leaq	.LC27(%rip), %rsi	;, tmp328
	movq	%rax, %rdi	; stderr.38_104,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:832:             return NULL;
	movl	$0, %eax	;, _148
	jmp	.L218	;
.L235:
; src/tac.c:834:         long long arg_count = 0;
	movq	$0, -160(%rbp)	;, arg_count
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp329, arguments
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	-8(%rbp), %rax	; base, tmp330
	movl	16(%rax), %eax	; base_145->kind, _105
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, %eax	;, _105
	jne	.L237	;,
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.39_106
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	-8(%rbp), %rax	; base, tmp331
	movq	8(%rax), %rax	; base_145->type, _107
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rax	; _107->name, _108
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.39_106,
	movq	%rax, %rdi	; _108,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _109
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	-8(%rbp), %rax	; base, tmp332
	movq	(%rax), %rax	; base_145->value.subroutine, _110
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	; _110->original_name, _111
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rax	; _111->name, _112
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	%rdx, %rsi	; _109,
	movq	%rax, %rdi	; _112,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	; _113
	je	.L237	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	-184(%rbp), %rax	; variable_access, tmp333
	movq	(%rax), %rax	; variable_access_156(D)->base, _114
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	(%rax), %rax	; _114->base, _115
	movq	%rax, %r8	; _115,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; _116,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _117
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	-192(%rbp), %rax	; status, tmp334
	movq	%rax, %rsi	; tmp334,
	movq	%rdx, %rdi	; _117,
	call	tac_expression	;
	movq	%rax, %rdx	;, _118
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	-192(%rbp), %rax	; status, tmp335
	movq	%rax, %rsi	; tmp335,
	movq	%rdx, %rdi	; _118,
	call	load_rvalue	;
	movq	%rax, -64(%rbp)	; tmp336, self
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	-64(%rbp), %rax	; self, tmp337
	movq	8(%rax), %rax	; self_191->type, _119
	movq	%rax, %rdi	; _119,
	call	get_type_size	;
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, -168(%rbp)	; _121, size
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	-168(%rbp), %rax	;, tmp338
	movq	%rax, %rsi	; tmp338,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _122
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	-64(%rbp), %rax	; self, tmp339
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp339,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _123
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	-56(%rbp), %rax	; arguments, tmp340
	movq	%rdx, %rsi	; _123,
	movq	%rax, %rdi	; tmp340,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:840:             arg_count++;
	movq	-160(%rbp), %rax	; arg_count, arg_count.40_124
	addq	$1, %rax	;, _125
	movq	%rax, -160(%rbp)	; _125, arg_count
.L237:
; src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	-184(%rbp), %rax	; variable_access, tmp341
	movq	8(%rax), %rax	; variable_access_156(D)->content.args, _126
	movq	%rax, %rdi	; _126,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -72(%rbp)	; tmp342, args
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L238	;
.L239:
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	-192(%rbp), %rdx	; status, tmp343
	movq	-80(%rbp), %rax	; arg_expr, tmp344
	movq	%rdx, %rsi	; tmp343,
	movq	%rax, %rdi	; tmp344,
	call	tac_expression	;
	movq	%rax, %rdx	;, _127
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	-192(%rbp), %rax	; status, tmp345
	movq	%rax, %rsi	; tmp345,
	movq	%rdx, %rdi	; _127,
	call	load_rvalue	;
	movq	%rax, -104(%rbp)	; tmp346, arg
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	-104(%rbp), %rax	; arg, tmp347
	movq	8(%rax), %rax	; arg_215->type, _128
	movq	%rax, %rdi	; _128,
	call	get_type_size	;
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, -176(%rbp)	; _130, size
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	-176(%rbp), %rax	;, tmp348
	movq	%rax, %rsi	; tmp348,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _131
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	-104(%rbp), %rax	; arg, tmp349
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp349,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _132
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	-56(%rbp), %rax	; arguments, tmp350
	movq	%rdx, %rsi	; _132,
	movq	%rax, %rdi	; tmp350,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:848:             arg_count++;
	movq	-160(%rbp), %rax	; arg_count, arg_count.41_133
	addq	$1, %rax	;, _134
	movq	%rax, -160(%rbp)	; _134, arg_count
.L238:
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	-72(%rbp), %rax	; args, tmp351
	movq	%rax, %rdi	; tmp351,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp352, arg_expr
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -80(%rbp)	;, arg_expr
	jne	.L239	;,
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	jmp	.L240	;
.L241:
; src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	-192(%rbp), %rax	; status, tmp353
	movq	16(%rax), %rax	; status_157(D)->current_block, _135
; src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	8(%rax), %rax	; _135->instructions, _136
	movq	-88(%rbp), %rdx	; arg, tmp354
	movq	%rdx, %rsi	; tmp354,
	movq	%rax, %rdi	; _136,
	call	*list_append@GOTPCREL(%rip)	;
.L240:
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	-56(%rbp), %rax	; arguments, tmp355
	movq	%rax, %rdi	; tmp355,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp356, arg
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	cmpq	$0, -88(%rbp)	;, arg
	jne	.L241	;,
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	-8(%rbp), %rax	; base, tmp357
	movq	8(%rax), %rax	; base_145->type, _137
	movq	-192(%rbp), %rdx	; status, tmp358
	movq	%rdx, %rcx	; tmp358,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _137,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _138,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -96(%rbp)	; tmp359, temp
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	leaq	-160(%rbp), %rax	;, tmp360
	movq	%rax, %rsi	; tmp360,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _139
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	-8(%rbp), %rdx	; base, tmp361
	movq	-96(%rbp), %rax	; temp, tmp362
	movq	%rax, %rsi	; tmp362,
	movl	$22, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _140
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	-192(%rbp), %rax	; status, tmp363
	movq	16(%rax), %rax	; status_157(D)->current_block, _141
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	8(%rax), %rax	; _141->instructions, _142
	movq	%rdx, %rsi	; _140,
	movq	%rax, %rdi	; _142,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:856:         return temp;
	movq	-96(%rbp), %rax	; temp, _148
	jmp	.L218	;
.L233:
; src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	-184(%rbp), %rax	; variable_access, tmp364
	movl	16(%rax), %edx	; variable_access_156(D)->type, _143
; src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	stderr(%rip), %rax	; stderr, stderr.42_144
	leaq	.LC28(%rip), %rcx	;, tmp365
	movq	%rcx, %rsi	; tmp365,
	movq	%rax, %rdi	; stderr.42_144,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:860:         return NULL;
	movl	$0, %eax	;, _148
.L218:
; src/tac.c:862: }
	leave	
	ret	
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata
	.align 8
.LC15:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
