	.file	"codegen.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	find_attribute_table, @function
find_attribute_table:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; status, status
	movq	%rsi, -32(%rbp)	; name, name
; temp/codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	-24(%rbp), %rax	; status, tmp87
	movq	(%rax), %rax	; status_7(D)->tac, _1
; temp/codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%rax), %rax	; _1->attribute_tables, _2
	movq	%rax, %rdi	; _2,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp88, attribute_tables
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	jmp	.L2	;
.L4:
; temp/codegen.c:9:         if (current->name == name)
	movq	-16(%rbp), %rax	; current, tmp89
	movq	8(%rax), %rax	; current_11->name, _3
; temp/codegen.c:9:         if (current->name == name)
	cmpq	%rax, -32(%rbp)	; _3, name
	jne	.L2	;,
; temp/codegen.c:10:             return current;
	movq	-16(%rbp), %rax	; current, _4
	jmp	.L3	;
.L2:
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	-8(%rbp), %rax	; attribute_tables, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp91, current
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	cmpq	$0, -16(%rbp)	;, current
	jne	.L4	;,
; temp/codegen.c:11:     return NULL;
	movl	$0, %eax	;, _4
.L3:
; temp/codegen.c:12: }
	leave	
	ret	
	.size	find_attribute_table, .-find_attribute_table
	.type	create_attribute_table, @function
create_attribute_table:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:15:     table->attributes = create_list();
	movq	-8(%rbp), %rdx	; table, tmp86
	movq	%rax, (%rdx)	; _1, table_4->attributes
; temp/codegen.c:16:     table->name = name;
	movq	-8(%rbp), %rax	; table, tmp87
	movq	-24(%rbp), %rdx	; name, tmp88
	movq	%rdx, 8(%rax)	; tmp88, table_4->name
; temp/codegen.c:17:     table->size = 0;
	movq	-8(%rbp), %rax	; table, tmp89
	movq	$0, 16(%rax)	;, table_4->size
; temp/codegen.c:18:     return table;
	movq	-8(%rbp), %rax	; table, _10
; temp/codegen.c:19: }
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
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; type, type
; temp/codegen.c:21:     if (type == NULL)
	cmpq	$0, -8(%rbp)	;, type
	jne	.L8	;,
; temp/codegen.c:22:         return 0;
	movl	$0, %eax	;, _10
	jmp	.L9	;
.L8:
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	name_int(%rip), %rax	; name_int, name_int.0_1
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -8(%rbp)	; name_int.0_1, type
	je	.L10	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	name_float(%rip), %rax	; name_float, name_float.1_2
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -8(%rbp)	; name_float.1_2, type
	je	.L10	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	name_string(%rip), %rax	; name_string, name_string.2_3
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rax, -8(%rbp)	; name_string.2_3, type
	jne	.L11	;,
.L10:
; temp/codegen.c:24:         return 8;
	movl	$8, %eax	;, _10
	jmp	.L9	;
.L11:
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	movq	name_bool(%rip), %rax	; name_bool, name_bool.3_4
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rax, -8(%rbp)	; name_bool.3_4, type
	je	.L12	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.4_5
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rax, -8(%rbp)	; name_void.4_5, type
	jne	.L13	;,
.L12:
; temp/codegen.c:26:         return 1;
	movl	$1, %eax	;, _10
	jmp	.L9	;
.L13:
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movq	-8(%rbp), %rax	; type, tmp93
	movl	32(%rax), %eax	; type_12(D)->kind, _6
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _6
	jne	.L14	;,
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	-8(%rbp), %rax	; type, tmp94
	movq	24(%rax), %rax	; type_12(D)->ast_node.class, _7
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rax), %rax	; _7->size, _10
	jmp	.L9	;
.L14:
; temp/codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	-8(%rbp), %rax	; type, tmp95
	movq	8(%rax), %rdx	; type_12(D)->name, _8
	movq	stderr(%rip), %rax	; stderr, stderr.5_9
	leaq	.LC0(%rip), %rcx	;, tmp96
	movq	%rcx, %rsi	; tmp96,
	movq	%rax, %rdi	; stderr.5_9,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:30:     return 8;
	movl	$8, %eax	;, _10
.L9:
; temp/codegen.c:31: }
	leave	
	ret	
	.size	get_type_size, .-get_type_size
	.section	.rodata
	.align 8
.LC1:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.type	create_attribute, @function
create_attribute:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; var_name, var_name
	movq	%rsi, -32(%rbp)	; type, type
	movq	%rdx, -40(%rbp)	; table, table
	movq	%rcx, -48(%rbp)	; offset, offset
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp91, attr
; temp/codegen.c:34:     attr->var_name = var_name;
	movq	-8(%rbp), %rax	; attr, tmp92
	movq	-24(%rbp), %rdx	; var_name, tmp93
	movq	%rdx, (%rax)	; tmp93, attr_11->var_name
; temp/codegen.c:35:     attr->type = type;
	movq	-8(%rbp), %rax	; attr, tmp94
	movq	-32(%rbp), %rdx	; type, tmp95
	movq	%rdx, 8(%rax)	; tmp95, attr_11->type
; temp/codegen.c:36:     attr->offset = offset;
	movq	-8(%rbp), %rax	; attr, tmp96
	movq	-48(%rbp), %rdx	; offset, tmp97
	movq	%rdx, 16(%rax)	; tmp97, attr_11->offset
; temp/codegen.c:37:     if (offset == 0) {
	cmpq	$0, -48(%rbp)	;, offset
	jne	.L16	;,
; temp/codegen.c:38:         attr->offset = table->size;
	movq	-40(%rbp), %rax	; table, tmp98
	movq	16(%rax), %rdx	; table_18(D)->size, _1
; temp/codegen.c:38:         attr->offset = table->size;
	movq	-8(%rbp), %rax	; attr, tmp99
	movq	%rdx, 16(%rax)	; _1, attr_11->offset
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	-32(%rbp), %rax	; type, tmp100
	movq	%rax, %rdi	; tmp100,
	call	get_type_size	;
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	-40(%rbp), %rdx	; table, tmp101
	movq	16(%rdx), %rdx	; table_18(D)->size, _2
; temp/codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, %rdx	; _21, _3
	movq	-40(%rbp), %rax	; table, tmp102
	movq	%rdx, 16(%rax)	; _3, table_18(D)->size
.L16:
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, -40(%rbp)	;, table
	je	.L17	;,
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	-40(%rbp), %rax	; table, tmp103
	movq	(%rax), %rax	; table_18(D)->attributes, _4
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	; _4
	jne	.L18	;,
.L17:
; temp/codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	stderr(%rip), %rax	; stderr, stderr.6_5
	movq	%rax, %rcx	; stderr.6_5,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L19	;
.L18:
; temp/codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	-40(%rbp), %rax	; table, tmp105
	movq	(%rax), %rax	; table_18(D)->attributes, _6
	movq	-8(%rbp), %rdx	; attr, tmp106
	movq	%rdx, %rsi	; tmp106,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
.L19:
; temp/codegen.c:45:     return attr;
	movq	-8(%rbp), %rax	; attr, _25
; temp/codegen.c:46: }
	leave	
	ret	
	.size	create_attribute, .-create_attribute
	.type	is_assignment_operator, @function
is_assignment_operator:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$13, -4(%rbp)	;, op
	je	.L22	;,
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$14, -4(%rbp)	;, op
	je	.L22	;,
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$15, -4(%rbp)	;, op
	je	.L22	;,
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$16, -4(%rbp)	;, op
	je	.L22	;,
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$17, -4(%rbp)	;, op
	je	.L22	;,
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	cmpl	$18, -4(%rbp)	;, op
	jne	.L23	;,
.L22:
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$1, %eax	;, iftmp.7_1
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	jmp	.L24	;
.L23:
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	$0, %eax	;, iftmp.7_1
.L24:
; temp/codegen.c:49: }
	popq	%rbp	;
	ret	
	.size	is_assignment_operator, .-is_assignment_operator
	.type	get_instruction_type, @function
get_instruction_type:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movl	%edi, -4(%rbp)	; op, op
; temp/codegen.c:51:     switch (op) {
	cmpl	$18, -4(%rbp)	;, op
	ja	.L27	;,
	movl	-4(%rbp), %eax	; op, tmp84
	leaq	0(,%rax,4), %rdx	;, tmp85
	leaq	.L29(%rip), %rax	;, tmp86
	movl	(%rdx,%rax), %eax	;, tmp87
	cltq
	leaq	.L29(%rip), %rdx	;, tmp90
	addq	%rdx, %rax	; tmp90, tmp89
	jmp	*%rax	; tmp89
	.section	.rodata
	.align 4
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
; temp/codegen.c:53:         case OP_ADD_ASSIGN: return INST_ADD;
	movl	$0, %eax	;, _1
	jmp	.L43	;
.L32:
; temp/codegen.c:55:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %eax	;, _1
	jmp	.L43	;
.L31:
; temp/codegen.c:57:         case OP_MUL_ASSIGN: return INST_MUL;
	movl	$2, %eax	;, _1
	jmp	.L43	;
.L30:
; temp/codegen.c:59:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %eax	;, _1
	jmp	.L43	;
.L28:
; temp/codegen.c:61:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %eax	;, _1
	jmp	.L43	;
.L34:
; temp/codegen.c:62:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %eax	;, _1
	jmp	.L43	;
.L42:
; temp/codegen.c:63:         case OP_EQ: return INST_EQ;
	movl	$5, %eax	;, _1
	jmp	.L43	;
.L41:
; temp/codegen.c:64:         case OP_NE: return INST_NE;
	movl	$6, %eax	;, _1
	jmp	.L43	;
.L40:
; temp/codegen.c:65:         case OP_LT: return INST_LT;
	movl	$7, %eax	;, _1
	jmp	.L43	;
.L39:
; temp/codegen.c:66:         case OP_GT: return INST_GT;
	movl	$8, %eax	;, _1
	jmp	.L43	;
.L38:
; temp/codegen.c:67:         case OP_LE: return INST_LE;
	movl	$9, %eax	;, _1
	jmp	.L43	;
.L37:
; temp/codegen.c:68:         case OP_GE: return INST_GE;
	movl	$10, %eax	;, _1
	jmp	.L43	;
.L36:
; temp/codegen.c:69:         case OP_AND: return INST_AND;
	movl	$11, %eax	;, _1
	jmp	.L43	;
.L35:
; temp/codegen.c:70:         case OP_OR: return INST_OR;
	movl	$12, %eax	;, _1
	jmp	.L43	;
.L27:
; temp/codegen.c:72:         default: return INST_NONE;
	movl	$25, %eax	;, _1
.L43:
; temp/codegen.c:74: }
	popq	%rbp	;
	ret	
	.size	get_instruction_type, .-get_instruction_type
	.type	create_tac, @function
create_tac:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
; temp/codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, tac
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	movq	-8(%rbp), %rdx	; tac, tmp88
	movq	%rax, (%rdx)	; _1, tac_6->attribute_tables
; temp/codegen.c:78:     tac->entry_point = NULL;
	movq	-8(%rbp), %rax	; tac, tmp89
	movq	$0, 8(%rax)	;, tac_6->entry_point
; temp/codegen.c:79:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:79:     tac->global_vars = create_list();
	movq	-8(%rbp), %rdx	; tac, tmp90
	movq	%rax, 16(%rdx)	; _2, tac_6->global_vars
; temp/codegen.c:80:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:80:     tac->subroutines = create_list();
	movq	-8(%rbp), %rdx	; tac, tmp91
	movq	%rax, 24(%rdx)	; _3, tac_6->subroutines
; temp/codegen.c:81:     return tac;
	movq	-8(%rbp), %rax	; tac, _14
; temp/codegen.c:82: }
	leave	
	ret	
	.size	create_tac, .-create_tac
	.type	create_tac_status, @function
create_tac_status:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; tac, tac
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, status
; temp/codegen.c:85:     status->tac = tac;
	movq	-8(%rbp), %rax	; status, tmp87
	movq	-24(%rbp), %rdx	; tac, tmp88
	movq	%rdx, (%rax)	; tmp88, status_5->tac
; temp/codegen.c:86:     status->current_subroutine = NULL;
	movq	-8(%rbp), %rax	; status, tmp89
	movq	$0, 8(%rax)	;, status_5->current_subroutine
; temp/codegen.c:87:     status->current_block = NULL;
	movq	-8(%rbp), %rax	; status, tmp90
	movq	$0, 16(%rax)	;, status_5->current_block
; temp/codegen.c:88:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:88:     status->end_labels = create_list();
	movq	-8(%rbp), %rdx	; status, tmp91
	movq	%rax, 24(%rdx)	; _1, status_5->end_labels
; temp/codegen.c:89:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:89:     status->start_labels = create_list();
	movq	-8(%rbp), %rdx	; status, tmp92
	movq	%rax, 32(%rdx)	; _2, status_5->start_labels
; temp/codegen.c:90:     status->attr_count = 0;
	movq	-8(%rbp), %rax	; status, tmp93
	movq	$0, 40(%rax)	;, status_5->attr_count
; temp/codegen.c:91:     status->param_count = 0;
	movq	-8(%rbp), %rax	; status, tmp94
	movq	$0, 48(%rax)	;, status_5->param_count
; temp/codegen.c:92:     status->var_count = 0;
	movq	-8(%rbp), %rax	; status, tmp95
	movq	$0, 56(%rax)	;, status_5->var_count
; temp/codegen.c:93:     status->temp_count = 0;
	movq	-8(%rbp), %rax	; status, tmp96
	movq	$0, 64(%rax)	;, status_5->temp_count
; temp/codegen.c:94:     status->block_count = 0;
	movq	-8(%rbp), %rax	; status, tmp97
	movq	$0, 72(%rax)	;, status_5->block_count
; temp/codegen.c:95:     status->subroutine_count = 0;
	movq	-8(%rbp), %rax	; status, tmp98
	movq	$0, 80(%rax)	;, status_5->subroutine_count
; temp/codegen.c:96:     return status;
	movq	-8(%rbp), %rax	; status, _20
; temp/codegen.c:97: }
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
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, subroutine
; temp/codegen.c:100:     subroutine->name = name;
	movq	-8(%rbp), %rax	; subroutine, tmp88
	movq	-24(%rbp), %rdx	; name, tmp89
	movq	%rdx, (%rax)	; tmp89, subroutine_6->name
; temp/codegen.c:101:     subroutine->return_type = return_type;
	movq	-8(%rbp), %rax	; subroutine, tmp90
	movq	-32(%rbp), %rdx	; return_type, tmp91
	movq	%rdx, 8(%rax)	; tmp91, subroutine_6->return_type
; temp/codegen.c:102:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:102:     subroutine->parameters = create_list();
	movq	-8(%rbp), %rdx	; subroutine, tmp92
	movq	%rax, 16(%rdx)	; _1, subroutine_6->parameters
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	movq	-8(%rbp), %rdx	; subroutine, tmp93
	movq	%rax, 24(%rdx)	; _2, subroutine_6->local_vars
; temp/codegen.c:104:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:104:     subroutine->blocks = create_list();
	movq	-8(%rbp), %rdx	; subroutine, tmp94
	movq	%rax, 32(%rdx)	; _3, subroutine_6->blocks
; temp/codegen.c:105:     return subroutine;
	movq	-8(%rbp), %rax	; subroutine, _17
; temp/codegen.c:106: }
	leave	
	ret	
	.size	create_subroutine, .-create_subroutine
	.type	create_block, @function
create_block:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; label, label
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, block
; temp/codegen.c:109:     block->label = label;
	movq	-8(%rbp), %rax	; block, tmp86
	movq	-24(%rbp), %rdx	; label, tmp87
	movq	%rdx, (%rax)	; tmp87, block_4->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:110:     block->instructions = create_list();
	movq	-8(%rbp), %rdx	; block, tmp88
	movq	%rax, 8(%rdx)	; _1, block_4->instructions
; temp/codegen.c:111:     return block;
	movq	-8(%rbp), %rax	; block, _9
; temp/codegen.c:112: }
	leave	
	ret	
	.size	create_block, .-create_block
	.section	.rodata
.LC2:
	.string	""
.LC3:
	.string	"$%d-error"
.LC4:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; original_name, original_name
	movq	%rsi, -32(%rbp)	; type, type
	movl	%edx, -36(%rbp)	; kind, kind
	movq	%rcx, -48(%rbp)	; status, status
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp99, var
; temp/codegen.c:115:     var->original_name = original_name;
	movq	-16(%rbp), %rax	; var, tmp100
	movq	-24(%rbp), %rdx	; original_name, tmp101
	movq	%rdx, (%rax)	; tmp101, var_27->original_name
; temp/codegen.c:117:     switch (kind) {
	movl	-36(%rbp), %eax	; kind, tmp103
	subl	$97, %eax	;, tmp102
	cmpl	$21, %eax	;, tmp102
	ja	.L53	;,
	movl	%eax, %eax	; tmp102, tmp104
	leaq	0(,%rax,4), %rdx	;, tmp105
	leaq	.L55(%rip), %rax	;, tmp106
	movl	(%rdx,%rax), %eax	;, tmp107
	cltq
	leaq	.L55(%rip), %rdx	;, tmp110
	addq	%rdx, %rax	; tmp110, tmp109
	jmp	*%rax	; tmp109
	.section	.rodata
	.align 4
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
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	-48(%rbp), %rax	; status, tmp111
	movq	40(%rax), %rax	; status_31(D)->attr_count, _1
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rax), %rcx	;, _3
	movq	-48(%rbp), %rdx	; status, tmp112
	movq	%rcx, 40(%rdx)	; _3, status_31(D)->attr_count
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	%rax, -8(%rbp)	; _1, id
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L61	;
.L57:
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	-48(%rbp), %rax	; status, tmp113
	movq	48(%rax), %rax	; status_31(D)->param_count, _4
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rax), %rcx	;, _6
	movq	-48(%rbp), %rdx	; status, tmp114
	movq	%rcx, 48(%rdx)	; _6, status_31(D)->param_count
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	%rax, -8(%rbp)	; _4, id
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L61	;
.L54:
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	-48(%rbp), %rax	; status, tmp115
	movq	56(%rax), %rax	; status_31(D)->var_count, _7
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rax), %rcx	;, _9
	movq	-48(%rbp), %rdx	; status, tmp116
	movq	%rcx, 56(%rdx)	; _9, status_31(D)->var_count
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	%rax, -8(%rbp)	; _7, id
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L61	;
.L56:
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	-48(%rbp), %rax	; status, tmp117
	movq	64(%rax), %rax	; status_31(D)->temp_count, _10
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rax), %rcx	;, _12
	movq	-48(%rbp), %rdx	; status, tmp118
	movq	%rcx, 64(%rdx)	; _12, status_31(D)->temp_count
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	%rax, -8(%rbp)	; _10, id
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L61	;
.L59:
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	-48(%rbp), %rax	; status, tmp119
	movq	72(%rax), %rax	; status_31(D)->block_count, _13
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rax), %rcx	;, _15
	movq	-48(%rbp), %rdx	; status, tmp120
	movq	%rcx, 72(%rdx)	; _15, status_31(D)->block_count
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	%rax, -8(%rbp)	; _13, id
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L61	;
.L58:
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	-48(%rbp), %rax	; status, tmp121
	movq	80(%rax), %rax	; status_31(D)->subroutine_count, _16
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rax), %rcx	;, _18
	movq	-48(%rbp), %rdx	; status, tmp122
	movq	%rcx, 80(%rdx)	; _18, status_31(D)->subroutine_count
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	%rax, -8(%rbp)	; _16, id
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L61	;
.L53:
; temp/codegen.c:124:         default: id = (size_t)-1; break;
	movq	$-1, -8(%rbp)	;, id
; temp/codegen.c:124:         default: id = (size_t)-1; break;
	nop	
.L61:
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	-16(%rbp), %rdx	; var, tmp124
	movq	%rax, 8(%rdx)	; _19, var_27->name
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, -8(%rbp)	;, id
	jne	.L62	;,
; temp/codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movq	-16(%rbp), %rax	; var, tmp125
	movq	8(%rax), %rax	; var_27->name, _20
	movl	-36(%rbp), %edx	; kind, tmp126
	leaq	.LC3(%rip), %rcx	;, tmp127
	movq	%rcx, %rsi	; tmp127,
	movq	%rax, %rdi	; _20,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
	jmp	.L63	;
.L62:
; temp/codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	-16(%rbp), %rax	; var, tmp128
	movq	8(%rax), %rax	; var_27->name, _21
	movq	-8(%rbp), %rcx	; id, tmp129
	movl	-36(%rbp), %edx	; kind, tmp130
	leaq	.LC4(%rip), %rsi	;, tmp131
	movq	%rax, %rdi	; _21,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
.L63:
; temp/codegen.c:131:     var->type = type;
	movq	-16(%rbp), %rax	; var, tmp132
	movq	-32(%rbp), %rdx	; type, tmp133
	movq	%rdx, 16(%rax)	; tmp133, var_27->type
; temp/codegen.c:132:     return var;
	movq	-16(%rbp), %rax	; var, _51
; temp/codegen.c:133: }
	leave	
	ret	
	.size	create_var, .-create_var
	.type	create_instruction, @function
create_instruction:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; arg1, arg1
	movq	%rdx, -40(%rbp)	; arg2, arg2
	movq	%rcx, -48(%rbp)	; arg3, arg3
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, inst
; temp/codegen.c:136:     inst->type = type;
	movq	-8(%rbp), %rax	; inst, tmp85
	movl	-20(%rbp), %edx	; type, tmp86
	movl	%edx, 24(%rax)	; tmp86, inst_3->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	-8(%rbp), %rax	; inst, tmp87
	movq	-32(%rbp), %rdx	; arg1, tmp88
	movq	%rdx, (%rax)	; tmp88, inst_3->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	-8(%rbp), %rax	; inst, tmp89
	movq	-40(%rbp), %rdx	; arg2, tmp90
	movq	%rdx, 8(%rax)	; tmp90, inst_3->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	-8(%rbp), %rax	; inst, tmp91
	movq	-48(%rbp), %rdx	; arg3, tmp92
	movq	%rdx, 16(%rax)	; tmp92, inst_3->arg3
; temp/codegen.c:140:     return inst;
	movq	-8(%rbp), %rax	; inst, _12
; temp/codegen.c:141: }
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
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp97, arg
; temp/codegen.c:144:     arg->kind = kind;
	movq	-8(%rbp), %rax	; arg, tmp98
	movl	-20(%rbp), %edx	; kind, tmp99
	movl	%edx, 16(%rax)	; tmp99, arg_17->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	-8(%rbp), %rax	; arg, tmp100
	movq	$0, 8(%rax)	;, arg_17->type
; temp/codegen.c:146:     switch (kind) {
	cmpl	$7, -20(%rbp)	;, kind
	ja	.L68	;,
	movl	-20(%rbp), %eax	; kind, tmp101
	leaq	0(,%rax,4), %rdx	;, tmp102
	leaq	.L70(%rip), %rax	;, tmp103
	movl	(%rdx,%rax), %eax	;, tmp104
	cltq
	leaq	.L70(%rip), %rdx	;, tmp107
	addq	%rdx, %rax	; tmp107, tmp106
	jmp	*%rax	; tmp106
	.section	.rodata
	.align 4
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
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp108
	movq	-32(%rbp), %rdx	; value, tmp109
	movq	%rdx, (%rax)	; tmp109, arg_17->value.variable
; temp/codegen.c:149:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	; arg, tmp110
	movq	(%rax), %rax	; arg_17->value.variable, _1
; temp/codegen.c:149:             arg->type = arg->value.variable->type;
	movq	16(%rax), %rdx	; _1->type, _2
; temp/codegen.c:149:             arg->type = arg->value.variable->type;
	movq	-8(%rbp), %rax	; arg, tmp111
	movq	%rdx, 8(%rax)	; _2, arg_17->type
; temp/codegen.c:150:             break;
	jmp	.L78	;
.L76:
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	-32(%rbp), %rax	; value, tmp112
	movq	(%rax), %rdx	; MEM[(long long int *)value_21(D)], _3
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	-8(%rbp), %rax	; arg, tmp113
	movq	%rdx, (%rax)	; _3, arg_17->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rdx	; name_int, name_int.8_4
	movq	-8(%rbp), %rax	; arg, tmp114
	movq	%rdx, 8(%rax)	; name_int.8_4, arg_17->type
; temp/codegen.c:154:             break;
	jmp	.L78	;
.L75:
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	-32(%rbp), %rax	; value, tmp115
	movsd	(%rax), %xmm0	; MEM[(double *)value_21(D)], _5
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	-8(%rbp), %rax	; arg, tmp116
	movsd	%xmm0, (%rax)	; _5, arg_17->value.float_value
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rdx	; name_float, name_float.9_6
	movq	-8(%rbp), %rax	; arg, tmp117
	movq	%rdx, 8(%rax)	; name_float.9_6, arg_17->type
; temp/codegen.c:158:             break;
	jmp	.L78	;
.L74:
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movq	-8(%rbp), %rax	; arg, tmp118
	movq	-32(%rbp), %rdx	; value, tmp119
	movq	%rdx, (%rax)	; tmp119, arg_17->value.string_value
; temp/codegen.c:161:             arg->type = name_string;
	movq	name_string(%rip), %rdx	; name_string, name_string.10_7
	movq	-8(%rbp), %rax	; arg, tmp120
	movq	%rdx, 8(%rax)	; name_string.10_7, arg_17->type
; temp/codegen.c:162:             break;
	jmp	.L78	;
.L73:
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movq	-32(%rbp), %rax	; value, tmp121
	movzbl	(%rax), %edx	; MEM[(char *)value_21(D)], _8
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movq	-8(%rbp), %rax	; arg, tmp122
	movb	%dl, (%rax)	; _8, arg_17->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	; name_bool, name_bool.11_9
	movq	-8(%rbp), %rax	; arg, tmp123
	movq	%rdx, 8(%rax)	; name_bool.11_9, arg_17->type
; temp/codegen.c:166:             break;
	jmp	.L78	;
.L72:
; temp/codegen.c:168:             arg->value.string_value = NULL;
	movq	-8(%rbp), %rax	; arg, tmp124
	movq	$0, (%rax)	;, arg_17->value.string_value
; temp/codegen.c:169:             arg->type = name_void;
	movq	name_void(%rip), %rdx	; name_void, name_void.12_10
	movq	-8(%rbp), %rax	; arg, tmp125
	movq	%rdx, 8(%rax)	; name_void.12_10, arg_17->type
; temp/codegen.c:170:             break;
	jmp	.L78	;
.L71:
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp126
	movq	-32(%rbp), %rdx	; value, tmp127
	movq	%rdx, (%rax)	; tmp127, arg_17->value.label
; temp/codegen.c:173:             break;
	jmp	.L78	;
.L69:
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	-8(%rbp), %rax	; arg, tmp128
	movq	-32(%rbp), %rdx	; value, tmp129
	movq	%rdx, (%rax)	; tmp129, arg_17->value.subroutine
; temp/codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	; arg, tmp130
	movq	(%rax), %rax	; arg_17->value.subroutine, _11
; temp/codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	16(%rax), %rdx	; _11->type, _12
; temp/codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	-8(%rbp), %rax	; arg, tmp131
	movq	%rdx, 8(%rax)	; _12, arg_17->type
; temp/codegen.c:177:             break;
	jmp	.L78	;
.L68:
; temp/codegen.c:180:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	stderr(%rip), %rax	; stderr, stderr.13_13
	movl	-20(%rbp), %edx	; kind, tmp132
	leaq	.LC5(%rip), %rcx	;, tmp133
	movq	%rcx, %rsi	; tmp133,
	movq	%rax, %rdi	; stderr.13_13,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:181:             break;
	nop	
.L78:
; temp/codegen.c:183:     arg->is_get = false;
	movq	-8(%rbp), %rax	; arg, tmp134
	movb	$0, 20(%rax)	;, arg_17->is_get
; temp/codegen.c:184:     return arg;
	movq	-8(%rbp), %rax	; arg, _39
; temp/codegen.c:185: }
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
; temp/codegen.c:187:     if (arg == NULL)
	cmpq	$0, -24(%rbp)	;, arg
	jne	.L81	;,
; temp/codegen.c:188:         return NULL;
	movl	$0, %eax	;, _7
	jmp	.L82	;
.L81:
; temp/codegen.c:189:     if (arg->is_get) {
	movq	-24(%rbp), %rax	; arg, tmp90
	movzbl	20(%rax), %eax	; arg_9(D)->is_get, _1
; temp/codegen.c:189:     if (arg->is_get) {
	testb	%al, %al	; _1
	je	.L83	;,
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	-24(%rbp), %rax	; arg, tmp91
	movq	8(%rax), %rax	; arg_9(D)->type, _2
	movq	-32(%rbp), %rdx	; status, tmp92
	movq	%rdx, %rcx	; tmp92,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _2,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _3,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -8(%rbp)	; tmp93, temp
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	-24(%rbp), %rdx	; arg, tmp94
	movq	-8(%rbp), %rax	; temp, tmp95
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp95,
	movl	$23, %edi	;,
	call	create_instruction	;
	movq	%rax, %rdx	;, _4
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	-32(%rbp), %rax	; status, tmp96
	movq	16(%rax), %rax	; status_12(D)->current_block, _5
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	%rdx, %rsi	; _4,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:192:         return temp;
	movq	-8(%rbp), %rax	; temp, _7
	jmp	.L82	;
.L83:
; temp/codegen.c:194:     return arg;
	movq	-24(%rbp), %rax	; arg, _7
.L82:
; temp/codegen.c:195: }
	leave	
	ret	
	.size	load_rvalue, .-load_rvalue
	.type	find_var_by_symbol, @function
find_var_by_symbol:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	movq	%rdi, -24(%rbp)	; vars, vars
	movq	%rsi, -32(%rbp)	; symbol, symbol
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	cmpq	$0, -24(%rbp)	;, vars
	je	.L85	;,
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	cmpq	$0, -32(%rbp)	;, symbol
	jne	.L86	;,
.L85:
; temp/codegen.c:199:         return NULL;
	movl	$0, %eax	;, _3
	jmp	.L87	;
.L86:
; temp/codegen.c:200:     Node* current = vars->head;
	movq	-24(%rbp), %rax	; vars, tmp85
	movq	(%rax), %rax	; vars_4(D)->head, tmp86
	movq	%rax, -8(%rbp)	; tmp86, current
; temp/codegen.c:201:     while (current != NULL) {
	jmp	.L88	;
.L90:
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	-8(%rbp), %rax	; current, tmp87
	movq	8(%rax), %rax	; current_2->content, tmp88
	movq	%rax, -16(%rbp)	; tmp88, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	$0, -16(%rbp)	;, var
	je	.L89	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	movq	-16(%rbp), %rax	; var, tmp89
	movq	(%rax), %rax	; var_9->original_name, _1
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	%rax, -32(%rbp)	; _1, symbol
	jne	.L89	;,
; temp/codegen.c:204:             return var;
	movq	-16(%rbp), %rax	; var, _3
	jmp	.L87	;
.L89:
; temp/codegen.c:205:         current = current->next;
	movq	-8(%rbp), %rax	; current, tmp90
	movq	(%rax), %rax	; current_2->next, tmp91
	movq	%rax, -8(%rbp)	; tmp91, current
.L88:
; temp/codegen.c:201:     while (current != NULL) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L90	;,
; temp/codegen.c:207:     return NULL;
	movl	$0, %eax	;, _3
.L87:
; temp/codegen.c:208: }
	popq	%rbp	;
	ret	
	.size	find_var_by_symbol, .-find_var_by_symbol
	.type	resolve_named_var, @function
resolve_named_var:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; symbol, symbol
	movq	%rsi, -32(%rbp)	; status, status
; temp/codegen.c:211:     if (symbol == NULL || status == NULL)
	cmpq	$0, -24(%rbp)	;, symbol
	je	.L92	;,
; temp/codegen.c:211:     if (symbol == NULL || status == NULL)
	cmpq	$0, -32(%rbp)	;, status
	jne	.L93	;,
.L92:
; temp/codegen.c:212:         return NULL;
	movl	$0, %eax	;, _8
	jmp	.L94	;
.L93:
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	-32(%rbp), %rax	; status, tmp91
	movq	8(%rax), %rax	; status_12(D)->current_subroutine, _1
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rax, %rax	; _1
	je	.L95	;,
; temp/codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	-32(%rbp), %rax	; status, tmp92
	movq	8(%rax), %rax	; status_12(D)->current_subroutine, _2
; temp/codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rax), %rax	; _2->parameters, _3
	movq	-24(%rbp), %rdx	; symbol, tmp93
	movq	%rdx, %rsi	; tmp93,
	movq	%rax, %rdi	; _3,
	call	find_var_by_symbol	;
	movq	%rax, -8(%rbp)	; tmp94, var
; temp/codegen.c:215:         if (var != NULL)
	cmpq	$0, -8(%rbp)	;, var
	je	.L96	;,
; temp/codegen.c:216:             return var;
	movq	-8(%rbp), %rax	; var, _8
	jmp	.L94	;
.L96:
; temp/codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	-32(%rbp), %rax	; status, tmp95
	movq	8(%rax), %rax	; status_12(D)->current_subroutine, _4
; temp/codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rax), %rax	; _4->local_vars, _5
	movq	-24(%rbp), %rdx	; symbol, tmp96
	movq	%rdx, %rsi	; tmp96,
	movq	%rax, %rdi	; _5,
	call	find_var_by_symbol	;
	movq	%rax, -8(%rbp)	; tmp97, var
; temp/codegen.c:218:         if (var != NULL)
	cmpq	$0, -8(%rbp)	;, var
	je	.L95	;,
; temp/codegen.c:219:             return var;
	movq	-8(%rbp), %rax	; var, _8
	jmp	.L94	;
.L95:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	-32(%rbp), %rax	; status, tmp98
	movq	(%rax), %rax	; status_12(D)->tac, _6
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	16(%rax), %rax	; _6->global_vars, _7
	movq	-24(%rbp), %rdx	; symbol, tmp99
	movq	%rdx, %rsi	; tmp99,
	movq	%rax, %rdi	; _7,
	call	find_var_by_symbol	;
.L94:
; temp/codegen.c:222: }
	leave	
	ret	
	.size	resolve_named_var, .-resolve_named_var
	.type	find_self_parameter, @function
find_self_parameter:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; status, status
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	cmpq	$0, -24(%rbp)	;, status
	je	.L98	;,
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	movq	-24(%rbp), %rax	; status, tmp92
	movq	8(%rax), %rax	; status_14(D)->current_subroutine, _1
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rax, %rax	; _1
	jne	.L99	;,
.L98:
; temp/codegen.c:226:         return NULL;
	movl	$0, %eax	;, _10
	jmp	.L100	;
.L99:
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	-24(%rbp), %rax	; status, tmp93
	movq	8(%rax), %rax	; status_14(D)->current_subroutine, _2
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%rax), %rax	; _2->parameters, _3
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	(%rax), %rax	; _3->head, tmp94
	movq	%rax, -8(%rbp)	; tmp94, current
; temp/codegen.c:228:     while (current != NULL) {
	jmp	.L101	;
.L103:
; temp/codegen.c:229:         Var* var = (Var*)current->content;
	movq	-8(%rbp), %rax	; current, tmp95
	movq	8(%rax), %rax	; current_9->content, tmp96
	movq	%rax, -16(%rbp)	; tmp96, var
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	cmpq	$0, -16(%rbp)	;, var
	je	.L102	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	-16(%rbp), %rax	; var, tmp97
	movq	(%rax), %rax	; var_18->original_name, _4
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	; _4
	je	.L102	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	SELF_KEYWORD(%rip), %rdx	; SELF_KEYWORD, SELF_KEYWORD.14_5
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	-16(%rbp), %rax	; var, tmp98
	movq	(%rax), %rax	; var_18->original_name, _6
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rax	; _6->name, _7
	movq	%rdx, %rsi	; SELF_KEYWORD.14_5,
	movq	%rax, %rdi	; _7,
	call	*string_equal@GOTPCREL(%rip)	;
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	; _8
	je	.L102	;,
; temp/codegen.c:231:             return var;
	movq	-16(%rbp), %rax	; var, _10
	jmp	.L100	;
.L102:
; temp/codegen.c:232:         current = current->next;
	movq	-8(%rbp), %rax	; current, tmp99
	movq	(%rax), %rax	; current_9->next, tmp100
	movq	%rax, -8(%rbp)	; tmp100, current
.L101:
; temp/codegen.c:228:     while (current != NULL) {
	cmpq	$0, -8(%rbp)	;, current
	jne	.L103	;,
; temp/codegen.c:234:     return NULL;
	movl	$0, %eax	;, _10
.L100:
; temp/codegen.c:235: }
	leave	
	ret	
	.size	find_self_parameter, .-find_self_parameter
	.section	.rodata
.LC6:
	.string	"<unknown>"
	.align 8
.LC7:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
.LC8:
	.string	"$a%zu"
	.text
	.type	create_attribute_ref_var, @function
create_attribute_ref_var:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; class_type, class_type
	movq	%rsi, -64(%rbp)	; attr_name, attr_name
	movq	%rdx, -72(%rbp)	; status, status
; temp/codegen.c:238:     if (attr_name == NULL)
	cmpq	$0, -64(%rbp)	;, attr_name
	jne	.L105	;,
; temp/codegen.c:239:         return NULL;
	movl	$0, %eax	;, _12
	jmp	.L106	;
.L105:
; temp/codegen.c:240:     AttributeTable* table = find_attribute_table(status, class_type);
	movq	-56(%rbp), %rdx	; class_type, tmp94
	movq	-72(%rbp), %rax	; status, tmp95
	movq	%rdx, %rsi	; tmp94,
	movq	%rax, %rdi	; tmp95,
	call	find_attribute_table	;
	movq	%rax, -24(%rbp)	; tmp96, table
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	cmpq	$0, -24(%rbp)	;, table
	je	.L107	;,
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	-24(%rbp), %rax	; table, tmp97
	movq	(%rax), %rax	; table_22->attributes, _1
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rax, %rax	; _1
	jne	.L108	;,
.L107:
; temp/codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	-64(%rbp), %rax	; attr_name, tmp98
	movq	(%rax), %rsi	; attr_name_17(D)->type, _2
	movq	-72(%rbp), %rdx	; status, tmp99
	movq	-64(%rbp), %rax	; attr_name, tmp100
	movq	%rdx, %rcx	; tmp99,
	movl	$97, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	create_var	;
	jmp	.L106	;
.L108:
; temp/codegen.c:243:     size_t index = 0;
	movq	$0, -8(%rbp)	;, index
; temp/codegen.c:244:     bool found = false;
	movb	$0, -9(%rbp)	;, found
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	-24(%rbp), %rax	; table, tmp101
	movq	(%rax), %rax	; table_22->attributes, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp102, attrs
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	jmp	.L109	;
.L112:
; temp/codegen.c:248:         if (attr->var_name == attr_name) {
	movq	-40(%rbp), %rax	; attr, tmp103
	movq	(%rax), %rax	; attr_28->var_name, _4
; temp/codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	%rax, -64(%rbp)	; _4, attr_name
	jne	.L110	;,
; temp/codegen.c:249:             found = true;
	movb	$1, -9(%rbp)	;, found
; temp/codegen.c:250:             break;
	jmp	.L111	;
.L110:
; temp/codegen.c:252:         ++index;
	addq	$1, -8(%rbp)	;, index
.L109:
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	-32(%rbp), %rax	; attrs, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp105, attr
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	cmpq	$0, -40(%rbp)	;, attr
	jne	.L112	;,
.L111:
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp106, var
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	-48(%rbp), %rax	; var, tmp107
	movq	-64(%rbp), %rdx	; attr_name, tmp108
	movq	%rdx, (%rax)	; tmp108, var_32->original_name
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	-64(%rbp), %rax	; attr_name, tmp109
	movq	(%rax), %rdx	; attr_name_17(D)->type, _5
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	-48(%rbp), %rax	; var, tmp110
	movq	%rdx, 16(%rax)	; _5, var_32->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp111
	movq	%rax, %rdi	; tmp111,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	-48(%rbp), %rdx	; var, tmp112
	movq	%rax, 8(%rdx)	; _6, var_32->name
; temp/codegen.c:258:     if (!found)
	cmpb	$0, -9(%rbp)	;, found
	jne	.L113	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	cmpq	$0, -56(%rbp)	;, class_type
	je	.L114	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	-56(%rbp), %rax	; class_type, tmp113
	movq	8(%rax), %rax	; class_type_20(D)->name, iftmp.15_13
	jmp	.L115	;
.L114:
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC6(%rip), %rax	;, iftmp.15_13
.L115:
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	-64(%rbp), %rdx	; attr_name, tmp114
	movq	8(%rdx), %rdx	; attr_name_17(D)->name, _7
	movq	stderr(%rip), %rdi	; stderr, stderr.16_8
	movq	-8(%rbp), %rcx	; index, tmp115
	movq	%rcx, %r8	; tmp115,
	movq	%rax, %rcx	; iftmp.15_13,
	leaq	.LC7(%rip), %rax	;, tmp116
	movq	%rax, %rsi	; tmp116,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L113:
; temp/codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	-48(%rbp), %rax	; var, tmp117
	movq	8(%rax), %rax	; var_32->name, _9
	movq	-8(%rbp), %rdx	; index, tmp118
	leaq	.LC8(%rip), %rcx	;, tmp119
	movq	%rcx, %rsi	; tmp119,
	movq	%rax, %rdi	; _9,
	movl	$0, %eax	;,
	call	*sprintf@GOTPCREL(%rip)	;
; temp/codegen.c:261:     return var;
	movq	-48(%rbp), %rax	; var, _12
.L106:
; temp/codegen.c:262: }
	leave	
	ret	
	.size	create_attribute_ref_var, .-create_attribute_ref_var
	.section	.rodata
	.align 8
.LC9:
	.string	"[warning] Invalid attribute access\n"
	.text
	.type	emit_attribute_access, @function
emit_attribute_access:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; object, object
	movq	%rsi, -64(%rbp)	; attr_name, attr_name
	movq	%rdx, -72(%rbp)	; status, status
; temp/codegen.c:265:     if (object == NULL || attr_name == NULL) {
	cmpq	$0, -56(%rbp)	;, object
	je	.L117	;,
; temp/codegen.c:265:     if (object == NULL || attr_name == NULL) {
	cmpq	$0, -64(%rbp)	;, attr_name
	jne	.L118	;,
.L117:
; temp/codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movq	stderr(%rip), %rax	; stderr, stderr.17_1
	movq	%rax, %rcx	; stderr.17_1,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:267:         return NULL;
	movl	$0, %eax	;, _11
	jmp	.L119	;
.L118:
; temp/codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	-72(%rbp), %rdx	; status, tmp94
	movq	-56(%rbp), %rax	; object, tmp95
	movq	%rdx, %rsi	; tmp94,
	movq	%rax, %rdi	; tmp95,
	call	load_rvalue	;
	movq	%rax, -16(%rbp)	; tmp96, object_value
; temp/codegen.c:270:     if (object_value == NULL)
	cmpq	$0, -16(%rbp)	;, object_value
	jne	.L120	;,
; temp/codegen.c:271:         return NULL;
	movl	$0, %eax	;, _11
	jmp	.L119	;
.L120:
; temp/codegen.c:272:     Symbol* class_type = NULL;
	movq	$0, -8(%rbp)	;, class_type
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	; object_value, tmp97
	movq	8(%rax), %rax	; object_value_18->type, _2
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _2
	je	.L121	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	-16(%rbp), %rax	; object_value, tmp98
	movq	8(%rax), %rax	; object_value_18->type, _3
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _3->kind, _4
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _4
	jne	.L121	;,
; temp/codegen.c:274:         class_type = object_value->type;
	movq	-16(%rbp), %rax	; object_value, tmp99
	movq	8(%rax), %rax	; object_value_18->type, tmp100
	movq	%rax, -8(%rbp)	; tmp100, class_type
.L121:
; temp/codegen.c:275:     Var* attr_var = create_attribute_ref_var(class_type, attr_name, status);
	movq	-72(%rbp), %rdx	; status, tmp101
	movq	-64(%rbp), %rcx	; attr_name, tmp102
	movq	-8(%rbp), %rax	; class_type, tmp103
	movq	%rcx, %rsi	; tmp102,
	movq	%rax, %rdi	; tmp103,
	call	create_attribute_ref_var	;
	movq	%rax, -24(%rbp)	; tmp104, attr_var
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	-64(%rbp), %rax	; attr_name, tmp105
	movq	(%rax), %rax	; attr_name_14(D)->type, _5
	movq	-72(%rbp), %rdx	; status, tmp106
	movq	%rdx, %rcx	; tmp106,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _5,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _6,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -32(%rbp)	; tmp107, result
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	-24(%rbp), %rax	; attr_var, tmp108
	movq	%rax, %rsi	; tmp108,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _7
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	-16(%rbp), %rdx	; object_value, tmp109
	movq	-32(%rbp), %rax	; result, tmp110
	movq	%rax, %rsi	; tmp110,
	movl	$15, %edi	;,
	call	create_instruction	;
	movq	%rax, -40(%rbp)	; tmp111, inst
; temp/codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-72(%rbp), %rax	; status, tmp112
	movq	16(%rax), %rax	; status_16(D)->current_block, _8
; temp/codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _8->instructions, _9
	movq	-40(%rbp), %rdx	; inst, tmp113
	movq	%rdx, %rsi	; tmp113,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:279:     result->is_get = true;
	movq	-32(%rbp), %rax	; result, tmp114
	movb	$1, 20(%rax)	;, result_25->is_get
; temp/codegen.c:280:     return result;
	movq	-32(%rbp), %rax	; result, _11
.L119:
; temp/codegen.c:281: }
	leave	
	ret	
	.size	emit_attribute_access, .-emit_attribute_access
	.type	emit_param_instruction, @function
emit_param_instruction:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; value, value
	movq	%rsi, -32(%rbp)	; status, status
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	cmpq	$0, -24(%rbp)	;, value
	je	.L126	;,
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	cmpq	$0, -32(%rbp)	;, status
	je	.L126	;,
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	-24(%rbp), %rax	; value, tmp88
	movq	8(%rax), %rax	; value_8(D)->type, _1
	movq	%rax, %rdi	; _1,
	call	get_type_size	;
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, -16(%rbp)	; _3, size
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	leaq	-16(%rbp), %rax	;, tmp89
	movq	%rax, %rsi	; tmp89,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _4
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movq	-24(%rbp), %rax	; value, tmp90
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; tmp90,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, -8(%rbp)	; tmp91, inst
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-32(%rbp), %rax	; status, tmp92
	movq	16(%rax), %rax	; status_9(D)->current_block, _5
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	-8(%rbp), %rdx	; inst, tmp93
	movq	%rdx, %rsi	; tmp93,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L122	;
.L126:
; temp/codegen.c:285:         return;
	nop	
.L122:
; temp/codegen.c:289: }
	leave	
	ret	
	.size	emit_param_instruction, .-emit_param_instruction
	.section	.rodata
.LC10:
	.string	"main"
	.text
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; code, code
; temp/codegen.c:292:     TAC* tac = create_tac();
	call	create_tac	;
	movq	%rax, -8(%rbp)	; tmp97, tac
; temp/codegen.c:293:     TACStatus* status = create_tac_status(tac);
	movq	-8(%rbp), %rax	; tac, tmp98
	movq	%rax, %rdi	; tmp98,
	call	create_tac_status	;
	movq	%rax, -16(%rbp)	; tmp99, status
; temp/codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	-40(%rbp), %rax	; code, tmp100
	movq	(%rax), %rax	; code_20(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp101, members
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L128	;
.L132:
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movq	-32(%rbp), %rax	; code_member, tmp102
	movl	8(%rax), %eax	; code_member_24->type, _2
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	jne	.L129	;,
; temp/codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	-32(%rbp), %rax	; code_member, tmp103
	movq	(%rax), %rax	; code_member_24->content.function, _3
	movq	-16(%rbp), %rdx	; status, tmp104
	movq	%rdx, %rsi	; tmp104,
	movq	%rax, %rdi	; _3,
	call	codegen_function	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	-32(%rbp), %rax	; code_member, tmp105
	movq	(%rax), %rax	; code_member_24->content.function, _4
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rax	; _4->name, _5
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rax), %rax	; _5->name, _6
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC10(%rip), %rdx	;, tmp106
	movq	%rdx, %rsi	; tmp106,
	movq	%rax, %rdi	; _6,
	call	*strcmp@GOTPCREL(%rip)	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; _7
	jne	.L128	;,
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	-32(%rbp), %rax	; code_member, tmp107
	movq	(%rax), %rax	; code_member_24->content.function, _8
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	(%rax), %rdx	; _8->name, _9
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	-8(%rbp), %rax	; tac, tmp108
	movq	%rdx, 8(%rax)	; _9, tac_17->entry_point
	jmp	.L128	;
.L129:
; temp/codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	movq	-32(%rbp), %rax	; code_member, tmp109
	movl	8(%rax), %eax	; code_member_24->type, _10
; temp/codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _10
	jne	.L131	;,
; temp/codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	-32(%rbp), %rax	; code_member, tmp110
	movq	(%rax), %rax	; code_member_24->content.class, _11
	movq	-16(%rbp), %rdx	; status, tmp111
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; _11,
	call	codegen_class	;
	jmp	.L128	;
.L131:
; temp/codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	movq	-32(%rbp), %rax	; code_member, tmp112
	movl	8(%rax), %eax	; code_member_24->type, _12
; temp/codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _12
	jne	.L128	;,
; temp/codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	-32(%rbp), %rax	; code_member, tmp113
	movq	(%rax), %rax	; code_member_24->content.import, _13
	movq	-16(%rbp), %rdx	; status, tmp114
	movq	-8(%rbp), %rcx	; tac, tmp115
	movq	%rcx, %rsi	; tmp115,
	movq	%rax, %rdi	; _13,
	call	codegen_import	;
.L128:
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	-24(%rbp), %rax	; members, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp117, code_member
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	cmpq	$0, -32(%rbp)	;, code_member
	jne	.L132	;,
; temp/codegen.c:307:     return tac;
	movq	-8(%rbp), %rax	; tac, _25
; temp/codegen.c:308: }
	leave	
	ret	
	.size	codegen_code, .-codegen_code
	.section	.rodata
	.align 8
.LC11:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; import, import
	movq	%rsi, -16(%rbp)	; tac, tac
	movq	%rdx, -24(%rbp)	; status, status
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	-8(%rbp), %rax	; import, tmp106
	movq	(%rax), %rax	; import_27(D)->name, _1
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rax), %eax	; _1->kind, _2
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	;, _2
	jne	.L135	;,
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	-8(%rbp), %rax	; import, tmp107
	movq	(%rax), %rax	; import_27(D)->name, _3
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rax), %rsi	; _3->type, _4
	movq	-8(%rbp), %rax	; import, tmp108
	movq	(%rax), %rax	; import_27(D)->name, _5
	movq	-24(%rbp), %rdx	; status, tmp109
	movq	%rdx, %rcx	; tmp109,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; _5,
	call	create_var	;
	movq	%rax, %rdx	;, _6
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	-16(%rbp), %rax	; tac, tmp110
	movq	16(%rax), %rax	; tac_30(D)->global_vars, _7
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; _7,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:318: }
	jmp	.L140	;
.L135:
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	-8(%rbp), %rax	; import, tmp111
	movq	(%rax), %rax	; import_27(D)->name, _8
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	; _8->kind, _9
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, _9
	je	.L137	;,
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movq	-8(%rbp), %rax	; import, tmp112
	movq	(%rax), %rax	; import_27(D)->name, _10
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	movl	32(%rax), %eax	; _10->kind, _11
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _11
	jne	.L138	;,
.L137:
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	-8(%rbp), %rax	; import, tmp113
	movq	(%rax), %rax	; import_27(D)->name, _12
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; _12->type, _13
	movq	-8(%rbp), %rax	; import, tmp114
	movq	(%rax), %rax	; import_27(D)->name, _14
	movq	-24(%rbp), %rdx	; status, tmp115
	movq	%rdx, %rcx	; tmp115,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; _14,
	call	create_var	;
	movq	%rax, %rdx	;, _15
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	-16(%rbp), %rax	; tac, tmp116
	movq	16(%rax), %rax	; tac_30(D)->global_vars, _16
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:318: }
	jmp	.L140	;
.L138:
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	movq	-8(%rbp), %rax	; import, tmp117
	movq	(%rax), %rax	; import_27(D)->name, _17
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _17->kind, _18
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _18
	jne	.L139	;,
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	-8(%rbp), %rax	; import, tmp118
	movq	(%rax), %rax	; import_27(D)->name, _19
	movq	%rax, %rdi	; _19,
	call	create_attribute_table	;
	movq	%rax, %rdx	;, _20
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	-16(%rbp), %rax	; tac, tmp119
	movq	(%rax), %rax	; tac_30(D)->attribute_tables, _21
	movq	%rdx, %rsi	; _20,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:318: }
	jmp	.L140	;
.L139:
; temp/codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	-8(%rbp), %rax	; import, tmp120
	movq	(%rax), %rax	; import_27(D)->name, _22
; temp/codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	32(%rax), %edx	; _22->kind, _23
; temp/codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	stderr(%rip), %rax	; stderr, stderr.18_24
	leaq	.LC11(%rip), %rcx	;, tmp121
	movq	%rcx, %rsi	; tmp121,
	movq	%rax, %rdi	; stderr.18_24,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L140:
; temp/codegen.c:318: }
	nop	
	leave	
	ret	
	.size	codegen_import, .-codegen_import
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; function, function
	movq	%rsi, -64(%rbp)	; status, status
; temp/codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	-56(%rbp), %rax	; function, tmp94
	movq	8(%rax), %rdx	; function_16(D)->return_type, _1
	movq	-56(%rbp), %rax	; function, tmp95
	movq	(%rax), %rax	; function_16(D)->name, _2
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; _2,
	call	create_subroutine	;
	movq	%rax, -8(%rbp)	; tmp96, subroutine
; temp/codegen.c:322:     status->current_subroutine = subroutine;
	movq	-64(%rbp), %rax	; status, tmp97
	movq	-8(%rbp), %rdx	; subroutine, tmp98
	movq	%rdx, 8(%rax)	; tmp98, status_19(D)->current_subroutine
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	-64(%rbp), %rax	; status, tmp99
	movq	(%rax), %rax	; status_19(D)->tac, _3
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	; _3->subroutines, _4
	movq	-8(%rbp), %rdx	; subroutine, tmp100
	movq	%rdx, %rsi	; tmp100,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	-56(%rbp), %rax	; function, tmp101
	movq	16(%rax), %rax	; function_16(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, parameters
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L142	;
.L143:
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
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
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	; subroutine, tmp106
	movq	16(%rax), %rax	; subroutine_18->parameters, _9
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
.L142:
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	; parameters, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, parameter
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	;, parameter
	jne	.L143	;,
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	-64(%rbp), %rax	; status, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	; _10,
	call	create_block	;
	movq	%rax, -32(%rbp)	; tmp110, block
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	; subroutine, tmp111
	movq	32(%rax), %rax	; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	; block, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:332:     status->current_block = block;
	movq	-64(%rbp), %rax	; status, tmp113
	movq	-32(%rbp), %rdx	; block, tmp114
	movq	%rdx, 16(%rax)	; tmp114, status_19(D)->current_block
; temp/codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	-56(%rbp), %rax	; function, tmp115
	movq	24(%rax), %rax	; function_16(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp116, statements
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L144	;
.L145:
; temp/codegen.c:337:         codegen_statement(statement, status);
	movq	-64(%rbp), %rdx	; status, tmp117
	movq	-48(%rbp), %rax	; statement, tmp118
	movq	%rdx, %rsi	; tmp117,
	movq	%rax, %rdi	; tmp118,
	call	codegen_statement	;
.L144:
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	; statements, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp120, statement
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L145	;,
; temp/codegen.c:339:     status->current_subroutine = NULL;
	movq	-64(%rbp), %rax	; status, tmp121
	movq	$0, 8(%rax)	;, status_19(D)->current_subroutine
; temp/codegen.c:340: }
	nop	
	leave	
	ret	
	.size	codegen_function, .-codegen_function
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; method, method
	movq	%rsi, -64(%rbp)	; status, status
; temp/codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	-56(%rbp), %rax	; method, tmp94
	movq	8(%rax), %rdx	; method_16(D)->return_type, _1
	movq	-56(%rbp), %rax	; method, tmp95
	movq	(%rax), %rax	; method_16(D)->name, _2
	movq	%rdx, %rsi	; _1,
	movq	%rax, %rdi	; _2,
	call	create_subroutine	;
	movq	%rax, -8(%rbp)	; tmp96, subroutine
; temp/codegen.c:344:     status->current_subroutine = subroutine;
	movq	-64(%rbp), %rax	; status, tmp97
	movq	-8(%rbp), %rdx	; subroutine, tmp98
	movq	%rdx, 8(%rax)	; tmp98, status_19(D)->current_subroutine
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	-64(%rbp), %rax	; status, tmp99
	movq	(%rax), %rax	; status_19(D)->tac, _3
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rax	; _3->subroutines, _4
	movq	-8(%rbp), %rdx	; subroutine, tmp100
	movq	%rdx, %rsi	; tmp100,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	-56(%rbp), %rax	; method, tmp101
	movq	16(%rax), %rax	; method_16(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, parameters
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L147	;
.L148:
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
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
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	-8(%rbp), %rax	; subroutine, tmp106
	movq	16(%rax), %rax	; subroutine_18->parameters, _9
	movq	%rdx, %rsi	; _8,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
.L147:
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	-16(%rbp), %rax	; parameters, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, parameter
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	cmpq	$0, -24(%rbp)	;, parameter
	jne	.L148	;,
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	-64(%rbp), %rax	; status, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rdi	; _10,
	call	create_block	;
	movq	%rax, -32(%rbp)	; tmp110, block
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	-8(%rbp), %rax	; subroutine, tmp111
	movq	32(%rax), %rax	; subroutine_18->blocks, _11
	movq	-32(%rbp), %rdx	; block, tmp112
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:354:     status->current_block = block;
	movq	-64(%rbp), %rax	; status, tmp113
	movq	-32(%rbp), %rdx	; block, tmp114
	movq	%rdx, 16(%rax)	; tmp114, status_19(D)->current_block
; temp/codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	-56(%rbp), %rax	; method, tmp115
	movq	24(%rax), %rax	; method_16(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp116, statements
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L149	;
.L150:
; temp/codegen.c:359:         codegen_statement(statement, status);
	movq	-64(%rbp), %rdx	; status, tmp117
	movq	-48(%rbp), %rax	; statement, tmp118
	movq	%rdx, %rsi	; tmp117,
	movq	%rax, %rdi	; tmp118,
	call	codegen_statement	;
.L149:
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	-40(%rbp), %rax	; statements, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp120, statement
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L150	;,
; temp/codegen.c:361:     status->current_subroutine = NULL;
	movq	-64(%rbp), %rax	; status, tmp121
	movq	$0, 8(%rax)	;, status_19(D)->current_subroutine
; temp/codegen.c:362: }
	nop	
	leave	
	ret	
	.size	codegen_method, .-codegen_method
	.section	.rodata
	.align 8
.LC12:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -40(%rbp)	; class, class
	movq	%rsi, -48(%rbp)	; status, status
; temp/codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	-40(%rbp), %rax	; class, tmp92
	movq	8(%rax), %rax	; class_13(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp93, members
; temp/codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	-40(%rbp), %rax	; class, tmp94
	movq	(%rax), %rax	; class_13(D)->name, _2
	movq	%rax, %rdi	; _2,
	call	create_attribute_table	;
	movq	%rax, -16(%rbp)	; tmp95, attr_table
; temp/codegen.c:368:     attr_table->size = class->size;
	movq	-40(%rbp), %rax	; class, tmp96
	movq	24(%rax), %rdx	; class_13(D)->size, _3
; temp/codegen.c:368:     attr_table->size = class->size;
	movq	-16(%rbp), %rax	; attr_table, tmp97
	movq	%rdx, 16(%rax)	; _3, attr_table_17->size
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	-48(%rbp), %rax	; status, tmp98
	movq	(%rax), %rax	; status_19(D)->tac, _4
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	; _4->attribute_tables, _5
	movq	-16(%rbp), %rdx	; attr_table, tmp99
	movq	%rdx, %rsi	; tmp99,
	movq	%rax, %rdi	; _5,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L152	;
.L157:
; temp/codegen.c:371:         switch (member->type) {
	movq	-24(%rbp), %rax	; member, tmp100
	movl	8(%rax), %eax	; member_22->type, _6
; temp/codegen.c:371:         switch (member->type) {
	testl	%eax, %eax	; _6
	je	.L153	;,
	cmpl	$1, %eax	;, _6
	je	.L154	;,
	jmp	.L158	;
.L153:
; temp/codegen.c:373:                 codegen_method(member->content.method, status);
	movq	-24(%rbp), %rax	; member, tmp101
	movq	(%rax), %rax	; member_22->content.method, _7
	movq	-48(%rbp), %rdx	; status, tmp102
	movq	%rdx, %rsi	; tmp102,
	movq	%rax, %rdi	; _7,
	call	codegen_method	;
; temp/codegen.c:374:                 break;
	jmp	.L152	;
.L154:
; temp/codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	-24(%rbp), %rax	; member, tmp103
	movq	(%rax), %rax	; member_22->content.variable, _8
	movq	-48(%rbp), %rcx	; status, tmp104
	movl	$97, %edx	;,
	movq	%rcx, %rsi	; tmp104,
	movq	%rax, %rdi	; _8,
	call	codegen_variable	;
; temp/codegen.c:377:                 break;
	jmp	.L152	;
.L158:
; temp/codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movq	-24(%rbp), %rax	; member, tmp105
	movl	8(%rax), %edx	; member_22->type, _9
; temp/codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movq	stderr(%rip), %rax	; stderr, stderr.19_10
	leaq	.LC12(%rip), %rcx	;, tmp106
	movq	%rcx, %rsi	; tmp106,
	movq	%rax, %rdi	; stderr.19_10,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:380:                 break;
	nop	
.L152:
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	-8(%rbp), %rax	; members, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, member
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	cmpq	$0, -24(%rbp)	;, member
	jne	.L157	;,
; temp/codegen.c:383: }
	nop	
	nop	
	leave	
	ret	
	.size	codegen_class, .-codegen_class
	.section	.rodata
	.align 8
.LC13:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; variable, variable
	movq	%rsi, -32(%rbp)	; status, status
	movl	%edx, -36(%rbp)	; type, type
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	-24(%rbp), %rax	; variable, tmp99
	movq	(%rax), %rsi	; variable_20(D)->type, _1
	movq	-24(%rbp), %rax	; variable, tmp100
	movq	8(%rax), %rax	; variable_20(D)->name, _2
	movq	-32(%rbp), %rcx	; status, tmp101
	movl	-36(%rbp), %edx	; type, tmp102
	movq	%rax, %rdi	; _2,
	call	create_var	;
	movq	%rax, -8(%rbp)	; tmp103, var
; temp/codegen.c:386:     switch (type) {
	movl	-36(%rbp), %eax	; type, tmp105
	subl	$97, %eax	;, tmp104
	cmpl	$21, %eax	;, tmp104
	ja	.L160	;,
	movl	%eax, %eax	; tmp104, tmp106
	leaq	0(,%rax,4), %rdx	;, tmp107
	leaq	.L162(%rip), %rax	;, tmp108
	movl	(%rdx,%rax), %eax	;, tmp109
	cltq
	leaq	.L162(%rip), %rdx	;, tmp112
	addq	%rdx, %rax	; tmp112, tmp111
	jmp	*%rax	; tmp111
	.section	.rodata
	.align 4
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
; temp/codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	-32(%rbp), %rax	; status, tmp113
	movq	8(%rax), %rax	; status_22(D)->current_subroutine, _3
; temp/codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	16(%rax), %rax	; _3->parameters, _4
	movq	-8(%rbp), %rdx	; var, tmp114
	movq	%rdx, %rsi	; tmp114,
	movq	%rax, %rdi	; _4,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:389:             break;
	jmp	.L167	;
.L161:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	-32(%rbp), %rax	; status, tmp115
	movq	8(%rax), %rax	; status_22(D)->current_subroutine, _5
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rax	; _5->local_vars, _6
	movq	-8(%rbp), %rdx	; var, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:392:             break;
	jmp	.L167	;
.L163:
; temp/codegen.c:394:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	-32(%rbp), %rax	; status, tmp117
	movq	8(%rax), %rax	; status_22(D)->current_subroutine, _7
; temp/codegen.c:394:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rax	; _7->local_vars, _8
	movq	-8(%rbp), %rdx	; var, tmp118
	movq	%rdx, %rsi	; tmp118,
	movq	%rax, %rdi	; _8,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:395:             break;
	jmp	.L167	;
.L165:
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	-32(%rbp), %rax	; status, tmp119
	movq	(%rax), %rax	; status_22(D)->tac, _9
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rax	; _9->global_vars, _10
	movq	-8(%rbp), %rdx	; var, tmp120
	movq	%rdx, %rsi	; tmp120,
	movq	%rax, %rdi	; _10,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:398:             break;
	jmp	.L167	;
.L166:
; temp/codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	-32(%rbp), %rax	; status, tmp121
	movq	(%rax), %rax	; status_22(D)->tac, _11
; temp/codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rax), %rax	; _11->attribute_tables, _12
	movq	%rax, %rdi	; _12,
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp122, attr_table
; temp/codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	-32(%rbp), %rax	; status, tmp123
	movq	(%rax), %rax	; status_22(D)->tac, _13
; temp/codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rax	; _13->attribute_tables, _14
	movq	-16(%rbp), %rdx	; attr_table, tmp124
	movq	%rdx, %rsi	; tmp124,
	movq	%rax, %rdi	; _14,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	-24(%rbp), %rax	; variable, tmp125
	movq	(%rax), %rsi	; variable_20(D)->type, _15
	movq	-24(%rbp), %rax	; variable, tmp126
	movq	8(%rax), %rax	; variable_20(D)->name, _16
	movq	-16(%rbp), %rdx	; attr_table, tmp127
	movl	$0, %ecx	;,
	movq	%rax, %rdi	; _16,
	call	create_attribute	;
; temp/codegen.c:403:             break;
	jmp	.L167	;
.L160:
; temp/codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.20_17
	movl	-36(%rbp), %edx	; type, tmp128
	leaq	.LC13(%rip), %rcx	;, tmp129
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; stderr.20_17,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:408:             break;
	nop	
.L167:
; temp/codegen.c:410: }
	nop	
	leave	
	ret	
	.size	codegen_variable, .-codegen_variable
	.section	.rodata
	.align 8
.LC14:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC15:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC16:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; statement, statement
	movq	%rsi, -64(%rbp)	; status, status
; temp/codegen.c:412:     switch (statement->type) {
	movq	-56(%rbp), %rax	; statement, tmp107
	movl	8(%rax), %eax	; statement_28(D)->type, _1
; temp/codegen.c:412:     switch (statement->type) {
	cmpl	$7, %eax	;, _1
	ja	.L169	;,
	movl	%eax, %eax	; _1, tmp108
	leaq	0(,%rax,4), %rdx	;, tmp109
	leaq	.L171(%rip), %rax	;, tmp110
	movl	(%rdx,%rax), %eax	;, tmp111
	cltq
	leaq	.L171(%rip), %rdx	;, tmp114
	addq	%rdx, %rax	; tmp114, tmp113
	jmp	*%rax	; tmp113
	.section	.rodata
	.align 4
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
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	-56(%rbp), %rax	; statement, tmp115
	movq	(%rax), %rax	; statement_28(D)->stmt.expr, _2
	movq	-64(%rbp), %rdx	; status, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; _2,
	call	codegen_expression	;
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	.L179	;
.L177:
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	-56(%rbp), %rax	; statement, tmp117
	movq	(%rax), %rax	; statement_28(D)->stmt.var, _3
	movq	-64(%rbp), %rcx	; status, tmp118
	movl	$118, %edx	;,
	movq	%rcx, %rsi	; tmp118,
	movq	%rax, %rdi	; _3,
	call	codegen_variable	;
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L179	;
.L176:
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp119
	movq	(%rax), %rax	; statement_28(D)->stmt.if_stmt, _4
	movq	-64(%rbp), %rdx	; status, tmp120
	movq	%rdx, %rsi	; tmp120,
	movq	%rax, %rdi	; _4,
	call	codegen_if	;
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	.L179	;
.L175:
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp121
	movq	(%rax), %rax	; statement_28(D)->stmt.while_stmt, _5
	movq	-64(%rbp), %rdx	; status, tmp122
	movq	%rdx, %rsi	; tmp122,
	movq	%rax, %rdi	; _5,
	call	codegen_while	;
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	.L179	;
.L174:
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	-56(%rbp), %rax	; statement, tmp123
	movq	(%rax), %rax	; statement_28(D)->stmt.for_stmt, _6
	movq	-64(%rbp), %rdx	; status, tmp124
	movq	%rdx, %rsi	; tmp124,
	movq	%rax, %rdi	; _6,
	call	codegen_for	;
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	.L179	;
.L173:
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	-56(%rbp), %rax	; statement, tmp125
	movq	(%rax), %rax	; statement_28(D)->stmt.return_expr, _7
	movq	-64(%rbp), %rdx	; status, tmp126
	movq	%rdx, %rsi	; tmp126,
	movq	%rax, %rdi	; _7,
	call	codegen_expression	;
	movq	%rax, -40(%rbp)	; tmp127, return_value
; temp/codegen.c:420:             Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
	movq	-40(%rbp), %rax	; return_value, tmp128
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp128,
	movl	$21, %edi	;,
	call	create_instruction	;
	movq	%rax, -48(%rbp)	; tmp129, inst
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp130
	movq	16(%rax), %rax	; status_29(D)->current_block, _8
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _8->instructions, _9
	movq	-48(%rbp), %rdx	; inst, tmp131
	movq	%rdx, %rsi	; tmp131,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:422:             break;
	jmp	.L179	;
.L172:
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	-64(%rbp), %rax	; status, tmp132
	movq	24(%rax), %rax	; status_29(D)->end_labels, _10
	movq	%rax, %rdi	; _10,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; _11
	jne	.L180	;,
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	-64(%rbp), %rax	; status, tmp133
	movq	24(%rax), %rax	; status_29(D)->end_labels, _12
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _12->tail, _13
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _13->content, tmp134
	movq	%rax, -24(%rbp)	; tmp134, label
; temp/codegen.c:427:                 if (label != NULL) {
	cmpq	$0, -24(%rbp)	;, label
	je	.L180	;,
; temp/codegen.c:428:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-24(%rbp), %rax	; label, tmp135
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp135,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp136, inst
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp137
	movq	16(%rax), %rax	; status_29(D)->current_block, _14
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _14->instructions, _15
	movq	-32(%rbp), %rdx	; inst, tmp138
	movq	%rdx, %rsi	; tmp138,
	movq	%rax, %rdi	; _15,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:430:                     break;
	jmp	.L179	;
.L180:
; temp/codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	stderr(%rip), %rax	; stderr, stderr.21_16
	movq	%rax, %rcx	; stderr.21_16,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:434:             break;
	jmp	.L179	;
.L170:
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	-64(%rbp), %rax	; status, tmp140
	movq	32(%rax), %rax	; status_29(D)->start_labels, _17
	movq	%rax, %rdi	; _17,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; _18
	jne	.L181	;,
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	-64(%rbp), %rax	; status, tmp141
	movq	32(%rax), %rax	; status_29(D)->start_labels, _19
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _19->tail, _20
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _20->content, tmp142
	movq	%rax, -8(%rbp)	; tmp142, label
; temp/codegen.c:438:                 if (label != NULL) {
	cmpq	$0, -8(%rbp)	;, label
	je	.L181	;,
; temp/codegen.c:439:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movq	-8(%rbp), %rax	; label, tmp143
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp143,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp144, inst
; temp/codegen.c:440:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp145
	movq	16(%rax), %rax	; status_29(D)->current_block, _21
; temp/codegen.c:440:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _21->instructions, _22
	movq	-16(%rbp), %rdx	; inst, tmp146
	movq	%rdx, %rsi	; tmp146,
	movq	%rax, %rdi	; _22,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:441:                     break;
	jmp	.L179	;
.L181:
; temp/codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	stderr(%rip), %rax	; stderr, stderr.22_23
	movq	%rax, %rcx	; stderr.22_23,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:445:             break;
	jmp	.L179	;
.L169:
; temp/codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movq	-56(%rbp), %rax	; statement, tmp148
	movl	8(%rax), %edx	; statement_28(D)->type, _24
; temp/codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movq	stderr(%rip), %rax	; stderr, stderr.23_25
	leaq	.LC16(%rip), %rcx	;, tmp149
	movq	%rcx, %rsi	; tmp149,
	movq	%rax, %rdi	; stderr.23_25,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:448:             break;
	nop	
.L179:
; temp/codegen.c:450: }
	nop	
	leave	
	ret	
	.size	codegen_statement, .-codegen_statement
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$184, %rsp	;,
	movq	%rdi, -184(%rbp)	; if_, if_
	movq	%rsi, -192(%rbp)	; status, status
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp124, then_label
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp125
	movq	%rax, %rcx	; tmp125,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp126, else_label
; temp/codegen.c:455:     Var* end_label = NULL;
	movq	$0, -32(%rbp)	;, end_label
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp127
	movq	16(%rax), %rax	; if__62(D)->else_if, _1
	movq	%rax, %rdi	; _1,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; _2
	je	.L183	;,
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp128
	movq	24(%rax), %rax	; if__62(D)->else_body, _3
	movq	%rax, %rdi	; _3,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; _4
	je	.L183	;,
; temp/codegen.c:457:         end_label = else_label;
	movq	-24(%rbp), %rax	; else_label, tmp129
	movq	%rax, -32(%rbp)	; tmp129, end_label
	jmp	.L184	;
.L183:
; temp/codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -32(%rbp)	; tmp131, end_label
.L184:
; temp/codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	-32(%rbp), %rax	; end_label, tmp132
	movq	%rax, %rsi	; tmp132,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp133, end_block_arg
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	-184(%rbp), %rax	; if_, tmp134
	movq	(%rax), %rax	; if__62(D)->condition, _5
	movq	-192(%rbp), %rdx	; status, tmp135
	movq	%rdx, %rsi	; tmp135,
	movq	%rax, %rdi	; _5,
	call	codegen_expression	;
	movq	%rax, -56(%rbp)	; tmp136, condition
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	; else_label, tmp137
	movq	%rax, %rsi	; tmp137,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _6
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	; then_label, tmp138
	movq	%rax, %rsi	; tmp138,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _7
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	; condition, tmp139
	movq	%rbx, %rcx	; _6,
	movq	%rax, %rsi	; tmp139,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp140, inst
; temp/codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp141
	movq	16(%rax), %rax	; status_56(D)->current_block, _8
; temp/codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _8->instructions, _9
	movq	-64(%rbp), %rdx	; inst, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _9,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:466:     Block* then_block = create_block(then_label);
	movq	-40(%rbp), %rax	; then_label, tmp143
	movq	%rax, %rdi	; tmp143,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp144, then_block
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	-192(%rbp), %rax	; status, tmp145
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _10
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	; _10->blocks, _11
	movq	-72(%rbp), %rdx	; then_block, tmp146
	movq	%rdx, %rsi	; tmp146,
	movq	%rax, %rdi	; _11,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:468:     status->current_block = then_block;
	movq	-192(%rbp), %rax	; status, tmp147
	movq	-72(%rbp), %rdx	; then_block, tmp148
	movq	%rdx, 16(%rax)	; tmp148, status_56(D)->current_block
; temp/codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	-184(%rbp), %rax	; if_, tmp149
	movq	8(%rax), %rax	; if__62(D)->body, _12
	movq	%rax, %rdi	; _12,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp150, then_statements
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L185	;
.L186:
; temp/codegen.c:473:         codegen_statement(statement, status);
	movq	-192(%rbp), %rdx	; status, tmp151
	movq	-88(%rbp), %rax	; statement, tmp152
	movq	%rdx, %rsi	; tmp151,
	movq	%rax, %rdi	; tmp152,
	call	codegen_statement	;
.L185:
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	-80(%rbp), %rax	; then_statements, tmp153
	movq	%rax, %rdi	; tmp153,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp154, statement
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L186	;,
; temp/codegen.c:475:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp155
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp155,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp156, jump_to_end
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp157
	movq	16(%rax), %rax	; status_56(D)->current_block, _13
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _13->instructions, _14
	movq	-96(%rbp), %rdx	; jump_to_end, tmp158
	movq	%rdx, %rsi	; tmp158,
	movq	%rax, %rdi	; _14,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	-184(%rbp), %rax	; if_, tmp159
	movq	16(%rax), %rax	; if__62(D)->else_if, _15
	movq	%rax, %rdi	; _15,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; _16
	jne	.L187	;,
; temp/codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	-184(%rbp), %rax	; if_, tmp160
	movq	16(%rax), %rax	; if__62(D)->else_if, _17
	movq	%rax, %rdi	; _17,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp161, elif_list
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L188	;
.L192:
; temp/codegen.c:484:             Block* else_if_block = create_block(else_label);
	movq	-24(%rbp), %rax	; else_label, tmp162
	movq	%rax, %rdi	; tmp162,
	call	create_block	;
	movq	%rax, -120(%rbp)	; tmp163, else_if_block
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	-192(%rbp), %rax	; status, tmp164
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _18
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	32(%rax), %rax	; _18->blocks, _19
	movq	-120(%rbp), %rdx	; else_if_block, tmp165
	movq	%rdx, %rsi	; tmp165,
	movq	%rax, %rdi	; _19,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:486:             status->current_block = else_if_block;
	movq	-192(%rbp), %rax	; status, tmp166
	movq	-120(%rbp), %rdx	; else_if_block, tmp167
	movq	%rdx, 16(%rax)	; tmp167, status_56(D)->current_block
; temp/codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp168
	movq	%rax, %rcx	; tmp168,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp169, then_label
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-192(%rbp), %rax	; status, tmp170
	movq	%rax, %rcx	; tmp170,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp171, else_label
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	-112(%rbp), %rax	; elif, tmp172
	movq	(%rax), %rax	; elif_92->condition, _20
	movq	-192(%rbp), %rdx	; status, tmp173
	movq	%rdx, %rsi	; tmp173,
	movq	%rax, %rdi	; _20,
	call	codegen_expression	;
	movq	%rax, -56(%rbp)	; tmp174, condition
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-104(%rbp), %rax	; elif_list, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; _21
	je	.L189	;,
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	-184(%rbp), %rax	; if_, tmp176
	movq	24(%rax), %rax	; if__62(D)->else_body, _22
	movq	%rax, %rdi	; _22,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; _23
	je	.L189	;,
; temp/codegen.c:493:                 else_label = end_label;
	movq	-32(%rbp), %rax	; end_label, tmp177
	movq	%rax, -24(%rbp)	; tmp177, else_label
.L189:
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-24(%rbp), %rax	; else_label, tmp178
	movq	%rax, %rsi	; tmp178,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _24
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-40(%rbp), %rax	; then_label, tmp179
	movq	%rax, %rsi	; tmp179,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _25
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	-56(%rbp), %rax	; condition, tmp180
	movq	%rbx, %rcx	; _24,
	movq	%rax, %rsi	; tmp180,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp181, inst
; temp/codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-192(%rbp), %rax	; status, tmp182
	movq	16(%rax), %rax	; status_56(D)->current_block, _26
; temp/codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _26->instructions, _27
	movq	-64(%rbp), %rdx	; inst, tmp183
	movq	%rdx, %rsi	; tmp183,
	movq	%rax, %rdi	; _27,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:497:             then_block = create_block(then_label);
	movq	-40(%rbp), %rax	; then_label, tmp184
	movq	%rax, %rdi	; tmp184,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp185, then_block
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	-192(%rbp), %rax	; status, tmp186
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _28
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	32(%rax), %rax	; _28->blocks, _29
	movq	-72(%rbp), %rdx	; then_block, tmp187
	movq	%rdx, %rsi	; tmp187,
	movq	%rax, %rdi	; _29,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:499:             status->current_block = then_block;
	movq	-192(%rbp), %rax	; status, tmp188
	movq	-72(%rbp), %rdx	; then_block, tmp189
	movq	%rdx, 16(%rax)	; tmp189, status_56(D)->current_block
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	-112(%rbp), %rax	; elif, tmp190
	movq	8(%rax), %rax	; elif_92->body, _30
	movq	%rax, %rdi	; _30,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -128(%rbp)	; tmp191, elif_statements
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L190	;
.L191:
; temp/codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	-192(%rbp), %rdx	; status, tmp192
	movq	-136(%rbp), %rax	; elif_statement, tmp193
	movq	%rdx, %rsi	; tmp192,
	movq	%rax, %rdi	; tmp193,
	call	codegen_statement	;
.L190:
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	-128(%rbp), %rax	; elif_statements, tmp194
	movq	%rax, %rdi	; tmp194,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -136(%rbp)	; tmp195, elif_statement
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	cmpq	$0, -136(%rbp)	;, elif_statement
	jne	.L191	;,
; temp/codegen.c:506:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp196
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp196,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp197, jump_to_end
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp198
	movq	16(%rax), %rax	; status_56(D)->current_block, _31
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _31->instructions, _32
	movq	-96(%rbp), %rdx	; jump_to_end, tmp199
	movq	%rdx, %rsi	; tmp199,
	movq	%rax, %rdi	; _32,
	call	*list_append@GOTPCREL(%rip)	;
.L188:
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	-104(%rbp), %rax	; elif_list, tmp200
	movq	%rax, %rdi	; tmp200,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp201, elif
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	cmpq	$0, -112(%rbp)	;, elif
	jne	.L192	;,
.L187:
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	-184(%rbp), %rax	; if_, tmp202
	movq	24(%rax), %rax	; if__62(D)->else_body, _33
	movq	%rax, %rdi	; _33,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; _34
	jne	.L193	;,
; temp/codegen.c:513:         Block* else_block = create_block(else_label);
	movq	-24(%rbp), %rax	; else_label, tmp203
	movq	%rax, %rdi	; tmp203,
	call	create_block	;
	movq	%rax, -144(%rbp)	; tmp204, else_block
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	-192(%rbp), %rax	; status, tmp205
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _35
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	32(%rax), %rax	; _35->blocks, _36
	movq	-144(%rbp), %rdx	; else_block, tmp206
	movq	%rdx, %rsi	; tmp206,
	movq	%rax, %rdi	; _36,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:515:         status->current_block = else_block;
	movq	-192(%rbp), %rax	; status, tmp207
	movq	-144(%rbp), %rdx	; else_block, tmp208
	movq	%rdx, 16(%rax)	; tmp208, status_56(D)->current_block
; temp/codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	-184(%rbp), %rax	; if_, tmp209
	movq	24(%rax), %rax	; if__62(D)->else_body, _37
	movq	%rax, %rdi	; _37,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -152(%rbp)	; tmp210, else_statements
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L194	;
.L195:
; temp/codegen.c:520:             codegen_statement(else_statement, status);
	movq	-192(%rbp), %rdx	; status, tmp211
	movq	-160(%rbp), %rax	; else_statement, tmp212
	movq	%rdx, %rsi	; tmp211,
	movq	%rax, %rdi	; tmp212,
	call	codegen_statement	;
.L194:
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	-152(%rbp), %rax	; else_statements, tmp213
	movq	%rax, %rdi	; tmp213,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -160(%rbp)	; tmp214, else_statement
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	cmpq	$0, -160(%rbp)	;, else_statement
	jne	.L195	;,
; temp/codegen.c:522:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	-48(%rbp), %rax	; end_block_arg, tmp215
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; tmp215,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -96(%rbp)	; tmp216, jump_to_end
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	-192(%rbp), %rax	; status, tmp217
	movq	16(%rax), %rax	; status_56(D)->current_block, _38
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rax	; _38->instructions, _39
	movq	-96(%rbp), %rdx	; jump_to_end, tmp218
	movq	%rdx, %rsi	; tmp218,
	movq	%rax, %rdi	; _39,
	call	*list_append@GOTPCREL(%rip)	;
.L193:
; temp/codegen.c:526:     Block* end_block = create_block(end_label);
	movq	-32(%rbp), %rax	; end_label, tmp219
	movq	%rax, %rdi	; tmp219,
	call	create_block	;
	movq	%rax, -168(%rbp)	; tmp220, end_block
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-192(%rbp), %rax	; status, tmp221
	movq	8(%rax), %rax	; status_56(D)->current_subroutine, _40
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _40->blocks, _41
	movq	-168(%rbp), %rdx	; end_block, tmp222
	movq	%rdx, %rsi	; tmp222,
	movq	%rax, %rdi	; _41,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:528:     status->current_block = end_block;
	movq	-192(%rbp), %rax	; status, tmp223
	movq	-168(%rbp), %rdx	; end_block, tmp224
	movq	%rdx, 16(%rax)	; tmp224, status_56(D)->current_block
; temp/codegen.c:529: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	codegen_if, .-codegen_if
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$152, %rsp	;,
	movq	%rdi, -152(%rbp)	; for_, for_
	movq	%rsi, -160(%rbp)	; status, status
; temp/codegen.c:532:     if (for_->initializer != NULL)
	movq	-152(%rbp), %rax	; for_, tmp127
	movq	(%rax), %rax	; for__54(D)->initializer, _1
; temp/codegen.c:532:     if (for_->initializer != NULL)
	testq	%rax, %rax	; _1
	je	.L197	;,
; temp/codegen.c:533:         codegen_variable(for_->initializer, status, VAR_VAR);
	movq	-152(%rbp), %rax	; for_, tmp128
	movq	(%rax), %rax	; for__54(D)->initializer, _2
	movq	-160(%rbp), %rcx	; status, tmp129
	movl	$118, %edx	;,
	movq	%rcx, %rsi	; tmp129,
	movq	%rax, %rdi	; _2,
	call	codegen_variable	;
.L197:
; temp/codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -32(%rbp)	; tmp131, condition_label
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp132
	movq	%rax, %rcx	; tmp132,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -40(%rbp)	; tmp133, body_label
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp134
	movq	%rax, %rcx	; tmp134,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -48(%rbp)	; tmp135, end_label
; temp/codegen.c:538:     if (for_->condition != NULL) {
	movq	-152(%rbp), %rax	; for_, tmp136
	movq	8(%rax), %rax	; for__54(D)->condition, _3
; temp/codegen.c:538:     if (for_->condition != NULL) {
	testq	%rax, %rax	; _3
	je	.L198	;,
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	; condition_label, tmp137
	movq	%rax, %rsi	; tmp137,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _4,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp138, inst
; temp/codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp139
	movq	16(%rax), %rax	; status_55(D)->current_block, _5
; temp/codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _5->instructions, _6
	movq	-64(%rbp), %rdx	; inst, tmp140
	movq	%rdx, %rsi	; tmp140,
	movq	%rax, %rdi	; _6,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:542:         Block* condition_block = create_block(condition_label);
	movq	-32(%rbp), %rax	; condition_label, tmp141
	movq	%rax, %rdi	; tmp141,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp142, condition_block
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	-160(%rbp), %rax	; status, tmp143
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _7
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	; _7->blocks, _8
	movq	-72(%rbp), %rdx	; condition_block, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _8,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:544:         status->current_block = condition_block;
	movq	-160(%rbp), %rax	; status, tmp145
	movq	-72(%rbp), %rdx	; condition_block, tmp146
	movq	%rdx, 16(%rax)	; tmp146, status_55(D)->current_block
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	-152(%rbp), %rax	; for_, tmp147
	movq	8(%rax), %rax	; for__54(D)->condition, _9
	movq	-160(%rbp), %rdx	; status, tmp148
	movq	%rdx, %rsi	; tmp148,
	movq	%rax, %rdi	; _9,
	call	codegen_expression	;
	movq	%rax, -80(%rbp)	; tmp149, condition
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; end_label, tmp150
	movq	%rax, %rsi	; tmp150,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _10
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-40(%rbp), %rax	; body_label, tmp151
	movq	%rax, %rsi	; tmp151,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _11
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-80(%rbp), %rax	; condition, tmp152
	movq	%rbx, %rcx	; _10,
	movq	%rax, %rsi	; tmp152,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -64(%rbp)	; tmp153, inst
; temp/codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp154
	movq	16(%rax), %rax	; status_55(D)->current_block, _12
; temp/codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-64(%rbp), %rdx	; inst, tmp155
	movq	%rdx, %rsi	; tmp155,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L199	;
.L198:
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	; body_label, tmp156
	movq	%rax, %rsi	; tmp156,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _14,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -56(%rbp)	; tmp157, inst
; temp/codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp158
	movq	16(%rax), %rax	; status_55(D)->current_block, _15
; temp/codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _15->instructions, _16
	movq	-56(%rbp), %rdx	; inst, tmp159
	movq	%rdx, %rsi	; tmp159,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
.L199:
; temp/codegen.c:555:     Block* body_block = create_block(body_label);
	movq	-40(%rbp), %rax	; body_label, tmp160
	movq	%rax, %rdi	; tmp160,
	call	create_block	;
	movq	%rax, -88(%rbp)	; tmp161, body_block
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	-160(%rbp), %rax	; status, tmp162
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _17
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	; _17->blocks, _18
	movq	-88(%rbp), %rdx	; body_block, tmp163
	movq	%rdx, %rsi	; tmp163,
	movq	%rax, %rdi	; _18,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:557:     status->current_block = body_block;
	movq	-160(%rbp), %rax	; status, tmp164
	movq	-88(%rbp), %rdx	; body_block, tmp165
	movq	%rdx, 16(%rax)	; tmp165, status_55(D)->current_block
; temp/codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-160(%rbp), %rax	; status, tmp166
	movq	%rax, %rcx	; tmp166,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -96(%rbp)	; tmp167, increment_label
; temp/codegen.c:560:     if (for_->increment != NULL)
	movq	-152(%rbp), %rax	; for_, tmp168
	movq	16(%rax), %rax	; for__54(D)->increment, _19
; temp/codegen.c:560:     if (for_->increment != NULL)
	testq	%rax, %rax	; _19
	je	.L200	;,
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-96(%rbp), %rax	; increment_label, tmp169
	movq	%rax, %rsi	; tmp169,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _20
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	-160(%rbp), %rax	; status, tmp170
	movq	32(%rax), %rax	; status_55(D)->start_labels, _21
	movq	%rdx, %rsi	; _20,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L201	;
.L200:
; temp/codegen.c:562:     else if (for_->condition != NULL)
	movq	-152(%rbp), %rax	; for_, tmp171
	movq	8(%rax), %rax	; for__54(D)->condition, _22
; temp/codegen.c:562:     else if (for_->condition != NULL)
	testq	%rax, %rax	; _22
	je	.L202	;,
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-32(%rbp), %rax	; condition_label, tmp172
	movq	%rax, %rsi	; tmp172,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _23
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-160(%rbp), %rax	; status, tmp173
	movq	32(%rax), %rax	; status_55(D)->start_labels, _24
	movq	%rdx, %rsi	; _23,
	movq	%rax, %rdi	; _24,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L201	;
.L202:
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-40(%rbp), %rax	; body_label, tmp174
	movq	%rax, %rsi	; tmp174,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _25
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	-160(%rbp), %rax	; status, tmp175
	movq	32(%rax), %rax	; status_55(D)->start_labels, _26
	movq	%rdx, %rsi	; _25,
	movq	%rax, %rdi	; _26,
	call	*list_append@GOTPCREL(%rip)	;
.L201:
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; end_label, tmp176
	movq	%rax, %rsi	; tmp176,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _27
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-160(%rbp), %rax	; status, tmp177
	movq	24(%rax), %rax	; status_55(D)->end_labels, _28
	movq	%rdx, %rsi	; _27,
	movq	%rax, %rdi	; _28,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	-152(%rbp), %rax	; for_, tmp178
	movq	24(%rax), %rax	; for__54(D)->body, _29
	movq	%rax, %rdi	; _29,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -104(%rbp)	; tmp179, body_statements
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L203	;
.L204:
; temp/codegen.c:570:         codegen_statement(statement, status);
	movq	-160(%rbp), %rdx	; status, tmp180
	movq	-112(%rbp), %rax	; statement, tmp181
	movq	%rdx, %rsi	; tmp180,
	movq	%rax, %rdi	; tmp181,
	call	codegen_statement	;
.L203:
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-104(%rbp), %rax	; body_statements, tmp182
	movq	%rax, %rdi	; tmp182,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -112(%rbp)	; tmp183, statement
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -112(%rbp)	;, statement
	jne	.L204	;,
; temp/codegen.c:571:     list_pop_back(status->start_labels);
	movq	-160(%rbp), %rax	; status, tmp184
	movq	32(%rax), %rax	; status_55(D)->start_labels, _30
	movq	%rax, %rdi	; _30,
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:572:     list_pop_back(status->end_labels);
	movq	-160(%rbp), %rax	; status, tmp185
	movq	24(%rax), %rax	; status_55(D)->end_labels, _31
	movq	%rax, %rdi	; _31,
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:573:     if (for_->increment != NULL) {
	movq	-152(%rbp), %rax	; for_, tmp186
	movq	16(%rax), %rax	; for__54(D)->increment, _32
; temp/codegen.c:573:     if (for_->increment != NULL) {
	testq	%rax, %rax	; _32
	je	.L205	;,
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	-96(%rbp), %rax	; increment_label, tmp187
	movq	%rax, %rsi	; tmp187,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _33,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -120(%rbp)	; tmp188, inst
; temp/codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp189
	movq	16(%rax), %rax	; status_55(D)->current_block, _34
; temp/codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _34->instructions, _35
	movq	-120(%rbp), %rdx	; inst, tmp190
	movq	%rdx, %rsi	; tmp190,
	movq	%rax, %rdi	; _35,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:577:         Block* increment_block = create_block(increment_label);
	movq	-96(%rbp), %rax	; increment_label, tmp191
	movq	%rax, %rdi	; tmp191,
	call	create_block	;
	movq	%rax, -128(%rbp)	; tmp192, increment_block
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	-160(%rbp), %rax	; status, tmp193
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _36
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	32(%rax), %rax	; _36->blocks, _37
	movq	-128(%rbp), %rdx	; increment_block, tmp194
	movq	%rdx, %rsi	; tmp194,
	movq	%rax, %rdi	; _37,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:579:         status->current_block = increment_block;
	movq	-160(%rbp), %rax	; status, tmp195
	movq	-128(%rbp), %rdx	; increment_block, tmp196
	movq	%rdx, 16(%rax)	; tmp196, status_55(D)->current_block
; temp/codegen.c:580:         codegen_expression(for_->increment, status);
	movq	-152(%rbp), %rax	; for_, tmp197
	movq	16(%rax), %rax	; for__54(D)->increment, _38
	movq	-160(%rbp), %rdx	; status, tmp198
	movq	%rdx, %rsi	; tmp198,
	movq	%rax, %rdi	; _38,
	call	codegen_expression	;
.L205:
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-32(%rbp), %rax	; condition_label, tmp199
	movq	%rax, %rsi	; tmp199,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _39,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp200, inst
; temp/codegen.c:584:     if (for_->condition == NULL)
	movq	-152(%rbp), %rax	; for_, tmp201
	movq	8(%rax), %rax	; for__54(D)->condition, _40
; temp/codegen.c:584:     if (for_->condition == NULL)
	testq	%rax, %rax	; _40
	jne	.L206	;,
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	-40(%rbp), %rax	; body_label, tmp202
	movq	%rax, %rsi	; tmp202,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _41,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -24(%rbp)	; tmp203, inst
.L206:
; temp/codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-160(%rbp), %rax	; status, tmp204
	movq	16(%rax), %rax	; status_55(D)->current_block, _42
; temp/codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _42->instructions, _43
	movq	-24(%rbp), %rdx	; inst, tmp205
	movq	%rdx, %rsi	; tmp205,
	movq	%rax, %rdi	; _43,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:588:     Block* end_block = create_block(end_label);
	movq	-48(%rbp), %rax	; end_label, tmp206
	movq	%rax, %rdi	; tmp206,
	call	create_block	;
	movq	%rax, -136(%rbp)	; tmp207, end_block
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-160(%rbp), %rax	; status, tmp208
	movq	8(%rax), %rax	; status_55(D)->current_subroutine, _44
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _44->blocks, _45
	movq	-136(%rbp), %rdx	; end_block, tmp209
	movq	%rdx, %rsi	; tmp209,
	movq	%rax, %rdi	; _45,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:590:     status->current_block = end_block;
	movq	-160(%rbp), %rax	; status, tmp210
	movq	-136(%rbp), %rdx	; end_block, tmp211
	movq	%rdx, 16(%rax)	; tmp211, status_55(D)->current_block
; temp/codegen.c:591: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	codegen_for, .-codegen_for
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	pushq	%rbx	;
	subq	$104, %rsp	;,
	movq	%rdi, -104(%rbp)	; while_, while_
	movq	%rsi, -112(%rbp)	; status, status
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp106
	movq	%rax, %rcx	; tmp106,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -24(%rbp)	; tmp107, condition_label
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	; condition_label, tmp108
	movq	%rax, %rsi	; tmp108,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _1,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp109, inst
; temp/codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp110
	movq	16(%rax), %rax	; status_27(D)->current_block, _2
; temp/codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _2->instructions, _3
	movq	-32(%rbp), %rdx	; inst, tmp111
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; _3,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:597:     Block* condition_block = create_block(condition_label);
	movq	-24(%rbp), %rax	; condition_label, tmp112
	movq	%rax, %rdi	; tmp112,
	call	create_block	;
	movq	%rax, -40(%rbp)	; tmp113, condition_block
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	-112(%rbp), %rax	; status, tmp114
	movq	8(%rax), %rax	; status_27(D)->current_subroutine, _4
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	32(%rax), %rax	; _4->blocks, _5
	movq	-40(%rbp), %rdx	; condition_block, tmp115
	movq	%rdx, %rsi	; tmp115,
	movq	%rax, %rdi	; _5,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:599:     status->current_block = condition_block;
	movq	-112(%rbp), %rax	; status, tmp116
	movq	-40(%rbp), %rdx	; condition_block, tmp117
	movq	%rdx, 16(%rax)	; tmp117, status_27(D)->current_block
; temp/codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp118
	movq	%rax, %rcx	; tmp118,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -48(%rbp)	; tmp119, body_label
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	-112(%rbp), %rax	; status, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, -56(%rbp)	; tmp121, end_label
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	-104(%rbp), %rax	; while_, tmp122
	movq	(%rax), %rax	; while__42(D)->condition, _6
	movq	-112(%rbp), %rdx	; status, tmp123
	movq	%rdx, %rsi	; tmp123,
	movq	%rax, %rdi	; _6,
	call	codegen_expression	;
	movq	%rax, -64(%rbp)	; tmp124, condition
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	; end_label, tmp125
	movq	%rax, %rsi	; tmp125,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	;, _7
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-48(%rbp), %rax	; body_label, tmp126
	movq	%rax, %rsi	; tmp126,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _8
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	-64(%rbp), %rax	; condition, tmp127
	movq	%rbx, %rcx	; _7,
	movq	%rax, %rsi	; tmp127,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp128, inst
; temp/codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp129
	movq	16(%rax), %rax	; status_27(D)->current_block, _9
; temp/codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _9->instructions, _10
	movq	-32(%rbp), %rdx	; inst, tmp130
	movq	%rdx, %rsi	; tmp130,
	movq	%rax, %rdi	; _10,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:607:     Block* body_block = create_block(body_label);
	movq	-48(%rbp), %rax	; body_label, tmp131
	movq	%rax, %rdi	; tmp131,
	call	create_block	;
	movq	%rax, -72(%rbp)	; tmp132, body_block
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	-112(%rbp), %rax	; status, tmp133
	movq	8(%rax), %rax	; status_27(D)->current_subroutine, _11
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	32(%rax), %rax	; _11->blocks, _12
	movq	-72(%rbp), %rdx	; body_block, tmp134
	movq	%rdx, %rsi	; tmp134,
	movq	%rax, %rdi	; _12,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:609:     status->current_block = body_block;
	movq	-112(%rbp), %rax	; status, tmp135
	movq	-72(%rbp), %rdx	; body_block, tmp136
	movq	%rdx, 16(%rax)	; tmp136, status_27(D)->current_block
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-24(%rbp), %rax	; condition_label, tmp137
	movq	%rax, %rsi	; tmp137,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _13
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	-112(%rbp), %rax	; status, tmp138
	movq	32(%rax), %rax	; status_27(D)->start_labels, _14
	movq	%rdx, %rsi	; _13,
	movq	%rax, %rdi	; _14,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-56(%rbp), %rax	; end_label, tmp139
	movq	%rax, %rsi	; tmp139,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	;, _15
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	-112(%rbp), %rax	; status, tmp140
	movq	24(%rax), %rax	; status_27(D)->end_labels, _16
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; _16,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	-104(%rbp), %rax	; while_, tmp141
	movq	8(%rax), %rax	; while__42(D)->body, _17
	movq	%rax, %rdi	; _17,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp142, body_statements
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L208	;
.L209:
; temp/codegen.c:616:         codegen_statement(statement, status);
	movq	-112(%rbp), %rdx	; status, tmp143
	movq	-88(%rbp), %rax	; statement, tmp144
	movq	%rdx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp144,
	call	codegen_statement	;
.L208:
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	-80(%rbp), %rax	; body_statements, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp146, statement
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	cmpq	$0, -88(%rbp)	;, statement
	jne	.L209	;,
; temp/codegen.c:617:     list_pop_back(status->start_labels);
	movq	-112(%rbp), %rax	; status, tmp147
	movq	32(%rax), %rax	; status_27(D)->start_labels, _18
	movq	%rax, %rdi	; _18,
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:618:     list_pop_back(status->end_labels);
	movq	-112(%rbp), %rax	; status, tmp148
	movq	24(%rax), %rax	; status_27(D)->end_labels, _19
	movq	%rax, %rdi	; _19,
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	-24(%rbp), %rax	; condition_label, tmp149
	movq	%rax, %rsi	; tmp149,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; _20,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, -32(%rbp)	; tmp150, inst
; temp/codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp151
	movq	16(%rax), %rax	; status_27(D)->current_block, _21
; temp/codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _21->instructions, _22
	movq	-32(%rbp), %rdx	; inst, tmp152
	movq	%rdx, %rsi	; tmp152,
	movq	%rax, %rdi	; _22,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:623:     Block* end_block = create_block(end_label);
	movq	-56(%rbp), %rax	; end_label, tmp153
	movq	%rax, %rdi	; tmp153,
	call	create_block	;
	movq	%rax, -96(%rbp)	; tmp154, end_block
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	-112(%rbp), %rax	; status, tmp155
	movq	8(%rax), %rax	; status_27(D)->current_subroutine, _23
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	32(%rax), %rax	; _23->blocks, _24
	movq	-96(%rbp), %rdx	; end_block, tmp156
	movq	%rdx, %rsi	; tmp156,
	movq	%rax, %rdi	; _24,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:625:     status->current_block = end_block;
	movq	-112(%rbp), %rax	; status, tmp157
	movq	-96(%rbp), %rdx	; end_block, tmp158
	movq	%rdx, 16(%rax)	; tmp158, status_27(D)->current_block
; temp/codegen.c:626: }
	nop	
	movq	-8(%rbp), %rbx	;,
	leave	
	ret	
	.size	codegen_while, .-codegen_while
	.section	.rodata
	.align 8
.LC17:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -56(%rbp)	; expression, expression
	movq	%rsi, -64(%rbp)	; status, status
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	movq	-56(%rbp), %rax	; expression, tmp105
	movl	24(%rax), %eax	; expression_31(D)->operator, _1
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, %eax	;, _1
	jne	.L211	;,
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	-56(%rbp), %rax	; expression, tmp106
	movq	8(%rax), %rax	; expression_31(D)->prim_left, _2
	movq	-64(%rbp), %rdx	; status, tmp107
	movq	%rdx, %rsi	; tmp107,
	movq	%rax, %rdi	; _2,
	call	codegen_primary	;
	jmp	.L212	;
.L211:
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	-56(%rbp), %rax	; expression, tmp108
	movq	16(%rax), %rax	; expression_31(D)->right, _3
	movq	-64(%rbp), %rdx	; status, tmp109
	movq	%rdx, %rsi	; tmp109,
	movq	%rax, %rdi	; _3,
	call	codegen_expression	;
	movq	%rax, %rdx	;, _4
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	-64(%rbp), %rax	; status, tmp110
	movq	%rax, %rsi	; tmp110,
	movq	%rdx, %rdi	; _4,
	call	load_rvalue	;
	movq	%rax, -8(%rbp)	; tmp111, right
; temp/codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movq	-56(%rbp), %rax	; expression, tmp112
	movl	24(%rax), %eax	; expression_31(D)->operator, _5
	movl	%eax, %edi	; _5,
	call	get_instruction_type	;
	movl	%eax, -20(%rbp)	; tmp113, op
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	-56(%rbp), %rax	; expression, tmp114
	movq	(%rax), %rax	; expression_31(D)->expr_left, _6
	movq	-64(%rbp), %rdx	; status, tmp115
	movq	%rdx, %rsi	; tmp115,
	movq	%rax, %rdi	; _6,
	call	codegen_expression	;
	movq	%rax, -32(%rbp)	; tmp116, left
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	movq	-56(%rbp), %rax	; expression, tmp117
	movl	24(%rax), %eax	; expression_31(D)->operator, _7
	movl	%eax, %edi	; _7,
	call	is_assignment_operator	;
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	testb	%al, %al	; _8
	je	.L213	;,
; temp/codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, -20(%rbp)	;, op
	je	.L214	;,
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	; left, tmp118
	movq	8(%rax), %rax	; left_39->type, _9
	movq	-64(%rbp), %rdx	; status, tmp119
	movq	%rdx, %rcx	; tmp119,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _9,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _10,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp120, temp
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-64(%rbp), %rdx	; status, tmp121
	movq	-32(%rbp), %rax	; left, tmp122
	movq	%rdx, %rsi	; tmp121,
	movq	%rax, %rdi	; tmp122,
	call	load_rvalue	;
	movq	%rax, %rdi	;, _11
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %rdx	; right, tmp123
	movq	-48(%rbp), %rsi	; temp, tmp124
	movl	-20(%rbp), %eax	; op, tmp125
	movq	%rdx, %rcx	; tmp123,
	movq	%rdi, %rdx	; _11,
	movl	%eax, %edi	; tmp125,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp126, inst
; temp/codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp127
	movq	16(%rax), %rax	; status_32(D)->current_block, _12
; temp/codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-16(%rbp), %rdx	; inst, tmp128
	movq	%rdx, %rsi	; tmp128,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:639:             right = temp;
	movq	-48(%rbp), %rax	; temp, tmp129
	movq	%rax, -8(%rbp)	; tmp129, right
.L214:
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movq	-32(%rbp), %rax	; left, tmp130
	movl	16(%rax), %eax	; left_39->kind, _14
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	testl	%eax, %eax	; _14
	je	.L215	;,
; temp/codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	stderr(%rip), %rax	; stderr, stderr.24_15
	movq	%rax, %rcx	; stderr.24_15,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp131
	movq	%rax, %rdi	; tmp131,
	call	*fwrite@GOTPCREL(%rip)	;
.L215:
; temp/codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	-8(%rbp), %rdx	; right, tmp132
	movq	-32(%rbp), %rax	; left, tmp133
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp133,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp134, inst
; temp/codegen.c:644:         if (left->is_get)
	movq	-32(%rbp), %rax	; left, tmp135
	movzbl	20(%rax), %eax	; left_39->is_get, _16
; temp/codegen.c:644:         if (left->is_get)
	testb	%al, %al	; _16
	je	.L216	;,
; temp/codegen.c:645:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	-8(%rbp), %rdx	; right, tmp136
	movq	-32(%rbp), %rax	; left, tmp137
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp137,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp138, inst
	jmp	.L216	;
.L213:
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	-32(%rbp), %rax	; left, tmp139
	movq	8(%rax), %rax	; left_39->type, _17
	movq	-64(%rbp), %rdx	; status, tmp140
	movq	%rdx, %rcx	; tmp140,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _17,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _18,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp141, temp
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-64(%rbp), %rdx	; status, tmp142
	movq	-32(%rbp), %rax	; left, tmp143
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; tmp143,
	call	load_rvalue	;
	movq	%rax, %rdi	;, _19
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	-8(%rbp), %rdx	; right, tmp144
	movq	-40(%rbp), %rsi	; temp, tmp145
	movl	-20(%rbp), %eax	; op, tmp146
	movq	%rdx, %rcx	; tmp144,
	movq	%rdi, %rdx	; _19,
	movl	%eax, %edi	; tmp146,
	call	create_instruction	;
	movq	%rax, -16(%rbp)	; tmp147, inst
; temp/codegen.c:649:         right = temp;
	movq	-40(%rbp), %rax	; temp, tmp148
	movq	%rax, -8(%rbp)	; tmp148, right
.L216:
; temp/codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	-64(%rbp), %rax	; status, tmp149
	movq	16(%rax), %rax	; status_32(D)->current_block, _20
; temp/codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _20->instructions, _21
	movq	-16(%rbp), %rdx	; inst, tmp150
	movq	%rdx, %rsi	; tmp150,
	movq	%rax, %rdi	; _21,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:652:     return right;
	movq	-8(%rbp), %rax	; right, _25
.L212:
; temp/codegen.c:653: }
	leave	
	ret	
	.size	codegen_expression, .-codegen_expression
	.section	.rodata
	.align 8
.LC19:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC20:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.text
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$112, %rsp	;,
	movq	%rdi, -104(%rbp)	; primary, primary
	movq	%rsi, -112(%rbp)	; status, status
; temp/codegen.c:655:     switch (primary->type) {
	movq	-104(%rbp), %rax	; primary, tmp115
	movl	8(%rax), %eax	; primary_39(D)->type, _1
; temp/codegen.c:655:     switch (primary->type) {
	cmpl	$8, %eax	;, _1
	ja	.L218	;,
	movl	%eax, %eax	; _1, tmp116
	leaq	0(,%rax,4), %rdx	;, tmp117
	leaq	.L220(%rip), %rax	;, tmp118
	movl	(%rdx,%rax), %eax	;, tmp119
	cltq
	leaq	.L220(%rip), %rdx	;, tmp122
	addq	%rdx, %rax	; tmp122, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
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
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	-104(%rbp), %rax	; primary, tmp123
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _2
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movl	$10, %edx	;,
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _2,
	call	*strtoll@GOTPCREL(%rip)	;
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, -56(%rbp)	; _3, t
; temp/codegen.c:658:             return create_arg(ARG_INT, &t);
	leaq	-56(%rbp), %rax	;, tmp124
	movq	%rax, %rsi	; tmp124,
	movl	$1, %edi	;,
	call	create_arg	;
	jmp	.L229	;
.L227:
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	-104(%rbp), %rax	; primary, tmp125
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _4
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movl	$0, %esi	;,
	movq	%rax, %rdi	; _4,
	call	*strtod@GOTPCREL(%rip)	;
	movq	%xmm0, %rax	;, _5
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	%rax, -64(%rbp)	; _5, t
; temp/codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	leaq	-64(%rbp), %rax	;, tmp126
	movq	%rax, %rsi	; tmp126,
	movl	$2, %edi	;,
	call	create_arg	;
	jmp	.L229	;
.L226:
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	-104(%rbp), %rax	; primary, tmp127
	movq	(%rax), %rax	; primary_39(D)->value.literal_value, _6
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%rax, %rsi	; _6,
	movl	$3, %edi	;,
	call	create_arg	;
	jmp	.L229	;
.L225:
; temp/codegen.c:666:             bool t = true;
	movb	$1, -65(%rbp)	;, t
; temp/codegen.c:667:             return create_arg(ARG_BOOL, &t);
	leaq	-65(%rbp), %rax	;, tmp128
	movq	%rax, %rsi	; tmp128,
	movl	$4, %edi	;,
	call	create_arg	;
	jmp	.L229	;
.L224:
; temp/codegen.c:670:             bool t = false;
	movb	$0, -66(%rbp)	;, t
; temp/codegen.c:671:             return create_arg(ARG_BOOL, &t);
	leaq	-66(%rbp), %rax	;, tmp129
	movq	%rax, %rsi	; tmp129,
	movl	$4, %edi	;,
	call	create_arg	;
	jmp	.L229	;
.L223:
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	-104(%rbp), %rax	; primary, tmp130
	movq	(%rax), %rax	; primary_39(D)->value.expr, _7
	movq	-112(%rbp), %rdx	; status, tmp131
	movq	%rdx, %rsi	; tmp131,
	movq	%rax, %rdi	; _7,
	call	codegen_expression	;
	jmp	.L229	;
.L222:
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	-104(%rbp), %rax	; primary, tmp132
	movq	(%rax), %rax	; primary_39(D)->value.operand, _8
	movq	-112(%rbp), %rdx	; status, tmp133
	movq	%rdx, %rsi	; tmp133,
	movq	%rax, %rdi	; _8,
	call	codegen_primary	;
	movq	%rax, %rdx	;, _9
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	-112(%rbp), %rax	; status, tmp134
	movq	%rax, %rsi	; tmp134,
	movq	%rdx, %rdi	; _9,
	call	load_rvalue	;
	movq	%rax, -32(%rbp)	; tmp135, operand
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	name_bool(%rip), %rax	; name_bool, name_bool.25_10
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	-112(%rbp), %rdx	; status, tmp136
	movq	%rdx, %rcx	; tmp136,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; name_bool.25_10,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rsi	; _11,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -40(%rbp)	; tmp137, temp
; temp/codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	-32(%rbp), %rdx	; operand, tmp138
	movq	-40(%rbp), %rax	; temp, tmp139
	movl	$0, %ecx	;,
	movq	%rax, %rsi	; tmp139,
	movl	$13, %edi	;,
	call	create_instruction	;
	movq	%rax, -48(%rbp)	; tmp140, inst
; temp/codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp141
	movq	16(%rax), %rax	; status_40(D)->current_block, _12
; temp/codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _12->instructions, _13
	movq	-48(%rbp), %rdx	; inst, tmp142
	movq	%rdx, %rsi	; tmp142,
	movq	%rax, %rdi	; _13,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:679:             return temp;
	movq	-40(%rbp), %rax	; temp, _34
	jmp	.L229	;
.L221:
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	-104(%rbp), %rax	; primary, tmp143
	movq	(%rax), %rax	; primary_39(D)->value.operand, _14
	movq	-112(%rbp), %rdx	; status, tmp144
	movq	%rdx, %rsi	; tmp144,
	movq	%rax, %rdi	; _14,
	call	codegen_primary	;
	movq	%rax, %rdx	;, _15
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	-112(%rbp), %rax	; status, tmp145
	movq	%rax, %rsi	; tmp145,
	movq	%rdx, %rdi	; _15,
	call	load_rvalue	;
	movq	%rax, -16(%rbp)	; tmp146, operand
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	-16(%rbp), %rax	; operand, tmp147
	movq	8(%rax), %rax	; operand_45->type, _16
	movq	-112(%rbp), %rdx	; status, tmp148
	movq	%rdx, %rcx	; tmp148,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _16,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _17,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -24(%rbp)	; tmp149, temp
; temp/codegen.c:684:             Instruction* inst = NULL;
	movq	$0, -8(%rbp)	;, inst
; temp/codegen.c:685:             long long zero_int = 0;
	movq	$0, -80(%rbp)	;, zero_int
; temp/codegen.c:686:             double neg_one_float = -1.0;
	movsd	.LC18(%rip), %xmm0	;, tmp150
	movsd	%xmm0, -88(%rbp)	; tmp150, neg_one_float
; temp/codegen.c:687:             if (operand->type == name_int)
	movq	-16(%rbp), %rax	; operand, tmp151
	movq	8(%rax), %rdx	; operand_45->type, _18
; temp/codegen.c:687:             if (operand->type == name_int)
	movq	name_int(%rip), %rax	; name_int, name_int.26_19
; temp/codegen.c:687:             if (operand->type == name_int)
	cmpq	%rax, %rdx	; name_int.26_19, _18
	jne	.L230	;,
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	-80(%rbp), %rax	;, tmp152
	movq	%rax, %rsi	; tmp152,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _20
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	-16(%rbp), %rdx	; operand, tmp153
	movq	-24(%rbp), %rax	; temp, tmp154
	movq	%rdx, %rcx	; tmp153,
	movq	%rsi, %rdx	; _20,
	movq	%rax, %rsi	; tmp154,
	movl	$1, %edi	;,
	call	create_instruction	;
	movq	%rax, -8(%rbp)	; tmp155, inst
	jmp	.L231	;
.L230:
; temp/codegen.c:689:             else if (operand->type == name_float)
	movq	-16(%rbp), %rax	; operand, tmp156
	movq	8(%rax), %rdx	; operand_45->type, _21
; temp/codegen.c:689:             else if (operand->type == name_float)
	movq	name_float(%rip), %rax	; name_float, name_float.27_22
; temp/codegen.c:689:             else if (operand->type == name_float)
	cmpq	%rax, %rdx	; name_float.27_22, _21
	jne	.L232	;,
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	-88(%rbp), %rax	;, tmp157
	movq	%rax, %rsi	; tmp157,
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	;, _23
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	-16(%rbp), %rdx	; operand, tmp158
	movq	-24(%rbp), %rax	; temp, tmp159
	movq	%rdx, %rcx	; tmp158,
	movq	%rsi, %rdx	; _23,
	movq	%rax, %rsi	; tmp159,
	movl	$2, %edi	;,
	call	create_instruction	;
	movq	%rax, -8(%rbp)	; tmp160, inst
	jmp	.L231	;
.L232:
; temp/codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	-16(%rbp), %rax	; operand, tmp161
	movq	8(%rax), %rax	; operand_45->type, _24
; temp/codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rdx	; _24->name, _25
	movq	stderr(%rip), %rax	; stderr, stderr.28_26
	leaq	.LC19(%rip), %rcx	;, tmp162
	movq	%rcx, %rsi	; tmp162,
	movq	%rax, %rdi	; stderr.28_26,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:693:                 return NULL;
	movl	$0, %eax	;, _34
	jmp	.L229	;
.L231:
; temp/codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	-112(%rbp), %rax	; status, tmp163
	movq	16(%rax), %rax	; status_40(D)->current_block, _27
; temp/codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _27->instructions, _28
	movq	-8(%rbp), %rdx	; inst, tmp164
	movq	%rdx, %rsi	; tmp164,
	movq	%rax, %rdi	; _28,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:696:             return temp;
	movq	-24(%rbp), %rax	; temp, _34
	jmp	.L229	;
.L219:
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	-104(%rbp), %rax	; primary, tmp165
	movq	(%rax), %rax	; primary_39(D)->value.var, _29
	movq	-112(%rbp), %rdx	; status, tmp166
	movq	%rdx, %rsi	; tmp166,
	movq	%rax, %rdi	; _29,
	call	codegen_variable_access	;
	jmp	.L229	;
.L218:
; temp/codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	-104(%rbp), %rax	; primary, tmp167
	movl	8(%rax), %edx	; primary_39(D)->type, _30
; temp/codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	stderr(%rip), %rax	; stderr, stderr.29_31
	leaq	.LC20(%rip), %rcx	;, tmp168
	movq	%rcx, %rsi	; tmp168,
	movq	%rax, %rdi	; stderr.29_31,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:701:             return NULL;
	movl	$0, %eax	;, _34
.L229:
; temp/codegen.c:703: }
	leave	
	ret	
	.size	codegen_primary, .-codegen_primary
	.section	.rodata
	.align 8
.LC21:
	.string	"[warning] Invalid variable access input\n"
	.align 8
.LC22:
	.string	"[warning] Variable access name is NULL\n"
	.align 8
.LC23:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
	.align 8
.LC24:
	.string	"[warning] Invalid get-attribute access\n"
	.align 8
.LC25:
	.string	"[warning] Failed to generate object for get-attribute access\n"
	.align 8
.LC26:
	.string	"[warning] Invalid get-sequence access\n"
	.align 8
.LC27:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
	.align 8
.LC28:
	.string	"[warning] Invalid function call without callee\n"
	.align 8
.LC29:
	.string	"[warning] Failed to generate callee for function call\n"
	.align 8
.LC30:
	.string	"[warning] Unsupported callee in function call\n"
	.align 8
.LC31:
	.string	"[warning] Failed to generate function call argument\n"
	.align 8
.LC32:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$208, %rsp	;,
	movq	%rdi, -200(%rbp)	; variable_access, variable_access
	movq	%rsi, -208(%rbp)	; status, status
; temp/codegen.c:706:     if (variable_access == NULL || status == NULL) {
	cmpq	$0, -200(%rbp)	;, variable_access
	je	.L235	;,
; temp/codegen.c:706:     if (variable_access == NULL || status == NULL) {
	cmpq	$0, -208(%rbp)	;, status
	jne	.L236	;,
.L235:
; temp/codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	movq	stderr(%rip), %rax	; stderr, stderr.30_1
	movq	%rax, %rcx	; stderr.30_1,
	movl	$40, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:708:         return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L236:
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movq	-200(%rbp), %rax	; variable_access, tmp180
	movl	16(%rax), %eax	; variable_access_113(D)->type, _2
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%eax, %eax	; _2
	jne	.L238	;,
; temp/codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	-200(%rbp), %rax	; variable_access, tmp181
	movq	8(%rax), %rax	; variable_access_113(D)->content.name, tmp182
	movq	%rax, -168(%rbp)	; tmp182, name
; temp/codegen.c:712:         if (name == NULL) {
	cmpq	$0, -168(%rbp)	;, name
	jne	.L239	;,
; temp/codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.31_3
	movq	%rax, %rcx	; stderr.31_3,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rax	;, tmp183
	movq	%rax, %rdi	; tmp183,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:714:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L239:
; temp/codegen.c:716:         Var* existing = resolve_named_var(name, status);
	movq	-208(%rbp), %rdx	; status, tmp184
	movq	-168(%rbp), %rax	; name, tmp185
	movq	%rdx, %rsi	; tmp184,
	movq	%rax, %rdi	; tmp185,
	call	resolve_named_var	;
	movq	%rax, -176(%rbp)	; tmp186, existing
; temp/codegen.c:717:         if (existing != NULL)
	cmpq	$0, -176(%rbp)	;, existing
	je	.L240	;,
; temp/codegen.c:718:             return create_arg(ARG_VARIABLE, existing);
	movq	-176(%rbp), %rax	; existing, tmp187
	movq	%rax, %rsi	; tmp187,
	movl	$0, %edi	;,
	call	create_arg	;
	jmp	.L237	;
.L240:
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	movq	-168(%rbp), %rax	; name, tmp188
	movl	32(%rax), %eax	; name_199->kind, _4
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$1, %eax	;, _4
	je	.L241	;,
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	movq	-168(%rbp), %rax	; name, tmp189
	movl	32(%rax), %eax	; name_199->kind, _5
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, %eax	;, _5
	je	.L241	;,
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	movq	-168(%rbp), %rax	; name, tmp190
	movl	32(%rax), %eax	; name_199->kind, _6
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _6
	jne	.L242	;,
.L241:
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	-168(%rbp), %rax	; name, tmp191
	movq	(%rax), %rsi	; name_199->type, _7
	movq	-208(%rbp), %rdx	; status, tmp192
	movq	-168(%rbp), %rax	; name, tmp193
	movq	%rdx, %rcx	; tmp192,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp193,
	call	create_var	;
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _8,
	movl	$7, %edi	;,
	call	create_arg	;
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	.L237	;
.L242:
; temp/codegen.c:721:         Var* self = find_self_parameter(status);
	movq	-208(%rbp), %rax	; status, tmp194
	movq	%rax, %rdi	; tmp194,
	call	find_self_parameter	;
	movq	%rax, -184(%rbp)	; tmp195, self
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpq	$0, -184(%rbp)	;, self
	je	.L243	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-184(%rbp), %rax	; self, tmp196
	movq	16(%rax), %rax	; self_203->type, _9
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	; _9
	je	.L243	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-184(%rbp), %rax	; self, tmp197
	movq	16(%rax), %rax	; self_203->type, _10
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movl	32(%rax), %eax	; _10->kind, _11
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testl	%eax, %eax	; _11
	jne	.L243	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-168(%rbp), %rax	; name, tmp198
	movq	24(%rax), %rdx	; name_199->ast_node.scope, _12
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	-184(%rbp), %rax	; self, tmp199
	movq	16(%rax), %rax	; self_203->type, _13
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	; _13->ast_node.class, _14
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	; _14->class_scope, _15
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpq	%rax, %rdx	; _15, _12
	jne	.L243	;,
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	-184(%rbp), %rax	; self, tmp200
	movq	%rax, %rsi	; tmp200,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _16
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	-208(%rbp), %rdx	; status, tmp201
	movq	-168(%rbp), %rax	; name, tmp202
	movq	%rax, %rsi	; tmp202,
	movq	%rcx, %rdi	; _16,
	call	emit_attribute_access	;
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	jmp	.L237	;
.L243:
; temp/codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	-168(%rbp), %rax	; name, tmp203
	movq	8(%rax), %rdx	; name_199->name, _17
	movq	stderr(%rip), %rax	; stderr, stderr.32_18
	leaq	.LC23(%rip), %rcx	;, tmp204
	movq	%rcx, %rsi	; tmp204,
	movq	%rax, %rdi	; stderr.32_18,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	-168(%rbp), %rax	; name, tmp205
	movq	(%rax), %rsi	; name_199->type, _19
	movq	-208(%rbp), %rdx	; status, tmp206
	movq	-168(%rbp), %rax	; name, tmp207
	movq	%rdx, %rcx	; tmp206,
	movl	$118, %edx	;,
	movq	%rax, %rdi	; tmp207,
	call	create_var	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	%rax, %rsi	; _20,
	movl	$0, %edi	;,
	call	create_arg	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	jmp	.L237	;
.L238:
; temp/codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	movq	-200(%rbp), %rax	; variable_access, tmp208
	movl	16(%rax), %eax	; variable_access_113(D)->type, _21
; temp/codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %eax	;, _21
	jne	.L244	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	-200(%rbp), %rax	; variable_access, tmp209
	movq	(%rax), %rax	; variable_access_113(D)->base, _22
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rax, %rax	; _22
	je	.L245	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	-200(%rbp), %rax	; variable_access, tmp210
	movq	8(%rax), %rax	; variable_access_113(D)->content.attr_name, _23
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rax, %rax	; _23
	jne	.L246	;,
.L245:
; temp/codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	movq	stderr(%rip), %rax	; stderr, stderr.33_24
	movq	%rax, %rcx	; stderr.33_24,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rax	;, tmp211
	movq	%rax, %rdi	; tmp211,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:731:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L246:
; temp/codegen.c:733:         Symbol* attr_name = variable_access->content.attr_name;
	movq	-200(%rbp), %rax	; variable_access, tmp212
	movq	8(%rax), %rax	; variable_access_113(D)->content.attr_name, tmp213
	movq	%rax, -152(%rbp)	; tmp213, attr_name
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movq	-152(%rbp), %rax	; attr_name, tmp214
	movl	32(%rax), %eax	; attr_name_187->kind, _25
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$2, %eax	;, _25
	je	.L247	;,
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movq	-152(%rbp), %rax	; attr_name, tmp215
	movl	32(%rax), %eax	; attr_name_187->kind, _26
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	;, _26
	jne	.L248	;,
.L247:
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	-152(%rbp), %rax	; attr_name, tmp216
	movq	(%rax), %rsi	; attr_name_187->type, _27
	movq	-208(%rbp), %rdx	; status, tmp217
	movq	-152(%rbp), %rax	; attr_name, tmp218
	movq	%rdx, %rcx	; tmp217,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp218,
	call	create_var	;
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _28,
	movl	$7, %edi	;,
	call	create_arg	;
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	jmp	.L237	;
.L248:
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	movq	-200(%rbp), %rax	; variable_access, tmp219
	movq	(%rax), %rax	; variable_access_113(D)->base, _29
	movq	-208(%rbp), %rdx	; status, tmp220
	movq	%rdx, %rsi	; tmp220,
	movq	%rax, %rdi	; _29,
	call	codegen_variable_access	;
	movq	%rax, -160(%rbp)	; tmp221, object
; temp/codegen.c:737:         if (object == NULL) {
	cmpq	$0, -160(%rbp)	;, object
	jne	.L249	;,
; temp/codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	movq	stderr(%rip), %rax	; stderr, stderr.34_30
	movq	%rax, %rcx	; stderr.34_30,
	movl	$61, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rax	;, tmp222
	movq	%rax, %rdi	; tmp222,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:739:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L249:
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	-208(%rbp), %rdx	; status, tmp223
	movq	-152(%rbp), %rcx	; attr_name, tmp224
	movq	-160(%rbp), %rax	; object, tmp225
	movq	%rcx, %rsi	; tmp224,
	movq	%rax, %rdi	; tmp225,
	call	emit_attribute_access	;
	jmp	.L237	;
.L244:
; temp/codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	movq	-200(%rbp), %rax	; variable_access, tmp226
	movl	16(%rax), %eax	; variable_access_113(D)->type, _31
; temp/codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %eax	;, _31
	jne	.L250	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	-200(%rbp), %rax	; variable_access, tmp227
	movq	(%rax), %rax	; variable_access_113(D)->base, _32
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rax, %rax	; _32
	je	.L251	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	-200(%rbp), %rax	; variable_access, tmp228
	movq	8(%rax), %rax	; variable_access_113(D)->content.index, _33
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rax, %rax	; _33
	jne	.L252	;,
.L251:
; temp/codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	movq	stderr(%rip), %rax	; stderr, stderr.35_34
	movq	%rax, %rcx	; stderr.35_34,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rax	;, tmp229
	movq	%rax, %rdi	; tmp229,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:747:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L252:
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	-200(%rbp), %rax	; variable_access, tmp230
	movq	(%rax), %rax	; variable_access_113(D)->base, _35
	movq	-208(%rbp), %rdx	; status, tmp231
	movq	%rdx, %rsi	; tmp231,
	movq	%rax, %rdi	; _35,
	call	codegen_variable_access	;
	movq	%rax, %rdx	;, _36
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	-208(%rbp), %rax	; status, tmp232
	movq	%rax, %rsi	; tmp232,
	movq	%rdx, %rdi	; _36,
	call	load_rvalue	;
	movq	%rax, -120(%rbp)	; tmp233, sequence
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	-200(%rbp), %rax	; variable_access, tmp234
	movq	8(%rax), %rax	; variable_access_113(D)->content.index, _37
	movq	-208(%rbp), %rdx	; status, tmp235
	movq	%rdx, %rsi	; tmp235,
	movq	%rax, %rdi	; _37,
	call	codegen_expression	;
	movq	%rax, %rdx	;, _38
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	-208(%rbp), %rax	; status, tmp236
	movq	%rax, %rsi	; tmp236,
	movq	%rdx, %rdi	; _38,
	call	load_rvalue	;
	movq	%rax, -128(%rbp)	; tmp237, index
; temp/codegen.c:751:         if (sequence == NULL || index == NULL) {
	cmpq	$0, -120(%rbp)	;, sequence
	je	.L253	;,
; temp/codegen.c:751:         if (sequence == NULL || index == NULL) {
	cmpq	$0, -128(%rbp)	;, index
	jne	.L254	;,
.L253:
; temp/codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	movq	stderr(%rip), %rax	; stderr, stderr.36_39
	movq	%rax, %rcx	; stderr.36_39,
	movl	$68, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rax	;, tmp238
	movq	%rax, %rdi	; tmp238,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:753:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L254:
; temp/codegen.c:755:         Symbol* element_type = name_int;
	movq	name_int(%rip), %rax	; name_int, tmp239
	movq	%rax, -8(%rbp)	; tmp239, element_type
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	-120(%rbp), %rax	; sequence, tmp240
	movq	8(%rax), %rdx	; sequence_169->type, _40
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	name_float(%rip), %rax	; name_float, name_float.37_41
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rax, %rdx	; name_float.37_41, _40
	je	.L255	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	-120(%rbp), %rax	; sequence, tmp241
	movq	8(%rax), %rdx	; sequence_169->type, _42
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	name_bool(%rip), %rax	; name_bool, name_bool.38_43
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rax, %rdx	; name_bool.38_43, _42
	je	.L255	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	-120(%rbp), %rax	; sequence, tmp242
	movq	8(%rax), %rdx	; sequence_169->type, _44
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	name_string(%rip), %rax	; name_string, name_string.39_45
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rax, %rdx	; name_string.39_45, _44
	jne	.L256	;,
.L255:
; temp/codegen.c:757:             element_type = sequence->type;
	movq	-120(%rbp), %rax	; sequence, tmp243
	movq	8(%rax), %rax	; sequence_169->type, tmp244
	movq	%rax, -8(%rbp)	; tmp244, element_type
.L256:
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	-208(%rbp), %rdx	; status, tmp245
	movq	-8(%rbp), %rax	; element_type, tmp246
	movq	%rdx, %rcx	; tmp245,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; tmp246,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rsi	; _46,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -136(%rbp)	; tmp247, result
; temp/codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	movq	-128(%rbp), %rcx	; index, tmp248
	movq	-120(%rbp), %rdx	; sequence, tmp249
	movq	-136(%rbp), %rax	; result, tmp250
	movq	%rax, %rsi	; tmp250,
	movl	$16, %edi	;,
	call	create_instruction	;
	movq	%rax, -144(%rbp)	; tmp251, inst
; temp/codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	-208(%rbp), %rax	; status, tmp252
	movq	16(%rax), %rax	; status_114(D)->current_block, _47
; temp/codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rax	; _47->instructions, _48
	movq	-144(%rbp), %rdx	; inst, tmp253
	movq	%rdx, %rsi	; tmp253,
	movq	%rax, %rdi	; _48,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:761:         result->is_get = true;
	movq	-136(%rbp), %rax	; result, tmp254
	movb	$1, 20(%rax)	;, result_177->is_get
; temp/codegen.c:762:         return result;
	movq	-136(%rbp), %rax	; result, _105
	jmp	.L237	;
.L250:
; temp/codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	movq	-200(%rbp), %rax	; variable_access, tmp255
	movl	16(%rax), %eax	; variable_access_113(D)->type, _49
; temp/codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %eax	;, _49
	jne	.L257	;,
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	movq	-200(%rbp), %rax	; variable_access, tmp256
	movq	(%rax), %rax	; variable_access_113(D)->base, _50
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rax, %rax	; _50
	jne	.L258	;,
; temp/codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	movq	stderr(%rip), %rax	; stderr, stderr.40_51
	movq	%rax, %rcx	; stderr.40_51,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC28(%rip), %rax	;, tmp257
	movq	%rax, %rdi	; tmp257,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:768:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L258:
; temp/codegen.c:771:         Symbol* callee_name = NULL;
	movq	$0, -16(%rbp)	;, callee_name
; temp/codegen.c:772:         Arg* receiver = NULL;
	movq	$0, -24(%rbp)	;, receiver
; temp/codegen.c:773:         VariableAccess* callee_access = variable_access->base;
	movq	-200(%rbp), %rax	; variable_access, tmp258
	movq	(%rax), %rax	; variable_access_113(D)->base, tmp259
	movq	%rax, -56(%rbp)	; tmp259, callee_access
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	-56(%rbp), %rax	; callee_access, tmp260
	movl	16(%rax), %eax	; callee_access_120->type, _52
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, %eax	;, _52
	jne	.L260	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	-56(%rbp), %rax	; callee_access, tmp261
	movq	8(%rax), %rax	; callee_access_120->content.attr_name, _53
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%rax, %rax	; _53
	je	.L260	;,
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movq	-56(%rbp), %rax	; callee_access, tmp262
	movq	8(%rax), %rax	; callee_access_120->content.attr_name, _54
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%rax), %eax	; _54->kind, _55
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, %eax	;, _55
	je	.L261	;,
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movq	-56(%rbp), %rax	; callee_access, tmp263
	movq	8(%rax), %rax	; callee_access_120->content.attr_name, _56
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%rax), %eax	; _56->kind, _57
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	cmpl	$1, %eax	;, _57
	jne	.L260	;,
.L261:
; temp/codegen.c:776:             callee_name = callee_access->content.attr_name;
	movq	-56(%rbp), %rax	; callee_access, tmp264
	movq	8(%rax), %rax	; callee_access_120->content.attr_name, tmp265
	movq	%rax, -16(%rbp)	; tmp265, callee_name
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	movq	-56(%rbp), %rax	; callee_access, tmp266
	movq	(%rax), %rax	; callee_access_120->base, _58
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rax, %rax	; _58
	je	.L260	;,
; temp/codegen.c:778:                 bool is_class_constructor_call = false;
	movb	$0, -25(%rbp)	;, is_class_constructor_call
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	-56(%rbp), %rax	; callee_access, tmp267
	movq	(%rax), %rax	; callee_access_120->base, _59
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	16(%rax), %eax	; _59->type, _60
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _60
	jne	.L262	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	-56(%rbp), %rax	; callee_access, tmp268
	movq	(%rax), %rax	; callee_access_120->base, _61
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rax), %rax	; _61->content.name, _62
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _62
	je	.L262	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	-56(%rbp), %rax	; callee_access, tmp269
	movq	(%rax), %rax	; callee_access_120->base, _63
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rax), %rax	; _63->content.name, _64
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _64->kind, _65
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _65
	jne	.L262	;,
; temp/codegen.c:780:                     is_class_constructor_call = true;
	movb	$1, -25(%rbp)	;, is_class_constructor_call
.L262:
; temp/codegen.c:781:                 if (!is_class_constructor_call)
	cmpb	$0, -25(%rbp)	;, is_class_constructor_call
	jne	.L260	;,
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	-56(%rbp), %rax	; callee_access, tmp270
	movq	(%rax), %rax	; callee_access_120->base, _66
	movq	-208(%rbp), %rdx	; status, tmp271
	movq	%rdx, %rsi	; tmp271,
	movq	%rax, %rdi	; _66,
	call	codegen_variable_access	;
	movq	%rax, %rdx	;, _67
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	-208(%rbp), %rax	; status, tmp272
	movq	%rax, %rsi	; tmp272,
	movq	%rdx, %rdi	; _67,
	call	load_rvalue	;
	movq	%rax, -24(%rbp)	; tmp273, receiver
.L260:
; temp/codegen.c:785:         if (callee_name == NULL) {
	cmpq	$0, -16(%rbp)	;, callee_name
	jne	.L263	;,
; temp/codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	-208(%rbp), %rdx	; status, tmp274
	movq	-56(%rbp), %rax	; callee_access, tmp275
	movq	%rdx, %rsi	; tmp274,
	movq	%rax, %rdi	; tmp275,
	call	codegen_variable_access	;
	movq	%rax, -64(%rbp)	; tmp276, callee
; temp/codegen.c:787:             if (callee == NULL) {
	cmpq	$0, -64(%rbp)	;, callee
	jne	.L264	;,
; temp/codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	movq	stderr(%rip), %rax	; stderr, stderr.41_68
	movq	%rax, %rcx	; stderr.41_68,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp277
	movq	%rax, %rdi	; tmp277,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:789:                 return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L264:
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	-64(%rbp), %rax	; callee, tmp278
	movl	16(%rax), %eax	; callee_128->kind, _69
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %eax	;, _69
	jne	.L265	;,
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	-64(%rbp), %rax	; callee, tmp279
	movq	(%rax), %rax	; callee_128->value.subroutine, _70
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	; _70
	je	.L265	;,
; temp/codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	-64(%rbp), %rax	; callee, tmp280
	movq	(%rax), %rax	; callee_128->value.subroutine, _71
; temp/codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %rax	; _71->original_name, tmp281
	movq	%rax, -16(%rbp)	; tmp281, callee_name
	jmp	.L263	;
.L265:
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	-64(%rbp), %rax	; callee, tmp282
	movl	16(%rax), %eax	; callee_128->kind, _72
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%eax, %eax	; _72
	jne	.L263	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	-64(%rbp), %rax	; callee, tmp283
	movq	(%rax), %rax	; callee_128->value.variable, _73
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	; _73
	je	.L263	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	-64(%rbp), %rax	; callee, tmp284
	movq	(%rax), %rax	; callee_128->value.variable, _74
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	; _74->original_name, _75
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	; _75
	je	.L263	;,
; temp/codegen.c:794:                 Symbol* maybe_subroutine = callee->value.variable->original_name;
	movq	-64(%rbp), %rax	; callee, tmp285
	movq	(%rax), %rax	; callee_128->value.variable, _76
; temp/codegen.c:794:                 Symbol* maybe_subroutine = callee->value.variable->original_name;
	movq	(%rax), %rax	; _76->original_name, tmp286
	movq	%rax, -72(%rbp)	; tmp286, maybe_subroutine
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movq	-72(%rbp), %rax	; maybe_subroutine, tmp287
	movl	32(%rax), %eax	; maybe_subroutine_130->kind, _77
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, _77
	je	.L266	;,
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movq	-72(%rbp), %rax	; maybe_subroutine, tmp288
	movl	32(%rax), %eax	; maybe_subroutine_130->kind, _78
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _78
	jne	.L263	;,
.L266:
; temp/codegen.c:796:                     callee_name = maybe_subroutine;
	movq	-72(%rbp), %rax	; maybe_subroutine, tmp289
	movq	%rax, -16(%rbp)	; tmp289, callee_name
.L263:
; temp/codegen.c:799:         if (callee_name == NULL) {
	cmpq	$0, -16(%rbp)	;, callee_name
	jne	.L267	;,
; temp/codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	movq	stderr(%rip), %rax	; stderr, stderr.42_79
	movq	%rax, %rcx	; stderr.42_79,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC30(%rip), %rax	;, tmp290
	movq	%rax, %rdi	; tmp290,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:801:             return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L267:
; temp/codegen.c:804:         size_t argument_count = 0;
	movq	$0, -40(%rbp)	;, argument_count
; temp/codegen.c:805:         if (receiver != NULL) {
	cmpq	$0, -24(%rbp)	;, receiver
	je	.L268	;,
; temp/codegen.c:806:             emit_param_instruction(receiver, status);
	movq	-208(%rbp), %rdx	; status, tmp291
	movq	-24(%rbp), %rax	; receiver, tmp292
	movq	%rdx, %rsi	; tmp291,
	movq	%rax, %rdi	; tmp292,
	call	emit_param_instruction	;
; temp/codegen.c:807:             ++argument_count;
	addq	$1, -40(%rbp)	;, argument_count
.L268:
; temp/codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	-200(%rbp), %rax	; variable_access, tmp293
	movq	8(%rax), %rax	; variable_access_113(D)->content.args, _80
	movq	%rax, %rdi	; _80,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -80(%rbp)	; tmp294, args
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L269	;
.L271:
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	-208(%rbp), %rdx	; status, tmp295
	movq	-88(%rbp), %rax	; arg_expr, tmp296
	movq	%rdx, %rsi	; tmp295,
	movq	%rax, %rdi	; tmp296,
	call	codegen_expression	;
	movq	%rax, %rdx	;, _81
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	-208(%rbp), %rax	; status, tmp297
	movq	%rax, %rsi	; tmp297,
	movq	%rdx, %rdi	; _81,
	call	load_rvalue	;
	movq	%rax, -112(%rbp)	; tmp298, arg_value
; temp/codegen.c:813:             if (arg_value == NULL) {
	cmpq	$0, -112(%rbp)	;, arg_value
	jne	.L270	;,
; temp/codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	movq	stderr(%rip), %rax	; stderr, stderr.43_82
	movq	%rax, %rcx	; stderr.43_82,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rax	;, tmp299
	movq	%rax, %rdi	; tmp299,
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:815:                 return NULL;
	movl	$0, %eax	;, _105
	jmp	.L237	;
.L270:
; temp/codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	-208(%rbp), %rdx	; status, tmp300
	movq	-112(%rbp), %rax	; arg_value, tmp301
	movq	%rdx, %rsi	; tmp300,
	movq	%rax, %rdi	; tmp301,
	call	emit_param_instruction	;
; temp/codegen.c:818:             ++argument_count;
	addq	$1, -40(%rbp)	;, argument_count
.L269:
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	-80(%rbp), %rax	; args, tmp302
	movq	%rax, %rdi	; tmp302,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -88(%rbp)	; tmp303, arg_expr
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -88(%rbp)	;, arg_expr
	jne	.L271	;,
; temp/codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp304, result
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	-16(%rbp), %rax	; callee_name, tmp305
	movq	(%rax), %rax	; callee_name_98->type, _83
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rax, %rax	; _83
	je	.L272	;,
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	-16(%rbp), %rax	; callee_name, tmp306
	movq	(%rax), %rdx	; callee_name_98->type, _84
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	name_void(%rip), %rax	; name_void, name_void.44_85
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	%rax, %rdx	; name_void.44_85, _84
	je	.L272	;,
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	-16(%rbp), %rax	; callee_name, tmp307
	movq	(%rax), %rax	; callee_name_98->type, _86
	movq	-208(%rbp), %rdx	; status, tmp308
	movq	%rdx, %rcx	; tmp308,
	movl	$116, %edx	;,
	movq	%rax, %rsi	; _86,
	movl	$0, %edi	;,
	call	create_var	;
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rax, %rsi	; _87,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, -48(%rbp)	; tmp309, result
.L272:
; temp/codegen.c:824:         long long count = (long long)argument_count;
	movq	-40(%rbp), %rax	; argument_count, argument_count.45_88
; temp/codegen.c:824:         long long count = (long long)argument_count;
	movq	%rax, -192(%rbp)	; argument_count.45_88, count
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	-16(%rbp), %rax	; callee_name, tmp310
	movq	(%rax), %rsi	; callee_name_98->type, _89
	movq	-208(%rbp), %rdx	; status, tmp311
	movq	-16(%rbp), %rax	; callee_name, tmp312
	movq	%rdx, %rcx	; tmp311,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; tmp312,
	call	create_var	;
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; _90,
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, -96(%rbp)	; tmp313, callee_arg
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	leaq	-192(%rbp), %rax	;, tmp314
	movq	%rax, %rsi	; tmp314,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	;, _91
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	-96(%rbp), %rdx	; callee_arg, tmp315
	movq	-48(%rbp), %rax	; result, tmp316
	movq	%rax, %rsi	; tmp316,
	movl	$22, %edi	;,
	call	create_instruction	;
	movq	%rax, -104(%rbp)	; tmp317, call_inst
; temp/codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	-208(%rbp), %rax	; status, tmp318
	movq	16(%rax), %rax	; status_114(D)->current_block, _92
; temp/codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	8(%rax), %rax	; _92->instructions, _93
	movq	-104(%rbp), %rdx	; call_inst, tmp319
	movq	%rdx, %rsi	; tmp319,
	movq	%rax, %rdi	; _93,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:828:         return result;
	movq	-48(%rbp), %rax	; result, _105
	jmp	.L237	;
.L257:
; temp/codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movq	-200(%rbp), %rax	; variable_access, tmp320
	movl	16(%rax), %edx	; variable_access_113(D)->type, _94
; temp/codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movq	stderr(%rip), %rax	; stderr, stderr.46_95
	leaq	.LC32(%rip), %rcx	;, tmp321
	movq	%rcx, %rsi	; tmp321,
	movq	%rax, %rdi	; stderr.46_95,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; temp/codegen.c:832:     return NULL;
	movl	$0, %eax	;, _105
.L237:
; temp/codegen.c:833: }
	leave	
	ret	
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata
	.align 8
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
