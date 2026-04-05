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
	.string	"[warning] Unsupported type for size lookup: %s\n"
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
; src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
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
	movl	$1, %eax	;, iftmp.21_1
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	jmp	.L15	;
.L14:
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$0, %eax	;, iftmp.21_1
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
	movq	%rax, -8(%rbp)	; tmp92, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	-56(%rbp), %rdx	; status, tmp93
	movq	-32(%rbp), %rsi	; type, tmp94
	movq	-24(%rbp), %rax	; var, tmp95
	movq	%rdx, %rcx	; tmp93,
	movl	$97, %edx	;,
	movq	%rax, %rdi	; tmp95,
	call	create_var	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	-8(%rbp), %rdx	; attr, tmp96
	movq	%rax, (%rdx)	; _1, attr_12->var
; src/tac.c:198:     attr->type = type;
	movq	-8(%rbp), %rax	; attr, tmp97
	movq	-32(%rbp), %rdx	; type, tmp98
	movq	%rdx, 8(%rax)	; tmp98, attr_12->type
; src/tac.c:199:     attr->offset = offset;
	movq	-8(%rbp), %rax	; attr, tmp99
	movq	-48(%rbp), %rdx	; offset, tmp100
	movq	%rdx, 16(%rax)	; tmp100, attr_12->offset
; src/tac.c:200:     if (offset == 0) {
	cmpq	$0, -48(%rbp)	;, offset
	jne	.L80	;,
; src/tac.c:201:         attr->offset = table->size;
	movq	-40(%rbp), %rax	; table, tmp101
	movq	16(%rax), %rdx	; table_21(D)->size, _2
; src/tac.c:201:         attr->offset = table->size;
	movq	-8(%rbp), %rax	; attr, tmp102
	movq	%rdx, 16(%rax)	; _2, attr_12->offset
; src/tac.c:202:         table->size += get_type_size(type);
	movq	-32(%rbp), %rax	; type, tmp103
	movq	%rax, %rdi	; tmp103,
	call	get_type_size	;
; src/tac.c:202:         table->size += get_type_size(type);
	movq	-40(%rbp), %rdx	; table, tmp104
	movq	16(%rdx), %rdx	; table_21(D)->size, _3
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, %rdx	; _24, _4
	movq	-40(%rbp), %rax	; table, tmp105
	movq	%rdx, 16(%rax)	; _4, table_21(D)->size
.L80:
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, -40(%rbp)	;, table
	je	.L81	;,
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	-40(%rbp), %rax	; table, tmp106
	movq	(%rax), %rax	; table_21(D)->attributes, _5
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	; _5
	jne	.L82	;,
.L81:
; src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	stderr(%rip), %rax	; stderr, stderr.6_6
	movq	%rax, %rcx	; stderr.6_6,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L83	;
.L82:
; src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	-40(%rbp), %rax	; table, tmp108
	movq	(%rax), %rax	; table_21(D)->attributes, _7
	movq	-8(%rbp), %rdx	; attr, tmp109
	movq	%rdx, %rsi	; tmp109,
	movq	%rax, %rdi	; _7,
	call	*list_append@GOTPCREL(%rip)	;
.L83:
; src/tac.c:209:     return attr;
	movq	-8(%rbp), %rax	; attr, _28
; src/tac.c:210: }
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
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, inst
; src/tac.c:214:     inst->type = type;
	movq	-8(%rbp), %rax	; inst, tmp85
	movl	-20(%rbp), %edx	; type, tmp86
	movl	%edx, 24(%rax)	; tmp86, inst_3->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	-8(%rbp), %rax	; inst, tmp87
	movq	-32(%rbp), %rdx	; arg1, tmp88
	movq	%rdx, (%rax)	; tmp88, inst_3->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	-8(%rbp), %rax	; inst, tmp89
	movq	-40(%rbp), %rdx	; arg2, tmp90
	movq	%rdx, 8(%rax)	; tmp90, inst_3->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	-8(%rbp), %rax	; inst, tmp91
	movq	-48(%rbp), %rdx	; arg3, tmp92
	movq	%rdx, 16(%rax)	; tmp92, inst_3->arg3
; src/tac.c:219:     return inst;
	movq	-8(%rbp), %rax	; inst, _12
; src/tac.c:220: }
	leave	
	ret	
	.size	create_instruction, .-create_instruction
	.section	.rodata
	.align 8
.LC5:
	.string	"[warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movl	%edi, -20(%rbp)	; kind, kind
	movq	%rsi, -32(%rbp)	; value, value
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp97, arg
; src/tac.c:224:     arg->kind = kind;
	movq	-8(%rbp), %rax	; arg, tmp98
	movl	-20(%rbp), %edx	; kind, tmp99
	movl	%edx, 16(%rax)	; tmp99, arg_17->kind
; src/tac.c:225:     arg->type = NULL;
	movq	-8(%rbp), %rax	; arg, tmp100
	movq	$0, 8(%rax)	;, arg_17->type
; src/tac.c:226:     switch (kind) {
	cmpl	$7, -20(%rbp)	;, kind
	ja	.L88	;,
	movl	-20(%rbp), %eax	; kind, tmp101
	leaq	0(,%rax,4), %rdx	;, tmp102
	leaq	.L90(%rip), %rax	;, tmp103
	movl	(%rdx,%rax), %eax	;, tmp104
	cltq
	leaq	.L90(%rip), %rdx	;, tmp107
	addq	%rdx, %rax	; tmp107, tmp106
	jmp	*%rax	; tmp106
	.section	.rodata
	.align 4
	.align 4
.L90:
	.long	.L97-.L90
	.long	.L96-.L90
	.long	.L95-.L90
	.long	.L94-.L90
	.long	.L93-.L90
	.long	.L92-.L90
	.long	.L91-.L90
	.long	.L89-.L90
	.text
.L97:
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp108
	movq	-32(%rbp), %rdx	; value, tmp109
	movq	%rdx, (%rax)	; tmp109, arg_17->value.variable
; src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	; arg, tmp110
	movq	(%rax), %rax	; arg_17->value.variable, _1
; src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	16(%rax), %rdx	; _1->type, _2
; src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	; arg, tmp111
	movq	%rdx, 8(%rax)	; _2, arg_17->type
; src/tac.c:230:             break;
	jmp	.L98	;
.L96:
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	-32(%rbp), %rax	; value, tmp112
	movq	(%rax), %rdx	; MEM[(long long int *)value_21(D)], _3
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	-8(%rbp), %rax	; arg, tmp113
	movq	%rdx, (%rax)	; _3, arg_17->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rdx	; name_int, name_int.7_4
	movq	-8(%rbp), %rax	; arg, tmp114
	movq	%rdx, 8(%rax)	; name_int.7_4, arg_17->type
; src/tac.c:234:             break;
	jmp	.L98	;
.L95:
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	-32(%rbp), %rax	; value, tmp115
	movsd	(%rax), %xmm0	; MEM[(double *)value_21(D)], _5
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	-8(%rbp), %rax	; arg, tmp116
	movsd	%xmm0, (%rax)	; _5, arg_17->value.float_value
; src/tac.c:237:             arg->type = name_float;
	movq	name_float(%rip), %rdx	; name_float, name_float.8_6
	movq	-8(%rbp), %rax	; arg, tmp117
	movq	%rdx, 8(%rax)	; name_float.8_6, arg_17->type
; src/tac.c:238:             break;
	jmp	.L98	;
.L94:
; src/tac.c:240:             arg->value.string_value = (string)value;
	movq	-8(%rbp), %rax	; arg, tmp118
	movq	-32(%rbp), %rdx	; value, tmp119
	movq	%rdx, (%rax)	; tmp119, arg_17->value.string_value
; src/tac.c:241:             arg->type = name_string;
	movq	name_string(%rip), %rdx	; name_string, name_string.9_7
	movq	-8(%rbp), %rax	; arg, tmp120
	movq	%rdx, 8(%rax)	; name_string.9_7, arg_17->type
; src/tac.c:242:             break;
	jmp	.L98	;
.L93:
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movq	-32(%rbp), %rax	; value, tmp121
	movzbl	(%rax), %edx	; MEM[(char *)value_21(D)], _8
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movq	-8(%rbp), %rax	; arg, tmp122
	movb	%dl, (%rax)	; _8, arg_17->value.bool_value
; src/tac.c:245:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	; name_bool, name_bool.10_9
	movq	-8(%rbp), %rax	; arg, tmp123
	movq	%rdx, 8(%rax)	; name_bool.10_9, arg_17->type
; src/tac.c:246:             break;
	jmp	.L98	;
.L92:
; src/tac.c:248:             arg->value.string_value = NULL;
	movq	-8(%rbp), %rax	; arg, tmp124
	movq	$0, (%rax)	;, arg_17->value.string_value
; src/tac.c:249:             arg->type = name_void;
	movq	name_void(%rip), %rdx	; name_void, name_void.11_10
	movq	-8(%rbp), %rax	; arg, tmp125
	movq	%rdx, 8(%rax)	; name_void.11_10, arg_17->type
; src/tac.c:250:             break;
	jmp	.L98	;
.L91:
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp126
	movq	-32(%rbp), %rdx	; value, tmp127
	movq	%rdx, (%rax)	; tmp127, arg_17->value.label
; src/tac.c:253:             break;
	jmp	.L98	;
.L89:
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp128
	movq	-32(%rbp), %rdx	; value, tmp129
	movq	%rdx, (%rax)	; tmp129, arg_17->value.subroutine
; src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	; arg, tmp130
	movq	(%rax), %rax	; arg_17->value.subroutine, _11
; src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	16(%rax), %rdx	; _11->type, _12
; src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	; arg, tmp131
	movq	%rdx, 8(%rax)	; _12, arg_17->type
; src/tac.c:257:             break;
	jmp	.L98	;
.L88:
; src/tac.c:260:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.12_13
	movl	-20(%rbp), %edx	; kind, tmp132
	leaq	.LC5(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.12_13,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:261:             break;
	nop	
.L98:
; src/tac.c:263:     arg->is_get = false;
	movq	-8(%rbp), %rax	; arg, tmp134
	movb	$0, 20(%rax)	;, arg_17->is_get
; src/tac.c:265:     return arg;
	movq	-8(%rbp), %rax	; arg, _39
; src/tac.c:266: }
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
; src/tac.c:269:     if (arg == NULL) {
	cmpq	$0, -24(%rbp)	;, arg
	jne	.L101	;,
; src/tac.c:271:         return NULL;
	movl	$0, %eax	;, _7
	jmp	.L102	;
.L101:
; src/tac.c:273:     if (arg->is_get) {
	movq	-24(%rbp), %rax	; arg, tmp90
	movzbl	20(%rax), %eax	; arg_9(D)->is_get, _1
; src/tac.c:273:     if (arg->is_get) {
	testb	%al, %al	; _1
	je	.L103	;,
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	-24(%rbp), %rax	; arg, tmp91
	movq	8(%rax), %rax	; arg_9(D)->type, _2
	movq	-32(%rbp), %rdx	; status, tmp92
	movq	%rdx, %rcx	; tmp92,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _2,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _3,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp93, temp
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	-24(%rbp), %rdx	; arg, tmp94
	movq	-8(%rbp), %rax	; temp, tmp95
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp95,
	movl	$23, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _4
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	-32(%rbp), %rax	; status, tmp96
	movq	16(%rax), %rax	; status_12(D)->current_block, _5
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	%rdx, %rsi	; _4,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:277:         return temp;
	movq	-8(%rbp), %rax	; temp, _7
	jmp	.L102	;
.L103:
; src/tac.c:280:     return arg;
	movq	-24(%rbp), %rax	; arg, _7
.L102:
; src/tac.c:281: }
	leave	
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata
.LC6:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; code, code
; src/tac.c:285:     TAC* tac = create_tac();
	call	create_tac	;
	movq	%rax, -8(%rbp)	; tmp97, tac
; src/tac.c:286:     TACStatus* status = create_tac_status(tac);
	movq	-8(%rbp), %rax	; tac, tmp98
	movq	%rax, %rdi	; tmp98,
	call	create_tac_status	;
	movq	%rax, -16(%rbp)	; tmp99, status
; src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	-40(%rbp), %rax	; code, tmp100
	movq	(%rax), %rax	; code_20(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp101, members
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L105	;
.L109:
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movq	-32(%rbp), %rax	; code_member, tmp102
	movl	8(%rax), %eax	; code_member_24->type, _2
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	jne	.L106	;,
; src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	-32(%rbp), %rax	; code_member, tmp103
	movq	(%rax), %rax	; code_member_24->content.function, _3
	movq	-16(%rbp), %rdx	; status, tmp104
	movq	%rdx, %rsi	; tmp104,
	movq	%rax, %rdi	; _3,
	call	tac_function	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	-32(%rbp), %rax	; code_member, tmp105
	movq	(%rax), %rax	; code_member_24->content.function, _4
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rax	; _4->name, _5
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rax), %rax	; _5->name, _6
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC6(%rip), %rdx	;, tmp106
	movq	%rdx, %rsi	; tmp106,
	movq	%rax, %rdi	; _6,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; _7
	jne	.L105	;,
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	-32(%rbp), %rax	; code_member, tmp107
	movq	(%rax), %rax	; code_member_24->content.function, _8
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	(%rax), %rdx	; _8->name, _9
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	-8(%rbp), %rax	; tac, tmp108
	movq	%rdx, 8(%rax)	; _9, tac_17->entry_point
	jmp	.L105	;
.L106:
; src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	movq	-32(%rbp), %rax	; code_member, tmp109
	movl	8(%rax), %eax	; code_member_24->type, _10
; src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _10
	jne	.L108	;,
; src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	-32(%rbp), %rax	; code_member, tmp110
	movq	(%rax), %rax	; code_member_24->content.class, _11
	movq	-16(%rbp), %rdx	; status, tmp111
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; _11,
	call	tac_class	;
	jmp	.L105	;
.L108:
; src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	movq	-32(%rbp), %rax	; code_member, tmp112
	movl	8(%rax), %eax	; code_member_24->type, _12
; src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _12
	jne	.L105	;,
; src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	-32(%rbp), %rax	; code_member, tmp113
	movq	(%rax), %rax	; code_member_24->content.import, _13
	movq	-16(%rbp), %rdx	; status, tmp114
	movq	-8(%rbp), %rcx	; tac, tmp115
	movq	%rcx, %rsi	; tmp115,
	movq	%rax, %rdi	; _13,
	call	tac_import	;
.L105:
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	; members, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp117, code_member
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	cmpq	$0, -32(%rbp)	;, code_member
	jne	.L109	;,
; src/tac.c:301:     return tac;
	movq	-8(%rbp), %rax	; tac, _25
; src/tac.c:302: }
	leave	
	ret	
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 8
.LC7:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
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
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	-8(%rbp), %rax	; import, tmp106
	movq	(%rax), %rax	; import_27(D)->name, _1
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rax), %eax	; _1->kind, _2
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	;, _2
	jne	.L112	;,
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	-8(%rbp), %rax	; import, tmp107
	movq	(%rax), %rax	; import_27(D)->name, _3
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rax), %rsi	; _3->type, _4
	movq	-8(%rbp), %rax	; import, tmp108
	movq	(%rax), %rax	; import_27(D)->name, _5
	movq	-24(%rbp), %rdx	; status, tmp109
	movq	%rdx, %rcx	; tmp109,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _5,
	call	create_var	;
	movq	%rax, %rdx	;, _6
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	-16(%rbp), %rax	; tac, tmp110
	movq	16(%rax), %rax	; tac_30(D)->global_vars, _7
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; _7,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:314: }
	jmp	.L117	;
.L112:
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	-8(%rbp), %rax	; import, tmp111
	movq	(%rax), %rax	; import_27(D)->name, _8
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	; _8->kind, _9
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, _9
	je	.L114	;,
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	-8(%rbp), %rax	; import, tmp112
	movq	(%rax), %rax	; import_27(D)->name, _10
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	; _10->kind, _11
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _11
	jne	.L115	;,
.L114:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	-8(%rbp), %rax	; import, tmp113
	movq	(%rax), %rax	; import_27(D)->name, _12
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; _12->type, _13
	movq	-8(%rbp), %rax	; import, tmp114
	movq	(%rax), %rax	; import_27(D)->name, _14
	movq	-24(%rbp), %rdx	; status, tmp115
	movq	%rdx, %rcx	; tmp115,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; _14,
	call	create_var	;
	movq	%rax, %rdx	;, _15
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	-16(%rbp), %rax	; tac, tmp116
	movq	16(%rax), %rax	; tac_30(D)->global_vars, _16
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:314: }
	jmp	.L117	;
.L115:
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	movq	-8(%rbp), %rax	; import, tmp117
	movq	(%rax), %rax	; import_27(D)->name, _17
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _17->kind, _18
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _18
	jne	.L116	;,
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	-8(%rbp), %rax	; import, tmp118
	movq	(%rax), %rax	; import_27(D)->name, _19
	movq	%rax, %rdi	; _19,
	call	create_attribute_table	;
	movq	%rax, %rdx	;, _20
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	-16(%rbp), %rax	; tac, tmp119
	movq	(%rax), %rax	; tac_30(D)->attribute_tables, _21
	movq	%rdx, %rsi	; _20,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:314: }
	jmp	.L117	;
.L116:
; src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	-8(%rbp), %rax	; import, tmp120
	movq	(%rax), %rax	; import_27(D)->name, _22
; src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	32(%rax), %edx	; _22->kind, _23
; src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	stderr(%rip), %rax	; stderr, stderr.13_24
	leaq	.LC7(%rip), %rcx	;, tmp121
	movq	%rcx, %rsi	; tmp121,
	movq	%rax, %rdi	; stderr.13_24,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L117:
; src/tac.c:314: }
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
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	-56(%rbp), %rax	; function, tmp94
	movq	8(%rax), %rdx	; function_16(D)->return_type, _1
	movq	-56(%rbp), %rax	; function, tmp95
	movq	(%rax), %rax	; function_16(D)->name, _2
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; _2,
	call	create_subroutine	;
	movq	%rax, -8(%rbp)	; tmp96, subroutine
; src/tac.c:319:     status->current_subroutine = subroutine;
	movq	-64(%rbp), %rax	; status, tmp97
	movq	-8(%rbp), %rdx	; subroutine, tmp98
	movq	%rdx, 8(%rax)	; tmp98, status_19(D)->current_subroutine
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	-64(%rbp), %rax	; status, tmp99
	movq	(%rax), %rax	; status_19(D)->tac, _3
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	; _3->subroutines, _4
	movq	-8(%rbp), %rdx	; subroutine, tmp100
	movq	%rdx, %rsi	; tmp100,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	-56(%rbp), %rax	; function, tmp101
	movq	16(%rax), %rax	; function_16(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, parameters
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L119	;
.L120:
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
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
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	; subroutine, tmp106
	movq	16(%rax), %rax	; subroutine_18->parameters, _9
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
.L119:
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	; parameters, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, parameter
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	;, parameter
	jne	.L120	;,
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	-64(%rbp), %rax	; status, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	; _10,
	call	create_block	;
	movq	%rax, -32(%rbp)	; tmp110, block
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	; subroutine, tmp111
	movq	32(%rax), %rax	; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	; block, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:329:     status->current_block = block;
	movq	-64(%rbp), %rax	; status, tmp113
	movq	-32(%rbp), %rdx	; block, tmp114
	movq	%rdx, 16(%rax)	; tmp114, status_19(D)->current_block
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	-56(%rbp), %rax	; function, tmp115
	movq	24(%rax), %rax	; function_16(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp116, statements
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L121	;
.L122:
; src/tac.c:334:         tac_statement(statement, status);
	movq	-64(%rbp), %rdx	; status, tmp117
	movq	-48(%rbp), %rax	; statement, tmp118
	movq	%rdx, %rsi	; tmp117,
	movq	%rax, %rdi	; tmp118,
	call	tac_statement	;
.L121:
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	; statements, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp120, statement
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L122	;,
; src/tac.c:336:     status->current_subroutine = NULL;
	movq	-64(%rbp), %rax	; status, tmp121
	movq	$0, 8(%rax)	;, status_19(D)->current_subroutine
; src/tac.c:338: }
	nop	
	leave	
	ret	
	.size	tac_function, .-tac_function
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -72(%rbp)	; method, method
	movq	%rsi, -80(%rbp)	; status, status
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	-72(%rbp), %rax	; method, tmp110
	movq	8(%rax), %rdx	; method_33(D)->return_type, _1
	movq	-72(%rbp), %rax	; method, tmp111
	movq	(%rax), %rax	; method_33(D)->name, _2
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; _2,
	call	create_subroutine	;
	movq	%rax, -8(%rbp)	; tmp112, subroutine
; src/tac.c:343:     status->current_subroutine = subroutine;
	movq	-80(%rbp), %rax	; status, tmp113
	movq	-8(%rbp), %rdx	; subroutine, tmp114
	movq	%rdx, 8(%rax)	; tmp114, status_36(D)->current_subroutine
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	-80(%rbp), %rax	; status, tmp115
	movq	(%rax), %rax	; status_36(D)->tac, _3
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	; _3->subroutines, _4
	movq	-8(%rbp), %rdx	; subroutine, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	-72(%rbp), %rax	; method, tmp117
	movq	16(%rax), %rax	; method_33(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp118, parameters
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L124	;
.L125:
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-24(%rbp), %rax	; parameter, tmp119
	movq	(%rax), %rsi	; parameter_42->type, _6
	movq	-24(%rbp), %rax	; parameter, tmp120
	movq	8(%rax), %rax	; parameter_42->name, _7
	movq	-80(%rbp), %rdx	; status, tmp121
	movq	%rdx, %rcx	; tmp121,
	movl	$112, %edx	;,
	movq	%rax, %rdi	; _7,
	call	create_var	;
	movq	%rax, %rdx	;, _8
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	; subroutine, tmp122
	movq	16(%rax), %rax	; subroutine_35->parameters, _9
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
.L124:
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	; parameters, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp124, parameter
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	;, parameter
	jne	.L125	;,
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	-80(%rbp), %rax	; status, tmp125
	movq	%rax, %rcx	; tmp125,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	; _10,
	call	create_block	;
	movq	%rax, -32(%rbp)	; tmp126, block
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	; subroutine, tmp127
	movq	32(%rax), %rax	; subroutine_35->blocks, _11
	movq	-32(%rbp), %rdx	; block, tmp128
	movq	%rdx, %rsi	; tmp128,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:353:     status->current_block = block;
	movq	-80(%rbp), %rax	; status, tmp129
	movq	-32(%rbp), %rdx	; block, tmp130
	movq	%rdx, 16(%rax)	; tmp130, status_36(D)->current_block
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.14_12
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	-80(%rbp), %rax	; status, tmp131
	movq	24(%rax), %rax	; status_36(D)->current_class, _13
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _13->name, _14
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	; _14->name, _15
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.14_12,
	movq	%rax, %rdi	; _15,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _16
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	-72(%rbp), %rax	; method, tmp132
	movq	(%rax), %rax	; method_33(D)->name, _17
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	; _17->name, _18
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	%rdx, %rsi	; _16,
	movq	%rax, %rdi	; _18,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; _19
	jne	.L126	;,
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	-80(%rbp), %rax	; status, tmp133
	movq	24(%rax), %rax	; status_36(D)->current_class, _20
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	(%rax), %rax	; _20->name, _21
	movq	-80(%rbp), %rdx	; status, tmp134
	movq	%rdx, %rcx	; tmp134,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _21,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rsi	; _22,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp135, temp
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-80(%rbp), %rax	; status, tmp136
	movq	24(%rax), %rax	; status_36(D)->current_class, _23
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	addq	$24, %rax	;, _24
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; _24,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _25
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-40(%rbp), %rax	; temp, tmp137
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp137,
	movl	$18, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _26
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-32(%rbp), %rax	; block, tmp138
	movq	8(%rax), %rax	; block_45->instructions, _27
	movq	%rdx, %rsi	; _26,
	movq	%rax, %rdi	; _27,
	call	*list_append@GOTPCREL(%rip)	;
.L126:
; src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	-72(%rbp), %rax	; method, tmp139
	movq	24(%rax), %rax	; method_33(D)->body, _28
	movq	%rax, %rdi	; _28,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp140, statements
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L127	;
.L128:
; src/tac.c:362:         tac_statement(statement, status);
	movq	-80(%rbp), %rdx	; status, tmp141
	movq	-56(%rbp), %rax	; statement, tmp142
	movq	%rdx, %rsi	; tmp141,
	movq	%rax, %rdi	; tmp142,
	call	tac_statement	;
.L127:
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-48(%rbp), %rax	; statements, tmp143
	movq	%rax, %rdi	; tmp143,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp144, statement
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -56(%rbp)	;, statement
	jne	.L128	;,
; src/tac.c:364:     status->current_subroutine = NULL;
	movq	-80(%rbp), %rax	; status, tmp145
	movq	$0, 8(%rax)	;, status_36(D)->current_subroutine
; src/tac.c:366: }
	nop	
	leave	
	ret	
	.size	tac_method, .-tac_method
	.section	.rodata
	.align 8
.LC8:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; class, class
	movq	%rsi, -48(%rbp)	; status, status
; src/tac.c:369:     status->current_class = class;
	movq	-48(%rbp), %rax	; status, tmp92
	movq	-40(%rbp), %rdx	; class, tmp93
	movq	%rdx, 24(%rax)	; tmp93, status_13(D)->current_class
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	-40(%rbp), %rax	; class, tmp94
	movq	8(%rax), %rax	; class_14(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp95, members
; src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	-40(%rbp), %rax	; class, tmp96
	movq	(%rax), %rax	; class_14(D)->name, _2
	movq	%rax, %rdi	; _2,
	call	create_attribute_table	;
	movq	%rax, -16(%rbp)	; tmp97, attr_table
; src/tac.c:374:     attr_table->size = class->size;
	movq	-40(%rbp), %rax	; class, tmp98
	movq	24(%rax), %rdx	; class_14(D)->size, _3
; src/tac.c:374:     attr_table->size = class->size;
	movq	-16(%rbp), %rax	; attr_table, tmp99
	movq	%rdx, 16(%rax)	; _3, attr_table_19->size
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	-48(%rbp), %rax	; status, tmp100
	movq	(%rax), %rax	; status_13(D)->tac, _4
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	; _4->attribute_tables, _5
	movq	-16(%rbp), %rdx	; attr_table, tmp101
	movq	%rdx, %rsi	; tmp101,
	movq	%rax, %rdi	; _5,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L130	;
.L135:
; src/tac.c:377:         switch (member->type) {
	movq	-24(%rbp), %rax	; member, tmp102
	movl	8(%rax), %eax	; member_23->type, _6
; src/tac.c:377:         switch (member->type) {
	testl	%eax, %eax	; _6
	je	.L131	;,
	cmpl	$1, %eax	;, _6
	je	.L132	;,
	jmp	.L136	;
.L131:
; src/tac.c:379:                 tac_method(member->content.method, status);
	movq	-24(%rbp), %rax	; member, tmp103
	movq	(%rax), %rax	; member_23->content.method, _7
	movq	-48(%rbp), %rdx	; status, tmp104
	movq	%rdx, %rsi	; tmp104,
	movq	%rax, %rdi	; _7,
	call	tac_method	;
; src/tac.c:380:                 break;
	jmp	.L130	;
.L132:
; src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	-24(%rbp), %rax	; member, tmp105
	movq	(%rax), %rax	; member_23->content.variable, _8
	movq	-48(%rbp), %rcx	; status, tmp106
	movl	$97, %edx	;,
	movq	%rcx, %rsi	; tmp106,
	movq	%rax, %rdi	; _8,
	call	tac_variable	;
; src/tac.c:383:                 break;
	jmp	.L130	;
.L136:
; src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	-24(%rbp), %rax	; member, tmp107
	movl	8(%rax), %edx	; member_23->type, _9
; src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	stderr(%rip), %rax	; stderr, stderr.15_10
	leaq	.LC8(%rip), %rcx	;, tmp108
	movq	%rcx, %rsi	; tmp108,
	movq	%rax, %rdi	; stderr.15_10,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:386:                 break;
	nop	
.L130:
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	-8(%rbp), %rax	; members, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp110, member
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	cmpq	$0, -24(%rbp)	;, member
	jne	.L135	;,
; src/tac.c:389:     status->current_class = NULL;
	movq	-48(%rbp), %rax	; status, tmp111
	movq	$0, 24(%rax)	;, status_13(D)->current_class
; src/tac.c:391: }
	nop	
	leave	
	ret	
	.size	tac_class, .-tac_class
	.section	.rodata
	.align 8
.LC9:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; variable, variable
	movq	%rsi, -32(%rbp)	; status, status
	movl	%edx, -36(%rbp)	; type, type
; src/tac.c:394:     Var* var = NULL;
	movq	$0, -8(%rbp)	;, var
; src/tac.c:395:     switch (type) {
	movl	-36(%rbp), %eax	; type, tmp98
	subl	$97, %eax	;, tmp97
	cmpl	$21, %eax	;, tmp97
	ja	.L138	;,
	movl	%eax, %eax	; tmp97, tmp99
	leaq	0(,%rax,4), %rdx	;, tmp100
	leaq	.L140(%rip), %rax	;, tmp101
	movl	(%rdx,%rax), %eax	;, tmp102
	cltq
	leaq	.L140(%rip), %rdx	;, tmp105
	addq	%rdx, %rax	; tmp105, tmp104
	jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
	.align 4
.L140:
	.long	.L144-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L143-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L142-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L138-.L140
	.long	.L146-.L140
	.long	.L138-.L140
	.long	.L146-.L140
	.text
.L142:
; src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	-24(%rbp), %rax	; variable, tmp106
	movq	(%rax), %rsi	; variable_20(D)->type, _1
	movq	-24(%rbp), %rax	; variable, tmp107
	movq	8(%rax), %rax	; variable_20(D)->name, _2
	movq	-32(%rbp), %rcx	; status, tmp108
	movl	-36(%rbp), %edx	; type, tmp109
	movq	%rax, %rdi	; _2,
	call	create_var	;
	movq	%rax, -8(%rbp)	; tmp110, var
; src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	-32(%rbp), %rax	; status, tmp111
	movq	8(%rax), %rax	; status_21(D)->current_subroutine, _3
; src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	16(%rax), %rax	; _3->parameters, _4
	movq	-8(%rbp), %rdx	; var, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:399:             break;
	jmp	.L145	;
.L143:
; src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	-24(%rbp), %rax	; variable, tmp113
	movq	(%rax), %rsi	; variable_20(D)->type, _5
	movq	-24(%rbp), %rax	; variable, tmp114
	movq	8(%rax), %rax	; variable_20(D)->name, _6
	movq	-32(%rbp), %rcx	; status, tmp115
	movl	-36(%rbp), %edx	; type, tmp116
	movq	%rax, %rdi	; _6,
	call	create_var	;
	movq	%rax, -8(%rbp)	; tmp117, var
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	-32(%rbp), %rax	; status, tmp118
	movq	(%rax), %rax	; status_21(D)->tac, _7
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rax	; _7->global_vars, _8
	movq	-8(%rbp), %rdx	; var, tmp119
	movq	%rdx, %rsi	; tmp119,
	movq	%rax, %rdi	; _8,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:405:             break;
	jmp	.L145	;
.L144:
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	-32(%rbp), %rax	; status, tmp120
	movq	(%rax), %rax	; status_21(D)->tac, _9
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rax), %rax	; _9->attribute_tables, _10
	movq	%rax, %rdi	; _10,
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp121, attr_table
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	-32(%rbp), %rax	; status, tmp122
	movq	(%rax), %rax	; status_21(D)->tac, _11
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	; _11->attribute_tables, _12
	movq	-16(%rbp), %rdx	; attr_table, tmp123
	movq	%rdx, %rsi	; tmp123,
	movq	%rax, %rdi	; _12,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	-24(%rbp), %rax	; variable, tmp124
	movq	(%rax), %rsi	; variable_20(D)->type, _13
	movq	-24(%rbp), %rax	; variable, tmp125
	movq	8(%rax), %rax	; variable_20(D)->name, _14
	movq	-32(%rbp), %rcx	; status, tmp126
	movq	-16(%rbp), %rdx	; attr_table, tmp127
	movq	%rcx, %r8	; tmp126,
	movl	$0, %ecx	;,
	movq	%rax, %rdi	; _14,
	call	create_attribute	;
; src/tac.c:410:             break;
	jmp	.L145	;
.L138:
; src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.16_15
	movl	-36(%rbp), %edx	; type, tmp128
	leaq	.LC9(%rip), %rcx	;, tmp129
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; stderr.16_15,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:415:             break;
	jmp	.L145	;
.L146:
; src/tac.c:401:         case VAR_TEMP: break;
	nop	
.L145:
; src/tac.c:418: }
	nop	
	leave	
	ret	
	.size	tac_variable, .-tac_variable
	.section	.rodata
	.align 8
.LC10:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC11:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC12:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; statement, statement
	movq	%rsi, -64(%rbp)	; status, status
; src/tac.c:421:     switch (statement->type) {
	movq	-56(%rbp), %rax	; statement, tmp109
	movl	8(%rax), %eax	; statement_32(D)->type, _1
; src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %eax	;, _1
	ja	.L148	;,
	movl	%eax, %eax	; _1, tmp110
	leaq	0(,%rax,4), %rdx	;, tmp111
	leaq	.L150(%rip), %rax	;, tmp112
	movl	(%rdx,%rax), %eax	;, tmp113
	cltq
	leaq	.L150(%rip), %rdx	;, tmp116
	addq	%rdx, %rax	; tmp116, tmp115
	jmp	*%rax	; tmp115
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
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	-56(%rbp), %rax	; statement, tmp117
	movq	(%rax), %rax	; statement_32(D)->stmt.expr, _2
	movq	-64(%rbp), %rdx	; status, tmp118
	movq	%rdx, %rsi	; tmp118,
	movq	%rax, %rdi	; _2,
	call	tac_expression	;
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	jmp	.L158	;
.L156:
; src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	-56(%rbp), %rax	; statement, tmp119
	movq	(%rax), %rax	; statement_32(D)->stmt.var, _3
	movq	-64(%rbp), %rcx	; status, tmp120
	movl	$118, %edx	;,
	movq	%rcx, %rsi	; tmp120,
	movq	%rax, %rdi	; _3,
	call	tac_variable	;
; src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L158	;
.L155:
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp121
	movq	(%rax), %rax	; statement_32(D)->stmt.if_stmt, _4
	movq	-64(%rbp), %rdx	; status, tmp122
	movq	%rdx, %rsi	; tmp122,
	movq	%rax, %rdi	; _4,
	call	tac_if	;
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L158	;
.L154:
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp123
	movq	(%rax), %rax	; statement_32(D)->stmt.while_stmt, _5
	movq	-64(%rbp), %rdx	; status, tmp124
	movq	%rdx, %rsi	; tmp124,
	movq	%rax, %rdi	; _5,
	call	tac_while	;
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L158	;
.L153:
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp125
	movq	(%rax), %rax	; statement_32(D)->stmt.for_stmt, _6
	movq	-64(%rbp), %rdx	; status, tmp126
	movq	%rdx, %rsi	; tmp126,
	movq	%rax, %rdi	; _6,
	call	tac_for	;
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L158	;
.L152:
; src/tac.c:428:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp127, return_value
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	-56(%rbp), %rax	; statement, tmp128
	movq	(%rax), %rax	; statement_32(D)->stmt.return_expr, _7
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rax, %rax	; _7
	je	.L159	;,
; src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	-56(%rbp), %rax	; statement, tmp129
	movq	(%rax), %rax	; statement_32(D)->stmt.return_expr, _8
	movq	-64(%rbp), %rdx	; status, tmp130
	movq	%rdx, %rsi	; tmp130,
	movq	%rax, %rdi	; _8,
	call	tac_expression	;
	movq	%rax, -8(%rbp)	; tmp131, return_value
.L159:
; src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	-8(%rbp), %rax	; return_value, tmp132
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp132,
	movl	$21, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _9
; src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	-64(%rbp), %rax	; status, tmp133
	movq	16(%rax), %rax	; status_33(D)->current_block, _10
; src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	8(%rax), %rax	; _10->instructions, _11
	movq	%rdx, %rsi	; _9,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:432:             break;
	jmp	.L158	;
.L151:
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	-64(%rbp), %rax	; status, tmp134
	movq	32(%rax), %rax	; status_33(D)->end_labels, _12
	movq	%rax, %rdi	; _12,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; _13
	jne	.L160	;,
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	-64(%rbp), %rax	; status, tmp135
	movq	32(%rax), %rax	; status_33(D)->end_labels, _14
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _14->tail, _15
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _15->content, tmp136
	movq	%rax, -32(%rbp)	; tmp136, label
; src/tac.c:437:                 if (label != NULL) {
	cmpq	$0, -32(%rbp)	;, label
	je	.L160	;,
; src/tac.c:438:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-32(%rbp), %rax	; label, tmp137
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp137,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -40(%rbp)	; tmp138, inst
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp139
	movq	16(%rax), %rax	; status_33(D)->current_block, _16
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _16->instructions, _17
	movq	-40(%rbp), %rdx	; inst, tmp140
	movq	%rdx, %rsi	; tmp140,
	movq	%rax, %rdi	; _17,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:440:                     break;
	jmp	.L158	;
.L160:
; src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	stderr(%rip), %rax	; stderr, stderr.17_18
	movq	%rax, %rcx	; stderr.17_18,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp141
	movq	%rax, %rdi	; tmp141,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:444:             break;
	jmp	.L158	;
.L149:
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	-64(%rbp), %rax	; status, tmp142
	movq	40(%rax), %rax	; status_33(D)->start_labels, _19
	movq	%rax, %rdi	; _19,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; _20
	jne	.L161	;,
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	-64(%rbp), %rax	; status, tmp143
	movq	40(%rax), %rax	; status_33(D)->start_labels, _21
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _21->tail, _22
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _22->content, tmp144
	movq	%rax, -16(%rbp)	; tmp144, label
; src/tac.c:448:                 if (label != NULL) {
	cmpq	$0, -16(%rbp)	;, label
	je	.L161	;,
; src/tac.c:449:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-16(%rbp), %rax	; label, tmp145
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp145,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp146, inst
; src/tac.c:450:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp147
	movq	16(%rax), %rax	; status_33(D)->current_block, _23
; src/tac.c:450:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _23->instructions, _24
	movq	-24(%rbp), %rdx	; inst, tmp148
	movq	%rdx, %rsi	; tmp148,
	movq	%rax, %rdi	; _24,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:451:                     break;
	jmp	.L158	;
.L161:
; src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	stderr(%rip), %rax	; stderr, stderr.18_25
	movq	%rax, %rcx	; stderr.18_25,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp149
	movq	%rax, %rdi	; tmp149,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:455:             break;
	jmp	.L158	;
.L148:
; src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	-56(%rbp), %rax	; statement, tmp150
	movl	8(%rax), %edx	; statement_32(D)->type, _26
; src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	stderr(%rip), %rax	; stderr, stderr.19_27
	leaq	.LC12(%rip), %rcx	;, tmp151
	movq	%rcx, %rsi	; tmp151,
	movq	%rax, %rdi	; stderr.19_27,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:458:             break;
	nop	
.L158:
; src/tac.c:461: }
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
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp124, then_label
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp125
	movq	%rax, %rcx	; tmp125,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp126, else_label
; src/tac.c:467:     Var* end_label = NULL;
	movq	$0, -32(%rbp)	;, end_label
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp127
	movq	16(%rax), %rax	; if__62(D)->else_if, _1
	movq	%rax, %rdi	; _1,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; _2
	je	.L163	;,
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp128
	movq	24(%rax), %rax	; if__62(D)->else_body, _3
	movq	%rax, %rdi	; _3,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; _4
	je	.L163	;,
; src/tac.c:469:         end_label = else_label;
	movq	-24(%rbp), %rax	; else_label, tmp129
	movq	%rax, -32(%rbp)	; tmp129, end_label
	jmp	.L164	;
.L163:
; src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -32(%rbp)	; tmp131, end_label
.L164:
; src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	-32(%rbp), %rax	; end_label, tmp132
	movq	%rax, %rsi	; tmp132,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp133, end_block_arg
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	-184(%rbp), %rax	; if_, tmp134
	movq	(%rax), %rax	; if__62(D)->condition, _5
	movq	-192(%rbp), %rdx	; status, tmp135
	movq	%rdx, %rsi	; tmp135,
	movq	%rax, %rdi	; _5,
	call	tac_expression	;
	movq	%rax, -56(%rbp)	; tmp136, condition
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	; else_label, tmp137
	movq	%rax, %rsi	; tmp137,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _6
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	; then_label, tmp138
	movq	%rax, %rsi	; tmp138,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _7
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	; condition, tmp139
	movq	%rbx, %rcx	; _6,
	movq	%rax, %rsi	; tmp139,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp140, inst
; src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp141
	movq	16(%rax), %rax	; status_56(D)->current_block, _8
; src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _8->instructions, _9
	movq	-64(%rbp), %rdx	; inst, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:478:     Block* then_block = create_block(then_label);
	movq	-40(%rbp), %rax	; then_label, tmp143
	movq	%rax, %rdi	; tmp143,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp144, then_block
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	-192(%rbp), %rax	; status, tmp145
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _10
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	; _10->blocks, _11
	movq	-72(%rbp), %rdx	; then_block, tmp146
	movq	%rdx, %rsi	; tmp146,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:480:     status->current_block = then_block;
	movq	-192(%rbp), %rax	; status, tmp147
	movq	-72(%rbp), %rdx	; then_block, tmp148
	movq	%rdx, 16(%rax)	; tmp148, status_56(D)->current_block
; src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	-184(%rbp), %rax	; if_, tmp149
	movq	8(%rax), %rax	; if__62(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp150, then_statements
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L165	;
.L166:
; src/tac.c:485:         tac_statement(statement, status);
	movq	-192(%rbp), %rdx	; status, tmp151
	movq	-88(%rbp), %rax	; statement, tmp152
	movq	%rdx, %rsi	; tmp151,
	movq	%rax, %rdi	; tmp152,
	call	tac_statement	;
.L165:
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	-80(%rbp), %rax	; then_statements, tmp153
	movq	%rax, %rdi	; tmp153,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp154, statement
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L166	;,
; src/tac.c:487:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp155
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp155,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp156, jump_to_end
; src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp157
	movq	16(%rax), %rax	; status_56(D)->current_block, _13
; src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _13->instructions, _14
	movq	-96(%rbp), %rdx	; jump_to_end, tmp158
	movq	%rdx, %rsi	; tmp158,
	movq	%rax, %rdi	; _14,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	-184(%rbp), %rax	; if_, tmp159
	movq	16(%rax), %rax	; if__62(D)->else_if, _15
	movq	%rax, %rdi	; _15,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; _16
	jne	.L167	;,
; src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	-184(%rbp), %rax	; if_, tmp160
	movq	16(%rax), %rax	; if__62(D)->else_if, _17
	movq	%rax, %rdi	; _17,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp161, elif_list
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L168	;
.L172:
; src/tac.c:496:             Block* else_if_block = create_block(else_label);
	movq	-24(%rbp), %rax	; else_label, tmp162
	movq	%rax, %rdi	; tmp162,
	call	create_block	;
	movq	%rax, -120(%rbp)	; tmp163, else_if_block
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	-192(%rbp), %rax	; status, tmp164
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _18
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	32(%rax), %rax	; _18->blocks, _19
	movq	-120(%rbp), %rdx	; else_if_block, tmp165
	movq	%rdx, %rsi	; tmp165,
	movq	%rax, %rdi	; _19,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:498:             status->current_block = else_if_block;
	movq	-192(%rbp), %rax	; status, tmp166
	movq	-120(%rbp), %rdx	; else_if_block, tmp167
	movq	%rdx, 16(%rax)	; tmp167, status_56(D)->current_block
; src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp168
	movq	%rax, %rcx	; tmp168,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp169, then_label
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp170
	movq	%rax, %rcx	; tmp170,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp171, else_label
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	-112(%rbp), %rax	; elif, tmp172
	movq	(%rax), %rax	; elif_92->condition, _20
	movq	-192(%rbp), %rdx	; status, tmp173
	movq	%rdx, %rsi	; tmp173,
	movq	%rax, %rdi	; _20,
	call	tac_expression	;
	movq	%rax, -56(%rbp)	; tmp174, condition
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-104(%rbp), %rax	; elif_list, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; _21
	je	.L169	;,
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp176
	movq	24(%rax), %rax	; if__62(D)->else_body, _22
	movq	%rax, %rdi	; _22,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; _23
	je	.L169	;,
; src/tac.c:505:                 else_label = end_label;
	movq	-32(%rbp), %rax	; end_label, tmp177
	movq	%rax, -24(%rbp)	; tmp177, else_label
.L169:
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	; else_label, tmp178
	movq	%rax, %rsi	; tmp178,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _24
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	; then_label, tmp179
	movq	%rax, %rsi	; tmp179,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _25
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	; condition, tmp180
	movq	%rbx, %rcx	; _24,
	movq	%rax, %rsi	; tmp180,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp181, inst
; src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp182
	movq	16(%rax), %rax	; status_56(D)->current_block, _26
; src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _26->instructions, _27
	movq	-64(%rbp), %rdx	; inst, tmp183
	movq	%rdx, %rsi	; tmp183,
	movq	%rax, %rdi	; _27,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:509:             then_block = create_block(then_label);
	movq	-40(%rbp), %rax	; then_label, tmp184
	movq	%rax, %rdi	; tmp184,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp185, then_block
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	-192(%rbp), %rax	; status, tmp186
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _28
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	; _28->blocks, _29
	movq	-72(%rbp), %rdx	; then_block, tmp187
	movq	%rdx, %rsi	; tmp187,
	movq	%rax, %rdi	; _29,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:511:             status->current_block = then_block;
	movq	-192(%rbp), %rax	; status, tmp188
	movq	-72(%rbp), %rdx	; then_block, tmp189
	movq	%rdx, 16(%rax)	; tmp189, status_56(D)->current_block
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	-112(%rbp), %rax	; elif, tmp190
	movq	8(%rax), %rax	; elif_92->body, _30
	movq	%rax, %rdi	; _30,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp191, elif_statements
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L170	;
.L171:
; src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	-192(%rbp), %rdx	; status, tmp192
	movq	-136(%rbp), %rax	; elif_statement, tmp193
	movq	%rdx, %rsi	; tmp192,
	movq	%rax, %rdi	; tmp193,
	call	tac_statement	;
.L170:
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	-128(%rbp), %rax	; elif_statements, tmp194
	movq	%rax, %rdi	; tmp194,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -136(%rbp)	; tmp195, elif_statement
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	cmpq	$0, -136(%rbp)	;, elif_statement
	jne	.L171	;,
; src/tac.c:518:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp196
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp196,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp197, jump_to_end
; src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp198
	movq	16(%rax), %rax	; status_56(D)->current_block, _31
; src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _31->instructions, _32
	movq	-96(%rbp), %rdx	; jump_to_end, tmp199
	movq	%rdx, %rsi	; tmp199,
	movq	%rax, %rdi	; _32,
	call	*list_append@GOTPCREL(%rip)	;
.L168:
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	-104(%rbp), %rax	; elif_list, tmp200
	movq	%rax, %rdi	; tmp200,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp201, elif
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	cmpq	$0, -112(%rbp)	;, elif
	jne	.L172	;,
.L167:
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	-184(%rbp), %rax	; if_, tmp202
	movq	24(%rax), %rax	; if__62(D)->else_body, _33
	movq	%rax, %rdi	; _33,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; _34
	jne	.L173	;,
; src/tac.c:525:         Block* else_block = create_block(else_label);
	movq	-24(%rbp), %rax	; else_label, tmp203
	movq	%rax, %rdi	; tmp203,
	call	create_block	;
	movq	%rax, -144(%rbp)	; tmp204, else_block
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	-192(%rbp), %rax	; status, tmp205
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _35
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	32(%rax), %rax	; _35->blocks, _36
	movq	-144(%rbp), %rdx	; else_block, tmp206
	movq	%rdx, %rsi	; tmp206,
	movq	%rax, %rdi	; _36,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:527:         status->current_block = else_block;
	movq	-192(%rbp), %rax	; status, tmp207
	movq	-144(%rbp), %rdx	; else_block, tmp208
	movq	%rdx, 16(%rax)	; tmp208, status_56(D)->current_block
; src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	-184(%rbp), %rax	; if_, tmp209
	movq	24(%rax), %rax	; if__62(D)->else_body, _37
	movq	%rax, %rdi	; _37,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -152(%rbp)	; tmp210, else_statements
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L174	;
.L175:
; src/tac.c:532:             tac_statement(else_statement, status);
	movq	-192(%rbp), %rdx	; status, tmp211
	movq	-160(%rbp), %rax	; else_statement, tmp212
	movq	%rdx, %rsi	; tmp211,
	movq	%rax, %rdi	; tmp212,
	call	tac_statement	;
.L174:
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	-152(%rbp), %rax	; else_statements, tmp213
	movq	%rax, %rdi	; tmp213,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -160(%rbp)	; tmp214, else_statement
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	cmpq	$0, -160(%rbp)	;, else_statement
	jne	.L175	;,
; src/tac.c:534:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp215
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp215,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp216, jump_to_end
; src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp217
	movq	16(%rax), %rax	; status_56(D)->current_block, _38
; src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _38->instructions, _39
	movq	-96(%rbp), %rdx	; jump_to_end, tmp218
	movq	%rdx, %rsi	; tmp218,
	movq	%rax, %rdi	; _39,
	call	*list_append@GOTPCREL(%rip)	;
.L173:
; src/tac.c:538:     Block* end_block = create_block(end_label);
	movq	-32(%rbp), %rax	; end_label, tmp219
	movq	%rax, %rdi	; tmp219,
	call	create_block	;
	movq	%rax, -168(%rbp)	; tmp220, end_block
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-192(%rbp), %rax	; status, tmp221
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _40
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _40->blocks, _41
	movq	-168(%rbp), %rdx	; end_block, tmp222
	movq	%rdx, %rsi	; tmp222,
	movq	%rax, %rdi	; _41,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:540:     status->current_block = end_block;
	movq	-192(%rbp), %rax	; status, tmp223
	movq	-168(%rbp), %rdx	; end_block, tmp224
	movq	%rdx, 16(%rax)	; tmp224, status_56(D)->current_block
; src/tac.c:542: }
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
; src/tac.c:546:     if (for_->initializer != NULL)
	movq	-152(%rbp), %rax	; for_, tmp127
	movq	(%rax), %rax	; for__54(D)->initializer, _1
; src/tac.c:546:     if (for_->initializer != NULL)
	testq	%rax, %rax	; _1
	je	.L177	;,
; src/tac.c:547:         tac_variable(for_->initializer, status, VAR_VAR);
	movq	-152(%rbp), %rax	; for_, tmp128
	movq	(%rax), %rax	; for__54(D)->initializer, _2
	movq	-160(%rbp), %rcx	; status, tmp129
	movl	$118, %edx	;,
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; _2,
	call	tac_variable	;
.L177:
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -32(%rbp)	; tmp131, condition_label
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp132
	movq	%rax, %rcx	; tmp132,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp133, body_label
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp134
	movq	%rax, %rcx	; tmp134,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -48(%rbp)	; tmp135, end_label
; src/tac.c:552:     if (for_->condition != NULL) {
	movq	-152(%rbp), %rax	; for_, tmp136
	movq	8(%rax), %rax	; for__54(D)->condition, _3
; src/tac.c:552:     if (for_->condition != NULL) {
	testq	%rax, %rax	; _3
	je	.L178	;,
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	; condition_label, tmp137
	movq	%rax, %rsi	; tmp137,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _4,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp138, inst
; src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp139
	movq	16(%rax), %rax	; status_55(D)->current_block, _5
; src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	-64(%rbp), %rdx	; inst, tmp140
	movq	%rdx, %rsi	; tmp140,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:556:         Block* condition_block = create_block(condition_label);
	movq	-32(%rbp), %rax	; condition_label, tmp141
	movq	%rax, %rdi	; tmp141,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp142, condition_block
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	-160(%rbp), %rax	; status, tmp143
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _7
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	; _7->blocks, _8
	movq	-72(%rbp), %rdx	; condition_block, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _8,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:558:         status->current_block = condition_block;
	movq	-160(%rbp), %rax	; status, tmp145
	movq	-72(%rbp), %rdx	; condition_block, tmp146
	movq	%rdx, 16(%rax)	; tmp146, status_55(D)->current_block
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	-152(%rbp), %rax	; for_, tmp147
	movq	8(%rax), %rax	; for__54(D)->condition, _9
	movq	-160(%rbp), %rdx	; status, tmp148
	movq	%rdx, %rsi	; tmp148,
	movq	%rax, %rdi	; _9,
	call	tac_expression	;
	movq	%rax, -80(%rbp)	; tmp149, condition
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; end_label, tmp150
	movq	%rax, %rsi	; tmp150,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _10
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-40(%rbp), %rax	; body_label, tmp151
	movq	%rax, %rsi	; tmp151,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _11
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-80(%rbp), %rax	; condition, tmp152
	movq	%rbx, %rcx	; _10,
	movq	%rax, %rsi	; tmp152,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp153, inst
; src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp154
	movq	16(%rax), %rax	; status_55(D)->current_block, _12
; src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-64(%rbp), %rdx	; inst, tmp155
	movq	%rdx, %rsi	; tmp155,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L179	;
.L178:
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	; body_label, tmp156
	movq	%rax, %rsi	; tmp156,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _14,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -56(%rbp)	; tmp157, inst
; src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp158
	movq	16(%rax), %rax	; status_55(D)->current_block, _15
; src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _15->instructions, _16
	movq	-56(%rbp), %rdx	; inst, tmp159
	movq	%rdx, %rsi	; tmp159,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
.L179:
; src/tac.c:569:     Block* body_block = create_block(body_label);
	movq	-40(%rbp), %rax	; body_label, tmp160
	movq	%rax, %rdi	; tmp160,
	call	create_block	;
	movq	%rax, -88(%rbp)	; tmp161, body_block
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	-160(%rbp), %rax	; status, tmp162
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _17
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	; _17->blocks, _18
	movq	-88(%rbp), %rdx	; body_block, tmp163
	movq	%rdx, %rsi	; tmp163,
	movq	%rax, %rdi	; _18,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:571:     status->current_block = body_block;
	movq	-160(%rbp), %rax	; status, tmp164
	movq	-88(%rbp), %rdx	; body_block, tmp165
	movq	%rdx, 16(%rax)	; tmp165, status_55(D)->current_block
; src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp166
	movq	%rax, %rcx	; tmp166,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -96(%rbp)	; tmp167, increment_label
; src/tac.c:574:     if (for_->increment != NULL)
	movq	-152(%rbp), %rax	; for_, tmp168
	movq	16(%rax), %rax	; for__54(D)->increment, _19
; src/tac.c:574:     if (for_->increment != NULL)
	testq	%rax, %rax	; _19
	je	.L180	;,
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-96(%rbp), %rax	; increment_label, tmp169
	movq	%rax, %rsi	; tmp169,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _20
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-160(%rbp), %rax	; status, tmp170
	movq	40(%rax), %rax	; status_55(D)->start_labels, _21
	movq	%rdx, %rsi	; _20,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L181	;
.L180:
; src/tac.c:576:     else if (for_->condition != NULL)
	movq	-152(%rbp), %rax	; for_, tmp171
	movq	8(%rax), %rax	; for__54(D)->condition, _22
; src/tac.c:576:     else if (for_->condition != NULL)
	testq	%rax, %rax	; _22
	je	.L182	;,
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-32(%rbp), %rax	; condition_label, tmp172
	movq	%rax, %rsi	; tmp172,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _23
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-160(%rbp), %rax	; status, tmp173
	movq	40(%rax), %rax	; status_55(D)->start_labels, _24
	movq	%rdx, %rsi	; _23,
	movq	%rax, %rdi	; _24,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L181	;
.L182:
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-40(%rbp), %rax	; body_label, tmp174
	movq	%rax, %rsi	; tmp174,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _25
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-160(%rbp), %rax	; status, tmp175
	movq	40(%rax), %rax	; status_55(D)->start_labels, _26
	movq	%rdx, %rsi	; _25,
	movq	%rax, %rdi	; _26,
	call	*list_append@GOTPCREL(%rip)	;
.L181:
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; end_label, tmp176
	movq	%rax, %rsi	; tmp176,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _27
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-160(%rbp), %rax	; status, tmp177
	movq	32(%rax), %rax	; status_55(D)->end_labels, _28
	movq	%rdx, %rsi	; _27,
	movq	%rax, %rdi	; _28,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	-152(%rbp), %rax	; for_, tmp178
	movq	24(%rax), %rax	; for__54(D)->body, _29
	movq	%rax, %rdi	; _29,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp179, body_statements
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L183	;
.L184:
; src/tac.c:584:         tac_statement(statement, status);
	movq	-160(%rbp), %rdx	; status, tmp180
	movq	-112(%rbp), %rax	; statement, tmp181
	movq	%rdx, %rsi	; tmp180,
	movq	%rax, %rdi	; tmp181,
	call	tac_statement	;
.L183:
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-104(%rbp), %rax	; body_statements, tmp182
	movq	%rax, %rdi	; tmp182,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp183, statement
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -112(%rbp)	;, statement
	jne	.L184	;,
; src/tac.c:585:     list_pop_back(status->start_labels);
	movq	-160(%rbp), %rax	; status, tmp184
	movq	40(%rax), %rax	; status_55(D)->start_labels, _30
	movq	%rax, %rdi	; _30,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:586:     list_pop_back(status->end_labels);
	movq	-160(%rbp), %rax	; status, tmp185
	movq	32(%rax), %rax	; status_55(D)->end_labels, _31
	movq	%rax, %rdi	; _31,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:587:     if (for_->increment != NULL) {
	movq	-152(%rbp), %rax	; for_, tmp186
	movq	16(%rax), %rax	; for__54(D)->increment, _32
; src/tac.c:587:     if (for_->increment != NULL) {
	testq	%rax, %rax	; _32
	je	.L185	;,
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	-96(%rbp), %rax	; increment_label, tmp187
	movq	%rax, %rsi	; tmp187,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _33,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -120(%rbp)	; tmp188, inst
; src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp189
	movq	16(%rax), %rax	; status_55(D)->current_block, _34
; src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _34->instructions, _35
	movq	-120(%rbp), %rdx	; inst, tmp190
	movq	%rdx, %rsi	; tmp190,
	movq	%rax, %rdi	; _35,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:591:         Block* increment_block = create_block(increment_label);
	movq	-96(%rbp), %rax	; increment_label, tmp191
	movq	%rax, %rdi	; tmp191,
	call	create_block	;
	movq	%rax, -128(%rbp)	; tmp192, increment_block
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	-160(%rbp), %rax	; status, tmp193
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _36
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	32(%rax), %rax	; _36->blocks, _37
	movq	-128(%rbp), %rdx	; increment_block, tmp194
	movq	%rdx, %rsi	; tmp194,
	movq	%rax, %rdi	; _37,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:593:         status->current_block = increment_block;
	movq	-160(%rbp), %rax	; status, tmp195
	movq	-128(%rbp), %rdx	; increment_block, tmp196
	movq	%rdx, 16(%rax)	; tmp196, status_55(D)->current_block
; src/tac.c:594:         tac_expression(for_->increment, status);
	movq	-152(%rbp), %rax	; for_, tmp197
	movq	16(%rax), %rax	; for__54(D)->increment, _38
	movq	-160(%rbp), %rdx	; status, tmp198
	movq	%rdx, %rsi	; tmp198,
	movq	%rax, %rdi	; _38,
	call	tac_expression	;
.L185:
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	; condition_label, tmp199
	movq	%rax, %rsi	; tmp199,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _39,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp200, inst
; src/tac.c:598:     if (for_->condition == NULL)
	movq	-152(%rbp), %rax	; for_, tmp201
	movq	8(%rax), %rax	; for__54(D)->condition, _40
; src/tac.c:598:     if (for_->condition == NULL)
	testq	%rax, %rax	; _40
	jne	.L186	;,
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	; body_label, tmp202
	movq	%rax, %rsi	; tmp202,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _41,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp203, inst
.L186:
; src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp204
	movq	16(%rax), %rax	; status_55(D)->current_block, _42
; src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _42->instructions, _43
	movq	-24(%rbp), %rdx	; inst, tmp205
	movq	%rdx, %rsi	; tmp205,
	movq	%rax, %rdi	; _43,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:602:     Block* end_block = create_block(end_label);
	movq	-48(%rbp), %rax	; end_label, tmp206
	movq	%rax, %rdi	; tmp206,
	call	create_block	;
	movq	%rax, -136(%rbp)	; tmp207, end_block
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-160(%rbp), %rax	; status, tmp208
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _44
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _44->blocks, _45
	movq	-136(%rbp), %rdx	; end_block, tmp209
	movq	%rdx, %rsi	; tmp209,
	movq	%rax, %rdi	; _45,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:604:     status->current_block = end_block;
	movq	-160(%rbp), %rax	; status, tmp210
	movq	-136(%rbp), %rdx	; end_block, tmp211
	movq	%rdx, 16(%rax)	; tmp211, status_55(D)->current_block
; src/tac.c:606: }
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
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp106
	movq	%rax, %rcx	; tmp106,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp107, condition_label
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	; condition_label, tmp108
	movq	%rax, %rsi	; tmp108,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _1,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp109, inst
; src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp110
	movq	16(%rax), %rax	; status_27(D)->current_block, _2
; src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _2->instructions, _3
	movq	-32(%rbp), %rdx	; inst, tmp111
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; _3,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:613:     Block* condition_block = create_block(condition_label);
	movq	-24(%rbp), %rax	; condition_label, tmp112
	movq	%rax, %rdi	; tmp112,
	call	create_block	;
	movq	%rax, -40(%rbp)	; tmp113, condition_block
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	-112(%rbp), %rax	; status, tmp114
	movq	8(%rax), %rax	; status_27(D)->current_subroutine, _4
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	; _4->blocks, _5
	movq	-40(%rbp), %rdx	; condition_block, tmp115
	movq	%rdx, %rsi	; tmp115,
	movq	%rax, %rdi	; _5,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:615:     status->current_block = condition_block;
	movq	-112(%rbp), %rax	; status, tmp116
	movq	-40(%rbp), %rdx	; condition_block, tmp117
	movq	%rdx, 16(%rax)	; tmp117, status_27(D)->current_block
; src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp118
	movq	%rax, %rcx	; tmp118,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -48(%rbp)	; tmp119, body_label
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -56(%rbp)	; tmp121, end_label
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	-104(%rbp), %rax	; while_, tmp122
	movq	(%rax), %rax	; while__42(D)->condition, _6
	movq	-112(%rbp), %rdx	; status, tmp123
	movq	%rdx, %rsi	; tmp123,
	movq	%rax, %rdi	; _6,
	call	tac_expression	;
	movq	%rax, -64(%rbp)	; tmp124, condition
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	; end_label, tmp125
	movq	%rax, %rsi	; tmp125,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _7
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; body_label, tmp126
	movq	%rax, %rsi	; tmp126,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _8
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-64(%rbp), %rax	; condition, tmp127
	movq	%rbx, %rcx	; _7,
	movq	%rax, %rsi	; tmp127,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp128, inst
; src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp129
	movq	16(%rax), %rax	; status_27(D)->current_block, _9
; src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _9->instructions, _10
	movq	-32(%rbp), %rdx	; inst, tmp130
	movq	%rdx, %rsi	; tmp130,
	movq	%rax, %rdi	; _10,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:623:     Block* body_block = create_block(body_label);
	movq	-48(%rbp), %rax	; body_label, tmp131
	movq	%rax, %rdi	; tmp131,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp132, body_block
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	-112(%rbp), %rax	; status, tmp133
	movq	8(%rax), %rax	; status_27(D)->current_subroutine, _11
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	; _11->blocks, _12
	movq	-72(%rbp), %rdx	; body_block, tmp134
	movq	%rdx, %rsi	; tmp134,
	movq	%rax, %rdi	; _12,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:625:     status->current_block = body_block;
	movq	-112(%rbp), %rax	; status, tmp135
	movq	-72(%rbp), %rdx	; body_block, tmp136
	movq	%rdx, 16(%rax)	; tmp136, status_27(D)->current_block
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-24(%rbp), %rax	; condition_label, tmp137
	movq	%rax, %rsi	; tmp137,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _13
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-112(%rbp), %rax	; status, tmp138
	movq	40(%rax), %rax	; status_27(D)->start_labels, _14
	movq	%rdx, %rsi	; _13,
	movq	%rax, %rdi	; _14,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	; end_label, tmp139
	movq	%rax, %rsi	; tmp139,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _15
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-112(%rbp), %rax	; status, tmp140
	movq	32(%rax), %rax	; status_27(D)->end_labels, _16
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	-104(%rbp), %rax	; while_, tmp141
	movq	8(%rax), %rax	; while__42(D)->body, _17
	movq	%rax, %rdi	; _17,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp142, body_statements
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L188	;
.L189:
; src/tac.c:632:         tac_statement(statement, status);
	movq	-112(%rbp), %rdx	; status, tmp143
	movq	-88(%rbp), %rax	; statement, tmp144
	movq	%rdx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	tac_statement	;
.L188:
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-80(%rbp), %rax	; body_statements, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp146, statement
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L189	;,
; src/tac.c:633:     list_pop_back(status->start_labels);
	movq	-112(%rbp), %rax	; status, tmp147
	movq	40(%rax), %rax	; status_27(D)->start_labels, _18
	movq	%rax, %rdi	; _18,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:634:     list_pop_back(status->end_labels);
	movq	-112(%rbp), %rax	; status, tmp148
	movq	32(%rax), %rax	; status_27(D)->end_labels, _19
	movq	%rax, %rdi	; _19,
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	; condition_label, tmp149
	movq	%rax, %rsi	; tmp149,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _20,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp150, inst
; src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp151
	movq	16(%rax), %rax	; status_27(D)->current_block, _21
; src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _21->instructions, _22
	movq	-32(%rbp), %rdx	; inst, tmp152
	movq	%rdx, %rsi	; tmp152,
	movq	%rax, %rdi	; _22,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:639:     Block* end_block = create_block(end_label);
	movq	-56(%rbp), %rax	; end_label, tmp153
	movq	%rax, %rdi	; tmp153,
	call	create_block	;
	movq	%rax, -96(%rbp)	; tmp154, end_block
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-112(%rbp), %rax	; status, tmp155
	movq	8(%rax), %rax	; status_27(D)->current_subroutine, _23
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _23->blocks, _24
	movq	-96(%rbp), %rdx	; end_block, tmp156
	movq	%rdx, %rsi	; tmp156,
	movq	%rax, %rdi	; _24,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:641:     status->current_block = end_block;
	movq	-112(%rbp), %rax	; status, tmp157
	movq	-96(%rbp), %rdx	; end_block, tmp158
	movq	%rdx, 16(%rax)	; tmp158, status_27(D)->current_block
; src/tac.c:643: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	tac_while, .-tac_while
	.section	.rodata
	.align 8
.LC13:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -72(%rbp)	; expression, expression
	movq	%rsi, -80(%rbp)	; status, status
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	movq	-72(%rbp), %rax	; expression, tmp105
	movl	24(%rax), %eax	; expression_31(D)->operator, _1
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	;, _1
	jne	.L191	;,
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	-72(%rbp), %rax	; expression, tmp106
	movq	8(%rax), %rax	; expression_31(D)->prim_left, _2
	movq	-80(%rbp), %rdx	; status, tmp107
	movq	%rdx, %rsi	; tmp107,
	movq	%rax, %rdi	; _2,
	call	tac_primary	;
	movq	%rax, -56(%rbp)	; tmp108, result
; src/tac.c:649:         return result;
	movq	-56(%rbp), %rax	; result, _25
	jmp	.L192	;
.L191:
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	-72(%rbp), %rax	; expression, tmp109
	movq	16(%rax), %rax	; expression_31(D)->right, _3
	movq	-80(%rbp), %rdx	; status, tmp110
	movq	%rdx, %rsi	; tmp110,
	movq	%rax, %rdi	; _3,
	call	tac_expression	;
	movq	%rax, %rdx	;, _4
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	-80(%rbp), %rax	; status, tmp111
	movq	%rax, %rsi	; tmp111,
	movq	%rdx, %rdi	; _4,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp112, right
; src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movq	-72(%rbp), %rax	; expression, tmp113
	movl	24(%rax), %eax	; expression_31(D)->operator, _5
	movl	%eax, %edi	; _5,
	call	get_instruction_type	;
	movl	%eax, -20(%rbp)	; tmp114, op
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	-72(%rbp), %rax	; expression, tmp115
	movq	(%rax), %rax	; expression_31(D)->expr_left, _6
	movq	-80(%rbp), %rdx	; status, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; _6,
	call	tac_expression	;
	movq	%rax, -32(%rbp)	; tmp117, left
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	movq	-72(%rbp), %rax	; expression, tmp118
	movl	24(%rax), %eax	; expression_31(D)->operator, _7
	movl	%eax, %edi	; _7,
	call	is_assignment_operator	;
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	testb	%al, %al	; _8
	je	.L193	;,
; src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, -20(%rbp)	;, op
	je	.L194	;,
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	; left, tmp119
	movq	8(%rax), %rax	; left_39->type, _9
	movq	-80(%rbp), %rdx	; status, tmp120
	movq	%rdx, %rcx	; tmp120,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _9,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _10,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp121, temp
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-80(%rbp), %rdx	; status, tmp122
	movq	-32(%rbp), %rax	; left, tmp123
	movq	%rdx, %rsi	; tmp122,
	movq	%rax, %rdi	; tmp123,
	call	load_rvalue	;
	movq	%rax, %rdi	;, _11
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %rdx	; right, tmp124
	movq	-48(%rbp), %rsi	; temp, tmp125
	movl	-20(%rbp), %eax	; op, tmp126
	movq	%rdx, %rcx	; tmp124,
	movq	%rdi, %rdx	; _11,
	movl	%eax, %edi	; tmp126,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp127, inst
; src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-80(%rbp), %rax	; status, tmp128
	movq	16(%rax), %rax	; status_32(D)->current_block, _12
; src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-16(%rbp), %rdx	; inst, tmp129
	movq	%rdx, %rsi	; tmp129,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:660:             right = temp;
	movq	-48(%rbp), %rax	; temp, tmp130
	movq	%rax, -8(%rbp)	; tmp130, right
.L194:
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movq	-32(%rbp), %rax	; left, tmp131
	movl	16(%rax), %eax	; left_39->kind, _14
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	testl	%eax, %eax	; _14
	je	.L195	;,
; src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	stderr(%rip), %rax	; stderr, stderr.20_15
	movq	%rax, %rcx	; stderr.20_15,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	*fwrite@GOTPCREL(%rip)	;
.L195:
; src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	-8(%rbp), %rdx	; right, tmp133
	movq	-32(%rbp), %rax	; left, tmp134
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp134,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp135, inst
; src/tac.c:665:         if (left->is_get)
	movq	-32(%rbp), %rax	; left, tmp136
	movzbl	20(%rax), %eax	; left_39->is_get, _16
; src/tac.c:665:         if (left->is_get)
	testb	%al, %al	; _16
	je	.L196	;,
; src/tac.c:666:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	-8(%rbp), %rdx	; right, tmp137
	movq	-32(%rbp), %rax	; left, tmp138
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp138,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp139, inst
	jmp	.L196	;
.L193:
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	; left, tmp140
	movq	8(%rax), %rax	; left_39->type, _17
	movq	-80(%rbp), %rdx	; status, tmp141
	movq	%rdx, %rcx	; tmp141,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _17,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _18,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp142, temp
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-80(%rbp), %rdx	; status, tmp143
	movq	-32(%rbp), %rax	; left, tmp144
	movq	%rdx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	load_rvalue	;
	movq	%rax, %rdi	;, _19
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %rdx	; right, tmp145
	movq	-40(%rbp), %rsi	; temp, tmp146
	movl	-20(%rbp), %eax	; op, tmp147
	movq	%rdx, %rcx	; tmp145,
	movq	%rdi, %rdx	; _19,
	movl	%eax, %edi	; tmp147,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp148, inst
; src/tac.c:670:         right = temp;
	movq	-40(%rbp), %rax	; temp, tmp149
	movq	%rax, -8(%rbp)	; tmp149, right
.L196:
; src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-80(%rbp), %rax	; status, tmp150
	movq	16(%rax), %rax	; status_32(D)->current_block, _20
; src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _20->instructions, _21
	movq	-16(%rbp), %rdx	; inst, tmp151
	movq	%rdx, %rsi	; tmp151,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:674:     return right;
	movq	-8(%rbp), %rax	; right, _25
.L192:
; src/tac.c:675: }
	leave	
	ret	
	.size	tac_expression, .-tac_expression
	.section	.rodata
	.align 8
.LC15:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC16:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -104(%rbp)	; primary, primary
	movq	%rsi, -112(%rbp)	; status, status
; src/tac.c:678:     switch (primary->type) {
	movq	-104(%rbp), %rax	; primary, tmp115
	movl	8(%rax), %eax	; primary_39(D)->type, _1
; src/tac.c:678:     switch (primary->type) {
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
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	-104(%rbp), %rax	; primary, tmp123
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _2
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movl	$10, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _2,
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, -56(%rbp)	; _3, t
; src/tac.c:682:             return create_arg(ARG_INT, &t);
	leaq	-56(%rbp), %rax	;, tmp124
	movq	%rax, %rsi	; tmp124,
	movl	$1, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L207:
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	-104(%rbp), %rax	; primary, tmp125
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _4
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _4,
	call	*strtod@GOTPCREL(%rip)	;
	movq	%xmm0, %rax	;, _5
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	%rax, -64(%rbp)	; _5, t
; src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	leaq	-64(%rbp), %rax	;, tmp126
	movq	%rax, %rsi	; tmp126,
	movl	$2, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L206:
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	-104(%rbp), %rax	; primary, tmp127
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _6
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%rax, %rsi	; _6,
	movl	$3, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L205:
; src/tac.c:692:             bool t = true;
	movb	$1, -65(%rbp)	;, t
; src/tac.c:694:             return create_arg(ARG_BOOL, &t);
	leaq	-65(%rbp), %rax	;, tmp128
	movq	%rax, %rsi	; tmp128,
	movl	$4, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L204:
; src/tac.c:697:             bool t = false;
	movb	$0, -66(%rbp)	;, t
; src/tac.c:699:             return create_arg(ARG_BOOL, &t);
	leaq	-66(%rbp), %rax	;, tmp129
	movq	%rax, %rsi	; tmp129,
	movl	$4, %edi	;,
	call	create_arg	;
	jmp	.L209	;
.L203:
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	-104(%rbp), %rax	; primary, tmp130
	movq	(%rax), %rax	; primary_39(D)->value.expr, _7
	movq	-112(%rbp), %rdx	; status, tmp131
	movq	%rdx, %rsi	; tmp131,
	movq	%rax, %rdi	; _7,
	call	tac_expression	;
	jmp	.L209	;
.L202:
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-104(%rbp), %rax	; primary, tmp132
	movq	(%rax), %rax	; primary_39(D)->value.operand, _8
	movq	-112(%rbp), %rdx	; status, tmp133
	movq	%rdx, %rsi	; tmp133,
	movq	%rax, %rdi	; _8,
	call	tac_primary	;
	movq	%rax, %rdx	;, _9
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-112(%rbp), %rax	; status, tmp134
	movq	%rax, %rsi	; tmp134,
	movq	%rdx, %rdi	; _9,
	call	load_rvalue	;
	movq	%rax, -32(%rbp)	; tmp135, operand
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	name_bool(%rip), %rax	; name_bool, name_bool.22_10
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	-112(%rbp), %rdx	; status, tmp136
	movq	%rdx, %rcx	; tmp136,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; name_bool.22_10,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rsi	; _11,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp137, temp
; src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	-32(%rbp), %rdx	; operand, tmp138
	movq	-40(%rbp), %rax	; temp, tmp139
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp139,
	movl	$13, %edi	;,
	call	create_instruction	;
	movq	%rax, -48(%rbp)	; tmp140, inst
; src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp141
	movq	16(%rax), %rax	; status_40(D)->current_block, _12
; src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-48(%rbp), %rdx	; inst, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:710:             return temp;
	movq	-40(%rbp), %rax	; temp, _34
	jmp	.L209	;
.L201:
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-104(%rbp), %rax	; primary, tmp143
	movq	(%rax), %rax	; primary_39(D)->value.operand, _14
	movq	-112(%rbp), %rdx	; status, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _14,
	call	tac_primary	;
	movq	%rax, %rdx	;, _15
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	-112(%rbp), %rax	; status, tmp145
	movq	%rax, %rsi	; tmp145,
	movq	%rdx, %rdi	; _15,
	call	load_rvalue	;
	movq	%rax, -16(%rbp)	; tmp146, operand
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	-16(%rbp), %rax	; operand, tmp147
	movq	8(%rax), %rax	; operand_45->type, _16
	movq	-112(%rbp), %rdx	; status, tmp148
	movq	%rdx, %rcx	; tmp148,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _16,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _17,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -24(%rbp)	; tmp149, temp
; src/tac.c:715:             Instruction* inst = NULL;
	movq	$0, -8(%rbp)	;, inst
; src/tac.c:716:             long long zero_int = 0;
	movq	$0, -80(%rbp)	;, zero_int
; src/tac.c:717:             double neg_one_float = -1.0;
	movsd	.LC14(%rip), %xmm0	;, tmp150
	movsd	%xmm0, -88(%rbp)	; tmp150, neg_one_float
; src/tac.c:718:             if (operand->type == name_int)
	movq	-16(%rbp), %rax	; operand, tmp151
	movq	8(%rax), %rdx	; operand_45->type, _18
; src/tac.c:718:             if (operand->type == name_int)
	movq	name_int(%rip), %rax	; name_int, name_int.23_19
; src/tac.c:718:             if (operand->type == name_int)
	cmpq	%rax, %rdx	; name_int.23_19, _18
	jne	.L210	;,
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	-80(%rbp), %rax	;, tmp152
	movq	%rax, %rsi	; tmp152,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _20
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
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
; src/tac.c:720:             else if (operand->type == name_float)
	movq	-16(%rbp), %rax	; operand, tmp156
	movq	8(%rax), %rdx	; operand_45->type, _21
; src/tac.c:720:             else if (operand->type == name_float)
	movq	name_float(%rip), %rax	; name_float, name_float.24_22
; src/tac.c:720:             else if (operand->type == name_float)
	cmpq	%rax, %rdx	; name_float.24_22, _21
	jne	.L212	;,
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	-88(%rbp), %rax	;, tmp157
	movq	%rax, %rsi	; tmp157,
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _23
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
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
; src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	-16(%rbp), %rax	; operand, tmp161
	movq	8(%rax), %rax	; operand_45->type, _24
; src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rdx	; _24->name, _25
	movq	stderr(%rip), %rax	; stderr, stderr.25_26
	leaq	.LC15(%rip), %rcx	;, tmp162
	movq	%rcx, %rsi	; tmp162,
	movq	%rax, %rdi	; stderr.25_26,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:725:                 return NULL;
	movl	$0, %eax	;, _34
	jmp	.L209	;
.L211:
; src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp163
	movq	16(%rax), %rax	; status_40(D)->current_block, _27
; src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _27->instructions, _28
	movq	-8(%rbp), %rdx	; inst, tmp164
	movq	%rdx, %rsi	; tmp164,
	movq	%rax, %rdi	; _28,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:729:             return temp;
	movq	-24(%rbp), %rax	; temp, _34
	jmp	.L209	;
.L199:
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	-104(%rbp), %rax	; primary, tmp165
	movq	(%rax), %rax	; primary_39(D)->value.var, _29
	movq	-112(%rbp), %rdx	; status, tmp166
	movq	%rdx, %rsi	; tmp166,
	movq	%rax, %rdi	; _29,
	call	tac_variable_access	;
	jmp	.L209	;
.L198:
; src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	-104(%rbp), %rax	; primary, tmp167
	movl	8(%rax), %edx	; primary_39(D)->type, _30
; src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	stderr(%rip), %rax	; stderr, stderr.26_31
	leaq	.LC16(%rip), %rcx	;, tmp168
	movq	%rcx, %rsi	; tmp168,
	movq	%rax, %rdi	; stderr.26_31,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:737:             return NULL;
	movl	$0, %eax	;, _34
.L209:
; src/tac.c:739: }
	leave	
	ret	
	.size	tac_primary, .-tac_primary
	.section	.rodata
	.align 8
.LC17:
	.string	"[warning] Unsupported variable access with NULL base\n"
	.align 8
.LC18:
	.string	"[warning] Failed to generate variable access for base\n"
	.align 8
.LC19:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC20:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC21:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
	.align 8
.LC22:
	.string	"[warning] Attempting to index non-array type: %s\n"
.LC23:
	.string	"arr"
	.align 8
.LC24:
	.string	"[warning] Failed to generate variable access for index\n"
	.align 8
.LC25:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC26:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$176, %rsp	;,
	movq	%rdi, -168(%rbp)	; variable_access, variable_access
	movq	%rsi, -176(%rbp)	; status, status
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	-168(%rbp), %rax	; variable_access, tmp200
	movl	16(%rax), %eax	; variable_access_126(D)->type, _1
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testl	%eax, %eax	; _1
	jne	.L215	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	-168(%rbp), %rax	; variable_access, tmp201
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _2
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rax, %rax	; _2
	je	.L215	;,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movq	-168(%rbp), %rax	; variable_access, tmp202
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _3
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _3->kind, _4
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	;, _4
	je	.L216	;,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movq	-168(%rbp), %rax	; variable_access, tmp203
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _5
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _5->kind, _6
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$2, %eax	;, _6
	je	.L216	;,
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	-168(%rbp), %rax	; variable_access, tmp204
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _7
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rax), %rsi	; _7->type, _8
	movq	-168(%rbp), %rax	; variable_access, tmp205
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _9
	movq	-176(%rbp), %rdx	; status, tmp206
	movq	%rdx, %rcx	; tmp206,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _9,
	call	create_var	;
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rsi	; _10,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -24(%rbp)	; tmp207, result
; src/tac.c:746:             return result;
	movq	-24(%rbp), %rax	; result, _120
	jmp	.L217	;
.L216:
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	-168(%rbp), %rax	; variable_access, tmp208
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _11
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; _11->type, _12
	movq	-168(%rbp), %rax	; variable_access, tmp209
	movq	8(%rax), %rax	; variable_access_126(D)->content.name, _13
	movq	-176(%rbp), %rdx	; status, tmp210
	movq	%rdx, %rcx	; tmp210,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; _13,
	call	create_var	;
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _14,
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, -32(%rbp)	; tmp211, result
; src/tac.c:750:             return result;
	movq	-32(%rbp), %rax	; result, _120
	jmp	.L217	;
.L215:
; src/tac.c:753:     if (variable_access->base == NULL) {
	movq	-168(%rbp), %rax	; variable_access, tmp212
	movq	(%rax), %rax	; variable_access_126(D)->base, _15
; src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rax, %rax	; _15
	jne	.L218	;,
; src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movq	stderr(%rip), %rax	; stderr, stderr.27_16
	movq	%rax, %rcx	; stderr.27_16,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp213
	movq	%rax, %rdi	; tmp213,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:756:         return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L218:
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	-168(%rbp), %rax	; variable_access, tmp214
	movq	(%rax), %rax	; variable_access_126(D)->base, _17
	movq	-176(%rbp), %rdx	; status, tmp215
	movq	%rdx, %rsi	; tmp215,
	movq	%rax, %rdi	; _17,
	call	tac_variable_access	;
	movq	%rax, %rdx	;, _18
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	-176(%rbp), %rax	; status, tmp216
	movq	%rax, %rsi	; tmp216,
	movq	%rdx, %rdi	; _18,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp217, base
; src/tac.c:759:     if (base == NULL) {
	cmpq	$0, -8(%rbp)	;, base
	jne	.L219	;,
; src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movq	stderr(%rip), %rax	; stderr, stderr.28_19
	movq	%rax, %rcx	; stderr.28_19,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rax	;, tmp218
	movq	%rax, %rdi	; tmp218,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:762:         return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L219:
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movq	-168(%rbp), %rax	; variable_access, tmp219
	movl	16(%rax), %eax	; variable_access_126(D)->type, _20
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %eax	;, _20
	jne	.L220	;,
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-8(%rbp), %rax	; base, tmp220
	movq	8(%rax), %rax	; base_138->type, _21
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _21->kind, _22
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %eax	;, _22
	je	.L221	;,
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-8(%rbp), %rax	; base, tmp221
	movq	8(%rax), %rax	; base_138->type, _23
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	; _23->kind, _24
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$2, %eax	;, _24
	jne	.L222	;,
.L221:
; src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	-8(%rbp), %rax	; base, tmp222
	movq	8(%rax), %rax	; base_138->type, _25
; src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rdx	; _25->name, _26
	movq	stderr(%rip), %rax	; stderr, stderr.29_27
	leaq	.LC19(%rip), %rcx	;, tmp223
	movq	%rcx, %rsi	; tmp223,
	movq	%rax, %rdi	; stderr.29_27,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:768:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L222:
; src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	-8(%rbp), %rax	; base, tmp224
	movq	8(%rax), %rax	; base_138->type, _28
; src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rax	; _28->ast_node.scope, tmp225
	movq	%rax, -16(%rbp)	; tmp225, scope
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	movq	-8(%rbp), %rax	; base, tmp226
	movq	8(%rax), %rax	; base_138->type, _29
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _29->kind, _30
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _30
	jne	.L223	;,
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	-8(%rbp), %rax	; base, tmp227
	movq	8(%rax), %rax	; base_138->type, _31
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	24(%rax), %rax	; _31->ast_node.class, _32
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rax), %rax	; _32->class_scope, tmp228
	movq	%rax, -16(%rbp)	; tmp228, scope
.L223:
; src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	-168(%rbp), %rax	; variable_access, tmp229
	movq	8(%rax), %rax	; variable_access_126(D)->content.attr_name, _33
; src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rax), %rdx	; _33->name, _34
	movq	-16(%rbp), %rax	; scope, tmp230
	movq	%rdx, %rsi	; _34,
	movq	%rax, %rdi	; tmp230,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -120(%rbp)	; tmp231, attr
; src/tac.c:774:         if (attr == NULL) {
	cmpq	$0, -120(%rbp)	;, attr
	jne	.L224	;,
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp232
	movq	8(%rax), %rax	; base_138->type, _35
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rcx	; _35->name, _36
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-168(%rbp), %rax	; variable_access, tmp233
	movq	8(%rax), %rax	; variable_access_126(D)->content.attr_name, _37
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rdx	; _37->name, _38
	movq	stderr(%rip), %rax	; stderr, stderr.30_39
	leaq	.LC20(%rip), %rsi	;, tmp234
	movq	%rax, %rdi	; stderr.30_39,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:777:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L224:
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movq	-120(%rbp), %rax	; attr, tmp235
	movl	32(%rax), %eax	; attr_193->kind, _40
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$2, %eax	;, _40
	je	.L225	;,
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movq	-120(%rbp), %rax	; attr, tmp236
	movl	32(%rax), %eax	; attr_193->kind, _41
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	;, _41
	jne	.L226	;,
.L225:
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-120(%rbp), %rax	; attr, tmp237
	movq	(%rax), %rsi	; attr_193->type, _42
	movq	-176(%rbp), %rdx	; status, tmp238
	movq	-120(%rbp), %rax	; attr, tmp239
	movq	%rdx, %rcx	; tmp238,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp239,
	call	create_var	;
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _43,
	movl	$7, %edi	;,
	call	create_arg	;
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L217	;
.L226:
; src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	movq	-120(%rbp), %rax	; attr, tmp240
	movl	32(%rax), %eax	; attr_193->kind, _44
; src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _44
	je	.L227	;,
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp241
	movq	8(%rax), %rax	; base_138->type, _45
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rcx	; _45->name, _46
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	-168(%rbp), %rax	; variable_access, tmp242
	movq	8(%rax), %rax	; variable_access_126(D)->content.attr_name, _47
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rdx	; _47->name, _48
	movq	stderr(%rip), %rax	; stderr, stderr.31_49
	leaq	.LC21(%rip), %rsi	;, tmp243
	movq	%rax, %rdi	; stderr.31_49,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L227:
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	-120(%rbp), %rax	; attr, tmp244
	movq	(%rax), %rax	; attr_193->type, _50
	movq	-176(%rbp), %rdx	; status, tmp245
	movq	%rdx, %rcx	; tmp245,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _50,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _51,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -128(%rbp)	; tmp246, temp
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	-168(%rbp), %rax	; variable_access, tmp247
	movq	8(%rax), %rax	; variable_access_126(D)->content.attr_name, _52
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rax), %rsi	; _52->type, _53
	movq	-168(%rbp), %rax	; variable_access, tmp248
	movq	8(%rax), %rax	; variable_access_126(D)->content.attr_name, _54
	movq	-176(%rbp), %rdx	; status, tmp249
	movq	%rdx, %rcx	; tmp249,
	movl	$97, %edx	;,
	movq	%rax, %rdi	; _54,
	call	create_var	;
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rsi	; _55,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _56
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	-8(%rbp), %rdx	; base, tmp250
	movq	-128(%rbp), %rax	; temp, tmp251
	movq	%rax, %rsi	; tmp251,
	movl	$15, %edi	;,
	call	create_instruction	;
	movq	%rax, -136(%rbp)	; tmp252, inst
; src/tac.c:788:         temp->is_get = true;
	movq	-128(%rbp), %rax	; temp, tmp253
	movb	$1, 20(%rax)	;, temp_196->is_get
; src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-176(%rbp), %rax	; status, tmp254
	movq	16(%rax), %rax	; status_127(D)->current_block, _57
; src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _57->instructions, _58
	movq	-136(%rbp), %rdx	; inst, tmp255
	movq	%rdx, %rsi	; tmp255,
	movq	%rax, %rdi	; _58,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:791:         return temp;
	movq	-128(%rbp), %rax	; temp, _120
	jmp	.L217	;
.L220:
; src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	movq	-168(%rbp), %rax	; variable_access, tmp256
	movl	16(%rax), %eax	; variable_access_126(D)->type, _59
; src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %eax	;, _59
	jne	.L228	;,
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	-8(%rbp), %rax	; base, tmp257
	movq	8(%rax), %rax	; base_138->type, _60
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	; _60->kind, _61
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$3, %eax	;, _61
	je	.L229	;,
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	-8(%rbp), %rax	; base, tmp258
	movq	8(%rax), %rax	; base_138->type, _62
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	; _62->kind, _63
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$4, %eax	;, _63
	je	.L229	;,
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	-8(%rbp), %rax	; base, tmp259
	movq	8(%rax), %rax	; base_138->type, _64
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	; _64->kind, _65
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _65
	je	.L229	;,
; src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	-8(%rbp), %rax	; base, tmp260
	movq	8(%rax), %rax	; base_138->type, _66
; src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	8(%rax), %rdx	; _66->name, _67
	movq	stderr(%rip), %rax	; stderr, stderr.32_68
	leaq	.LC22(%rip), %rcx	;, tmp261
	movq	%rcx, %rsi	; tmp261,
	movq	%rax, %rdi	; stderr.32_68,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:796:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L229:
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	-8(%rbp), %rax	; base, tmp262
	movq	8(%rax), %rax	; base_138->type, _69
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	; _69->name, _70
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC23(%rip), %rdx	;, tmp263
	movq	%rdx, %rsi	; tmp263,
	movq	%rax, %rdi	; _70,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; _71
	je	.L230	;,
; src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	-8(%rbp), %rax	; base, tmp264
	movq	8(%rax), %rax	; base_138->type, _72
; src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	8(%rax), %rdx	; _72->name, _73
	movq	stderr(%rip), %rax	; stderr, stderr.33_74
	leaq	.LC22(%rip), %rcx	;, tmp265
	movq	%rcx, %rsi	; tmp265,
	movq	%rax, %rdi	; stderr.33_74,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:801:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L230:
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	-168(%rbp), %rax	; variable_access, tmp266
	movq	8(%rax), %rax	; variable_access_126(D)->content.index, _75
	movq	-176(%rbp), %rdx	; status, tmp267
	movq	%rdx, %rsi	; tmp267,
	movq	%rax, %rdi	; _75,
	call	tac_expression	;
	movq	%rax, %rdx	;, _76
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	-176(%rbp), %rax	; status, tmp268
	movq	%rax, %rsi	; tmp268,
	movq	%rdx, %rdi	; _76,
	call	load_rvalue	;
	movq	%rax, -96(%rbp)	; tmp269, index
; src/tac.c:804:         if (index == NULL) {
	cmpq	$0, -96(%rbp)	;, index
	jne	.L231	;,
; src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movq	stderr(%rip), %rax	; stderr, stderr.34_77
	movq	%rax, %rcx	; stderr.34_77,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rax	;, tmp270
	movq	%rax, %rdi	; tmp270,
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:807:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L231:
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	-8(%rbp), %rax	; base, tmp271
	movq	8(%rax), %rax	; base_138->type, _78
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	(%rax), %rax	; _78->type, _79
	movq	-176(%rbp), %rdx	; status, tmp272
	movq	%rdx, %rcx	; tmp272,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _79,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _80,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -104(%rbp)	; tmp273, temp
; src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	-96(%rbp), %rcx	; index, tmp274
	movq	-8(%rbp), %rdx	; base, tmp275
	movq	-104(%rbp), %rax	; temp, tmp276
	movq	%rax, %rsi	; tmp276,
	movl	$16, %edi	;,
	call	create_instruction	;
	movq	%rax, -112(%rbp)	; tmp277, inst
; src/tac.c:811:         temp->is_get = true;
	movq	-104(%rbp), %rax	; temp, tmp278
	movb	$1, 20(%rax)	;, temp_180->is_get
; src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-176(%rbp), %rax	; status, tmp279
	movq	16(%rax), %rax	; status_127(D)->current_block, _81
; src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _81->instructions, _82
	movq	-112(%rbp), %rdx	; inst, tmp280
	movq	%rdx, %rsi	; tmp280,
	movq	%rax, %rdi	; _82,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:814:         return temp;
	movq	-104(%rbp), %rax	; temp, _120
	jmp	.L217	;
.L228:
; src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	movq	-168(%rbp), %rax	; variable_access, tmp281
	movl	16(%rax), %eax	; variable_access_126(D)->type, _83
; src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %eax	;, _83
	jne	.L232	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-8(%rbp), %rax	; base, tmp282
	movl	16(%rax), %eax	; base_138->kind, _84
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _84
	jne	.L233	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-8(%rbp), %rax	; base, tmp283
	movq	8(%rax), %rax	; base_138->type, _85
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %eax	; _85->kind, _86
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _86
	jne	.L233	;,
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.35_87
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-8(%rbp), %rax	; base, tmp284
	movq	8(%rax), %rax	; base_138->type, _88
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rax	; _88->name, _89
	movq	%rdx, %rsi	; DEFAULT_CONSTRUCTOR_NAME.35_87,
	movq	%rax, %rdi	; _89,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rdx	;, _90
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-8(%rbp), %rax	; base, tmp285
	movq	8(%rax), %rax	; base_138->type, _91
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _91->ast_node.class, _92
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	16(%rax), %rax	; _92->class_scope, _93
	movq	%rdx, %rsi	; _90,
	movq	%rax, %rdi	; _93,
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp286, attr
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-40(%rbp), %rax	; attr, tmp287
	movq	(%rax), %rsi	; attr_143->type, _94
	movq	-176(%rbp), %rdx	; status, tmp288
	movq	-40(%rbp), %rax	; attr, tmp289
	movq	%rdx, %rcx	; tmp288,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp289,
	call	create_var	;
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _95,
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp290, base
.L233:
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	movq	-8(%rbp), %rax	; base, tmp291
	movl	16(%rax), %eax	; base_117->kind, _96
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %eax	;, _96
	je	.L234	;,
; src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp292
	movq	8(%rax), %rax	; base_117->type, _97
; src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rcx	; _97->name, _98
; src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-8(%rbp), %rax	; base, tmp293
	movl	16(%rax), %edx	; base_117->kind, _99
; src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	stderr(%rip), %rax	; stderr, stderr.36_100
	leaq	.LC25(%rip), %rsi	;, tmp294
	movq	%rax, %rdi	; stderr.36_100,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:823:             return NULL;
	movl	$0, %eax	;, _120
	jmp	.L217	;
.L234:
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	-168(%rbp), %rax	; variable_access, tmp295
	movq	8(%rax), %rax	; variable_access_126(D)->content.args, _101
	movq	%rax, %rdi	; _101,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp296, args
; src/tac.c:827:         long long arg_count = 0;
	movq	$0, -144(%rbp)	;, arg_count
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L236	;
.L237:
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	-176(%rbp), %rdx	; status, tmp297
	movq	-56(%rbp), %rax	; arg_expr, tmp298
	movq	%rdx, %rsi	; tmp297,
	movq	%rax, %rdi	; tmp298,
	call	tac_expression	;
	movq	%rax, -80(%rbp)	; tmp299, arg
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	-80(%rbp), %rax	; arg, tmp300
	movq	8(%rax), %rax	; arg_161->type, _102
	movq	%rax, %rdi	; _102,
	call	get_type_size	;
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, -152(%rbp)	; _104, size
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	leaq	-152(%rbp), %rax	;, tmp301
	movq	%rax, %rsi	; tmp301,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _105
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	-80(%rbp), %rax	; arg, tmp302
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp302,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, -88(%rbp)	; tmp303, inst
; src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-176(%rbp), %rax	; status, tmp304
	movq	16(%rax), %rax	; status_127(D)->current_block, _106
; src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _106->instructions, _107
	movq	-88(%rbp), %rdx	; inst, tmp305
	movq	%rdx, %rsi	; tmp305,
	movq	%rax, %rdi	; _107,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:833:             arg_count++;
	movq	-144(%rbp), %rax	; arg_count, arg_count.37_108
	addq	$1, %rax	;, _109
	movq	%rax, -144(%rbp)	; _109, arg_count
.L236:
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	-48(%rbp), %rax	; args, tmp306
	movq	%rax, %rdi	; tmp306,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -56(%rbp)	; tmp307, arg_expr
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -56(%rbp)	;, arg_expr
	jne	.L237	;,
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	-8(%rbp), %rax	; base, tmp308
	movq	8(%rax), %rax	; base_117->type, _110
	movq	-176(%rbp), %rdx	; status, tmp309
	movq	%rdx, %rcx	; tmp309,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _110,
	movl	$0, %edi	;,
	call	create_var	;
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _111,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -64(%rbp)	; tmp310, temp
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	leaq	-144(%rbp), %rax	;, tmp311
	movq	%rax, %rsi	; tmp311,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _112
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	-8(%rbp), %rdx	; base, tmp312
	movq	-64(%rbp), %rax	; temp, tmp313
	movq	%rax, %rsi	; tmp313,
	movl	$22, %edi	;,
	call	create_instruction	;
	movq	%rax, -72(%rbp)	; tmp314, inst
; src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-176(%rbp), %rax	; status, tmp315
	movq	16(%rax), %rax	; status_127(D)->current_block, _113
; src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _113->instructions, _114
	movq	-72(%rbp), %rdx	; inst, tmp316
	movq	%rdx, %rsi	; tmp316,
	movq	%rax, %rdi	; _114,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:839:         return temp;
	movq	-64(%rbp), %rax	; temp, _120
	jmp	.L217	;
.L232:
; src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	-168(%rbp), %rax	; variable_access, tmp317
	movl	16(%rax), %edx	; variable_access_126(D)->type, _115
; src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	stderr(%rip), %rax	; stderr, stderr.38_116
	leaq	.LC26(%rip), %rcx	;, tmp318
	movq	%rcx, %rsi	; tmp318,
	movq	%rax, %rdi	; stderr.38_116,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/tac.c:843:         return NULL;
	movl	$0, %eax	;, _120
.L217:
; src/tac.c:845: }
	leave	
	ret	
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata
	.align 8
.LC14:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
