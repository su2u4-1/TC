	.file	"tac.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	create_attribute_table;	.scl	3;	.type	32;	.endef
create_attribute_table:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	-8(%rbp), %rdx	 ; table, tmp86
	movq	%rax, (%rdx)	 ; _1, table_4->attributes
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	-8(%rbp), %rax	 ; table, tmp87
	movq	16(%rbp), %rdx	 ; name, tmp88
	movq	%rdx, 8(%rax)	 ; tmp88, table_4->name
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	-8(%rbp), %rax	 ; table, tmp89
	movq	$0, 16(%rax)	 ;, table_4->size
 ; D:/TC/src/tac.c:13:     return table;
	movq	-8(%rbp), %rax	 ; table, _10
 ; D:/TC/src/tac.c:14: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; type, type
 ; D:/TC/src/tac.c:17:     size_t result = 8;
	movq	$8, -24(%rbp)	 ;, result
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	cmpq	$0, 16(%rbp)	 ;, type
	jne	.L4	 ;,
 ; D:/TC/src/tac.c:19:         result = 0;
	movq	$0, -24(%rbp)	 ;, result
	jmp	.L5	 ;
.L4:
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; name_int, name_int.0_1
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, 16(%rbp)	 ; name_int.0_1, type
	je	.L6	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; name_float, name_float.1_2
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, 16(%rbp)	 ; name_float.1_2, type
	je	.L6	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; name_string, name_string.2_3
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, 16(%rbp)	 ; name_string.2_3, type
	jne	.L7	 ;,
.L6:
 ; D:/TC/src/tac.c:21:         result = 8;
	movq	$8, -24(%rbp)	 ;, result
	jmp	.L5	 ;
.L7:
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; name_bool, name_bool.3_4
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rax, 16(%rbp)	 ; name_bool.3_4, type
	je	.L8	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; name_void, name_void.4_5
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rax, 16(%rbp)	 ; name_void.4_5, type
	jne	.L9	 ;,
.L8:
 ; D:/TC/src/tac.c:23:         result = 1;
	movq	$1, -24(%rbp)	 ;, result
	jmp	.L5	 ;
.L9:
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movq	16(%rbp), %rax	 ; type, tmp99
	movl	32(%rax), %eax	 ; type_14(D)->kind, _6
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _6
	jne	.L10	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	16(%rbp), %rax	 ; type, tmp100
	movq	24(%rax), %rax	 ; type_14(D)->ast_node.class, _7
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	 ; _7->size, tmp101
	movq	%rax, -24(%rbp)	 ; tmp101, result
	jmp	.L5	 ;
.L10:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	16(%rbp), %rax	 ; type, tmp102
	movq	8(%rax), %rbx	 ; type_14(D)->name, _8
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	24(%rax), %rax	 ; _9->_stderr, _10
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	%rbx, %r8	 ; _8,
	leaq	.LC0(%rip), %rdx	 ;, tmp103
	movq	%rax, %rcx	 ; _10,
	call	fprintf	 ;
.L5:
 ; D:/TC/src/tac.c:29:     return result;
	movq	-24(%rbp), %rax	 ; result, _22
 ; D:/TC/src/tac.c:30: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.def	is_assignment_operator;	.scl	3;	.type	32;	.endef
is_assignment_operator:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$13, 16(%rbp)	 ;, op
	je	.L13	 ;,
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$14, 16(%rbp)	 ;, op
	je	.L13	 ;,
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$15, 16(%rbp)	 ;, op
	je	.L13	 ;,
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$16, 16(%rbp)	 ;, op
	je	.L13	 ;,
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$17, 16(%rbp)	 ;, op
	je	.L13	 ;,
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$18, 16(%rbp)	 ;, op
	jne	.L14	 ;,
.L13:
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$1, %eax	 ;, iftmp.11_1
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	jmp	.L15	 ;
.L14:
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$0, %eax	 ;, iftmp.11_1
.L15:
 ; D:/TC/src/tac.c:33: }
	popq	%rbp	 ;
	ret	
	.def	get_instruction_type;	.scl	3;	.type	32;	.endef
get_instruction_type:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:/TC/src/tac.c:35:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L18	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L20(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L20(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:37:         case OP_ADD_ASSIGN: return INST_ADD;
	movl	$0, %eax	 ;, _1
	jmp	.L34	 ;
.L23:
 ; D:/TC/src/tac.c:39:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %eax	 ;, _1
	jmp	.L34	 ;
.L22:
 ; D:/TC/src/tac.c:41:         case OP_MUL_ASSIGN: return INST_MUL;
	movl	$2, %eax	 ;, _1
	jmp	.L34	 ;
.L21:
 ; D:/TC/src/tac.c:43:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %eax	 ;, _1
	jmp	.L34	 ;
.L19:
 ; D:/TC/src/tac.c:45:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %eax	 ;, _1
	jmp	.L34	 ;
.L25:
 ; D:/TC/src/tac.c:46:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %eax	 ;, _1
	jmp	.L34	 ;
.L33:
 ; D:/TC/src/tac.c:47:         case OP_EQ: return INST_EQ;
	movl	$5, %eax	 ;, _1
	jmp	.L34	 ;
.L32:
 ; D:/TC/src/tac.c:48:         case OP_NE: return INST_NE;
	movl	$6, %eax	 ;, _1
	jmp	.L34	 ;
.L31:
 ; D:/TC/src/tac.c:49:         case OP_LT: return INST_LT;
	movl	$7, %eax	 ;, _1
	jmp	.L34	 ;
.L30:
 ; D:/TC/src/tac.c:50:         case OP_GT: return INST_GT;
	movl	$8, %eax	 ;, _1
	jmp	.L34	 ;
.L29:
 ; D:/TC/src/tac.c:51:         case OP_LE: return INST_LE;
	movl	$9, %eax	 ;, _1
	jmp	.L34	 ;
.L28:
 ; D:/TC/src/tac.c:52:         case OP_GE: return INST_GE;
	movl	$10, %eax	 ;, _1
	jmp	.L34	 ;
.L27:
 ; D:/TC/src/tac.c:53:         case OP_AND: return INST_AND;
	movl	$11, %eax	 ;, _1
	jmp	.L34	 ;
.L26:
 ; D:/TC/src/tac.c:54:         case OP_OR: return INST_OR;
	movl	$12, %eax	 ;, _1
	jmp	.L34	 ;
.L18:
 ; D:/TC/src/tac.c:56:         default: return INST_NONE;
	movl	$25, %eax	 ;, _1
.L34:
 ; D:/TC/src/tac.c:58: }
	popq	%rbp	 ;
	ret	
	.def	create_tac;	.scl	3;	.type	32;	.endef
create_tac:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, tac
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	movq	-8(%rbp), %rdx	 ; tac, tmp88
	movq	%rax, (%rdx)	 ; _1, tac_6->attribute_tables
 ; D:/TC/src/tac.c:63:     tac->entry_point = NULL;
	movq	-8(%rbp), %rax	 ; tac, tmp89
	movq	$0, 8(%rax)	 ;, tac_6->entry_point
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	movq	-8(%rbp), %rdx	 ; tac, tmp90
	movq	%rax, 16(%rdx)	 ; _2, tac_6->global_vars
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	movq	-8(%rbp), %rdx	 ; tac, tmp91
	movq	%rax, 24(%rdx)	 ; _3, tac_6->subroutines
 ; D:/TC/src/tac.c:67:     return tac;
	movq	-8(%rbp), %rax	 ; tac, _14
 ; D:/TC/src/tac.c:68: }
	leave	
	ret	
	.def	create_tac_status;	.scl	3;	.type	32;	.endef
create_tac_status:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; tac, tac
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp86, status
 ; D:/TC/src/tac.c:72:     status->tac = tac;
	movq	-8(%rbp), %rax	 ; status, tmp87
	movq	16(%rbp), %rdx	 ; tac, tmp88
	movq	%rdx, (%rax)	 ; tmp88, status_5->tac
 ; D:/TC/src/tac.c:73:     status->current_subroutine = NULL;
	movq	-8(%rbp), %rax	 ; status, tmp89
	movq	$0, 8(%rax)	 ;, status_5->current_subroutine
 ; D:/TC/src/tac.c:74:     status->current_block = NULL;
	movq	-8(%rbp), %rax	 ; status, tmp90
	movq	$0, 16(%rax)	 ;, status_5->current_block
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	movq	-8(%rbp), %rdx	 ; status, tmp91
	movq	%rax, 32(%rdx)	 ; _1, status_5->end_labels
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	movq	-8(%rbp), %rdx	 ; status, tmp92
	movq	%rax, 40(%rdx)	 ; _2, status_5->start_labels
 ; D:/TC/src/tac.c:77:     status->attr_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp93
	movq	$0, 48(%rax)	 ;, status_5->attr_count
 ; D:/TC/src/tac.c:78:     status->param_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp94
	movq	$0, 56(%rax)	 ;, status_5->param_count
 ; D:/TC/src/tac.c:79:     status->var_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp95
	movq	$0, 64(%rax)	 ;, status_5->var_count
 ; D:/TC/src/tac.c:80:     status->temp_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp96
	movq	$0, 72(%rax)	 ;, status_5->temp_count
 ; D:/TC/src/tac.c:81:     status->block_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp97
	movq	$0, 80(%rax)	 ;, status_5->block_count
 ; D:/TC/src/tac.c:82:     status->subroutine_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp98
	movq	$0, 88(%rax)	 ;, status_5->subroutine_count
 ; D:/TC/src/tac.c:84:     return status;
	movq	-8(%rbp), %rax	 ; status, _20
 ; D:/TC/src/tac.c:85: }
	leave	
	ret	
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; return_type, return_type
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, subroutine
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movq	-8(%rbp), %rax	 ; subroutine, tmp88
	movq	16(%rbp), %rdx	 ; name, tmp89
	movq	%rdx, (%rax)	 ; tmp89, subroutine_6->name
 ; D:/TC/src/tac.c:90:     subroutine->return_type = return_type;
	movq	-8(%rbp), %rax	 ; subroutine, tmp90
	movq	24(%rbp), %rdx	 ; return_type, tmp91
	movq	%rdx, 8(%rax)	 ; tmp91, subroutine_6->return_type
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	-8(%rbp), %rdx	 ; subroutine, tmp92
	movq	%rax, 16(%rdx)	 ; _1, subroutine_6->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	-8(%rbp), %rdx	 ; subroutine, tmp93
	movq	%rax, 24(%rdx)	 ; _2, subroutine_6->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	-8(%rbp), %rdx	 ; subroutine, tmp94
	movq	%rax, 32(%rdx)	 ; _3, subroutine_6->blocks
 ; D:/TC/src/tac.c:95:     return subroutine;
	movq	-8(%rbp), %rax	 ; subroutine, _17
 ; D:/TC/src/tac.c:96: }
	leave	
	ret	
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; label, label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, block
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	-8(%rbp), %rax	 ; block, tmp86
	movq	16(%rbp), %rdx	 ; label, tmp87
	movq	%rdx, (%rax)	 ; tmp87, block_4->label
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	-8(%rbp), %rdx	 ; block, tmp88
	movq	%rax, 8(%rdx)	 ; _1, block_4->instructions
 ; D:/TC/src/tac.c:103:     return block;
	movq	-8(%rbp), %rax	 ; block, _9
 ; D:/TC/src/tac.c:104: }
	leave	
	ret	
	.def	search_var;	.scl	3;	.type	32;	.endef
search_var:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$112, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; original_name, original_name
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rbp), %rax	 ; status, tmp118
	movq	8(%rax), %rax	 ; status_47(D)->current_subroutine, _1
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	 ; _1
	je	.L44	 ;,
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rbp), %rax	 ; status, tmp119
	movq	8(%rax), %rax	 ; status_47(D)->current_subroutine, _2
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rax	 ; _2->local_vars, _3
	movq	%rax, %rcx	 ; _3,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	 ; _4
	jne	.L44	 ;,
 ; D:/TC/src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	24(%rbp), %rax	 ; status, tmp120
	movq	8(%rax), %rax	 ; status_47(D)->current_subroutine, _5
 ; D:/TC/src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	24(%rax), %rax	 ; _5->local_vars, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp121, vars
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L45	 ;
.L47:
 ; D:/TC/src/tac.c:111:             if (var->original_name == original_name) {
	movq	-16(%rbp), %rax	 ; var, tmp122
	movq	(%rax), %rax	 ; var_52->original_name, _7
 ; D:/TC/src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	%rax, 16(%rbp)	 ; _7, original_name
	jne	.L45	 ;,
 ; D:/TC/src/tac.c:113:                 return var;
	movq	-16(%rbp), %rax	 ; var, _35
	jmp	.L46	 ;
.L45:
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	-8(%rbp), %rax	 ; vars, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp124, var
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	cmpq	$0, -16(%rbp)	 ;, var
	jne	.L47	 ;,
.L44:
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	24(%rbp), %rax	 ; status, tmp125
	movq	8(%rax), %rax	 ; status_47(D)->current_subroutine, _8
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	 ; _8
	je	.L48	 ;,
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	24(%rbp), %rax	 ; status, tmp126
	movq	8(%rax), %rax	 ; status_47(D)->current_subroutine, _9
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rax	 ; _9->parameters, _10
	movq	%rax, %rcx	 ; _10,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	 ; _11
	jne	.L48	 ;,
 ; D:/TC/src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	24(%rbp), %rax	 ; status, tmp127
	movq	8(%rax), %rax	 ; status_47(D)->current_subroutine, _12
 ; D:/TC/src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	16(%rax), %rax	 ; _12->parameters, _13
	movq	%rax, %rcx	 ; _13,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp128, vars
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L49	 ;
.L50:
 ; D:/TC/src/tac.c:121:             if (var->original_name == original_name) {
	movq	-32(%rbp), %rax	 ; var, tmp129
	movq	(%rax), %rax	 ; var_59->original_name, _14
 ; D:/TC/src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	%rax, 16(%rbp)	 ; _14, original_name
	jne	.L49	 ;,
 ; D:/TC/src/tac.c:123:                 return var;
	movq	-32(%rbp), %rax	 ; var, _35
	jmp	.L46	 ;
.L49:
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	-24(%rbp), %rax	 ; vars, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp131, var
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, var
	jne	.L50	 ;,
.L48:
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	24(%rax), %rax	 ; status_47(D)->current_class, _15
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testq	%rax, %rax	 ; _15
	je	.L51	 ;,
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	24(%rbp), %rax	 ; status, tmp133
	movq	(%rax), %rax	 ; status_47(D)->tac, _16
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rax	 ; _16->attribute_tables, _17
	movq	%rax, %rcx	 ; _17,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	 ; _18
	jne	.L51	 ;,
 ; D:/TC/src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	24(%rbp), %rax	 ; status, tmp134
	movq	(%rax), %rax	 ; status_47(D)->tac, _19
 ; D:/TC/src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rax), %rax	 ; _19->attribute_tables, _20
	movq	%rax, %rcx	 ; _20,
	call	list_copy	 ;
	movq	%rax, -40(%rbp)	 ; tmp135, tables
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	jmp	.L53	 ;
.L57:
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	-48(%rbp), %rax	 ; table, tmp136
	movq	8(%rax), %rdx	 ; table_65->name, _21
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rbp), %rax	 ; status, tmp137
	movq	24(%rax), %rax	 ; status_47(D)->current_class, _22
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	 ; _22->name, _23
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	cmpq	%rax, %rdx	 ; _23, _21
	jne	.L53	 ;,
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	-48(%rbp), %rax	 ; table, tmp138
	movq	(%rax), %rax	 ; table_65->attributes, _24
	movq	%rax, %rcx	 ; _24,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	 ; _25
	jne	.L53	 ;,
 ; D:/TC/src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	-48(%rbp), %rax	 ; table, tmp139
	movq	(%rax), %rax	 ; table_65->attributes, _26
	movq	%rax, %rcx	 ; _26,
	call	list_copy	 ;
	movq	%rax, -56(%rbp)	 ; tmp140, attributes
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	jmp	.L55	 ;
.L56:
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	-64(%rbp), %rax	 ; attr, tmp141
	movq	(%rax), %rax	 ; attr_70->var, _27
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rax	 ; _27->original_name, _28
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	%rax, 16(%rbp)	 ; _28, original_name
	jne	.L55	 ;,
 ; D:/TC/src/tac.c:137:                         return attr->var;
	movq	-64(%rbp), %rax	 ; attr, tmp142
	movq	(%rax), %rax	 ; attr_70->var, _35
	jmp	.L46	 ;
.L55:
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	-56(%rbp), %rax	 ; attributes, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	list_pop	 ;
	movq	%rax, -64(%rbp)	 ; tmp144, attr
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	cmpq	$0, -64(%rbp)	 ;, attr
	jne	.L56	 ;,
.L53:
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	-40(%rbp), %rax	 ; tables, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp146, table
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	cmpq	$0, -48(%rbp)	 ;, table
	jne	.L57	 ;,
.L51:
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	24(%rbp), %rax	 ; status, tmp147
	movq	(%rax), %rax	 ; status_47(D)->tac, _29
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	16(%rax), %rax	 ; _29->global_vars, _30
	movq	%rax, %rcx	 ; _30,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	 ; _31
	jne	.L58	 ;,
 ; D:/TC/src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	(%rax), %rax	 ; status_47(D)->tac, _32
 ; D:/TC/src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	16(%rax), %rax	 ; _32->global_vars, _33
	movq	%rax, %rcx	 ; _33,
	call	list_copy	 ;
	movq	%rax, -72(%rbp)	 ; tmp149, vars
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L59	 ;
.L60:
 ; D:/TC/src/tac.c:146:             if (var->original_name == original_name) {
	movq	-80(%rbp), %rax	 ; var, tmp150
	movq	(%rax), %rax	 ; var_76->original_name, _34
 ; D:/TC/src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	%rax, 16(%rbp)	 ; _34, original_name
	jne	.L59	 ;,
 ; D:/TC/src/tac.c:148:                 return var;
	movq	-80(%rbp), %rax	 ; var, _35
	jmp	.L46	 ;
.L59:
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	-72(%rbp), %rax	 ; vars, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	list_pop	 ;
	movq	%rax, -80(%rbp)	 ; tmp152, var
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	cmpq	$0, -80(%rbp)	 ;, var
	jne	.L60	 ;,
.L58:
 ; D:/TC/src/tac.c:153:     return NULL;
	movl	$0, %eax	 ;, _35
.L46:
 ; D:/TC/src/tac.c:154: }
	leave	
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; original_name, original_name
	movq	%rdx, 24(%rbp)	 ; type, type
	movl	%r8d, 32(%rbp)	 ; kind, kind
	movq	%r9, 40(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	cmpq	$0, 16(%rbp)	 ;, original_name
	je	.L62	 ;,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	movq	$0, -8(%rbp)	 ;, current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movq	24(%rbp), %rax	 ; type, tmp104
	movl	32(%rax), %eax	 ; type_40(D)->kind, _1
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _1
	jne	.L63	 ;,
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	40(%rbp), %rax	 ; status, tmp105
	movq	24(%rax), %rax	 ; status_41(D)->current_class, tmp106
	movq	%rax, -8(%rbp)	 ; tmp106, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rbp), %rax	 ; type, tmp107
	movq	24(%rax), %rdx	 ; type_40(D)->ast_node.class, _2
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	40(%rbp), %rax	 ; status, tmp108
	movq	%rdx, 24(%rax)	 ; _2, status_41(D)->current_class
.L63:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	40(%rbp), %rdx	 ; status, tmp109
	movq	16(%rbp), %rax	 ; original_name, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	search_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp111, var
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movq	24(%rbp), %rax	 ; type, tmp112
	movl	32(%rax), %eax	 ; type_40(D)->kind, _3
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _3
	jne	.L64	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	40(%rbp), %rax	 ; status, tmp113
	movq	-8(%rbp), %rdx	 ; current_class, tmp114
	movq	%rdx, 24(%rax)	 ; tmp114, status_41(D)->current_class
.L64:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	cmpq	$0, -24(%rbp)	 ;, var
	je	.L62	 ;,
 ; D:/TC/src/tac.c:168:             return var;
	movq	-24(%rbp), %rax	 ; var, _29
	jmp	.L65	 ;
.L62:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -32(%rbp)	 ; tmp115, var
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	-32(%rbp), %rax	 ; var, tmp116
	movq	16(%rbp), %rdx	 ; original_name, tmp117
	movq	%rdx, (%rax)	 ; tmp117, var_49->original_name
 ; D:/TC/src/tac.c:174:     switch (kind) {
	movl	32(%rbp), %eax	 ; kind, tmp119
	subl	$97, %eax	 ;, tmp118
	cmpl	$21, %eax	 ;, tmp118
	ja	.L66	 ;,
	movl	%eax, %eax	 ; tmp118, tmp120
	leaq	0(,%rax,4), %rdx	 ;, tmp121
	leaq	.L68(%rip), %rax	 ;, tmp122
	movl	(%rdx,%rax), %eax	 ;, tmp123
	cltq
	leaq	.L68(%rip), %rdx	 ;, tmp126
	addq	%rdx, %rax	 ; tmp126, tmp125
	jmp	*%rax	 ; tmp125
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp127
	movq	48(%rax), %rax	 ; status_41(D)->attr_count, _4
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rax), %rcx	 ;, _6
	movq	40(%rbp), %rdx	 ; status, tmp128
	movq	%rcx, 48(%rdx)	 ; _6, status_41(D)->attr_count
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	%rax, -16(%rbp)	 ; _4, id
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L74	 ;
.L70:
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp129
	movq	56(%rax), %rax	 ; status_41(D)->param_count, _7
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rax), %rcx	 ;, _9
	movq	40(%rbp), %rdx	 ; status, tmp130
	movq	%rcx, 56(%rdx)	 ; _9, status_41(D)->param_count
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	%rax, -16(%rbp)	 ; _7, id
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L74	 ;
.L67:
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp131
	movq	64(%rax), %rax	 ; status_41(D)->var_count, _10
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rax), %rcx	 ;, _12
	movq	40(%rbp), %rdx	 ; status, tmp132
	movq	%rcx, 64(%rdx)	 ; _12, status_41(D)->var_count
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	%rax, -16(%rbp)	 ; _10, id
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L74	 ;
.L69:
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp133
	movq	72(%rax), %rax	 ; status_41(D)->temp_count, _13
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rax), %rcx	 ;, _15
	movq	40(%rbp), %rdx	 ; status, tmp134
	movq	%rcx, 72(%rdx)	 ; _15, status_41(D)->temp_count
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	%rax, -16(%rbp)	 ; _13, id
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L74	 ;
.L72:
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp135
	movq	80(%rax), %rax	 ; status_41(D)->block_count, _16
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rax), %rcx	 ;, _18
	movq	40(%rbp), %rdx	 ; status, tmp136
	movq	%rcx, 80(%rdx)	 ; _18, status_41(D)->block_count
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	%rax, -16(%rbp)	 ; _16, id
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L74	 ;
.L71:
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp137
	movq	88(%rax), %rax	 ; status_41(D)->subroutine_count, _19
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rax), %rcx	 ;, _21
	movq	40(%rbp), %rdx	 ; status, tmp138
	movq	%rcx, 88(%rdx)	 ; _21, status_41(D)->subroutine_count
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	%rax, -16(%rbp)	 ; _19, id
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L74	 ;
.L66:
 ; D:/TC/src/tac.c:181:         default: id = (size_t)-1; break;
	movq	$-1, -16(%rbp)	 ;, id
 ; D:/TC/src/tac.c:181:         default: id = (size_t)-1; break;
	nop	
.L74:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	-32(%rbp), %rdx	 ; var, tmp140
	movq	%rax, 8(%rdx)	 ; _22, var_49->name
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, -16(%rbp)	 ;, id
	jne	.L75	 ;,
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movq	-32(%rbp), %rax	 ; var, tmp141
	movq	8(%rax), %rax	 ; var_49->name, _23
	movl	32(%rbp), %edx	 ; kind, tmp142
	movl	%edx, %r8d	 ; tmp142,
	leaq	.LC2(%rip), %rdx	 ;, tmp143
	movq	%rax, %rcx	 ; _23,
	call	sprintf	 ;
	jmp	.L76	 ;
.L75:
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	-32(%rbp), %rax	 ; var, tmp144
	movq	8(%rax), %rax	 ; var_49->name, _24
	movq	-16(%rbp), %rcx	 ; id, tmp145
	movl	32(%rbp), %edx	 ; kind, tmp146
	movq	%rcx, %r9	 ; tmp145,
	movl	%edx, %r8d	 ; tmp146,
	leaq	.LC3(%rip), %rdx	 ;, tmp147
	movq	%rax, %rcx	 ; _24,
	call	sprintf	 ;
.L76:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	-32(%rbp), %rax	 ; var, tmp148
	movq	24(%rbp), %rdx	 ; type, tmp149
	movq	%rdx, 16(%rax)	 ; tmp149, var_49->type
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, 32(%rbp)	 ;, kind
	je	.L77	 ;,
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$118, 32(%rbp)	 ;, kind
	jne	.L78	 ;,
.L77:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	40(%rbp), %rax	 ; status, tmp150
	movq	8(%rax), %rax	 ; status_41(D)->current_subroutine, _25
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rax	 ; _25->local_vars, _26
	movq	-32(%rbp), %rdx	 ; var, tmp151
	movq	%rax, %rcx	 ; _26,
	call	list_append	 ;
.L78:
 ; D:/TC/src/tac.c:192:     return var;
	movq	-32(%rbp), %rax	 ; var, _29
.L65:
 ; D:/TC/src/tac.c:193: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	create_attribute;	.scl	3;	.type	32;	.endef
create_attribute:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; var, var
	movq	%rdx, 24(%rbp)	 ; type, type
	movq	%r8, 32(%rbp)	 ; table, table
	movq	%r9, 40(%rbp)	 ; offset, offset
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp93, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	48(%rbp), %rcx	 ; status, tmp94
	movq	24(%rbp), %rdx	 ; type, tmp95
	movq	16(%rbp), %rax	 ; var, tmp96
	movq	%rcx, %r9	 ; tmp94,
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp96,
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	-8(%rbp), %rdx	 ; attr, tmp97
	movq	%rax, (%rdx)	 ; _1, attr_13->var
 ; D:/TC/src/tac.c:198:     attr->type = type;
	movq	-8(%rbp), %rax	 ; attr, tmp98
	movq	24(%rbp), %rdx	 ; type, tmp99
	movq	%rdx, 8(%rax)	 ; tmp99, attr_13->type
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	-8(%rbp), %rax	 ; attr, tmp100
	movq	40(%rbp), %rdx	 ; offset, tmp101
	movq	%rdx, 16(%rax)	 ; tmp101, attr_13->offset
 ; D:/TC/src/tac.c:200:     if (offset == 0) {
	cmpq	$0, 40(%rbp)	 ;, offset
	jne	.L80	 ;,
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	32(%rbp), %rax	 ; table, tmp102
	movq	16(%rax), %rdx	 ; table_22(D)->size, _2
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	-8(%rbp), %rax	 ; attr, tmp103
	movq	%rdx, 16(%rax)	 ; _2, attr_13->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	24(%rbp), %rax	 ; type, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	32(%rbp), %rdx	 ; table, tmp105
	movq	16(%rdx), %rdx	 ; table_22(D)->size, _3
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, %rdx	 ; _25, _4
	movq	32(%rbp), %rax	 ; table, tmp106
	movq	%rdx, 16(%rax)	 ; _4, table_22(D)->size
.L80:
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, 32(%rbp)	 ;, table
	je	.L81	 ;,
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	32(%rbp), %rax	 ; table, tmp107
	movq	(%rax), %rax	 ; table_22(D)->attributes, _5
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	 ; _5
	jne	.L82	 ;,
.L81:
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	24(%rax), %rax	 ; _6->_stderr, _7
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	%rax, %r9	 ; _7,
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L83	 ;
.L82:
 ; D:/TC/src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	32(%rbp), %rax	 ; table, tmp109
	movq	(%rax), %rax	 ; table_22(D)->attributes, _8
	movq	-8(%rbp), %rdx	 ; attr, tmp110
	movq	%rax, %rcx	 ; _8,
	call	list_append	 ;
.L83:
 ; D:/TC/src/tac.c:209:     return attr;
	movq	-8(%rbp), %rax	 ; attr, _30
 ; D:/TC/src/tac.c:210: }
	leave	
	ret	
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; arg1, arg1
	movq	%r8, 32(%rbp)	 ; arg2, arg2
	movq	%r9, 40(%rbp)	 ; arg3, arg3
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movq	-8(%rbp), %rax	 ; inst, tmp85
	movl	16(%rbp), %edx	 ; type, tmp86
	movl	%edx, 24(%rax)	 ; tmp86, inst_3->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	-8(%rbp), %rax	 ; inst, tmp87
	movq	24(%rbp), %rdx	 ; arg1, tmp88
	movq	%rdx, (%rax)	 ; tmp88, inst_3->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	-8(%rbp), %rax	 ; inst, tmp89
	movq	32(%rbp), %rdx	 ; arg2, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, inst_3->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	-8(%rbp), %rax	 ; inst, tmp91
	movq	40(%rbp), %rdx	 ; arg3, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, inst_3->arg3
 ; D:/TC/src/tac.c:219:     return inst;
	movq	-8(%rbp), %rax	 ; inst, _12
 ; D:/TC/src/tac.c:220: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; kind, kind
	movq	%rdx, 24(%rbp)	 ; value, value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp98, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movq	-8(%rbp), %rax	 ; arg, tmp99
	movl	16(%rbp), %edx	 ; kind, tmp100
	movl	%edx, 16(%rax)	 ; tmp100, arg_18->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	-8(%rbp), %rax	 ; arg, tmp101
	movq	$0, 8(%rax)	 ;, arg_18->type
 ; D:/TC/src/tac.c:226:     switch (kind) {
	cmpl	$7, 16(%rbp)	 ;, kind
	ja	.L88	 ;,
	movl	16(%rbp), %eax	 ; kind, tmp102
	leaq	0(,%rax,4), %rdx	 ;, tmp103
	leaq	.L90(%rip), %rax	 ;, tmp104
	movl	(%rdx,%rax), %eax	 ;, tmp105
	cltq
	leaq	.L90(%rip), %rdx	 ;, tmp108
	addq	%rdx, %rax	 ; tmp108, tmp107
	jmp	*%rax	 ; tmp107
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp109
	movq	24(%rbp), %rdx	 ; value, tmp110
	movq	%rdx, (%rax)	 ; tmp110, arg_18->value.variable
 ; D:/TC/src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	 ; arg, tmp111
	movq	(%rax), %rax	 ; arg_18->value.variable, _1
 ; D:/TC/src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	16(%rax), %rdx	 ; _1->type, _2
 ; D:/TC/src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	 ; arg, tmp112
	movq	%rdx, 8(%rax)	 ; _2, arg_18->type
 ; D:/TC/src/tac.c:230:             break;
	jmp	.L98	 ;
.L96:
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	24(%rbp), %rax	 ; value, tmp113
	movq	(%rax), %rdx	 ; MEM[(long long int *)value_22(D)], _3
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp114
	movq	%rdx, (%rax)	 ; _3, arg_18->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp115
	movq	(%rax), %rdx	 ; name_int, name_int.5_4
	movq	-8(%rbp), %rax	 ; arg, tmp116
	movq	%rdx, 8(%rax)	 ; name_int.5_4, arg_18->type
 ; D:/TC/src/tac.c:234:             break;
	jmp	.L98	 ;
.L95:
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	24(%rbp), %rax	 ; value, tmp117
	movsd	(%rax), %xmm0	 ; MEM[(double *)value_22(D)], _5
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp118
	movsd	%xmm0, (%rax)	 ; _5, arg_18->value.float_value
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp119
	movq	(%rax), %rdx	 ; name_float, name_float.6_6
	movq	-8(%rbp), %rax	 ; arg, tmp120
	movq	%rdx, 8(%rax)	 ; name_float.6_6, arg_18->type
 ; D:/TC/src/tac.c:238:             break;
	jmp	.L98	 ;
.L94:
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movq	-8(%rbp), %rax	 ; arg, tmp121
	movq	24(%rbp), %rdx	 ; value, tmp122
	movq	%rdx, (%rax)	 ; tmp122, arg_18->value.string_value
 ; D:/TC/src/tac.c:241:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rax	 ;, tmp123
	movq	(%rax), %rdx	 ; name_string, name_string.7_7
	movq	-8(%rbp), %rax	 ; arg, tmp124
	movq	%rdx, 8(%rax)	 ; name_string.7_7, arg_18->type
 ; D:/TC/src/tac.c:242:             break;
	jmp	.L98	 ;
.L93:
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movq	24(%rbp), %rax	 ; value, tmp125
	movzbl	(%rax), %edx	 ; MEM[(char *)value_22(D)], _8
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp126
	movb	%dl, (%rax)	 ; _8, arg_18->value.bool_value
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp127
	movq	(%rax), %rdx	 ; name_bool, name_bool.8_9
	movq	-8(%rbp), %rax	 ; arg, tmp128
	movq	%rdx, 8(%rax)	 ; name_bool.8_9, arg_18->type
 ; D:/TC/src/tac.c:246:             break;
	jmp	.L98	 ;
.L92:
 ; D:/TC/src/tac.c:248:             arg->value.string_value = NULL;
	movq	-8(%rbp), %rax	 ; arg, tmp129
	movq	$0, (%rax)	 ;, arg_18->value.string_value
 ; D:/TC/src/tac.c:249:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; name_void, name_void.9_10
	movq	-8(%rbp), %rax	 ; arg, tmp131
	movq	%rdx, 8(%rax)	 ; name_void.9_10, arg_18->type
 ; D:/TC/src/tac.c:250:             break;
	jmp	.L98	 ;
.L91:
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp132
	movq	24(%rbp), %rdx	 ; value, tmp133
	movq	%rdx, (%rax)	 ; tmp133, arg_18->value.label
 ; D:/TC/src/tac.c:253:             break;
	jmp	.L98	 ;
.L89:
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp134
	movq	24(%rbp), %rdx	 ; value, tmp135
	movq	%rdx, (%rax)	 ; tmp135, arg_18->value.subroutine
 ; D:/TC/src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	 ; arg, tmp136
	movq	(%rax), %rax	 ; arg_18->value.subroutine, _11
 ; D:/TC/src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	16(%rax), %rdx	 ; _11->type, _12
 ; D:/TC/src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	 ; arg, tmp137
	movq	%rdx, 8(%rax)	 ; _12, arg_18->type
 ; D:/TC/src/tac.c:257:             break;
	jmp	.L98	 ;
.L88:
 ; D:/TC/src/tac.c:260:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:260:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	24(%rax), %rax	 ; _13->_stderr, _14
 ; D:/TC/src/tac.c:260:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movl	16(%rbp), %edx	 ; kind, tmp138
	movl	%edx, %r8d	 ; tmp138,
	leaq	.LC5(%rip), %rdx	 ;, tmp139
	movq	%rax, %rcx	 ; _14,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:261:             break;
	nop	
.L98:
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movq	-8(%rbp), %rax	 ; arg, tmp140
	movb	$0, 20(%rax)	 ;, arg_18->is_get
 ; D:/TC/src/tac.c:265:     return arg;
	movq	-8(%rbp), %rax	 ; arg, _41
 ; D:/TC/src/tac.c:266: }
	leave	
	ret	
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; arg, arg
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	cmpq	$0, 16(%rbp)	 ;, arg
	jne	.L101	 ;,
 ; D:/TC/src/tac.c:271:         return NULL;
	movl	$0, %eax	 ;, _7
	jmp	.L102	 ;
.L101:
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	movq	16(%rbp), %rax	 ; arg, tmp90
	movzbl	20(%rax), %eax	 ; arg_9(D)->is_get, _1
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	testb	%al, %al	 ; _1
	je	.L103	 ;,
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	16(%rbp), %rax	 ; arg, tmp91
	movq	8(%rax), %rax	 ; arg_9(D)->type, _2
	movq	24(%rbp), %rdx	 ; status, tmp92
	movq	%rdx, %r9	 ; tmp92,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _2,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _3,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -8(%rbp)	 ; tmp93, temp
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rdx	 ; arg, tmp94
	movq	-8(%rbp), %rax	 ; temp, tmp95
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp94,
	movq	%rax, %rdx	 ; tmp95,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _4
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	24(%rbp), %rax	 ; status, tmp96
	movq	16(%rax), %rax	 ; status_12(D)->current_block, _5
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:/TC/src/tac.c:277:         return temp;
	movq	-8(%rbp), %rax	 ; temp, _7
	jmp	.L102	 ;
.L103:
 ; D:/TC/src/tac.c:280:     return arg;
	movq	16(%rbp), %rax	 ; arg, _7
.L102:
 ; D:/TC/src/tac.c:281: }
	leave	
	ret	
	.section .rdata,"dr"
.LC6:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; code, code
 ; D:/TC/src/tac.c:285:     TAC* tac = create_tac();
	call	create_tac	 ;
	movq	%rax, -8(%rbp)	 ; tmp97, tac
 ; D:/TC/src/tac.c:286:     TACStatus* status = create_tac_status(tac);
	movq	-8(%rbp), %rax	 ; tac, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	create_tac_status	 ;
	movq	%rax, -16(%rbp)	 ; tmp99, status
 ; D:/TC/src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	16(%rbp), %rax	 ; code, tmp100
	movq	(%rax), %rax	 ; code_20(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp101, members
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L105	 ;
.L109:
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movq	-32(%rbp), %rax	 ; code_member, tmp102
	movl	8(%rax), %eax	 ; code_member_24->type, _2
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	jne	.L106	 ;,
 ; D:/TC/src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp103
	movq	(%rax), %rax	 ; code_member_24->content.function, _3
	movq	-16(%rbp), %rdx	 ; status, tmp104
	movq	%rax, %rcx	 ; _3,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	-32(%rbp), %rax	 ; code_member, tmp105
	movq	(%rax), %rax	 ; code_member_24->content.function, _4
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rax	 ; _4->name, _5
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rax), %rax	 ; _5->name, _6
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC6(%rip), %rdx	 ;, tmp106
	movq	%rax, %rcx	 ; _6,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; _7
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	-32(%rbp), %rax	 ; code_member, tmp107
	movq	(%rax), %rax	 ; code_member_24->content.function, _8
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	(%rax), %rdx	 ; _8->name, _9
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	-8(%rbp), %rax	 ; tac, tmp108
	movq	%rdx, 8(%rax)	 ; _9, tac_17->entry_point
	jmp	.L105	 ;
.L106:
 ; D:/TC/src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	movq	-32(%rbp), %rax	 ; code_member, tmp109
	movl	8(%rax), %eax	 ; code_member_24->type, _10
 ; D:/TC/src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _10
	jne	.L108	 ;,
 ; D:/TC/src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp110
	movq	(%rax), %rax	 ; code_member_24->content.class, _11
	movq	-16(%rbp), %rdx	 ; status, tmp111
	movq	%rax, %rcx	 ; _11,
	call	tac_class	 ;
	jmp	.L105	 ;
.L108:
 ; D:/TC/src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	movq	-32(%rbp), %rax	 ; code_member, tmp112
	movl	8(%rax), %eax	 ; code_member_24->type, _12
 ; D:/TC/src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _12
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp113
	movq	(%rax), %rax	 ; code_member_24->content.import, _13
	movq	-16(%rbp), %rcx	 ; status, tmp114
	movq	-8(%rbp), %rdx	 ; tac, tmp115
	movq	%rcx, %r8	 ; tmp114,
	movq	%rax, %rcx	 ; _13,
	call	tac_import	 ;
.L105:
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	 ; members, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp117, code_member
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, code_member
	jne	.L109	 ;,
 ; D:/TC/src/tac.c:301:     return tac;
	movq	-8(%rbp), %rax	 ; tac, _25
 ; D:/TC/src/tac.c:302: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; import, import
	movq	%rdx, 24(%rbp)	 ; tac, tac
	movq	%r8, 32(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	16(%rbp), %rax	 ; import, tmp107
	movq	(%rax), %rax	 ; import_28(D)->name, _1
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rax), %eax	 ; _1->kind, _2
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	 ;, _2
	jne	.L112	 ;,
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rbp), %rax	 ; import, tmp108
	movq	(%rax), %rax	 ; import_28(D)->name, _3
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rax), %rdx	 ; _3->type, _4
	movq	16(%rbp), %rax	 ; import, tmp109
	movq	(%rax), %rax	 ; import_28(D)->name, _5
	movq	32(%rbp), %rcx	 ; status, tmp110
	movq	%rcx, %r9	 ; tmp110,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _5,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	24(%rbp), %rax	 ; tac, tmp111
	movq	16(%rax), %rax	 ; tac_32(D)->global_vars, _7
	movq	%rax, %rcx	 ; _7,
	call	list_append	 ;
 ; D:/TC/src/tac.c:314: }
	jmp	.L117	 ;
.L112:
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	16(%rbp), %rax	 ; import, tmp112
	movq	(%rax), %rax	 ; import_28(D)->name, _8
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	 ; _8->kind, _9
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, _9
	je	.L114	 ;,
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	16(%rbp), %rax	 ; import, tmp113
	movq	(%rax), %rax	 ; import_28(D)->name, _10
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	 ; _10->kind, _11
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _11
	jne	.L115	 ;,
.L114:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rax	 ; import, tmp114
	movq	(%rax), %rax	 ; import_28(D)->name, _12
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; _12->type, _13
	movq	16(%rbp), %rax	 ; import, tmp115
	movq	(%rax), %rax	 ; import_28(D)->name, _14
	movq	32(%rbp), %rcx	 ; status, tmp116
	movq	%rcx, %r9	 ; tmp116,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; _14,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	24(%rbp), %rax	 ; tac, tmp117
	movq	16(%rax), %rax	 ; tac_32(D)->global_vars, _16
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
 ; D:/TC/src/tac.c:314: }
	jmp	.L117	 ;
.L115:
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	movq	16(%rbp), %rax	 ; import, tmp118
	movq	(%rax), %rax	 ; import_28(D)->name, _17
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _17->kind, _18
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _18
	jne	.L116	 ;,
 ; D:/TC/src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	16(%rbp), %rax	 ; import, tmp119
	movq	(%rax), %rax	 ; import_28(D)->name, _19
	movq	%rax, %rcx	 ; _19,
	call	create_attribute_table	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:/TC/src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	24(%rbp), %rax	 ; tac, tmp120
	movq	(%rax), %rax	 ; tac_32(D)->attribute_tables, _21
	movq	%rax, %rcx	 ; _21,
	call	list_append	 ;
 ; D:/TC/src/tac.c:314: }
	jmp	.L117	 ;
.L116:
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	16(%rbp), %rax	 ; import, tmp121
	movq	(%rax), %rax	 ; import_28(D)->name, _22
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	32(%rax), %ebx	 ; _22->kind, _23
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	24(%rax), %rax	 ; _24->_stderr, _25
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _23,
	leaq	.LC7(%rip), %rdx	 ;, tmp122
	movq	%rax, %rcx	 ; _25,
	call	fprintf	 ;
.L117:
 ; D:/TC/src/tac.c:314: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; function, function
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	16(%rbp), %rax	 ; function, tmp94
	movq	8(%rax), %rdx	 ; function_16(D)->return_type, _1
	movq	16(%rbp), %rax	 ; function, tmp95
	movq	(%rax), %rax	 ; function_16(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_subroutine	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, subroutine
 ; D:/TC/src/tac.c:319:     status->current_subroutine = subroutine;
	movq	24(%rbp), %rax	 ; status, tmp97
	movq	-8(%rbp), %rdx	 ; subroutine, tmp98
	movq	%rdx, 8(%rax)	 ; tmp98, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rbp), %rax	 ; status, tmp99
	movq	(%rax), %rax	 ; status_19(D)->tac, _3
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	 ; _3->subroutines, _4
	movq	-8(%rbp), %rdx	 ; subroutine, tmp100
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp101
	movq	16(%rax), %rax	 ; function_16(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, parameters
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L119	 ;
.L120:
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-24(%rbp), %rax	 ; parameter, tmp103
	movq	(%rax), %rdx	 ; parameter_25->type, _6
	movq	-24(%rbp), %rax	 ; parameter, tmp104
	movq	8(%rax), %rax	 ; parameter_25->name, _7
	movq	24(%rbp), %rcx	 ; status, tmp105
	movq	%rcx, %r9	 ; tmp105,
	movl	$112, %r8d	 ;,
	movq	%rax, %rcx	 ; _7,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	 ; subroutine, tmp106
	movq	16(%rax), %rax	 ; subroutine_18->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
.L119:
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	 ; parameters, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, parameter
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, parameter
	jne	.L120	 ;,
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	24(%rbp), %rax	 ; status, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rcx	 ; _10,
	call	create_block	 ;
	movq	%rax, -32(%rbp)	 ; tmp110, block
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	 ; subroutine, tmp111
	movq	32(%rax), %rax	 ; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	 ; block, tmp112
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:329:     status->current_block = block;
	movq	24(%rbp), %rax	 ; status, tmp113
	movq	-32(%rbp), %rdx	 ; block, tmp114
	movq	%rdx, 16(%rax)	 ; tmp114, status_19(D)->current_block
 ; D:/TC/src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp115
	movq	24(%rax), %rax	 ; function_16(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -40(%rbp)	 ; tmp116, statements
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L121	 ;
.L122:
 ; D:/TC/src/tac.c:334:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp117
	movq	-48(%rbp), %rax	 ; statement, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	tac_statement	 ;
.L121:
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	 ; statements, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp120, statement
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L122	 ;,
 ; D:/TC/src/tac.c:336:     status->current_subroutine = NULL;
	movq	24(%rbp), %rax	 ; status, tmp121
	movq	$0, 8(%rax)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:338: }
	nop	
	leave	
	ret	
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; method, method
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	16(%rbp), %rax	 ; method, tmp110
	movq	8(%rax), %rdx	 ; method_33(D)->return_type, _1
	movq	16(%rbp), %rax	 ; method, tmp111
	movq	(%rax), %rax	 ; method_33(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_subroutine	 ;
	movq	%rax, -8(%rbp)	 ; tmp112, subroutine
 ; D:/TC/src/tac.c:343:     status->current_subroutine = subroutine;
	movq	24(%rbp), %rax	 ; status, tmp113
	movq	-8(%rbp), %rdx	 ; subroutine, tmp114
	movq	%rdx, 8(%rax)	 ; tmp114, status_36(D)->current_subroutine
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rbp), %rax	 ; status, tmp115
	movq	(%rax), %rax	 ; status_36(D)->tac, _3
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	 ; _3->subroutines, _4
	movq	-8(%rbp), %rdx	 ; subroutine, tmp116
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rax	 ; method, tmp117
	movq	16(%rax), %rax	 ; method_33(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp118, parameters
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L124	 ;
.L125:
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-24(%rbp), %rax	 ; parameter, tmp119
	movq	(%rax), %rdx	 ; parameter_42->type, _6
	movq	-24(%rbp), %rax	 ; parameter, tmp120
	movq	8(%rax), %rax	 ; parameter_42->name, _7
	movq	24(%rbp), %rcx	 ; status, tmp121
	movq	%rcx, %r9	 ; tmp121,
	movl	$112, %r8d	 ;,
	movq	%rax, %rcx	 ; _7,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	 ; subroutine, tmp122
	movq	16(%rax), %rax	 ; subroutine_35->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
.L124:
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	 ; parameters, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp124, parameter
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, parameter
	jne	.L125	 ;,
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	24(%rbp), %rax	 ; status, tmp125
	movq	%rax, %r9	 ; tmp125,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rcx	 ; _10,
	call	create_block	 ;
	movq	%rax, -32(%rbp)	 ; tmp126, block
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	 ; subroutine, tmp127
	movq	32(%rax), %rax	 ; subroutine_35->blocks, _11
	movq	-32(%rbp), %rdx	 ; block, tmp128
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:353:     status->current_block = block;
	movq	24(%rbp), %rax	 ; status, tmp129
	movq	-32(%rbp), %rdx	 ; block, tmp130
	movq	%rdx, 16(%rax)	 ; tmp130, status_36(D)->current_block
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp131
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.10_12
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	24(%rax), %rax	 ; status_36(D)->current_class, _13
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _13->name, _14
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	 ; _14->name, _15
	movq	%rax, %rcx	 ; _15,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	16(%rbp), %rax	 ; method, tmp133
	movq	(%rax), %rax	 ; method_33(D)->name, _17
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	 ; _17->name, _18
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	%rax, %rcx	 ; _18,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; _19
	jne	.L126	 ;,
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbp), %rax	 ; status, tmp134
	movq	24(%rax), %rax	 ; status_36(D)->current_class, _20
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	(%rax), %rax	 ; _20->name, _21
	movq	24(%rbp), %rdx	 ; status, tmp135
	movq	%rdx, %r9	 ; tmp135,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _21,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _22,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp136, temp
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbp), %rax	 ; status, tmp137
	movq	24(%rax), %rax	 ; status_36(D)->current_class, _23
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	addq	$24, %rax	 ;, _24
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; _24,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-40(%rbp), %rax	 ; temp, tmp138
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; _25,
	movq	%rax, %rdx	 ; tmp138,
	movl	$18, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _26
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-32(%rbp), %rax	 ; block, tmp139
	movq	8(%rax), %rax	 ; block_45->instructions, _27
	movq	%rax, %rcx	 ; _27,
	call	list_append	 ;
.L126:
 ; D:/TC/src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	16(%rbp), %rax	 ; method, tmp140
	movq	24(%rax), %rax	 ; method_33(D)->body, _28
	movq	%rax, %rcx	 ; _28,
	call	list_copy	 ;
	movq	%rax, -48(%rbp)	 ; tmp141, statements
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L127	 ;
.L128:
 ; D:/TC/src/tac.c:362:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp142
	movq	-56(%rbp), %rax	 ; statement, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	tac_statement	 ;
.L127:
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-48(%rbp), %rax	 ; statements, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	list_pop	 ;
	movq	%rax, -56(%rbp)	 ; tmp145, statement
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -56(%rbp)	 ;, statement
	jne	.L128	 ;,
 ; D:/TC/src/tac.c:364:     status->current_subroutine = NULL;
	movq	24(%rbp), %rax	 ; status, tmp146
	movq	$0, 8(%rax)	 ;, status_36(D)->current_subroutine
 ; D:/TC/src/tac.c:366: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class, class
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:369:     status->current_class = class;
	movq	24(%rbp), %rax	 ; status, tmp93
	movq	16(%rbp), %rdx	 ; class, tmp94
	movq	%rdx, 24(%rax)	 ; tmp94, status_14(D)->current_class
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	16(%rbp), %rax	 ; class, tmp95
	movq	8(%rax), %rax	 ; class_15(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp96, members
 ; D:/TC/src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	16(%rbp), %rax	 ; class, tmp97
	movq	(%rax), %rax	 ; class_15(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_attribute_table	 ;
	movq	%rax, -32(%rbp)	 ; tmp98, attr_table
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	16(%rbp), %rax	 ; class, tmp99
	movq	24(%rax), %rdx	 ; class_15(D)->size, _3
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	-32(%rbp), %rax	 ; attr_table, tmp100
	movq	%rdx, 16(%rax)	 ; _3, attr_table_20->size
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	24(%rbp), %rax	 ; status, tmp101
	movq	(%rax), %rax	 ; status_14(D)->tac, _4
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	 ; _4->attribute_tables, _5
	movq	-32(%rbp), %rdx	 ; attr_table, tmp102
	movq	%rax, %rcx	 ; _5,
	call	list_append	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L130	 ;
.L135:
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	movq	-40(%rbp), %rax	 ; member, tmp103
	movl	8(%rax), %eax	 ; member_24->type, _6
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	testl	%eax, %eax	 ; _6
	je	.L131	 ;,
	cmpl	$1, %eax	 ;, _6
	je	.L132	 ;,
	jmp	.L136	 ;
.L131:
 ; D:/TC/src/tac.c:379:                 tac_method(member->content.method, status);
	movq	-40(%rbp), %rax	 ; member, tmp104
	movq	(%rax), %rax	 ; member_24->content.method, _7
	movq	24(%rbp), %rdx	 ; status, tmp105
	movq	%rax, %rcx	 ; _7,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:380:                 break;
	jmp	.L130	 ;
.L132:
 ; D:/TC/src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	-40(%rbp), %rax	 ; member, tmp106
	movq	(%rax), %rax	 ; member_24->content.variable, _8
	movq	24(%rbp), %rdx	 ; status, tmp107
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; _8,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:383:                 break;
	jmp	.L130	 ;
.L136:
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	-40(%rbp), %rax	 ; member, tmp108
	movl	8(%rax), %ebx	 ; member_24->type, _9
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	24(%rax), %rax	 ; _10->_stderr, _11
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	%ebx, %r8d	 ; _9,
	leaq	.LC8(%rip), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; _11,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:386:                 break;
	nop	
.L130:
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	 ; members, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp111, member
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	cmpq	$0, -40(%rbp)	 ;, member
	jne	.L135	 ;,
 ; D:/TC/src/tac.c:389:     status->current_class = NULL;
	movq	24(%rbp), %rax	 ; status, tmp112
	movq	$0, 24(%rax)	 ;, status_14(D)->current_class
 ; D:/TC/src/tac.c:391: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable, variable
	movq	%rdx, 24(%rbp)	 ; status, status
	movl	%r8d, 32(%rbp)	 ; type, type
 ; D:/TC/src/tac.c:394:     Var* var = NULL;
	movq	$0, -8(%rbp)	 ;, var
 ; D:/TC/src/tac.c:395:     switch (type) {
	movl	32(%rbp), %eax	 ; type, tmp99
	subl	$97, %eax	 ;, tmp98
	cmpl	$21, %eax	 ;, tmp98
	ja	.L138	 ;,
	movl	%eax, %eax	 ; tmp98, tmp100
	leaq	0(,%rax,4), %rdx	 ;, tmp101
	leaq	.L140(%rip), %rax	 ;, tmp102
	movl	(%rdx,%rax), %eax	 ;, tmp103
	cltq
	leaq	.L140(%rip), %rdx	 ;, tmp106
	addq	%rdx, %rax	 ; tmp106, tmp105
	jmp	*%rax	 ; tmp105
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	16(%rbp), %rax	 ; variable, tmp107
	movq	(%rax), %rdx	 ; variable_21(D)->type, _1
	movq	16(%rbp), %rax	 ; variable, tmp108
	movq	8(%rax), %rax	 ; variable_21(D)->name, _2
	movq	24(%rbp), %r8	 ; status, tmp109
	movl	32(%rbp), %ecx	 ; type, tmp110
	movq	%r8, %r9	 ; tmp109,
	movl	%ecx, %r8d	 ; tmp110,
	movq	%rax, %rcx	 ; _2,
	call	create_var	 ;
	movq	%rax, -8(%rbp)	 ; tmp111, var
 ; D:/TC/src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	24(%rbp), %rax	 ; status, tmp112
	movq	8(%rax), %rax	 ; status_22(D)->current_subroutine, _3
 ; D:/TC/src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	16(%rax), %rax	 ; _3->parameters, _4
	movq	-8(%rbp), %rdx	 ; var, tmp113
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:399:             break;
	jmp	.L145	 ;
.L143:
 ; D:/TC/src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	16(%rbp), %rax	 ; variable, tmp114
	movq	(%rax), %rdx	 ; variable_21(D)->type, _5
	movq	16(%rbp), %rax	 ; variable, tmp115
	movq	8(%rax), %rax	 ; variable_21(D)->name, _6
	movq	24(%rbp), %r8	 ; status, tmp116
	movl	32(%rbp), %ecx	 ; type, tmp117
	movq	%r8, %r9	 ; tmp116,
	movl	%ecx, %r8d	 ; tmp117,
	movq	%rax, %rcx	 ; _6,
	call	create_var	 ;
	movq	%rax, -8(%rbp)	 ; tmp118, var
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	24(%rbp), %rax	 ; status, tmp119
	movq	(%rax), %rax	 ; status_22(D)->tac, _7
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rax	 ; _7->global_vars, _8
	movq	-8(%rbp), %rdx	 ; var, tmp120
	movq	%rax, %rcx	 ; _8,
	call	list_append	 ;
 ; D:/TC/src/tac.c:405:             break;
	jmp	.L145	 ;
.L144:
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	24(%rbp), %rax	 ; status, tmp121
	movq	(%rax), %rax	 ; status_22(D)->tac, _9
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rax), %rax	 ; _9->attribute_tables, _10
	movq	%rax, %rcx	 ; _10,
	call	list_pop_back	 ;
	movq	%rax, -16(%rbp)	 ; tmp122, attr_table
 ; D:/TC/src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	24(%rbp), %rax	 ; status, tmp123
	movq	(%rax), %rax	 ; status_22(D)->tac, _11
 ; D:/TC/src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	 ; _11->attribute_tables, _12
	movq	-16(%rbp), %rdx	 ; attr_table, tmp124
	movq	%rax, %rcx	 ; _12,
	call	list_append	 ;
 ; D:/TC/src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	16(%rbp), %rax	 ; variable, tmp125
	movq	(%rax), %rdx	 ; variable_21(D)->type, _13
	movq	16(%rbp), %rax	 ; variable, tmp126
	movq	8(%rax), %rax	 ; variable_21(D)->name, _14
	movq	-16(%rbp), %r8	 ; attr_table, tmp127
	movq	24(%rbp), %rcx	 ; status, tmp128
	movq	%rcx, 32(%rsp)	 ; tmp128,
	movl	$0, %r9d	 ;,
	movq	%rax, %rcx	 ; _14,
	call	create_attribute	 ;
 ; D:/TC/src/tac.c:410:             break;
	jmp	.L145	 ;
.L138:
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movl	32(%rbp), %edx	 ; type, tmp129
	movl	%edx, %r8d	 ; tmp129,
	leaq	.LC9(%rip), %rdx	 ;, tmp130
	movq	%rax, %rcx	 ; _16,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:415:             break;
	jmp	.L145	 ;
.L146:
 ; D:/TC/src/tac.c:401:         case VAR_TEMP: break;
	nop	
.L145:
 ; D:/TC/src/tac.c:418: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC11:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC12:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$88, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; statement, statement
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	movq	16(%rbp), %rax	 ; statement, tmp112
	movl	8(%rax), %eax	 ; statement_35(D)->type, _1
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %eax	 ;, _1
	ja	.L148	 ;,
	movl	%eax, %eax	 ; _1, tmp113
	leaq	0(,%rax,4), %rdx	 ;, tmp114
	leaq	.L150(%rip), %rax	 ;, tmp115
	movl	(%rdx,%rax), %eax	 ;, tmp116
	cltq
	leaq	.L150(%rip), %rdx	 ;, tmp119
	addq	%rdx, %rax	 ; tmp119, tmp118
	jmp	*%rax	 ; tmp118
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp120
	movq	(%rax), %rax	 ; statement_35(D)->stmt.expr, _2
	movq	24(%rbp), %rdx	 ; status, tmp121
	movq	%rax, %rcx	 ; _2,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	jmp	.L158	 ;
.L156:
 ; D:/TC/src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	16(%rbp), %rax	 ; statement, tmp122
	movq	(%rax), %rax	 ; statement_35(D)->stmt.var, _3
	movq	24(%rbp), %rdx	 ; status, tmp123
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _3,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L158	 ;
.L155:
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp124
	movq	(%rax), %rax	 ; statement_35(D)->stmt.if_stmt, _4
	movq	24(%rbp), %rdx	 ; status, tmp125
	movq	%rax, %rcx	 ; _4,
	call	tac_if	 ;
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L158	 ;
.L154:
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp126
	movq	(%rax), %rax	 ; statement_35(D)->stmt.while_stmt, _5
	movq	24(%rbp), %rdx	 ; status, tmp127
	movq	%rax, %rcx	 ; _5,
	call	tac_while	 ;
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L158	 ;
.L153:
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp128
	movq	(%rax), %rax	 ; statement_35(D)->stmt.for_stmt, _6
	movq	24(%rbp), %rdx	 ; status, tmp129
	movq	%rax, %rcx	 ; _6,
	call	tac_for	 ;
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L158	 ;
.L152:
 ; D:/TC/src/tac.c:428:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -24(%rbp)	 ; tmp130, return_value
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	16(%rbp), %rax	 ; statement, tmp131
	movq	(%rax), %rax	 ; statement_35(D)->stmt.return_expr, _7
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rax, %rax	 ; _7
	je	.L159	 ;,
 ; D:/TC/src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	16(%rbp), %rax	 ; statement, tmp132
	movq	(%rax), %rax	 ; statement_35(D)->stmt.return_expr, _8
	movq	24(%rbp), %rdx	 ; status, tmp133
	movq	%rax, %rcx	 ; _8,
	call	tac_expression	 ;
	movq	%rax, -24(%rbp)	 ; tmp134, return_value
.L159:
 ; D:/TC/src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	-24(%rbp), %rax	 ; return_value, tmp135
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp135,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _9
 ; D:/TC/src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	24(%rbp), %rax	 ; status, tmp136
	movq	16(%rax), %rax	 ; status_36(D)->current_block, _10
 ; D:/TC/src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	8(%rax), %rax	 ; _10->instructions, _11
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:432:             break;
	jmp	.L158	 ;
.L151:
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rbp), %rax	 ; status, tmp137
	movq	32(%rax), %rax	 ; status_36(D)->end_labels, _12
	movq	%rax, %rcx	 ; _12,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; _13
	jne	.L160	 ;,
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbp), %rax	 ; status, tmp138
	movq	32(%rax), %rax	 ; status_36(D)->end_labels, _14
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _14->tail, _15
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _15->content, tmp139
	movq	%rax, -48(%rbp)	 ; tmp139, label
 ; D:/TC/src/tac.c:437:                 if (label != NULL) {
	cmpq	$0, -48(%rbp)	 ;, label
	je	.L160	 ;,
 ; D:/TC/src/tac.c:438:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-48(%rbp), %rax	 ; label, tmp140
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp140,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -56(%rbp)	 ; tmp141, inst
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp142
	movq	16(%rax), %rax	 ; status_36(D)->current_block, _16
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _16->instructions, _17
	movq	-56(%rbp), %rdx	 ; inst, tmp143
	movq	%rax, %rcx	 ; _17,
	call	list_append	 ;
 ; D:/TC/src/tac.c:440:                     break;
	jmp	.L158	 ;
.L160:
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	24(%rax), %rax	 ; _18->_stderr, _19
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	%rax, %r9	 ; _19,
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:444:             break;
	jmp	.L158	 ;
.L149:
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	24(%rbp), %rax	 ; status, tmp145
	movq	40(%rax), %rax	 ; status_36(D)->start_labels, _20
	movq	%rax, %rcx	 ; _20,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; _21
	jne	.L161	 ;,
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	24(%rbp), %rax	 ; status, tmp146
	movq	40(%rax), %rax	 ; status_36(D)->start_labels, _22
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _22->tail, _23
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _23->content, tmp147
	movq	%rax, -32(%rbp)	 ; tmp147, label
 ; D:/TC/src/tac.c:448:                 if (label != NULL) {
	cmpq	$0, -32(%rbp)	 ;, label
	je	.L161	 ;,
 ; D:/TC/src/tac.c:449:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-32(%rbp), %rax	 ; label, tmp148
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp148,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -40(%rbp)	 ; tmp149, inst
 ; D:/TC/src/tac.c:450:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp150
	movq	16(%rax), %rax	 ; status_36(D)->current_block, _24
 ; D:/TC/src/tac.c:450:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _24->instructions, _25
	movq	-40(%rbp), %rdx	 ; inst, tmp151
	movq	%rax, %rcx	 ; _25,
	call	list_append	 ;
 ; D:/TC/src/tac.c:451:                     break;
	jmp	.L158	 ;
.L161:
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	24(%rax), %rax	 ; _26->_stderr, _27
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	%rax, %r9	 ; _27,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:455:             break;
	jmp	.L158	 ;
.L148:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	16(%rbp), %rax	 ; statement, tmp153
	movl	8(%rax), %ebx	 ; statement_35(D)->type, _28
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	24(%rax), %rax	 ; _29->_stderr, _30
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _28,
	leaq	.LC12(%rip), %rdx	 ;, tmp154
	movq	%rax, %rcx	 ; _30,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:458:             break;
	nop	
.L158:
 ; D:/TC/src/tac.c:461: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$200, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; if_, if_
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp124, then_label
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp125
	movq	%rax, %r9	 ; tmp125,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp126, else_label
 ; D:/TC/src/tac.c:467:     Var* end_label = NULL;
	movq	$0, -32(%rbp)	 ;, end_label
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp127
	movq	16(%rax), %rax	 ; if__62(D)->else_if, _1
	movq	%rax, %rcx	 ; _1,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _2
	je	.L163	 ;,
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp128
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _3
	movq	%rax, %rcx	 ; _3,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _4
	je	.L163	 ;,
 ; D:/TC/src/tac.c:469:         end_label = else_label;
	movq	-24(%rbp), %rax	 ; else_label, tmp129
	movq	%rax, -32(%rbp)	 ; tmp129, end_label
	jmp	.L164	 ;
.L163:
 ; D:/TC/src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -32(%rbp)	 ; tmp131, end_label
.L164:
 ; D:/TC/src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	-32(%rbp), %rax	 ; end_label, tmp132
	movq	%rax, %rdx	 ; tmp132,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp133, end_block_arg
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	16(%rbp), %rax	 ; if_, tmp134
	movq	(%rax), %rax	 ; if__62(D)->condition, _5
	movq	24(%rbp), %rdx	 ; status, tmp135
	movq	%rax, %rcx	 ; _5,
	call	tac_expression	 ;
	movq	%rax, -56(%rbp)	 ; tmp136, condition
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	 ; else_label, tmp137
	movq	%rax, %rdx	 ; tmp137,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _6
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	 ; then_label, tmp138
	movq	%rax, %rdx	 ; tmp138,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	 ; condition, tmp139
	movq	%rbx, %r9	 ; _6,
	movq	%rdx, %r8	 ; _7,
	movq	%rax, %rdx	 ; tmp139,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp140, inst
 ; D:/TC/src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp141
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _8
 ; D:/TC/src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _8->instructions, _9
	movq	-64(%rbp), %rdx	 ; inst, tmp142
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
 ; D:/TC/src/tac.c:478:     Block* then_block = create_block(then_label);
	movq	-40(%rbp), %rax	 ; then_label, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp144, then_block
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	24(%rbp), %rax	 ; status, tmp145
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _10
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	 ; _10->blocks, _11
	movq	-72(%rbp), %rdx	 ; then_block, tmp146
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:480:     status->current_block = then_block;
	movq	24(%rbp), %rax	 ; status, tmp147
	movq	-72(%rbp), %rdx	 ; then_block, tmp148
	movq	%rdx, 16(%rax)	 ; tmp148, status_56(D)->current_block
 ; D:/TC/src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	16(%rbp), %rax	 ; if_, tmp149
	movq	8(%rax), %rax	 ; if__62(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -80(%rbp)	 ; tmp150, then_statements
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L165	 ;
.L166:
 ; D:/TC/src/tac.c:485:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp151
	movq	-88(%rbp), %rax	 ; statement, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	tac_statement	 ;
.L165:
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	-80(%rbp), %rax	 ; then_statements, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	list_pop	 ;
	movq	%rax, -88(%rbp)	 ; tmp154, statement
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L166	 ;,
 ; D:/TC/src/tac.c:487:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp155
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp155,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp156, jump_to_end
 ; D:/TC/src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp157
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _13
 ; D:/TC/src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _13->instructions, _14
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp158
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%rbp), %rax	 ; if_, tmp159
	movq	16(%rax), %rax	 ; if__62(D)->else_if, _15
	movq	%rax, %rcx	 ; _15,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; _16
	jne	.L167	 ;,
 ; D:/TC/src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%rbp), %rax	 ; if_, tmp160
	movq	16(%rax), %rax	 ; if__62(D)->else_if, _17
	movq	%rax, %rcx	 ; _17,
	call	list_copy	 ;
	movq	%rax, -104(%rbp)	 ; tmp161, elif_list
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L168	 ;
.L172:
 ; D:/TC/src/tac.c:496:             Block* else_if_block = create_block(else_label);
	movq	-24(%rbp), %rax	 ; else_label, tmp162
	movq	%rax, %rcx	 ; tmp162,
	call	create_block	 ;
	movq	%rax, -120(%rbp)	 ; tmp163, else_if_block
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	24(%rbp), %rax	 ; status, tmp164
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _18
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	32(%rax), %rax	 ; _18->blocks, _19
	movq	-120(%rbp), %rdx	 ; else_if_block, tmp165
	movq	%rax, %rcx	 ; _19,
	call	list_append	 ;
 ; D:/TC/src/tac.c:498:             status->current_block = else_if_block;
	movq	24(%rbp), %rax	 ; status, tmp166
	movq	-120(%rbp), %rdx	 ; else_if_block, tmp167
	movq	%rdx, 16(%rax)	 ; tmp167, status_56(D)->current_block
 ; D:/TC/src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp168
	movq	%rax, %r9	 ; tmp168,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp169, then_label
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp170
	movq	%rax, %r9	 ; tmp170,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp171, else_label
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	-112(%rbp), %rax	 ; elif, tmp172
	movq	(%rax), %rax	 ; elif_92->condition, _20
	movq	24(%rbp), %rdx	 ; status, tmp173
	movq	%rax, %rcx	 ; _20,
	call	tac_expression	 ;
	movq	%rax, -56(%rbp)	 ; tmp174, condition
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-104(%rbp), %rax	 ; elif_list, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _21
	je	.L169	 ;,
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp176
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _22
	movq	%rax, %rcx	 ; _22,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _23
	je	.L169	 ;,
 ; D:/TC/src/tac.c:505:                 else_label = end_label;
	movq	-32(%rbp), %rax	 ; end_label, tmp177
	movq	%rax, -24(%rbp)	 ; tmp177, else_label
.L169:
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	 ; else_label, tmp178
	movq	%rax, %rdx	 ; tmp178,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _24
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	 ; then_label, tmp179
	movq	%rax, %rdx	 ; tmp179,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	 ; condition, tmp180
	movq	%rbx, %r9	 ; _24,
	movq	%rdx, %r8	 ; _25,
	movq	%rax, %rdx	 ; tmp180,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp181, inst
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp182
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _26
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _26->instructions, _27
	movq	-64(%rbp), %rdx	 ; inst, tmp183
	movq	%rax, %rcx	 ; _27,
	call	list_append	 ;
 ; D:/TC/src/tac.c:509:             then_block = create_block(then_label);
	movq	-40(%rbp), %rax	 ; then_label, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp185, then_block
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	24(%rbp), %rax	 ; status, tmp186
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _28
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	 ; _28->blocks, _29
	movq	-72(%rbp), %rdx	 ; then_block, tmp187
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:/TC/src/tac.c:511:             status->current_block = then_block;
	movq	24(%rbp), %rax	 ; status, tmp188
	movq	-72(%rbp), %rdx	 ; then_block, tmp189
	movq	%rdx, 16(%rax)	 ; tmp189, status_56(D)->current_block
 ; D:/TC/src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	-112(%rbp), %rax	 ; elif, tmp190
	movq	8(%rax), %rax	 ; elif_92->body, _30
	movq	%rax, %rcx	 ; _30,
	call	list_copy	 ;
	movq	%rax, -128(%rbp)	 ; tmp191, elif_statements
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L170	 ;
.L171:
 ; D:/TC/src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp192
	movq	-136(%rbp), %rax	 ; elif_statement, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	tac_statement	 ;
.L170:
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	-128(%rbp), %rax	 ; elif_statements, tmp194
	movq	%rax, %rcx	 ; tmp194,
	call	list_pop	 ;
	movq	%rax, -136(%rbp)	 ; tmp195, elif_statement
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	cmpq	$0, -136(%rbp)	 ;, elif_statement
	jne	.L171	 ;,
 ; D:/TC/src/tac.c:518:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp196
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp196,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp197, jump_to_end
 ; D:/TC/src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp198
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _31
 ; D:/TC/src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _31->instructions, _32
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp199
	movq	%rax, %rcx	 ; _32,
	call	list_append	 ;
.L168:
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	-104(%rbp), %rax	 ; elif_list, tmp200
	movq	%rax, %rcx	 ; tmp200,
	call	list_pop	 ;
	movq	%rax, -112(%rbp)	 ; tmp201, elif
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	cmpq	$0, -112(%rbp)	 ;, elif
	jne	.L172	 ;,
.L167:
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	16(%rbp), %rax	 ; if_, tmp202
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _33
	movq	%rax, %rcx	 ; _33,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; _34
	jne	.L173	 ;,
 ; D:/TC/src/tac.c:525:         Block* else_block = create_block(else_label);
	movq	-24(%rbp), %rax	 ; else_label, tmp203
	movq	%rax, %rcx	 ; tmp203,
	call	create_block	 ;
	movq	%rax, -144(%rbp)	 ; tmp204, else_block
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	24(%rbp), %rax	 ; status, tmp205
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _35
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	32(%rax), %rax	 ; _35->blocks, _36
	movq	-144(%rbp), %rdx	 ; else_block, tmp206
	movq	%rax, %rcx	 ; _36,
	call	list_append	 ;
 ; D:/TC/src/tac.c:527:         status->current_block = else_block;
	movq	24(%rbp), %rax	 ; status, tmp207
	movq	-144(%rbp), %rdx	 ; else_block, tmp208
	movq	%rdx, 16(%rax)	 ; tmp208, status_56(D)->current_block
 ; D:/TC/src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	16(%rbp), %rax	 ; if_, tmp209
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _37
	movq	%rax, %rcx	 ; _37,
	call	list_copy	 ;
	movq	%rax, -152(%rbp)	 ; tmp210, else_statements
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L174	 ;
.L175:
 ; D:/TC/src/tac.c:532:             tac_statement(else_statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp211
	movq	-160(%rbp), %rax	 ; else_statement, tmp212
	movq	%rax, %rcx	 ; tmp212,
	call	tac_statement	 ;
.L174:
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	-152(%rbp), %rax	 ; else_statements, tmp213
	movq	%rax, %rcx	 ; tmp213,
	call	list_pop	 ;
	movq	%rax, -160(%rbp)	 ; tmp214, else_statement
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	cmpq	$0, -160(%rbp)	 ;, else_statement
	jne	.L175	 ;,
 ; D:/TC/src/tac.c:534:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp215
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp215,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp216, jump_to_end
 ; D:/TC/src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp217
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _38
 ; D:/TC/src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _38->instructions, _39
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp218
	movq	%rax, %rcx	 ; _39,
	call	list_append	 ;
.L173:
 ; D:/TC/src/tac.c:538:     Block* end_block = create_block(end_label);
	movq	-32(%rbp), %rax	 ; end_label, tmp219
	movq	%rax, %rcx	 ; tmp219,
	call	create_block	 ;
	movq	%rax, -168(%rbp)	 ; tmp220, end_block
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp221
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _40
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _40->blocks, _41
	movq	-168(%rbp), %rdx	 ; end_block, tmp222
	movq	%rax, %rcx	 ; _41,
	call	list_append	 ;
 ; D:/TC/src/tac.c:540:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp223
	movq	-168(%rbp), %rdx	 ; end_block, tmp224
	movq	%rdx, 16(%rax)	 ; tmp224, status_56(D)->current_block
 ; D:/TC/src/tac.c:542: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$168, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; for_, for_
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:546:     if (for_->initializer != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp127
	movq	(%rax), %rax	 ; for__54(D)->initializer, _1
 ; D:/TC/src/tac.c:546:     if (for_->initializer != NULL)
	testq	%rax, %rax	 ; _1
	je	.L177	 ;,
 ; D:/TC/src/tac.c:547:         tac_variable(for_->initializer, status, VAR_VAR);
	movq	16(%rbp), %rax	 ; for_, tmp128
	movq	(%rax), %rax	 ; for__54(D)->initializer, _2
	movq	24(%rbp), %rdx	 ; status, tmp129
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _2,
	call	tac_variable	 ;
.L177:
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -32(%rbp)	 ; tmp131, condition_label
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	%rax, %r9	 ; tmp132,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp133, body_label
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp134
	movq	%rax, %r9	 ; tmp134,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -48(%rbp)	 ; tmp135, end_label
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp136
	movq	8(%rax), %rax	 ; for__54(D)->condition, _3
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	testq	%rax, %rax	 ; _3
	je	.L178	 ;,
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	 ; condition_label, tmp137
	movq	%rax, %rdx	 ; tmp137,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _4,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp138, inst
 ; D:/TC/src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp139
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _5
 ; D:/TC/src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	-64(%rbp), %rdx	 ; inst, tmp140
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:/TC/src/tac.c:556:         Block* condition_block = create_block(condition_label);
	movq	-32(%rbp), %rax	 ; condition_label, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp142, condition_block
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	24(%rbp), %rax	 ; status, tmp143
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _7
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	 ; _7->blocks, _8
	movq	-72(%rbp), %rdx	 ; condition_block, tmp144
	movq	%rax, %rcx	 ; _8,
	call	list_append	 ;
 ; D:/TC/src/tac.c:558:         status->current_block = condition_block;
	movq	24(%rbp), %rax	 ; status, tmp145
	movq	-72(%rbp), %rdx	 ; condition_block, tmp146
	movq	%rdx, 16(%rax)	 ; tmp146, status_55(D)->current_block
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	16(%rbp), %rax	 ; for_, tmp147
	movq	8(%rax), %rax	 ; for__54(D)->condition, _9
	movq	24(%rbp), %rdx	 ; status, tmp148
	movq	%rax, %rcx	 ; _9,
	call	tac_expression	 ;
	movq	%rax, -80(%rbp)	 ; tmp149, condition
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; end_label, tmp150
	movq	%rax, %rdx	 ; tmp150,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _10
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-40(%rbp), %rax	 ; body_label, tmp151
	movq	%rax, %rdx	 ; tmp151,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _11
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-80(%rbp), %rax	 ; condition, tmp152
	movq	%rbx, %r9	 ; _10,
	movq	%rdx, %r8	 ; _11,
	movq	%rax, %rdx	 ; tmp152,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp153, inst
 ; D:/TC/src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp154
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _12
 ; D:/TC/src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-64(%rbp), %rdx	 ; inst, tmp155
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
	jmp	.L179	 ;
.L178:
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	 ; body_label, tmp156
	movq	%rax, %rdx	 ; tmp156,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _14,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -56(%rbp)	 ; tmp157, inst
 ; D:/TC/src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp158
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _15
 ; D:/TC/src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _15->instructions, _16
	movq	-56(%rbp), %rdx	 ; inst, tmp159
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
.L179:
 ; D:/TC/src/tac.c:569:     Block* body_block = create_block(body_label);
	movq	-40(%rbp), %rax	 ; body_label, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	create_block	 ;
	movq	%rax, -88(%rbp)	 ; tmp161, body_block
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	24(%rbp), %rax	 ; status, tmp162
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _17
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	 ; _17->blocks, _18
	movq	-88(%rbp), %rdx	 ; body_block, tmp163
	movq	%rax, %rcx	 ; _18,
	call	list_append	 ;
 ; D:/TC/src/tac.c:571:     status->current_block = body_block;
	movq	24(%rbp), %rax	 ; status, tmp164
	movq	-88(%rbp), %rdx	 ; body_block, tmp165
	movq	%rdx, 16(%rax)	 ; tmp165, status_55(D)->current_block
 ; D:/TC/src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp166
	movq	%rax, %r9	 ; tmp166,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -96(%rbp)	 ; tmp167, increment_label
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp168
	movq	16(%rax), %rax	 ; for__54(D)->increment, _19
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	testq	%rax, %rax	 ; _19
	je	.L180	 ;,
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-96(%rbp), %rax	 ; increment_label, tmp169
	movq	%rax, %rdx	 ; tmp169,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	24(%rbp), %rax	 ; status, tmp170
	movq	40(%rax), %rax	 ; status_55(D)->start_labels, _21
	movq	%rax, %rcx	 ; _21,
	call	list_append	 ;
	jmp	.L181	 ;
.L180:
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp171
	movq	8(%rax), %rax	 ; for__54(D)->condition, _22
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	testq	%rax, %rax	 ; _22
	je	.L182	 ;,
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-32(%rbp), %rax	 ; condition_label, tmp172
	movq	%rax, %rdx	 ; tmp172,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	24(%rbp), %rax	 ; status, tmp173
	movq	40(%rax), %rax	 ; status_55(D)->start_labels, _24
	movq	%rax, %rcx	 ; _24,
	call	list_append	 ;
	jmp	.L181	 ;
.L182:
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-40(%rbp), %rax	 ; body_label, tmp174
	movq	%rax, %rdx	 ; tmp174,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	24(%rbp), %rax	 ; status, tmp175
	movq	40(%rax), %rax	 ; status_55(D)->start_labels, _26
	movq	%rax, %rcx	 ; _26,
	call	list_append	 ;
.L181:
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; end_label, tmp176
	movq	%rax, %rdx	 ; tmp176,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbp), %rax	 ; status, tmp177
	movq	32(%rax), %rax	 ; status_55(D)->end_labels, _28
	movq	%rax, %rcx	 ; _28,
	call	list_append	 ;
 ; D:/TC/src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	16(%rbp), %rax	 ; for_, tmp178
	movq	24(%rax), %rax	 ; for__54(D)->body, _29
	movq	%rax, %rcx	 ; _29,
	call	list_copy	 ;
	movq	%rax, -104(%rbp)	 ; tmp179, body_statements
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L183	 ;
.L184:
 ; D:/TC/src/tac.c:584:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp180
	movq	-112(%rbp), %rax	 ; statement, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	tac_statement	 ;
.L183:
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-104(%rbp), %rax	 ; body_statements, tmp182
	movq	%rax, %rcx	 ; tmp182,
	call	list_pop	 ;
	movq	%rax, -112(%rbp)	 ; tmp183, statement
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -112(%rbp)	 ;, statement
	jne	.L184	 ;,
 ; D:/TC/src/tac.c:585:     list_pop_back(status->start_labels);
	movq	24(%rbp), %rax	 ; status, tmp184
	movq	40(%rax), %rax	 ; status_55(D)->start_labels, _30
	movq	%rax, %rcx	 ; _30,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:586:     list_pop_back(status->end_labels);
	movq	24(%rbp), %rax	 ; status, tmp185
	movq	32(%rax), %rax	 ; status_55(D)->end_labels, _31
	movq	%rax, %rcx	 ; _31,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:587:     if (for_->increment != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp186
	movq	16(%rax), %rax	 ; for__54(D)->increment, _32
 ; D:/TC/src/tac.c:587:     if (for_->increment != NULL) {
	testq	%rax, %rax	 ; _32
	je	.L185	 ;,
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	-96(%rbp), %rax	 ; increment_label, tmp187
	movq	%rax, %rdx	 ; tmp187,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _33,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -120(%rbp)	 ; tmp188, inst
 ; D:/TC/src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp189
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _34
 ; D:/TC/src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _34->instructions, _35
	movq	-120(%rbp), %rdx	 ; inst, tmp190
	movq	%rax, %rcx	 ; _35,
	call	list_append	 ;
 ; D:/TC/src/tac.c:591:         Block* increment_block = create_block(increment_label);
	movq	-96(%rbp), %rax	 ; increment_label, tmp191
	movq	%rax, %rcx	 ; tmp191,
	call	create_block	 ;
	movq	%rax, -128(%rbp)	 ; tmp192, increment_block
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	24(%rbp), %rax	 ; status, tmp193
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _36
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	32(%rax), %rax	 ; _36->blocks, _37
	movq	-128(%rbp), %rdx	 ; increment_block, tmp194
	movq	%rax, %rcx	 ; _37,
	call	list_append	 ;
 ; D:/TC/src/tac.c:593:         status->current_block = increment_block;
	movq	24(%rbp), %rax	 ; status, tmp195
	movq	-128(%rbp), %rdx	 ; increment_block, tmp196
	movq	%rdx, 16(%rax)	 ; tmp196, status_55(D)->current_block
 ; D:/TC/src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%rbp), %rax	 ; for_, tmp197
	movq	16(%rax), %rax	 ; for__54(D)->increment, _38
	movq	24(%rbp), %rdx	 ; status, tmp198
	movq	%rax, %rcx	 ; _38,
	call	tac_expression	 ;
.L185:
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	 ; condition_label, tmp199
	movq	%rax, %rdx	 ; tmp199,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _39,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp200, inst
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	movq	16(%rbp), %rax	 ; for_, tmp201
	movq	8(%rax), %rax	 ; for__54(D)->condition, _40
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	testq	%rax, %rax	 ; _40
	jne	.L186	 ;,
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	 ; body_label, tmp202
	movq	%rax, %rdx	 ; tmp202,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _41,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp203, inst
.L186:
 ; D:/TC/src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp204
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _42
 ; D:/TC/src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _42->instructions, _43
	movq	-24(%rbp), %rdx	 ; inst, tmp205
	movq	%rax, %rcx	 ; _43,
	call	list_append	 ;
 ; D:/TC/src/tac.c:602:     Block* end_block = create_block(end_label);
	movq	-48(%rbp), %rax	 ; end_label, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	create_block	 ;
	movq	%rax, -136(%rbp)	 ; tmp207, end_block
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp208
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _44
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _44->blocks, _45
	movq	-136(%rbp), %rdx	 ; end_block, tmp209
	movq	%rax, %rcx	 ; _45,
	call	list_append	 ;
 ; D:/TC/src/tac.c:604:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp210
	movq	-136(%rbp), %rdx	 ; end_block, tmp211
	movq	%rdx, 16(%rax)	 ; tmp211, status_55(D)->current_block
 ; D:/TC/src/tac.c:606: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$120, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; while_, while_
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp106
	movq	%rax, %r9	 ; tmp106,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp107, condition_label
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	 ; condition_label, tmp108
	movq	%rax, %rdx	 ; tmp108,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _1,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp109, inst
 ; D:/TC/src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp110
	movq	16(%rax), %rax	 ; status_27(D)->current_block, _2
 ; D:/TC/src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _2->instructions, _3
	movq	-32(%rbp), %rdx	 ; inst, tmp111
	movq	%rax, %rcx	 ; _3,
	call	list_append	 ;
 ; D:/TC/src/tac.c:613:     Block* condition_block = create_block(condition_label);
	movq	-24(%rbp), %rax	 ; condition_label, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	create_block	 ;
	movq	%rax, -40(%rbp)	 ; tmp113, condition_block
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	24(%rbp), %rax	 ; status, tmp114
	movq	8(%rax), %rax	 ; status_27(D)->current_subroutine, _4
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	 ; _4->blocks, _5
	movq	-40(%rbp), %rdx	 ; condition_block, tmp115
	movq	%rax, %rcx	 ; _5,
	call	list_append	 ;
 ; D:/TC/src/tac.c:615:     status->current_block = condition_block;
	movq	24(%rbp), %rax	 ; status, tmp116
	movq	-40(%rbp), %rdx	 ; condition_block, tmp117
	movq	%rdx, 16(%rax)	 ; tmp117, status_27(D)->current_block
 ; D:/TC/src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp118
	movq	%rax, %r9	 ; tmp118,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -48(%rbp)	 ; tmp119, body_label
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -56(%rbp)	 ; tmp121, end_label
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	16(%rbp), %rax	 ; while_, tmp122
	movq	(%rax), %rax	 ; while__42(D)->condition, _6
	movq	24(%rbp), %rdx	 ; status, tmp123
	movq	%rax, %rcx	 ; _6,
	call	tac_expression	 ;
	movq	%rax, -64(%rbp)	 ; tmp124, condition
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	 ; end_label, tmp125
	movq	%rax, %rdx	 ; tmp125,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _7
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; body_label, tmp126
	movq	%rax, %rdx	 ; tmp126,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-64(%rbp), %rax	 ; condition, tmp127
	movq	%rbx, %r9	 ; _7,
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp127,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp128, inst
 ; D:/TC/src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp129
	movq	16(%rax), %rax	 ; status_27(D)->current_block, _9
 ; D:/TC/src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _9->instructions, _10
	movq	-32(%rbp), %rdx	 ; inst, tmp130
	movq	%rax, %rcx	 ; _10,
	call	list_append	 ;
 ; D:/TC/src/tac.c:623:     Block* body_block = create_block(body_label);
	movq	-48(%rbp), %rax	 ; body_label, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp132, body_block
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	24(%rbp), %rax	 ; status, tmp133
	movq	8(%rax), %rax	 ; status_27(D)->current_subroutine, _11
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	 ; _11->blocks, _12
	movq	-72(%rbp), %rdx	 ; body_block, tmp134
	movq	%rax, %rcx	 ; _12,
	call	list_append	 ;
 ; D:/TC/src/tac.c:625:     status->current_block = body_block;
	movq	24(%rbp), %rax	 ; status, tmp135
	movq	-72(%rbp), %rdx	 ; body_block, tmp136
	movq	%rdx, 16(%rax)	 ; tmp136, status_27(D)->current_block
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-24(%rbp), %rax	 ; condition_label, tmp137
	movq	%rax, %rdx	 ; tmp137,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	24(%rbp), %rax	 ; status, tmp138
	movq	40(%rax), %rax	 ; status_27(D)->start_labels, _14
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	 ; end_label, tmp139
	movq	%rax, %rdx	 ; tmp139,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbp), %rax	 ; status, tmp140
	movq	32(%rax), %rax	 ; status_27(D)->end_labels, _16
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
 ; D:/TC/src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	16(%rbp), %rax	 ; while_, tmp141
	movq	8(%rax), %rax	 ; while__42(D)->body, _17
	movq	%rax, %rcx	 ; _17,
	call	list_copy	 ;
	movq	%rax, -80(%rbp)	 ; tmp142, body_statements
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L188	 ;
.L189:
 ; D:/TC/src/tac.c:632:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp143
	movq	-88(%rbp), %rax	 ; statement, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	tac_statement	 ;
.L188:
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-80(%rbp), %rax	 ; body_statements, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	list_pop	 ;
	movq	%rax, -88(%rbp)	 ; tmp146, statement
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L189	 ;,
 ; D:/TC/src/tac.c:633:     list_pop_back(status->start_labels);
	movq	24(%rbp), %rax	 ; status, tmp147
	movq	40(%rax), %rax	 ; status_27(D)->start_labels, _18
	movq	%rax, %rcx	 ; _18,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:634:     list_pop_back(status->end_labels);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	32(%rax), %rax	 ; status_27(D)->end_labels, _19
	movq	%rax, %rcx	 ; _19,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	 ; condition_label, tmp149
	movq	%rax, %rdx	 ; tmp149,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _20,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp150, inst
 ; D:/TC/src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp151
	movq	16(%rax), %rax	 ; status_27(D)->current_block, _21
 ; D:/TC/src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _21->instructions, _22
	movq	-32(%rbp), %rdx	 ; inst, tmp152
	movq	%rax, %rcx	 ; _22,
	call	list_append	 ;
 ; D:/TC/src/tac.c:639:     Block* end_block = create_block(end_label);
	movq	-56(%rbp), %rax	 ; end_label, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	create_block	 ;
	movq	%rax, -96(%rbp)	 ; tmp154, end_block
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp155
	movq	8(%rax), %rax	 ; status_27(D)->current_subroutine, _23
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _23->blocks, _24
	movq	-96(%rbp), %rdx	 ; end_block, tmp156
	movq	%rax, %rcx	 ; _24,
	call	list_append	 ;
 ; D:/TC/src/tac.c:641:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp157
	movq	-96(%rbp), %rdx	 ; end_block, tmp158
	movq	%rdx, 16(%rax)	 ; tmp158, status_27(D)->current_block
 ; D:/TC/src/tac.c:643: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC13:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; expression, expression
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:646:     if (expression->operator == OP_NONE) {
	movq	16(%rbp), %rax	 ; expression, tmp106
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _1
 ; D:/TC/src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	jne	.L191	 ;,
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	16(%rbp), %rax	 ; expression, tmp107
	movq	8(%rax), %rax	 ; expression_32(D)->prim_left, _2
	movq	24(%rbp), %rdx	 ; status, tmp108
	movq	%rax, %rcx	 ; _2,
	call	tac_primary	 ;
	movq	%rax, -56(%rbp)	 ; tmp109, result
 ; D:/TC/src/tac.c:649:         return result;
	movq	-56(%rbp), %rax	 ; result, _26
	jmp	.L192	 ;
.L191:
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rbp), %rax	 ; expression, tmp110
	movq	16(%rax), %rax	 ; expression_32(D)->right, _3
	movq	24(%rbp), %rdx	 ; status, tmp111
	movq	%rax, %rcx	 ; _3,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _4
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	24(%rbp), %rax	 ; status, tmp112
	movq	%rax, %rdx	 ; tmp112,
	call	load_rvalue	 ;
	movq	%rax, -8(%rbp)	 ; tmp113, right
 ; D:/TC/src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movq	16(%rbp), %rax	 ; expression, tmp114
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _5
	movl	%eax, %ecx	 ; _5,
	call	get_instruction_type	 ;
	movl	%eax, -20(%rbp)	 ; tmp115, op
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	16(%rbp), %rax	 ; expression, tmp116
	movq	(%rax), %rax	 ; expression_32(D)->expr_left, _6
	movq	24(%rbp), %rdx	 ; status, tmp117
	movq	%rax, %rcx	 ; _6,
	call	tac_expression	 ;
	movq	%rax, -32(%rbp)	 ; tmp118, left
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	movq	16(%rbp), %rax	 ; expression, tmp119
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _7
	movl	%eax, %ecx	 ; _7,
	call	is_assignment_operator	 ;
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	testb	%al, %al	 ; _8
	je	.L193	 ;,
 ; D:/TC/src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, -20(%rbp)	 ;, op
	je	.L194	 ;,
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; left, tmp120
	movq	8(%rax), %rax	 ; left_40->type, _9
	movq	24(%rbp), %rdx	 ; status, tmp121
	movq	%rdx, %r9	 ; tmp121,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _9,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _10,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp122, temp
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	24(%rbp), %rdx	 ; status, tmp123
	movq	-32(%rbp), %rax	 ; left, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ;, _11
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %r8	 ; right, tmp125
	movq	-48(%rbp), %rdx	 ; temp, tmp126
	movl	-20(%rbp), %eax	 ; op, tmp127
	movq	%r8, %r9	 ; tmp125,
	movq	%rcx, %r8	 ; _11,
	movl	%eax, %ecx	 ; tmp127,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp128, inst
 ; D:/TC/src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp129
	movq	16(%rax), %rax	 ; status_33(D)->current_block, _12
 ; D:/TC/src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-16(%rbp), %rdx	 ; inst, tmp130
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:/TC/src/tac.c:660:             right = temp;
	movq	-48(%rbp), %rax	 ; temp, tmp131
	movq	%rax, -8(%rbp)	 ; tmp131, right
.L194:
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movq	-32(%rbp), %rax	 ; left, tmp132
	movl	16(%rax), %eax	 ; left_40->kind, _14
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	testl	%eax, %eax	 ; _14
	je	.L195	 ;,
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	%rax, %r9	 ; _16,
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rax	 ;, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	fwrite	 ;
.L195:
 ; D:/TC/src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	-8(%rbp), %rdx	 ; right, tmp134
	movq	-32(%rbp), %rax	 ; left, tmp135
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp134,
	movq	%rax, %rdx	 ; tmp135,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp136, inst
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	movq	-32(%rbp), %rax	 ; left, tmp137
	movzbl	20(%rax), %eax	 ; left_40->is_get, _17
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	testb	%al, %al	 ; _17
	je	.L196	 ;,
 ; D:/TC/src/tac.c:666:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	-8(%rbp), %rdx	 ; right, tmp138
	movq	-32(%rbp), %rax	 ; left, tmp139
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp138,
	movq	%rax, %rdx	 ; tmp139,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp140, inst
	jmp	.L196	 ;
.L193:
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; left, tmp141
	movq	8(%rax), %rax	 ; left_40->type, _18
	movq	24(%rbp), %rdx	 ; status, tmp142
	movq	%rdx, %r9	 ; tmp142,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _18,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _19,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp143, temp
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	24(%rbp), %rdx	 ; status, tmp144
	movq	-32(%rbp), %rax	 ; left, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ;, _20
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %r8	 ; right, tmp146
	movq	-40(%rbp), %rdx	 ; temp, tmp147
	movl	-20(%rbp), %eax	 ; op, tmp148
	movq	%r8, %r9	 ; tmp146,
	movq	%rcx, %r8	 ; _20,
	movl	%eax, %ecx	 ; tmp148,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp149, inst
 ; D:/TC/src/tac.c:670:         right = temp;
	movq	-40(%rbp), %rax	 ; temp, tmp150
	movq	%rax, -8(%rbp)	 ; tmp150, right
.L196:
 ; D:/TC/src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp151
	movq	16(%rax), %rax	 ; status_33(D)->current_block, _21
 ; D:/TC/src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _21->instructions, _22
	movq	-16(%rbp), %rdx	 ; inst, tmp152
	movq	%rax, %rcx	 ; _22,
	call	list_append	 ;
 ; D:/TC/src/tac.c:674:     return right;
	movq	-8(%rbp), %rax	 ; right, _26
.L192:
 ; D:/TC/src/tac.c:675: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC15:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC16:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$136, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; primary, primary
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	movq	16(%rbp), %rax	 ; primary, tmp117
	movl	8(%rax), %eax	 ; primary_41(D)->type, _1
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %eax	 ;, _1
	ja	.L198	 ;,
	movl	%eax, %eax	 ; _1, tmp118
	leaq	0(,%rax,4), %rdx	 ;, tmp119
	leaq	.L200(%rip), %rax	 ;, tmp120
	movl	(%rdx,%rax), %eax	 ;, tmp121
	cltq
	leaq	.L200(%rip), %rdx	 ;, tmp124
	addq	%rdx, %rax	 ; tmp124, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	16(%rbp), %rax	 ; primary, tmp125
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _2
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _2,
	call	strtoll	 ;
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, -72(%rbp)	 ; _3, t
 ; D:/TC/src/tac.c:682:             return create_arg(ARG_INT, &t);
	leaq	-72(%rbp), %rax	 ;, tmp126
	movq	%rax, %rdx	 ; tmp126,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L207:
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	16(%rbp), %rax	 ; primary, tmp127
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _4
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _4,
	call	strtod	 ;
	movq	%xmm0, %rax	 ;, _5
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	%rax, -80(%rbp)	 ; _5, t
 ; D:/TC/src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	leaq	-80(%rbp), %rax	 ;, tmp128
	movq	%rax, %rdx	 ; tmp128,
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L206:
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp129
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _6
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%rax, %rdx	 ; _6,
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L205:
 ; D:/TC/src/tac.c:692:             bool t = true;
	movb	$1, -81(%rbp)	 ;, t
 ; D:/TC/src/tac.c:694:             return create_arg(ARG_BOOL, &t);
	leaq	-81(%rbp), %rax	 ;, tmp130
	movq	%rax, %rdx	 ; tmp130,
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L204:
 ; D:/TC/src/tac.c:697:             bool t = false;
	movb	$0, -82(%rbp)	 ;, t
 ; D:/TC/src/tac.c:699:             return create_arg(ARG_BOOL, &t);
	leaq	-82(%rbp), %rax	 ;, tmp131
	movq	%rax, %rdx	 ; tmp131,
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L203:
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	16(%rbp), %rax	 ; primary, tmp132
	movq	(%rax), %rax	 ; primary_41(D)->value.expr, _7
	movq	24(%rbp), %rdx	 ; status, tmp133
	movq	%rax, %rcx	 ; _7,
	call	tac_expression	 ;
	jmp	.L209	 ;
.L202:
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	16(%rbp), %rax	 ; primary, tmp134
	movq	(%rax), %rax	 ; primary_41(D)->value.operand, _8
	movq	24(%rbp), %rdx	 ; status, tmp135
	movq	%rax, %rcx	 ; _8,
	call	tac_primary	 ;
	movq	%rax, %rcx	 ;, _9
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	24(%rbp), %rax	 ; status, tmp136
	movq	%rax, %rdx	 ; tmp136,
	call	load_rvalue	 ;
	movq	%rax, -48(%rbp)	 ; tmp137, operand
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp138
	movq	(%rax), %rax	 ; name_bool, name_bool.12_10
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	24(%rbp), %rdx	 ; status, tmp139
	movq	%rdx, %r9	 ; tmp139,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; name_bool.12_10,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _11,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -56(%rbp)	 ; tmp140, temp
 ; D:/TC/src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	-48(%rbp), %rdx	 ; operand, tmp141
	movq	-56(%rbp), %rax	 ; temp, tmp142
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp141,
	movq	%rax, %rdx	 ; tmp142,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp143, inst
 ; D:/TC/src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp144
	movq	16(%rax), %rax	 ; status_42(D)->current_block, _12
 ; D:/TC/src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-64(%rbp), %rdx	 ; inst, tmp145
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:/TC/src/tac.c:710:             return temp;
	movq	-56(%rbp), %rax	 ; temp, _36
	jmp	.L209	 ;
.L201:
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	16(%rbp), %rax	 ; primary, tmp146
	movq	(%rax), %rax	 ; primary_41(D)->value.operand, _14
	movq	24(%rbp), %rdx	 ; status, tmp147
	movq	%rax, %rcx	 ; _14,
	call	tac_primary	 ;
	movq	%rax, %rcx	 ;, _15
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	%rax, %rdx	 ; tmp148,
	call	load_rvalue	 ;
	movq	%rax, -32(%rbp)	 ; tmp149, operand
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; operand, tmp150
	movq	8(%rax), %rax	 ; operand_47->type, _16
	movq	24(%rbp), %rdx	 ; status, tmp151
	movq	%rdx, %r9	 ; tmp151,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _16,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _17,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp152, temp
 ; D:/TC/src/tac.c:715:             Instruction* inst = NULL;
	movq	$0, -24(%rbp)	 ;, inst
 ; D:/TC/src/tac.c:716:             long long zero_int = 0;
	movq	$0, -96(%rbp)	 ;, zero_int
 ; D:/TC/src/tac.c:717:             double neg_one_float = -1.0;
	movsd	.LC14(%rip), %xmm0	 ;, tmp153
	movsd	%xmm0, -104(%rbp)	 ; tmp153, neg_one_float
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	-32(%rbp), %rax	 ; operand, tmp154
	movq	8(%rax), %rdx	 ; operand_47->type, _18
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp155
	movq	(%rax), %rax	 ; name_int, name_int.13_19
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	cmpq	%rax, %rdx	 ; name_int.13_19, _18
	jne	.L210	 ;,
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	-96(%rbp), %rax	 ;, tmp156
	movq	%rax, %rdx	 ; tmp156,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	-32(%rbp), %rcx	 ; operand, tmp157
	movq	-40(%rbp), %rax	 ; temp, tmp158
	movq	%rcx, %r9	 ; tmp157,
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp158,
	movl	$1, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp159, inst
	jmp	.L211	 ;
.L210:
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	movq	-32(%rbp), %rax	 ; operand, tmp160
	movq	8(%rax), %rdx	 ; operand_47->type, _21
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp161
	movq	(%rax), %rax	 ; name_float, name_float.14_22
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	cmpq	%rax, %rdx	 ; name_float.14_22, _21
	jne	.L212	 ;,
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	-104(%rbp), %rax	 ;, tmp162
	movq	%rax, %rdx	 ; tmp162,
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	-32(%rbp), %rcx	 ; operand, tmp163
	movq	-40(%rbp), %rax	 ; temp, tmp164
	movq	%rcx, %r9	 ; tmp163,
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp164,
	movl	$2, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp165, inst
	jmp	.L211	 ;
.L212:
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	-32(%rbp), %rax	 ; operand, tmp166
	movq	8(%rax), %rax	 ; operand_47->type, _24
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _24->name, _25
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	24(%rax), %rax	 ; _26->_stderr, _27
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	%rbx, %r8	 ; _25,
	leaq	.LC15(%rip), %rdx	 ;, tmp167
	movq	%rax, %rcx	 ; _27,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:725:                 return NULL;
	movl	$0, %eax	 ;, _36
	jmp	.L209	 ;
.L211:
 ; D:/TC/src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp168
	movq	16(%rax), %rax	 ; status_42(D)->current_block, _28
 ; D:/TC/src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _28->instructions, _29
	movq	-24(%rbp), %rdx	 ; inst, tmp169
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:/TC/src/tac.c:729:             return temp;
	movq	-40(%rbp), %rax	 ; temp, _36
	jmp	.L209	 ;
.L199:
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	16(%rbp), %rax	 ; primary, tmp170
	movq	(%rax), %rax	 ; primary_41(D)->value.var, _30
	movq	24(%rbp), %rdx	 ; status, tmp171
	movq	%rax, %rcx	 ; _30,
	call	tac_variable_access	 ;
	jmp	.L209	 ;
.L198:
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	16(%rbp), %rax	 ; primary, tmp172
	movl	8(%rax), %ebx	 ; primary_41(D)->type, _31
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rax	 ; _32->_stderr, _33
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _31,
	leaq	.LC16(%rip), %rdx	 ;, tmp173
	movq	%rax, %rcx	 ; _33,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:737:             return NULL;
	movl	$0, %eax	 ;, _36
.L209:
 ; D:/TC/src/tac.c:739: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC18:
	.ascii "[warning] Failed to generate variable access for base\12\0"
	.align 8
.LC19:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC20:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC21:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
	.align 8
.LC22:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC23:
	.ascii "arr\0"
	.align 8
.LC24:
	.ascii "[warning] Failed to generate variable access for index\12\0"
	.align 8
.LC25:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC26:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$192, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable_access, variable_access
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp210
	movl	16(%rax), %eax	 ; variable_access_136(D)->type, _1
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testl	%eax, %eax	 ; _1
	jne	.L215	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp211
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _2
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rax, %rax	 ; _2
	je	.L215	 ;,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movq	16(%rbp), %rax	 ; variable_access, tmp212
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _3
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _3->kind, _4
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, _4
	je	.L216	 ;,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movq	16(%rbp), %rax	 ; variable_access, tmp213
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _5
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _5->kind, _6
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$2, %eax	 ;, _6
	je	.L216	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	16(%rbp), %rax	 ; variable_access, tmp214
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _7
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rax), %rdx	 ; _7->type, _8
	movq	16(%rbp), %rax	 ; variable_access, tmp215
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _9
	movq	24(%rbp), %rcx	 ; status, tmp216
	movq	%rcx, %r9	 ; tmp216,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _9,
	call	create_var	 ;
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rdx	 ; _10,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp217, result
 ; D:/TC/src/tac.c:746:             return result;
	movq	-40(%rbp), %rax	 ; result, _130
	jmp	.L217	 ;
.L216:
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rax	 ; variable_access, tmp218
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _11
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; _11->type, _12
	movq	16(%rbp), %rax	 ; variable_access, tmp219
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.name, _13
	movq	24(%rbp), %rcx	 ; status, tmp220
	movq	%rcx, %r9	 ; tmp220,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; _13,
	call	create_var	 ;
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _14,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp221, result
 ; D:/TC/src/tac.c:750:             return result;
	movq	-48(%rbp), %rax	 ; result, _130
	jmp	.L217	 ;
.L215:
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp222
	movq	(%rax), %rax	 ; variable_access_136(D)->base, _15
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rax, %rax	 ; _15
	jne	.L218	 ;,
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %rax	 ; _16->_stderr, _17
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movq	%rax, %r9	 ; _17,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp223
	movq	%rax, %rcx	 ; tmp223,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:756:         return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L218:
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp224
	movq	(%rax), %rax	 ; variable_access_136(D)->base, _18
	movq	24(%rbp), %rdx	 ; status, tmp225
	movq	%rax, %rcx	 ; _18,
	call	tac_variable_access	 ;
	movq	%rax, %rcx	 ;, _19
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	24(%rbp), %rax	 ; status, tmp226
	movq	%rax, %rdx	 ; tmp226,
	call	load_rvalue	 ;
	movq	%rax, -24(%rbp)	 ; tmp227, base
 ; D:/TC/src/tac.c:759:     if (base == NULL) {
	cmpq	$0, -24(%rbp)	 ;, base
	jne	.L219	 ;,
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movq	24(%rax), %rax	 ; _20->_stderr, _21
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movq	%rax, %r9	 ; _21,
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rax	 ;, tmp228
	movq	%rax, %rcx	 ; tmp228,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:762:         return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L219:
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movq	16(%rbp), %rax	 ; variable_access, tmp229
	movl	16(%rax), %eax	 ; variable_access_136(D)->type, _22
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %eax	 ;, _22
	jne	.L220	 ;,
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-24(%rbp), %rax	 ; base, tmp230
	movq	8(%rax), %rax	 ; base_148->type, _23
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _23->kind, _24
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, _24
	je	.L221	 ;,
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-24(%rbp), %rax	 ; base, tmp231
	movq	8(%rax), %rax	 ; base_148->type, _25
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _25->kind, _26
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$2, %eax	 ;, _26
	jne	.L222	 ;,
.L221:
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp232
	movq	8(%rax), %rax	 ; base_148->type, _27
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _27->name, _28
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	24(%rax), %rax	 ; _29->_stderr, _30
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	%rbx, %r8	 ; _28,
	leaq	.LC19(%rip), %rdx	 ;, tmp233
	movq	%rax, %rcx	 ; _30,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:768:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L222:
 ; D:/TC/src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	-24(%rbp), %rax	 ; base, tmp234
	movq	8(%rax), %rax	 ; base_148->type, _31
 ; D:/TC/src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rax	 ; _31->ast_node.scope, tmp235
	movq	%rax, -32(%rbp)	 ; tmp235, scope
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	movq	-24(%rbp), %rax	 ; base, tmp236
	movq	8(%rax), %rax	 ; base_148->type, _32
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _32->kind, _33
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _33
	jne	.L223	 ;,
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	-24(%rbp), %rax	 ; base, tmp237
	movq	8(%rax), %rax	 ; base_148->type, _34
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	24(%rax), %rax	 ; _34->ast_node.class, _35
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rax), %rax	 ; _35->class_scope, tmp238
	movq	%rax, -32(%rbp)	 ; tmp238, scope
.L223:
 ; D:/TC/src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp239
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.attr_name, _36
 ; D:/TC/src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rax), %rdx	 ; _36->name, _37
	movq	-32(%rbp), %rax	 ; scope, tmp240
	movq	%rax, %rcx	 ; tmp240,
	call	search_name_use_strcmp	 ;
	movq	%rax, -136(%rbp)	 ; tmp241, attr
 ; D:/TC/src/tac.c:774:         if (attr == NULL) {
	cmpq	$0, -136(%rbp)	 ;, attr
	jne	.L224	 ;,
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp242
	movq	8(%rax), %rax	 ; base_148->type, _38
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _38->name, _39
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp243
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.attr_name, _40
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rbx	 ; _40->name, _41
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rax	 ; _42->_stderr, _43
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _39,
	movq	%rbx, %r8	 ; _41,
	leaq	.LC20(%rip), %rdx	 ;, tmp244
	movq	%rax, %rcx	 ; _43,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:777:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L224:
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movq	-136(%rbp), %rax	 ; attr, tmp245
	movl	32(%rax), %eax	 ; attr_208->kind, _44
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$2, %eax	 ;, _44
	je	.L225	 ;,
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movq	-136(%rbp), %rax	 ; attr, tmp246
	movl	32(%rax), %eax	 ; attr_208->kind, _45
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	 ;, _45
	jne	.L226	 ;,
.L225:
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-136(%rbp), %rax	 ; attr, tmp247
	movq	(%rax), %rdx	 ; attr_208->type, _46
	movq	24(%rbp), %rcx	 ; status, tmp248
	movq	-136(%rbp), %rax	 ; attr, tmp249
	movq	%rcx, %r9	 ; tmp248,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp249,
	call	create_var	 ;
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _47,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L217	 ;
.L226:
 ; D:/TC/src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	movq	-136(%rbp), %rax	 ; attr, tmp250
	movl	32(%rax), %eax	 ; attr_208->kind, _48
 ; D:/TC/src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _48
	je	.L227	 ;,
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp251
	movq	8(%rax), %rax	 ; base_148->type, _49
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _49->name, _50
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp252
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.attr_name, _51
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rbx	 ; _51->name, _52
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rax	 ; _53->_stderr, _54
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _50,
	movq	%rbx, %r8	 ; _52,
	leaq	.LC21(%rip), %rdx	 ;, tmp253
	movq	%rax, %rcx	 ; _54,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:784:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L227:
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	-136(%rbp), %rax	 ; attr, tmp254
	movq	(%rax), %rax	 ; attr_208->type, _55
	movq	24(%rbp), %rdx	 ; status, tmp255
	movq	%rdx, %r9	 ; tmp255,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _55,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _56,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -144(%rbp)	 ; tmp256, temp
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	16(%rbp), %rax	 ; variable_access, tmp257
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.attr_name, _57
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rax), %rdx	 ; _57->type, _58
	movq	16(%rbp), %rax	 ; variable_access, tmp258
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.attr_name, _59
	movq	24(%rbp), %rcx	 ; status, tmp259
	movq	%rcx, %r9	 ; tmp259,
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; _59,
	call	create_var	 ;
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rdx	 ; _60,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _61
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	-24(%rbp), %rcx	 ; base, tmp260
	movq	-144(%rbp), %rax	 ; temp, tmp261
	movq	%rdx, %r9	 ; _61,
	movq	%rcx, %r8	 ; tmp260,
	movq	%rax, %rdx	 ; tmp261,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -152(%rbp)	 ; tmp262, inst
 ; D:/TC/src/tac.c:788:         temp->is_get = true;
	movq	-144(%rbp), %rax	 ; temp, tmp263
	movb	$1, 20(%rax)	 ;, temp_211->is_get
 ; D:/TC/src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp264
	movq	16(%rax), %rax	 ; status_137(D)->current_block, _62
 ; D:/TC/src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _62->instructions, _63
	movq	-152(%rbp), %rdx	 ; inst, tmp265
	movq	%rax, %rcx	 ; _63,
	call	list_append	 ;
 ; D:/TC/src/tac.c:791:         return temp;
	movq	-144(%rbp), %rax	 ; temp, _130
	jmp	.L217	 ;
.L220:
 ; D:/TC/src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	movq	16(%rbp), %rax	 ; variable_access, tmp266
	movl	16(%rax), %eax	 ; variable_access_136(D)->type, _64
 ; D:/TC/src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %eax	 ;, _64
	jne	.L228	 ;,
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	-24(%rbp), %rax	 ; base, tmp267
	movq	8(%rax), %rax	 ; base_148->type, _65
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	 ; _65->kind, _66
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$3, %eax	 ;, _66
	je	.L229	 ;,
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	-24(%rbp), %rax	 ; base, tmp268
	movq	8(%rax), %rax	 ; base_148->type, _67
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	 ; _67->kind, _68
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$4, %eax	 ;, _68
	je	.L229	 ;,
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	-24(%rbp), %rax	 ; base, tmp269
	movq	8(%rax), %rax	 ; base_148->type, _69
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	 ; _69->kind, _70
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _70
	je	.L229	 ;,
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp270
	movq	8(%rax), %rax	 ; base_148->type, _71
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _71->name, _72
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	24(%rax), %rax	 ; _73->_stderr, _74
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	%rbx, %r8	 ; _72,
	leaq	.LC22(%rip), %rdx	 ;, tmp271
	movq	%rax, %rcx	 ; _74,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:796:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L229:
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	-24(%rbp), %rax	 ; base, tmp272
	movq	8(%rax), %rax	 ; base_148->type, _75
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	 ; _75->name, _76
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC23(%rip), %rdx	 ;, tmp273
	movq	%rax, %rcx	 ; _76,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; _77
	je	.L230	 ;,
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp274
	movq	8(%rax), %rax	 ; base_148->type, _78
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _78->name, _79
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	24(%rax), %rax	 ; _80->_stderr, _81
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	%rbx, %r8	 ; _79,
	leaq	.LC22(%rip), %rdx	 ;, tmp275
	movq	%rax, %rcx	 ; _81,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:801:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L230:
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp276
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.index, _82
	movq	24(%rbp), %rdx	 ; status, tmp277
	movq	%rax, %rcx	 ; _82,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _83
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	24(%rbp), %rax	 ; status, tmp278
	movq	%rax, %rdx	 ; tmp278,
	call	load_rvalue	 ;
	movq	%rax, -112(%rbp)	 ; tmp279, index
 ; D:/TC/src/tac.c:804:         if (index == NULL) {
	cmpq	$0, -112(%rbp)	 ;, index
	jne	.L231	 ;,
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movq	24(%rax), %rax	 ; _84->_stderr, _85
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movq	%rax, %r9	 ; _85,
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rax	 ;, tmp280
	movq	%rax, %rcx	 ; tmp280,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:807:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L231:
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	-24(%rbp), %rax	 ; base, tmp281
	movq	8(%rax), %rax	 ; base_148->type, _86
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	(%rax), %rax	 ; _86->type, _87
	movq	24(%rbp), %rdx	 ; status, tmp282
	movq	%rdx, %r9	 ; tmp282,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _87,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _88,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -120(%rbp)	 ; tmp283, temp
 ; D:/TC/src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	-112(%rbp), %rcx	 ; index, tmp284
	movq	-24(%rbp), %rdx	 ; base, tmp285
	movq	-120(%rbp), %rax	 ; temp, tmp286
	movq	%rcx, %r9	 ; tmp284,
	movq	%rdx, %r8	 ; tmp285,
	movq	%rax, %rdx	 ; tmp286,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -128(%rbp)	 ; tmp287, inst
 ; D:/TC/src/tac.c:811:         temp->is_get = true;
	movq	-120(%rbp), %rax	 ; temp, tmp288
	movb	$1, 20(%rax)	 ;, temp_193->is_get
 ; D:/TC/src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp289
	movq	16(%rax), %rax	 ; status_137(D)->current_block, _89
 ; D:/TC/src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _89->instructions, _90
	movq	-128(%rbp), %rdx	 ; inst, tmp290
	movq	%rax, %rcx	 ; _90,
	call	list_append	 ;
 ; D:/TC/src/tac.c:814:         return temp;
	movq	-120(%rbp), %rax	 ; temp, _130
	jmp	.L217	 ;
.L228:
 ; D:/TC/src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp291
	movl	16(%rax), %eax	 ; variable_access_136(D)->type, _91
 ; D:/TC/src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %eax	 ;, _91
	jne	.L232	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	 ; base, tmp292
	movl	16(%rax), %eax	 ; base_148->kind, _92
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _92
	jne	.L233	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	 ; base, tmp293
	movq	8(%rax), %rax	 ; base_148->type, _93
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %eax	 ; _93->kind, _94
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _94
	jne	.L233	 ;,
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp294
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.15_95
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-24(%rbp), %rax	 ; base, tmp295
	movq	8(%rax), %rax	 ; base_148->type, _96
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rax	 ; _96->name, _97
	movq	%rax, %rcx	 ; _97,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ;, _98
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-24(%rbp), %rax	 ; base, tmp296
	movq	8(%rax), %rax	 ; base_148->type, _99
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _99->ast_node.class, _100
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	16(%rax), %rax	 ; _100->class_scope, _101
	movq	%rax, %rcx	 ; _101,
	call	search_name_use_strcmp	 ;
	movq	%rax, -56(%rbp)	 ; tmp297, attr
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-56(%rbp), %rax	 ; attr, tmp298
	movq	(%rax), %rdx	 ; attr_154->type, _102
	movq	24(%rbp), %rcx	 ; status, tmp299
	movq	-56(%rbp), %rax	 ; attr, tmp300
	movq	%rcx, %r9	 ; tmp299,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp300,
	call	create_var	 ;
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _103,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -24(%rbp)	 ; tmp301, base
.L233:
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	movq	-24(%rbp), %rax	 ; base, tmp302
	movl	16(%rax), %eax	 ; base_127->kind, _104
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %eax	 ;, _104
	je	.L234	 ;,
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp303
	movq	8(%rax), %rax	 ; base_127->type, _105
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rsi	 ; _105->name, _106
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp304
	movl	16(%rax), %ebx	 ; base_127->kind, _107
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rax	 ; _108->_stderr, _109
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	%rsi, %r9	 ; _106,
	movl	%ebx, %r8d	 ; _107,
	leaq	.LC25(%rip), %rdx	 ;, tmp305
	movq	%rax, %rcx	 ; _109,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:823:             return NULL;
	movl	$0, %eax	 ;, _130
	jmp	.L217	 ;
.L234:
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	16(%rbp), %rax	 ; variable_access, tmp306
	movq	8(%rax), %rax	 ; variable_access_136(D)->content.args, _110
	movq	%rax, %rcx	 ; _110,
	call	list_copy	 ;
	movq	%rax, -64(%rbp)	 ; tmp307, args
 ; D:/TC/src/tac.c:827:         long long arg_count = 0;
	movq	$0, -160(%rbp)	 ;, arg_count
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L236	 ;
.L237:
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	24(%rbp), %rdx	 ; status, tmp308
	movq	-72(%rbp), %rax	 ; arg_expr, tmp309
	movq	%rax, %rcx	 ; tmp309,
	call	tac_expression	 ;
	movq	%rax, -96(%rbp)	 ; tmp310, arg
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	-96(%rbp), %rax	 ; arg, tmp311
	movq	8(%rax), %rax	 ; arg_172->type, _111
	movq	%rax, %rcx	 ; _111,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, -168(%rbp)	 ; _113, size
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	leaq	-168(%rbp), %rax	 ;, tmp312
	movq	%rax, %rdx	 ; tmp312,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	-96(%rbp), %rdx	 ; arg, tmp313
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp313,
	movq	%rax, %rdx	 ; _114,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -104(%rbp)	 ; tmp314, inst
 ; D:/TC/src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp315
	movq	16(%rax), %rax	 ; status_137(D)->current_block, _115
 ; D:/TC/src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _115->instructions, _116
	movq	-104(%rbp), %rdx	 ; inst, tmp316
	movq	%rax, %rcx	 ; _116,
	call	list_append	 ;
 ; D:/TC/src/tac.c:833:             arg_count++;
	movq	-160(%rbp), %rax	 ; arg_count, arg_count.16_117
	addq	$1, %rax	 ;, _118
	movq	%rax, -160(%rbp)	 ; _118, arg_count
.L236:
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	-64(%rbp), %rax	 ; args, tmp317
	movq	%rax, %rcx	 ; tmp317,
	call	list_pop	 ;
	movq	%rax, -72(%rbp)	 ; tmp318, arg_expr
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -72(%rbp)	 ;, arg_expr
	jne	.L237	 ;,
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	-24(%rbp), %rax	 ; base, tmp319
	movq	8(%rax), %rax	 ; base_127->type, _119
	movq	24(%rbp), %rdx	 ; status, tmp320
	movq	%rdx, %r9	 ; tmp320,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _119,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _120,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -80(%rbp)	 ; tmp321, temp
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	leaq	-160(%rbp), %rax	 ;, tmp322
	movq	%rax, %rdx	 ; tmp322,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _121
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	-24(%rbp), %rcx	 ; base, tmp323
	movq	-80(%rbp), %rax	 ; temp, tmp324
	movq	%rdx, %r9	 ; _121,
	movq	%rcx, %r8	 ; tmp323,
	movq	%rax, %rdx	 ; tmp324,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -88(%rbp)	 ; tmp325, inst
 ; D:/TC/src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp326
	movq	16(%rax), %rax	 ; status_137(D)->current_block, _122
 ; D:/TC/src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _122->instructions, _123
	movq	-88(%rbp), %rdx	 ; inst, tmp327
	movq	%rax, %rcx	 ; _123,
	call	list_append	 ;
 ; D:/TC/src/tac.c:839:         return temp;
	movq	-80(%rbp), %rax	 ; temp, _130
	jmp	.L217	 ;
.L232:
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	16(%rbp), %rax	 ; variable_access, tmp328
	movl	16(%rax), %ebx	 ; variable_access_136(D)->type, _124
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rax	 ; _125->_stderr, _126
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%ebx, %r8d	 ; _124,
	leaq	.LC26(%rip), %rdx	 ;, tmp329
	movq	%rax, %rcx	 ; _126,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:843:         return NULL;
	movl	$0, %eax	 ;, _130
.L217:
 ; D:/TC/src/tac.c:845: }
	addq	$192, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC14:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
	.section	.rdata$.refptr.name_void, "dr"
	.globl	.refptr.name_void
	.linkonce	discard
.refptr.name_void:
	.quad	name_void
	.section	.rdata$.refptr.name_bool, "dr"
	.globl	.refptr.name_bool
	.linkonce	discard
.refptr.name_bool:
	.quad	name_bool
	.section	.rdata$.refptr.name_string, "dr"
	.globl	.refptr.name_string
	.linkonce	discard
.refptr.name_string:
	.quad	name_string
	.section	.rdata$.refptr.name_float, "dr"
	.globl	.refptr.name_float
	.linkonce	discard
.refptr.name_float:
	.quad	name_float
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
