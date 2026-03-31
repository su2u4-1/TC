	.file	"D:\\TC\\temp\\codegen.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	find_var_by_symbol;	.scl	3;	.type	32;	.endef
find_var_by_symbol:
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rcx, %rcx	 ; vars
	je	.L5	 ;,
	testq	%rdx, %rdx	 ; symbol
	je	.L5	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rcx), %rax	 ; vars_7(D)->head, <retval>
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L4	 ;,
	ret	
.L3:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	(%rax), %rax	 ; current_14->next, <retval>
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L8	 ;,
.L4:
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rcx	 ; current_14->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rcx, %rcx	 ; var
	je	.L3	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	%rdx, (%rcx)	 ; symbol, var_11->original_name
	jne	.L3	 ;,
 ; D:\TC\temp\codegen.c:204:             return var;
	movq	%rcx, %rax	 ; var, <retval>
.L1:
 ; D:\TC\temp\codegen.c:208: }
	ret	
.L8:
	ret	
.L5:
 ; D:\TC\temp\codegen.c:199:         return NULL;
	movl	$0, %eax	 ;, <retval>
	ret	
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movl	%ecx, %ebp	 ; tmp88, type
	movq	%rdx, %rdi	 ; tmp89, arg1
	movq	%r8, %rsi	 ; tmp90, arg2
	movq	%r9, %rbx	 ; tmp91, arg3
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	%ebp, 24(%rax)	 ; type, inst_3->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg1, inst_3->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg2, inst_3->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg3, inst_3->arg3
 ; D:\TC\temp\codegen.c:141: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.def	create_subroutine;	.scl	3;	.type	32;	.endef
create_subroutine:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp89, name
	movq	%rdx, %rsi	 ; tmp90, return_type
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp91, <retval>
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movq	%rdi, (%rax)	 ; name, subroutine_6->name
 ; D:\TC\temp\codegen.c:101:     subroutine->return_type = return_type;
	movq	%rsi, 8(%rax)	 ; return_type, subroutine_6->return_type
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbx)	 ; tmp92, subroutine_6->parameters
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbx)	 ; tmp93, subroutine_6->local_vars
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbx)	 ; tmp94, subroutine_6->blocks
 ; D:\TC\temp\codegen.c:106: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp86, label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rsi, (%rax)	 ; label, block_4->label
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, block_4->instructions
 ; D:\TC\temp\codegen.c:112: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; D:\TC\temp\codegen.c:21:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L18	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_int
	je	.L19	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_float
	je	.L20	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_string
	je	.L21	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp97
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rax)	 ; type, name_bool
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp98
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rax)	 ; type, name_void
	je	.L23	 ;,
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rcx)	 ;, type_13(D)->kind
	jne	.L17	 ;,
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
.L17:
 ; D:\TC\temp\codegen.c:20: static size_t get_type_size(Symbol* type) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_13(D)->name, _8
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	movq	%rbx, %r8	 ; _8,
	leaq	.LC0(%rip), %rdx	 ;, tmp101
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:30:     return 8;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\temp\codegen.c:31: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L18:
 ; D:\TC\temp\codegen.c:22:         return 0;
	movl	$0, %eax	 ;, <retval>
	ret	
.L19:
 ; D:\TC\temp\codegen.c:24:         return 8;
	movl	$8, %eax	 ;, <retval>
	ret	
.L20:
	movl	$8, %eax	 ;, <retval>
	ret	
.L21:
	movl	$8, %eax	 ;, <retval>
	ret	
.L22:
 ; D:\TC\temp\codegen.c:26:         return 1;
	movl	$1, %eax	 ;, <retval>
	ret	
.L23:
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\temp\codegen.c:31: }
	ret	
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %esi	 ; tmp116, kind
	movq	%rdx, %rdi	 ; tmp117, value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp118, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_16->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_16->type
 ; D:\TC\temp\codegen.c:146:     switch (kind) {
	cmpl	$7, %esi	 ;, kind
	ja	.L28	 ;,
	movl	%esi, %esi	 ; kind, kind
	leaq	.L30(%rip), %rdx	 ;, tmp98
	movslq	(%rdx,%rsi,4), %rax	 ;, tmp100
	addq	%rdx, %rax	 ; tmp98, tmp101
	jmp	*%rax	 ; tmp101
	.section .rdata,"dr"
	.align 4
.L30:
	.long	.L37-.L30
	.long	.L36-.L30
	.long	.L35-.L30
	.long	.L34-.L30
	.long	.L33-.L30
	.long	.L32-.L30
	.long	.L31-.L30
	.long	.L29-.L30
	.text
.L37:
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.variable
 ; D:\TC\temp\codegen.c:149:             arg->type = arg->value.variable->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_20(D)].type, _1
 ; D:\TC\temp\codegen.c:149:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	 ; _1, arg_16->type
.L38:
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_16->is_get
 ; D:\TC\temp\codegen.c:185: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L36:
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	(%rdi), %rax	 ; MEM[(long long int *)value_20(D)], _2
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	 ; _2, arg_16->value.int_value
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rbx)	 ; name_int, arg_16->type
 ; D:\TC\temp\codegen.c:154:             break;
	jmp	.L38	 ;
.L35:
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	(%rdi), %xmm0	 ; MEM[(double *)value_20(D)], _4
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	 ; _4, arg_16->value.float_value
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; name_float, name_float
	movq	%rax, 8(%rbx)	 ; name_float, arg_16->type
 ; D:\TC\temp\codegen.c:158:             break;
	jmp	.L38	 ;
.L34:
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.string_value
 ; D:\TC\temp\codegen.c:161:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; name_string, name_string
	movq	%rax, 8(%rbx)	 ; name_string, arg_16->type
 ; D:\TC\temp\codegen.c:162:             break;
	jmp	.L38	 ;
.L33:
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movzbl	(%rdi), %eax	 ; MEM[(char *)value_20(D)], _7
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	%al, (%rbx)	 ; _7, arg_16->value.bool_value
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp109
	movq	(%rax), %rax	 ; name_bool, name_bool
	movq	%rax, 8(%rbx)	 ; name_bool, arg_16->type
 ; D:\TC\temp\codegen.c:166:             break;
	jmp	.L38	 ;
.L32:
 ; D:\TC\temp\codegen.c:168:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	 ;, arg_16->value.string_value
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp111
	movq	(%rax), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_16->type
 ; D:\TC\temp\codegen.c:170:             break;
	jmp	.L38	 ;
.L31:
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.label
 ; D:\TC\temp\codegen.c:173:             break;
	jmp	.L38	 ;
.L29:
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.subroutine
 ; D:\TC\temp\codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_20(D)].type, _10
 ; D:\TC\temp\codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	 ; _10, arg_16->type
 ; D:\TC\temp\codegen.c:177:             break;
	jmp	.L38	 ;
.L28:
 ; D:\TC\temp\codegen.c:180:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:180:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	movl	%esi, %r8d	 ; kind,
	leaq	.LC1(%rip), %rdx	 ;, tmp114
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:181:             break;
	jmp	.L38	 ;
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rcx, %rcx	 ; value
	je	.L43	 ;,
 ; D:\TC\temp\codegen.c:283: static void emit_param_instruction(Arg* value, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp102, value
	movq	%rdx, %rsi	 ; tmp103, status
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rdx, %rdx	 ; status
	je	.L40	 ;,
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rcx), %rcx	 ; value_11(D)->type, value_11(D)->type
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, 40(%rsp)	 ; tmp104, size
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	leaq	40(%rsp), %rdx	 ;, tmp99
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp105, _7
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; value,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp106, inst
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
.L40:
 ; D:\TC\temp\codegen.c:289: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L43:
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
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %r12	 ; tmp112, original_name
	movq	%rdx, %rbp	 ; tmp113, type
	movl	%r8d, %esi	 ; tmp114, kind
	movq	%r9, %rdi	 ; tmp115, status
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp116, <retval>
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; original_name, var_19->original_name
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	leal	-97(%rsi), %eax	 ;, tmp95
	cmpl	$21, %eax	 ;, tmp95
	ja	.L57	 ;,
	movl	%eax, %eax	 ; tmp95, tmp96
	leaq	.L49(%rip), %rdx	 ;, tmp97
	movslq	(%rdx,%rax,4), %rax	 ;, tmp99
	addq	%rdx, %rax	 ; tmp97, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L49:
	.long	.L54-.L49
	.long	.L53-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L52-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L51-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L57-.L49
	.long	.L50-.L49
	.long	.L57-.L49
	.long	.L48-.L49
	.text
.L54:
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rdi), %r12	 ; status_23(D)->attr_count, id
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r12), %rax	 ;, tmp102
	movq	%rax, 40(%rdi)	 ; tmp102, status_23(D)->attr_count
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L47	 ;
.L51:
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rdi), %r12	 ; status_23(D)->param_count, id
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r12), %rax	 ;, tmp103
	movq	%rax, 48(%rdi)	 ; tmp103, status_23(D)->param_count
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L47	 ;
.L48:
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rdi), %r12	 ; status_23(D)->var_count, id
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	 ;, tmp104
	movq	%rax, 56(%rdi)	 ; tmp104, status_23(D)->var_count
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L47	 ;
.L50:
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rdi), %r12	 ; status_23(D)->temp_count, id
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r12), %rax	 ;, tmp105
	movq	%rax, 64(%rdi)	 ; tmp105, status_23(D)->temp_count
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L47	 ;
.L53:
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rdi), %r12	 ; status_23(D)->block_count, id
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	 ;, tmp106
	movq	%rax, 72(%rdi)	 ; tmp106, status_23(D)->block_count
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L47	 ;
.L52:
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rdi), %r12	 ; status_23(D)->subroutine_count, id
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r12), %rax	 ;, tmp107
	movq	%rax, 80(%rdi)	 ; tmp107, status_23(D)->subroutine_count
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L47	 ;
.L57:
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	movq	$-1, %r12	 ;, id
.L47:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp108
	call	create_string	 ;
	movq	%rax, %rcx	 ; tmp117, _13
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _13, var_19->name
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	 ;, id
	je	.L59	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r12, %r9	 ; id,
	movl	%esi, %r8d	 ; kind,
	leaq	.LC4(%rip), %rdx	 ;, tmp110
	call	sprintf	 ;
.L56:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rbx)	 ; type, var_19->type
 ; D:\TC\temp\codegen.c:133: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L59:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC3(%rip), %rdx	 ;, tmp109
	call	sprintf	 ;
	jmp	.L56	 ;
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp96, arg
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rcx, %rcx	 ; arg
	je	.L61	 ;,
	movq	%rdx, %rsi	 ; tmp97, status
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_9(D)->is_get
	jne	.L63	 ;,
.L61:
 ; D:\TC\temp\codegen.c:195: }
	movq	%rbx, %rax	 ; arg,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L63:
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_9(D)->type, arg_9(D)->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdi	 ; tmp99, temp
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; arg,
	movq	%rax, %rdx	 ; temp,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp100, _4
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rsi), %rax	 ; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rcx	 ; _5->instructions, _5->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:192:         return temp;
	movq	%rdi, %rbx	 ; temp, arg
	jmp	.L61	 ;
	.section .rdata,"dr"
.LC5:
	.ascii "<unknown>\0"
	.align 8
.LC6:
	.ascii "[warning] Invalid attribute access\12\0"
	.align 8
.LC7:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC8:
	.ascii "$a%zu\0"
	.text
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rcx, %rcx	 ; object
	je	.L83	 ;,
	movq	%rdx, %rbx	 ; tmp147, attr_name
	movq	%r8, %rdi	 ; tmp148, status
	testq	%rdx, %rdx	 ; attr_name
	je	.L83	 ;,
 ; D:\TC\temp\codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	%r8, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp150, object_value
 ; D:\TC\temp\codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	 ; object_value
	je	.L82	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rax), %rsi	 ; object_value_21->type, class_type
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rsi, %rsi	 ; class_type
	je	.L68	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rsi)	 ;, _6->kind
	je	.L68	 ;,
 ; D:\TC\temp\codegen.c:272:     Symbol* class_type = NULL;
	movl	$0, %esi	 ;, class_type
.L68:
 ; D:\TC\temp\codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%rdi), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	(%rax), %rcx	 ; _54->attribute_tables, _54->attribute_tables
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp151, attribute_tables
.L69:
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%r12, %rcx	 ; attribute_tables,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	 ; current
	je	.L80	 ;,
 ; D:\TC\temp\codegen.c:9:         if (current->name == name)
	cmpq	8(%rax), %rsi	 ; current_57->name, class_type
	jne	.L69	 ;,
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rcx	 ; current_57->attributes, _35
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _35
	je	.L80	 ;,
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp154, attrs
 ; D:\TC\temp\codegen.c:243:     size_t index = 0;
	movl	$0, %r12d	 ;, index
.L73:
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%r13, %rcx	 ; attrs,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	 ; attr
	je	.L87	 ;,
 ; D:\TC\temp\codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbx	 ; attr_39->var_name, attr_name
	je	.L74	 ;,
 ; D:\TC\temp\codegen.c:252:         ++index;
	addq	$1, %r12	 ;, index
	jmp	.L73	 ;
.L83:
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp126
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:267:         return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L64	 ;
.L80:
 ; D:\TC\temp\codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rbx), %rdx	 ; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rdi, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rbx, %rcx	 ; attr_name,
	call	create_var	 ;
	movq	%rax, %r13	 ; tmp153, var
	jmp	.L72	 ;
.L82:
 ; D:\TC\temp\codegen.c:271:         return NULL;
	movq	%rax, %rbx	 ; object_value, <retval>
	jmp	.L64	 ;
.L74:
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r13	 ; tmp161, var
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	 ; attr_name, var_78->original_name
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	 ; attr_name_17(D)->type, _23
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	%rax, 16(%r13)	 ; _23, var_78->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp138
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; tmp162, var_78->name
	jmp	.L77	 ;
.L87:
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r13	 ; tmp163, var
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	 ; attr_name, var_90->original_name
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	 ; attr_name_17(D)->type, _92
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	%rax, 16(%r13)	 ; _92, var_90->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp139
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; tmp164, var_90->name
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rsi, %rsi	 ; class_type
	je	.L88	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rsi), %rsi	 ; class_type_13->name, iftmp.19_47
.L79:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbx), %r14	 ; attr_name_17(D)->name, _48
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	24(%rax), %rcx	 ; _49->_stderr, _49->_stderr
	movq	%r12, 32(%rsp)	 ; index,
	movq	%rsi, %r9	 ; iftmp.19_47,
	movq	%r14, %r8	 ; _48,
	leaq	.LC7(%rip), %rdx	 ;, tmp131
	call	fprintf	 ;
.L77:
 ; D:\TC\temp\codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	8(%r13), %rcx	 ; var_99->name, var_99->name
	movq	%r12, %r8	 ; index,
	leaq	.LC8(%rip), %rdx	 ;, tmp133
	call	sprintf	 ;
.L72:
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rbx), %rdx	 ; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rdi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp157, _9
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp158, <retval>
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%r13, %rdx	 ; var,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp159
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%rbp, %r8	 ; object_value,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp160, inst
 ; D:\TC\temp\codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_19(D)->current_block, status_19(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rbx)	 ;, result_26->is_get
.L64:
 ; D:\TC\temp\codegen.c:281: }
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
.L88:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC5(%rip), %rsi	 ;, iftmp.19_47
	jmp	.L79	 ;
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rdx, %rdi	 ; tmp108, tac
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rsi	 ; import_16(D)->name, _1
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rsi), %ebx	 ; _1->kind, _2
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L95	 ;,
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp101
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp101
	jbe	.L96	 ;,
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L93	 ;,
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp112, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp113, table_27->attributes
 ; D:\TC\temp\codegen.c:16:     table->name = name;
	movq	%rsi, 8(%rbx)	 ; _1, table_27->name
 ; D:\TC\temp\codegen.c:17:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_27->size
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rdi), %rcx	 ; tac_20(D)->attribute_tables, tac_20(D)->attribute_tables
	movq	%rbx, %rdx	 ; table,
	call	list_append	 ;
.L89:
 ; D:\TC\temp\codegen.c:318: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L95:
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp110, _4
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
	call	list_append	 ;
	jmp	.L89	 ;
.L96:
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp111, _8
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
	call	list_append	 ;
	jmp	.L89	 ;
.L93:
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC9(%rip), %rdx	 ;, tmp106
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:318: }
	jmp	.L89	 ;
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC11:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp138, variable
	movq	%rdx, %rdi	 ; tmp139, status
	movl	%r8d, %esi	 ; tmp140, type
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_21(D)->type, variable_21(D)->type
	movq	8(%rcx), %rcx	 ; variable_21(D)->name, variable_21(D)->name
	movq	%rdi, %r9	 ; status,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp141, var
 ; D:\TC\temp\codegen.c:386:     switch (type) {
	leal	-97(%rsi), %eax	 ;, tmp115
	cmpl	$21, %eax	 ;, tmp115
	ja	.L98	 ;,
	movl	%eax, %eax	 ; tmp115, tmp116
	leaq	.L100(%rip), %rcx	 ;, tmp117
	movslq	(%rcx,%rax,4), %rax	 ;, tmp119
	addq	%rcx, %rax	 ; tmp117, tmp120
	jmp	*%rax	 ; tmp120
	.section .rdata,"dr"
	.align 4
.L100:
	.long	.L104-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L103-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L102-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L98-.L100
	.long	.L101-.L100
	.long	.L98-.L100
	.long	.L99-.L100
	.text
.L102:
 ; D:\TC\temp\codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rdi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	16(%rax), %rcx	 ; _3->parameters, _3->parameters
	call	list_append	 ;
.L97:
 ; D:\TC\temp\codegen.c:410: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L99:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rdi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _5->local_vars, _5->local_vars
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:392:             break;
	jmp	.L97	 ;
.L101:
 ; D:\TC\temp\codegen.c:394:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rdi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _7->local_vars, _7->local_vars
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:395:             break;
	jmp	.L97	 ;
.L103:
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rdi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	16(%rax), %rcx	 ; _9->global_vars, _9->global_vars
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:398:             break;
	jmp	.L97	 ;
.L104:
 ; D:\TC\temp\codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	(%rax), %rcx	 ; _11->attribute_tables, _11->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rsi	 ; tmp142, attr_table
 ; D:\TC\temp\codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	(%rax), %rcx	 ; _13->attribute_tables, _13->attribute_tables
	movq	%rsi, %rdx	 ; attr_table,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	(%rbx), %rdi	 ; variable_21(D)->type, _15
	movq	8(%rbx), %rbp	 ; variable_21(D)->name, _16
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp143, attr
 ; D:\TC\temp\codegen.c:34:     attr->var_name = var_name;
	movq	%rbp, (%rax)	 ; _16, attr_36->var_name
 ; D:\TC\temp\codegen.c:35:     attr->type = type;
	movq	%rdi, 8(%rax)	 ; _15, attr_36->type
 ; D:\TC\temp\codegen.c:36:     attr->offset = offset;
	movq	$0, 16(%rax)	 ;, attr_36->offset
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	16(%rsi), %rax	 ; attr_table_31->size, _37
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	%rax, 16(%rbx)	 ; _37, attr_36->offset
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	%rdi, %rcx	 ; _15,
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, 16(%rsi)	 ; tmp144, attr_table_31->size
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%rsi), %rcx	 ; attr_table_31->attributes, _41
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _41
	je	.L108	 ;,
 ; D:\TC\temp\codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rbx, %rdx	 ; attr,
	call	list_append	 ;
	jmp	.L97	 ;
.L108:
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	24(%rax), %r9	 ; _42->_stderr,
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rcx	 ;, tmp135
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L97	 ;
.L98:
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
	movl	%esi, %r8d	 ; type,
	leaq	.LC11(%rip), %rdx	 ;, tmp137
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:410: }
	jmp	.L97	 ;
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC13:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC14:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC15:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC16:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC17:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC18:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC19:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC20:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC21:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC22:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC23:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rcx, %rcx	 ; variable_access
	je	.L151	 ;,
	movq	%rcx, %rdi	 ; tmp258, variable_access
	movq	%rdx, %rsi	 ; tmp259, status
	testq	%rdx, %rdx	 ; status
	je	.L151	 ;,
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rcx), %ebx	 ; variable_access_101(D)->type, _6
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%ebx, %ebx	 ; _6
	jne	.L113	 ;,
 ; D:\TC\temp\codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rcx), %rbx	 ; variable_access_101(D)->content.name, <retval>
 ; D:\TC\temp\codegen.c:712:         if (name == NULL) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L155	 ;,
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rdx), %rdi	 ; status_102(D)->current_subroutine, _200
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rdi, %rdi	 ; _200
	je	.L115	 ;,
 ; D:\TC\temp\codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rdi), %rcx	 ; _200->parameters, _200->parameters
	movq	%rbx, %rdx	 ; <retval>,
	call	find_var_by_symbol	 ;
 ; D:\TC\temp\codegen.c:215:         if (var != NULL)
	testq	%rax, %rax	 ; var
	je	.L156	 ;,
.L149:
 ; D:\TC\temp\codegen.c:718:             return create_arg(ARG_VARIABLE, existing);
	movq	%rax, %rdx	 ; var,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp265, <retval>
	jmp	.L109	 ;
.L151:
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	movl	$40, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp197
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:708:         return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L109	 ;
.L155:
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	movq	24(%rax), %r9	 ; _7->_stderr,
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp199
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:714:             return NULL;
	jmp	.L109	 ;
.L156:
 ; D:\TC\temp\codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rdi), %rcx	 ; _200->local_vars, _200->local_vars
	movq	%rbx, %rdx	 ; <retval>,
	call	find_var_by_symbol	 ;
 ; D:\TC\temp\codegen.c:218:         if (var != NULL)
	testq	%rax, %rax	 ; var
	jne	.L149	 ;,
.L115:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	 ; status_102(D)->tac, status_102(D)->tac
	movq	16(%rax), %rcx	 ; _205->global_vars, _205->global_vars
	movq	%rbx, %rdx	 ; <retval>,
	call	find_var_by_symbol	 ;
 ; D:\TC\temp\codegen.c:717:         if (existing != NULL)
	testq	%rax, %rax	 ; var
	jne	.L149	 ;,
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%rbx)	 ;, name_173->kind
	jbe	.L157	 ;,
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rdi, %rdi	 ; _200
	je	.L119	 ;,
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%rdi), %rax	 ; _200->parameters, _200->parameters
	movq	(%rax), %rdi	 ; _210->head, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rdi, %rdi	 ; current
	je	.L119	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %r12	 ;, tmp257
	jmp	.L122	 ;
.L157:
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %rdx	 ; name_173->type, name_173->type
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rbx, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp266, _11
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp267, <retval>
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	.L109	 ;
.L120:
 ; D:\TC\temp\codegen.c:232:         current = current->next;
	movq	(%rdi), %rdi	 ; current_199->next, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rdi, %rdi	 ; current
	je	.L119	 ;,
.L122:
 ; D:\TC\temp\codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%rdi), %rbp	 ; current_199->content, var
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rbp, %rbp	 ; var
	je	.L120	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	0(%rbp), %rax	 ; var_213->original_name, _214
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	 ; _214
	je	.L120	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%r12), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	8(%rax), %rcx	 ; _214->name, _214->name
	call	string_equal	 ;
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	 ; tmp268
	je	.L120	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rbp), %rax	 ; var_213->type, _12
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	 ; _12
	je	.L119	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpl	$0, 32(%rax)	 ;, _12->kind
	jne	.L119	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	 ; _12->ast_node.class, _12->ast_node.class
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	 ; _15->class_scope, tmp309
	cmpq	%rax, 24(%rbx)	 ; tmp309, name_173->ast_node.scope
	je	.L158	 ;,
.L119:
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	8(%rbx), %rdi	 ; name_173->name, _18
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	movq	%rdi, %r8	 ; _18,
	leaq	.LC14(%rip), %rdx	 ;, tmp212
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	(%rbx), %rdx	 ; name_173->type, name_173->type
	movq	%rsi, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rbx, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp272, _22
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp273, <retval>
.L109:
 ; D:\TC\temp\codegen.c:833: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L158:
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rbp, %rdx	 ; var,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rcx	 ; tmp269, _17
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rsi, %r8	 ; status,
	movq	%rbx, %rdx	 ; <retval>,
	call	emit_attribute_access	 ;
	movq	%rax, %rbx	 ; tmp270, <retval>
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	jmp	.L109	 ;
.L113:
 ; D:\TC\temp\codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ebx	 ;, _6
	je	.L159	 ;,
 ; D:\TC\temp\codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ebx	 ;, _6
	je	.L160	 ;,
 ; D:\TC\temp\codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ebx	 ;, _6
	jne	.L134	 ;,
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rcx), %rbx	 ; variable_access_101(D)->base, <retval>
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L161	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rbx)	 ;, _52->type
	jne	.L137	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rbx), %r12	 ; _52->content.attr_name, callee_name
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r12, %r12	 ; callee_name
	je	.L137	 ;,
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r12), %eax	 ; _56->kind, tmp311
	subl	$1, %eax	 ;, tmp238
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	 ;, tmp238
	jbe	.L162	 ;,
.L137:
 ; D:\TC\temp\codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rsi, %rdx	 ; status,
	movq	%rbx, %rcx	 ; <retval>,
	call	codegen_variable_access	 ;
	movq	%rax, %rbx	 ; tmp292, <retval>
 ; D:\TC\temp\codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L163	 ;,
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %eax	 ; callee_110->kind, _66
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %eax	 ;, _66
	je	.L164	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%eax, %eax	 ; _66
	jne	.L144	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rbx), %rax	 ; callee_110->value.variable, _68
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	 ; _68
	je	.L144	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r12	 ; _68->original_name, callee_name
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r12, %r12	 ; callee_name
	je	.L144	 ;,
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r12), %eax	 ; _69->kind, tmp312
	subl	$1, %eax	 ;, tmp242
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp242
	jbe	.L138	 ;,
.L144:
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	movq	24(%rax), %r9	 ; _72->_stderr,
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp245
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:801:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L109	 ;
.L159:
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_101(D)->base, _23
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rcx, %rcx	 ; _23
	je	.L124	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rdi), %rdi	 ; variable_access_101(D)->content.attr_name, _24
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rdi, %rdi	 ; _24
	je	.L124	 ;,
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rdi), %eax	 ; _24->kind, tmp310
	subl	$1, %eax	 ;, tmp216
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	 ;, tmp216
	jbe	.L165	 ;,
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	 ;
	movq	%rax, %rbx	 ; tmp277, <retval>
 ; D:\TC\temp\codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L166	 ;,
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rsi, %r8	 ; status,
	movq	%rdi, %rdx	 ; _24,
	movq	%rax, %rcx	 ; <retval>,
	call	emit_attribute_access	 ;
	movq	%rax, %rbx	 ; tmp279, <retval>
	jmp	.L109	 ;
.L124:
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	movq	24(%rax), %r9	 ; _25->_stderr,
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp215
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:731:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L109	 ;
.L165:
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; _24->type, _24->type
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rdi, %rcx	 ; _24,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp275, _30
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp276, <retval>
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	jmp	.L109	 ;
.L166:
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	movq	24(%rax), %r9	 ; _31->_stderr,
	movl	$61, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp220
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:739:             return NULL;
	jmp	.L109	 ;
.L160:
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_101(D)->base, _33
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rcx, %rcx	 ; _33
	je	.L129	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rdi)	 ;, variable_access_101(D)->content.index
	je	.L129	 ;,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	 ;
	movq	%rax, %rcx	 ; tmp281, _37
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp282, sequence
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rdi), %rcx	 ; variable_access_101(D)->content.index, variable_access_101(D)->content.index
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ; tmp283, _39
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp284, index
 ; D:\TC\temp\codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%rbp, %rbp	 ; sequence
	je	.L152	 ;,
	testq	%rax, %rax	 ; index
	je	.L152	 ;,
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp230
	movq	(%rax), %rcx	 ; name_int, element_type
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%rbp), %rax	 ; sequence_146->type, _45
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp231
	movq	(%rdx), %rdx	 ; name_float, name_float.13_46
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rdx, %rax	 ; name_float.13_46, _45
	je	.L133	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp232
	movq	(%rdx), %rdx	 ; name_bool, name_float.13_46
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rdx, %rax	 ; name_float.13_46, _45
	je	.L133	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp233
	movq	(%rdx), %rdx	 ; name_string, name_float.13_46
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	cmpq	%rdx, %rax	 ; name_float.13_46, _45
	cmovne	%rcx, %rdx	 ; name_float.13_46,, element_type, name_float.13_46
.L133:
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp286, _49
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp287, <retval>
 ; D:\TC\temp\codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	movq	%rdi, %r9	 ; index,
	movq	%rbp, %r8	 ; sequence,
	movq	%rax, %rdx	 ; <retval>,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp288, inst
 ; D:\TC\temp\codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_102(D)->current_block, status_102(D)->current_block
	movq	8(%rax), %rcx	 ; _50->instructions, _50->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:761:         result->is_get = true;
	movb	$1, 20(%rbx)	 ;, result_153->is_get
 ; D:\TC\temp\codegen.c:762:         return result;
	jmp	.L109	 ;
.L129:
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	movq	24(%rax), %r9	 ; _35->_stderr,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp222
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:747:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L109	 ;
.L152:
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	movq	24(%rax), %r9	 ; _43->_stderr,
	movl	$68, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp229
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:753:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L109	 ;
.L161:
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	movq	24(%rax), %r9	 ; _53->_stderr,
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp237
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:768:             return NULL;
	jmp	.L109	 ;
.L162:
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rbx), %rcx	 ; _52->base, _59
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rcx, %rcx	 ; _59
	je	.L138	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 16(%rcx)	 ;, _59->type
	jne	.L139	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rcx), %rax	 ; _59->content.name, _61
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _61
	je	.L139	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, _61->kind
	je	.L138	 ;,
.L139:
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable_access	 ;
	movq	%rax, %rcx	 ; tmp290, _63
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ; tmp291, receiver
 ; D:\TC\temp\codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	 ; receiver
	je	.L167	 ;,
 ; D:\TC\temp\codegen.c:806:             emit_param_instruction(receiver, status);
	movq	%rsi, %rdx	 ; status,
	call	emit_param_instruction	 ;
 ; D:\TC\temp\codegen.c:807:             ++argument_count;
	movl	$1, %ebp	 ;, argument_count
.L141:
 ; D:\TC\temp\codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rcx	 ; variable_access_101(D)->content.args, variable_access_101(D)->content.args
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp295, args
.L145:
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rdi, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp299, arg_expr
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L168	 ;,
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ; tmp296, _75
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbx	 ; tmp297, <retval>
 ; D:\TC\temp\codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L169	 ;,
 ; D:\TC\temp\codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; <retval>,
	call	emit_param_instruction	 ;
 ; D:\TC\temp\codegen.c:818:             ++argument_count;
	addq	$1, %rbp	 ;, argument_count
	jmp	.L145	 ;
.L167:
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	movl	$0, %ebp	 ;, argument_count
	jmp	.L141	 ;
.L163:
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	movq	24(%rax), %r9	 ; _64->_stderr,
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp241
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:789:                 return NULL;
	jmp	.L109	 ;
.L164:
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rbx), %rax	 ; callee_110->value.subroutine, _67
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	 ; _67
	je	.L144	 ;,
 ; D:\TC\temp\codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r12	 ; _67->original_name, callee_name
 ; D:\TC\temp\codegen.c:799:         if (callee_name == NULL) {
	testq	%r12, %r12	 ; callee_name
	je	.L144	 ;,
.L138:
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	movl	$0, %ebp	 ;, argument_count
	jmp	.L141	 ;
.L169:
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	movq	24(%rax), %r9	 ; _76->_stderr,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp248
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:815:                 return NULL;
	jmp	.L109	 ;
.L168:
 ; D:\TC\temp\codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp300, <retval>
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	(%r12), %rdx	 ; callee_name_176->type, _78
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rdx, %rdx	 ; _78
	je	.L148	 ;,
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp249
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	(%rax), %rdx	 ; name_void, _78
	je	.L148	 ;,
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp301, _80
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp302, <retval>
.L148:
 ; D:\TC\temp\codegen.c:824:         long long count = (long long)argument_count;
	movq	%rbp, 40(%rsp)	 ; argument_count, count
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rdx	 ; callee_name_176->type, callee_name_176->type
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%r12, %rcx	 ; callee_name,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp303, _83
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdi	 ; tmp304, callee_arg
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	leaq	40(%rsp), %rdx	 ;, tmp251
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp305
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	%rdi, %r8	 ; callee_arg,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp306, call_inst
 ; D:\TC\temp\codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rsi), %rax	 ; status_102(D)->current_block, status_102(D)->current_block
	movq	8(%rax), %rcx	 ; _85->instructions, _85->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:828:         return result;
	jmp	.L109	 ;
.L134:
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movq	24(%rax), %rcx	 ; _87->_stderr, _87->_stderr
	movl	%ebx, %r8d	 ; _6,
	leaq	.LC23(%rip), %rdx	 ;, tmp255
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:832:     return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L109	 ;
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC26:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_38(D)->type, _1
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L171	 ;,
	movq	%rdx, %rsi	 ; tmp154, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L173(%rip), %r8	 ;, tmp120
	movslq	(%r8,%rbx,4), %rax	 ;, tmp122
	addq	%r8, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L173:
	.long	.L181-.L173
	.long	.L180-.L173
	.long	.L179-.L173
	.long	.L178-.L173
	.long	.L177-.L173
	.long	.L176-.L173
	.long	.L175-.L173
	.long	.L174-.L173
	.long	.L172-.L173
	.text
.L181:
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	strtoll	 ;
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 40(%rsp)	 ; tmp155, MEM[(long long int *)_95]
 ; D:\TC\temp\codegen.c:658:             return create_arg(ARG_INT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp126
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp156, <retval>
.L170:
 ; D:\TC\temp\codegen.c:703: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L180:
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$0, %edx	 ;,
	call	strtod	 ;
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 40(%rsp)	 ; tmp157, MEM[(double *)_95]
 ; D:\TC\temp\codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp128
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp158, <retval>
	jmp	.L170	 ;
.L179:
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp159, <retval>
	jmp	.L170	 ;
.L178:
 ; D:\TC\temp\codegen.c:666:             bool t = true;
	movb	$1, 40(%rsp)	 ;, MEM[(char *)_95]
 ; D:\TC\temp\codegen.c:667:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp130
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp160, <retval>
	jmp	.L170	 ;
.L177:
 ; D:\TC\temp\codegen.c:670:             bool t = false;
	movb	$0, 40(%rsp)	 ;, MEM[(char *)_95]
 ; D:\TC\temp\codegen.c:671:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp131
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp161, <retval>
	jmp	.L170	 ;
.L176:
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
	call	codegen_expression	 ;
	movq	%rax, %rbx	 ; tmp162, <retval>
	jmp	.L170	 ;
.L175:
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	codegen_primary	 ;
	movq	%rax, %rcx	 ; tmp163, _9
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp164, operand
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp134
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; name_bool, name_bool
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp165, _11
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp166, <retval>
 ; D:\TC\temp\codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; operand,
	movq	%rax, %rdx	 ; <retval>,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp167, inst
 ; D:\TC\temp\codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:679:             return temp;
	jmp	.L170	 ;
.L174:
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	codegen_primary	 ;
	movq	%rax, %rcx	 ; tmp168, _15
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp169, operand
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp170, _17
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp171, <retval>
 ; D:\TC\temp\codegen.c:685:             long long zero_int = 0;
	movq	$0, 32(%rsp)	 ;, zero_int
 ; D:\TC\temp\codegen.c:686:             double neg_one_float = -1.0;
	movq	.LC24(%rip), %rax	 ;, tmp180
	movq	%rax, 40(%rsp)	 ; tmp180, MEM[(double *)_95]
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_44->type, _18
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp141
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	cmpq	(%rdx), %rax	 ; name_int, _18
	je	.L188	 ;,
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp143
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	cmpq	(%rdx), %rax	 ; name_float, _18
	je	.L189	 ;,
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
	leaq	.LC25(%rip), %rdx	 ;, tmp146
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:693:                 return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L170	 ;
.L188:
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	32(%rsp), %rdx	 ;, tmp142
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp172
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp173, inst
	jmp	.L184	 ;
.L189:
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	40(%rsp), %rdx	 ;, tmp144
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp174
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp175, inst
.L184:
 ; D:\TC\temp\codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:696:             return temp;
	jmp	.L170	 ;
.L172:
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.var, primary_38(D)->value.var
	call	codegen_variable_access	 ;
	movq	%rax, %rbx	 ; tmp177, <retval>
	jmp	.L170	 ;
.L171:
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC26(%rip), %rdx	 ;, tmp151
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:701:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L170	 ;
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp143, expression
	movq	%rdx, %rbx	 ; tmp144, status
 ; D:\TC\temp\codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rcx)	 ;, expression_32(D)->operator
	je	.L218	 ;,
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_32(D)->right, expression_32(D)->right
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ; tmp146, _4
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp147, right
 ; D:\TC\temp\codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rsi), %ebp	 ; expression_32(D)->operator, _63
 ; D:\TC\temp\codegen.c:51:     switch (op) {
	cmpl	$18, %ebp	 ;, _63
	ja	.L193	 ;,
	movl	%ebp, %eax	 ; _63, _63
	leaq	.L195(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%rax,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L195:
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L214-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L197-.L195
	.long	.L200-.L195
	.long	.L199-.L195
	.long	.L198-.L195
	.long	.L214-.L195
	.long	.L196-.L195
	.long	.L194-.L195
	.text
.L218:
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_32(D)->prim_left, expression_32(D)->prim_left
	call	codegen_primary	 ;
	movq	%rax, %rsi	 ; tmp145, <retval>
	jmp	.L190	 ;
.L196:
 ; D:\TC\temp\codegen.c:59:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %ebp	 ;, _63
.L197:
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_32(D)->expr_left, expression_32(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rdi	 ; tmp160, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_32(D)->operator, expression_32(D)->operator
	subl	$13, %eax	 ;, tmp138
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp138
	jbe	.L212	 ;,
.L209:
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_78->type, left_78->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp156, _19
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp157, <retval>
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp158
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _63,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp159, inst
	jmp	.L211	 ;
.L194:
 ; D:\TC\temp\codegen.c:61:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %ebp	 ;, _63
	jmp	.L197	 ;
.L193:
 ; D:\TC\temp\codegen.c:72:         default: return INST_NONE;
	movl	$25, %ebp	 ;, _63
	jmp	.L197	 ;
.L199:
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_32(D)->expr_left, expression_32(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rdi	 ; tmp148, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_32(D)->operator, expression_32(D)->operator
	subl	$13, %eax	 ;, tmp126
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp126
	ja	.L215	 ;,
	movl	$0, %ebp	 ;, _63
.L212:
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_76->type, left_76->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp149, _10
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp150, <retval>
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp151
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _63,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp152, inst
 ; D:\TC\temp\codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
.L213:
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rdi)	 ;, left_77->kind
	jne	.L219	 ;,
.L210:
 ; D:\TC\temp\codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp154, inst
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_77->is_get
	jne	.L220	 ;,
.L211:
 ; D:\TC\temp\codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
.L190:
 ; D:\TC\temp\codegen.c:653: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L219:
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	24(%rax), %r9	 ; _15->_stderr,
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
	jmp	.L210	 ;
.L220:
 ; D:\TC\temp\codegen.c:645:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
	jmp	.L211	 ;
.L215:
	movl	$0, %ebp	 ;, _63
	jmp	.L209	 ;
.L198:
 ; D:\TC\temp\codegen.c:55:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %ebp	 ;, _63
	jmp	.L197	 ;
.L214:
 ; D:\TC\temp\codegen.c:51:     switch (op) {
	movl	$2, %ebp	 ;, _63
	jmp	.L197	 ;
.L200:
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_32(D)->expr_left, expression_32(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rdi	 ; tmp161, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_32(D)->operator, expression_32(D)->operator
	subl	$13, %eax	 ;, tmp141
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp141
	ja	.L221	 ;,
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%r12, %rsi	 ; right, <retval>
	jmp	.L213	 ;
.L221:
 ; D:\TC\temp\codegen.c:62:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %ebp	 ;, _63
	jmp	.L209	 ;
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %r12	 ; tmp181, if_
	movq	%rdx, %rbx	 ; tmp182, status
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp183, then_label
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp184, else_label
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r12), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp185
	je	.L223	 ;,
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:457:         end_label = else_label;
	movq	%rsi, %r15	 ; else_label, end_label
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp186
	jne	.L224	 ;,
.L223:
 ; D:\TC\temp\codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r15	 ; tmp187, end_label
.L224:
 ; D:\TC\temp\codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r15, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r13	 ; tmp188, end_block_arg
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%r12), %rcx	 ; if__61(D)->condition, if__61(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rbp	 ; tmp189, condition
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp190, _6
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rdi, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp191
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %r9	 ; _6,
	movq	%rbp, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp192, inst
 ; D:\TC\temp\codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:466:     Block* then_block = create_block(then_label);
	movq	%rdi, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp193, then_block
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _10->blocks, _10->blocks
	movq	%rdi, %rdx	 ; then_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:468:     status->current_block = then_block;
	movq	%rdi, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; if__61(D)->body, if__61(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp194, then_statements
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L225	 ;
.L226:
 ; D:\TC\temp\codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L225:
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L226	 ;,
 ; D:\TC\temp\codegen.c:475:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp196, jump_to_end
 ; D:\TC\temp\codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r12), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp197
	je	.L239	 ;,
.L227:
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp213
	je	.L240	 ;,
.L233:
 ; D:\TC\temp\codegen.c:526:     Block* end_block = create_block(end_label);
	movq	%r15, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp218, end_block
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _40->blocks, _40->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:528:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:529: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L239:
 ; D:\TC\temp\codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r12), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp198, elif_list
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L228	 ;
.L241:
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:493:                 else_label = end_label;
	testb	%al, %al	 ; tmp204
	cmovne	%r15, %rsi	 ; else_label,, end_label, else_label
	jmp	.L229	 ;
.L231:
 ; D:\TC\temp\codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L230:
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, elif_statement
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L231	 ;,
 ; D:\TC\temp\codegen.c:506:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp211, jump_to_end
 ; D:\TC\temp\codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _31->instructions, _31->instructions
	call	list_append	 ;
.L228:
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r14, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp212, elif
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L227	 ;,
 ; D:\TC\temp\codegen.c:484:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp199, else_if_block
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	movq	%rsi, %rdx	 ; else_if_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:486:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp200, then_label
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp201, else_label
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	(%rdi), %rcx	 ; elif_90->condition, elif_90->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, 40(%rsp)	 ; tmp202, %sfp
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r14, %rcx	 ; elif_list,
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp203
	jne	.L241	 ;,
.L229:
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, 32(%rsp)	 ; tmp205, %sfp
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp206
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	32(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp207, inst
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:497:             then_block = create_block(then_label);
	movq	%rbp, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp208, then_block
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _28->blocks, _28->blocks
	movq	%rbp, %rdx	 ; then_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:499:             status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rdi), %rcx	 ; elif_90->body, elif_90->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp209, elif_statements
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L230	 ;
.L240:
 ; D:\TC\temp\codegen.c:513:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp214, else_block
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	movq	%rsi, %rdx	 ; else_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:515:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp215, else_statements
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L234	 ;
.L235:
 ; D:\TC\temp\codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L234:
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp216, else_statement
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L235	 ;,
 ; D:\TC\temp\codegen.c:522:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp217, jump_to_end
 ; D:\TC\temp\codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _38->instructions, _38->instructions
	call	list_append	 ;
	jmp	.L233	 ;
	.section .rdata,"dr"
	.align 8
.LC28:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC29:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC30:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_30(D)->type, _1
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L243	 ;,
	movq	%rdx, %rsi	 ; tmp148, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L245(%rip), %rdx	 ;, tmp118
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L245:
	.long	.L252-.L245
	.long	.L251-.L245
	.long	.L250-.L245
	.long	.L249-.L245
	.long	.L248-.L245
	.long	.L247-.L245
	.long	.L246-.L245
	.long	.L244-.L245
	.text
.L252:
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.expr, statement_30(D)->stmt.expr
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
.L242:
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L251:
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.var, statement_30(D)->stmt.var
	movl	$118, %r8d	 ;,
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L242	 ;
.L250:
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.if_stmt, statement_30(D)->stmt.if_stmt
	movq	%rsi, %rdx	 ; status,
	call	codegen_if	 ;
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	.L242	 ;
.L249:
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.while_stmt, statement_30(D)->stmt.while_stmt
	movq	%rsi, %rdx	 ; status,
	call	codegen_while	 ;
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	.L242	 ;
.L248:
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.for_stmt, statement_30(D)->stmt.for_stmt
	movq	%rsi, %rdx	 ; status,
	call	codegen_for	 ;
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	.L242	 ;
.L247:
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.return_expr, statement_30(D)->stmt.return_expr
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rdx	 ; tmp149, return_value
 ; D:\TC\temp\codegen.c:420:             Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp150, inst
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:422:             break;
	jmp	.L242	 ;
.L246:
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp151
	jne	.L254	 ;,
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rsi), %rax	 ; status_31(D)->end_labels, status_31(D)->end_labels
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _12->tail, _12->tail
	movq	8(%rax), %rdx	 ; _13->content, label
 ; D:\TC\temp\codegen.c:427:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L254	 ;,
 ; D:\TC\temp\codegen.c:428:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp152, inst
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:430:                     break;
	jmp	.L242	 ;
.L254:
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	24(%rax), %r9	 ; _16->_stderr,
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp137
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:434:             break;
	jmp	.L242	 ;
.L244:
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp154
	jne	.L255	 ;,
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rsi), %rax	 ; status_31(D)->start_labels, status_31(D)->start_labels
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _20->tail, _20->tail
	movq	8(%rax), %rdx	 ; _21->content, label
 ; D:\TC\temp\codegen.c:438:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L255	 ;,
 ; D:\TC\temp\codegen.c:439:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:\TC\temp\codegen.c:440:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:441:                     break;
	jmp	.L242	 ;
.L255:
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	24(%rax), %r9	 ; _24->_stderr,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rcx	 ;, tmp144
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:445:             break;
	jmp	.L242	 ;
.L243:
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movq	24(%rax), %rcx	 ; _26->_stderr, _26->_stderr
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC30(%rip), %rdx	 ;, tmp146
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:450: }
	jmp	.L242	 ;
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp171, for_
	movq	%rdx, %rbx	 ; tmp172, status
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__53(D)->initializer, _1
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L258	 ;,
 ; D:\TC\temp\codegen.c:533:         codegen_variable(for_->initializer, status, VAR_VAR);
	movl	$118, %r8d	 ;,
	call	codegen_variable	 ;
.L258:
 ; D:\TC\temp\codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp173, condition_label
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r13	 ; tmp174, body_label
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp175, end_label
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L259	 ;,
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp176, _3
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp177, inst
 ; D:\TC\temp\codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:542:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp178, condition_block
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	movq	%rsi, %rdx	 ; condition_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:544:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; condition_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%rdi), %rcx	 ; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rsi	 ; tmp179, condition
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp180, _9
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp181
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _9,
	movq	%rsi, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp182, inst
 ; D:\TC\temp\codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L260:
 ; D:\TC\temp\codegen.c:555:     Block* body_block = create_block(body_label);
	movq	%r13, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp185, body_block
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _16->blocks, _16->blocks
	movq	%rsi, %rdx	 ; body_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:557:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; body_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r14	 ; tmp186, increment_label
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__53(D)->increment
	je	.L261	 ;,
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp187, _19
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_append	 ;
.L262:
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp190, _26
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__53(D)->body, for__53(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp191, body_statements
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L264	 ;
.L259:
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp183, _13
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp184, inst
 ; D:\TC\temp\codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
	jmp	.L260	 ;
.L261:
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L263	 ;,
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp188, _22
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_append	 ;
	jmp	.L262	 ;
.L263:
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp189, _24
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_append	 ;
	jmp	.L262	 ;
.L265:
 ; D:\TC\temp\codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L264:
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp192, statement
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L265	 ;,
 ; D:\TC\temp\codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__53(D)->increment
	je	.L266	 ;,
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp193, _32
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp194, inst
 ; D:\TC\temp\codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:577:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp195, increment_block
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	movq	%rsi, %rdx	 ; increment_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:579:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; increment_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%rdi), %rcx	 ; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
.L266:
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp196, _38
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L269	 ;,
.L267:
 ; D:\TC\temp\codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _41->instructions, _41->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:588:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp200, end_block
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _43->blocks, _43->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:590:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:591: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L269:
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp198, _40
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp199, inst
	jmp	.L267	 ;
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp138, while_
	movq	%rdx, %rbx	 ; tmp139, status
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp140, condition_label
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp141, _1
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp142, inst
 ; D:\TC\temp\codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:597:     Block* condition_block = create_block(condition_label);
	movq	%rdi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp143, condition_block
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	movq	%rbp, %rdx	 ; condition_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:599:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	 ; condition_block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp144, body_label
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp145, end_label
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	(%rsi), %rcx	 ; while__42(D)->condition, while__42(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %r13	 ; tmp146, condition
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp147, _7
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp148
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _7,
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp149, inst
 ; D:\TC\temp\codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:607:     Block* body_block = create_block(body_label);
	movq	%r12, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp150, body_block
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	movq	%r12, %rdx	 ; body_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:609:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; body_block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp151, _13
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp152, _15
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__42(D)->body, while__42(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp153, body_statements
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L271	 ;
.L272:
 ; D:\TC\temp\codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L271:
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp154, statement
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L272	 ;,
 ; D:\TC\temp\codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp155, _20
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp156, inst
 ; D:\TC\temp\codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:623:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp157, end_block
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _23->blocks, _23->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:625:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:626: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp112, function
	movq	%rdx, %rbx	 ; tmp113, status
 ; D:\TC\temp\codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rcx), %rdx	 ; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rcx), %rcx	 ; function_16(D)->name, function_16(D)->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp114, subroutine
 ; D:\TC\temp\codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp115, parameters
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L275	 ;
.L276:
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp116, _8
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
	call	list_append	 ;
.L275:
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L276	 ;,
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp118, _10
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp119, block
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:332:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rbp), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp120, statements
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L277	 ;
.L278:
 ; D:\TC\temp\codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L277:
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp121, statement
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L278	 ;,
 ; D:\TC\temp\codegen.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:340: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp112, method
	movq	%rdx, %rbx	 ; tmp113, status
 ; D:\TC\temp\codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rcx), %rdx	 ; method_16(D)->return_type, method_16(D)->return_type
	movq	(%rcx), %rcx	 ; method_16(D)->name, method_16(D)->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp114, subroutine
 ; D:\TC\temp\codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rcx	 ; method_16(D)->parameters, method_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp115, parameters
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L281	 ;
.L282:
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp116, _8
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
	call	list_append	 ;
.L281:
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L282	 ;,
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp118, _10
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp119, block
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:354:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rbp), %rcx	 ; method_16(D)->body, method_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp120, statements
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L283	 ;
.L284:
 ; D:\TC\temp\codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L283:
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp121, statement
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L284	 ;,
 ; D:\TC\temp\codegen.c:361:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:362: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC31:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp106, class
	movq	%rdx, %rdi	 ; tmp107, status
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_14(D)->members, class_14(D)->members
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp108, members
 ; D:\TC\temp\codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%rbp), %r12	 ; class_14(D)->name, _2
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp109, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp110, table_28->attributes
 ; D:\TC\temp\codegen.c:16:     table->name = name;
	movq	%r12, 8(%rbx)	 ; _2, table_28->name
 ; D:\TC\temp\codegen.c:17:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_28->size
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	24(%rbp), %rax	 ; class_14(D)->size, _3
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	%rax, 16(%rbx)	 ; _3, table_28->size
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rcx	 ; _4->attribute_tables, _4->attribute_tables
	movq	%rbx, %rdx	 ; table,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	leaq	.LC31(%rip), %rbp	 ;, tmp105
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L287	 ;
.L288:
 ; D:\TC\temp\codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_23->content.method, member_23->content.method
	movq	%rdi, %rdx	 ; status,
	call	codegen_method	 ;
.L287:
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L295	 ;,
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_23->type, _6
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	testl	%ebx, %ebx	 ; _6
	je	.L288	 ;,
	cmpl	$1, %ebx	 ;, _6
	je	.L289	 ;,
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	movl	%ebx, %r8d	 ; _6,
	movq	%rbp, %rdx	 ; tmp105,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:380:                 break;
	jmp	.L287	 ;
.L289:
 ; D:\TC\temp\codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_23->content.variable, member_23->content.variable
	movl	$97, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:377:                 break;
	jmp	.L287	 ;
.L295:
 ; D:\TC\temp\codegen.c:383: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC32:
	.ascii "main\0"
	.text
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp113, code
 ; D:\TC\temp\codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbp	 ; tmp114, <retval>
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	movq	%rax, 0(%rbp)	 ; tmp115, tac_29->attribute_tables
 ; D:\TC\temp\codegen.c:78:     tac->entry_point = NULL;
	movq	$0, 8(%rbp)	 ;, tac_29->entry_point
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	movq	%rax, 16(%rbp)	 ; tmp116, tac_29->global_vars
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	movq	%rax, 24(%rbp)	 ; tmp117, tac_29->subroutines
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp118, status
 ; D:\TC\temp\codegen.c:85:     status->tac = tac;
	movq	%rbp, (%rax)	 ; <retval>, status_26->tac
 ; D:\TC\temp\codegen.c:86:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	 ;, status_26->current_subroutine
 ; D:\TC\temp\codegen.c:87:     status->current_block = NULL;
	movq	$0, 16(%rax)	 ;, status_26->current_block
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	movq	%rax, 24(%rsi)	 ; tmp119, status_26->end_labels
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	movq	%rax, 32(%rsi)	 ; tmp120, status_26->start_labels
 ; D:\TC\temp\codegen.c:90:     status->attr_count = 0;
	movq	$0, 40(%rsi)	 ;, status_26->attr_count
 ; D:\TC\temp\codegen.c:91:     status->param_count = 0;
	movq	$0, 48(%rsi)	 ;, status_26->param_count
 ; D:\TC\temp\codegen.c:92:     status->var_count = 0;
	movq	$0, 56(%rsi)	 ;, status_26->var_count
 ; D:\TC\temp\codegen.c:93:     status->temp_count = 0;
	movq	$0, 64(%rsi)	 ;, status_26->temp_count
 ; D:\TC\temp\codegen.c:94:     status->block_count = 0;
	movq	$0, 72(%rsi)	 ;, status_26->block_count
 ; D:\TC\temp\codegen.c:95:     status->subroutine_count = 0;
	movq	$0, 80(%rsi)	 ;, status_26->subroutine_count
 ; D:\TC\temp\codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rcx	 ; code_17(D)->members, code_17(D)->members
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp121, members
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC32(%rip), %r12	 ;, tmp112
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L297	 ;
.L304:
 ; D:\TC\temp\codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.function, code_member_21->content.function
	movq	%rsi, %rdx	 ; status,
	call	codegen_function	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	 ; code_member_21->content.function, code_member_21->content.function
	movq	(%rax), %rbx	 ; _4->name, _5
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rcx	 ; _5->name, _5->name
	movq	%r12, %rdx	 ; tmp112,
	call	strcmp	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp122
	jne	.L297	 ;,
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%rbp)	 ; _5, tac_29->entry_point
	jmp	.L297	 ;
.L305:
 ; D:\TC\temp\codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	codegen_class	 ;
.L297:
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp123, code_member
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L303	 ;,
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L304	 ;,
 ; D:\TC\temp\codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L305	 ;,
 ; D:\TC\temp\codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L297	 ;,
 ; D:\TC\temp\codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.import, code_member_21->content.import
	movq	%rsi, %r8	 ; status,
	movq	%rbp, %rdx	 ; <retval>,
	call	codegen_import	 ;
	jmp	.L297	 ;
.L303:
 ; D:\TC\temp\codegen.c:308: }
	movq	%rbp, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC24:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
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
