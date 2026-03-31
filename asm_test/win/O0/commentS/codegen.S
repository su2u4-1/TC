	.file	"D:\\TC\\temp\\codegen.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	find_attribute_table;	.scl	3;	.type	32;	.endef
find_attribute_table:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; status, status
	movq	%rdx, 24(%rbp)	 ; name, name
 ; D:\TC\temp\codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	16(%rbp), %rax	 ; status, tmp87
	movq	(%rax), %rax	 ; status_7(D)->tac, _1
 ; D:\TC\temp\codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%rax), %rax	 ; _1->attribute_tables, _2
	movq	%rax, %rcx	 ; _2,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, attribute_tables
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	jmp	.L2	 ;
.L4:
 ; D:\TC\temp\codegen.c:9:         if (current->name == name)
	movq	-16(%rbp), %rax	 ; current, tmp89
	movq	8(%rax), %rax	 ; current_11->name, _3
 ; D:\TC\temp\codegen.c:9:         if (current->name == name)
	cmpq	%rax, 24(%rbp)	 ; _3, name
	jne	.L2	 ;,
 ; D:\TC\temp\codegen.c:10:             return current;
	movq	-16(%rbp), %rax	 ; current, _4
	jmp	.L3	 ;
.L2:
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	-8(%rbp), %rax	 ; attribute_tables, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp91, current
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, current
	jne	.L4	 ;,
 ; D:\TC\temp\codegen.c:11:     return NULL;
	movl	$0, %eax	 ;, _4
.L3:
 ; D:\TC\temp\codegen.c:12: }
	leave	
	ret	
	.def	create_attribute_table;	.scl	3;	.type	32;	.endef
create_attribute_table:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	-8(%rbp), %rdx	 ; table, tmp86
	movq	%rax, (%rdx)	 ; _1, table_4->attributes
 ; D:\TC\temp\codegen.c:16:     table->name = name;
	movq	-8(%rbp), %rax	 ; table, tmp87
	movq	16(%rbp), %rdx	 ; name, tmp88
	movq	%rdx, 8(%rax)	 ; tmp88, table_4->name
 ; D:\TC\temp\codegen.c:17:     table->size = 0;
	movq	-8(%rbp), %rax	 ; table, tmp89
	movq	$0, 16(%rax)	 ;, table_4->size
 ; D:\TC\temp\codegen.c:18:     return table;
	movq	-8(%rbp), %rax	 ; table, _10
 ; D:\TC\temp\codegen.c:19: }
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
	subq	$40, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; type, type
 ; D:\TC\temp\codegen.c:21:     if (type == NULL)
	cmpq	$0, 16(%rbp)	 ;, type
	jne	.L8	 ;,
 ; D:\TC\temp\codegen.c:22:         return 0;
	movl	$0, %eax	 ;, _11
	jmp	.L9	 ;
.L8:
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
	movq	(%rax), %rax	 ; name_int, name_int.0_1
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, 16(%rbp)	 ; name_int.0_1, type
	je	.L10	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
	movq	(%rax), %rax	 ; name_float, name_float.1_2
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, 16(%rbp)	 ; name_float.1_2, type
	je	.L10	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
	movq	(%rax), %rax	 ; name_string, name_string.2_3
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, 16(%rbp)	 ; name_string.2_3, type
	jne	.L11	 ;,
.L10:
 ; D:\TC\temp\codegen.c:24:         return 8;
	movl	$8, %eax	 ;, _11
	jmp	.L9	 ;
.L11:
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp97
	movq	(%rax), %rax	 ; name_bool, name_bool.3_4
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rax, 16(%rbp)	 ; name_bool.3_4, type
	je	.L12	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp98
	movq	(%rax), %rax	 ; name_void, name_void.4_5
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rax, 16(%rbp)	 ; name_void.4_5, type
	jne	.L13	 ;,
.L12:
 ; D:\TC\temp\codegen.c:26:         return 1;
	movl	$1, %eax	 ;, _11
	jmp	.L9	 ;
.L13:
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movq	16(%rbp), %rax	 ; type, tmp99
	movl	32(%rax), %eax	 ; type_13(D)->kind, _6
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _6
	jne	.L14	 ;,
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	16(%rbp), %rax	 ; type, tmp100
	movq	24(%rax), %rax	 ; type_13(D)->ast_node.class, _7
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rax), %rax	 ; _7->size, _11
	jmp	.L9	 ;
.L14:
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	16(%rbp), %rax	 ; type, tmp101
	movq	8(%rax), %rbx	 ; type_13(D)->name, _8
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	24(%rax), %rax	 ; _9->_stderr, _10
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	%rbx, %r8	 ; _8,
	leaq	.LC0(%rip), %rdx	 ;, tmp102
	movq	%rax, %rcx	 ; _10,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:30:     return 8;
	movl	$8, %eax	 ;, _11
.L9:
 ; D:\TC\temp\codegen.c:31: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.def	create_attribute;	.scl	3;	.type	32;	.endef
create_attribute:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; var_name, var_name
	movq	%rdx, 24(%rbp)	 ; type, type
	movq	%r8, 32(%rbp)	 ; table, table
	movq	%r9, 40(%rbp)	 ; offset, offset
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp92, attr
 ; D:\TC\temp\codegen.c:34:     attr->var_name = var_name;
	movq	-8(%rbp), %rax	 ; attr, tmp93
	movq	16(%rbp), %rdx	 ; var_name, tmp94
	movq	%rdx, (%rax)	 ; tmp94, attr_12->var_name
 ; D:\TC\temp\codegen.c:35:     attr->type = type;
	movq	-8(%rbp), %rax	 ; attr, tmp95
	movq	24(%rbp), %rdx	 ; type, tmp96
	movq	%rdx, 8(%rax)	 ; tmp96, attr_12->type
 ; D:\TC\temp\codegen.c:36:     attr->offset = offset;
	movq	-8(%rbp), %rax	 ; attr, tmp97
	movq	40(%rbp), %rdx	 ; offset, tmp98
	movq	%rdx, 16(%rax)	 ; tmp98, attr_12->offset
 ; D:\TC\temp\codegen.c:37:     if (offset == 0) {
	cmpq	$0, 40(%rbp)	 ;, offset
	jne	.L16	 ;,
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	32(%rbp), %rax	 ; table, tmp99
	movq	16(%rax), %rdx	 ; table_19(D)->size, _1
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	-8(%rbp), %rax	 ; attr, tmp100
	movq	%rdx, 16(%rax)	 ; _1, attr_12->offset
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	24(%rbp), %rax	 ; type, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	32(%rbp), %rdx	 ; table, tmp102
	movq	16(%rdx), %rdx	 ; table_19(D)->size, _2
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, %rdx	 ; _22, _3
	movq	32(%rbp), %rax	 ; table, tmp103
	movq	%rdx, 16(%rax)	 ; _3, table_19(D)->size
.L16:
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, 32(%rbp)	 ;, table
	je	.L17	 ;,
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	32(%rbp), %rax	 ; table, tmp104
	movq	(%rax), %rax	 ; table_19(D)->attributes, _4
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	 ; _4
	jne	.L18	 ;,
.L17:
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	24(%rax), %rax	 ; _5->_stderr, _6
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	%rax, %r9	 ; _6,
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L19	 ;
.L18:
 ; D:\TC\temp\codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	32(%rbp), %rax	 ; table, tmp106
	movq	(%rax), %rax	 ; table_19(D)->attributes, _7
	movq	-8(%rbp), %rdx	 ; attr, tmp107
	movq	%rax, %rcx	 ; _7,
	call	list_append	 ;
.L19:
 ; D:\TC\temp\codegen.c:45:     return attr;
	movq	-8(%rbp), %rax	 ; attr, _27
 ; D:\TC\temp\codegen.c:46: }
	leave	
	ret	
	.def	is_assignment_operator;	.scl	3;	.type	32;	.endef
is_assignment_operator:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$13, 16(%rbp)	 ;, op
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$14, 16(%rbp)	 ;, op
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$15, 16(%rbp)	 ;, op
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$16, 16(%rbp)	 ;, op
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$17, 16(%rbp)	 ;, op
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$18, 16(%rbp)	 ;, op
	jne	.L23	 ;,
.L22:
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$1, %eax	 ;, iftmp.5_1
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	jmp	.L24	 ;
.L23:
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$0, %eax	 ;, iftmp.5_1
.L24:
 ; D:\TC\temp\codegen.c:49: }
	popq	%rbp	 ;
	ret	
	.def	get_instruction_type;	.scl	3;	.type	32;	.endef
get_instruction_type:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	movl	%ecx, 16(%rbp)	 ; op, op
 ; D:\TC\temp\codegen.c:51:     switch (op) {
	cmpl	$18, 16(%rbp)	 ;, op
	ja	.L27	 ;,
	movl	16(%rbp), %eax	 ; op, tmp84
	leaq	0(,%rax,4), %rdx	 ;, tmp85
	leaq	.L29(%rip), %rax	 ;, tmp86
	movl	(%rdx,%rax), %eax	 ;, tmp87
	cltq
	leaq	.L29(%rip), %rdx	 ;, tmp90
	addq	%rdx, %rax	 ; tmp90, tmp89
	jmp	*%rax	 ; tmp89
	.section .rdata,"dr"
	.align 4
.L29:
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.long	.L42-.L29
	.long	.L41-.L29
	.long	.L40-.L29
	.long	.L39-.L29
	.long	.L38-.L29
	.long	.L37-.L29
	.long	.L36-.L29
	.long	.L35-.L29
	.long	.L34-.L29
	.long	.L33-.L29
	.long	.L32-.L29
	.long	.L31-.L29
	.long	.L30-.L29
	.long	.L28-.L29
	.text
.L33:
 ; D:\TC\temp\codegen.c:53:         case OP_ADD_ASSIGN: return INST_ADD;
	movl	$0, %eax	 ;, _1
	jmp	.L43	 ;
.L32:
 ; D:\TC\temp\codegen.c:55:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %eax	 ;, _1
	jmp	.L43	 ;
.L31:
 ; D:\TC\temp\codegen.c:57:         case OP_MUL_ASSIGN: return INST_MUL;
	movl	$2, %eax	 ;, _1
	jmp	.L43	 ;
.L30:
 ; D:\TC\temp\codegen.c:59:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %eax	 ;, _1
	jmp	.L43	 ;
.L28:
 ; D:\TC\temp\codegen.c:61:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %eax	 ;, _1
	jmp	.L43	 ;
.L34:
 ; D:\TC\temp\codegen.c:62:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %eax	 ;, _1
	jmp	.L43	 ;
.L42:
 ; D:\TC\temp\codegen.c:63:         case OP_EQ: return INST_EQ;
	movl	$5, %eax	 ;, _1
	jmp	.L43	 ;
.L41:
 ; D:\TC\temp\codegen.c:64:         case OP_NE: return INST_NE;
	movl	$6, %eax	 ;, _1
	jmp	.L43	 ;
.L40:
 ; D:\TC\temp\codegen.c:65:         case OP_LT: return INST_LT;
	movl	$7, %eax	 ;, _1
	jmp	.L43	 ;
.L39:
 ; D:\TC\temp\codegen.c:66:         case OP_GT: return INST_GT;
	movl	$8, %eax	 ;, _1
	jmp	.L43	 ;
.L38:
 ; D:\TC\temp\codegen.c:67:         case OP_LE: return INST_LE;
	movl	$9, %eax	 ;, _1
	jmp	.L43	 ;
.L37:
 ; D:\TC\temp\codegen.c:68:         case OP_GE: return INST_GE;
	movl	$10, %eax	 ;, _1
	jmp	.L43	 ;
.L36:
 ; D:\TC\temp\codegen.c:69:         case OP_AND: return INST_AND;
	movl	$11, %eax	 ;, _1
	jmp	.L43	 ;
.L35:
 ; D:\TC\temp\codegen.c:70:         case OP_OR: return INST_OR;
	movl	$12, %eax	 ;, _1
	jmp	.L43	 ;
.L27:
 ; D:\TC\temp\codegen.c:72:         default: return INST_NONE;
	movl	$25, %eax	 ;, _1
.L43:
 ; D:\TC\temp\codegen.c:74: }
	popq	%rbp	 ;
	ret	
	.def	create_tac;	.scl	3;	.type	32;	.endef
create_tac:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, tac
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	movq	-8(%rbp), %rdx	 ; tac, tmp88
	movq	%rax, (%rdx)	 ; _1, tac_6->attribute_tables
 ; D:\TC\temp\codegen.c:78:     tac->entry_point = NULL;
	movq	-8(%rbp), %rax	 ; tac, tmp89
	movq	$0, 8(%rax)	 ;, tac_6->entry_point
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	movq	-8(%rbp), %rdx	 ; tac, tmp90
	movq	%rax, 16(%rdx)	 ; _2, tac_6->global_vars
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	movq	-8(%rbp), %rdx	 ; tac, tmp91
	movq	%rax, 24(%rdx)	 ; _3, tac_6->subroutines
 ; D:\TC\temp\codegen.c:81:     return tac;
	movq	-8(%rbp), %rax	 ; tac, _14
 ; D:\TC\temp\codegen.c:82: }
	leave	
	ret	
	.def	create_tac_status;	.scl	3;	.type	32;	.endef
create_tac_status:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; tac, tac
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp86, status
 ; D:\TC\temp\codegen.c:85:     status->tac = tac;
	movq	-8(%rbp), %rax	 ; status, tmp87
	movq	16(%rbp), %rdx	 ; tac, tmp88
	movq	%rdx, (%rax)	 ; tmp88, status_5->tac
 ; D:\TC\temp\codegen.c:86:     status->current_subroutine = NULL;
	movq	-8(%rbp), %rax	 ; status, tmp89
	movq	$0, 8(%rax)	 ;, status_5->current_subroutine
 ; D:\TC\temp\codegen.c:87:     status->current_block = NULL;
	movq	-8(%rbp), %rax	 ; status, tmp90
	movq	$0, 16(%rax)	 ;, status_5->current_block
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	movq	-8(%rbp), %rdx	 ; status, tmp91
	movq	%rax, 24(%rdx)	 ; _1, status_5->end_labels
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	movq	-8(%rbp), %rdx	 ; status, tmp92
	movq	%rax, 32(%rdx)	 ; _2, status_5->start_labels
 ; D:\TC\temp\codegen.c:90:     status->attr_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp93
	movq	$0, 40(%rax)	 ;, status_5->attr_count
 ; D:\TC\temp\codegen.c:91:     status->param_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp94
	movq	$0, 48(%rax)	 ;, status_5->param_count
 ; D:\TC\temp\codegen.c:92:     status->var_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp95
	movq	$0, 56(%rax)	 ;, status_5->var_count
 ; D:\TC\temp\codegen.c:93:     status->temp_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp96
	movq	$0, 64(%rax)	 ;, status_5->temp_count
 ; D:\TC\temp\codegen.c:94:     status->block_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp97
	movq	$0, 72(%rax)	 ;, status_5->block_count
 ; D:\TC\temp\codegen.c:95:     status->subroutine_count = 0;
	movq	-8(%rbp), %rax	 ; status, tmp98
	movq	$0, 80(%rax)	 ;, status_5->subroutine_count
 ; D:\TC\temp\codegen.c:96:     return status;
	movq	-8(%rbp), %rax	 ; status, _20
 ; D:\TC\temp\codegen.c:97: }
	leave	
	ret	
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; return_type, return_type
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, subroutine
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movq	-8(%rbp), %rax	 ; subroutine, tmp88
	movq	16(%rbp), %rdx	 ; name, tmp89
	movq	%rdx, (%rax)	 ; tmp89, subroutine_6->name
 ; D:\TC\temp\codegen.c:101:     subroutine->return_type = return_type;
	movq	-8(%rbp), %rax	 ; subroutine, tmp90
	movq	24(%rbp), %rdx	 ; return_type, tmp91
	movq	%rdx, 8(%rax)	 ; tmp91, subroutine_6->return_type
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	movq	-8(%rbp), %rdx	 ; subroutine, tmp92
	movq	%rax, 16(%rdx)	 ; _1, subroutine_6->parameters
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	movq	-8(%rbp), %rdx	 ; subroutine, tmp93
	movq	%rax, 24(%rdx)	 ; _2, subroutine_6->local_vars
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	movq	-8(%rbp), %rdx	 ; subroutine, tmp94
	movq	%rax, 32(%rdx)	 ; _3, subroutine_6->blocks
 ; D:\TC\temp\codegen.c:105:     return subroutine;
	movq	-8(%rbp), %rax	 ; subroutine, _17
 ; D:\TC\temp\codegen.c:106: }
	leave	
	ret	
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; label, label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, block
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	-8(%rbp), %rax	 ; block, tmp86
	movq	16(%rbp), %rdx	 ; label, tmp87
	movq	%rdx, (%rax)	 ; tmp87, block_4->label
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	-8(%rbp), %rdx	 ; block, tmp88
	movq	%rax, 8(%rdx)	 ; _1, block_4->instructions
 ; D:\TC\temp\codegen.c:111:     return block;
	movq	-8(%rbp), %rax	 ; block, _9
 ; D:\TC\temp\codegen.c:112: }
	leave	
	ret	
	.section .rdata,"dr"
.LC2:
	.ascii "\0"
.LC3:
	.ascii "$%d-error\0"
.LC4:
	.ascii "$%c%zu\0"
	.text
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; original_name, original_name
	movq	%rdx, 24(%rbp)	 ; type, type
	movl	%r8d, 32(%rbp)	 ; kind, kind
	movq	%r9, 40(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -16(%rbp)	 ; tmp99, var
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	-16(%rbp), %rax	 ; var, tmp100
	movq	16(%rbp), %rdx	 ; original_name, tmp101
	movq	%rdx, (%rax)	 ; tmp101, var_27->original_name
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	movl	32(%rbp), %eax	 ; kind, tmp103
	subl	$97, %eax	 ;, tmp102
	cmpl	$21, %eax	 ;, tmp102
	ja	.L53	 ;,
	movl	%eax, %eax	 ; tmp102, tmp104
	leaq	0(,%rax,4), %rdx	 ;, tmp105
	leaq	.L55(%rip), %rax	 ;, tmp106
	movl	(%rdx,%rax), %eax	 ;, tmp107
	cltq
	leaq	.L55(%rip), %rdx	 ;, tmp110
	addq	%rdx, %rax	 ; tmp110, tmp109
	jmp	*%rax	 ; tmp109
	.section .rdata,"dr"
	.align 4
.L55:
	.long	.L60-.L55
	.long	.L59-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L58-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L57-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L53-.L55
	.long	.L56-.L55
	.long	.L53-.L55
	.long	.L54-.L55
	.text
.L60:
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp111
	movq	40(%rax), %rax	 ; status_31(D)->attr_count, _1
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rax), %rcx	 ;, _3
	movq	40(%rbp), %rdx	 ; status, tmp112
	movq	%rcx, 40(%rdx)	 ; _3, status_31(D)->attr_count
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	%rax, -8(%rbp)	 ; _1, id
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L61	 ;
.L57:
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp113
	movq	48(%rax), %rax	 ; status_31(D)->param_count, _4
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rax), %rcx	 ;, _6
	movq	40(%rbp), %rdx	 ; status, tmp114
	movq	%rcx, 48(%rdx)	 ; _6, status_31(D)->param_count
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	%rax, -8(%rbp)	 ; _4, id
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L61	 ;
.L54:
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp115
	movq	56(%rax), %rax	 ; status_31(D)->var_count, _7
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rax), %rcx	 ;, _9
	movq	40(%rbp), %rdx	 ; status, tmp116
	movq	%rcx, 56(%rdx)	 ; _9, status_31(D)->var_count
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	%rax, -8(%rbp)	 ; _7, id
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L61	 ;
.L56:
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp117
	movq	64(%rax), %rax	 ; status_31(D)->temp_count, _10
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rax), %rcx	 ;, _12
	movq	40(%rbp), %rdx	 ; status, tmp118
	movq	%rcx, 64(%rdx)	 ; _12, status_31(D)->temp_count
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	%rax, -8(%rbp)	 ; _10, id
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L61	 ;
.L59:
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp119
	movq	72(%rax), %rax	 ; status_31(D)->block_count, _13
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rax), %rcx	 ;, _15
	movq	40(%rbp), %rdx	 ; status, tmp120
	movq	%rcx, 72(%rdx)	 ; _15, status_31(D)->block_count
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	%rax, -8(%rbp)	 ; _13, id
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L61	 ;
.L58:
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	40(%rbp), %rax	 ; status, tmp121
	movq	80(%rax), %rax	 ; status_31(D)->subroutine_count, _16
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rax), %rcx	 ;, _18
	movq	40(%rbp), %rdx	 ; status, tmp122
	movq	%rcx, 80(%rdx)	 ; _18, status_31(D)->subroutine_count
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	%rax, -8(%rbp)	 ; _16, id
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L61	 ;
.L53:
 ; D:\TC\temp\codegen.c:124:         default: id = (size_t)-1; break;
	movq	$-1, -8(%rbp)	 ;, id
 ; D:\TC\temp\codegen.c:124:         default: id = (size_t)-1; break;
	nop	
.L61:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	-16(%rbp), %rdx	 ; var, tmp124
	movq	%rax, 8(%rdx)	 ; _19, var_27->name
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, -8(%rbp)	 ;, id
	jne	.L62	 ;,
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movq	-16(%rbp), %rax	 ; var, tmp125
	movq	8(%rax), %rax	 ; var_27->name, _20
	movl	32(%rbp), %edx	 ; kind, tmp126
	movl	%edx, %r8d	 ; tmp126,
	leaq	.LC3(%rip), %rdx	 ;, tmp127
	movq	%rax, %rcx	 ; _20,
	call	sprintf	 ;
	jmp	.L63	 ;
.L62:
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	-16(%rbp), %rax	 ; var, tmp128
	movq	8(%rax), %rax	 ; var_27->name, _21
	movq	-8(%rbp), %rcx	 ; id, tmp129
	movl	32(%rbp), %edx	 ; kind, tmp130
	movq	%rcx, %r9	 ; tmp129,
	movl	%edx, %r8d	 ; tmp130,
	leaq	.LC4(%rip), %rdx	 ;, tmp131
	movq	%rax, %rcx	 ; _21,
	call	sprintf	 ;
.L63:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	-16(%rbp), %rax	 ; var, tmp132
	movq	24(%rbp), %rdx	 ; type, tmp133
	movq	%rdx, 16(%rax)	 ; tmp133, var_27->type
 ; D:\TC\temp\codegen.c:132:     return var;
	movq	-16(%rbp), %rax	 ; var, _51
 ; D:\TC\temp\codegen.c:133: }
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
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movq	-8(%rbp), %rax	 ; inst, tmp85
	movl	16(%rbp), %edx	 ; type, tmp86
	movl	%edx, 24(%rax)	 ; tmp86, inst_3->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	-8(%rbp), %rax	 ; inst, tmp87
	movq	24(%rbp), %rdx	 ; arg1, tmp88
	movq	%rdx, (%rax)	 ; tmp88, inst_3->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	-8(%rbp), %rax	 ; inst, tmp89
	movq	32(%rbp), %rdx	 ; arg2, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, inst_3->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	-8(%rbp), %rax	 ; inst, tmp91
	movq	40(%rbp), %rdx	 ; arg3, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, inst_3->arg3
 ; D:\TC\temp\codegen.c:140:     return inst;
	movq	-8(%rbp), %rax	 ; inst, _12
 ; D:\TC\temp\codegen.c:141: }
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
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp98, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movq	-8(%rbp), %rax	 ; arg, tmp99
	movl	16(%rbp), %edx	 ; kind, tmp100
	movl	%edx, 16(%rax)	 ; tmp100, arg_18->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	-8(%rbp), %rax	 ; arg, tmp101
	movq	$0, 8(%rax)	 ;, arg_18->type
 ; D:\TC\temp\codegen.c:146:     switch (kind) {
	cmpl	$7, 16(%rbp)	 ;, kind
	ja	.L68	 ;,
	movl	16(%rbp), %eax	 ; kind, tmp102
	leaq	0(,%rax,4), %rdx	 ;, tmp103
	leaq	.L70(%rip), %rax	 ;, tmp104
	movl	(%rdx,%rax), %eax	 ;, tmp105
	cltq
	leaq	.L70(%rip), %rdx	 ;, tmp108
	addq	%rdx, %rax	 ; tmp108, tmp107
	jmp	*%rax	 ; tmp107
	.section .rdata,"dr"
	.align 4
.L70:
	.long	.L77-.L70
	.long	.L76-.L70
	.long	.L75-.L70
	.long	.L74-.L70
	.long	.L73-.L70
	.long	.L72-.L70
	.long	.L71-.L70
	.long	.L69-.L70
	.text
.L77:
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp109
	movq	24(%rbp), %rdx	 ; value, tmp110
	movq	%rdx, (%rax)	 ; tmp110, arg_18->value.variable
 ; D:\TC\temp\codegen.c:149:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	 ; arg, tmp111
	movq	(%rax), %rax	 ; arg_18->value.variable, _1
 ; D:\TC\temp\codegen.c:149:             arg->type = arg->value.variable->type;
	movq	16(%rax), %rdx	 ; _1->type, _2
 ; D:\TC\temp\codegen.c:149:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	 ; arg, tmp112
	movq	%rdx, 8(%rax)	 ; _2, arg_18->type
 ; D:\TC\temp\codegen.c:150:             break;
	jmp	.L78	 ;
.L76:
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	24(%rbp), %rax	 ; value, tmp113
	movq	(%rax), %rdx	 ; MEM[(long long int *)value_22(D)], _3
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp114
	movq	%rdx, (%rax)	 ; _3, arg_18->value.int_value
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp115
	movq	(%rax), %rdx	 ; name_int, name_int.6_4
	movq	-8(%rbp), %rax	 ; arg, tmp116
	movq	%rdx, 8(%rax)	 ; name_int.6_4, arg_18->type
 ; D:\TC\temp\codegen.c:154:             break;
	jmp	.L78	 ;
.L75:
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	24(%rbp), %rax	 ; value, tmp117
	movsd	(%rax), %xmm0	 ; MEM[(double *)value_22(D)], _5
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp118
	movsd	%xmm0, (%rax)	 ; _5, arg_18->value.float_value
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp119
	movq	(%rax), %rdx	 ; name_float, name_float.7_6
	movq	-8(%rbp), %rax	 ; arg, tmp120
	movq	%rdx, 8(%rax)	 ; name_float.7_6, arg_18->type
 ; D:\TC\temp\codegen.c:158:             break;
	jmp	.L78	 ;
.L74:
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movq	-8(%rbp), %rax	 ; arg, tmp121
	movq	24(%rbp), %rdx	 ; value, tmp122
	movq	%rdx, (%rax)	 ; tmp122, arg_18->value.string_value
 ; D:\TC\temp\codegen.c:161:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rax	 ;, tmp123
	movq	(%rax), %rdx	 ; name_string, name_string.8_7
	movq	-8(%rbp), %rax	 ; arg, tmp124
	movq	%rdx, 8(%rax)	 ; name_string.8_7, arg_18->type
 ; D:\TC\temp\codegen.c:162:             break;
	jmp	.L78	 ;
.L73:
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movq	24(%rbp), %rax	 ; value, tmp125
	movzbl	(%rax), %edx	 ; MEM[(char *)value_22(D)], _8
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp126
	movb	%dl, (%rax)	 ; _8, arg_18->value.bool_value
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp127
	movq	(%rax), %rdx	 ; name_bool, name_bool.9_9
	movq	-8(%rbp), %rax	 ; arg, tmp128
	movq	%rdx, 8(%rax)	 ; name_bool.9_9, arg_18->type
 ; D:\TC\temp\codegen.c:166:             break;
	jmp	.L78	 ;
.L72:
 ; D:\TC\temp\codegen.c:168:             arg->value.string_value = NULL;
	movq	-8(%rbp), %rax	 ; arg, tmp129
	movq	$0, (%rax)	 ;, arg_18->value.string_value
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp130
	movq	(%rax), %rdx	 ; name_void, name_void.10_10
	movq	-8(%rbp), %rax	 ; arg, tmp131
	movq	%rdx, 8(%rax)	 ; name_void.10_10, arg_18->type
 ; D:\TC\temp\codegen.c:170:             break;
	jmp	.L78	 ;
.L71:
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp132
	movq	24(%rbp), %rdx	 ; value, tmp133
	movq	%rdx, (%rax)	 ; tmp133, arg_18->value.label
 ; D:\TC\temp\codegen.c:173:             break;
	jmp	.L78	 ;
.L69:
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	-8(%rbp), %rax	 ; arg, tmp134
	movq	24(%rbp), %rdx	 ; value, tmp135
	movq	%rdx, (%rax)	 ; tmp135, arg_18->value.subroutine
 ; D:\TC\temp\codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	 ; arg, tmp136
	movq	(%rax), %rax	 ; arg_18->value.subroutine, _11
 ; D:\TC\temp\codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	16(%rax), %rdx	 ; _11->type, _12
 ; D:\TC\temp\codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	 ; arg, tmp137
	movq	%rdx, 8(%rax)	 ; _12, arg_18->type
 ; D:\TC\temp\codegen.c:177:             break;
	jmp	.L78	 ;
.L68:
 ; D:\TC\temp\codegen.c:180:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:180:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	24(%rax), %rax	 ; _13->_stderr, _14
 ; D:\TC\temp\codegen.c:180:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movl	16(%rbp), %edx	 ; kind, tmp138
	movl	%edx, %r8d	 ; tmp138,
	leaq	.LC5(%rip), %rdx	 ;, tmp139
	movq	%rax, %rcx	 ; _14,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:181:             break;
	nop	
.L78:
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movq	-8(%rbp), %rax	 ; arg, tmp140
	movb	$0, 20(%rax)	 ;, arg_18->is_get
 ; D:\TC\temp\codegen.c:184:     return arg;
	movq	-8(%rbp), %rax	 ; arg, _41
 ; D:\TC\temp\codegen.c:185: }
	leave	
	ret	
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; arg, arg
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	cmpq	$0, 16(%rbp)	 ;, arg
	jne	.L81	 ;,
 ; D:\TC\temp\codegen.c:188:         return NULL;
	movl	$0, %eax	 ;, _7
	jmp	.L82	 ;
.L81:
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	movq	16(%rbp), %rax	 ; arg, tmp90
	movzbl	20(%rax), %eax	 ; arg_9(D)->is_get, _1
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	testb	%al, %al	 ; _1
	je	.L83	 ;,
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	16(%rbp), %rax	 ; arg, tmp91
	movq	8(%rax), %rax	 ; arg_9(D)->type, _2
	movq	24(%rbp), %rdx	 ; status, tmp92
	movq	%rdx, %r9	 ; tmp92,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _2,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _3,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -8(%rbp)	 ; tmp93, temp
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rdx	 ; arg, tmp94
	movq	-8(%rbp), %rax	 ; temp, tmp95
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp94,
	movq	%rax, %rdx	 ; tmp95,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ;, _4
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	24(%rbp), %rax	 ; status, tmp96
	movq	16(%rax), %rax	 ; status_12(D)->current_block, _5
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:192:         return temp;
	movq	-8(%rbp), %rax	 ; temp, _7
	jmp	.L82	 ;
.L83:
 ; D:\TC\temp\codegen.c:194:     return arg;
	movq	16(%rbp), %rax	 ; arg, _7
.L82:
 ; D:\TC\temp\codegen.c:195: }
	leave	
	ret	
	.def	find_var_by_symbol;	.scl	3;	.type	32;	.endef
find_var_by_symbol:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$16, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; vars, vars
	movq	%rdx, 24(%rbp)	 ; symbol, symbol
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	cmpq	$0, 16(%rbp)	 ;, vars
	je	.L85	 ;,
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	cmpq	$0, 24(%rbp)	 ;, symbol
	jne	.L86	 ;,
.L85:
 ; D:\TC\temp\codegen.c:199:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L87	 ;
.L86:
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	16(%rbp), %rax	 ; vars, tmp85
	movq	(%rax), %rax	 ; vars_4(D)->head, tmp86
	movq	%rax, -8(%rbp)	 ; tmp86, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	jmp	.L88	 ;
.L90:
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	-8(%rbp), %rax	 ; current, tmp87
	movq	8(%rax), %rax	 ; current_2->content, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	$0, -16(%rbp)	 ;, var
	je	.L89	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	movq	-16(%rbp), %rax	 ; var, tmp89
	movq	(%rax), %rax	 ; var_9->original_name, _1
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	%rax, 24(%rbp)	 ; _1, symbol
	jne	.L89	 ;,
 ; D:\TC\temp\codegen.c:204:             return var;
	movq	-16(%rbp), %rax	 ; var, _3
	jmp	.L87	 ;
.L89:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp90
	movq	(%rax), %rax	 ; current_2->next, tmp91
	movq	%rax, -8(%rbp)	 ; tmp91, current
.L88:
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L90	 ;,
 ; D:\TC\temp\codegen.c:207:     return NULL;
	movl	$0, %eax	 ;, _3
.L87:
 ; D:\TC\temp\codegen.c:208: }
	leave	
	ret	
	.def	resolve_named_var;	.scl	3;	.type	32;	.endef
resolve_named_var:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; symbol, symbol
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:211:     if (symbol == NULL || status == NULL)
	cmpq	$0, 16(%rbp)	 ;, symbol
	je	.L92	 ;,
 ; D:\TC\temp\codegen.c:211:     if (symbol == NULL || status == NULL)
	cmpq	$0, 24(%rbp)	 ;, status
	jne	.L93	 ;,
.L92:
 ; D:\TC\temp\codegen.c:212:         return NULL;
	movl	$0, %eax	 ;, _8
	jmp	.L94	 ;
.L93:
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	24(%rbp), %rax	 ; status, tmp91
	movq	8(%rax), %rax	 ; status_12(D)->current_subroutine, _1
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rax, %rax	 ; _1
	je	.L95	 ;,
 ; D:\TC\temp\codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	24(%rbp), %rax	 ; status, tmp92
	movq	8(%rax), %rax	 ; status_12(D)->current_subroutine, _2
 ; D:\TC\temp\codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rax), %rax	 ; _2->parameters, _3
	movq	16(%rbp), %rdx	 ; symbol, tmp93
	movq	%rax, %rcx	 ; _3,
	call	find_var_by_symbol	 ;
	movq	%rax, -8(%rbp)	 ; tmp94, var
 ; D:\TC\temp\codegen.c:215:         if (var != NULL)
	cmpq	$0, -8(%rbp)	 ;, var
	je	.L96	 ;,
 ; D:\TC\temp\codegen.c:216:             return var;
	movq	-8(%rbp), %rax	 ; var, _8
	jmp	.L94	 ;
.L96:
 ; D:\TC\temp\codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rbp), %rax	 ; status, tmp95
	movq	8(%rax), %rax	 ; status_12(D)->current_subroutine, _4
 ; D:\TC\temp\codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rax), %rax	 ; _4->local_vars, _5
	movq	16(%rbp), %rdx	 ; symbol, tmp96
	movq	%rax, %rcx	 ; _5,
	call	find_var_by_symbol	 ;
	movq	%rax, -8(%rbp)	 ; tmp97, var
 ; D:\TC\temp\codegen.c:218:         if (var != NULL)
	cmpq	$0, -8(%rbp)	 ;, var
	je	.L95	 ;,
 ; D:\TC\temp\codegen.c:219:             return var;
	movq	-8(%rbp), %rax	 ; var, _8
	jmp	.L94	 ;
.L95:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	24(%rbp), %rax	 ; status, tmp98
	movq	(%rax), %rax	 ; status_12(D)->tac, _6
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	16(%rax), %rax	 ; _6->global_vars, _7
	movq	16(%rbp), %rdx	 ; symbol, tmp99
	movq	%rax, %rcx	 ; _7,
	call	find_var_by_symbol	 ;
.L94:
 ; D:\TC\temp\codegen.c:222: }
	leave	
	ret	
	.def	find_self_parameter;	.scl	3;	.type	32;	.endef
find_self_parameter:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	cmpq	$0, 16(%rbp)	 ;, status
	je	.L98	 ;,
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	movq	16(%rbp), %rax	 ; status, tmp92
	movq	8(%rax), %rax	 ; status_14(D)->current_subroutine, _1
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L99	 ;,
.L98:
 ; D:\TC\temp\codegen.c:226:         return NULL;
	movl	$0, %eax	 ;, _10
	jmp	.L100	 ;
.L99:
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%rbp), %rax	 ; status, tmp93
	movq	8(%rax), %rax	 ; status_14(D)->current_subroutine, _2
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%rax), %rax	 ; _2->parameters, _3
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	(%rax), %rax	 ; _3->head, tmp94
	movq	%rax, -8(%rbp)	 ; tmp94, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	jmp	.L101	 ;
.L103:
 ; D:\TC\temp\codegen.c:229:         Var* var = (Var*)current->content;
	movq	-8(%rbp), %rax	 ; current, tmp95
	movq	8(%rax), %rax	 ; current_9->content, tmp96
	movq	%rax, -16(%rbp)	 ; tmp96, var
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	cmpq	$0, -16(%rbp)	 ;, var
	je	.L102	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	-16(%rbp), %rax	 ; var, tmp97
	movq	(%rax), %rax	 ; var_18->original_name, _4
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	 ; _4
	je	.L102	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp98
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD.11_5
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	-16(%rbp), %rax	 ; var, tmp99
	movq	(%rax), %rax	 ; var_18->original_name, _6
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rax	 ; _6->name, _7
	movq	%rax, %rcx	 ; _7,
	call	string_equal	 ;
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	 ; _8
	je	.L102	 ;,
 ; D:\TC\temp\codegen.c:231:             return var;
	movq	-16(%rbp), %rax	 ; var, _10
	jmp	.L100	 ;
.L102:
 ; D:\TC\temp\codegen.c:232:         current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp100
	movq	(%rax), %rax	 ; current_9->next, tmp101
	movq	%rax, -8(%rbp)	 ; tmp101, current
.L101:
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L103	 ;,
 ; D:\TC\temp\codegen.c:234:     return NULL;
	movl	$0, %eax	 ;, _10
.L100:
 ; D:\TC\temp\codegen.c:235: }
	leave	
	ret	
	.section .rdata,"dr"
.LC6:
	.ascii "<unknown>\0"
	.align 8
.LC7:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC8:
	.ascii "$a%zu\0"
	.text
	.def	create_attribute_ref_var;	.scl	3;	.type	32;	.endef
create_attribute_ref_var:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$96, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class_type, class_type
	movq	%rdx, 24(%rbp)	 ; attr_name, attr_name
	movq	%r8, 32(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:238:     if (attr_name == NULL)
	cmpq	$0, 24(%rbp)	 ;, attr_name
	jne	.L105	 ;,
 ; D:\TC\temp\codegen.c:239:         return NULL;
	movl	$0, %eax	 ;, _13
	jmp	.L106	 ;
.L105:
 ; D:\TC\temp\codegen.c:240:     AttributeTable* table = find_attribute_table(status, class_type);
	movq	16(%rbp), %rdx	 ; class_type, tmp95
	movq	32(%rbp), %rax	 ; status, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	find_attribute_table	 ;
	movq	%rax, -40(%rbp)	 ; tmp97, table
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, -40(%rbp)	 ;, table
	je	.L107	 ;,
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	-40(%rbp), %rax	 ; table, tmp98
	movq	(%rax), %rax	 ; table_23->attributes, _1
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L108	 ;,
.L107:
 ; D:\TC\temp\codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	24(%rbp), %rax	 ; attr_name, tmp99
	movq	(%rax), %rdx	 ; attr_name_18(D)->type, _2
	movq	32(%rbp), %rcx	 ; status, tmp100
	movq	24(%rbp), %rax	 ; attr_name, tmp101
	movq	%rcx, %r9	 ; tmp100,
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp101,
	call	create_var	 ;
	jmp	.L106	 ;
.L108:
 ; D:\TC\temp\codegen.c:243:     size_t index = 0;
	movq	$0, -24(%rbp)	 ;, index
 ; D:\TC\temp\codegen.c:244:     bool found = false;
	movb	$0, -25(%rbp)	 ;, found
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	-40(%rbp), %rax	 ; table, tmp102
	movq	(%rax), %rax	 ; table_23->attributes, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -48(%rbp)	 ; tmp103, attrs
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	jmp	.L109	 ;
.L112:
 ; D:\TC\temp\codegen.c:248:         if (attr->var_name == attr_name) {
	movq	-56(%rbp), %rax	 ; attr, tmp104
	movq	(%rax), %rax	 ; attr_29->var_name, _4
 ; D:\TC\temp\codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	%rax, 24(%rbp)	 ; _4, attr_name
	jne	.L110	 ;,
 ; D:\TC\temp\codegen.c:249:             found = true;
	movb	$1, -25(%rbp)	 ;, found
 ; D:\TC\temp\codegen.c:250:             break;
	jmp	.L111	 ;
.L110:
 ; D:\TC\temp\codegen.c:252:         ++index;
	addq	$1, -24(%rbp)	 ;, index
.L109:
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	-48(%rbp), %rax	 ; attrs, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	list_pop	 ;
	movq	%rax, -56(%rbp)	 ; tmp106, attr
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	cmpq	$0, -56(%rbp)	 ;, attr
	jne	.L112	 ;,
.L111:
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -64(%rbp)	 ; tmp107, var
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	-64(%rbp), %rax	 ; var, tmp108
	movq	24(%rbp), %rdx	 ; attr_name, tmp109
	movq	%rdx, (%rax)	 ; tmp109, var_33->original_name
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	24(%rbp), %rax	 ; attr_name, tmp110
	movq	(%rax), %rdx	 ; attr_name_18(D)->type, _5
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	-64(%rbp), %rax	 ; var, tmp111
	movq	%rdx, 16(%rax)	 ; _5, var_33->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	-64(%rbp), %rdx	 ; var, tmp113
	movq	%rax, 8(%rdx)	 ; _6, var_33->name
 ; D:\TC\temp\codegen.c:258:     if (!found)
	cmpb	$0, -25(%rbp)	 ;, found
	jne	.L113	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	cmpq	$0, 16(%rbp)	 ;, class_type
	je	.L114	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	16(%rbp), %rax	 ; class_type, tmp114
	movq	8(%rax), %rbx	 ; class_type_21(D)->name, iftmp.12_14
	jmp	.L115	 ;
.L114:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC6(%rip), %rbx	 ;, iftmp.12_14
.L115:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	24(%rbp), %rax	 ; attr_name, tmp115
	movq	8(%rax), %rsi	 ; attr_name_18(D)->name, _7
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	-24(%rbp), %rdx	 ; index, tmp116
	movq	%rdx, 32(%rsp)	 ; tmp116,
	movq	%rbx, %r9	 ; iftmp.12_14,
	movq	%rsi, %r8	 ; _7,
	leaq	.LC7(%rip), %rdx	 ;, tmp117
	movq	%rax, %rcx	 ; _9,
	call	fprintf	 ;
.L113:
 ; D:\TC\temp\codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	-64(%rbp), %rax	 ; var, tmp118
	movq	8(%rax), %rax	 ; var_33->name, _10
	movq	-24(%rbp), %rdx	 ; index, tmp119
	movq	%rdx, %r8	 ; tmp119,
	leaq	.LC8(%rip), %rdx	 ;, tmp120
	movq	%rax, %rcx	 ; _10,
	call	sprintf	 ;
 ; D:\TC\temp\codegen.c:261:     return var;
	movq	-64(%rbp), %rax	 ; var, _13
.L106:
 ; D:\TC\temp\codegen.c:262: }
	addq	$96, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[warning] Invalid attribute access\12\0"
	.text
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; object, object
	movq	%rdx, 24(%rbp)	 ; attr_name, attr_name
	movq	%r8, 32(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:265:     if (object == NULL || attr_name == NULL) {
	cmpq	$0, 16(%rbp)	 ;, object
	je	.L117	 ;,
 ; D:\TC\temp\codegen.c:265:     if (object == NULL || attr_name == NULL) {
	cmpq	$0, 24(%rbp)	 ;, attr_name
	jne	.L118	 ;,
.L117:
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movq	%rax, %r9	 ; _2,
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rax	 ;, tmp94
	movq	%rax, %rcx	 ; tmp94,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:267:         return NULL;
	movl	$0, %eax	 ;, _12
	jmp	.L119	 ;
.L118:
 ; D:\TC\temp\codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	32(%rbp), %rdx	 ; status, tmp95
	movq	16(%rbp), %rax	 ; object, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	load_rvalue	 ;
	movq	%rax, -16(%rbp)	 ; tmp97, object_value
 ; D:\TC\temp\codegen.c:270:     if (object_value == NULL)
	cmpq	$0, -16(%rbp)	 ;, object_value
	jne	.L120	 ;,
 ; D:\TC\temp\codegen.c:271:         return NULL;
	movl	$0, %eax	 ;, _12
	jmp	.L119	 ;
.L120:
 ; D:\TC\temp\codegen.c:272:     Symbol* class_type = NULL;
	movq	$0, -8(%rbp)	 ;, class_type
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; object_value, tmp98
	movq	8(%rax), %rax	 ; object_value_19->type, _3
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _3
	je	.L121	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	 ; object_value, tmp99
	movq	8(%rax), %rax	 ; object_value_19->type, _4
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _4->kind, _5
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _5
	jne	.L121	 ;,
 ; D:\TC\temp\codegen.c:274:         class_type = object_value->type;
	movq	-16(%rbp), %rax	 ; object_value, tmp100
	movq	8(%rax), %rax	 ; object_value_19->type, tmp101
	movq	%rax, -8(%rbp)	 ; tmp101, class_type
.L121:
 ; D:\TC\temp\codegen.c:275:     Var* attr_var = create_attribute_ref_var(class_type, attr_name, status);
	movq	32(%rbp), %rcx	 ; status, tmp102
	movq	24(%rbp), %rdx	 ; attr_name, tmp103
	movq	-8(%rbp), %rax	 ; class_type, tmp104
	movq	%rcx, %r8	 ; tmp102,
	movq	%rax, %rcx	 ; tmp104,
	call	create_attribute_ref_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp105, attr_var
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	24(%rbp), %rax	 ; attr_name, tmp106
	movq	(%rax), %rax	 ; attr_name_15(D)->type, _6
	movq	32(%rbp), %rdx	 ; status, tmp107
	movq	%rdx, %r9	 ; tmp107,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _6,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _7,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -32(%rbp)	 ; tmp108, result
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	-24(%rbp), %rax	 ; attr_var, tmp109
	movq	%rax, %rdx	 ; tmp109,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	-16(%rbp), %rcx	 ; object_value, tmp110
	movq	-32(%rbp), %rax	 ; result, tmp111
	movq	%rdx, %r9	 ; _8,
	movq	%rcx, %r8	 ; tmp110,
	movq	%rax, %rdx	 ; tmp111,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -40(%rbp)	 ; tmp112, inst
 ; D:\TC\temp\codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	32(%rbp), %rax	 ; status, tmp113
	movq	16(%rax), %rax	 ; status_17(D)->current_block, _9
 ; D:\TC\temp\codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _9->instructions, _10
	movq	-40(%rbp), %rdx	 ; inst, tmp114
	movq	%rax, %rcx	 ; _10,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:279:     result->is_get = true;
	movq	-32(%rbp), %rax	 ; result, tmp115
	movb	$1, 20(%rax)	 ;, result_26->is_get
 ; D:\TC\temp\codegen.c:280:     return result;
	movq	-32(%rbp), %rax	 ; result, _12
.L119:
 ; D:\TC\temp\codegen.c:281: }
	leave	
	ret	
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; value, value
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	cmpq	$0, 16(%rbp)	 ;, value
	je	.L126	 ;,
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	cmpq	$0, 24(%rbp)	 ;, status
	je	.L126	 ;,
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	16(%rbp), %rax	 ; value, tmp88
	movq	8(%rax), %rax	 ; value_8(D)->type, _1
	movq	%rax, %rcx	 ; _1,
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, -16(%rbp)	 ; _3, size
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	leaq	-16(%rbp), %rax	 ;, tmp89
	movq	%rax, %rdx	 ; tmp89,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movq	16(%rbp), %rdx	 ; value, tmp90
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp90,
	movq	%rax, %rdx	 ; _4,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -8(%rbp)	 ; tmp91, inst
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp92
	movq	16(%rax), %rax	 ; status_9(D)->current_block, _5
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	-8(%rbp), %rdx	 ; inst, tmp93
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
	jmp	.L122	 ;
.L126:
 ; D:\TC\temp\codegen.c:285:         return;
	nop	
.L122:
 ; D:\TC\temp\codegen.c:289: }
	leave	
	ret	
	.section .rdata,"dr"
.LC10:
	.ascii "main\0"
	.text
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; code, code
 ; D:\TC\temp\codegen.c:292:     TAC* tac = create_tac();
	call	create_tac	 ;
	movq	%rax, -8(%rbp)	 ; tmp97, tac
 ; D:\TC\temp\codegen.c:293:     TACStatus* status = create_tac_status(tac);
	movq	-8(%rbp), %rax	 ; tac, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	create_tac_status	 ;
	movq	%rax, -16(%rbp)	 ; tmp99, status
 ; D:\TC\temp\codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	16(%rbp), %rax	 ; code, tmp100
	movq	(%rax), %rax	 ; code_20(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp101, members
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L128	 ;
.L132:
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movq	-32(%rbp), %rax	 ; code_member, tmp102
	movl	8(%rax), %eax	 ; code_member_24->type, _2
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	jne	.L129	 ;,
 ; D:\TC\temp\codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp103
	movq	(%rax), %rax	 ; code_member_24->content.function, _3
	movq	-16(%rbp), %rdx	 ; status, tmp104
	movq	%rax, %rcx	 ; _3,
	call	codegen_function	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	-32(%rbp), %rax	 ; code_member, tmp105
	movq	(%rax), %rax	 ; code_member_24->content.function, _4
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rax	 ; _4->name, _5
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rax), %rax	 ; _5->name, _6
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC10(%rip), %rdx	 ;, tmp106
	movq	%rax, %rcx	 ; _6,
	call	strcmp	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; _7
	jne	.L128	 ;,
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	-32(%rbp), %rax	 ; code_member, tmp107
	movq	(%rax), %rax	 ; code_member_24->content.function, _8
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	(%rax), %rdx	 ; _8->name, _9
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	-8(%rbp), %rax	 ; tac, tmp108
	movq	%rdx, 8(%rax)	 ; _9, tac_17->entry_point
	jmp	.L128	 ;
.L129:
 ; D:\TC\temp\codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	movq	-32(%rbp), %rax	 ; code_member, tmp109
	movl	8(%rax), %eax	 ; code_member_24->type, _10
 ; D:\TC\temp\codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _10
	jne	.L131	 ;,
 ; D:\TC\temp\codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp110
	movq	(%rax), %rax	 ; code_member_24->content.class, _11
	movq	-16(%rbp), %rdx	 ; status, tmp111
	movq	%rax, %rcx	 ; _11,
	call	codegen_class	 ;
	jmp	.L128	 ;
.L131:
 ; D:\TC\temp\codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	movq	-32(%rbp), %rax	 ; code_member, tmp112
	movl	8(%rax), %eax	 ; code_member_24->type, _12
 ; D:\TC\temp\codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _12
	jne	.L128	 ;,
 ; D:\TC\temp\codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	-32(%rbp), %rax	 ; code_member, tmp113
	movq	(%rax), %rax	 ; code_member_24->content.import, _13
	movq	-16(%rbp), %rcx	 ; status, tmp114
	movq	-8(%rbp), %rdx	 ; tac, tmp115
	movq	%rcx, %r8	 ; tmp114,
	movq	%rax, %rcx	 ; _13,
	call	codegen_import	 ;
.L128:
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	 ; members, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp117, code_member
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, code_member
	jne	.L132	 ;,
 ; D:\TC\temp\codegen.c:307:     return tac;
	movq	-8(%rbp), %rax	 ; tac, _25
 ; D:\TC\temp\codegen.c:308: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; import, import
	movq	%rdx, 24(%rbp)	 ; tac, tac
	movq	%r8, 32(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	16(%rbp), %rax	 ; import, tmp107
	movq	(%rax), %rax	 ; import_28(D)->name, _1
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rax), %eax	 ; _1->kind, _2
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	 ;, _2
	jne	.L135	 ;,
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rbp), %rax	 ; import, tmp108
	movq	(%rax), %rax	 ; import_28(D)->name, _3
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rax), %rdx	 ; _3->type, _4
	movq	16(%rbp), %rax	 ; import, tmp109
	movq	(%rax), %rax	 ; import_28(D)->name, _5
	movq	32(%rbp), %rcx	 ; status, tmp110
	movq	%rcx, %r9	 ; tmp110,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _5,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _6
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	24(%rbp), %rax	 ; tac, tmp111
	movq	16(%rax), %rax	 ; tac_32(D)->global_vars, _7
	movq	%rax, %rcx	 ; _7,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:318: }
	jmp	.L140	 ;
.L135:
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	16(%rbp), %rax	 ; import, tmp112
	movq	(%rax), %rax	 ; import_28(D)->name, _8
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	 ; _8->kind, _9
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, _9
	je	.L137	 ;,
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	16(%rbp), %rax	 ; import, tmp113
	movq	(%rax), %rax	 ; import_28(D)->name, _10
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	 ; _10->kind, _11
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _11
	jne	.L138	 ;,
.L137:
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rax	 ; import, tmp114
	movq	(%rax), %rax	 ; import_28(D)->name, _12
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; _12->type, _13
	movq	16(%rbp), %rax	 ; import, tmp115
	movq	(%rax), %rax	 ; import_28(D)->name, _14
	movq	32(%rbp), %rcx	 ; status, tmp116
	movq	%rcx, %r9	 ; tmp116,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; _14,
	call	create_var	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	24(%rbp), %rax	 ; tac, tmp117
	movq	16(%rax), %rax	 ; tac_32(D)->global_vars, _16
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:318: }
	jmp	.L140	 ;
.L138:
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	movq	16(%rbp), %rax	 ; import, tmp118
	movq	(%rax), %rax	 ; import_28(D)->name, _17
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _17->kind, _18
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _18
	jne	.L139	 ;,
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	16(%rbp), %rax	 ; import, tmp119
	movq	(%rax), %rax	 ; import_28(D)->name, _19
	movq	%rax, %rcx	 ; _19,
	call	create_attribute_table	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	24(%rbp), %rax	 ; tac, tmp120
	movq	(%rax), %rax	 ; tac_32(D)->attribute_tables, _21
	movq	%rax, %rcx	 ; _21,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:318: }
	jmp	.L140	 ;
.L139:
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	16(%rbp), %rax	 ; import, tmp121
	movq	(%rax), %rax	 ; import_28(D)->name, _22
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	32(%rax), %ebx	 ; _22->kind, _23
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	24(%rax), %rax	 ; _24->_stderr, _25
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _23,
	leaq	.LC11(%rip), %rdx	 ;, tmp122
	movq	%rax, %rcx	 ; _25,
	call	fprintf	 ;
.L140:
 ; D:\TC\temp\codegen.c:318: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; function, function
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	16(%rbp), %rax	 ; function, tmp94
	movq	8(%rax), %rdx	 ; function_16(D)->return_type, _1
	movq	16(%rbp), %rax	 ; function, tmp95
	movq	(%rax), %rax	 ; function_16(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_subroutine	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, subroutine
 ; D:\TC\temp\codegen.c:322:     status->current_subroutine = subroutine;
	movq	24(%rbp), %rax	 ; status, tmp97
	movq	-8(%rbp), %rdx	 ; subroutine, tmp98
	movq	%rdx, 8(%rax)	 ; tmp98, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rbp), %rax	 ; status, tmp99
	movq	(%rax), %rax	 ; status_19(D)->tac, _3
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	 ; _3->subroutines, _4
	movq	-8(%rbp), %rdx	 ; subroutine, tmp100
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp101
	movq	16(%rax), %rax	 ; function_16(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, parameters
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L142	 ;
.L143:
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
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
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	 ; subroutine, tmp106
	movq	16(%rax), %rax	 ; subroutine_18->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
.L142:
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	 ; parameters, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, parameter
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, parameter
	jne	.L143	 ;,
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	24(%rbp), %rax	 ; status, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rcx	 ; _10,
	call	create_block	 ;
	movq	%rax, -32(%rbp)	 ; tmp110, block
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	 ; subroutine, tmp111
	movq	32(%rax), %rax	 ; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	 ; block, tmp112
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:332:     status->current_block = block;
	movq	24(%rbp), %rax	 ; status, tmp113
	movq	-32(%rbp), %rdx	 ; block, tmp114
	movq	%rdx, 16(%rax)	 ; tmp114, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp115
	movq	24(%rax), %rax	 ; function_16(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -40(%rbp)	 ; tmp116, statements
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L144	 ;
.L145:
 ; D:\TC\temp\codegen.c:337:         codegen_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp117
	movq	-48(%rbp), %rax	 ; statement, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	codegen_statement	 ;
.L144:
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	 ; statements, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp120, statement
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L145	 ;,
 ; D:\TC\temp\codegen.c:339:     status->current_subroutine = NULL;
	movq	24(%rbp), %rax	 ; status, tmp121
	movq	$0, 8(%rax)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:340: }
	nop	
	leave	
	ret	
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; method, method
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	16(%rbp), %rax	 ; method, tmp94
	movq	8(%rax), %rdx	 ; method_16(D)->return_type, _1
	movq	16(%rbp), %rax	 ; method, tmp95
	movq	(%rax), %rax	 ; method_16(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_subroutine	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, subroutine
 ; D:\TC\temp\codegen.c:344:     status->current_subroutine = subroutine;
	movq	24(%rbp), %rax	 ; status, tmp97
	movq	-8(%rbp), %rdx	 ; subroutine, tmp98
	movq	%rdx, 8(%rax)	 ; tmp98, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rbp), %rax	 ; status, tmp99
	movq	(%rax), %rax	 ; status_19(D)->tac, _3
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	 ; _3->subroutines, _4
	movq	-8(%rbp), %rdx	 ; subroutine, tmp100
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rax	 ; method, tmp101
	movq	16(%rax), %rax	 ; method_16(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, parameters
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L147	 ;
.L148:
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
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
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	 ; subroutine, tmp106
	movq	16(%rax), %rax	 ; subroutine_18->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
.L147:
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	 ; parameters, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, parameter
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, parameter
	jne	.L148	 ;,
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	24(%rbp), %rax	 ; status, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rcx	 ; _10,
	call	create_block	 ;
	movq	%rax, -32(%rbp)	 ; tmp110, block
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	 ; subroutine, tmp111
	movq	32(%rax), %rax	 ; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	 ; block, tmp112
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:354:     status->current_block = block;
	movq	24(%rbp), %rax	 ; status, tmp113
	movq	-32(%rbp), %rdx	 ; block, tmp114
	movq	%rdx, 16(%rax)	 ; tmp114, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	16(%rbp), %rax	 ; method, tmp115
	movq	24(%rax), %rax	 ; method_16(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -40(%rbp)	 ; tmp116, statements
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L149	 ;
.L150:
 ; D:\TC\temp\codegen.c:359:         codegen_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp117
	movq	-48(%rbp), %rax	 ; statement, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	codegen_statement	 ;
.L149:
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	 ; statements, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp120, statement
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L150	 ;,
 ; D:\TC\temp\codegen.c:361:     status->current_subroutine = NULL;
	movq	24(%rbp), %rax	 ; status, tmp121
	movq	$0, 8(%rax)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:362: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class, class
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	16(%rbp), %rax	 ; class, tmp93
	movq	8(%rax), %rax	 ; class_14(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp94, members
 ; D:\TC\temp\codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	16(%rbp), %rax	 ; class, tmp95
	movq	(%rax), %rax	 ; class_14(D)->name, _2
	movq	%rax, %rcx	 ; _2,
	call	create_attribute_table	 ;
	movq	%rax, -32(%rbp)	 ; tmp96, attr_table
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	16(%rbp), %rax	 ; class, tmp97
	movq	24(%rax), %rdx	 ; class_14(D)->size, _3
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	-32(%rbp), %rax	 ; attr_table, tmp98
	movq	%rdx, 16(%rax)	 ; _3, attr_table_18->size
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	24(%rbp), %rax	 ; status, tmp99
	movq	(%rax), %rax	 ; status_20(D)->tac, _4
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	 ; _4->attribute_tables, _5
	movq	-32(%rbp), %rdx	 ; attr_table, tmp100
	movq	%rax, %rcx	 ; _5,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L152	 ;
.L157:
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	movq	-40(%rbp), %rax	 ; member, tmp101
	movl	8(%rax), %eax	 ; member_23->type, _6
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	testl	%eax, %eax	 ; _6
	je	.L153	 ;,
	cmpl	$1, %eax	 ;, _6
	je	.L154	 ;,
	jmp	.L158	 ;
.L153:
 ; D:\TC\temp\codegen.c:373:                 codegen_method(member->content.method, status);
	movq	-40(%rbp), %rax	 ; member, tmp102
	movq	(%rax), %rax	 ; member_23->content.method, _7
	movq	24(%rbp), %rdx	 ; status, tmp103
	movq	%rax, %rcx	 ; _7,
	call	codegen_method	 ;
 ; D:\TC\temp\codegen.c:374:                 break;
	jmp	.L152	 ;
.L154:
 ; D:\TC\temp\codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	-40(%rbp), %rax	 ; member, tmp104
	movq	(%rax), %rax	 ; member_23->content.variable, _8
	movq	24(%rbp), %rdx	 ; status, tmp105
	movl	$97, %r8d	 ;,
	movq	%rax, %rcx	 ; _8,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:377:                 break;
	jmp	.L152	 ;
.L158:
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movq	-40(%rbp), %rax	 ; member, tmp106
	movl	8(%rax), %ebx	 ; member_23->type, _9
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movq	24(%rax), %rax	 ; _10->_stderr, _11
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movl	%ebx, %r8d	 ; _9,
	leaq	.LC12(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; _11,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:380:                 break;
	nop	
.L152:
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	 ; members, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp109, member
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	cmpq	$0, -40(%rbp)	 ;, member
	jne	.L157	 ;,
 ; D:\TC\temp\codegen.c:383: }
	nop	
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC13:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable, variable
	movq	%rdx, 24(%rbp)	 ; status, status
	movl	%r8d, 32(%rbp)	 ; type, type
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	16(%rbp), %rax	 ; variable, tmp100
	movq	(%rax), %rdx	 ; variable_21(D)->type, _1
	movq	16(%rbp), %rax	 ; variable, tmp101
	movq	8(%rax), %rax	 ; variable_21(D)->name, _2
	movq	24(%rbp), %r8	 ; status, tmp102
	movl	32(%rbp), %ecx	 ; type, tmp103
	movq	%r8, %r9	 ; tmp102,
	movl	%ecx, %r8d	 ; tmp103,
	movq	%rax, %rcx	 ; _2,
	call	create_var	 ;
	movq	%rax, -8(%rbp)	 ; tmp104, var
 ; D:\TC\temp\codegen.c:386:     switch (type) {
	movl	32(%rbp), %eax	 ; type, tmp106
	subl	$97, %eax	 ;, tmp105
	cmpl	$21, %eax	 ;, tmp105
	ja	.L160	 ;,
	movl	%eax, %eax	 ; tmp105, tmp107
	leaq	0(,%rax,4), %rdx	 ;, tmp108
	leaq	.L162(%rip), %rax	 ;, tmp109
	movl	(%rdx,%rax), %eax	 ;, tmp110
	cltq
	leaq	.L162(%rip), %rdx	 ;, tmp113
	addq	%rdx, %rax	 ; tmp113, tmp112
	jmp	*%rax	 ; tmp112
	.section .rdata,"dr"
	.align 4
.L162:
	.long	.L166-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L165-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L164-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L160-.L162
	.long	.L163-.L162
	.long	.L160-.L162
	.long	.L161-.L162
	.text
.L164:
 ; D:\TC\temp\codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	24(%rbp), %rax	 ; status, tmp114
	movq	8(%rax), %rax	 ; status_23(D)->current_subroutine, _3
 ; D:\TC\temp\codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	16(%rax), %rax	 ; _3->parameters, _4
	movq	-8(%rbp), %rdx	 ; var, tmp115
	movq	%rax, %rcx	 ; _4,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:389:             break;
	jmp	.L167	 ;
.L161:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rbp), %rax	 ; status, tmp116
	movq	8(%rax), %rax	 ; status_23(D)->current_subroutine, _5
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rax	 ; _5->local_vars, _6
	movq	-8(%rbp), %rdx	 ; var, tmp117
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:392:             break;
	jmp	.L167	 ;
.L163:
 ; D:\TC\temp\codegen.c:394:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rbp), %rax	 ; status, tmp118
	movq	8(%rax), %rax	 ; status_23(D)->current_subroutine, _7
 ; D:\TC\temp\codegen.c:394:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rax	 ; _7->local_vars, _8
	movq	-8(%rbp), %rdx	 ; var, tmp119
	movq	%rax, %rcx	 ; _8,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:395:             break;
	jmp	.L167	 ;
.L165:
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	24(%rbp), %rax	 ; status, tmp120
	movq	(%rax), %rax	 ; status_23(D)->tac, _9
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rax	 ; _9->global_vars, _10
	movq	-8(%rbp), %rdx	 ; var, tmp121
	movq	%rax, %rcx	 ; _10,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:398:             break;
	jmp	.L167	 ;
.L166:
 ; D:\TC\temp\codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	24(%rbp), %rax	 ; status, tmp122
	movq	(%rax), %rax	 ; status_23(D)->tac, _11
 ; D:\TC\temp\codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rax), %rax	 ; _11->attribute_tables, _12
	movq	%rax, %rcx	 ; _12,
	call	list_pop_back	 ;
	movq	%rax, -16(%rbp)	 ; tmp123, attr_table
 ; D:\TC\temp\codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	24(%rbp), %rax	 ; status, tmp124
	movq	(%rax), %rax	 ; status_23(D)->tac, _13
 ; D:\TC\temp\codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	 ; _13->attribute_tables, _14
	movq	-16(%rbp), %rdx	 ; attr_table, tmp125
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	16(%rbp), %rax	 ; variable, tmp126
	movq	(%rax), %rdx	 ; variable_21(D)->type, _15
	movq	16(%rbp), %rax	 ; variable, tmp127
	movq	8(%rax), %rax	 ; variable_21(D)->name, _16
	movq	-16(%rbp), %rcx	 ; attr_table, tmp128
	movl	$0, %r9d	 ;,
	movq	%rcx, %r8	 ; tmp128,
	movq	%rax, %rcx	 ; _16,
	call	create_attribute	 ;
 ; D:\TC\temp\codegen.c:403:             break;
	jmp	.L167	 ;
.L160:
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movq	24(%rax), %rax	 ; _17->_stderr, _18
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movl	32(%rbp), %edx	 ; type, tmp129
	movl	%edx, %r8d	 ; tmp129,
	leaq	.LC13(%rip), %rdx	 ;, tmp130
	movq	%rax, %rcx	 ; _18,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:408:             break;
	nop	
.L167:
 ; D:\TC\temp\codegen.c:410: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC14:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC15:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC16:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$88, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; statement, statement
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	movq	16(%rbp), %rax	 ; statement, tmp110
	movl	8(%rax), %eax	 ; statement_31(D)->type, _1
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	cmpl	$7, %eax	 ;, _1
	ja	.L169	 ;,
	movl	%eax, %eax	 ; _1, tmp111
	leaq	0(,%rax,4), %rdx	 ;, tmp112
	leaq	.L171(%rip), %rax	 ;, tmp113
	movl	(%rdx,%rax), %eax	 ;, tmp114
	cltq
	leaq	.L171(%rip), %rdx	 ;, tmp117
	addq	%rdx, %rax	 ; tmp117, tmp116
	jmp	*%rax	 ; tmp116
	.section .rdata,"dr"
	.align 4
.L171:
	.long	.L178-.L171
	.long	.L177-.L171
	.long	.L176-.L171
	.long	.L175-.L171
	.long	.L174-.L171
	.long	.L173-.L171
	.long	.L172-.L171
	.long	.L170-.L171
	.text
.L178:
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp118
	movq	(%rax), %rax	 ; statement_31(D)->stmt.expr, _2
	movq	24(%rbp), %rdx	 ; status, tmp119
	movq	%rax, %rcx	 ; _2,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	.L179	 ;
.L177:
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	16(%rbp), %rax	 ; statement, tmp120
	movq	(%rax), %rax	 ; statement_31(D)->stmt.var, _3
	movq	24(%rbp), %rdx	 ; status, tmp121
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _3,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L179	 ;
.L176:
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp122
	movq	(%rax), %rax	 ; statement_31(D)->stmt.if_stmt, _4
	movq	24(%rbp), %rdx	 ; status, tmp123
	movq	%rax, %rcx	 ; _4,
	call	codegen_if	 ;
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	.L179	 ;
.L175:
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp124
	movq	(%rax), %rax	 ; statement_31(D)->stmt.while_stmt, _5
	movq	24(%rbp), %rdx	 ; status, tmp125
	movq	%rax, %rcx	 ; _5,
	call	codegen_while	 ;
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	.L179	 ;
.L174:
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	16(%rbp), %rax	 ; statement, tmp126
	movq	(%rax), %rax	 ; statement_31(D)->stmt.for_stmt, _6
	movq	24(%rbp), %rdx	 ; status, tmp127
	movq	%rax, %rcx	 ; _6,
	call	codegen_for	 ;
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	.L179	 ;
.L173:
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	16(%rbp), %rax	 ; statement, tmp128
	movq	(%rax), %rax	 ; statement_31(D)->stmt.return_expr, _7
	movq	24(%rbp), %rdx	 ; status, tmp129
	movq	%rax, %rcx	 ; _7,
	call	codegen_expression	 ;
	movq	%rax, -56(%rbp)	 ; tmp130, return_value
 ; D:\TC\temp\codegen.c:420:             Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
	movq	-56(%rbp), %rax	 ; return_value, tmp131
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp131,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp132, inst
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp133
	movq	16(%rax), %rax	 ; status_32(D)->current_block, _8
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _8->instructions, _9
	movq	-64(%rbp), %rdx	 ; inst, tmp134
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:422:             break;
	jmp	.L179	 ;
.L172:
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rbp), %rax	 ; status, tmp135
	movq	24(%rax), %rax	 ; status_32(D)->end_labels, _10
	movq	%rax, %rcx	 ; _10,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; _11
	jne	.L180	 ;,
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbp), %rax	 ; status, tmp136
	movq	24(%rax), %rax	 ; status_32(D)->end_labels, _12
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _12->tail, _13
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _13->content, tmp137
	movq	%rax, -40(%rbp)	 ; tmp137, label
 ; D:\TC\temp\codegen.c:427:                 if (label != NULL) {
	cmpq	$0, -40(%rbp)	 ;, label
	je	.L180	 ;,
 ; D:\TC\temp\codegen.c:428:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-40(%rbp), %rax	 ; label, tmp138
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp138,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -48(%rbp)	 ; tmp139, inst
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp140
	movq	16(%rax), %rax	 ; status_32(D)->current_block, _14
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _14->instructions, _15
	movq	-48(%rbp), %rdx	 ; inst, tmp141
	movq	%rax, %rcx	 ; _15,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:430:                     break;
	jmp	.L179	 ;
.L180:
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	24(%rax), %rax	 ; _16->_stderr, _17
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	%rax, %r9	 ; _17,
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:434:             break;
	jmp	.L179	 ;
.L170:
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	24(%rbp), %rax	 ; status, tmp143
	movq	32(%rax), %rax	 ; status_32(D)->start_labels, _18
	movq	%rax, %rcx	 ; _18,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; _19
	jne	.L181	 ;,
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	24(%rbp), %rax	 ; status, tmp144
	movq	32(%rax), %rax	 ; status_32(D)->start_labels, _20
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _20->tail, _21
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _21->content, tmp145
	movq	%rax, -24(%rbp)	 ; tmp145, label
 ; D:\TC\temp\codegen.c:438:                 if (label != NULL) {
	cmpq	$0, -24(%rbp)	 ;, label
	je	.L181	 ;,
 ; D:\TC\temp\codegen.c:439:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-24(%rbp), %rax	 ; label, tmp146
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp146,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp147, inst
 ; D:\TC\temp\codegen.c:440:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	16(%rax), %rax	 ; status_32(D)->current_block, _22
 ; D:\TC\temp\codegen.c:440:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _22->instructions, _23
	movq	-32(%rbp), %rdx	 ; inst, tmp149
	movq	%rax, %rcx	 ; _23,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:441:                     break;
	jmp	.L179	 ;
.L181:
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	24(%rax), %rax	 ; _24->_stderr, _25
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	%rax, %r9	 ; _25,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:445:             break;
	jmp	.L179	 ;
.L169:
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movq	16(%rbp), %rax	 ; statement, tmp151
	movl	8(%rax), %ebx	 ; statement_31(D)->type, _26
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movq	24(%rax), %rax	 ; _27->_stderr, _28
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _26,
	leaq	.LC16(%rip), %rdx	 ;, tmp152
	movq	%rax, %rcx	 ; _28,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:448:             break;
	nop	
.L179:
 ; D:\TC\temp\codegen.c:450: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$200, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; if_, if_
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp124, then_label
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp125
	movq	%rax, %r9	 ; tmp125,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp126, else_label
 ; D:\TC\temp\codegen.c:455:     Var* end_label = NULL;
	movq	$0, -32(%rbp)	 ;, end_label
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp127
	movq	16(%rax), %rax	 ; if__62(D)->else_if, _1
	movq	%rax, %rcx	 ; _1,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _2
	je	.L183	 ;,
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp128
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _3
	movq	%rax, %rcx	 ; _3,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _4
	je	.L183	 ;,
 ; D:\TC\temp\codegen.c:457:         end_label = else_label;
	movq	-24(%rbp), %rax	 ; else_label, tmp129
	movq	%rax, -32(%rbp)	 ; tmp129, end_label
	jmp	.L184	 ;
.L183:
 ; D:\TC\temp\codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -32(%rbp)	 ; tmp131, end_label
.L184:
 ; D:\TC\temp\codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	-32(%rbp), %rax	 ; end_label, tmp132
	movq	%rax, %rdx	 ; tmp132,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp133, end_block_arg
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	16(%rbp), %rax	 ; if_, tmp134
	movq	(%rax), %rax	 ; if__62(D)->condition, _5
	movq	24(%rbp), %rdx	 ; status, tmp135
	movq	%rax, %rcx	 ; _5,
	call	codegen_expression	 ;
	movq	%rax, -56(%rbp)	 ; tmp136, condition
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	 ; else_label, tmp137
	movq	%rax, %rdx	 ; tmp137,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _6
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	 ; then_label, tmp138
	movq	%rax, %rdx	 ; tmp138,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	 ; condition, tmp139
	movq	%rbx, %r9	 ; _6,
	movq	%rdx, %r8	 ; _7,
	movq	%rax, %rdx	 ; tmp139,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp140, inst
 ; D:\TC\temp\codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp141
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _8
 ; D:\TC\temp\codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _8->instructions, _9
	movq	-64(%rbp), %rdx	 ; inst, tmp142
	movq	%rax, %rcx	 ; _9,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:466:     Block* then_block = create_block(then_label);
	movq	-40(%rbp), %rax	 ; then_label, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp144, then_block
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	24(%rbp), %rax	 ; status, tmp145
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _10
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	 ; _10->blocks, _11
	movq	-72(%rbp), %rdx	 ; then_block, tmp146
	movq	%rax, %rcx	 ; _11,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:468:     status->current_block = then_block;
	movq	24(%rbp), %rax	 ; status, tmp147
	movq	-72(%rbp), %rdx	 ; then_block, tmp148
	movq	%rdx, 16(%rax)	 ; tmp148, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	16(%rbp), %rax	 ; if_, tmp149
	movq	8(%rax), %rax	 ; if__62(D)->body, _12
	movq	%rax, %rcx	 ; _12,
	call	list_copy	 ;
	movq	%rax, -80(%rbp)	 ; tmp150, then_statements
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L185	 ;
.L186:
 ; D:\TC\temp\codegen.c:473:         codegen_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp151
	movq	-88(%rbp), %rax	 ; statement, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	codegen_statement	 ;
.L185:
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	-80(%rbp), %rax	 ; then_statements, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	list_pop	 ;
	movq	%rax, -88(%rbp)	 ; tmp154, statement
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L186	 ;,
 ; D:\TC\temp\codegen.c:475:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp155
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp155,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp156, jump_to_end
 ; D:\TC\temp\codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp157
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _13
 ; D:\TC\temp\codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _13->instructions, _14
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp158
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%rbp), %rax	 ; if_, tmp159
	movq	16(%rax), %rax	 ; if__62(D)->else_if, _15
	movq	%rax, %rcx	 ; _15,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; _16
	jne	.L187	 ;,
 ; D:\TC\temp\codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%rbp), %rax	 ; if_, tmp160
	movq	16(%rax), %rax	 ; if__62(D)->else_if, _17
	movq	%rax, %rcx	 ; _17,
	call	list_copy	 ;
	movq	%rax, -104(%rbp)	 ; tmp161, elif_list
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L188	 ;
.L192:
 ; D:\TC\temp\codegen.c:484:             Block* else_if_block = create_block(else_label);
	movq	-24(%rbp), %rax	 ; else_label, tmp162
	movq	%rax, %rcx	 ; tmp162,
	call	create_block	 ;
	movq	%rax, -120(%rbp)	 ; tmp163, else_if_block
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	24(%rbp), %rax	 ; status, tmp164
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _18
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	32(%rax), %rax	 ; _18->blocks, _19
	movq	-120(%rbp), %rdx	 ; else_if_block, tmp165
	movq	%rax, %rcx	 ; _19,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:486:             status->current_block = else_if_block;
	movq	24(%rbp), %rax	 ; status, tmp166
	movq	-120(%rbp), %rdx	 ; else_if_block, tmp167
	movq	%rdx, 16(%rax)	 ; tmp167, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp168
	movq	%rax, %r9	 ; tmp168,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp169, then_label
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp170
	movq	%rax, %r9	 ; tmp170,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp171, else_label
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	-112(%rbp), %rax	 ; elif, tmp172
	movq	(%rax), %rax	 ; elif_92->condition, _20
	movq	24(%rbp), %rdx	 ; status, tmp173
	movq	%rax, %rcx	 ; _20,
	call	codegen_expression	 ;
	movq	%rax, -56(%rbp)	 ; tmp174, condition
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-104(%rbp), %rax	 ; elif_list, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _21
	je	.L189	 ;,
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rbp), %rax	 ; if_, tmp176
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _22
	movq	%rax, %rcx	 ; _22,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; _23
	je	.L189	 ;,
 ; D:\TC\temp\codegen.c:493:                 else_label = end_label;
	movq	-32(%rbp), %rax	 ; end_label, tmp177
	movq	%rax, -24(%rbp)	 ; tmp177, else_label
.L189:
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	 ; else_label, tmp178
	movq	%rax, %rdx	 ; tmp178,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _24
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	 ; then_label, tmp179
	movq	%rax, %rdx	 ; tmp179,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	 ; condition, tmp180
	movq	%rbx, %r9	 ; _24,
	movq	%rdx, %r8	 ; _25,
	movq	%rax, %rdx	 ; tmp180,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp181, inst
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp182
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _26
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _26->instructions, _27
	movq	-64(%rbp), %rdx	 ; inst, tmp183
	movq	%rax, %rcx	 ; _27,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:497:             then_block = create_block(then_label);
	movq	-40(%rbp), %rax	 ; then_label, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp185, then_block
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	24(%rbp), %rax	 ; status, tmp186
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _28
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	 ; _28->blocks, _29
	movq	-72(%rbp), %rdx	 ; then_block, tmp187
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:499:             status->current_block = then_block;
	movq	24(%rbp), %rax	 ; status, tmp188
	movq	-72(%rbp), %rdx	 ; then_block, tmp189
	movq	%rdx, 16(%rax)	 ; tmp189, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	-112(%rbp), %rax	 ; elif, tmp190
	movq	8(%rax), %rax	 ; elif_92->body, _30
	movq	%rax, %rcx	 ; _30,
	call	list_copy	 ;
	movq	%rax, -128(%rbp)	 ; tmp191, elif_statements
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L190	 ;
.L191:
 ; D:\TC\temp\codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp192
	movq	-136(%rbp), %rax	 ; elif_statement, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	codegen_statement	 ;
.L190:
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	-128(%rbp), %rax	 ; elif_statements, tmp194
	movq	%rax, %rcx	 ; tmp194,
	call	list_pop	 ;
	movq	%rax, -136(%rbp)	 ; tmp195, elif_statement
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	cmpq	$0, -136(%rbp)	 ;, elif_statement
	jne	.L191	 ;,
 ; D:\TC\temp\codegen.c:506:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp196
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp196,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp197, jump_to_end
 ; D:\TC\temp\codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp198
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _31
 ; D:\TC\temp\codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _31->instructions, _32
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp199
	movq	%rax, %rcx	 ; _32,
	call	list_append	 ;
.L188:
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	-104(%rbp), %rax	 ; elif_list, tmp200
	movq	%rax, %rcx	 ; tmp200,
	call	list_pop	 ;
	movq	%rax, -112(%rbp)	 ; tmp201, elif
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	cmpq	$0, -112(%rbp)	 ;, elif
	jne	.L192	 ;,
.L187:
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	16(%rbp), %rax	 ; if_, tmp202
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _33
	movq	%rax, %rcx	 ; _33,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; _34
	jne	.L193	 ;,
 ; D:\TC\temp\codegen.c:513:         Block* else_block = create_block(else_label);
	movq	-24(%rbp), %rax	 ; else_label, tmp203
	movq	%rax, %rcx	 ; tmp203,
	call	create_block	 ;
	movq	%rax, -144(%rbp)	 ; tmp204, else_block
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	24(%rbp), %rax	 ; status, tmp205
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _35
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	32(%rax), %rax	 ; _35->blocks, _36
	movq	-144(%rbp), %rdx	 ; else_block, tmp206
	movq	%rax, %rcx	 ; _36,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:515:         status->current_block = else_block;
	movq	24(%rbp), %rax	 ; status, tmp207
	movq	-144(%rbp), %rdx	 ; else_block, tmp208
	movq	%rdx, 16(%rax)	 ; tmp208, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	16(%rbp), %rax	 ; if_, tmp209
	movq	24(%rax), %rax	 ; if__62(D)->else_body, _37
	movq	%rax, %rcx	 ; _37,
	call	list_copy	 ;
	movq	%rax, -152(%rbp)	 ; tmp210, else_statements
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L194	 ;
.L195:
 ; D:\TC\temp\codegen.c:520:             codegen_statement(else_statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp211
	movq	-160(%rbp), %rax	 ; else_statement, tmp212
	movq	%rax, %rcx	 ; tmp212,
	call	codegen_statement	 ;
.L194:
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	-152(%rbp), %rax	 ; else_statements, tmp213
	movq	%rax, %rcx	 ; tmp213,
	call	list_pop	 ;
	movq	%rax, -160(%rbp)	 ; tmp214, else_statement
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	cmpq	$0, -160(%rbp)	 ;, else_statement
	jne	.L195	 ;,
 ; D:\TC\temp\codegen.c:522:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	 ; end_block_arg, tmp215
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp215,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -96(%rbp)	 ; tmp216, jump_to_end
 ; D:\TC\temp\codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	24(%rbp), %rax	 ; status, tmp217
	movq	16(%rax), %rax	 ; status_56(D)->current_block, _38
 ; D:\TC\temp\codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	 ; _38->instructions, _39
	movq	-96(%rbp), %rdx	 ; jump_to_end, tmp218
	movq	%rax, %rcx	 ; _39,
	call	list_append	 ;
.L193:
 ; D:\TC\temp\codegen.c:526:     Block* end_block = create_block(end_label);
	movq	-32(%rbp), %rax	 ; end_label, tmp219
	movq	%rax, %rcx	 ; tmp219,
	call	create_block	 ;
	movq	%rax, -168(%rbp)	 ; tmp220, end_block
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp221
	movq	8(%rax), %rax	 ; status_56(D)->current_subroutine, _40
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _40->blocks, _41
	movq	-168(%rbp), %rdx	 ; end_block, tmp222
	movq	%rax, %rcx	 ; _41,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:528:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp223
	movq	-168(%rbp), %rdx	 ; end_block, tmp224
	movq	%rdx, 16(%rax)	 ; tmp224, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:529: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$168, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; for_, for_
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp127
	movq	(%rax), %rax	 ; for__54(D)->initializer, _1
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	testq	%rax, %rax	 ; _1
	je	.L197	 ;,
 ; D:\TC\temp\codegen.c:533:         codegen_variable(for_->initializer, status, VAR_VAR);
	movq	16(%rbp), %rax	 ; for_, tmp128
	movq	(%rax), %rax	 ; for__54(D)->initializer, _2
	movq	24(%rbp), %rdx	 ; status, tmp129
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; _2,
	call	codegen_variable	 ;
.L197:
 ; D:\TC\temp\codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -32(%rbp)	 ; tmp131, condition_label
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp132
	movq	%rax, %r9	 ; tmp132,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -40(%rbp)	 ; tmp133, body_label
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp134
	movq	%rax, %r9	 ; tmp134,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -48(%rbp)	 ; tmp135, end_label
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp136
	movq	8(%rax), %rax	 ; for__54(D)->condition, _3
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	testq	%rax, %rax	 ; _3
	je	.L198	 ;,
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	 ; condition_label, tmp137
	movq	%rax, %rdx	 ; tmp137,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _4,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp138, inst
 ; D:\TC\temp\codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp139
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _5
 ; D:\TC\temp\codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _5->instructions, _6
	movq	-64(%rbp), %rdx	 ; inst, tmp140
	movq	%rax, %rcx	 ; _6,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:542:         Block* condition_block = create_block(condition_label);
	movq	-32(%rbp), %rax	 ; condition_label, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp142, condition_block
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	24(%rbp), %rax	 ; status, tmp143
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _7
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	 ; _7->blocks, _8
	movq	-72(%rbp), %rdx	 ; condition_block, tmp144
	movq	%rax, %rcx	 ; _8,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:544:         status->current_block = condition_block;
	movq	24(%rbp), %rax	 ; status, tmp145
	movq	-72(%rbp), %rdx	 ; condition_block, tmp146
	movq	%rdx, 16(%rax)	 ; tmp146, status_55(D)->current_block
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	16(%rbp), %rax	 ; for_, tmp147
	movq	8(%rax), %rax	 ; for__54(D)->condition, _9
	movq	24(%rbp), %rdx	 ; status, tmp148
	movq	%rax, %rcx	 ; _9,
	call	codegen_expression	 ;
	movq	%rax, -80(%rbp)	 ; tmp149, condition
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; end_label, tmp150
	movq	%rax, %rdx	 ; tmp150,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _10
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-40(%rbp), %rax	 ; body_label, tmp151
	movq	%rax, %rdx	 ; tmp151,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _11
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-80(%rbp), %rax	 ; condition, tmp152
	movq	%rbx, %r9	 ; _10,
	movq	%rdx, %r8	 ; _11,
	movq	%rax, %rdx	 ; tmp152,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp153, inst
 ; D:\TC\temp\codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp154
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _12
 ; D:\TC\temp\codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-64(%rbp), %rdx	 ; inst, tmp155
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
	jmp	.L199	 ;
.L198:
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	 ; body_label, tmp156
	movq	%rax, %rdx	 ; tmp156,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _14,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -56(%rbp)	 ; tmp157, inst
 ; D:\TC\temp\codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp158
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _15
 ; D:\TC\temp\codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _15->instructions, _16
	movq	-56(%rbp), %rdx	 ; inst, tmp159
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
.L199:
 ; D:\TC\temp\codegen.c:555:     Block* body_block = create_block(body_label);
	movq	-40(%rbp), %rax	 ; body_label, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	create_block	 ;
	movq	%rax, -88(%rbp)	 ; tmp161, body_block
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	24(%rbp), %rax	 ; status, tmp162
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _17
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	 ; _17->blocks, _18
	movq	-88(%rbp), %rdx	 ; body_block, tmp163
	movq	%rax, %rcx	 ; _18,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:557:     status->current_block = body_block;
	movq	24(%rbp), %rax	 ; status, tmp164
	movq	-88(%rbp), %rdx	 ; body_block, tmp165
	movq	%rdx, 16(%rax)	 ; tmp165, status_55(D)->current_block
 ; D:\TC\temp\codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp166
	movq	%rax, %r9	 ; tmp166,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -96(%rbp)	 ; tmp167, increment_label
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp168
	movq	16(%rax), %rax	 ; for__54(D)->increment, _19
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	testq	%rax, %rax	 ; _19
	je	.L200	 ;,
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-96(%rbp), %rax	 ; increment_label, tmp169
	movq	%rax, %rdx	 ; tmp169,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	24(%rbp), %rax	 ; status, tmp170
	movq	32(%rax), %rax	 ; status_55(D)->start_labels, _21
	movq	%rax, %rcx	 ; _21,
	call	list_append	 ;
	jmp	.L201	 ;
.L200:
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	movq	16(%rbp), %rax	 ; for_, tmp171
	movq	8(%rax), %rax	 ; for__54(D)->condition, _22
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	testq	%rax, %rax	 ; _22
	je	.L202	 ;,
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-32(%rbp), %rax	 ; condition_label, tmp172
	movq	%rax, %rdx	 ; tmp172,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	24(%rbp), %rax	 ; status, tmp173
	movq	32(%rax), %rax	 ; status_55(D)->start_labels, _24
	movq	%rax, %rcx	 ; _24,
	call	list_append	 ;
	jmp	.L201	 ;
.L202:
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-40(%rbp), %rax	 ; body_label, tmp174
	movq	%rax, %rdx	 ; tmp174,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	24(%rbp), %rax	 ; status, tmp175
	movq	32(%rax), %rax	 ; status_55(D)->start_labels, _26
	movq	%rax, %rcx	 ; _26,
	call	list_append	 ;
.L201:
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; end_label, tmp176
	movq	%rax, %rdx	 ; tmp176,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _27
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbp), %rax	 ; status, tmp177
	movq	24(%rax), %rax	 ; status_55(D)->end_labels, _28
	movq	%rax, %rcx	 ; _28,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	16(%rbp), %rax	 ; for_, tmp178
	movq	24(%rax), %rax	 ; for__54(D)->body, _29
	movq	%rax, %rcx	 ; _29,
	call	list_copy	 ;
	movq	%rax, -104(%rbp)	 ; tmp179, body_statements
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L203	 ;
.L204:
 ; D:\TC\temp\codegen.c:570:         codegen_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp180
	movq	-112(%rbp), %rax	 ; statement, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	codegen_statement	 ;
.L203:
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-104(%rbp), %rax	 ; body_statements, tmp182
	movq	%rax, %rcx	 ; tmp182,
	call	list_pop	 ;
	movq	%rax, -112(%rbp)	 ; tmp183, statement
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -112(%rbp)	 ;, statement
	jne	.L204	 ;,
 ; D:\TC\temp\codegen.c:571:     list_pop_back(status->start_labels);
	movq	24(%rbp), %rax	 ; status, tmp184
	movq	32(%rax), %rax	 ; status_55(D)->start_labels, _30
	movq	%rax, %rcx	 ; _30,
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbp), %rax	 ; status, tmp185
	movq	24(%rax), %rax	 ; status_55(D)->end_labels, _31
	movq	%rax, %rcx	 ; _31,
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:573:     if (for_->increment != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp186
	movq	16(%rax), %rax	 ; for__54(D)->increment, _32
 ; D:\TC\temp\codegen.c:573:     if (for_->increment != NULL) {
	testq	%rax, %rax	 ; _32
	je	.L205	 ;,
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	-96(%rbp), %rax	 ; increment_label, tmp187
	movq	%rax, %rdx	 ; tmp187,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _33,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -120(%rbp)	 ; tmp188, inst
 ; D:\TC\temp\codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp189
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _34
 ; D:\TC\temp\codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _34->instructions, _35
	movq	-120(%rbp), %rdx	 ; inst, tmp190
	movq	%rax, %rcx	 ; _35,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:577:         Block* increment_block = create_block(increment_label);
	movq	-96(%rbp), %rax	 ; increment_label, tmp191
	movq	%rax, %rcx	 ; tmp191,
	call	create_block	 ;
	movq	%rax, -128(%rbp)	 ; tmp192, increment_block
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	24(%rbp), %rax	 ; status, tmp193
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _36
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	32(%rax), %rax	 ; _36->blocks, _37
	movq	-128(%rbp), %rdx	 ; increment_block, tmp194
	movq	%rax, %rcx	 ; _37,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:579:         status->current_block = increment_block;
	movq	24(%rbp), %rax	 ; status, tmp195
	movq	-128(%rbp), %rdx	 ; increment_block, tmp196
	movq	%rdx, 16(%rax)	 ; tmp196, status_55(D)->current_block
 ; D:\TC\temp\codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%rbp), %rax	 ; for_, tmp197
	movq	16(%rax), %rax	 ; for__54(D)->increment, _38
	movq	24(%rbp), %rdx	 ; status, tmp198
	movq	%rax, %rcx	 ; _38,
	call	codegen_expression	 ;
.L205:
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	 ; condition_label, tmp199
	movq	%rax, %rdx	 ; tmp199,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _39,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp200, inst
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	movq	16(%rbp), %rax	 ; for_, tmp201
	movq	8(%rax), %rax	 ; for__54(D)->condition, _40
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	testq	%rax, %rax	 ; _40
	jne	.L206	 ;,
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	 ; body_label, tmp202
	movq	%rax, %rdx	 ; tmp202,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _41,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp203, inst
.L206:
 ; D:\TC\temp\codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp204
	movq	16(%rax), %rax	 ; status_55(D)->current_block, _42
 ; D:\TC\temp\codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _42->instructions, _43
	movq	-24(%rbp), %rdx	 ; inst, tmp205
	movq	%rax, %rcx	 ; _43,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:588:     Block* end_block = create_block(end_label);
	movq	-48(%rbp), %rax	 ; end_label, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	create_block	 ;
	movq	%rax, -136(%rbp)	 ; tmp207, end_block
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp208
	movq	8(%rax), %rax	 ; status_55(D)->current_subroutine, _44
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _44->blocks, _45
	movq	-136(%rbp), %rdx	 ; end_block, tmp209
	movq	%rax, %rcx	 ; _45,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:590:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp210
	movq	-136(%rbp), %rdx	 ; end_block, tmp211
	movq	%rdx, 16(%rax)	 ; tmp211, status_55(D)->current_block
 ; D:\TC\temp\codegen.c:591: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$120, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; while_, while_
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp106
	movq	%rax, %r9	 ; tmp106,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -24(%rbp)	 ; tmp107, condition_label
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	 ; condition_label, tmp108
	movq	%rax, %rdx	 ; tmp108,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _1,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp109, inst
 ; D:\TC\temp\codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp110
	movq	16(%rax), %rax	 ; status_27(D)->current_block, _2
 ; D:\TC\temp\codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _2->instructions, _3
	movq	-32(%rbp), %rdx	 ; inst, tmp111
	movq	%rax, %rcx	 ; _3,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:597:     Block* condition_block = create_block(condition_label);
	movq	-24(%rbp), %rax	 ; condition_label, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	create_block	 ;
	movq	%rax, -40(%rbp)	 ; tmp113, condition_block
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	24(%rbp), %rax	 ; status, tmp114
	movq	8(%rax), %rax	 ; status_27(D)->current_subroutine, _4
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	 ; _4->blocks, _5
	movq	-40(%rbp), %rdx	 ; condition_block, tmp115
	movq	%rax, %rcx	 ; _5,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:599:     status->current_block = condition_block;
	movq	24(%rbp), %rax	 ; status, tmp116
	movq	-40(%rbp), %rdx	 ; condition_block, tmp117
	movq	%rdx, 16(%rax)	 ; tmp117, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp118
	movq	%rax, %r9	 ; tmp118,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -48(%rbp)	 ; tmp119, body_label
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	24(%rbp), %rax	 ; status, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, -56(%rbp)	 ; tmp121, end_label
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	16(%rbp), %rax	 ; while_, tmp122
	movq	(%rax), %rax	 ; while__42(D)->condition, _6
	movq	24(%rbp), %rdx	 ; status, tmp123
	movq	%rax, %rcx	 ; _6,
	call	codegen_expression	 ;
	movq	%rax, -64(%rbp)	 ; tmp124, condition
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	 ; end_label, tmp125
	movq	%rax, %rdx	 ; tmp125,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ;, _7
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	 ; body_label, tmp126
	movq	%rax, %rdx	 ; tmp126,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _8
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-64(%rbp), %rax	 ; condition, tmp127
	movq	%rbx, %r9	 ; _7,
	movq	%rdx, %r8	 ; _8,
	movq	%rax, %rdx	 ; tmp127,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp128, inst
 ; D:\TC\temp\codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp129
	movq	16(%rax), %rax	 ; status_27(D)->current_block, _9
 ; D:\TC\temp\codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _9->instructions, _10
	movq	-32(%rbp), %rdx	 ; inst, tmp130
	movq	%rax, %rcx	 ; _10,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:607:     Block* body_block = create_block(body_label);
	movq	-48(%rbp), %rax	 ; body_label, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	create_block	 ;
	movq	%rax, -72(%rbp)	 ; tmp132, body_block
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	24(%rbp), %rax	 ; status, tmp133
	movq	8(%rax), %rax	 ; status_27(D)->current_subroutine, _11
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	 ; _11->blocks, _12
	movq	-72(%rbp), %rdx	 ; body_block, tmp134
	movq	%rax, %rcx	 ; _12,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:609:     status->current_block = body_block;
	movq	24(%rbp), %rax	 ; status, tmp135
	movq	-72(%rbp), %rdx	 ; body_block, tmp136
	movq	%rdx, 16(%rax)	 ; tmp136, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-24(%rbp), %rax	 ; condition_label, tmp137
	movq	%rax, %rdx	 ; tmp137,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _13
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	24(%rbp), %rax	 ; status, tmp138
	movq	32(%rax), %rax	 ; status_27(D)->start_labels, _14
	movq	%rax, %rcx	 ; _14,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	 ; end_label, tmp139
	movq	%rax, %rdx	 ; tmp139,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbp), %rax	 ; status, tmp140
	movq	24(%rax), %rax	 ; status_27(D)->end_labels, _16
	movq	%rax, %rcx	 ; _16,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	16(%rbp), %rax	 ; while_, tmp141
	movq	8(%rax), %rax	 ; while__42(D)->body, _17
	movq	%rax, %rcx	 ; _17,
	call	list_copy	 ;
	movq	%rax, -80(%rbp)	 ; tmp142, body_statements
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L208	 ;
.L209:
 ; D:\TC\temp\codegen.c:616:         codegen_statement(statement, status);
	movq	24(%rbp), %rdx	 ; status, tmp143
	movq	-88(%rbp), %rax	 ; statement, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	codegen_statement	 ;
.L208:
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-80(%rbp), %rax	 ; body_statements, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	list_pop	 ;
	movq	%rax, -88(%rbp)	 ; tmp146, statement
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -88(%rbp)	 ;, statement
	jne	.L209	 ;,
 ; D:\TC\temp\codegen.c:617:     list_pop_back(status->start_labels);
	movq	24(%rbp), %rax	 ; status, tmp147
	movq	32(%rax), %rax	 ; status_27(D)->start_labels, _18
	movq	%rax, %rcx	 ; _18,
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	24(%rax), %rax	 ; status_27(D)->end_labels, _19
	movq	%rax, %rcx	 ; _19,
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	 ; condition_label, tmp149
	movq	%rax, %rdx	 ; tmp149,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; _20,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -32(%rbp)	 ; tmp150, inst
 ; D:\TC\temp\codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp151
	movq	16(%rax), %rax	 ; status_27(D)->current_block, _21
 ; D:\TC\temp\codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _21->instructions, _22
	movq	-32(%rbp), %rdx	 ; inst, tmp152
	movq	%rax, %rcx	 ; _22,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:623:     Block* end_block = create_block(end_label);
	movq	-56(%rbp), %rax	 ; end_label, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	create_block	 ;
	movq	%rax, -96(%rbp)	 ; tmp154, end_block
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	24(%rbp), %rax	 ; status, tmp155
	movq	8(%rax), %rax	 ; status_27(D)->current_subroutine, _23
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	 ; _23->blocks, _24
	movq	-96(%rbp), %rdx	 ; end_block, tmp156
	movq	%rax, %rcx	 ; _24,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:625:     status->current_block = end_block;
	movq	24(%rbp), %rax	 ; status, tmp157
	movq	-96(%rbp), %rdx	 ; end_block, tmp158
	movq	%rdx, 16(%rax)	 ; tmp158, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:626: }
	nop	
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; expression, expression
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:628:     if (expression->operator == OP_NONE)
	movq	16(%rbp), %rax	 ; expression, tmp106
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _1
 ; D:\TC\temp\codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, %eax	 ;, _1
	jne	.L211	 ;,
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	16(%rbp), %rax	 ; expression, tmp107
	movq	8(%rax), %rax	 ; expression_32(D)->prim_left, _2
	movq	24(%rbp), %rdx	 ; status, tmp108
	movq	%rax, %rcx	 ; _2,
	call	codegen_primary	 ;
	jmp	.L212	 ;
.L211:
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rbp), %rax	 ; expression, tmp109
	movq	16(%rax), %rax	 ; expression_32(D)->right, _3
	movq	24(%rbp), %rdx	 ; status, tmp110
	movq	%rax, %rcx	 ; _3,
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ;, _4
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	24(%rbp), %rax	 ; status, tmp111
	movq	%rax, %rdx	 ; tmp111,
	call	load_rvalue	 ;
	movq	%rax, -8(%rbp)	 ; tmp112, right
 ; D:\TC\temp\codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movq	16(%rbp), %rax	 ; expression, tmp113
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _5
	movl	%eax, %ecx	 ; _5,
	call	get_instruction_type	 ;
	movl	%eax, -20(%rbp)	 ; tmp114, op
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	16(%rbp), %rax	 ; expression, tmp115
	movq	(%rax), %rax	 ; expression_32(D)->expr_left, _6
	movq	24(%rbp), %rdx	 ; status, tmp116
	movq	%rax, %rcx	 ; _6,
	call	codegen_expression	 ;
	movq	%rax, -32(%rbp)	 ; tmp117, left
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	movq	16(%rbp), %rax	 ; expression, tmp118
	movl	24(%rax), %eax	 ; expression_32(D)->operator, _7
	movl	%eax, %ecx	 ; _7,
	call	is_assignment_operator	 ;
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	testb	%al, %al	 ; _8
	je	.L213	 ;,
 ; D:\TC\temp\codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, -20(%rbp)	 ;, op
	je	.L214	 ;,
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; left, tmp119
	movq	8(%rax), %rax	 ; left_40->type, _9
	movq	24(%rbp), %rdx	 ; status, tmp120
	movq	%rdx, %r9	 ; tmp120,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _9,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _10,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -48(%rbp)	 ; tmp121, temp
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	24(%rbp), %rdx	 ; status, tmp122
	movq	-32(%rbp), %rax	 ; left, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ;, _11
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %r8	 ; right, tmp124
	movq	-48(%rbp), %rdx	 ; temp, tmp125
	movl	-20(%rbp), %eax	 ; op, tmp126
	movq	%r8, %r9	 ; tmp124,
	movq	%rcx, %r8	 ; _11,
	movl	%eax, %ecx	 ; tmp126,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp127, inst
 ; D:\TC\temp\codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp128
	movq	16(%rax), %rax	 ; status_33(D)->current_block, _12
 ; D:\TC\temp\codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-16(%rbp), %rdx	 ; inst, tmp129
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:639:             right = temp;
	movq	-48(%rbp), %rax	 ; temp, tmp130
	movq	%rax, -8(%rbp)	 ; tmp130, right
.L214:
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movq	-32(%rbp), %rax	 ; left, tmp131
	movl	16(%rax), %eax	 ; left_40->kind, _14
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	testl	%eax, %eax	 ; _14
	je	.L215	 ;,
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	24(%rax), %rax	 ; _15->_stderr, _16
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	%rax, %r9	 ; _16,
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	fwrite	 ;
.L215:
 ; D:\TC\temp\codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	-8(%rbp), %rdx	 ; right, tmp133
	movq	-32(%rbp), %rax	 ; left, tmp134
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp133,
	movq	%rax, %rdx	 ; tmp134,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp135, inst
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	movq	-32(%rbp), %rax	 ; left, tmp136
	movzbl	20(%rax), %eax	 ; left_40->is_get, _17
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	testb	%al, %al	 ; _17
	je	.L216	 ;,
 ; D:\TC\temp\codegen.c:645:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	-8(%rbp), %rdx	 ; right, tmp137
	movq	-32(%rbp), %rax	 ; left, tmp138
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp137,
	movq	%rax, %rdx	 ; tmp138,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp139, inst
	jmp	.L216	 ;
.L213:
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; left, tmp140
	movq	8(%rax), %rax	 ; left_40->type, _18
	movq	24(%rbp), %rdx	 ; status, tmp141
	movq	%rdx, %r9	 ; tmp141,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _18,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _19,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp142, temp
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	24(%rbp), %rdx	 ; status, tmp143
	movq	-32(%rbp), %rax	 ; left, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ;, _20
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %r8	 ; right, tmp145
	movq	-40(%rbp), %rdx	 ; temp, tmp146
	movl	-20(%rbp), %eax	 ; op, tmp147
	movq	%r8, %r9	 ; tmp145,
	movq	%rcx, %r8	 ; _20,
	movl	%eax, %ecx	 ; tmp147,
	call	create_instruction	 ;
	movq	%rax, -16(%rbp)	 ; tmp148, inst
 ; D:\TC\temp\codegen.c:649:         right = temp;
	movq	-40(%rbp), %rax	 ; temp, tmp149
	movq	%rax, -8(%rbp)	 ; tmp149, right
.L216:
 ; D:\TC\temp\codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp150
	movq	16(%rax), %rax	 ; status_33(D)->current_block, _21
 ; D:\TC\temp\codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _21->instructions, _22
	movq	-16(%rbp), %rdx	 ; inst, tmp151
	movq	%rax, %rcx	 ; _22,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:652:     return right;
	movq	-8(%rbp), %rax	 ; right, _26
.L212:
 ; D:\TC\temp\codegen.c:653: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$136, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; primary, primary
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	movq	16(%rbp), %rax	 ; primary, tmp117
	movl	8(%rax), %eax	 ; primary_41(D)->type, _1
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	cmpl	$8, %eax	 ;, _1
	ja	.L218	 ;,
	movl	%eax, %eax	 ; _1, tmp118
	leaq	0(,%rax,4), %rdx	 ;, tmp119
	leaq	.L220(%rip), %rax	 ;, tmp120
	movl	(%rdx,%rax), %eax	 ;, tmp121
	cltq
	leaq	.L220(%rip), %rdx	 ;, tmp124
	addq	%rdx, %rax	 ; tmp124, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L220:
	.long	.L228-.L220
	.long	.L227-.L220
	.long	.L226-.L220
	.long	.L225-.L220
	.long	.L224-.L220
	.long	.L223-.L220
	.long	.L222-.L220
	.long	.L221-.L220
	.long	.L219-.L220
	.text
.L228:
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	16(%rbp), %rax	 ; primary, tmp125
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _2
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _2,
	call	strtoll	 ;
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, -72(%rbp)	 ; _3, t
 ; D:\TC\temp\codegen.c:658:             return create_arg(ARG_INT, &t);
	leaq	-72(%rbp), %rax	 ;, tmp126
	movq	%rax, %rdx	 ; tmp126,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L229	 ;
.L227:
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	16(%rbp), %rax	 ; primary, tmp127
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _4
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; _4,
	call	strtod	 ;
	movq	%xmm0, %rax	 ;, _5
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	%rax, -80(%rbp)	 ; _5, t
 ; D:\TC\temp\codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	leaq	-80(%rbp), %rax	 ;, tmp128
	movq	%rax, %rdx	 ; tmp128,
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L229	 ;
.L226:
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp129
	movq	(%rax), %rax	 ; primary_41(D)->value.literal_value, _6
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%rax, %rdx	 ; _6,
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L229	 ;
.L225:
 ; D:\TC\temp\codegen.c:666:             bool t = true;
	movb	$1, -81(%rbp)	 ;, t
 ; D:\TC\temp\codegen.c:667:             return create_arg(ARG_BOOL, &t);
	leaq	-81(%rbp), %rax	 ;, tmp130
	movq	%rax, %rdx	 ; tmp130,
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L229	 ;
.L224:
 ; D:\TC\temp\codegen.c:670:             bool t = false;
	movb	$0, -82(%rbp)	 ;, t
 ; D:\TC\temp\codegen.c:671:             return create_arg(ARG_BOOL, &t);
	leaq	-82(%rbp), %rax	 ;, tmp131
	movq	%rax, %rdx	 ; tmp131,
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L229	 ;
.L223:
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	16(%rbp), %rax	 ; primary, tmp132
	movq	(%rax), %rax	 ; primary_41(D)->value.expr, _7
	movq	24(%rbp), %rdx	 ; status, tmp133
	movq	%rax, %rcx	 ; _7,
	call	codegen_expression	 ;
	jmp	.L229	 ;
.L222:
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	16(%rbp), %rax	 ; primary, tmp134
	movq	(%rax), %rax	 ; primary_41(D)->value.operand, _8
	movq	24(%rbp), %rdx	 ; status, tmp135
	movq	%rax, %rcx	 ; _8,
	call	codegen_primary	 ;
	movq	%rax, %rcx	 ;, _9
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	24(%rbp), %rax	 ; status, tmp136
	movq	%rax, %rdx	 ; tmp136,
	call	load_rvalue	 ;
	movq	%rax, -48(%rbp)	 ; tmp137, operand
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp138
	movq	(%rax), %rax	 ; name_bool, name_bool.13_10
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	24(%rbp), %rdx	 ; status, tmp139
	movq	%rdx, %r9	 ; tmp139,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; name_bool.13_10,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _11,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -56(%rbp)	 ; tmp140, temp
 ; D:\TC\temp\codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	-48(%rbp), %rdx	 ; operand, tmp141
	movq	-56(%rbp), %rax	 ; temp, tmp142
	movl	$0, %r9d	 ;,
	movq	%rdx, %r8	 ; tmp141,
	movq	%rax, %rdx	 ; tmp142,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -64(%rbp)	 ; tmp143, inst
 ; D:\TC\temp\codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp144
	movq	16(%rax), %rax	 ; status_42(D)->current_block, _12
 ; D:\TC\temp\codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _12->instructions, _13
	movq	-64(%rbp), %rdx	 ; inst, tmp145
	movq	%rax, %rcx	 ; _13,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:679:             return temp;
	movq	-56(%rbp), %rax	 ; temp, _36
	jmp	.L229	 ;
.L221:
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	16(%rbp), %rax	 ; primary, tmp146
	movq	(%rax), %rax	 ; primary_41(D)->value.operand, _14
	movq	24(%rbp), %rdx	 ; status, tmp147
	movq	%rax, %rcx	 ; _14,
	call	codegen_primary	 ;
	movq	%rax, %rcx	 ;, _15
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	24(%rbp), %rax	 ; status, tmp148
	movq	%rax, %rdx	 ; tmp148,
	call	load_rvalue	 ;
	movq	%rax, -32(%rbp)	 ; tmp149, operand
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; operand, tmp150
	movq	8(%rax), %rax	 ; operand_47->type, _16
	movq	24(%rbp), %rdx	 ; status, tmp151
	movq	%rdx, %r9	 ; tmp151,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _16,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _17,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -40(%rbp)	 ; tmp152, temp
 ; D:\TC\temp\codegen.c:684:             Instruction* inst = NULL;
	movq	$0, -24(%rbp)	 ;, inst
 ; D:\TC\temp\codegen.c:685:             long long zero_int = 0;
	movq	$0, -96(%rbp)	 ;, zero_int
 ; D:\TC\temp\codegen.c:686:             double neg_one_float = -1.0;
	movsd	.LC18(%rip), %xmm0	 ;, tmp153
	movsd	%xmm0, -104(%rbp)	 ; tmp153, neg_one_float
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	-32(%rbp), %rax	 ; operand, tmp154
	movq	8(%rax), %rdx	 ; operand_47->type, _18
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp155
	movq	(%rax), %rax	 ; name_int, name_int.14_19
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	cmpq	%rax, %rdx	 ; name_int.14_19, _18
	jne	.L230	 ;,
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	-96(%rbp), %rax	 ;, tmp156
	movq	%rax, %rdx	 ; tmp156,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _20
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	-32(%rbp), %rcx	 ; operand, tmp157
	movq	-40(%rbp), %rax	 ; temp, tmp158
	movq	%rcx, %r9	 ; tmp157,
	movq	%rdx, %r8	 ; _20,
	movq	%rax, %rdx	 ; tmp158,
	movl	$1, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp159, inst
	jmp	.L231	 ;
.L230:
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	movq	-32(%rbp), %rax	 ; operand, tmp160
	movq	8(%rax), %rdx	 ; operand_47->type, _21
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp161
	movq	(%rax), %rax	 ; name_float, name_float.15_22
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	cmpq	%rax, %rdx	 ; name_float.15_22, _21
	jne	.L232	 ;,
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	-104(%rbp), %rax	 ;, tmp162
	movq	%rax, %rdx	 ; tmp162,
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _23
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	-32(%rbp), %rcx	 ; operand, tmp163
	movq	-40(%rbp), %rax	 ; temp, tmp164
	movq	%rcx, %r9	 ; tmp163,
	movq	%rdx, %r8	 ; _23,
	movq	%rax, %rdx	 ; tmp164,
	movl	$2, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -24(%rbp)	 ; tmp165, inst
	jmp	.L231	 ;
.L232:
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	-32(%rbp), %rax	 ; operand, tmp166
	movq	8(%rax), %rax	 ; operand_47->type, _24
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _24->name, _25
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	24(%rax), %rax	 ; _26->_stderr, _27
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	%rbx, %r8	 ; _25,
	leaq	.LC19(%rip), %rdx	 ;, tmp167
	movq	%rax, %rcx	 ; _27,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:693:                 return NULL;
	movl	$0, %eax	 ;, _36
	jmp	.L229	 ;
.L231:
 ; D:\TC\temp\codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp168
	movq	16(%rax), %rax	 ; status_42(D)->current_block, _28
 ; D:\TC\temp\codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _28->instructions, _29
	movq	-24(%rbp), %rdx	 ; inst, tmp169
	movq	%rax, %rcx	 ; _29,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:696:             return temp;
	movq	-40(%rbp), %rax	 ; temp, _36
	jmp	.L229	 ;
.L219:
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	16(%rbp), %rax	 ; primary, tmp170
	movq	(%rax), %rax	 ; primary_41(D)->value.var, _30
	movq	24(%rbp), %rdx	 ; status, tmp171
	movq	%rax, %rcx	 ; _30,
	call	codegen_variable_access	 ;
	jmp	.L229	 ;
.L218:
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	16(%rbp), %rax	 ; primary, tmp172
	movl	8(%rax), %ebx	 ; primary_41(D)->type, _31
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	24(%rax), %rax	 ; _32->_stderr, _33
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _31,
	leaq	.LC20(%rip), %rdx	 ;, tmp173
	movq	%rax, %rcx	 ; _33,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:701:             return NULL;
	movl	$0, %eax	 ;, _36
.L229:
 ; D:\TC\temp\codegen.c:703: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC22:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC23:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC24:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC25:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC26:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC27:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC28:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC29:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC30:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC31:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC32:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rbx	 ;
	subq	$232, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable_access, variable_access
	movq	%rdx, 24(%rbp)	 ; status, status
 ; D:\TC\temp\codegen.c:706:     if (variable_access == NULL || status == NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_access
	je	.L235	 ;,
 ; D:\TC\temp\codegen.c:706:     if (variable_access == NULL || status == NULL) {
	cmpq	$0, 24(%rbp)	 ;, status
	jne	.L236	 ;,
.L235:
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	movq	%rax, %r9	 ; _2,
	movl	$40, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rax	 ;, tmp191
	movq	%rax, %rcx	 ; tmp191,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:708:         return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L236:
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movq	16(%rbp), %rax	 ; variable_access, tmp192
	movl	16(%rax), %eax	 ; variable_access_125(D)->type, _3
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%eax, %eax	 ; _3
	jne	.L238	 ;,
 ; D:\TC\temp\codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	16(%rbp), %rax	 ; variable_access, tmp193
	movq	8(%rax), %rax	 ; variable_access_125(D)->content.name, tmp194
	movq	%rax, -184(%rbp)	 ; tmp194, name
 ; D:\TC\temp\codegen.c:712:         if (name == NULL) {
	cmpq	$0, -184(%rbp)	 ;, name
	jne	.L239	 ;,
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	movq	%rax, %r9	 ; _5,
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:714:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L239:
 ; D:\TC\temp\codegen.c:716:         Var* existing = resolve_named_var(name, status);
	movq	24(%rbp), %rdx	 ; status, tmp196
	movq	-184(%rbp), %rax	 ; name, tmp197
	movq	%rax, %rcx	 ; tmp197,
	call	resolve_named_var	 ;
	movq	%rax, -192(%rbp)	 ; tmp198, existing
 ; D:\TC\temp\codegen.c:717:         if (existing != NULL)
	cmpq	$0, -192(%rbp)	 ;, existing
	je	.L240	 ;,
 ; D:\TC\temp\codegen.c:718:             return create_arg(ARG_VARIABLE, existing);
	movq	-192(%rbp), %rax	 ; existing, tmp199
	movq	%rax, %rdx	 ; tmp199,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	jmp	.L237	 ;
.L240:
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	movq	-184(%rbp), %rax	 ; name, tmp200
	movl	32(%rax), %eax	 ; name_220->kind, _6
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$1, %eax	 ;, _6
	je	.L241	 ;,
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	movq	-184(%rbp), %rax	 ; name, tmp201
	movl	32(%rax), %eax	 ; name_220->kind, _7
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, %eax	 ;, _7
	je	.L241	 ;,
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	movq	-184(%rbp), %rax	 ; name, tmp202
	movl	32(%rax), %eax	 ; name_220->kind, _8
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _8
	jne	.L242	 ;,
.L241:
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	-184(%rbp), %rax	 ; name, tmp203
	movq	(%rax), %rdx	 ; name_220->type, _9
	movq	24(%rbp), %rcx	 ; status, tmp204
	movq	-184(%rbp), %rax	 ; name, tmp205
	movq	%rcx, %r9	 ; tmp204,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp205,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _10,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	.L237	 ;
.L242:
 ; D:\TC\temp\codegen.c:721:         Var* self = find_self_parameter(status);
	movq	24(%rbp), %rax	 ; status, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	find_self_parameter	 ;
	movq	%rax, -200(%rbp)	 ; tmp207, self
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpq	$0, -200(%rbp)	 ;, self
	je	.L243	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-200(%rbp), %rax	 ; self, tmp208
	movq	16(%rax), %rax	 ; self_224->type, _11
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	 ; _11
	je	.L243	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-200(%rbp), %rax	 ; self, tmp209
	movq	16(%rax), %rax	 ; self_224->type, _12
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movl	32(%rax), %eax	 ; _12->kind, _13
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testl	%eax, %eax	 ; _13
	jne	.L243	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-184(%rbp), %rax	 ; name, tmp210
	movq	24(%rax), %rdx	 ; name_220->ast_node.scope, _14
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-200(%rbp), %rax	 ; self, tmp211
	movq	16(%rax), %rax	 ; self_224->type, _15
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	 ; _15->ast_node.class, _16
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	 ; _16->class_scope, _17
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpq	%rax, %rdx	 ; _17, _14
	jne	.L243	 ;,
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	-200(%rbp), %rax	 ; self, tmp212
	movq	%rax, %rdx	 ; tmp212,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rcx	 ;, _18
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	24(%rbp), %rdx	 ; status, tmp213
	movq	-184(%rbp), %rax	 ; name, tmp214
	movq	%rdx, %r8	 ; tmp213,
	movq	%rax, %rdx	 ; tmp214,
	call	emit_attribute_access	 ;
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	jmp	.L237	 ;
.L243:
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	-184(%rbp), %rax	 ; name, tmp215
	movq	8(%rax), %rbx	 ; name_220->name, _19
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	24(%rax), %rax	 ; _20->_stderr, _21
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	%rbx, %r8	 ; _19,
	leaq	.LC23(%rip), %rdx	 ;, tmp216
	movq	%rax, %rcx	 ; _21,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	-184(%rbp), %rax	 ; name, tmp217
	movq	(%rax), %rdx	 ; name_220->type, _22
	movq	24(%rbp), %rcx	 ; status, tmp218
	movq	-184(%rbp), %rax	 ; name, tmp219
	movq	%rcx, %r9	 ; tmp218,
	movl	$118, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp219,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	%rax, %rdx	 ; _23,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	jmp	.L237	 ;
.L238:
 ; D:\TC\temp\codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	movq	16(%rbp), %rax	 ; variable_access, tmp220
	movl	16(%rax), %eax	 ; variable_access_125(D)->type, _24
 ; D:\TC\temp\codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %eax	 ;, _24
	jne	.L244	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp221
	movq	(%rax), %rax	 ; variable_access_125(D)->base, _25
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rax, %rax	 ; _25
	je	.L245	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp222
	movq	8(%rax), %rax	 ; variable_access_125(D)->content.attr_name, _26
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rax, %rax	 ; _26
	jne	.L246	 ;,
.L245:
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	movq	24(%rax), %rax	 ; _27->_stderr, _28
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	movq	%rax, %r9	 ; _28,
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rax	 ;, tmp223
	movq	%rax, %rcx	 ; tmp223,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:731:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L246:
 ; D:\TC\temp\codegen.c:733:         Symbol* attr_name = variable_access->content.attr_name;
	movq	16(%rbp), %rax	 ; variable_access, tmp224
	movq	8(%rax), %rax	 ; variable_access_125(D)->content.attr_name, tmp225
	movq	%rax, -168(%rbp)	 ; tmp225, attr_name
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movq	-168(%rbp), %rax	 ; attr_name, tmp226
	movl	32(%rax), %eax	 ; attr_name_206->kind, _29
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$2, %eax	 ;, _29
	je	.L247	 ;,
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movq	-168(%rbp), %rax	 ; attr_name, tmp227
	movl	32(%rax), %eax	 ; attr_name_206->kind, _30
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	 ;, _30
	jne	.L248	 ;,
.L247:
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	-168(%rbp), %rax	 ; attr_name, tmp228
	movq	(%rax), %rdx	 ; attr_name_206->type, _31
	movq	24(%rbp), %rcx	 ; status, tmp229
	movq	-168(%rbp), %rax	 ; attr_name, tmp230
	movq	%rcx, %r9	 ; tmp229,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp230,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _32,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	jmp	.L237	 ;
.L248:
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	movq	16(%rbp), %rax	 ; variable_access, tmp231
	movq	(%rax), %rax	 ; variable_access_125(D)->base, _33
	movq	24(%rbp), %rdx	 ; status, tmp232
	movq	%rax, %rcx	 ; _33,
	call	codegen_variable_access	 ;
	movq	%rax, -176(%rbp)	 ; tmp233, object
 ; D:\TC\temp\codegen.c:737:         if (object == NULL) {
	cmpq	$0, -176(%rbp)	 ;, object
	jne	.L249	 ;,
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	movq	24(%rax), %rax	 ; _34->_stderr, _35
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	movq	%rax, %r9	 ; _35,
	movl	$61, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rax	 ;, tmp234
	movq	%rax, %rcx	 ; tmp234,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:739:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L249:
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	24(%rbp), %rcx	 ; status, tmp235
	movq	-168(%rbp), %rdx	 ; attr_name, tmp236
	movq	-176(%rbp), %rax	 ; object, tmp237
	movq	%rcx, %r8	 ; tmp235,
	movq	%rax, %rcx	 ; tmp237,
	call	emit_attribute_access	 ;
	jmp	.L237	 ;
.L244:
 ; D:\TC\temp\codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	movq	16(%rbp), %rax	 ; variable_access, tmp238
	movl	16(%rax), %eax	 ; variable_access_125(D)->type, _36
 ; D:\TC\temp\codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %eax	 ;, _36
	jne	.L250	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp239
	movq	(%rax), %rax	 ; variable_access_125(D)->base, _37
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rax, %rax	 ; _37
	je	.L251	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp240
	movq	8(%rax), %rax	 ; variable_access_125(D)->content.index, _38
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rax, %rax	 ; _38
	jne	.L252	 ;,
.L251:
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	movq	24(%rax), %rax	 ; _39->_stderr, _40
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	movq	%rax, %r9	 ; _40,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rax	 ;, tmp241
	movq	%rax, %rcx	 ; tmp241,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:747:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L252:
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp242
	movq	(%rax), %rax	 ; variable_access_125(D)->base, _41
	movq	24(%rbp), %rdx	 ; status, tmp243
	movq	%rax, %rcx	 ; _41,
	call	codegen_variable_access	 ;
	movq	%rax, %rcx	 ;, _42
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	24(%rbp), %rax	 ; status, tmp244
	movq	%rax, %rdx	 ; tmp244,
	call	load_rvalue	 ;
	movq	%rax, -136(%rbp)	 ; tmp245, sequence
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	16(%rbp), %rax	 ; variable_access, tmp246
	movq	8(%rax), %rax	 ; variable_access_125(D)->content.index, _43
	movq	24(%rbp), %rdx	 ; status, tmp247
	movq	%rax, %rcx	 ; _43,
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ;, _44
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	24(%rbp), %rax	 ; status, tmp248
	movq	%rax, %rdx	 ; tmp248,
	call	load_rvalue	 ;
	movq	%rax, -144(%rbp)	 ; tmp249, index
 ; D:\TC\temp\codegen.c:751:         if (sequence == NULL || index == NULL) {
	cmpq	$0, -136(%rbp)	 ;, sequence
	je	.L253	 ;,
 ; D:\TC\temp\codegen.c:751:         if (sequence == NULL || index == NULL) {
	cmpq	$0, -144(%rbp)	 ;, index
	jne	.L254	 ;,
.L253:
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	movq	24(%rax), %rax	 ; _45->_stderr, _46
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	movq	%rax, %r9	 ; _46,
	movl	$68, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rax	 ;, tmp250
	movq	%rax, %rcx	 ; tmp250,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:753:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L254:
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp251
	movq	(%rax), %rax	 ; name_int, tmp252
	movq	%rax, -24(%rbp)	 ; tmp252, element_type
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	-136(%rbp), %rax	 ; sequence, tmp253
	movq	8(%rax), %rdx	 ; sequence_186->type, _47
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp254
	movq	(%rax), %rax	 ; name_float, name_float.16_48
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rax, %rdx	 ; name_float.16_48, _47
	je	.L255	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	-136(%rbp), %rax	 ; sequence, tmp255
	movq	8(%rax), %rdx	 ; sequence_186->type, _49
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp256
	movq	(%rax), %rax	 ; name_bool, name_bool.17_50
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rax, %rdx	 ; name_bool.17_50, _49
	je	.L255	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	-136(%rbp), %rax	 ; sequence, tmp257
	movq	8(%rax), %rdx	 ; sequence_186->type, _51
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp258
	movq	(%rax), %rax	 ; name_string, name_string.18_52
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rax, %rdx	 ; name_string.18_52, _51
	jne	.L256	 ;,
.L255:
 ; D:\TC\temp\codegen.c:757:             element_type = sequence->type;
	movq	-136(%rbp), %rax	 ; sequence, tmp259
	movq	8(%rax), %rax	 ; sequence_186->type, tmp260
	movq	%rax, -24(%rbp)	 ; tmp260, element_type
.L256:
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	24(%rbp), %rdx	 ; status, tmp261
	movq	-24(%rbp), %rax	 ; element_type, tmp262
	movq	%rdx, %r9	 ; tmp261,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; tmp262,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _53,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -152(%rbp)	 ; tmp263, result
 ; D:\TC\temp\codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	movq	-144(%rbp), %rcx	 ; index, tmp264
	movq	-136(%rbp), %rdx	 ; sequence, tmp265
	movq	-152(%rbp), %rax	 ; result, tmp266
	movq	%rcx, %r9	 ; tmp264,
	movq	%rdx, %r8	 ; tmp265,
	movq	%rax, %rdx	 ; tmp266,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -160(%rbp)	 ; tmp267, inst
 ; D:\TC\temp\codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	24(%rbp), %rax	 ; status, tmp268
	movq	16(%rax), %rax	 ; status_126(D)->current_block, _54
 ; D:\TC\temp\codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	 ; _54->instructions, _55
	movq	-160(%rbp), %rdx	 ; inst, tmp269
	movq	%rax, %rcx	 ; _55,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:761:         result->is_get = true;
	movq	-152(%rbp), %rax	 ; result, tmp270
	movb	$1, 20(%rax)	 ;, result_194->is_get
 ; D:\TC\temp\codegen.c:762:         return result;
	movq	-152(%rbp), %rax	 ; result, _117
	jmp	.L237	 ;
.L250:
 ; D:\TC\temp\codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp271
	movl	16(%rax), %eax	 ; variable_access_125(D)->type, _56
 ; D:\TC\temp\codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %eax	 ;, _56
	jne	.L257	 ;,
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	movq	16(%rbp), %rax	 ; variable_access, tmp272
	movq	(%rax), %rax	 ; variable_access_125(D)->base, _57
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rax, %rax	 ; _57
	jne	.L258	 ;,
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	movq	24(%rax), %rax	 ; _58->_stderr, _59
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	movq	%rax, %r9	 ; _59,
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rax	 ;, tmp273
	movq	%rax, %rcx	 ; tmp273,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:768:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L258:
 ; D:\TC\temp\codegen.c:771:         Symbol* callee_name = NULL;
	movq	$0, -32(%rbp)	 ;, callee_name
 ; D:\TC\temp\codegen.c:772:         Arg* receiver = NULL;
	movq	$0, -40(%rbp)	 ;, receiver
 ; D:\TC\temp\codegen.c:773:         VariableAccess* callee_access = variable_access->base;
	movq	16(%rbp), %rax	 ; variable_access, tmp274
	movq	(%rax), %rax	 ; variable_access_125(D)->base, tmp275
	movq	%rax, -72(%rbp)	 ; tmp275, callee_access
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	-72(%rbp), %rax	 ; callee_access, tmp276
	movl	16(%rax), %eax	 ; callee_access_133->type, _60
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, %eax	 ;, _60
	jne	.L260	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	-72(%rbp), %rax	 ; callee_access, tmp277
	movq	8(%rax), %rax	 ; callee_access_133->content.attr_name, _61
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%rax, %rax	 ; _61
	je	.L260	 ;,
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movq	-72(%rbp), %rax	 ; callee_access, tmp278
	movq	8(%rax), %rax	 ; callee_access_133->content.attr_name, _62
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%rax), %eax	 ; _62->kind, _63
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, %eax	 ;, _63
	je	.L261	 ;,
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movq	-72(%rbp), %rax	 ; callee_access, tmp279
	movq	8(%rax), %rax	 ; callee_access_133->content.attr_name, _64
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%rax), %eax	 ; _64->kind, _65
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	cmpl	$1, %eax	 ;, _65
	jne	.L260	 ;,
.L261:
 ; D:\TC\temp\codegen.c:776:             callee_name = callee_access->content.attr_name;
	movq	-72(%rbp), %rax	 ; callee_access, tmp280
	movq	8(%rax), %rax	 ; callee_access_133->content.attr_name, tmp281
	movq	%rax, -32(%rbp)	 ; tmp281, callee_name
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	movq	-72(%rbp), %rax	 ; callee_access, tmp282
	movq	(%rax), %rax	 ; callee_access_133->base, _66
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rax, %rax	 ; _66
	je	.L260	 ;,
 ; D:\TC\temp\codegen.c:778:                 bool is_class_constructor_call = false;
	movb	$0, -41(%rbp)	 ;, is_class_constructor_call
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	-72(%rbp), %rax	 ; callee_access, tmp283
	movq	(%rax), %rax	 ; callee_access_133->base, _67
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	16(%rax), %eax	 ; _67->type, _68
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _68
	jne	.L262	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	-72(%rbp), %rax	 ; callee_access, tmp284
	movq	(%rax), %rax	 ; callee_access_133->base, _69
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rax), %rax	 ; _69->content.name, _70
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _70
	je	.L262	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	-72(%rbp), %rax	 ; callee_access, tmp285
	movq	(%rax), %rax	 ; callee_access_133->base, _71
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rax), %rax	 ; _71->content.name, _72
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _72->kind, _73
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	 ; _73
	jne	.L262	 ;,
 ; D:\TC\temp\codegen.c:780:                     is_class_constructor_call = true;
	movb	$1, -41(%rbp)	 ;, is_class_constructor_call
.L262:
 ; D:\TC\temp\codegen.c:781:                 if (!is_class_constructor_call)
	cmpb	$0, -41(%rbp)	 ;, is_class_constructor_call
	jne	.L260	 ;,
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	-72(%rbp), %rax	 ; callee_access, tmp286
	movq	(%rax), %rax	 ; callee_access_133->base, _74
	movq	24(%rbp), %rdx	 ; status, tmp287
	movq	%rax, %rcx	 ; _74,
	call	codegen_variable_access	 ;
	movq	%rax, %rcx	 ;, _75
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	24(%rbp), %rax	 ; status, tmp288
	movq	%rax, %rdx	 ; tmp288,
	call	load_rvalue	 ;
	movq	%rax, -40(%rbp)	 ; tmp289, receiver
.L260:
 ; D:\TC\temp\codegen.c:785:         if (callee_name == NULL) {
	cmpq	$0, -32(%rbp)	 ;, callee_name
	jne	.L263	 ;,
 ; D:\TC\temp\codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	24(%rbp), %rdx	 ; status, tmp290
	movq	-72(%rbp), %rax	 ; callee_access, tmp291
	movq	%rax, %rcx	 ; tmp291,
	call	codegen_variable_access	 ;
	movq	%rax, -80(%rbp)	 ; tmp292, callee
 ; D:\TC\temp\codegen.c:787:             if (callee == NULL) {
	cmpq	$0, -80(%rbp)	 ;, callee
	jne	.L264	 ;,
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	movq	24(%rax), %rax	 ; _76->_stderr, _77
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	movq	%rax, %r9	 ; _77,
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp293
	movq	%rax, %rcx	 ; tmp293,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:789:                 return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L264:
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	-80(%rbp), %rax	 ; callee, tmp294
	movl	16(%rax), %eax	 ; callee_141->kind, _78
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %eax	 ;, _78
	jne	.L265	 ;,
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	-80(%rbp), %rax	 ; callee, tmp295
	movq	(%rax), %rax	 ; callee_141->value.subroutine, _79
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	 ; _79
	je	.L265	 ;,
 ; D:\TC\temp\codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	-80(%rbp), %rax	 ; callee, tmp296
	movq	(%rax), %rax	 ; callee_141->value.subroutine, _80
 ; D:\TC\temp\codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %rax	 ; _80->original_name, tmp297
	movq	%rax, -32(%rbp)	 ; tmp297, callee_name
	jmp	.L263	 ;
.L265:
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	-80(%rbp), %rax	 ; callee, tmp298
	movl	16(%rax), %eax	 ; callee_141->kind, _81
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%eax, %eax	 ; _81
	jne	.L263	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	-80(%rbp), %rax	 ; callee, tmp299
	movq	(%rax), %rax	 ; callee_141->value.variable, _82
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	 ; _82
	je	.L263	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	-80(%rbp), %rax	 ; callee, tmp300
	movq	(%rax), %rax	 ; callee_141->value.variable, _83
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	 ; _83->original_name, _84
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	 ; _84
	je	.L263	 ;,
 ; D:\TC\temp\codegen.c:794:                 Symbol* maybe_subroutine = callee->value.variable->original_name;
	movq	-80(%rbp), %rax	 ; callee, tmp301
	movq	(%rax), %rax	 ; callee_141->value.variable, _85
 ; D:\TC\temp\codegen.c:794:                 Symbol* maybe_subroutine = callee->value.variable->original_name;
	movq	(%rax), %rax	 ; _85->original_name, tmp302
	movq	%rax, -88(%rbp)	 ; tmp302, maybe_subroutine
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movq	-88(%rbp), %rax	 ; maybe_subroutine, tmp303
	movl	32(%rax), %eax	 ; maybe_subroutine_143->kind, _86
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, _86
	je	.L266	 ;,
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movq	-88(%rbp), %rax	 ; maybe_subroutine, tmp304
	movl	32(%rax), %eax	 ; maybe_subroutine_143->kind, _87
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _87
	jne	.L263	 ;,
.L266:
 ; D:\TC\temp\codegen.c:796:                     callee_name = maybe_subroutine;
	movq	-88(%rbp), %rax	 ; maybe_subroutine, tmp305
	movq	%rax, -32(%rbp)	 ; tmp305, callee_name
.L263:
 ; D:\TC\temp\codegen.c:799:         if (callee_name == NULL) {
	cmpq	$0, -32(%rbp)	 ;, callee_name
	jne	.L267	 ;,
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	movq	24(%rax), %rax	 ; _88->_stderr, _89
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	movq	%rax, %r9	 ; _89,
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rax	 ;, tmp306
	movq	%rax, %rcx	 ; tmp306,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:801:             return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L267:
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	movq	$0, -56(%rbp)	 ;, argument_count
 ; D:\TC\temp\codegen.c:805:         if (receiver != NULL) {
	cmpq	$0, -40(%rbp)	 ;, receiver
	je	.L268	 ;,
 ; D:\TC\temp\codegen.c:806:             emit_param_instruction(receiver, status);
	movq	24(%rbp), %rdx	 ; status, tmp307
	movq	-40(%rbp), %rax	 ; receiver, tmp308
	movq	%rax, %rcx	 ; tmp308,
	call	emit_param_instruction	 ;
 ; D:\TC\temp\codegen.c:807:             ++argument_count;
	addq	$1, -56(%rbp)	 ;, argument_count
.L268:
 ; D:\TC\temp\codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	16(%rbp), %rax	 ; variable_access, tmp309
	movq	8(%rax), %rax	 ; variable_access_125(D)->content.args, _90
	movq	%rax, %rcx	 ; _90,
	call	list_copy	 ;
	movq	%rax, -96(%rbp)	 ; tmp310, args
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L269	 ;
.L271:
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	24(%rbp), %rdx	 ; status, tmp311
	movq	-104(%rbp), %rax	 ; arg_expr, tmp312
	movq	%rax, %rcx	 ; tmp312,
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ;, _91
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	24(%rbp), %rax	 ; status, tmp313
	movq	%rax, %rdx	 ; tmp313,
	call	load_rvalue	 ;
	movq	%rax, -128(%rbp)	 ; tmp314, arg_value
 ; D:\TC\temp\codegen.c:813:             if (arg_value == NULL) {
	cmpq	$0, -128(%rbp)	 ;, arg_value
	jne	.L270	 ;,
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	movq	24(%rax), %rax	 ; _92->_stderr, _93
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	movq	%rax, %r9	 ; _93,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rax	 ;, tmp315
	movq	%rax, %rcx	 ; tmp315,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:815:                 return NULL;
	movl	$0, %eax	 ;, _117
	jmp	.L237	 ;
.L270:
 ; D:\TC\temp\codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	24(%rbp), %rdx	 ; status, tmp316
	movq	-128(%rbp), %rax	 ; arg_value, tmp317
	movq	%rax, %rcx	 ; tmp317,
	call	emit_param_instruction	 ;
 ; D:\TC\temp\codegen.c:818:             ++argument_count;
	addq	$1, -56(%rbp)	 ;, argument_count
.L269:
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	-96(%rbp), %rax	 ; args, tmp318
	movq	%rax, %rcx	 ; tmp318,
	call	list_pop	 ;
	movq	%rax, -104(%rbp)	 ; tmp319, arg_expr
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -104(%rbp)	 ;, arg_expr
	jne	.L271	 ;,
 ; D:\TC\temp\codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -64(%rbp)	 ; tmp320, result
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	-32(%rbp), %rax	 ; callee_name, tmp321
	movq	(%rax), %rax	 ; callee_name_110->type, _94
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rax, %rax	 ; _94
	je	.L272	 ;,
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	-32(%rbp), %rax	 ; callee_name, tmp322
	movq	(%rax), %rdx	 ; callee_name_110->type, _95
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp323
	movq	(%rax), %rax	 ; name_void, name_void.19_96
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	%rax, %rdx	 ; name_void.19_96, _95
	je	.L272	 ;,
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	 ; callee_name, tmp324
	movq	(%rax), %rax	 ; callee_name_110->type, _97
	movq	24(%rbp), %rdx	 ; status, tmp325
	movq	%rdx, %r9	 ; tmp325,
	movl	$116, %r8d	 ;,
	movq	%rax, %rdx	 ; _97,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; _98,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -64(%rbp)	 ; tmp326, result
.L272:
 ; D:\TC\temp\codegen.c:824:         long long count = (long long)argument_count;
	movq	-56(%rbp), %rax	 ; argument_count, argument_count.20_99
 ; D:\TC\temp\codegen.c:824:         long long count = (long long)argument_count;
	movq	%rax, -208(%rbp)	 ; argument_count.20_99, count
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	-32(%rbp), %rax	 ; callee_name, tmp327
	movq	(%rax), %rdx	 ; callee_name_110->type, _100
	movq	24(%rbp), %rcx	 ; status, tmp328
	movq	-32(%rbp), %rax	 ; callee_name, tmp329
	movq	%rcx, %r9	 ; tmp328,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp329,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; _101,
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, -112(%rbp)	 ; tmp330, callee_arg
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	leaq	-208(%rbp), %rax	 ;, tmp331
	movq	%rax, %rdx	 ; tmp331,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ;, _102
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	-112(%rbp), %rcx	 ; callee_arg, tmp332
	movq	-64(%rbp), %rax	 ; result, tmp333
	movq	%rdx, %r9	 ; _102,
	movq	%rcx, %r8	 ; tmp332,
	movq	%rax, %rdx	 ; tmp333,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, -120(%rbp)	 ; tmp334, call_inst
 ; D:\TC\temp\codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	24(%rbp), %rax	 ; status, tmp335
	movq	16(%rax), %rax	 ; status_126(D)->current_block, _103
 ; D:\TC\temp\codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	8(%rax), %rax	 ; _103->instructions, _104
	movq	-120(%rbp), %rdx	 ; call_inst, tmp336
	movq	%rax, %rcx	 ; _104,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:828:         return result;
	movq	-64(%rbp), %rax	 ; result, _117
	jmp	.L237	 ;
.L257:
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movq	16(%rbp), %rax	 ; variable_access, tmp337
	movl	16(%rax), %ebx	 ; variable_access_125(D)->type, _105
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movq	24(%rax), %rax	 ; _106->_stderr, _107
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movl	%ebx, %r8d	 ; _105,
	leaq	.LC32(%rip), %rdx	 ;, tmp338
	movq	%rax, %rcx	 ; _107,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:832:     return NULL;
	movl	$0, %eax	 ;, _117
.L237:
 ; D:\TC\temp\codegen.c:833: }
	movq	-8(%rbp), %rbx	 ;,
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
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
