	.file	"D:\\TC\\temp\\codegen.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; D:\TC\temp\codegen.c:21:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L5	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_int
	je	.L9	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_float
	je	.L9	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_string
	je	.L9	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp97
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rax)	 ; type, name_bool
	je	.L7	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp98
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rax)	 ; type, name_void
	je	.L7	 ;,
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movl	32(%rcx), %eax	 ; type_13(D)->kind,
	testl	%eax, %eax	 ;
	jne	.L4	 ;,
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L7:
 ; D:\TC\temp\codegen.c:26:         return 1;
	movl	$1, %eax	 ;, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L5:
 ; D:\TC\temp\codegen.c:22:         return 0;
	xorl	%eax, %eax	 ; <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
 ; D:\TC\temp\codegen.c:20: static size_t get_type_size(Symbol* type) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_13(D)->name, _8
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC0(%rip), %rdx	 ;, tmp101
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	movq	%rbx, %r8	 ; _8,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:31: }
	addq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:24:         return 8;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\temp\codegen.c:31: }
	popq	%rbx	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:\TC\temp\codegen.c:24:         return 8;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\temp\codegen.c:31: }
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp113, original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:113: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp114, type
	pushq	%rdi	 ;
	movq	%r9, %rdi	 ; tmp116, status
	pushq	%rsi	 ;
	movl	%r8d, %esi	 ; tmp115, kind
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; original_name, var_19->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp117, <retval>
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	leal	-97(%rsi), %eax	 ;,
	cmpl	$21, %eax	 ;, tmp95
	ja	.L14	 ;,
	leaq	.L16(%rip), %rdx	 ;, tmp97
	movslq	(%rdx,%rax,4), %rax	 ;, tmp99
	addq	%rdx, %rax	 ; tmp97, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L16:
	.long	.L21-.L16
	.long	.L20-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L19-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L18-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L14-.L16
	.long	.L17-.L16
	.long	.L14-.L16
	.long	.L15-.L16
	.text
	.p2align 4,,10
	.p2align 3
.L14:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp102
	movl	$32, %edx	 ;,
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _13, var_19->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp118, _13
.L22:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	%esi, %r8d	 ; kind,
	leaq	.LC2(%rip), %rdx	 ;, tmp110
	call	sprintf	 ;
.L25:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rbx)	 ; type, var_19->type
 ; D:\TC\temp\codegen.c:133: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rdi), %r12	 ; status_23(D)->attr_count, id
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r12), %rax	 ;, tmp103
	movq	%rax, 40(%rdi)	 ; tmp103, status_23(D)->attr_count
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp109
	movl	$32, %edx	 ;,
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _13, var_19->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp119, _13
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	 ;, id
	je	.L22	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r12, %r9	 ; id,
	movl	%esi, %r8d	 ; kind,
	leaq	.LC3(%rip), %rdx	 ;, tmp111
	call	sprintf	 ;
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L20:
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rdi), %r12	 ; status_23(D)->block_count, id
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	 ;, tmp107
	movq	%rax, 72(%rdi)	 ; tmp107, status_23(D)->block_count
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L19:
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rdi), %r12	 ; status_23(D)->subroutine_count, id
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r12), %rax	 ;, tmp108
	movq	%rax, 80(%rdi)	 ; tmp108, status_23(D)->subroutine_count
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L18:
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rdi), %r12	 ; status_23(D)->param_count, id
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r12), %rax	 ;, tmp104
	movq	%rax, 48(%rdi)	 ; tmp104, status_23(D)->param_count
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L17:
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rdi), %r12	 ; status_23(D)->temp_count, id
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r12), %rax	 ;, tmp106
	movq	%rax, 64(%rdi)	 ; tmp106, status_23(D)->temp_count
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L15:
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rdi), %r12	 ; status_23(D)->var_count, id
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	 ;, tmp105
	movq	%rax, 56(%rdi)	 ; tmp105, status_23(D)->var_count
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L23	 ;
	.p2align 4
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rcx, %rcx	 ; value
	je	.L30	 ;,
 ; D:\TC\temp\codegen.c:283: static void emit_param_instruction(Arg* value, TACStatus* status) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp105, status
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rdx, %rdx	 ; status
	je	.L27	 ;,
	movq	%rcx, %rbx	 ; tmp104, value
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rcx), %rcx	 ; value_4(D)->type, value_4(D)->type
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, %rbp	 ; tmp106, _10
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	 ; _10, arg_16->value.int_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp107, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_16->kind
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp100
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_16->is_get
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rdi)	 ; name_int, arg_16->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	 ; value, inst_13->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp108, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_13->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_13->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_13->arg3
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_5(D)->current_block, status_5(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
 ; D:\TC\temp\codegen.c:289: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:\TC\temp\codegen.c:289: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L30:
	ret	
	.p2align 4
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp102, arg
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rcx, %rcx	 ; arg
	je	.L34	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_4(D)->is_get
	jne	.L39	 ;,
.L34:
 ; D:\TC\temp\codegen.c:195: }
	leaq	-32(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%rdx, %rsi	 ; tmp103, status
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_4(D)->type, arg_4(D)->type
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rsi, %r9	 ; status,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %r12	 ; tmp104, _10
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	 ; _10, tmp97
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	 ; _10->type, tmp97
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_16->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp105, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_16->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp97, MEM <vector(2) long unsigned int> [(void *)arg_16]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	 ; arg, inst_12->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp106, inst
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rdi, %rbx	 ; arg, arg
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_12->arg1
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$23, 24(%rax)	 ;, inst_12->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_12->arg3
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rsi), %rax	 ; status_7(D)->current_block, status_7(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:195: }
	leaq	-32(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC4:
	.ascii "<unknown>\0"
	.align 8
.LC5:
	.ascii "[warning] Invalid attribute access\12\0"
	.align 8
.LC6:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC7:
	.ascii "$a%zu\0"
	.text
	.p2align 4
	.def	emit_attribute_access;	.scl	3;	.type	32;	.endef
emit_attribute_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rcx, %rcx	 ; object
	je	.L61	 ;,
	movq	%rdx, %rbx	 ; tmp159, attr_name
	testq	%rdx, %rdx	 ; attr_name
	je	.L61	 ;,
 ; D:\TC\temp\codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	%r8, %rdx	 ; status,
	movq	%r8, %rdi	 ; tmp160, status
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp162, object_value
 ; D:\TC\temp\codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	 ; object_value
	je	.L43	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rax), %rsi	 ; object_value_22->type, class_type
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rsi, %rsi	 ; class_type
	je	.L46	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movl	32(%rsi), %eax	 ; _6->kind,
	testl	%eax, %eax	 ;
	jne	.L67	 ;,
.L46:
 ; D:\TC\temp\codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%rdi), %rax	 ; MEM[(struct TAC * *)status_20(D)], MEM[(struct TAC * *)status_20(D)]
	movq	(%rax), %rcx	 ; _86->attribute_tables, _86->attribute_tables
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp163, attribute_tables
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	jmp	.L47	 ;
	.p2align 4,,10
	.p2align 3
.L49:
 ; D:\TC\temp\codegen.c:9:         if (current->name == name)
	cmpq	%rsi, 8(%rax)	 ; class_type, current_90->name
	je	.L48	 ;,
.L47:
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%r13, %rcx	 ; attribute_tables,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	 ; current
	jne	.L49	 ;,
.L50:
 ; D:\TC\temp\codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rbx), %rdx	 ; attr_name_18(D)->type, attr_name_18(D)->type
	movq	%rdi, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rbx, %rcx	 ; attr_name,
	call	create_var	 ;
	movq	%rax, %r14	 ; tmp165, var
.L52:
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rbx), %rdx	 ; attr_name_18(D)->type, attr_name_18(D)->type
	movq	%rdi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp169, _10
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; _10, tmp141
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; _10->type, tmp141
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_52->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp170, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_52->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp141, MEM <vector(2) long unsigned int> [(void *)arg_52]
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp143
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _85->type, tmp143
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_39->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp171, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_39->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp143, MEM <vector(2) long unsigned int> [(void *)arg_39]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; object_value, inst_33->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp172, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$15, 24(%rax)	 ;, inst_33->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_33->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_33->arg3
 ; D:\TC\temp\codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_20(D)->current_block, status_20(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rbx)	 ;, arg_52->is_get
.L40:
 ; D:\TC\temp\codegen.c:281: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L48:
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rcx	 ; current_90->attributes, _66
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _66
	je	.L50	 ;,
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	list_copy	 ;
 ; D:\TC\temp\codegen.c:243:     size_t index = 0;
	xorl	%r13d, %r13d	 ; index
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	%rax, %r14	 ; tmp166, attrs
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	jmp	.L53	 ;
	.p2align 4,,10
	.p2align 3
.L55:
 ; D:\TC\temp\codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbx	 ; attr_70->var_name, attr_name
	je	.L54	 ;,
 ; D:\TC\temp\codegen.c:252:         ++index;
	addq	$1, %r13	 ;, index
.L53:
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%r14, %rcx	 ; attrs,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	 ; attr
	jne	.L55	 ;,
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp151
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	 ; attr_name, var_123->original_name
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp175, var
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	 ; attr_name_18(D)->type, attr_name_18(D)->type
	movq	%rax, 16(%r14)	 ; attr_name_18(D)->type, var_123->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; tmp176, var_123->name
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rsi, %rsi	 ; class_type
	je	.L68	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rsi), %rsi	 ; class_type_93->name, iftmp.19_78
.L59:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbx), %r15	 ; attr_name_18(D)->name, _79
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	%rsi, %r9	 ; iftmp.19_78,
	leaq	.LC6(%rip), %rdx	 ;, tmp138
	movq	24(%rax), %rcx	 ; _80->_stderr, _80->_stderr
	movq	%r13, 32(%rsp)	 ; index,
	movq	%r15, %r8	 ; _79,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	8(%r14), %rcx	 ; var_123->name, prephitmp_14
.L57:
	movq	%r13, %r8	 ; index,
	leaq	.LC7(%rip), %rdx	 ;, tmp139
	call	sprintf	 ;
 ; D:\TC\temp\codegen.c:261:     return var;
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L67:
 ; D:\TC\temp\codegen.c:272:     Symbol* class_type = NULL;
	xorl	%esi, %esi	 ; class_type
	jmp	.L46	 ;
	.p2align 4,,10
	.p2align 3
.L54:
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp149
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	 ; attr_name, var_7->original_name
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp173, var
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	 ; attr_name_18(D)->type, attr_name_18(D)->type
	movq	%rax, 16(%r14)	 ; attr_name_18(D)->type, var_7->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; prephitmp_14, var_7->name
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp174, prephitmp_14
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L61:
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp133
	movq	24(%rax), %r9	 ; _4->_stderr,
	call	fwrite	 ;
.L43:
 ; D:\TC\temp\codegen.c:267:         return NULL;
	xorl	%ebx, %ebx	 ; <retval>
	jmp	.L40	 ;
.L68:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC4(%rip), %rsi	 ;, iftmp.19_78
	jmp	.L59	 ;
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp112, tac
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rsi	 ; import_16(D)->name, _1
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rsi), %ebx	 ; _1->kind, _2
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L76	 ;,
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp104
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp104
	jbe	.L77	 ;,
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L72	 ;,
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp116, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rsi, %xmm1	 ; _1, _1
 ; D:\TC\temp\codegen.c:17:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_27->size
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%rbx, %rdx	 ; table,
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp117, tmp107
	punpcklqdq	%xmm1, %xmm0	 ; _1, tmp107
	movups	%xmm0, (%rbx)	 ; tmp107, MEM <vector(2) long unsigned int> [(void *)table_27]
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rdi), %rcx	 ; tac_20(D)->attribute_tables, tac_20(D)->attribute_tables
 ; D:\TC\temp\codegen.c:318: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L72:
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC8(%rip), %rdx	 ;, tmp110
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
 ; D:\TC\temp\codegen.c:318: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L77:
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L74:
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
 ; D:\TC\temp\codegen.c:318: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp115, _8
 ; D:\TC\temp\codegen.c:318: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L76:
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%r8, %r9	 ; status,
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movl	$118, %r8d	 ;,
	jmp	.L74	 ;
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC10:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp144, status
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp143, variable
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	%rdi, %r9	 ; status,
 ; D:\TC\temp\codegen.c:384: void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
	pushq	%rbx	 ;
	movl	%r8d, %ebx	 ; tmp145, type
	subq	$32, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_21(D)->type, variable_21(D)->type
	movq	8(%rcx), %rcx	 ; variable_21(D)->name, variable_21(D)->name
 ; D:\TC\temp\codegen.c:384: void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
	movaps	%xmm6, 32(%rsp)	 ;,
	movaps	%xmm7, 48(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp146, var
 ; D:\TC\temp\codegen.c:386:     switch (type) {
	leal	-97(%rbx), %eax	 ;,
	cmpl	$21, %eax	 ;, tmp117
	ja	.L79	 ;,
	leaq	.L81(%rip), %rcx	 ;, tmp119
	movslq	(%rcx,%rax,4), %rax	 ;, tmp121
	addq	%rcx, %rax	 ; tmp119, tmp122
	jmp	*%rax	 ; tmp122
	.section .rdata,"dr"
	.align 4
.L81:
	.long	.L85-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L84-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L83-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L79-.L81
	.long	.L80-.L81
	.long	.L79-.L81
	.long	.L80-.L81
	.text
	.p2align 4,,10
	.p2align 3
.L80:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rdi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	24(%rax), %rcx	 ;, _5->local_vars
.L88:
 ; D:\TC\temp\codegen.c:410: }
	movaps	32(%rsp), %xmm6	 ;,
	movaps	48(%rsp), %xmm7	 ;,
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:410: }
	movaps	32(%rsp), %xmm6	 ;,
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movl	%ebx, %r8d	 ; type,
 ; D:\TC\temp\codegen.c:410: }
	movaps	48(%rsp), %xmm7	 ;,
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
 ; D:\TC\temp\codegen.c:410: }
	leaq	-24(%rbp), %rsp	 ;,
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	leaq	.LC10(%rip), %rdx	 ;, tmp142
 ; D:\TC\temp\codegen.c:410: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:\TC\temp\codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	(%rax), %rcx	 ; _11->attribute_tables, _11->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rbx	 ; tmp147, attr_table
 ; D:\TC\temp\codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	%rbx, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _13->attribute_tables, _13->attribute_tables
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqu	(%rsi), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)]
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqa	%xmm6, %xmm7	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], vect__15.93
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rsi	 ; tmp148, attr
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	%xmm6, %rcx	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], tmp138
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	shufpd	$1, %xmm6, %xmm7	 ;, MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], vect__15.93
 ; D:\TC\temp\codegen.c:34:     attr->var_name = var_name;
	movups	%xmm7, (%rax)	 ; vect__15.93, MEM <vector(2) long unsigned int> [(struct Symbol * *)attr_36]
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	16(%rbx), %rax	 ; attr_table_31->size, attr_table_31->size
	movq	%rax, 16(%rsi)	 ; attr_table_31->size, attr_36->offset
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%rbx), %rcx	 ; attr_table_31->attributes, _41
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, 16(%rbx)	 ; tmp149, attr_table_31->size
 ; D:\TC\temp\codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _41
	jne	.L88	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:410: }
	movaps	32(%rsp), %xmm6	 ;,
	movaps	48(%rsp), %xmm7	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movq	24(%rax), %r9	 ; _42->_stderr,
 ; D:\TC\temp\codegen.c:410: }
	leaq	-24(%rbp), %rsp	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp140
 ; D:\TC\temp\codegen.c:410: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rdi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	16(%rax), %rcx	 ;, _9->global_vars
	jmp	.L88	 ;
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:\TC\temp\codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rdi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	16(%rax), %rcx	 ;, _3->parameters
	jmp	.L88	 ;
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "[warning] Invalid variable access input\12\0"
	.align 8
.LC12:
	.ascii "[warning] Variable access name is NULL\12\0"
	.align 8
.LC13:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
	.align 8
.LC14:
	.ascii "[warning] Invalid get-attribute access\12\0"
	.align 8
.LC15:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
	.align 8
.LC16:
	.ascii "[warning] Invalid get-sequence access\12\0"
	.align 8
.LC17:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
	.align 8
.LC18:
	.ascii "[warning] Invalid function call without callee\12\0"
	.align 8
.LC19:
	.ascii "[warning] Failed to generate callee for function call\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported callee in function call\12\0"
	.align 8
.LC21:
	.ascii "[warning] Failed to generate function call argument\12\0"
	.align 8
.LC22:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rcx, %rcx	 ; variable_access
	je	.L147	 ;,
	movq	%rdx, %rsi	 ; tmp337, status
	testq	%rdx, %rdx	 ; status
	je	.L147	 ;,
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rcx), %edi	 ; variable_access_103(D)->type, _6
	movq	%rcx, %rbx	 ; tmp336, variable_access
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%edi, %edi	 ; _6
	jne	.L93	 ;,
 ; D:\TC\temp\codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rcx), %r12	 ; variable_access_103(D)->content.name, name
 ; D:\TC\temp\codegen.c:712:         if (name == NULL) {
	testq	%r12, %r12	 ; name
	je	.L226	 ;,
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rdx), %rdx	 ; status_104(D)->current_subroutine, _211
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rdx, %rdx	 ; _211
	je	.L227	 ;,
 ; D:\TC\temp\codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rdx), %rcx	 ; _211->parameters, _211->parameters
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rcx, %rcx	 ; _211->parameters
	je	.L100	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rcx), %rax	 ; _212->head, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L100	 ;,
	.p2align 4,,10
	.p2align 3
.L103:
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	 ; current_457->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	 ; var
	je	.L101	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r12	 ; var_225->original_name, name
	je	.L223	 ;,
.L101:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	(%rax), %rax	 ; current_457->next, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L103	 ;,
.L100:
 ; D:\TC\temp\codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rdx), %rax	 ; _211->local_vars, _214
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	 ; _214
	je	.L107	 ;,
	.p2align 4,,10
	.p2align 3
.L104:
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	 ;* _214, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L107	 ;,
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	 ; current_194->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	 ; var
	je	.L104	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r12	 ; var_235->original_name, name
	jne	.L104	 ;,
	.p2align 4,,10
	.p2align 3
.L223:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _22, tmp277
	movhps	16(%rbx), %xmm0	 ;, tmp277
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp347, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp277,* <retval>
.L89:
 ; D:\TC\temp\codegen.c:833: }
	leaq	-40(%rbp), %rsp	 ;,
	movq	%r13, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L93:
 ; D:\TC\temp\codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %edi	 ;, _6
	je	.L228	 ;,
 ; D:\TC\temp\codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %edi	 ;, _6
	je	.L229	 ;,
 ; D:\TC\temp\codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %edi	 ;, _6
	jne	.L130	 ;,
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_103(D)->base, _52
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _52
	je	.L230	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rcx)	 ;, _52->type
	jne	.L132	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rcx), %r12	 ; _52->content.attr_name, callee_name
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r12, %r12	 ; callee_name
	je	.L132	 ;,
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r12), %eax	 ; _56->kind, tmp390
	subl	$1, %eax	 ;, tmp307
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	 ;, tmp307
	ja	.L132	 ;,
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rcx), %rcx	 ; _52->base, _59
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rcx, %rcx	 ; _59
	je	.L146	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	16(%rcx), %edx	 ; _59->type,
	testl	%edx, %edx	 ;
	jne	.L134	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rcx), %rax	 ; _59->content.name, _61
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _61
	je	.L134	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _61->kind,
	testl	%eax, %eax	 ;
	je	.L146	 ;,
.L134:
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rax, %rcx	 ; tmp363, _63
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ; tmp364, receiver
 ; D:\TC\temp\codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	 ; receiver
	je	.L146	 ;,
 ; D:\TC\temp\codegen.c:806:             emit_param_instruction(receiver, status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:807:             ++argument_count;
	movl	$1, %edi	 ;, argument_count
 ; D:\TC\temp\codegen.c:806:             emit_param_instruction(receiver, status);
	call	emit_param_instruction	 ;
.L136:
 ; D:\TC\temp\codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbx), %rcx	 ; variable_access_103(D)->content.args, variable_access_103(D)->content.args
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp368, args
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L140	 ;
	.p2align 4,,10
	.p2align 3
.L142:
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rax, %rcx	 ; tmp369, _75
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ; tmp370, arg_value
 ; D:\TC\temp\codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	 ; arg_value
	je	.L231	 ;,
 ; D:\TC\temp\codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:818:             ++argument_count;
	addq	$1, %rdi	 ;, argument_count
 ; D:\TC\temp\codegen.c:817:             emit_param_instruction(arg_value, status);
	call	emit_param_instruction	 ;
.L140:
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbx, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp372, arg_expr
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	jne	.L142	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:168:             arg->value.string_value = NULL;
	movq	$0, (%rax)	 ;, arg_340->value.string_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp373, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$5, 16(%rax)	 ;, arg_340->kind
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp318
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_340->is_get
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	(%r12), %rdx	 ; callee_name_84->type, _78
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	(%rax), %rax	 ; name_void, name_void.9_349
	movq	%rax, 8(%r13)	 ; name_void.9_349, arg_340->type
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rdx, %rdx	 ; _78
	je	.L143	 ;,
	cmpq	%rax, %rdx	 ; name_void.9_349, _78
	je	.L143	 ;,
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp374, _80
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _80, tmp323
	movhps	16(%rbx), %xmm0	 ; _80->type, tmp323
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_353->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp375, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_353->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp323, MEM <vector(2) long unsigned int> [(void *)arg_353]
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rdx	 ; callee_name_84->type, _78
.L143:
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%r12, %rcx	 ; callee_name,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp376, _83
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _83, tmp325
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; _83->type, tmp325
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;, arg_379->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp377, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_379->is_get
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp325, MEM <vector(2) long unsigned int> [(void *)arg_379]
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rdi, (%rax)	 ; argument_count, arg_366->value.int_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp378, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_366->kind
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp327
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_366->is_get
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rbx)	 ; name_int, arg_366->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_197->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp379, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_197->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg, inst_197->arg3
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$22, 24(%rax)	 ;, inst_197->type
 ; D:\TC\temp\codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rsi), %rax	 ; status_104(D)->current_block, status_104(D)->current_block
	movq	8(%rax), %rcx	 ; _85->instructions, _85->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:828:         return result;
	jmp	.L89	 ;
	.p2align 4,,10
	.p2align 3
.L229:
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_103(D)->base, _33
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rcx, %rcx	 ; _33
	je	.L125	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rbx)	 ;, variable_access_103(D)->content.index
	je	.L125	 ;,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %rcx	 ; tmp354, _37
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rbx), %rcx	 ; variable_access_103(D)->content.index, variable_access_103(D)->content.index
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	 ; tmp355, sequence
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rax, %rcx	 ; tmp356, _39
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp357, index
 ; D:\TC\temp\codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%rdi, %rdi	 ; sequence
	je	.L148	 ;,
	testq	%rax, %rax	 ; index
	je	.L148	 ;,
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp297
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%rdi), %rdx	 ; sequence_147->type, _45
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	(%rax), %rcx	 ; name_int, element_type
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp298
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rax), %rdx	 ; name_float, _45
	je	.L129	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp299
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rax), %rdx	 ; name_bool, _45
	je	.L129	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp300
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	cmpq	(%rax), %rdx	 ; name_string, _45
	cmovne	%rcx, %rdx	 ; _45,, element_type, _45
.L129:
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp359, _49
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _49, tmp301
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; _49->type, tmp301
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_327->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp360, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_327->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp301, MEM <vector(2) long unsigned int> [(void *)arg_327]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; sequence, inst_175->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp361, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$16, 24(%rax)	 ;, inst_175->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_175->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; index, inst_175->arg3
 ; D:\TC\temp\codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_104(D)->current_block, status_104(D)->current_block
	movq	8(%rax), %rcx	 ; _50->instructions, _50->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:761:         result->is_get = true;
	movb	$1, 20(%r13)	 ;, arg_327->is_get
 ; D:\TC\temp\codegen.c:762:         return result;
	jmp	.L89	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:\TC\temp\codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	 ; callee
	je	.L232	 ;,
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %edx	 ; callee_113->kind, _66
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %edx	 ;, _66
	je	.L233	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%edx, %edx	 ; _66
	jne	.L139	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	 ; callee_113->value.variable, _68
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	 ; _68
	je	.L139	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r12	 ; _68->original_name, callee_name
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r12, %r12	 ; callee_name
	je	.L139	 ;,
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r12), %eax	 ; _69->kind, tmp391
	subl	$1, %eax	 ;, tmp311
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp311
	jbe	.L146	 ;,
	.p2align 4,,10
	.p2align 3
.L139:
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp314
	movq	24(%rax), %r9	 ; _72->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:801:             return NULL;
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L228:
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_103(D)->base, _23
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rcx, %rcx	 ; _23
	je	.L120	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rbx), %rbx	 ; variable_access_103(D)->content.attr_name, _24
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rbx, %rbx	 ; _24
	je	.L120	 ;,
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rbx), %eax	 ; _24->kind, tmp387
	subl	$1, %eax	 ;, tmp281
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	 ;, tmp281
	jbe	.L234	 ;,
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rsi, %r8	 ; status,
	movq	%rbx, %rdx	 ; _24,
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	movq	%rax, %rcx	 ; tmp351, object
 ; D:\TC\temp\codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	 ; object
	je	.L235	 ;,
.L225:
 ; D:\TC\temp\codegen.c:833: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	jmp	emit_attribute_access	 ;
	.p2align 4,,10
	.p2align 3
.L227:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	 ; status_104(D)->tac, status_104(D)->tac
	movq	16(%rax), %rax	 ; _241->global_vars, _368
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	 ; _368
	je	.L217	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	 ; _368->head, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L217	 ;,
	.p2align 4,,10
	.p2align 3
.L113:
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	 ; current_168->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	 ; var
	je	.L112	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r12	 ; var_245->original_name, name
	je	.L223	 ;,
.L112:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	(%rax), %rax	 ; current_168->next, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L113	 ;,
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r12)	 ;, name_174->kind
	jbe	.L98	 ;,
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rdx, %rdx	 ; _211
	je	.L99	 ;,
	movq	16(%rdx), %rcx	 ; _211->parameters, _211->parameters
.L106:
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	(%rcx), %rbx	 ; _277->head, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L99	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %r13	 ;, tmp335
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:\TC\temp\codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%rbx), %rdi	 ; current_95->content, var
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rdi, %rdi	 ; var
	je	.L117	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%rdi), %rax	 ; var_280->original_name, _281
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	 ; _281
	je	.L117	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	0(%r13), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	8(%rax), %rcx	 ; _281->name, _281->name
	call	string_equal	 ;
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	 ; tmp343
	jne	.L236	 ;,
.L117:
 ; D:\TC\temp\codegen.c:232:         current = current->next;
	movq	(%rbx), %rbx	 ; current_95->next, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L116	 ;,
.L99:
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	8(%r12), %rbx	 ; name_174->name, _18
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	leaq	.LC13(%rip), %rdx	 ;, tmp275
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	movq	%rbx, %r8	 ; _18,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	(%r12), %rdx	 ; name_174->type, name_174->type
	movq	%rsi, %r9	 ; status,
	movq	%r12, %rcx	 ; name,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rbx	 ; tmp346, _22
	jmp	.L223	 ;
	.p2align 4,,10
	.p2align 3
.L236:
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rdi), %rax	 ; var_280->type, _12
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	 ; _12
	je	.L99	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movl	32(%rax), %ecx	 ; _12->kind,
	testl	%ecx, %ecx	 ;
	jne	.L99	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	 ; _12->ast_node.class, _12->ast_node.class
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	 ; _15->class_scope, tmp384
	cmpq	%rax, 24(%r12)	 ; tmp384, name_174->ast_node.scope
	jne	.L99	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp272
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rsi, %r8	 ; status,
	movq	%r12, %rdx	 ; name,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_280->type, tmp272
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_288->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	 ; tmp344, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_288->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp272, MEM <vector(2) long unsigned int> [(void *)arg_288]
	jmp	.L225	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	movl	$40, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp255
	movq	24(%rax), %r9	 ; _4->_stderr,
	call	fwrite	 ;
.L92:
 ; D:\TC\temp\codegen.c:708:         return NULL;
	xorl	%r13d, %r13d	 ; <retval>
	jmp	.L89	 ;
	.p2align 4,,10
	.p2align 3
.L217:
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r12)	 ;, name_174->kind
	ja	.L99	 ;,
	.p2align 4,,10
	.p2align 3
.L98:
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rdx	 ; name_174->type, name_174->type
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%r12, %rcx	 ; name,
.L224:
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp349, _30
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _30, tmp284
	movhps	16(%rbx), %xmm0	 ;, tmp284
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp350, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp284,* <retval>
 ; D:\TC\temp\codegen.c:833: }
	leaq	-40(%rbp), %rsp	 ;,
	movq	%r13, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movl	%edi, %r8d	 ; _6,
	leaq	.LC22(%rip), %rdx	 ;, tmp332
	movq	24(%rax), %rcx	 ; _87->_stderr, _87->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:832:     return NULL;
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L231:
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp317
	movq	24(%rax), %r9	 ; _76->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:815:                 return NULL;
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L226:
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp257
	movq	24(%rax), %r9	 ; _7->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:714:             return NULL;
	jmp	.L92	 ;
	.p2align 4,,10
	.p2align 3
.L234:
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %rdx	 ; _24->type, _24->type
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rbx, %rcx	 ; _24,
	jmp	.L224	 ;
	.p2align 4,,10
	.p2align 3
.L233:
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rax), %rax	 ; callee_113->value.subroutine, _67
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	 ; _67
	je	.L139	 ;,
 ; D:\TC\temp\codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r12	 ; _67->original_name, callee_name
 ; D:\TC\temp\codegen.c:799:         if (callee_name == NULL) {
	testq	%r12, %r12	 ; callee_name
	je	.L139	 ;,
.L146:
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	xorl	%edi, %edi	 ; argument_count
	jmp	.L136	 ;
	.p2align 4,,10
	.p2align 3
.L107:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	 ; status_104(D)->tac, status_104(D)->tac
	movq	16(%rax), %rax	 ;, _217
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	 ; _217
	je	.L110	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	 ;* _230, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L113	 ;,
.L110:
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r12)	 ;, name_174->kind
	ja	.L106	 ;,
	jmp	.L98	 ;
.L125:
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp289
	movq	24(%rax), %r9	 ; _35->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:747:             return NULL;
	jmp	.L92	 ;
.L120:
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp280
	movq	24(%rax), %r9	 ; _25->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:731:             return NULL;
	jmp	.L92	 ;
.L235:
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	movl	$61, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp287
	movq	24(%rax), %r9	 ; _31->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:739:             return NULL;
	jmp	.L92	 ;
.L230:
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp306
	movq	24(%rax), %r9	 ; _53->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:768:             return NULL;
	jmp	.L92	 ;
.L148:
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	movl	$68, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp296
	movq	24(%rax), %r9	 ; _43->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:753:             return NULL;
	jmp	.L92	 ;
.L232:
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp310
	movq	24(%rax), %r9	 ; _64->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:789:                 return NULL;
	jmp	.L92	 ;
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC25:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_38(D)->type,
 ; D:\TC\temp\codegen.c:654: Arg* codegen_primary(Primary* primary, TACStatus* status) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L238	 ;,
	leaq	.L240(%rip), %r8	 ;, tmp138
	movq	%rdx, %rsi	 ; tmp184, status
	movslq	(%r8,%rbx,4), %rax	 ;, tmp140
	addq	%r8, %rax	 ; tmp138, tmp141
	jmp	*%rax	 ; tmp141
	.section .rdata,"dr"
	.align 4
.L240:
	.long	.L248-.L240
	.long	.L247-.L240
	.long	.L246-.L240
	.long	.L245-.L240
	.long	.L244-.L240
	.long	.L243-.L240
	.long	.L242-.L240
	.long	.L241-.L240
	.long	.L239-.L240
	.text
	.p2align 4,,10
	.p2align 3
.L241:
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	codegen_primary	 ;
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp197, _15
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %r12	 ; tmp198, operand
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp199, _17
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; _17, tmp166
	movhps	16(%rdi), %xmm0	 ; _17->type, tmp166
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdi	 ;, tmp168
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_184->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp200, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_184->kind
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp166, MEM <vector(2) long unsigned int> [(void *)arg_184]
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	8(%r12), %rax	 ; operand_44->type, _18
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	cmpq	(%rdi), %rax	 ; name_int, _18
	je	.L255	 ;,
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %r13	 ;, tmp171
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	cmpq	0(%r13), %rax	 ; name_float, _18
	je	.L256	 ;,
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	leaq	.LC24(%rip), %rdx	 ;, tmp176
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
 ; D:\TC\temp\codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L239:
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.var
 ; D:\TC\temp\codegen.c:703: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	jmp	codegen_variable_access	 ;
	.p2align 4,,10
	.p2align 3
.L248:
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	xorl	%edx, %edx	 ;
	call	strtoll	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rsi	 ; tmp185, _3
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; _3, arg_106->value.int_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp186, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_106->kind
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp144
	movq	(%rax), %rax	 ;, name_int
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int,
.L237:
 ; D:\TC\temp\codegen.c:703: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L247:
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movapd	%xmm0, %xmm6	 ; tmp187, _5
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm6, (%rax)	 ; _5, arg_119->value.float_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp188, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_119->kind
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp147
	movq	(%rax), %rax	 ;, name_float
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	%rax, 8(%rbx)	 ; name_float,
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L246:
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %xmm6	 ; primary_38(D)->value.literal_value, _6
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$3, 16(%rax)	 ;, arg_132->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp189, <retval>
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movdqa	%xmm6, %xmm0	 ; _6, tmp149
	movq	.refptr.name_string(%rip), %rax	 ;, tmp150
	movhps	(%rax), %xmm0	 ; name_string, tmp149
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rbx)	 ; tmp149, MEM <vector(2) long unsigned int> [(void *)arg_132]
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L245:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	 ;, arg_145->value.bool_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp190, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_145->kind
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp152
	movq	(%rax), %rax	 ;, name_bool
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L244:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	 ;, arg_158->value.bool_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp191, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_158->kind
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp154
	movq	(%rax), %rax	 ;, name_bool
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L243:
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
 ; D:\TC\temp\codegen.c:703: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	jmp	codegen_expression	 ;
	.p2align 4,,10
	.p2align 3
.L242:
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	codegen_primary	 ;
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp192, _9
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %r12	 ; tmp193, operand
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp158
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; name_bool, name_bool
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp194, _11
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; _11, tmp160
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; _11->type, tmp160
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_171->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp195, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_171->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp160, MEM <vector(2) long unsigned int> [(void *)arg_171]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; operand, inst_88->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp196, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_88->arg1
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$13, 24(%rax)	 ;, inst_88->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_88->arg3
 ; D:\TC\temp\codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _12->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:679:             return temp;
	jmp	.L237	 ;
.L238:
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC25(%rip), %rdx	 ;, tmp181
 ; D:\TC\temp\codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L256:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_210->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp203, arg
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	.LC23(%rip), %rax	 ;, tmp211
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_210->is_get
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	%rax, (%rdi)	 ; tmp211, arg_210->value.float_value
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	0(%r13), %rax	 ; name_float, name_float
	movq	%rax, 8(%rdi)	 ; name_float, arg_210->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$2, 24(%rax)	 ;, inst_90->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp204, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_90->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; arg, inst_90->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; operand,
.L251:
 ; D:\TC\temp\codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:696:             return temp;
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L255:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_197->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp201, arg
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_197->value.int_value
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	(%rdi), %rax	 ; name_int, name_int
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_197->is_get
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%r13)	 ; name_int, arg_197->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$1, 24(%rax)	 ;, inst_89->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp202, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_89->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_89->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; operand,
	jmp	.L251	 ;
	.section .rdata,"dr"
	.align 8
.LC26:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp147, expression
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp148, status
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	je	.L271	 ;,
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rax, %rcx	 ; tmp149, _4
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp150, <retval>
 ; D:\TC\temp\codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rsi), %eax	 ; expression_31(D)->operator,
	cmpl	$18, %eax	 ;, _5
	ja	.L259	 ;,
	leaq	CSWTCH.22(%rip), %rdx	 ;, tmp126
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movl	(%rdx,%rax,4), %r13d	 ; CSWTCH.22[_5], _53
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %r12	 ; tmp151, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp129
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp129
	ja	.L260	 ;,
 ; D:\TC\temp\codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	 ;, _53
	jne	.L264	 ;,
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	 ; left_91->kind,
	testl	%eax, %eax	 ;
	jne	.L272	 ;,
.L262:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_56->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp157, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; left, inst_56->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; <retval>, inst_56->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_56->arg3
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%r12)	 ;, left_91->is_get
	jne	.L273	 ;,
.L263:
 ; D:\TC\temp\codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:653: }
	leaq	-48(%rbp), %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L259:
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	 ;, _53
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	call	codegen_expression	 ;
	movq	%rax, %r12	 ; tmp163, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp145
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp145
	ja	.L260	 ;,
.L264:
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; left_104->type, left_104->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp152, _9
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _9, tmp132
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%r12, %rcx	 ; left,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _9->type, tmp132
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_79->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp153, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_79->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp132, MEM <vector(2) long unsigned int> [(void *)arg_79]
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r14	 ; tmp154, _10
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _10, inst_55->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; <retval>, inst_55->arg3
 ; D:\TC\temp\codegen.c:639:             right = temp;
	movq	%rsi, %rdi	 ; arg, <retval>
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _53, inst_55->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_55->arg1
 ; D:\TC\temp\codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	 ; left_91->kind,
	testl	%eax, %eax	 ;
	je	.L262	 ;,
.L272:
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rcx	 ;, tmp137
	movq	24(%rax), %r9	 ; _14->_stderr,
	call	fwrite	 ;
	jmp	.L262	 ;
	.p2align 4,,10
	.p2align 3
.L260:
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; left_102->type, left_102->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp159, _18
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _18, tmp139
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%r12, %rcx	 ; left,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _18->type, tmp139
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_92->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp160, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_92->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp139, MEM <vector(2) long unsigned int> [(void *)arg_92]
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r12	 ; tmp161, _19
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; <retval>, inst_58->arg3
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp162, inst
 ; D:\TC\temp\codegen.c:649:         right = temp;
	movq	%rsi, %rdi	 ; arg, <retval>
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _53, inst_58->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_58->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; _19, inst_58->arg2
	jmp	.L263	 ;
	.p2align 4,,10
	.p2align 3
.L271:
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; D:\TC\temp\codegen.c:653: }
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	jmp	codegen_primary	 ;
	.p2align 4,,10
	.p2align 3
.L273:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$24, 24(%rax)	 ;, inst_57->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp158, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; left, inst_57->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; <retval>, inst_57->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_57->arg3
	jmp	.L263	 ;
	.p2align 4
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15	 ;
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp186, if_
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp187, status
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	subq	$72, %rsp	 ;,
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp188, then_label
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp189, else_label
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp190
	je	.L277	 ;,
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp192
	jne	.L298	 ;,
.L277:
 ; D:\TC\temp\codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, 56(%rsp)	 ; tmp191, %sfp
.L276:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_187->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp193, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_187->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	56(%rsp), %rax	 ; %sfp, end_label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_187->is_get
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%r14), %rcx	 ; if__61(D)->condition, if__61(D)->condition
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rax, (%r12)	 ; end_label, arg_187->value.label
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rax, %r15	 ; tmp194, condition
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_174->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp195, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_174->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; else_label, arg_174->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_174->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; then_label, arg_161->value.label
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp196, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_161->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_161->type
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_161->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_129->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	 ; arg, inst_129->arg3
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_129->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_129->arg1
 ; D:\TC\temp\codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rdi, (%rax)	 ; then_label, block_159->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp198, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp199, block_159->instructions
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _10->blocks, _10->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:468:     status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rcx	 ; if__61(D)->body, if__61(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp200, then_statements
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L278	 ;
	.p2align 4,,10
	.p2align 3
.L279:
 ; D:\TC\temp\codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L278:
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp201, statement
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L279	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_130->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp202, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_130->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_130->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_130->arg3
 ; D:\TC\temp\codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp203
	je	.L299	 ;,
.L280:
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp221
	je	.L300	 ;,
.L287:
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp227, block
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	56(%rsp), %rax	 ; %sfp, end_label
	movq	%rax, (%rsi)	 ; end_label, block_232->label
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp228, block_232->instructions
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _40->blocks, _40->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:528:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:529: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L298:
 ; D:\TC\temp\codegen.c:457:         end_label = else_label;
	movq	%rsi, 56(%rsp)	 ; else_label, %sfp
	jmp	.L276	 ;
	.p2align 4,,10
	.p2align 3
.L300:
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rsi, (%rax)	 ; else_label, block_230->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp222, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp223, block_230->instructions
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:515:         status->current_block = else_block;
	movq	%rdi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp224, else_statements
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L288	 ;
	.p2align 4,,10
	.p2align 3
.L289:
 ; D:\TC\temp\codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L288:
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp225, else_statement
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L289	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_133->arg1
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp226, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_133->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_133->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_133->arg3
 ; D:\TC\temp\codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _38->instructions, _38->instructions
	call	list_append	 ;
	jmp	.L287	 ;
	.p2align 4,,10
	.p2align 3
.L299:
 ; D:\TC\temp\codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_copy	 ;
	movq	%rax, 40(%rsp)	 ; tmp204, %sfp
	.p2align 4,,10
	.p2align 3
.L281:
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp220, elif
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L280	 ;,
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rsi, (%rax)	 ; else_label, block_200->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp205, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%rbp, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp206, block_200->instructions
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:486:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp207, then_label
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	(%rdi), %rcx	 ; elif_87->condition, elif_87->condition
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp208, else_label
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	%rax, %r13	 ; tmp209, condition
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp210
	jne	.L301	 ;,
.L283:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_217->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	 ; tmp212, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_217->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; else_label, arg_217->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_217->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_204->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_204->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; then_label, arg_204->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_204->is_get
	movq	%rax, 48(%rsp)	 ; arg, %sfp
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	48(%rsp), %r9	 ; %sfp, arg
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp214, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; condition, inst_131->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r9, 8(%rax)	 ; arg, inst_131->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_131->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	 ; arg, inst_131->arg3
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	 ; then_label, block_202->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r13	 ; tmp215, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	 ; tmp216, block_202->instructions
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _28->blocks, _28->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:499:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rdi), %rcx	 ; elif_87->body, elif_87->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp217, elif_statements
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L284	 ;
	.p2align 4,,10
	.p2align 3
.L285:
 ; D:\TC\temp\codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L284:
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp218, elif_statement
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L285	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_132->arg1
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp219, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_132->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_132->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_132->arg3
 ; D:\TC\temp\codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _31->instructions, _31->instructions
	call	list_append	 ;
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L301:
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:493:                 else_label = end_label;
	testb	%al, %al	 ; tmp211
	cmovne	56(%rsp), %rsi	 ; else_label,, %sfp, else_label
	jmp	.L283	 ;
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC28:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC29:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_30(D)->type,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L303	 ;,
	movq	%rdx, %rsi	 ; tmp156, status
	leaq	.L305(%rip), %rdx	 ;, tmp123
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp125
	addq	%rdx, %rax	 ; tmp123, tmp126
	jmp	*%rax	 ; tmp126
	.section .rdata,"dr"
	.align 4
.L305:
	.long	.L312-.L305
	.long	.L311-.L305
	.long	.L310-.L305
	.long	.L309-.L305
	.long	.L308-.L305
	.long	.L307-.L305
	.long	.L306-.L305
	.long	.L304-.L305
	.text
	.p2align 4,,10
	.p2align 3
.L306:
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp160
	jne	.L313	 ;,
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rsi), %rax	 ; status_31(D)->end_labels, status_31(D)->end_labels
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _12->tail, _12->tail
	movq	8(%rax), %rbx	 ; _13->content, label
 ; D:\TC\temp\codegen.c:427:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	je	.L313	 ;,
.L323:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp161, inst
	jmp	.L322	 ;
	.p2align 4,,10
	.p2align 3
.L304:
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp163
	jne	.L314	 ;,
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rsi), %rax	 ; status_31(D)->start_labels, status_31(D)->start_labels
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _20->tail, _20->tail
	movq	8(%rax), %rbx	 ; _21->content, label
 ; D:\TC\temp\codegen.c:438:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	jne	.L323	 ;,
.L314:
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp152
	movq	24(%rax), %r9	 ; _24->_stderr,
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L310:
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.if_stmt, statement_30(D)->stmt.if_stmt
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	codegen_if	 ;
	.p2align 4,,10
	.p2align 3
.L312:
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.expr, statement_30(D)->stmt.expr
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	codegen_expression	 ;
	.p2align 4,,10
	.p2align 3
.L311:
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rcx), %rax	 ; statement_30(D)->stmt.var, _3
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	%rsi, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	(%rax), %rdx	 ; _3->type, _3->type
	movq	8(%rax), %rcx	 ; _3->name, _3->name
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp157, var
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _75->local_vars, _75->local_vars
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L308:
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.for_stmt, statement_30(D)->stmt.for_stmt
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	codegen_for	 ;
	.p2align 4,,10
	.p2align 3
.L307:
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.return_expr, statement_30(D)->stmt.return_expr
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	%rax, %rbx	 ; tmp158, return_value
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$21, 24(%rax)	 ;, inst_52->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp159, inst
.L322:
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rdx)	 ; label,* inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rdx)	 ;,
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rdx)	 ;,
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rcx	 ;, _14->instructions
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L309:
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.while_stmt, statement_30(D)->stmt.while_stmt
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	codegen_while	 ;
	.p2align 4,,10
	.p2align 3
.L313:
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp145
	movq	24(%rax), %r9	 ; _16->_stderr,
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	jmp	fwrite	 ;
.L303:
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC29(%rip), %rdx	 ;, tmp154
	movq	24(%rax), %rcx	 ; _26->_stderr, _26->_stderr
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.p2align 4
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp184, for_
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp185, status
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rcx), %rax	 ; for__53(D)->initializer, _1
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	testq	%rax, %rax	 ; _1
	je	.L325	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rax), %rdx	 ; _1->type, _1->type
	movq	8(%rax), %rcx	 ; _1->name, _1->name
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp186, var
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _151->local_vars, _151->local_vars
	call	list_append	 ;
.L325:
 ; D:\TC\temp\codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp187, condition_label
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp188, body_label
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp189, end_label
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	je	.L326	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp190, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_202->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_202->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp191, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_111->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_111->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_111->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_111->arg3
 ; D:\TC\temp\codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	 ; condition_label, block_200->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp192, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp193, block_200->instructions
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:544:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%rdi), %rcx	 ; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	%rax, %r15	 ; tmp194, condition
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_187->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp195, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_187->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; end_label, arg_187->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_187->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_174->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp196, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_174->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_174->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_174->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_110->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_110->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_110->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_110->arg3
 ; D:\TC\temp\codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ;, _11->instructions
	call	list_append	 ;
.L327:
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	 ; body_label, block_228->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp200, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp201, block_228->instructions
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _16->blocks, _16->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:557:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__53(D)->increment
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	 ; tmp202, increment_label
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	je	.L328	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp203, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_230->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_230->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; increment_label, arg_230->value.label
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	list_append	 ;
.L329:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_269->is_get
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp206, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_269->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_269->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; end_label, arg_269->value.label
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__53(D)->body, for__53(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp207, body_statements
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L331	 ;
	.p2align 4,,10
	.p2align 3
.L332:
 ; D:\TC\temp\codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L331:
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, statement
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L332	 ;,
 ; D:\TC\temp\codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__53(D)->increment
	je	.L333	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_284->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp209, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_284->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; increment_label, arg_284->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_284->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp210, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_113->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_113->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_113->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_113->arg3
 ; D:\TC\temp\codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	 ; increment_label, block_282->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp211, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp212, block_282->instructions
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:579:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%rdi), %rcx	 ; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
.L333:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_297->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp213, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_297->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_297->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_297->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_114->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp214, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_114->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_114->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_114->arg3
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	je	.L339	 ;,
.L334:
 ; D:\TC\temp\codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _41->instructions, _41->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	 ; end_label, block_323->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp217, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp218, block_323->instructions
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _43->blocks, _43->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:590:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:591: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L328:
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L330	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp204, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_243->value.label
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
	jmp	.L329	 ;
	.p2align 4,,10
	.p2align 3
.L326:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_215->value.label
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp198, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_215->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_112->arg1
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp199, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_112->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_112->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_112->arg3
 ; D:\TC\temp\codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ;, _14->instructions
	call	list_append	 ;
	jmp	.L327	 ;
	.p2align 4,,10
	.p2align 3
.L339:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_310->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp215, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_310->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_310->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_310->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_115->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp216, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_115->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_115->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_115->arg3
	jmp	.L334	 ;
	.p2align 4,,10
	.p2align 3
.L330:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp205, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_256->value.label
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
	jmp	.L329	 ;
	.p2align 4
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r15	 ;
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp141, while_
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp142, status
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp143, condition_label
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_141->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp144, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_141->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_141->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_141->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp145, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_68->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_68->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_68->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_68->arg3
 ; D:\TC\temp\codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	 ; condition_label, block_139->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp146, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp147, block_139->instructions
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:599:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	xorl	%edx, %edx	 ;
	movl	$98, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp148, body_label
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	(%rsi), %rcx	 ; while__40(D)->condition, while__40(D)->condition
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp149, end_label
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	%rax, %r15	 ; tmp150, condition
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_126->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp151, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_126->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; end_label, arg_126->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_126->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_113->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp152, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_113->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_113->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_113->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp153, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_67->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; arg, inst_67->arg3
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_67->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_67->arg1
 ; D:\TC\temp\codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	 ; body_label, block_111->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r12	 ; tmp154, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r12, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	 ; tmp155, block_111->instructions
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:609:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_98->is_get
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp156, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_98->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_98->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_98->value.label
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_85->is_get
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp157, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_85->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_85->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; end_label, arg_85->value.label
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__40(D)->body, while__40(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp158, body_statements
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L341	 ;
	.p2align 4,,10
	.p2align 3
.L342:
 ; D:\TC\temp\codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L341:
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp159, statement
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L342	 ;,
 ; D:\TC\temp\codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_156->value.label
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp160, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_156->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_156->type
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_156->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp161, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_69->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_69->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_69->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_69->arg3
 ; D:\TC\temp\codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rdi, (%rax)	 ; end_label, block_154->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp162, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp163, block_154->instructions
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _23->blocks, _23->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:625:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:626: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp114, function
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp115, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_39]
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp116, subroutine
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp117, subroutine_39->parameters
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp118, subroutine_39->local_vars
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp119, subroutine_39->blocks
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
 ; D:\TC\temp\codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r12), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp120, parameters
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L345	 ;
	.p2align 4,,10
	.p2align 3
.L346:
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_39->parameters, subroutine_39->parameters
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp121, _8
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L345:
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L346	 ;,
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	 ; tmp123, _10
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	 ; _10, block_43->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp124, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_39->blocks, subroutine_39->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp125, block_43->instructions
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:332:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r12), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp126, statements
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L347	 ;
	.p2align 4,,10
	.p2align 3
.L348:
 ; D:\TC\temp\codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L347:
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp127, statement
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L348	 ;,
 ; D:\TC\temp\codegen.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:340: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp114, method
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp115, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)]
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_39]
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp116, subroutine
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp117, subroutine_39->parameters
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp118, subroutine_39->local_vars
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp119, subroutine_39->blocks
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
 ; D:\TC\temp\codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rcx	 ; method_16(D)->parameters, method_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp120, parameters
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L351	 ;
	.p2align 4,,10
	.p2align 3
.L352:
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_39->parameters, subroutine_39->parameters
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp121, _8
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L351:
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L352	 ;,
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	 ; tmp123, _10
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	 ; _10, block_43->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp124, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_39->blocks, subroutine_39->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp125, block_43->instructions
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:354:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r12), %rcx	 ; method_16(D)->body, method_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp126, statements
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L353	 ;
	.p2align 4,,10
	.p2align 3
.L354:
 ; D:\TC\temp\codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L353:
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp127, statement
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L354	 ;,
 ; D:\TC\temp\codegen.c:361:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:362: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC30:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.p2align 4
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp111, class
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp112, status
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_14(D)->members, class_14(D)->members
 ; D:\TC\temp\codegen.c:363: void codegen_class(Class* class, TACStatus* status) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	call	list_copy	 ;
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%r12), %xmm6	 ; class_14(D)->name, _2
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rsi	 ; tmp113, members
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp114, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rbx, %rdx	 ; table,
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp115, tmp102
	punpcklqdq	%xmm6, %xmm0	 ; _2, tmp102
	movups	%xmm0, (%rbx)	 ; tmp102, MEM <vector(2) long unsigned int> [(void *)table_28]
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	24(%r12), %rax	 ; class_14(D)->size, class_14(D)->size
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	leaq	.LC30(%rip), %r12	 ;, tmp110
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	%rax, 16(%rbx)	 ; class_14(D)->size, table_28->size
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rcx	 ; _4->attribute_tables, _4->attribute_tables
	call	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L357:
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L365	 ;,
.L362:
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_23->type, _6
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	testl	%ebx, %ebx	 ; _6
	je	.L358	 ;,
	cmpl	$1, %ebx	 ;, _6
	je	.L359	 ;,
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movl	%ebx, %r8d	 ; _6,
	movq	%r12, %rdx	 ; tmp110,
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	jne	.L362	 ;,
.L365:
 ; D:\TC\temp\codegen.c:383: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-32(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L359:
 ; D:\TC\temp\codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_23->content.variable, member_23->content.variable
	movl	$97, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:377:                 break;
	jmp	.L357	 ;
	.p2align 4,,10
	.p2align 3
.L358:
 ; D:\TC\temp\codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_23->content.method, member_23->content.method
	movq	%rdi, %rdx	 ; status,
	call	codegen_method	 ;
 ; D:\TC\temp\codegen.c:374:                 break;
	jmp	.L357	 ;
	.section .rdata,"dr"
.LC31:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC31(%rip), %r13	 ;, tmp115
 ; D:\TC\temp\codegen.c:291: TAC* codegen_code(Code* code) {
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp116, code
 ; D:\TC\temp\codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:291: TAC* codegen_code(Code* code) {
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp117, <retval>
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:78:     tac->entry_point = NULL;
	movq	$0, 8(%r12)	 ;, tac_29->entry_point
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	movq	%rax, (%r12)	 ; tmp118, tac_29->attribute_tables
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	movq	%rax, 16(%r12)	 ; tmp119, tac_29->global_vars
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %ecx	 ;,
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	movq	%rax, 24(%r12)	 ; tmp120, tac_29->subroutines
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:85:     status->tac = tac;
	movq	%r12, (%rax)	 ; <retval>, status_26->tac
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rsi	 ; tmp121, status
 ; D:\TC\temp\codegen.c:86:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	 ;, status_26->current_subroutine
 ; D:\TC\temp\codegen.c:87:     status->current_block = NULL;
	movq	$0, 16(%rax)	 ;, status_26->current_block
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	movq	%rax, 24(%rsi)	 ; tmp122, status_26->end_labels
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:90:     status->attr_count = 0;
	pxor	%xmm0, %xmm0	 ; tmp101
 ; D:\TC\temp\codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rcx	 ; code_17(D)->members, code_17(D)->members
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	movq	%rax, 32(%rsi)	 ; tmp123, status_26->start_labels
 ; D:\TC\temp\codegen.c:90:     status->attr_count = 0;
	movups	%xmm0, 40(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 40B]
	movups	%xmm0, 56(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 56B]
	movups	%xmm0, 72(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 72B]
 ; D:\TC\temp\codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp124, members
	.p2align 4,,10
	.p2align 3
.L367:
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L375	 ;,
.L373:
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L376	 ;,
 ; D:\TC\temp\codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L377	 ;,
 ; D:\TC\temp\codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L367	 ;,
 ; D:\TC\temp\codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.import, code_member_21->content.import
	movq	%rsi, %r8	 ; status,
	movq	%r12, %rdx	 ; <retval>,
	call	codegen_import	 ;
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	jne	.L373	 ;,
.L375:
 ; D:\TC\temp\codegen.c:308: }
	leaq	-40(%rbp), %rsp	 ;,
	movq	%r12, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L376:
 ; D:\TC\temp\codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.function, code_member_21->content.function
	movq	%rsi, %rdx	 ; status,
	call	codegen_function	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	 ; code_member_21->content.function, code_member_21->content.function
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r13, %rdx	 ; tmp115,
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rbx	 ; _4->name, _5
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rcx	 ; _5->name, _5->name
	call	strcmp	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp125
	jne	.L367	 ;,
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r12)	 ; _5, tac_29->entry_point
	jmp	.L367	 ;
	.p2align 4,,10
	.p2align 3
.L377:
 ; D:\TC\temp\codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	codegen_class	 ;
	jmp	.L367	 ;
	.section .rdata,"dr"
	.align 32
CSWTCH.22:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.long	8
	.long	9
	.long	10
	.long	11
	.long	12
	.long	14
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
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
