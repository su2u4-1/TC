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
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
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
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	16(%rbp), %rax	 ; type, tmp102
	movq	8(%rax), %rbx	 ; type_14(D)->name, _8
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	24(%rax), %rax	 ; _9->_stderr, _10
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
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
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC5:
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
	movq	%rax, -8(%rbp)	 ; tmp95, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	48(%rbp), %rcx	 ; status, tmp96
	movq	24(%rbp), %rdx	 ; type, tmp97
	movq	16(%rbp), %rax	 ; var, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	-8(%rbp), %rdx	 ; attr, tmp99
	movq	%rax, (%rdx)	 ; _1, attr_15->var
 ; D:/TC/src/tac.c:198:     attr->type = type;
	movq	-8(%rbp), %rax	 ; attr, tmp100
	movq	24(%rbp), %rdx	 ; type, tmp101
	movq	%rdx, 8(%rax)	 ; tmp101, attr_15->type
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	-8(%rbp), %rax	 ; attr, tmp102
	movq	40(%rbp), %rdx	 ; offset, tmp103
	movq	%rdx, 16(%rax)	 ; tmp103, attr_15->offset
 ; D:/TC/src/tac.c:200:     if (offset == 0 && table != NULL) {
	cmpq	$0, 40(%rbp)	 ;, offset
	jne	.L80	 ;,
 ; D:/TC/src/tac.c:200:     if (offset == 0 && table != NULL) {
	cmpq	$0, 32(%rbp)	 ;, table
	je	.L80	 ;,
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	32(%rbp), %rax	 ; table, tmp104
	movq	16(%rax), %rdx	 ; table_24(D)->size, _2
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	-8(%rbp), %rax	 ; attr, tmp105
	movq	%rdx, 16(%rax)	 ; _2, attr_15->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	24(%rbp), %rax	 ; type, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	32(%rbp), %rdx	 ; table, tmp107
	movq	16(%rdx), %rdx	 ; table_24(D)->size, _3
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, %rdx	 ; _27, _4
	movq	32(%rbp), %rax	 ; table, tmp108
	movq	%rdx, 16(%rax)	 ; _4, table_24(D)->size
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	jmp	.L81	 ;
.L80:
 ; D:/TC/src/tac.c:203:     } else if (table == NULL)
	cmpq	$0, 32(%rbp)	 ;, table
	jne	.L81	 ;,
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movq	%rax, %r9	 ; _6,
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
.L81:
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, 32(%rbp)	 ;, table
	je	.L82	 ;,
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	32(%rbp), %rax	 ; table, tmp110
	movq	(%rax), %rax	 ; table_24(D)->attributes, _7
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	 ; _7
	jne	.L83	 ;,
.L82:
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	%rax, %r9	 ; _9,
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rax	 ;, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L84	 ;
.L83:
 ; D:/TC/src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	32(%rbp), %rax	 ; table, tmp112
	movq	(%rax), %rax	 ; table_24(D)->attributes, _10
	movq	-8(%rbp), %rdx	 ; attr, tmp113
	movq	%rax, %rcx	 ; _10,
	call	list_append	 ;
.L84:
 ; D:/TC/src/tac.c:210:     return attr;
	movq	-8(%rbp), %rax	 ; attr, _34
 ; D:/TC/src/tac.c:211: }
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
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movq	-8(%rbp), %rax	 ; inst, tmp85
	movl	16(%rbp), %edx	 ; type, tmp86
	movl	%edx, 24(%rax)	 ; tmp86, inst_3->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	-8(%rbp), %rax	 ; inst, tmp87
	movq	24(%rbp), %rdx	 ; arg1, tmp88
	movq	%rdx, (%rax)	 ; tmp88, inst_3->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	-8(%rbp), %rax	 ; inst, tmp89
	movq	32(%rbp), %rdx	 ; arg2, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, inst_3->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	-8(%rbp), %rax	 ; inst, tmp91
	movq	40(%rbp), %rdx	 ; arg3, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, inst_3->arg3
 ; D:/TC/src/tac.c:220:     return inst;
	movq	-8(%rbp), %rax	 ; inst, _12
 ; D:/TC/src/tac.c:221: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; kind, kind
	movq	%rdx, 24(%rbp)	 ; value, value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp98, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movq	-8(%rbp), %rax	 ; arg, tmp99
	movl	16(%rbp), %edx	 ; kind, tmp100
	movl	%edx, 16(%rax)	 ; tmp100, arg_18->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	-8(%rbp), %rax	 ; arg, tmp101
	movq	$0, 8(%rax)	 ;, arg_18->type
 ; D:/TC/src/tac.c:227:     switch (kind) {
	cmpl	$8, 16(%rbp)	 ;, kind
	ja	.L89	 ;,
	movl	16(%rbp), %eax	 ; kind, tmp102
	leaq	0(,%rax,4), %rdx	 ;, tmp103
	leaq	.L91(%rip), %rax	 ;, tmp104
	movl	(%rdx,%rax), %eax	 ;, tmp105
	cltq
	leaq	.L91(%rip), %rdx	 ;, tmp108
	addq	%rdx, %rax	 ; tmp108, tmp107
	jmp	*%rax	 ; tmp107
	.section .rdata,"dr"
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
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp109
	movq	24(%rbp), %rdx	 ; value, tmp110
	movq	%rdx, (%rax)	 ; tmp110, arg_18->value.variable
 ; D:/TC/src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	 ; arg, tmp111
	movq	(%rax), %rax	 ; arg_18->value.variable, _1
 ; D:/TC/src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	16(%rax), %rdx	 ; _1->type, _2
 ; D:/TC/src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	 ; arg, tmp112
	movq	%rdx, 8(%rax)	 ; _2, arg_18->type
 ; D:/TC/src/tac.c:231:             break;
	jmp	.L99	 ;
.L97:
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	24(%rbp), %rax	 ; value, tmp113
	movq	(%rax), %rdx	 ; MEM[(long long int *)value_22(D)], _3
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp114
	movq	%rdx, (%rax)	 ; _3, arg_18->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp115
	movq	(%rax), %rdx	 ; name_int, name_int.5_4
	movq	-8(%rbp), %rax	 ; arg, tmp116
	movq	%rdx, 8(%rax)	 ; name_int.5_4, arg_18->type
 ; D:/TC/src/tac.c:235:             break;
	jmp	.L99	 ;
.L96:
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	24(%rbp), %rax	 ; value, tmp117
	movsd	(%rax), %xmm0	 ; MEM[(double *)value_22(D)], _5
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp118
	movsd	%xmm0, (%rax)	 ; _5, arg_18->value.float_value
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp119
	movq	(%rax), %rdx	 ; name_float, name_float.6_6
	movq	-8(%rbp), %rax	 ; arg, tmp120
	movq	%rdx, 8(%rax)	 ; name_float.6_6, arg_18->type
 ; D:/TC/src/tac.c:239:             break;
	jmp	.L99	 ;
.L95:
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movq	-8(%rbp), %rax	 ; arg, tmp121
	movq	24(%rbp), %rdx	 ; value, tmp122
	movq	%rdx, (%rax)	 ; tmp122, arg_18->value.string_value
 ; D:/TC/src/tac.c:242:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rax	 ;, tmp123
	movq	(%rax), %rdx	 ; name_string, name_string.7_7
	movq	-8(%rbp), %rax	 ; arg, tmp124
	movq	%rdx, 8(%rax)	 ; name_string.7_7, arg_18->type
 ; D:/TC/src/tac.c:243:             break;
	jmp	.L99	 ;
.L94:
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movq	24(%rbp), %rax	 ; value, tmp125
	movzbl	(%rax), %edx	 ; MEM[(char *)value_22(D)], _8
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp126
	movb	%dl, (%rax)	 ; _8, arg_18->value.bool_value
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp127
	movq	(%rax), %rdx	 ; name_bool, name_bool.8_9
	movq	-8(%rbp), %rax	 ; arg, tmp128
	movq	%rdx, 8(%rax)	 ; name_bool.8_9, arg_18->type
 ; D:/TC/src/tac.c:247:             break;
	jmp	.L99	 ;
.L93:
 ; D:/TC/src/tac.c:249:             arg->value.string_value = NULL;
	movq	-8(%rbp), %rax	 ; arg, tmp129
	movq	$0, (%rax)	 ;, arg_18->value.string_value
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; name_void, name_void.9_10
	movq	-8(%rbp), %rax	 ; arg, tmp131
	movq	%rdx, 8(%rax)	 ; name_void.9_10, arg_18->type
 ; D:/TC/src/tac.c:251:             break;
	jmp	.L99	 ;
.L92:
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp132
	movq	24(%rbp), %rdx	 ; value, tmp133
	movq	%rdx, (%rax)	 ; tmp133, arg_18->value.label
 ; D:/TC/src/tac.c:254:             break;
	jmp	.L99	 ;
.L90:
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp134
	movq	24(%rbp), %rdx	 ; value, tmp135
	movq	%rdx, (%rax)	 ; tmp135, arg_18->value.subroutine
 ; D:/TC/src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	 ; arg, tmp136
	movq	(%rax), %rax	 ; arg_18->value.subroutine, _11
 ; D:/TC/src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	16(%rax), %rdx	 ; _11->type, _12
 ; D:/TC/src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	 ; arg, tmp137
	movq	%rdx, 8(%rax)	 ; _12, arg_18->type
 ; D:/TC/src/tac.c:259:             break;
	jmp	.L99	 ;
.L89:
 ; D:/TC/src/tac.c:262:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:262:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	24(%rax), %rax	 ; _13->_stderr, _14
 ; D:/TC/src/tac.c:262:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	movl	16(%rbp), %edx	 ; kind, tmp138
	movl	%edx, %r8d	 ; tmp138,
	leaq	.LC6(%rip), %rdx	 ;, tmp139
	movq	%rax, %rcx	 ; _14,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:263:             break;
	nop	
.L99:
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movq	-8(%rbp), %rax	 ; arg, tmp140
	movb	$0, 20(%rax)	 ;, arg_18->is_get
 ; D:/TC/src/tac.c:267:     return arg;
	movq	-8(%rbp), %rax	 ; arg, _41
 ; D:/TC/src/tac.c:268: }
	leave	
	ret	
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; arg, arg
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	cmpq	$0, 16(%rbp)	 ;, arg
	jne	.L102	 ;,
 ; D:/TC/src/tac.c:273:         return NULL;
	movl	$0, %eax	 ;, _7
	jmp	.L103	 ;
.L102:
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	movq	16(%rbp), %rax	 ; arg, tmp90
	movzbl	20(%rax), %eax	 ; arg_9(D)->is_get, _1
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	testb	%al, %al	 ; _1
	je	.L104	 ;,
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	16(%rbp), %rax	 ; arg, tmp91
	movq	8(%rax), %rax	 ; arg_9(D)->type, _2
	movq	24(%rbp), %rdx	 ; status, tmp92
	movq	%rdx, %r9	 ; tmp92,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _2,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _3,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -8(%rbp)	 ; tmp93, temp
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rdx	 ; arg, tmp94
	movq	-8(%rbp), %rax	 ; temp, tmp95
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp94,
	movq	%rax, %rdx	 ; tmp95,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _4
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	24(%rbp), %rax	 ; status, tmp96
	movq	16(%rax), %rax	 ; status_12(D)->current_block, _5
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:/TC/src/tac.c:279:         return temp;
	movq	-8(%rbp), %rax	 ; temp, _7
	jmp	.L103	 ;
.L104:
 ; D:/TC/src/tac.c:282:     return arg;
	movq	16(%rbp), %rax	 ; arg, _7
.L103:
 ; D:/TC/src/tac.c:283: }
	leave	
	ret	
	.section .rdata,"dr"
.LC7:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; code, code
 ; D:/TC/src/tac.c:287:     TAC* tac = create_tac();
	call	create_tac	 ;
	movq	%rax, -8(%rbp)	 ; tmp97, tac
 ; D:/TC/src/tac.c:288:     TACStatus* status = create_tac_status(tac);
	movq	-8(%rbp), %rax	 ; tac, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	create_tac_status	 ;
	movq	%rax, -16(%rbp)	 ; tmp99, status
 ; D:/TC/src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	16(%rbp), %rax	 ; code, tmp100
	movq	(%rax), %rax	 ; code_20(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp101, members
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L106	 ;
.L110:
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movq	-32(%rbp), %rax	 ; code_member, tmp102
	movl	8(%rax), %eax	 ; code_member_24->type, _2
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	jne	.L107	 ;,
 ; D:/TC/src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp103
	movq	(%rax), %rax	 ; code_member_24->content.function, _3
	movq	-16(%rbp), %rdx	 ; status, tmp104
	movq	%rax, %rcx	 ; _3,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	-32(%rbp), %rax	 ; code_member, tmp105
	movq	(%rax), %rax	 ; code_member_24->content.function, _4
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rax	 ; _4->name, _5
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rax), %rax	 ; _5->name, _6
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC7(%rip), %rdx	 ;, tmp106
	movq	%rax, %rcx	 ; _6,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; _7
	jne	.L106	 ;,
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	-32(%rbp), %rax	 ; code_member, tmp107
	movq	(%rax), %rax	 ; code_member_24->content.function, _8
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	(%rax), %rdx	 ; _8->name, _9
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	-8(%rbp), %rax	 ; tac, tmp108
	movq	%rdx, 8(%rax)	 ; _9, tac_17->entry_point
	jmp	.L106	 ;
.L107:
 ; D:/TC/src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	movq	-32(%rbp), %rax	 ; code_member, tmp109
	movl	8(%rax), %eax	 ; code_member_24->type, _10
 ; D:/TC/src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _10
	jne	.L109	 ;,
 ; D:/TC/src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp110
	movq	(%rax), %rax	 ; code_member_24->content.class, _11
	movq	-16(%rbp), %rdx	 ; status, tmp111
	movq	%rax, %rcx	 ; _11,
	call	tac_class	 ;
	jmp	.L106	 ;
.L109:
 ; D:/TC/src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	movq	-32(%rbp), %rax	 ; code_member, tmp112
	movl	8(%rax), %eax	 ; code_member_24->type, _12
 ; D:/TC/src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _12
	jne	.L106	 ;,
 ; D:/TC/src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp113
	movq	(%rax), %rax	 ; code_member_24->content.import, _13
	movq	-16(%rbp), %rcx	 ; status, tmp114
	movq	-8(%rbp), %rdx	 ; tac, tmp115
	movq	%rcx, %r8	 ; tmp114,
	movq	%rax, %rcx	 ; _13,
	call	tac_import	 ;
.L106:
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	 ; members, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp117, code_member
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, code_member
	jne	.L110	 ;,
 ; D:/TC/src/tac.c:303:     return tac;
	movq	-8(%rbp), %rax	 ; tac, _25
 ; D:/TC/src/tac.c:304: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
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
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	16(%rbp), %rax	 ; import, tmp106
	movq	(%rax), %rax	 ; import_27(D)->name, _1
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rax), %eax	 ; _1->kind, _2
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	 ;, _2
	jne	.L113	 ;,
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rbp), %rax	 ; import, tmp107
	movq	(%rax), %rax	 ; import_27(D)->name, _3
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rax), %rdx	 ; _3->type, _4
	movq	16(%rbp), %rax	 ; import, tmp108
	movq	(%rax), %rax	 ; import_27(D)->name, _5
	movq	32(%rbp), %rcx	 ; status, tmp109
	movq	%rcx, %r9	 ; tmp109,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _5,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	24(%rbp), %rax	 ; tac, tmp110
	movq	16(%rax), %rax	 ; tac_33(D)->global_vars, _7
	movq	%rax, %rcx	 ; _7,
	call	list_append	 ;
 ; D:/TC/src/tac.c:317: }
	jmp	.L118	 ;
.L113:
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	16(%rbp), %rax	 ; import, tmp111
	movq	(%rax), %rax	 ; import_27(D)->name, _8
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	 ; _8->kind, _9
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, _9
	je	.L115	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	16(%rbp), %rax	 ; import, tmp112
	movq	(%rax), %rax	 ; import_27(D)->name, _10
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	 ; _10->kind, _11
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _11
	jne	.L116	 ;,
.L115:
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rax	 ; import, tmp113
	movq	(%rax), %rax	 ; import_27(D)->name, _12
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; _12->type, _13
	movq	16(%rbp), %rax	 ; import, tmp114
	movq	(%rax), %rax	 ; import_27(D)->name, _14
	movq	32(%rbp), %rcx	 ; status, tmp115
	movq	%rcx, %r9	 ; tmp115,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; _14,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	24(%rbp), %rax	 ; tac, tmp116
	movq	16(%rax), %rax	 ; tac_33(D)->global_vars, _16
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
 ; D:/TC/src/tac.c:317: }
	jmp	.L118	 ;
.L116:
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	movq	16(%rbp), %rax	 ; import, tmp117
	movq	(%rax), %rax	 ; import_27(D)->name, _17
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _17->kind, _18
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _18
	jne	.L117	 ;,
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	16(%rbp), %rax	 ; import, tmp118
	movq	(%rax), %rax	 ; import_27(D)->name, _19
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rax), %rax	 ; _19->ast_node.class, _20
	movq	32(%rbp), %rdx	 ; status, tmp119
	movq	%rax, %rcx	 ; _20,
	call	tac_class	 ;
 ; D:/TC/src/tac.c:317: }
	jmp	.L118	 ;
.L117:
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	16(%rbp), %rax	 ; import, tmp120
	movq	(%rax), %rax	 ; import_27(D)->name, _21
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	32(%rax), %ebx	 ; _21->kind, _22
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	24(%rax), %rax	 ; _23->_stderr, _24
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _22,
	leaq	.LC8(%rip), %rdx	 ;, tmp121
	movq	%rax, %rcx	 ; _24,
	call	fprintf	 ;
.L118:
 ; D:/TC/src/tac.c:317: }
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
 ; D:/TC/src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	16(%rbp), %rax	 ; function, tmp94
	movq	8(%rax), %rdx	 ; function_16(D)->return_type, _1
	movq	16(%rbp), %rax	 ; function, tmp95
	movq	(%rax), %rax	 ; function_16(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_subroutine	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, subroutine
 ; D:/TC/src/tac.c:322:     status->current_subroutine = subroutine;
	movq	24(%rbp), %rax	 ; status, tmp97
	movq	-8(%rbp), %rdx	 ; subroutine, tmp98
	movq	%rdx, 8(%rax)	 ; tmp98, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rbp), %rax	 ; status, tmp99
	movq	(%rax), %rax	 ; status_19(D)->tac, _3
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	 ; _3->subroutines, _4
	movq	-8(%rbp), %rdx	 ; subroutine, tmp100
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp101
	movq	16(%rax), %rax	 ; function_16(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, parameters
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L120	 ;
.L121:
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
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
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	 ; subroutine, tmp106
	movq	16(%rax), %rax	 ; subroutine_18->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
.L120:
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	 ; parameters, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, parameter
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, parameter
	jne	.L121	 ;,
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	24(%rbp), %rax	 ; status, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rcx	 ; _10,
	call	create_block	 ;
	movq	%rax, -32(%rbp)	 ; tmp110, block
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	 ; subroutine, tmp111
	movq	32(%rax), %rax	 ; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	 ; block, tmp112
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:332:     status->current_block = block;
	movq	24(%rbp), %rax	 ; status, tmp113
	movq	-32(%rbp), %rdx	 ; block, tmp114
	movq	%rdx, 16(%rax)	 ; tmp114, status_19(D)->current_block
 ; D:/TC/src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp115
	movq	24(%rax), %rax	 ; function_16(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -40(%rbp)	 ; tmp116, statements
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L122	 ;
.L123:
 ; D:/TC/src/tac.c:337:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp117
	movq	-48(%rbp), %rax	 ; statement, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	tac_statement	 ;
.L122:
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	 ; statements, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp120, statement
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L123	 ;,
 ; D:/TC/src/tac.c:339:     status->current_subroutine = NULL;
	movq	24(%rbp), %rax	 ; status, tmp121
	movq	$0, 8(%rax)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:341: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$104, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; method, method
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	16(%rbp), %rax	 ; method, tmp127
	movq	8(%rax), %rdx	 ; method_51(D)->return_type, _1
	movq	16(%rbp), %rax	 ; method, tmp128
	movq	(%rax), %rax	 ; method_51(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_subroutine	 ;
	movq	%rax, -24(%rbp)	 ; tmp129, subroutine
 ; D:/TC/src/tac.c:346:     status->current_subroutine = subroutine;
	movq	24(%rbp), %rax	 ; status, tmp130
	movq	-24(%rbp), %rdx	 ; subroutine, tmp131
	movq	%rdx, 8(%rax)	 ; tmp131, status_54(D)->current_subroutine
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	(%rax), %rax	 ; status_54(D)->tac, _3
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	 ; _3->subroutines, _4
	movq	-24(%rbp), %rdx	 ; subroutine, tmp133
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rax	 ; method, tmp134
	movq	16(%rax), %rax	 ; method_51(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -32(%rbp)	 ; tmp135, parameters
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L125	 ;
.L126:
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-40(%rbp), %rax	 ; parameter, tmp136
	movq	(%rax), %rdx	 ; parameter_60->type, _6
	movq	-40(%rbp), %rax	 ; parameter, tmp137
	movq	8(%rax), %rax	 ; parameter_60->name, _7
	movq	24(%rbp), %rcx	 ; status, tmp138
	movq	%rcx, %r9	 ; tmp138,
	movl	$112, %r8d	 ;,
	movq	%rax, %rcx	 ; _7,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-24(%rbp), %rax	 ; subroutine, tmp139
	movq	16(%rax), %rax	 ; subroutine_53->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
.L125:
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-32(%rbp), %rax	 ; parameters, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp141, parameter
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, parameter
	jne	.L126	 ;,
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	24(%rbp), %rax	 ; status, tmp142
	movq	%rax, %r9	 ; tmp142,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rcx	 ; _10,
	call	create_block	 ;
	movq	%rax, -48(%rbp)	 ; tmp143, block
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	-24(%rbp), %rax	 ; subroutine, tmp144
	movq	32(%rax), %rax	 ; subroutine_53->blocks, _11
	movq	-48(%rbp), %rdx	 ; block, tmp145
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:356:     status->current_block = block;
	movq	24(%rbp), %rax	 ; status, tmp146
	movq	-48(%rbp), %rdx	 ; block, tmp147
	movq	%rdx, 16(%rax)	 ; tmp147, status_54(D)->current_block
 ; D:/TC/src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	16(%rbp), %rax	 ; method, tmp148
	movq	24(%rax), %rax	 ; method_51(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -56(%rbp)	 ; tmp149, statements
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp150
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.10_13
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbp), %rax	 ; status, tmp151
	movq	24(%rax), %rax	 ; status_54(D)->current_class, _14
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _14->name, _15
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	 ; _15->name, _16
	movq	%rax, %rcx	 ; _16,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	16(%rbp), %rax	 ; method, tmp152
	movq	(%rax), %rax	 ; method_51(D)->name, _18
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rax	 ; _18->name, _19
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	%rax, %rcx	 ; _19,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; _20
	jne	.L131	 ;,
 ; D:/TC/src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	-56(%rbp), %rax	 ; statements, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	list_pop	 ;
	movq	%rax, -64(%rbp)	 ; tmp154, stmt
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	 ; stmt, tmp155
	movl	8(%rax), %eax	 ; stmt_70->type, _21
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	testl	%eax, %eax	 ; _21
	jne	.L128	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	 ; stmt, tmp156
	movq	(%rax), %rax	 ; stmt_70->stmt.expr, _22
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	24(%rax), %eax	 ; _22->operator, _23
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, %eax	 ;, _23
	jne	.L128	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	 ; stmt, tmp157
	movq	(%rax), %rax	 ; stmt_70->stmt.expr, _24
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _24->prim_left, _25
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	8(%rax), %eax	 ; _25->type, _26
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, %eax	 ;, _26
	jne	.L128	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	-64(%rbp), %rax	 ; stmt, tmp158
	movq	(%rax), %rax	 ; stmt_70->stmt.expr, _27
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _27->prim_left, _28
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _28->value.var, _29
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	16(%rax), %eax	 ; _29->type, _30
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	testl	%eax, %eax	 ; _30
	je	.L129	 ;,
.L128:
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	16(%rbp), %rax	 ; method, tmp159
	movq	(%rax), %rax	 ; method_51(D)->name, _31
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	8(%rax), %rbx	 ; _31->name, _32
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	24(%rax), %rax	 ; _33->_stderr, _34
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	%rbx, %r8	 ; _32,
	leaq	.LC9(%rip), %rdx	 ;, tmp160
	movq	%rax, %rcx	 ; _34,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:363:             return;
	jmp	.L124	 ;
.L129:
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	-64(%rbp), %rax	 ; stmt, tmp161
	movq	(%rax), %rax	 ; stmt_70->stmt.expr, _35
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %rax	 ; _35->prim_left, _36
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	(%rax), %rax	 ; _36->value.var, _37
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %rax	 ; _37->content.name, tmp162
	movq	%rax, -72(%rbp)	 ; tmp162, self
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbp), %rax	 ; status, tmp163
	movq	24(%rax), %rax	 ; status_54(D)->current_class, _38
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	addq	$24, %rax	 ;, _39
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; _39,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _40
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-72(%rbp), %rax	 ; self, tmp164
	movq	(%rax), %rdx	 ; self_71->type, _41
	movq	24(%rbp), %rcx	 ; status, tmp165
	movq	-72(%rbp), %rax	 ; self, tmp166
	movq	%rcx, %r9	 ; tmp165,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp166,
	call	create_var	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; _42,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; _40,
	movq	%rax, %rdx	 ; _43,
	movl	$18, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _44
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	-48(%rbp), %rax	 ; block, tmp167
	movq	8(%rax), %rax	 ; block_63->instructions, _45
	movq	%rax, %rcx	 ; _45,
	call	list_append	 ;
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L131	 ;
.L132:
 ; D:/TC/src/tac.c:371:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp168
	movq	-80(%rbp), %rax	 ; statement, tmp169
	movq	%rax, %rcx	 ; tmp169,
	call	tac_statement	 ;
.L131:
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-56(%rbp), %rax	 ; statements, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	list_pop	 ;
	movq	%rax, -80(%rbp)	 ; tmp171, statement
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -80(%rbp)	 ;, statement
	jne	.L132	 ;,
 ; D:/TC/src/tac.c:373:     status->current_subroutine = NULL;
	movq	24(%rbp), %rax	 ; status, tmp172
	movq	$0, 8(%rax)	 ;, status_54(D)->current_subroutine
.L124:
 ; D:/TC/src/tac.c:375: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
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
 ; D:/TC/src/tac.c:378:     status->current_class = class;
	movq	24(%rbp), %rax	 ; status, tmp92
	movq	16(%rbp), %rdx	 ; class, tmp93
	movq	%rdx, 24(%rax)	 ; tmp93, status_13(D)->current_class
 ; D:/TC/src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	16(%rbp), %rax	 ; class, tmp94
	movq	8(%rax), %rax	 ; class_14(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp95, members
 ; D:/TC/src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	16(%rbp), %rax	 ; class, tmp96
	movq	(%rax), %rax	 ; class_14(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_attribute_table	 ;
	movq	%rax, -32(%rbp)	 ; tmp97, attr_table
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	24(%rbp), %rax	 ; status, tmp98
	movq	(%rax), %rax	 ; status_13(D)->tac, _3
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	 ; _3->attribute_tables, _4
	movq	-32(%rbp), %rdx	 ; attr_table, tmp99
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L134	 ;
.L139:
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	movq	-40(%rbp), %rax	 ; member, tmp100
	movl	8(%rax), %eax	 ; member_22->type, _5
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	testl	%eax, %eax	 ; _5
	je	.L135	 ;,
	cmpl	$1, %eax	 ;, _5
	je	.L136	 ;,
	jmp	.L140	 ;
.L135:
 ; D:/TC/src/tac.c:387:                 tac_method(member->content.method, status);
	movq	-40(%rbp), %rax	 ; member, tmp101
	movq	(%rax), %rax	 ; member_22->content.method, _6
	movq	24(%rbp), %rdx	 ; status, tmp102
	movq	%rax, %rcx	 ; _6,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:388:                 break;
	jmp	.L134	 ;
.L136:
 ; D:/TC/src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	-40(%rbp), %rax	 ; member, tmp103
	movq	(%rax), %rax	 ; member_22->content.variable, _7
	movq	24(%rbp), %rdx	 ; status, tmp104
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; _7,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:391:                 break;
	jmp	.L134	 ;
.L140:
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	-40(%rbp), %rax	 ; member, tmp105
	movl	8(%rax), %ebx	 ; member_22->type, _8
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	24(%rax), %rax	 ; _9->_stderr, _10
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	%ebx, %r8d	 ; _8,
	leaq	.LC10(%rip), %rdx	 ;, tmp106
	movq	%rax, %rcx	 ; _10,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:394:                 break;
	nop	
.L134:
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	 ; members, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp108, member
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	cmpq	$0, -40(%rbp)	 ;, member
	jne	.L139	 ;,
 ; D:/TC/src/tac.c:397:     status->current_class = NULL;
	movq	24(%rbp), %rax	 ; status, tmp109
	movq	$0, 24(%rax)	 ;, status_13(D)->current_class
 ; D:/TC/src/tac.c:399: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable, variable
	movq	%rdx, 24(%rbp)	 ; status, status
	movl	%r8d, %eax	 ; is_attr, tmp97
	movb	%al, 32(%rbp)	 ; tmp98, is_attr
 ; D:/TC/src/tac.c:402:     Var* var = NULL;
	movq	$0, -16(%rbp)	 ;, var
 ; D:/TC/src/tac.c:403:     if (is_attr) {
	cmpb	$0, 32(%rbp)	 ;, is_attr
	je	.L142	 ;,
 ; D:/TC/src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	24(%rbp), %rax	 ; status, tmp99
	movq	(%rax), %rax	 ; status_23(D)->tac, _1
 ; D:/TC/src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rax), %rax	 ; _1->attribute_tables, _2
	movq	%rax, %rcx	 ; _2,
	call	list_pop_back	 ;
	movq	%rax, -24(%rbp)	 ; tmp100, attr_table
 ; D:/TC/src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	24(%rbp), %rax	 ; status, tmp101
	movq	(%rax), %rax	 ; status_23(D)->tac, _3
 ; D:/TC/src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	 ; _3->attribute_tables, _4
	movq	-24(%rbp), %rdx	 ; attr_table, tmp102
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:/TC/src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	16(%rbp), %rax	 ; variable, tmp103
	movq	(%rax), %rdx	 ; variable_22(D)->type, _5
	movq	16(%rbp), %rax	 ; variable, tmp104
	movq	8(%rax), %rax	 ; variable_22(D)->name, _6
	movq	-24(%rbp), %r8	 ; attr_table, tmp105
	movq	24(%rbp), %rcx	 ; status, tmp106
	movq	%rcx, 32(%rsp)	 ; tmp106,
	movl	$0, %r9d	 ;,
	movq	%rax, %rcx	 ; _6,
	call	create_attribute	 ;
 ; D:/TC/src/tac.c:421: }
	jmp	.L146	 ;
.L142:
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	16(%rbp), %rax	 ; variable, tmp107
	movq	(%rax), %rdx	 ; variable_22(D)->type, _7
	movq	16(%rbp), %rax	 ; variable, tmp108
	movq	8(%rax), %rax	 ; variable_22(D)->name, _8
	movq	24(%rbp), %rcx	 ; status, tmp109
	movq	%rcx, %r9	 ; tmp109,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _8,
	call	create_var	 ;
	movq	%rax, -16(%rbp)	 ; tmp110, var
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rbp), %rax	 ; variable, tmp111
	movq	16(%rax), %rax	 ; variable_22(D)->value, _9
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	testq	%rax, %rax	 ; _9
	je	.L144	 ;,
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	16(%rbp), %rax	 ; variable, tmp112
	movq	16(%rax), %rax	 ; variable_22(D)->value, _10
	movq	24(%rbp), %rdx	 ; status, tmp113
	movq	%rax, %rcx	 ; _10,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _11
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	24(%rbp), %rax	 ; status, tmp114
	movq	%rax, %rdx	 ; tmp114,
	call	load_rvalue	 ;
	movq	%rax, -8(%rbp)	 ; tmp115, value
	jmp	.L145	 ;
.L144:
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	$0, -32(%rbp)	 ;, D.5728
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	leaq	-32(%rbp), %rax	 ;, tmp116
	movq	%rax, %rdx	 ; tmp116,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -8(%rbp)	 ; tmp117, value
.L145:
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	-16(%rbp), %rax	 ; var, tmp118
	movq	%rax, %rdx	 ; tmp118,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	-8(%rbp), %rdx	 ; value, tmp119
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp119,
	movq	%rax, %rdx	 ; _12,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	24(%rbp), %rax	 ; status, tmp120
	movq	16(%rax), %rax	 ; status_23(D)->current_block, _14
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	8(%rax), %rax	 ; _14->instructions, _15
	movq	%rax, %rcx	 ; _15,
	call	list_append	 ;
.L146:
 ; D:/TC/src/tac.c:421: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC12:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
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
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	movq	16(%rbp), %rax	 ; statement, tmp114
	movl	8(%rax), %eax	 ; statement_37(D)->type, _1
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %eax	 ;, _1
	ja	.L148	 ;,
	movl	%eax, %eax	 ; _1, tmp115
	leaq	0(,%rax,4), %rdx	 ;, tmp116
	leaq	.L150(%rip), %rax	 ;, tmp117
	movl	(%rdx,%rax), %eax	 ;, tmp118
	cltq
	leaq	.L150(%rip), %rdx	 ;, tmp121
	addq	%rdx, %rax	 ; tmp121, tmp120
	jmp	*%rax	 ; tmp120
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
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	16(%rbp), %rax	 ; statement, tmp122
	movq	(%rax), %rax	 ; statement_37(D)->stmt.expr, _2
	movq	24(%rbp), %rdx	 ; status, tmp123
	movq	%rax, %rcx	 ; _2,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _3
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	24(%rbp), %rax	 ; status, tmp124
	movq	%rax, %rdx	 ; tmp124,
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	jmp	.L158	 ;
.L156:
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	16(%rbp), %rax	 ; statement, tmp125
	movq	(%rax), %rax	 ; statement_37(D)->stmt.var, _4
	movq	24(%rbp), %rdx	 ; status, tmp126
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; _4,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	.L158	 ;
.L155:
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp127
	movq	(%rax), %rax	 ; statement_37(D)->stmt.if_stmt, _5
	movq	24(%rbp), %rdx	 ; status, tmp128
	movq	%rax, %rcx	 ; _5,
	call	tac_if	 ;
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L158	 ;
.L154:
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp129
	movq	(%rax), %rax	 ; statement_37(D)->stmt.while_stmt, _6
	movq	24(%rbp), %rdx	 ; status, tmp130
	movq	%rax, %rcx	 ; _6,
	call	tac_while	 ;
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L158	 ;
.L153:
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp131
	movq	(%rax), %rax	 ; statement_37(D)->stmt.for_stmt, _7
	movq	24(%rbp), %rdx	 ; status, tmp132
	movq	%rax, %rcx	 ; _7,
	call	tac_for	 ;
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L158	 ;
.L152:
 ; D:/TC/src/tac.c:431:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -24(%rbp)	 ; tmp133, return_value
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	16(%rbp), %rax	 ; statement, tmp134
	movq	(%rax), %rax	 ; statement_37(D)->stmt.return_expr, _8
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rax, %rax	 ; _8
	je	.L159	 ;,
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	16(%rbp), %rax	 ; statement, tmp135
	movq	(%rax), %rax	 ; statement_37(D)->stmt.return_expr, _9
	movq	24(%rbp), %rdx	 ; status, tmp136
	movq	%rax, %rcx	 ; _9,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _10
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	24(%rbp), %rax	 ; status, tmp137
	movq	%rax, %rdx	 ; tmp137,
	call	load_rvalue	 ;
	movq	%rax, -24(%rbp)	 ; tmp138, return_value
.L159:
 ; D:/TC/src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	-24(%rbp), %rax	 ; return_value, tmp139
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp139,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _11
 ; D:/TC/src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	24(%rbp), %rax	 ; status, tmp140
	movq	16(%rax), %rax	 ; status_38(D)->current_block, _12
 ; D:/TC/src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:/TC/src/tac.c:435:             break;
	jmp	.L158	 ;
.L151:
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rbp), %rax	 ; status, tmp141
	movq	32(%rax), %rax	 ; status_38(D)->end_labels, _14
	movq	%rax, %rcx	 ; _14,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; _15
	jne	.L160	 ;,
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbp), %rax	 ; status, tmp142
	movq	32(%rax), %rax	 ; status_38(D)->end_labels, _16
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _16->tail, _17
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _17->content, tmp143
	movq	%rax, -48(%rbp)	 ; tmp143, label
 ; D:/TC/src/tac.c:440:                 if (label != NULL) {
	cmpq	$0, -48(%rbp)	 ;, label
	je	.L160	 ;,
 ; D:/TC/src/tac.c:441:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-48(%rbp), %rax	 ; label, tmp144
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp144,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -56(%rbp)	 ; tmp145, inst
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp146
	movq	16(%rax), %rax	 ; status_38(D)->current_block, _18
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _18->instructions, _19
	movq	-56(%rbp), %rdx	 ; inst, tmp147
	movq	%rax, %rcx	 ; _19,
	call	list_append	 ;
 ; D:/TC/src/tac.c:443:                     break;
	jmp	.L158	 ;
.L160:
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movq	24(%rax), %rax	 ; _20->_stderr, _21
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movq	%rax, %r9	 ; _21,
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:447:             break;
	jmp	.L158	 ;
.L149:
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	24(%rbp), %rax	 ; status, tmp149
	movq	40(%rax), %rax	 ; status_38(D)->start_labels, _22
	movq	%rax, %rcx	 ; _22,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; _23
	jne	.L161	 ;,
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	24(%rbp), %rax	 ; status, tmp150
	movq	40(%rax), %rax	 ; status_38(D)->start_labels, _24
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _24->tail, _25
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _25->content, tmp151
	movq	%rax, -32(%rbp)	 ; tmp151, label
 ; D:/TC/src/tac.c:451:                 if (label != NULL) {
	cmpq	$0, -32(%rbp)	 ;, label
	je	.L161	 ;,
 ; D:/TC/src/tac.c:452:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-32(%rbp), %rax	 ; label, tmp152
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp152,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -40(%rbp)	 ; tmp153, inst
 ; D:/TC/src/tac.c:453:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp154
	movq	16(%rax), %rax	 ; status_38(D)->current_block, _26
 ; D:/TC/src/tac.c:453:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _26->instructions, _27
	movq	-40(%rbp), %rdx	 ; inst, tmp155
	movq	%rax, %rcx	 ; _27,
	call	list_append	 ;
 ; D:/TC/src/tac.c:454:                     break;
	jmp	.L158	 ;
.L161:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movq	24(%rax), %rax	 ; _28->_stderr, _29
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movq	%rax, %r9	 ; _29,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:458:             break;
	jmp	.L158	 ;
.L148:
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	16(%rbp), %rax	 ; statement, tmp157
	movl	8(%rax), %ebx	 ; statement_37(D)->type, _30
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	24(%rax), %rax	 ; _31->_stderr, _32
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _30,
	leaq	.LC13(%rip), %rdx	 ;, tmp158
	movq	%rax, %rcx	 ; _32,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:461:             break;
	nop	
.L158:
 ; D:/TC/src/tac.c:464: }
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
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp125
	movq	%rax, %r9	 ; tmp125,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp126, then_label
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp127
	movq	%rax, %r9	 ; tmp127,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp128, else_label
 ; D:/TC/src/tac.c:470:     Var* end_label = NULL;
	movq	$0, -32(%rbp)	 ;, end_label
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp129
	movq	16(%rax), %rax	 ; if__64(D)->else_if, _1
	movq	%rax, %rcx	 ; _1,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _2
	je	.L163	 ;,
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp130
	movq	24(%rax), %rax	 ; if__64(D)->else_body, _3
	movq	%rax, %rcx	 ; _3,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _4
	je	.L163	 ;,
 ; D:/TC/src/tac.c:472:         end_label = else_label;
	movq	-24(%rbp), %rax	 ; else_label, tmp131
	movq	%rax, -32(%rbp)	 ; tmp131, end_label
	jmp	.L164	 ;
.L163:
 ; D:/TC/src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	%rax, %r9	 ; tmp132,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -32(%rbp)	 ; tmp133, end_label
.L164:
 ; D:/TC/src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	-32(%rbp), %rax	 ; end_label, tmp134
	movq	%rax, %rdx	 ; tmp134,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp135, end_block_arg
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	16(%rbp), %rax	 ; if_, tmp136
	movq	(%rax), %rax	 ; if__64(D)->condition, _5
	movq	24(%rbp), %rdx	 ; status, tmp137
	movq	%rax, %rcx	 ; _5,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _6
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	24(%rbp), %rax	 ; status, tmp138
	movq	%rax, %rdx	 ; tmp138,
	call	load_rvalue	 ;
	movq	%rax, -56(%rbp)	 ; tmp139, condition
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	 ; else_label, tmp140
	movq	%rax, %rdx	 ; tmp140,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _7
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	 ; then_label, tmp141
	movq	%rax, %rdx	 ; tmp141,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	 ; condition, tmp142
	movq	%rbx, %r9	 ; _7,
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp142,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp143, inst
 ; D:/TC/src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp144
	movq	16(%rax), %rax	 ; status_58(D)->current_block, _9
 ; D:/TC/src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _9->instructions, _10
	movq	-64(%rbp), %rdx	 ; inst, tmp145
	movq	%rax, %rcx	 ; _10,
	call	list_append	 ;
 ; D:/TC/src/tac.c:481:     Block* then_block = create_block(then_label);
	movq	-40(%rbp), %rax	 ; then_label, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp147, then_block
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	8(%rax), %rax	 ; status_58(D)->current_subroutine, _11
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	 ; _11->blocks, _12
	movq	-72(%rbp), %rdx	 ; then_block, tmp149
	movq	%rax, %rcx	 ; _12,
	call	list_append	 ;
 ; D:/TC/src/tac.c:483:     status->current_block = then_block;
	movq	24(%rbp), %rax	 ; status, tmp150
	movq	-72(%rbp), %rdx	 ; then_block, tmp151
	movq	%rdx, 16(%rax)	 ; tmp151, status_58(D)->current_block
 ; D:/TC/src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	16(%rbp), %rax	 ; if_, tmp152
	movq	8(%rax), %rax	 ; if__64(D)->body, _13
	movq	%rax, %rcx	 ; _13,
	call	list_copy	 ;
	movq	%rax, -80(%rbp)	 ; tmp153, then_statements
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L165	 ;
.L166:
 ; D:/TC/src/tac.c:488:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp154
	movq	-88(%rbp), %rax	 ; statement, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	tac_statement	 ;
.L165:
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	-80(%rbp), %rax	 ; then_statements, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	list_pop	 ;
	movq	%rax, -88(%rbp)	 ; tmp157, statement
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L166	 ;,
 ; D:/TC/src/tac.c:490:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp158
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp158,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp159, jump_to_end
 ; D:/TC/src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp160
	movq	16(%rax), %rax	 ; status_58(D)->current_block, _14
 ; D:/TC/src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _14->instructions, _15
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp161
	movq	%rax, %rcx	 ; _15,
	call	list_append	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%rbp), %rax	 ; if_, tmp162
	movq	16(%rax), %rax	 ; if__64(D)->else_if, _16
	movq	%rax, %rcx	 ; _16,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; _17
	jne	.L167	 ;,
 ; D:/TC/src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%rbp), %rax	 ; if_, tmp163
	movq	16(%rax), %rax	 ; if__64(D)->else_if, _18
	movq	%rax, %rcx	 ; _18,
	call	list_copy	 ;
	movq	%rax, -104(%rbp)	 ; tmp164, elif_list
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L168	 ;
.L172:
 ; D:/TC/src/tac.c:499:             Block* else_if_block = create_block(else_label);
	movq	-24(%rbp), %rax	 ; else_label, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	create_block	 ;
	movq	%rax, -120(%rbp)	 ; tmp166, else_if_block
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	24(%rbp), %rax	 ; status, tmp167
	movq	8(%rax), %rax	 ; status_58(D)->current_subroutine, _19
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	32(%rax), %rax	 ; _19->blocks, _20
	movq	-120(%rbp), %rdx	 ; else_if_block, tmp168
	movq	%rax, %rcx	 ; _20,
	call	list_append	 ;
 ; D:/TC/src/tac.c:501:             status->current_block = else_if_block;
	movq	24(%rbp), %rax	 ; status, tmp169
	movq	-120(%rbp), %rdx	 ; else_if_block, tmp170
	movq	%rdx, 16(%rax)	 ; tmp170, status_58(D)->current_block
 ; D:/TC/src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp171
	movq	%rax, %r9	 ; tmp171,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp172, then_label
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp173
	movq	%rax, %r9	 ; tmp173,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp174, else_label
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	-112(%rbp), %rax	 ; elif, tmp175
	movq	(%rax), %rax	 ; elif_95->condition, _21
	movq	24(%rbp), %rdx	 ; status, tmp176
	movq	%rax, %rcx	 ; _21,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _22
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	24(%rbp), %rax	 ; status, tmp177
	movq	%rax, %rdx	 ; tmp177,
	call	load_rvalue	 ;
	movq	%rax, -56(%rbp)	 ; tmp178, condition
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-104(%rbp), %rax	 ; elif_list, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _23
	je	.L169	 ;,
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp180
	movq	24(%rax), %rax	 ; if__64(D)->else_body, _24
	movq	%rax, %rcx	 ; _24,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _25
	je	.L169	 ;,
 ; D:/TC/src/tac.c:508:                 else_label = end_label;
	movq	-32(%rbp), %rax	 ; end_label, tmp181
	movq	%rax, -24(%rbp)	 ; tmp181, else_label
.L169:
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	 ; else_label, tmp182
	movq	%rax, %rdx	 ; tmp182,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _26
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	 ; then_label, tmp183
	movq	%rax, %rdx	 ; tmp183,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	 ; condition, tmp184
	movq	%rbx, %r9	 ; _26,
	movq	%rdx, %r8	 ; _27,
	movq	%rax, %rdx	 ; tmp184,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp185, inst
 ; D:/TC/src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp186
	movq	16(%rax), %rax	 ; status_58(D)->current_block, _28
 ; D:/TC/src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _28->instructions, _29
	movq	-64(%rbp), %rdx	 ; inst, tmp187
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:/TC/src/tac.c:512:             then_block = create_block(then_label);
	movq	-40(%rbp), %rax	 ; then_label, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp189, then_block
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	24(%rbp), %rax	 ; status, tmp190
	movq	8(%rax), %rax	 ; status_58(D)->current_subroutine, _30
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	 ; _30->blocks, _31
	movq	-72(%rbp), %rdx	 ; then_block, tmp191
	movq	%rax, %rcx	 ; _31,
	call	list_append	 ;
 ; D:/TC/src/tac.c:514:             status->current_block = then_block;
	movq	24(%rbp), %rax	 ; status, tmp192
	movq	-72(%rbp), %rdx	 ; then_block, tmp193
	movq	%rdx, 16(%rax)	 ; tmp193, status_58(D)->current_block
 ; D:/TC/src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	-112(%rbp), %rax	 ; elif, tmp194
	movq	8(%rax), %rax	 ; elif_95->body, _32
	movq	%rax, %rcx	 ; _32,
	call	list_copy	 ;
	movq	%rax, -128(%rbp)	 ; tmp195, elif_statements
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L170	 ;
.L171:
 ; D:/TC/src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp196
	movq	-136(%rbp), %rax	 ; elif_statement, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	tac_statement	 ;
.L170:
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	-128(%rbp), %rax	 ; elif_statements, tmp198
	movq	%rax, %rcx	 ; tmp198,
	call	list_pop	 ;
	movq	%rax, -136(%rbp)	 ; tmp199, elif_statement
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	cmpq	$0, -136(%rbp)	 ;, elif_statement
	jne	.L171	 ;,
 ; D:/TC/src/tac.c:521:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp200
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp200,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp201, jump_to_end
 ; D:/TC/src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp202
	movq	16(%rax), %rax	 ; status_58(D)->current_block, _33
 ; D:/TC/src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _33->instructions, _34
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp203
	movq	%rax, %rcx	 ; _34,
	call	list_append	 ;
.L168:
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	-104(%rbp), %rax	 ; elif_list, tmp204
	movq	%rax, %rcx	 ; tmp204,
	call	list_pop	 ;
	movq	%rax, -112(%rbp)	 ; tmp205, elif
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	cmpq	$0, -112(%rbp)	 ;, elif
	jne	.L172	 ;,
.L167:
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	16(%rbp), %rax	 ; if_, tmp206
	movq	24(%rax), %rax	 ; if__64(D)->else_body, _35
	movq	%rax, %rcx	 ; _35,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; _36
	jne	.L173	 ;,
 ; D:/TC/src/tac.c:528:         Block* else_block = create_block(else_label);
	movq	-24(%rbp), %rax	 ; else_label, tmp207
	movq	%rax, %rcx	 ; tmp207,
	call	create_block	 ;
	movq	%rax, -144(%rbp)	 ; tmp208, else_block
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	24(%rbp), %rax	 ; status, tmp209
	movq	8(%rax), %rax	 ; status_58(D)->current_subroutine, _37
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	32(%rax), %rax	 ; _37->blocks, _38
	movq	-144(%rbp), %rdx	 ; else_block, tmp210
	movq	%rax, %rcx	 ; _38,
	call	list_append	 ;
 ; D:/TC/src/tac.c:530:         status->current_block = else_block;
	movq	24(%rbp), %rax	 ; status, tmp211
	movq	-144(%rbp), %rdx	 ; else_block, tmp212
	movq	%rdx, 16(%rax)	 ; tmp212, status_58(D)->current_block
 ; D:/TC/src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	16(%rbp), %rax	 ; if_, tmp213
	movq	24(%rax), %rax	 ; if__64(D)->else_body, _39
	movq	%rax, %rcx	 ; _39,
	call	list_copy	 ;
	movq	%rax, -152(%rbp)	 ; tmp214, else_statements
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L174	 ;
.L175:
 ; D:/TC/src/tac.c:535:             tac_statement(else_statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp215
	movq	-160(%rbp), %rax	 ; else_statement, tmp216
	movq	%rax, %rcx	 ; tmp216,
	call	tac_statement	 ;
.L174:
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	-152(%rbp), %rax	 ; else_statements, tmp217
	movq	%rax, %rcx	 ; tmp217,
	call	list_pop	 ;
	movq	%rax, -160(%rbp)	 ; tmp218, else_statement
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	cmpq	$0, -160(%rbp)	 ;, else_statement
	jne	.L175	 ;,
 ; D:/TC/src/tac.c:537:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp219
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp219,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp220, jump_to_end
 ; D:/TC/src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp221
	movq	16(%rax), %rax	 ; status_58(D)->current_block, _40
 ; D:/TC/src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _40->instructions, _41
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp222
	movq	%rax, %rcx	 ; _41,
	call	list_append	 ;
.L173:
 ; D:/TC/src/tac.c:541:     Block* end_block = create_block(end_label);
	movq	-32(%rbp), %rax	 ; end_label, tmp223
	movq	%rax, %rcx	 ; tmp223,
	call	create_block	 ;
	movq	%rax, -168(%rbp)	 ; tmp224, end_block
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp225
	movq	8(%rax), %rax	 ; status_58(D)->current_subroutine, _42
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _42->blocks, _43
	movq	-168(%rbp), %rdx	 ; end_block, tmp226
	movq	%rax, %rcx	 ; _43,
	call	list_append	 ;
 ; D:/TC/src/tac.c:543:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp227
	movq	-168(%rbp), %rdx	 ; end_block, tmp228
	movq	%rdx, 16(%rax)	 ; tmp228, status_58(D)->current_block
 ; D:/TC/src/tac.c:545: }
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
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp129
	movq	(%rax), %rax	 ; for__56(D)->initializer, _1
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rax, %rax	 ; _1
	je	.L177	 ;,
 ; D:/TC/src/tac.c:550:         tac_variable(for_->initializer, status, false);
	movq	16(%rbp), %rax	 ; for_, tmp130
	movq	(%rax), %rax	 ; for__56(D)->initializer, _2
	movq	24(%rbp), %rdx	 ; status, tmp131
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; _2,
	call	tac_variable	 ;
.L177:
 ; D:/TC/src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	%rax, %r9	 ; tmp132,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -32(%rbp)	 ; tmp133, condition_label
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp134
	movq	%rax, %r9	 ; tmp134,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp135, body_label
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp136
	movq	%rax, %r9	 ; tmp136,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -48(%rbp)	 ; tmp137, end_label
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp138
	movq	8(%rax), %rax	 ; for__56(D)->condition, _3
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	testq	%rax, %rax	 ; _3
	je	.L178	 ;,
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	 ; condition_label, tmp139
	movq	%rax, %rdx	 ; tmp139,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _4,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp140, inst
 ; D:/TC/src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp141
	movq	16(%rax), %rax	 ; status_57(D)->current_block, _5
 ; D:/TC/src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	-64(%rbp), %rdx	 ; inst, tmp142
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:/TC/src/tac.c:559:         Block* condition_block = create_block(condition_label);
	movq	-32(%rbp), %rax	 ; condition_label, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp144, condition_block
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	24(%rbp), %rax	 ; status, tmp145
	movq	8(%rax), %rax	 ; status_57(D)->current_subroutine, _7
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	 ; _7->blocks, _8
	movq	-72(%rbp), %rdx	 ; condition_block, tmp146
	movq	%rax, %rcx	 ; _8,
	call	list_append	 ;
 ; D:/TC/src/tac.c:561:         status->current_block = condition_block;
	movq	24(%rbp), %rax	 ; status, tmp147
	movq	-72(%rbp), %rdx	 ; condition_block, tmp148
	movq	%rdx, 16(%rax)	 ; tmp148, status_57(D)->current_block
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	16(%rbp), %rax	 ; for_, tmp149
	movq	8(%rax), %rax	 ; for__56(D)->condition, _9
	movq	24(%rbp), %rdx	 ; status, tmp150
	movq	%rax, %rcx	 ; _9,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _10
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	24(%rbp), %rax	 ; status, tmp151
	movq	%rax, %rdx	 ; tmp151,
	call	load_rvalue	 ;
	movq	%rax, -80(%rbp)	 ; tmp152, condition
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; end_label, tmp153
	movq	%rax, %rdx	 ; tmp153,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _11
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-40(%rbp), %rax	 ; body_label, tmp154
	movq	%rax, %rdx	 ; tmp154,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _12
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-80(%rbp), %rax	 ; condition, tmp155
	movq	%rbx, %r9	 ; _11,
	movq	%rdx, %r8	 ; _12,
	movq	%rax, %rdx	 ; tmp155,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp156, inst
 ; D:/TC/src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp157
	movq	16(%rax), %rax	 ; status_57(D)->current_block, _13
 ; D:/TC/src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _13->instructions, _14
	movq	-64(%rbp), %rdx	 ; inst, tmp158
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
	jmp	.L179	 ;
.L178:
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	 ; body_label, tmp159
	movq	%rax, %rdx	 ; tmp159,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _15,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -56(%rbp)	 ; tmp160, inst
 ; D:/TC/src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp161
	movq	16(%rax), %rax	 ; status_57(D)->current_block, _16
 ; D:/TC/src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _16->instructions, _17
	movq	-56(%rbp), %rdx	 ; inst, tmp162
	movq	%rax, %rcx	 ; _17,
	call	list_append	 ;
.L179:
 ; D:/TC/src/tac.c:572:     Block* body_block = create_block(body_label);
	movq	-40(%rbp), %rax	 ; body_label, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	create_block	 ;
	movq	%rax, -88(%rbp)	 ; tmp164, body_block
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	24(%rbp), %rax	 ; status, tmp165
	movq	8(%rax), %rax	 ; status_57(D)->current_subroutine, _18
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	 ; _18->blocks, _19
	movq	-88(%rbp), %rdx	 ; body_block, tmp166
	movq	%rax, %rcx	 ; _19,
	call	list_append	 ;
 ; D:/TC/src/tac.c:574:     status->current_block = body_block;
	movq	24(%rbp), %rax	 ; status, tmp167
	movq	-88(%rbp), %rdx	 ; body_block, tmp168
	movq	%rdx, 16(%rax)	 ; tmp168, status_57(D)->current_block
 ; D:/TC/src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp169
	movq	%rax, %r9	 ; tmp169,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -96(%rbp)	 ; tmp170, increment_label
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp171
	movq	16(%rax), %rax	 ; for__56(D)->increment, _20
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	testq	%rax, %rax	 ; _20
	je	.L180	 ;,
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-96(%rbp), %rax	 ; increment_label, tmp172
	movq	%rax, %rdx	 ; tmp172,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _21
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	24(%rbp), %rax	 ; status, tmp173
	movq	40(%rax), %rax	 ; status_57(D)->start_labels, _22
	movq	%rax, %rcx	 ; _22,
	call	list_append	 ;
	jmp	.L181	 ;
.L180:
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp174
	movq	8(%rax), %rax	 ; for__56(D)->condition, _23
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	testq	%rax, %rax	 ; _23
	je	.L182	 ;,
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-32(%rbp), %rax	 ; condition_label, tmp175
	movq	%rax, %rdx	 ; tmp175,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _24
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	24(%rbp), %rax	 ; status, tmp176
	movq	40(%rax), %rax	 ; status_57(D)->start_labels, _25
	movq	%rax, %rcx	 ; _25,
	call	list_append	 ;
	jmp	.L181	 ;
.L182:
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-40(%rbp), %rax	 ; body_label, tmp177
	movq	%rax, %rdx	 ; tmp177,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _26
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	24(%rbp), %rax	 ; status, tmp178
	movq	40(%rax), %rax	 ; status_57(D)->start_labels, _27
	movq	%rax, %rcx	 ; _27,
	call	list_append	 ;
.L181:
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; end_label, tmp179
	movq	%rax, %rdx	 ; tmp179,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _28
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbp), %rax	 ; status, tmp180
	movq	32(%rax), %rax	 ; status_57(D)->end_labels, _29
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:/TC/src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	16(%rbp), %rax	 ; for_, tmp181
	movq	24(%rax), %rax	 ; for__56(D)->body, _30
	movq	%rax, %rcx	 ; _30,
	call	list_copy	 ;
	movq	%rax, -104(%rbp)	 ; tmp182, body_statements
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L183	 ;
.L184:
 ; D:/TC/src/tac.c:587:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp183
	movq	-112(%rbp), %rax	 ; statement, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	tac_statement	 ;
.L183:
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-104(%rbp), %rax	 ; body_statements, tmp185
	movq	%rax, %rcx	 ; tmp185,
	call	list_pop	 ;
	movq	%rax, -112(%rbp)	 ; tmp186, statement
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -112(%rbp)	 ;, statement
	jne	.L184	 ;,
 ; D:/TC/src/tac.c:588:     list_pop_back(status->start_labels);
	movq	24(%rbp), %rax	 ; status, tmp187
	movq	40(%rax), %rax	 ; status_57(D)->start_labels, _31
	movq	%rax, %rcx	 ; _31,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:589:     list_pop_back(status->end_labels);
	movq	24(%rbp), %rax	 ; status, tmp188
	movq	32(%rax), %rax	 ; status_57(D)->end_labels, _32
	movq	%rax, %rcx	 ; _32,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:590:     if (for_->increment != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp189
	movq	16(%rax), %rax	 ; for__56(D)->increment, _33
 ; D:/TC/src/tac.c:590:     if (for_->increment != NULL) {
	testq	%rax, %rax	 ; _33
	je	.L185	 ;,
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	-96(%rbp), %rax	 ; increment_label, tmp190
	movq	%rax, %rdx	 ; tmp190,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _34,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -120(%rbp)	 ; tmp191, inst
 ; D:/TC/src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp192
	movq	16(%rax), %rax	 ; status_57(D)->current_block, _35
 ; D:/TC/src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _35->instructions, _36
	movq	-120(%rbp), %rdx	 ; inst, tmp193
	movq	%rax, %rcx	 ; _36,
	call	list_append	 ;
 ; D:/TC/src/tac.c:594:         Block* increment_block = create_block(increment_label);
	movq	-96(%rbp), %rax	 ; increment_label, tmp194
	movq	%rax, %rcx	 ; tmp194,
	call	create_block	 ;
	movq	%rax, -128(%rbp)	 ; tmp195, increment_block
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	24(%rbp), %rax	 ; status, tmp196
	movq	8(%rax), %rax	 ; status_57(D)->current_subroutine, _37
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	32(%rax), %rax	 ; _37->blocks, _38
	movq	-128(%rbp), %rdx	 ; increment_block, tmp197
	movq	%rax, %rcx	 ; _38,
	call	list_append	 ;
 ; D:/TC/src/tac.c:596:         status->current_block = increment_block;
	movq	24(%rbp), %rax	 ; status, tmp198
	movq	-128(%rbp), %rdx	 ; increment_block, tmp199
	movq	%rdx, 16(%rax)	 ; tmp199, status_57(D)->current_block
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rbp), %rax	 ; for_, tmp200
	movq	16(%rax), %rax	 ; for__56(D)->increment, _39
	movq	24(%rbp), %rdx	 ; status, tmp201
	movq	%rax, %rcx	 ; _39,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _40
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	24(%rbp), %rax	 ; status, tmp202
	movq	%rax, %rdx	 ; tmp202,
	call	load_rvalue	 ;
.L185:
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	 ; condition_label, tmp203
	movq	%rax, %rdx	 ; tmp203,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _41,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp204, inst
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	movq	16(%rbp), %rax	 ; for_, tmp205
	movq	8(%rax), %rax	 ; for__56(D)->condition, _42
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	testq	%rax, %rax	 ; _42
	jne	.L186	 ;,
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	 ; body_label, tmp206
	movq	%rax, %rdx	 ; tmp206,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _43,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp207, inst
.L186:
 ; D:/TC/src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp208
	movq	16(%rax), %rax	 ; status_57(D)->current_block, _44
 ; D:/TC/src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _44->instructions, _45
	movq	-24(%rbp), %rdx	 ; inst, tmp209
	movq	%rax, %rcx	 ; _45,
	call	list_append	 ;
 ; D:/TC/src/tac.c:605:     Block* end_block = create_block(end_label);
	movq	-48(%rbp), %rax	 ; end_label, tmp210
	movq	%rax, %rcx	 ; tmp210,
	call	create_block	 ;
	movq	%rax, -136(%rbp)	 ; tmp211, end_block
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp212
	movq	8(%rax), %rax	 ; status_57(D)->current_subroutine, _46
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _46->blocks, _47
	movq	-136(%rbp), %rdx	 ; end_block, tmp213
	movq	%rax, %rcx	 ; _47,
	call	list_append	 ;
 ; D:/TC/src/tac.c:607:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp214
	movq	-136(%rbp), %rdx	 ; end_block, tmp215
	movq	%rdx, 16(%rax)	 ; tmp215, status_57(D)->current_block
 ; D:/TC/src/tac.c:609: }
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
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp107
	movq	%rax, %r9	 ; tmp107,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, condition_label
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	 ; condition_label, tmp109
	movq	%rax, %rdx	 ; tmp109,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _1,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp110, inst
 ; D:/TC/src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp111
	movq	16(%rax), %rax	 ; status_28(D)->current_block, _2
 ; D:/TC/src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _2->instructions, _3
	movq	-32(%rbp), %rdx	 ; inst, tmp112
	movq	%rax, %rcx	 ; _3,
	call	list_append	 ;
 ; D:/TC/src/tac.c:616:     Block* condition_block = create_block(condition_label);
	movq	-24(%rbp), %rax	 ; condition_label, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	create_block	 ;
	movq	%rax, -40(%rbp)	 ; tmp114, condition_block
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	24(%rbp), %rax	 ; status, tmp115
	movq	8(%rax), %rax	 ; status_28(D)->current_subroutine, _4
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	 ; _4->blocks, _5
	movq	-40(%rbp), %rdx	 ; condition_block, tmp116
	movq	%rax, %rcx	 ; _5,
	call	list_append	 ;
 ; D:/TC/src/tac.c:618:     status->current_block = condition_block;
	movq	24(%rbp), %rax	 ; status, tmp117
	movq	-40(%rbp), %rdx	 ; condition_block, tmp118
	movq	%rdx, 16(%rax)	 ; tmp118, status_28(D)->current_block
 ; D:/TC/src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -48(%rbp)	 ; tmp120, body_label
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp121
	movq	%rax, %r9	 ; tmp121,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -56(%rbp)	 ; tmp122, end_label
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	16(%rbp), %rax	 ; while_, tmp123
	movq	(%rax), %rax	 ; while__43(D)->condition, _6
	movq	24(%rbp), %rdx	 ; status, tmp124
	movq	%rax, %rcx	 ; _6,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _7
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	24(%rbp), %rax	 ; status, tmp125
	movq	%rax, %rdx	 ; tmp125,
	call	load_rvalue	 ;
	movq	%rax, -64(%rbp)	 ; tmp126, condition
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	 ; end_label, tmp127
	movq	%rax, %rdx	 ; tmp127,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _8
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; body_label, tmp128
	movq	%rax, %rdx	 ; tmp128,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _9
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-64(%rbp), %rax	 ; condition, tmp129
	movq	%rbx, %r9	 ; _8,
	movq	%rdx, %r8	 ; _9,
	movq	%rax, %rdx	 ; tmp129,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp130, inst
 ; D:/TC/src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp131
	movq	16(%rax), %rax	 ; status_28(D)->current_block, _10
 ; D:/TC/src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _10->instructions, _11
	movq	-32(%rbp), %rdx	 ; inst, tmp132
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:/TC/src/tac.c:626:     Block* body_block = create_block(body_label);
	movq	-48(%rbp), %rax	 ; body_label, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp134, body_block
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	24(%rbp), %rax	 ; status, tmp135
	movq	8(%rax), %rax	 ; status_28(D)->current_subroutine, _12
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	 ; _12->blocks, _13
	movq	-72(%rbp), %rdx	 ; body_block, tmp136
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     status->current_block = body_block;
	movq	24(%rbp), %rax	 ; status, tmp137
	movq	-72(%rbp), %rdx	 ; body_block, tmp138
	movq	%rdx, 16(%rax)	 ; tmp138, status_28(D)->current_block
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-24(%rbp), %rax	 ; condition_label, tmp139
	movq	%rax, %rdx	 ; tmp139,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _14
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	24(%rbp), %rax	 ; status, tmp140
	movq	40(%rax), %rax	 ; status_28(D)->start_labels, _15
	movq	%rax, %rcx	 ; _15,
	call	list_append	 ;
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	 ; end_label, tmp141
	movq	%rax, %rdx	 ; tmp141,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _16
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbp), %rax	 ; status, tmp142
	movq	32(%rax), %rax	 ; status_28(D)->end_labels, _17
	movq	%rax, %rcx	 ; _17,
	call	list_append	 ;
 ; D:/TC/src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	16(%rbp), %rax	 ; while_, tmp143
	movq	8(%rax), %rax	 ; while__43(D)->body, _18
	movq	%rax, %rcx	 ; _18,
	call	list_copy	 ;
	movq	%rax, -80(%rbp)	 ; tmp144, body_statements
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L188	 ;
.L189:
 ; D:/TC/src/tac.c:635:         tac_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp145
	movq	-88(%rbp), %rax	 ; statement, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	tac_statement	 ;
.L188:
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-80(%rbp), %rax	 ; body_statements, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	list_pop	 ;
	movq	%rax, -88(%rbp)	 ; tmp148, statement
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L189	 ;,
 ; D:/TC/src/tac.c:636:     list_pop_back(status->start_labels);
	movq	24(%rbp), %rax	 ; status, tmp149
	movq	40(%rax), %rax	 ; status_28(D)->start_labels, _19
	movq	%rax, %rcx	 ; _19,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:637:     list_pop_back(status->end_labels);
	movq	24(%rbp), %rax	 ; status, tmp150
	movq	32(%rax), %rax	 ; status_28(D)->end_labels, _20
	movq	%rax, %rcx	 ; _20,
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	 ; condition_label, tmp151
	movq	%rax, %rdx	 ; tmp151,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _21,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp152, inst
 ; D:/TC/src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp153
	movq	16(%rax), %rax	 ; status_28(D)->current_block, _22
 ; D:/TC/src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _22->instructions, _23
	movq	-32(%rbp), %rdx	 ; inst, tmp154
	movq	%rax, %rcx	 ; _23,
	call	list_append	 ;
 ; D:/TC/src/tac.c:642:     Block* end_block = create_block(end_label);
	movq	-56(%rbp), %rax	 ; end_label, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	create_block	 ;
	movq	%rax, -96(%rbp)	 ; tmp156, end_block
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp157
	movq	8(%rax), %rax	 ; status_28(D)->current_subroutine, _24
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _24->blocks, _25
	movq	-96(%rbp), %rdx	 ; end_block, tmp158
	movq	%rax, %rcx	 ; _25,
	call	list_append	 ;
 ; D:/TC/src/tac.c:644:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp159
	movq	-96(%rbp), %rdx	 ; end_block, tmp160
	movq	%rdx, 16(%rax)	 ; tmp160, status_28(D)->current_block
 ; D:/TC/src/tac.c:646: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC14:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; expression, expression
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:649:     if (expression->operator == OP_NONE) {
	movq	16(%rbp), %rax	 ; expression, tmp106
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _1
 ; D:/TC/src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	jne	.L191	 ;,
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	16(%rbp), %rax	 ; expression, tmp107
	movq	8(%rax), %rax	 ; expression_32(D)->prim_left, _2
	movq	24(%rbp), %rdx	 ; status, tmp108
	movq	%rax, %rcx	 ; _2,
	call	tac_primary	 ;
	movq	%rax, -56(%rbp)	 ; tmp109, result
 ; D:/TC/src/tac.c:652:         return result;
	movq	-56(%rbp), %rax	 ; result, _26
	jmp	.L192	 ;
.L191:
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rbp), %rax	 ; expression, tmp110
	movq	16(%rax), %rax	 ; expression_32(D)->right, _3
	movq	24(%rbp), %rdx	 ; status, tmp111
	movq	%rax, %rcx	 ; _3,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _4
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	24(%rbp), %rax	 ; status, tmp112
	movq	%rax, %rdx	 ; tmp112,
	call	load_rvalue	 ;
	movq	%rax, -8(%rbp)	 ; tmp113, right
 ; D:/TC/src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movq	16(%rbp), %rax	 ; expression, tmp114
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _5
	movl	%eax, %ecx	 ; _5,
	call	get_instruction_type	 ;
	movl	%eax, -20(%rbp)	 ; tmp115, op
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	16(%rbp), %rax	 ; expression, tmp116
	movq	(%rax), %rax	 ; expression_32(D)->expr_left, _6
	movq	24(%rbp), %rdx	 ; status, tmp117
	movq	%rax, %rcx	 ; _6,
	call	tac_expression	 ;
	movq	%rax, -32(%rbp)	 ; tmp118, left
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	movq	16(%rbp), %rax	 ; expression, tmp119
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _7
	movl	%eax, %ecx	 ; _7,
	call	is_assignment_operator	 ;
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	testb	%al, %al	 ; _8
	je	.L193	 ;,
 ; D:/TC/src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, -20(%rbp)	 ;, op
	je	.L194	 ;,
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; left, tmp120
	movq	8(%rax), %rax	 ; left_40->type, _9
	movq	24(%rbp), %rdx	 ; status, tmp121
	movq	%rdx, %r9	 ; tmp121,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _9,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _10,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp122, temp
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	24(%rbp), %rdx	 ; status, tmp123
	movq	-32(%rbp), %rax	 ; left, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ;, _11
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %r8	 ; right, tmp125
	movq	-48(%rbp), %rdx	 ; temp, tmp126
	movl	-20(%rbp), %eax	 ; op, tmp127
	movq	%r8, %r9	 ; tmp125,
	movq	%rcx, %r8	 ; _11,
	movl	%eax, %ecx	 ; tmp127,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp128, inst
 ; D:/TC/src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp129
	movq	16(%rax), %rax	 ; status_33(D)->current_block, _12
 ; D:/TC/src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-16(%rbp), %rdx	 ; inst, tmp130
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:/TC/src/tac.c:663:             right = temp;
	movq	-48(%rbp), %rax	 ; temp, tmp131
	movq	%rax, -8(%rbp)	 ; tmp131, right
.L194:
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movq	-32(%rbp), %rax	 ; left, tmp132
	movl	16(%rax), %eax	 ; left_40->kind, _14
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	testl	%eax, %eax	 ; _14
	je	.L195	 ;,
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movq	%rax, %r9	 ; _16,
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	fwrite	 ;
.L195:
 ; D:/TC/src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	-8(%rbp), %rdx	 ; right, tmp134
	movq	-32(%rbp), %rax	 ; left, tmp135
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp134,
	movq	%rax, %rdx	 ; tmp135,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp136, inst
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	movq	-32(%rbp), %rax	 ; left, tmp137
	movzbl	20(%rax), %eax	 ; left_40->is_get, _17
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	testb	%al, %al	 ; _17
	je	.L196	 ;,
 ; D:/TC/src/tac.c:669:             inst = create_instruction(INST_STORE, left, right, NULL);
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
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; left, tmp141
	movq	8(%rax), %rax	 ; left_40->type, _18
	movq	24(%rbp), %rdx	 ; status, tmp142
	movq	%rdx, %r9	 ; tmp142,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _18,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _19,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp143, temp
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	24(%rbp), %rdx	 ; status, tmp144
	movq	-32(%rbp), %rax	 ; left, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ;, _20
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %r8	 ; right, tmp146
	movq	-40(%rbp), %rdx	 ; temp, tmp147
	movl	-20(%rbp), %eax	 ; op, tmp148
	movq	%r8, %r9	 ; tmp146,
	movq	%rcx, %r8	 ; _20,
	movl	%eax, %ecx	 ; tmp148,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp149, inst
 ; D:/TC/src/tac.c:673:         right = temp;
	movq	-40(%rbp), %rax	 ; temp, tmp150
	movq	%rax, -8(%rbp)	 ; tmp150, right
.L196:
 ; D:/TC/src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp151
	movq	16(%rax), %rax	 ; status_33(D)->current_block, _21
 ; D:/TC/src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _21->instructions, _22
	movq	-16(%rbp), %rdx	 ; inst, tmp152
	movq	%rax, %rcx	 ; _22,
	call	list_append	 ;
 ; D:/TC/src/tac.c:677:     return right;
	movq	-8(%rbp), %rax	 ; right, _26
.L192:
 ; D:/TC/src/tac.c:678: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC16:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC17:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
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
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	movq	16(%rbp), %rax	 ; primary, tmp117
	movl	8(%rax), %eax	 ; primary_41(D)->type, _1
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
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
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	16(%rbp), %rax	 ; primary, tmp125
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _2
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _2,
	call	strtoll	 ;
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, -72(%rbp)	 ; _3, t
 ; D:/TC/src/tac.c:685:             return create_arg(ARG_INT, &t);
	leaq	-72(%rbp), %rax	 ;, tmp126
	movq	%rax, %rdx	 ; tmp126,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L207:
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	16(%rbp), %rax	 ; primary, tmp127
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _4
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _4,
	call	strtod	 ;
	movq	%xmm0, %rax	 ;, _5
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	%rax, -80(%rbp)	 ; _5, t
 ; D:/TC/src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	leaq	-80(%rbp), %rax	 ;, tmp128
	movq	%rax, %rdx	 ; tmp128,
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L206:
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp129
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _6
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%rax, %rdx	 ; _6,
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L205:
 ; D:/TC/src/tac.c:695:             bool t = true;
	movb	$1, -81(%rbp)	 ;, t
 ; D:/TC/src/tac.c:697:             return create_arg(ARG_BOOL, &t);
	leaq	-81(%rbp), %rax	 ;, tmp130
	movq	%rax, %rdx	 ; tmp130,
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L204:
 ; D:/TC/src/tac.c:700:             bool t = false;
	movb	$0, -82(%rbp)	 ;, t
 ; D:/TC/src/tac.c:702:             return create_arg(ARG_BOOL, &t);
	leaq	-82(%rbp), %rax	 ;, tmp131
	movq	%rax, %rdx	 ; tmp131,
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L209	 ;
.L203:
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	16(%rbp), %rax	 ; primary, tmp132
	movq	(%rax), %rax	 ; primary_41(D)->value.expr, _7
	movq	24(%rbp), %rdx	 ; status, tmp133
	movq	%rax, %rcx	 ; _7,
	call	tac_expression	 ;
	jmp	.L209	 ;
.L202:
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	16(%rbp), %rax	 ; primary, tmp134
	movq	(%rax), %rax	 ; primary_41(D)->value.operand, _8
	movq	24(%rbp), %rdx	 ; status, tmp135
	movq	%rax, %rcx	 ; _8,
	call	tac_primary	 ;
	movq	%rax, %rcx	 ;, _9
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	24(%rbp), %rax	 ; status, tmp136
	movq	%rax, %rdx	 ; tmp136,
	call	load_rvalue	 ;
	movq	%rax, -48(%rbp)	 ; tmp137, operand
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp138
	movq	(%rax), %rax	 ; name_bool, name_bool.12_10
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	24(%rbp), %rdx	 ; status, tmp139
	movq	%rdx, %r9	 ; tmp139,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; name_bool.12_10,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _11,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -56(%rbp)	 ; tmp140, temp
 ; D:/TC/src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	-48(%rbp), %rdx	 ; operand, tmp141
	movq	-56(%rbp), %rax	 ; temp, tmp142
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp141,
	movq	%rax, %rdx	 ; tmp142,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp143, inst
 ; D:/TC/src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp144
	movq	16(%rax), %rax	 ; status_42(D)->current_block, _12
 ; D:/TC/src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-64(%rbp), %rdx	 ; inst, tmp145
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:/TC/src/tac.c:713:             return temp;
	movq	-56(%rbp), %rax	 ; temp, _36
	jmp	.L209	 ;
.L201:
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	16(%rbp), %rax	 ; primary, tmp146
	movq	(%rax), %rax	 ; primary_41(D)->value.operand, _14
	movq	24(%rbp), %rdx	 ; status, tmp147
	movq	%rax, %rcx	 ; _14,
	call	tac_primary	 ;
	movq	%rax, %rcx	 ;, _15
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	%rax, %rdx	 ; tmp148,
	call	load_rvalue	 ;
	movq	%rax, -32(%rbp)	 ; tmp149, operand
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; operand, tmp150
	movq	8(%rax), %rax	 ; operand_47->type, _16
	movq	24(%rbp), %rdx	 ; status, tmp151
	movq	%rdx, %r9	 ; tmp151,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _16,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _17,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp152, temp
 ; D:/TC/src/tac.c:718:             Instruction* inst = NULL;
	movq	$0, -24(%rbp)	 ;, inst
 ; D:/TC/src/tac.c:719:             long long zero_int = 0;
	movq	$0, -96(%rbp)	 ;, zero_int
 ; D:/TC/src/tac.c:720:             double neg_one_float = -1.0;
	movsd	.LC15(%rip), %xmm0	 ;, tmp153
	movsd	%xmm0, -104(%rbp)	 ; tmp153, neg_one_float
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	-32(%rbp), %rax	 ; operand, tmp154
	movq	8(%rax), %rdx	 ; operand_47->type, _18
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp155
	movq	(%rax), %rax	 ; name_int, name_int.13_19
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	cmpq	%rax, %rdx	 ; name_int.13_19, _18
	jne	.L210	 ;,
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	-96(%rbp), %rax	 ;, tmp156
	movq	%rax, %rdx	 ; tmp156,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
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
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	movq	-32(%rbp), %rax	 ; operand, tmp160
	movq	8(%rax), %rdx	 ; operand_47->type, _21
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp161
	movq	(%rax), %rax	 ; name_float, name_float.14_22
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	cmpq	%rax, %rdx	 ; name_float.14_22, _21
	jne	.L212	 ;,
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	-104(%rbp), %rax	 ;, tmp162
	movq	%rax, %rdx	 ; tmp162,
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
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
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	-32(%rbp), %rax	 ; operand, tmp166
	movq	8(%rax), %rax	 ; operand_47->type, _24
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _24->name, _25
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	24(%rax), %rax	 ; _26->_stderr, _27
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	%rbx, %r8	 ; _25,
	leaq	.LC16(%rip), %rdx	 ;, tmp167
	movq	%rax, %rcx	 ; _27,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:728:                 return NULL;
	movl	$0, %eax	 ;, _36
	jmp	.L209	 ;
.L211:
 ; D:/TC/src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp168
	movq	16(%rax), %rax	 ; status_42(D)->current_block, _28
 ; D:/TC/src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _28->instructions, _29
	movq	-24(%rbp), %rdx	 ; inst, tmp169
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:/TC/src/tac.c:732:             return temp;
	movq	-40(%rbp), %rax	 ; temp, _36
	jmp	.L209	 ;
.L199:
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	16(%rbp), %rax	 ; primary, tmp170
	movq	(%rax), %rax	 ; primary_41(D)->value.var, _30
	movq	24(%rbp), %rdx	 ; status, tmp171
	movq	%rax, %rcx	 ; _30,
	call	tac_variable_access	 ;
	jmp	.L209	 ;
.L198:
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	16(%rbp), %rax	 ; primary, tmp172
	movl	8(%rax), %ebx	 ; primary_41(D)->type, _31
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rax	 ; _32->_stderr, _33
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _31,
	leaq	.LC17(%rip), %rdx	 ;, tmp173
	movq	%rax, %rcx	 ; _33,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:740:             return NULL;
	movl	$0, %eax	 ;, _36
.L209:
 ; D:/TC/src/tac.c:742: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC19:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC20:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC21:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC22:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC23:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC24:
	.ascii "arr\0"
	.align 8
.LC25:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC26:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC27:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC28:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$224, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable_access, variable_access
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp238
	movl	16(%rax), %eax	 ; variable_access_166(D)->type, _1
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testl	%eax, %eax	 ; _1
	jne	.L215	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp239
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _2
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rax, %rax	 ; _2
	je	.L215	 ;,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movq	16(%rbp), %rax	 ; variable_access, tmp240
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _3
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _3->kind, _4
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, _4
	je	.L216	 ;,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movq	16(%rbp), %rax	 ; variable_access, tmp241
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _5
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _5->kind, _6
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$2, %eax	 ;, _6
	jne	.L217	 ;,
.L216:
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rax	 ; variable_access, tmp242
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _7
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; _7->type, _8
	movq	16(%rbp), %rax	 ; variable_access, tmp243
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _9
	movq	24(%rbp), %rcx	 ; status, tmp244
	movq	%rcx, %r9	 ; tmp244,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; _9,
	call	create_var	 ;
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _10,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -56(%rbp)	 ; tmp245, result
 ; D:/TC/src/tac.c:749:             return result;
	movq	-56(%rbp), %rax	 ; result, _158
	jmp	.L218	 ;
.L217:
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	movq	16(%rbp), %rax	 ; variable_access, tmp246
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _11
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	movl	32(%rax), %eax	 ; _11->kind, _12
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _12
	jne	.L219	 ;,
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	16(%rbp), %rax	 ; variable_access, tmp247
	movq	8(%rax), %rdx	 ; variable_access_166(D)->content.name, _13
	movq	16(%rbp), %rax	 ; variable_access, tmp248
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _14
	movq	24(%rbp), %rcx	 ; status, tmp249
	movq	%rcx, %r9	 ; tmp249,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _14,
	call	create_var	 ;
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rax, %rdx	 ; _15,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp250, result
 ; D:/TC/src/tac.c:753:             return result;
	movq	-48(%rbp), %rax	 ; result, _158
	jmp	.L218	 ;
.L219:
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	16(%rbp), %rax	 ; variable_access, tmp251
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _16
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rax), %rdx	 ; _16->type, _17
	movq	16(%rbp), %rax	 ; variable_access, tmp252
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.name, _18
	movq	24(%rbp), %rcx	 ; status, tmp253
	movq	%rcx, %r9	 ; tmp253,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _18,
	call	create_var	 ;
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rdx	 ; _19,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp254, result
 ; D:/TC/src/tac.c:757:             return result;
	movq	-40(%rbp), %rax	 ; result, _158
	jmp	.L218	 ;
.L215:
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp255
	movq	(%rax), %rax	 ; variable_access_166(D)->base, _20
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rax, %rax	 ; _20
	jne	.L220	 ;,
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %rax	 ; _21->_stderr, _22
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	%rax, %r9	 ; _22,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rax	 ;, tmp256
	movq	%rax, %rcx	 ; tmp256,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:763:         return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L220:
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp257
	movq	(%rax), %rax	 ; variable_access_166(D)->base, _23
	movq	24(%rbp), %rdx	 ; status, tmp258
	movq	%rax, %rcx	 ; _23,
	call	tac_variable_access	 ;
	movq	%rax, %rcx	 ;, _24
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	24(%rbp), %rax	 ; status, tmp259
	movq	%rax, %rdx	 ; tmp259,
	call	load_rvalue	 ;
	movq	%rax, -24(%rbp)	 ; tmp260, base
 ; D:/TC/src/tac.c:766:     if (base == NULL) {
	cmpq	$0, -24(%rbp)	 ;, base
	jne	.L221	 ;,
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	24(%rax), %rax	 ; _25->_stderr, _26
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	%rax, %r9	 ; _26,
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rax	 ;, tmp261
	movq	%rax, %rcx	 ; tmp261,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:769:         return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L221:
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movq	16(%rbp), %rax	 ; variable_access, tmp262
	movl	16(%rax), %eax	 ; variable_access_166(D)->type, _27
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %eax	 ;, _27
	jne	.L222	 ;,
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-24(%rbp), %rax	 ; base, tmp263
	movq	8(%rax), %rax	 ; base_182->type, _28
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _28->kind, _29
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, _29
	je	.L223	 ;,
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	-24(%rbp), %rax	 ; base, tmp264
	movq	8(%rax), %rax	 ; base_182->type, _30
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %eax	 ; _30->kind, _31
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$2, %eax	 ;, _31
	jne	.L224	 ;,
.L223:
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp265
	movq	8(%rax), %rax	 ; base_182->type, _32
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _32->name, _33
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	24(%rax), %rax	 ; _34->_stderr, _35
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	%rbx, %r8	 ; _33,
	leaq	.LC20(%rip), %rdx	 ;, tmp266
	movq	%rax, %rcx	 ; _35,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:775:             return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L224:
 ; D:/TC/src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	-24(%rbp), %rax	 ; base, tmp267
	movq	8(%rax), %rax	 ; base_182->type, _36
 ; D:/TC/src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rax	 ; _36->ast_node.scope, tmp268
	movq	%rax, -32(%rbp)	 ; tmp268, scope
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	movq	-24(%rbp), %rax	 ; base, tmp269
	movq	8(%rax), %rax	 ; base_182->type, _37
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _37->kind, _38
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _38
	jne	.L225	 ;,
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	-24(%rbp), %rax	 ; base, tmp270
	movq	8(%rax), %rax	 ; base_182->type, _39
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	24(%rax), %rax	 ; _39->ast_node.class, _40
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rax), %rax	 ; _40->class_scope, tmp271
	movq	%rax, -32(%rbp)	 ; tmp271, scope
.L225:
 ; D:/TC/src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp272
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.attr_name, _41
 ; D:/TC/src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rax), %rdx	 ; _41->name, _42
	movq	-32(%rbp), %rax	 ; scope, tmp273
	movq	%rax, %rcx	 ; tmp273,
	call	search_name_use_strcmp	 ;
	movq	%rax, -152(%rbp)	 ; tmp274, attr
 ; D:/TC/src/tac.c:781:         if (attr == NULL) {
	cmpq	$0, -152(%rbp)	 ;, attr
	jne	.L226	 ;,
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp275
	movq	8(%rax), %rax	 ; base_182->type, _43
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _43->name, _44
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp276
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.attr_name, _45
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rbx	 ; _45->name, _46
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rax	 ; _47->_stderr, _48
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _44,
	movq	%rbx, %r8	 ; _46,
	leaq	.LC21(%rip), %rdx	 ;, tmp277
	movq	%rax, %rcx	 ; _48,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:784:             return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L226:
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movq	-152(%rbp), %rax	 ; attr, tmp278
	movl	32(%rax), %eax	 ; attr_256->kind, _49
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _49
	jne	.L227	 ;,
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp279
	movq	8(%rax), %rax	 ; base_182->type, _50
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _50->name, _51
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp280
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.attr_name, _52
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rbx	 ; _52->name, _53
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rax	 ; _54->_stderr, _55
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _51,
	movq	%rbx, %r8	 ; _53,
	leaq	.LC22(%rip), %rdx	 ;, tmp281
	movq	%rax, %rcx	 ; _55,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-152(%rbp), %rax	 ; attr, tmp282
	movq	(%rax), %rdx	 ; attr_256->type, _56
	movq	24(%rbp), %rcx	 ; status, tmp283
	movq	-152(%rbp), %rax	 ; attr, tmp284
	movq	%rcx, %r9	 ; tmp283,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp284,
	call	create_var	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _57,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L218	 ;
.L227:
 ; D:/TC/src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	movq	-152(%rbp), %rax	 ; attr, tmp285
	movl	32(%rax), %eax	 ; attr_256->kind, _58
 ; D:/TC/src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _58
	jne	.L228	 ;,
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-152(%rbp), %rax	 ; attr, tmp286
	movq	(%rax), %rdx	 ; attr_256->type, _59
	movq	24(%rbp), %rcx	 ; status, tmp287
	movq	-152(%rbp), %rax	 ; attr, tmp288
	movq	%rcx, %r9	 ; tmp287,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp288,
	call	create_var	 ;
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _60,
	movl	$8, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L218	 ;
.L228:
 ; D:/TC/src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	movq	-152(%rbp), %rax	 ; attr, tmp289
	movl	32(%rax), %eax	 ; attr_256->kind, _61
 ; D:/TC/src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _61
	je	.L229	 ;,
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp290
	movq	8(%rax), %rax	 ; base_182->type, _62
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _62->name, _63
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	16(%rbp), %rax	 ; variable_access, tmp291
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.attr_name, _64
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rbx	 ; _64->name, _65
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rax	 ; _66->_stderr, _67
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _63,
	movq	%rbx, %r8	 ; _65,
	leaq	.LC23(%rip), %rdx	 ;, tmp292
	movq	%rax, %rcx	 ; _67,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:795:             return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L229:
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	-152(%rbp), %rax	 ; attr, tmp293
	movq	(%rax), %rax	 ; attr_256->type, _68
	movq	24(%rbp), %rdx	 ; status, tmp294
	movq	%rdx, %r9	 ; tmp294,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _68,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _69,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -160(%rbp)	 ; tmp295, temp
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	16(%rbp), %rax	 ; variable_access, tmp296
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.attr_name, _70
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rax), %rdx	 ; _70->type, _71
	movq	16(%rbp), %rax	 ; variable_access, tmp297
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.attr_name, _72
	movq	24(%rbp), %rcx	 ; status, tmp298
	movq	%rcx, %r9	 ; tmp298,
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; _72,
	call	create_var	 ;
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rdx	 ; _73,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _74
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	-24(%rbp), %rcx	 ; base, tmp299
	movq	-160(%rbp), %rax	 ; temp, tmp300
	movq	%rdx, %r9	 ; _74,
	movq	%rcx, %r8	 ; tmp299,
	movq	%rax, %rdx	 ; tmp300,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -168(%rbp)	 ; tmp301, inst
 ; D:/TC/src/tac.c:799:         temp->is_get = true;
	movq	-160(%rbp), %rax	 ; temp, tmp302
	movb	$1, 20(%rax)	 ;, temp_259->is_get
 ; D:/TC/src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp303
	movq	16(%rax), %rax	 ; status_167(D)->current_block, _75
 ; D:/TC/src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _75->instructions, _76
	movq	-168(%rbp), %rdx	 ; inst, tmp304
	movq	%rax, %rcx	 ; _76,
	call	list_append	 ;
 ; D:/TC/src/tac.c:802:         return temp;
	movq	-160(%rbp), %rax	 ; temp, _158
	jmp	.L218	 ;
.L222:
 ; D:/TC/src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	movq	16(%rbp), %rax	 ; variable_access, tmp305
	movl	16(%rax), %eax	 ; variable_access_166(D)->type, _77
 ; D:/TC/src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %eax	 ;, _77
	jne	.L230	 ;,
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	-24(%rbp), %rax	 ; base, tmp306
	movq	8(%rax), %rax	 ; base_182->type, _78
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	 ; _78->name, _79
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC24(%rip), %rdx	 ;, tmp307
	movq	%rax, %rcx	 ; _79,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; _80
	je	.L231	 ;,
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	-24(%rbp), %rax	 ; base, tmp308
	movq	(%rax), %rax	 ; base_182->value.variable, _81
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	 ; _81->original_name, _82
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	8(%rax), %rbx	 ; _82->name, _83
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	24(%rax), %rax	 ; _84->_stderr, _85
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	%rbx, %r8	 ; _83,
	leaq	.LC25(%rip), %rdx	 ;, tmp309
	movq	%rax, %rcx	 ; _85,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:808:             return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L231:
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp310
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.index, _86
	movq	24(%rbp), %rdx	 ; status, tmp311
	movq	%rax, %rcx	 ; _86,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _87
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	24(%rbp), %rax	 ; status, tmp312
	movq	%rax, %rdx	 ; tmp312,
	call	load_rvalue	 ;
	movq	%rax, -128(%rbp)	 ; tmp313, index
 ; D:/TC/src/tac.c:811:         if (index == NULL) {
	cmpq	$0, -128(%rbp)	 ;, index
	jne	.L232	 ;,
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	24(%rax), %rax	 ; _88->_stderr, _89
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	%rax, %r9	 ; _89,
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rax	 ;, tmp314
	movq	%rax, %rcx	 ; tmp314,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:814:             return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L232:
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	.refptr.name_int(%rip), %rax	 ;, tmp315
	movq	(%rax), %rax	 ; name_int, name_int.15_90
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	24(%rbp), %rdx	 ; status, tmp316
	movq	%rdx, %r9	 ; tmp316,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; name_int.15_90,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _91,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -136(%rbp)	 ; tmp317, temp
 ; D:/TC/src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	-128(%rbp), %rcx	 ; index, tmp318
	movq	-24(%rbp), %rdx	 ; base, tmp319
	movq	-136(%rbp), %rax	 ; temp, tmp320
	movq	%rcx, %r9	 ; tmp318,
	movq	%rdx, %r8	 ; tmp319,
	movq	%rax, %rdx	 ; tmp320,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -144(%rbp)	 ; tmp321, inst
 ; D:/TC/src/tac.c:820:         temp->is_get = true;
	movq	-136(%rbp), %rax	 ; temp, tmp322
	movb	$1, 20(%rax)	 ;, temp_241->is_get
 ; D:/TC/src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp323
	movq	16(%rax), %rax	 ; status_167(D)->current_block, _92
 ; D:/TC/src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _92->instructions, _93
	movq	-144(%rbp), %rdx	 ; inst, tmp324
	movq	%rax, %rcx	 ; _93,
	call	list_append	 ;
 ; D:/TC/src/tac.c:823:         return temp;
	movq	-136(%rbp), %rax	 ; temp, _158
	jmp	.L218	 ;
.L230:
 ; D:/TC/src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp325
	movl	16(%rax), %eax	 ; variable_access_166(D)->type, _94
 ; D:/TC/src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %eax	 ;, _94
	jne	.L233	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	 ; base, tmp326
	movl	16(%rax), %eax	 ; base_182->kind, _95
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _95
	jne	.L234	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	-24(%rbp), %rax	 ; base, tmp327
	movq	8(%rax), %rax	 ; base_182->type, _96
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %eax	 ; _96->kind, _97
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _97
	jne	.L234	 ;,
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp328
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.16_98
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-24(%rbp), %rax	 ; base, tmp329
	movq	8(%rax), %rax	 ; base_182->type, _99
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rax	 ; _99->name, _100
	movq	%rax, %rcx	 ; _100,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ;, _101
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	-24(%rbp), %rax	 ; base, tmp330
	movq	8(%rax), %rax	 ; base_182->type, _102
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _102->ast_node.class, _103
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	16(%rax), %rax	 ; _103->class_scope, _104
	movq	%rax, %rcx	 ; _104,
	call	search_name_use_strcmp	 ;
	movq	%rax, -64(%rbp)	 ; tmp331, attr
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	-64(%rbp), %rax	 ; attr, tmp332
	movq	(%rax), %rdx	 ; attr_188->type, _105
	movq	24(%rbp), %rcx	 ; status, tmp333
	movq	-64(%rbp), %rax	 ; attr, tmp334
	movq	%rcx, %r9	 ; tmp333,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp334,
	call	create_var	 ;
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _106,
	movl	$8, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -24(%rbp)	 ; tmp335, base
.L234:
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movq	-24(%rbp), %rax	 ; base, tmp336
	movl	16(%rax), %eax	 ; base_155->kind, _107
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$8, %eax	 ;, _107
	je	.L235	 ;,
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movq	-24(%rbp), %rax	 ; base, tmp337
	movl	16(%rax), %eax	 ; base_155->kind, _108
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$7, %eax	 ;, _108
	je	.L235	 ;,
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp338
	movq	8(%rax), %rax	 ; base_155->type, _109
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rsi	 ; _109->name, _110
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	-24(%rbp), %rax	 ; base, tmp339
	movl	16(%rax), %ebx	 ; base_155->kind, _111
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rax	 ; _112->_stderr, _113
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	%rsi, %r9	 ; _110,
	movl	%ebx, %r8d	 ; _111,
	leaq	.LC27(%rip), %rdx	 ;, tmp340
	movq	%rax, %rcx	 ; _113,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:832:             return NULL;
	movl	$0, %eax	 ;, _158
	jmp	.L218	 ;
.L235:
 ; D:/TC/src/tac.c:834:         long long arg_count = 0;
	movq	$0, -176(%rbp)	 ;, arg_count
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	create_list	 ;
	movq	%rax, -72(%rbp)	 ; tmp341, arguments
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	-24(%rbp), %rax	 ; base, tmp342
	movl	16(%rax), %eax	 ; base_155->kind, _114
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, %eax	 ;, _114
	jne	.L237	 ;,
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp343
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME.17_115
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	-24(%rbp), %rax	 ; base, tmp344
	movq	8(%rax), %rax	 ; base_155->type, _116
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rax	 ; _116->name, _117
	movq	%rax, %rcx	 ; _117,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ;, _118
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	-24(%rbp), %rax	 ; base, tmp345
	movq	(%rax), %rax	 ; base_155->value.subroutine, _119
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _119->original_name, _120
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rax	 ; _120->name, _121
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	%rax, %rcx	 ; _121,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; _122
	je	.L237	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp346
	movq	(%rax), %rax	 ; variable_access_166(D)->base, _123
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	(%rax), %rax	 ; _123->base, _124
	movq	%rax, 32(%rsp)	 ; _124,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; _125,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rcx	 ;, _126
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	24(%rbp), %rax	 ; status, tmp347
	movq	%rax, %rdx	 ; tmp347,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _127
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	24(%rbp), %rax	 ; status, tmp348
	movq	%rax, %rdx	 ; tmp348,
	call	load_rvalue	 ;
	movq	%rax, -80(%rbp)	 ; tmp349, self
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	-80(%rbp), %rax	 ; self, tmp350
	movq	8(%rax), %rax	 ; self_203->type, _128
	movq	%rax, %rcx	 ; _128,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, -184(%rbp)	 ; _130, size
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	-184(%rbp), %rax	 ;, tmp351
	movq	%rax, %rdx	 ; tmp351,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	-80(%rbp), %rdx	 ; self, tmp352
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp352,
	movq	%rax, %rdx	 ; _131,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _132
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	-72(%rbp), %rax	 ; arguments, tmp353
	movq	%rax, %rcx	 ; tmp353,
	call	list_append	 ;
 ; D:/TC/src/tac.c:840:             arg_count++;
	movq	-176(%rbp), %rax	 ; arg_count, arg_count.18_133
	addq	$1, %rax	 ;, _134
	movq	%rax, -176(%rbp)	 ; _134, arg_count
.L237:
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	16(%rbp), %rax	 ; variable_access, tmp354
	movq	8(%rax), %rax	 ; variable_access_166(D)->content.args, _135
	movq	%rax, %rcx	 ; _135,
	call	list_copy	 ;
	movq	%rax, -88(%rbp)	 ; tmp355, args
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L238	 ;
.L239:
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	24(%rbp), %rdx	 ; status, tmp356
	movq	-96(%rbp), %rax	 ; arg_expr, tmp357
	movq	%rax, %rcx	 ; tmp357,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ;, _136
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	24(%rbp), %rax	 ; status, tmp358
	movq	%rax, %rdx	 ; tmp358,
	call	load_rvalue	 ;
	movq	%rax, -120(%rbp)	 ; tmp359, arg
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	-120(%rbp), %rax	 ; arg, tmp360
	movq	8(%rax), %rax	 ; arg_227->type, _137
	movq	%rax, %rcx	 ; _137,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, -192(%rbp)	 ; _139, size
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	-192(%rbp), %rax	 ;, tmp361
	movq	%rax, %rdx	 ; tmp361,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	-120(%rbp), %rdx	 ; arg, tmp362
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp362,
	movq	%rax, %rdx	 ; _140,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _141
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	-72(%rbp), %rax	 ; arguments, tmp363
	movq	%rax, %rcx	 ; tmp363,
	call	list_append	 ;
 ; D:/TC/src/tac.c:848:             arg_count++;
	movq	-176(%rbp), %rax	 ; arg_count, arg_count.19_142
	addq	$1, %rax	 ;, _143
	movq	%rax, -176(%rbp)	 ; _143, arg_count
.L238:
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	-88(%rbp), %rax	 ; args, tmp364
	movq	%rax, %rcx	 ; tmp364,
	call	list_pop	 ;
	movq	%rax, -96(%rbp)	 ; tmp365, arg_expr
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -96(%rbp)	 ;, arg_expr
	jne	.L239	 ;,
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	jmp	.L240	 ;
.L241:
 ; D:/TC/src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	24(%rbp), %rax	 ; status, tmp366
	movq	16(%rax), %rax	 ; status_167(D)->current_block, _144
 ; D:/TC/src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	8(%rax), %rax	 ; _144->instructions, _145
	movq	-104(%rbp), %rdx	 ; arg, tmp367
	movq	%rax, %rcx	 ; _145,
	call	list_append	 ;
.L240:
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	-72(%rbp), %rax	 ; arguments, tmp368
	movq	%rax, %rcx	 ; tmp368,
	call	list_pop	 ;
	movq	%rax, -104(%rbp)	 ; tmp369, arg
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	cmpq	$0, -104(%rbp)	 ;, arg
	jne	.L241	 ;,
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	-24(%rbp), %rax	 ; base, tmp370
	movq	8(%rax), %rax	 ; base_155->type, _146
	movq	24(%rbp), %rdx	 ; status, tmp371
	movq	%rdx, %r9	 ; tmp371,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _146,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _147,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -112(%rbp)	 ; tmp372, temp
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	leaq	-176(%rbp), %rax	 ;, tmp373
	movq	%rax, %rdx	 ; tmp373,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _148
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	-24(%rbp), %rcx	 ; base, tmp374
	movq	-112(%rbp), %rax	 ; temp, tmp375
	movq	%rdx, %r9	 ; _148,
	movq	%rcx, %r8	 ; tmp374,
	movq	%rax, %rdx	 ; tmp375,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _149
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	24(%rbp), %rax	 ; status, tmp376
	movq	16(%rax), %rax	 ; status_167(D)->current_block, _150
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	8(%rax), %rax	 ; _150->instructions, _151
	movq	%rax, %rcx	 ; _151,
	call	list_append	 ;
 ; D:/TC/src/tac.c:856:         return temp;
	movq	-112(%rbp), %rax	 ; temp, _158
	jmp	.L218	 ;
.L233:
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	16(%rbp), %rax	 ; variable_access, tmp377
	movl	16(%rax), %ebx	 ; variable_access_166(D)->type, _152
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rax	 ; _153->_stderr, _154
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%ebx, %r8d	 ; _152,
	leaq	.LC28(%rip), %rdx	 ;, tmp378
	movq	%rax, %rcx	 ; _154,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:860:         return NULL;
	movl	$0, %eax	 ;, _158
.L218:
 ; D:/TC/src/tac.c:862: }
	addq	$224, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC15:
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
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
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
