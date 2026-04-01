	.file	"codegen.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	create_var, @function
create_var:
	pushq	%r14	;
	movq	%rdi, %r14	; tmp113, original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:113: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	pushq	%r13	;
	movq	%rcx, %r13	; tmp116, status
	pushq	%r12	;
	movq	%rsi, %r12	; tmp114, type
	pushq	%rbp	;
	movl	%edx, %ebp	; tmp115, kind
	pushq	%rbx	;
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r14, (%rax)	; original_name, var_19->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp117, <retval>
; temp/codegen.c:117:     switch (kind) {
	leal	-97(%rbp), %eax	;,
	cmpl	$21, %eax	;, tmp95
	ja	.L2	;,
	leaq	.L4(%rip), %rdx	;, tmp97
	movslq	(%rdx,%rax,4), %rax	;, tmp99
	addq	%rdx, %rax	; tmp97, tmp100
	jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L9-.L4
	.long	.L8-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L7-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L6-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L5-.L4
	.long	.L2-.L4
	.long	.L3-.L4
	.text
	.p2align 4,,10
	.p2align 3
.L2:
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp102
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _13, var_19->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp118, _13
.L10:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%ebp, %r8d	; kind,
	leaq	.LC1(%rip), %rcx	;, tmp110
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:131:     var->type = type;
	movq	%r12, 16(%rbx)	; type, var_19->type
; temp/codegen.c:133: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L9:
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%r13), %r14	; status_23(D)->attr_count, id
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r14), %rax	;, tmp103
	movq	%rax, 40(%r13)	; tmp103, status_23(D)->attr_count
	.p2align 4,,10
	.p2align 3
.L11:
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp109
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _13, var_19->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp119, _13
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, id
	je	.L10	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; id,
	movl	%ebp, %r8d	; kind,
	leaq	.LC2(%rip), %rcx	;, tmp111
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:131:     var->type = type;
	movq	%r12, 16(%rbx)	; type, var_19->type
; temp/codegen.c:133: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L8:
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%r13), %r14	; status_23(D)->block_count, id
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	;, tmp107
	movq	%rax, 72(%r13)	; tmp107, status_23(D)->block_count
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L11	;
	.p2align 4,,10
	.p2align 3
.L7:
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%r13), %r14	; status_23(D)->subroutine_count, id
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r14), %rax	;, tmp108
	movq	%rax, 80(%r13)	; tmp108, status_23(D)->subroutine_count
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L11	;
	.p2align 4,,10
	.p2align 3
.L6:
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%r13), %r14	; status_23(D)->param_count, id
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r14), %rax	;, tmp104
	movq	%rax, 48(%r13)	; tmp104, status_23(D)->param_count
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L11	;
	.p2align 4,,10
	.p2align 3
.L5:
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%r13), %r14	; status_23(D)->temp_count, id
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	;, tmp106
	movq	%rax, 64(%r13)	; tmp106, status_23(D)->temp_count
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L11	;
	.p2align 4,,10
	.p2align 3
.L3:
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%r13), %r14	; status_23(D)->var_count, id
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r14), %rax	;, tmp105
	movq	%rax, 56(%r13)	; tmp105, status_23(D)->var_count
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L11	;
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.p2align 4
	.type	get_type_size, @function
get_type_size:
; temp/codegen.c:21:     if (type == NULL)
	testq	%rdi, %rdi	; type
	je	.L20	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_int(%rip)	; type, name_int
	je	.L24	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_float(%rip)	; type, name_float
	je	.L24	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_string(%rip)	; type, name_string
	je	.L24	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rdi, name_bool(%rip)	; type, name_bool
	je	.L22	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rdi, name_void(%rip)	; type, name_void
	je	.L22	;,
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movl	32(%rdi), %eax	; type_12(D)->kind,
	testl	%eax, %eax	;
	jne	.L19	;,
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rdi), %rax	; type_12(D)->ast_node.class, type_12(D)->ast_node.class
	movq	24(%rax), %rax	; _7->size, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L22:
; temp/codegen.c:26:         return 1;
	movl	$1, %eax	;, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L20:
; temp/codegen.c:22:         return 0;
	xorl	%eax, %eax	; <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L19:
; temp/codegen.c:20: static size_t get_type_size(Symbol* type) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdx	;, tmp96
	movq	8(%rdi), %rcx	; type_12(D)->name, type_12(D)->name
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:24:         return 8;
	movl	$8, %eax	;, <retval>
; temp/codegen.c:31: }
	addq	$8, %rsp	;,
	ret	
	.p2align 4,,10
	.p2align 3
.L24:
; temp/codegen.c:24:         return 8;
	movl	$8, %eax	;, <retval>
; temp/codegen.c:31: }
	ret	
	.size	get_type_size, .-get_type_size
	.p2align 4
	.type	emit_param_instruction, @function
emit_param_instruction:
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rdi, %rdi	; value
	je	.L30	;,
; temp/codegen.c:283: static void emit_param_instruction(Arg* value, TACStatus* status) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp104, status
	pushq	%rbx	;
	subq	$8, %rsp	;,
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rsi, %rsi	; status
	je	.L27	;,
	movq	%rdi, %rbx	; tmp103, value
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rdi), %rdi	; value_4(D)->type, value_4(D)->type
	call	get_type_size	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, %r13	; tmp105, _10
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%r13, (%rax)	; _10, arg_16->value.int_value
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp106, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_16->kind
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_16->is_get
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%r12)	; name_int, arg_16->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; value, inst_13->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp107, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_13->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_13->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_13->arg3
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_5(D)->current_block, status_5(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
; temp/codegen.c:289: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L27:
; temp/codegen.c:289: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L30:
	ret	
	.size	emit_param_instruction, .-emit_param_instruction
	.p2align 4
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp102, arg
	subq	$8, %rsp	;,
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rdi, %rdi	; arg
	je	.L34	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_4(D)->is_get
	jne	.L39	;,
.L34:
; temp/codegen.c:195: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%rsi, %rbp	; tmp103, status
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_4(D)->type, arg_4(D)->type
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp104, _10
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; _10, tmp97
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	; _10->type, tmp97
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp105, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_16->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp97, MEM <vector(2) long unsigned int> [(void *)arg_16]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_16->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; arg, inst_12->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp106, inst
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%r12, %rbx	; arg, arg
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_12->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_12->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_12->arg3
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_7(D)->current_block, status_7(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:195: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC4:
	.string	"<unknown>"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[warning] Invalid attribute access\n"
	.align 8
.LC6:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
	.section	.rodata.str1.1
.LC7:
	.string	"$a%zu"
	.text
	.p2align 4
	.type	emit_attribute_access, @function
emit_attribute_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; temp/codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rdi, %rdi	; object
	je	.L61	;,
	movq	%rsi, %rbx	; tmp158, attr_name
	testq	%rsi, %rsi	; attr_name
	je	.L61	;,
; temp/codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	%rdx, %rsi	; status,
	movq	%rdx, %r13	; tmp159, status
	call	load_rvalue	;
	movq	%rax, %r14	; tmp160, object_value
; temp/codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	; object_value
	je	.L43	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rax), %rbp	; object_value_21->type, class_type
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rbp, %rbp	; class_type
	je	.L46	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movl	32(%rbp), %eax	; _5->kind,
	testl	%eax, %eax	;
	jne	.L67	;,
.L46:
; temp/codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	0(%r13), %rax	; MEM[(struct TAC * *)status_19(D)], MEM[(struct TAC * *)status_19(D)]
	movq	(%rax), %rdi	; _82->attribute_tables, _82->attribute_tables
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp161, attribute_tables
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	jmp	.L47	;
	.p2align 4,,10
	.p2align 3
.L49:
; temp/codegen.c:9:         if (current->name == name)
	cmpq	%rbp, 8(%rax)	; class_type, current_86->name
	je	.L48	;,
.L47:
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%r12, %rdi	; attribute_tables,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	; current
	jne	.L49	;,
.L50:
; temp/codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rbx), %rsi	; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%r13, %rcx	; status,
	movl	$97, %edx	;,
	movq	%rbx, %rdi	; attr_name,
	call	create_var	;
	movq	%rax, %r15	; tmp163, var
.L52:
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rbx), %rsi	; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%r13, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp166, _9
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _9, tmp140
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _9->type, tmp140
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp167, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_49->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp140, MEM <vector(2) long unsigned int> [(void *)arg_49]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_49->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; var, tmp142
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r15), %xmm0	; _81->type, tmp142
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp168, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_37->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp142, MEM <vector(2) long unsigned int> [(void *)arg_37]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_37->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; object_value, inst_30->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp169, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$15, 24(%rax)	;, inst_30->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_30->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_30->arg3
; temp/codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%r13), %rax	; status_19(D)->current_block, status_19(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rbx)	;, arg_49->is_get
.L40:
; temp/codegen.c:281: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L48:
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rdi	; current_86->attributes, _62
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _62
	je	.L50	;,
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	*list_copy@GOTPCREL(%rip)	;
; temp/codegen.c:243:     size_t index = 0;
	xorl	%r12d, %r12d	; index
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	%rax, %r15	; tmp164, attrs
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	jmp	.L53	;
	.p2align 4,,10
	.p2align 3
.L55:
; temp/codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbx	; attr_66->var_name, attr_name
	je	.L54	;,
; temp/codegen.c:252:         ++index;
	addq	$1, %r12	;, index
.L53:
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%r15, %rdi	; attrs,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	; attr
	jne	.L55	;,
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp150
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	; attr_name, var_118->original_name
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	; tmp172, var
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rax, 16(%r15)	; attr_name_17(D)->type, var_118->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC4(%rip), %r8	;, iftmp.44_74
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; tmp173, var_118->name
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rbp, %rbp	; class_type
	je	.L59	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbp), %r8	; class_type_89->name, iftmp.44_74
.L59:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rbx), %rcx	; attr_name_17(D)->name, attr_name_17(D)->name
	movq	%r12, %r9	; index,
	xorl	%eax, %eax	;
	leaq	.LC6(%rip), %rdx	;, tmp137
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	8(%r15), %rdi	; var_118->name, prephitmp_13
.L57:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r8	; index,
	leaq	.LC7(%rip), %rcx	;, tmp138
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:261:     return var;
	jmp	.L52	;
	.p2align 4,,10
	.p2align 3
.L67:
; temp/codegen.c:272:     Symbol* class_type = NULL;
	xorl	%ebp, %ebp	; class_type
	jmp	.L46	;
	.p2align 4,,10
	.p2align 3
.L54:
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp148
	movl	$32, %esi	;,
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	; attr_name, var_117->original_name
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	; tmp170, var
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rax, 16(%r15)	; attr_name_17(D)->type, var_117->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; prephitmp_13, var_117->name
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp171, prephitmp_13
	jmp	.L57	;
	.p2align 4,,10
	.p2align 3
.L61:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
.L43:
; temp/codegen.c:267:         return NULL;
	xorl	%ebx, %ebx	; <retval>
	jmp	.L40	;
	.size	emit_attribute_access, .-emit_attribute_access
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp111, tac
	pushq	%rbx	;
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbx	; import_15(D)->name, _1
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbx), %ecx	; _1->kind, _2
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L74	;,
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp103
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp103
	jbe	.L75	;,
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L71	;,
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp115, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rbx, %xmm1	; _1, _1
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%r12, %rsi	; table,
; temp/codegen.c:17:     table->size = 0;
	movq	$0, 16(%r12)	;, table_25->size
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp116, tmp106
	punpcklqdq	%xmm1, %xmm0	; _1, tmp106
	movups	%xmm0, (%r12)	; tmp106, MEM <vector(2) long unsigned int> [(void *)table_25]
; temp/codegen.c:318: }
	popq	%rbx	;
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	0(%rbp), %rdi	; tac_17(D)->attribute_tables, tac_17(D)->attribute_tables
; temp/codegen.c:318: }
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L71:
; temp/codegen.c:318: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; temp/codegen.c:318: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC8(%rip), %rdx	;, tmp109
; temp/codegen.c:318: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L75:
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
.L73:
	movq	%rbx, %rdi	; _1,
	call	create_var	;
; temp/codegen.c:318: }
	popq	%rbx	;
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp114, _8
; temp/codegen.c:318: }
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L74:
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rdx, %rcx	; status,
	movq	(%rbx), %rsi	; _1->type, _1->type
	movl	$118, %edx	;,
	jmp	.L73	;
	.size	codegen_import, .-codegen_import
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC10:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.p2align 4
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp142, status
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp141, variable
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	%r12, %rcx	; status,
; temp/codegen.c:384: void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
	pushq	%rbx	;
	movl	%edx, %ebx	; tmp143, type
	subq	$32, %rsp	;,
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rsi	; variable_20(D)->type, variable_20(D)->type
	movq	8(%rdi), %rdi	; variable_20(D)->name, variable_20(D)->name
	call	create_var	;
	movq	%rax, %rsi	; tmp144, var
; temp/codegen.c:386:     switch (type) {
	leal	-97(%rbx), %eax	;,
	cmpl	$21, %eax	;, tmp115
	ja	.L77	;,
	leaq	.L79(%rip), %rdx	;, tmp117
	movslq	(%rdx,%rax,4), %rax	;, tmp119
	addq	%rdx, %rax	; tmp117, tmp120
	jmp	*%rax	; tmp120
	.section	.rodata
	.align 4
	.align 4
.L79:
	.long	.L83-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L82-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L81-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L77-.L79
	.long	.L78-.L79
	.long	.L77-.L79
	.long	.L78-.L79
	.text
	.p2align 4,,10
	.p2align 3
.L78:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%r12), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	24(%rax), %rdi	;, _5->local_vars
.L86:
; temp/codegen.c:410: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L77:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; temp/codegen.c:410: }
	addq	$32, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	xorl	%eax, %eax	;
; temp/codegen.c:410: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC10(%rip), %rdx	;, tmp140
; temp/codegen.c:410: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; temp/codegen.c:410: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L83:
; temp/codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%r12), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	(%rax), %rdi	; _11->attribute_tables, _11->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp145, attr_table
; temp/codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%r12), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	%rbx, %rsi	; attr_table,
	movq	(%rax), %rdi	; _13->attribute_tables, _13->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqu	0(%rbp), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)]
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqa	%xmm0, %xmm1	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], vect__15.121
	movaps	%xmm0, 16(%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], %sfp
	shufpd	$1, %xmm0, %xmm1	;, MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], vect__15.121
	movaps	%xmm1, (%rsp)	; vect__15.121, %sfp
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:34:     attr->var_name = var_name;
	movdqa	(%rsp), %xmm1	; %sfp, vect__15.121
; temp/codegen.c:39:         table->size += get_type_size(type);
	movdqa	16(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)]
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rbp	; tmp146, attr
; temp/codegen.c:34:     attr->var_name = var_name;
	movups	%xmm1, (%rax)	; vect__15.121, MEM <vector(2) long unsigned int> [(struct Symbol * *)attr_34]
; temp/codegen.c:38:         attr->offset = table->size;
	movq	16(%rbx), %rax	; attr_table_30->size, attr_table_30->size
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	%xmm0, %rdi	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], tmp136
; temp/codegen.c:38:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; attr_table_30->size, attr_34->offset
; temp/codegen.c:39:         table->size += get_type_size(type);
	call	get_type_size	;
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%rbx), %rdi	; attr_table_30->attributes, _39
; temp/codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, 16(%rbx)	; tmp147, attr_table_30->size
; temp/codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _39
	jne	.L86	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
; temp/codegen.c:410: }
	addq	$32, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
; temp/codegen.c:410: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC9(%rip), %rdi	;, tmp138
; temp/codegen.c:410: }
	popq	%rbp	;
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L82:
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%r12), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	16(%rax), %rdi	;, _9->global_vars
; temp/codegen.c:410: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L81:
; temp/codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%r12), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	16(%rax), %rdi	;, _3->parameters
; temp/codegen.c:410: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.size	codegen_variable, .-codegen_variable
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"[warning] Invalid variable access input\n"
	.align 8
.LC12:
	.string	"[warning] Variable access name is NULL\n"
	.align 8
.LC13:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
	.align 8
.LC14:
	.string	"[warning] Invalid get-attribute access\n"
	.align 8
.LC15:
	.string	"[warning] Failed to generate object for get-attribute access\n"
	.align 8
.LC16:
	.string	"[warning] Invalid get-sequence access\n"
	.align 8
.LC17:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
	.align 8
.LC18:
	.string	"[warning] Invalid function call without callee\n"
	.align 8
.LC19:
	.string	"[warning] Failed to generate callee for function call\n"
	.align 8
.LC20:
	.string	"[warning] Unsupported callee in function call\n"
	.align 8
.LC21:
	.string	"[warning] Failed to generate function call argument\n"
	.align 8
.LC22:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.p2align 4
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rdi, %rdi	; variable_access
	je	.L145	;,
	movq	%rsi, %rbp	; tmp318, status
	testq	%rsi, %rsi	; status
	je	.L145	;,
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rdi), %ecx	; variable_access_91(D)->type, _5
	movq	%rdi, %rbx	; tmp317, variable_access
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%ecx, %ecx	; _5
	jne	.L91	;,
; temp/codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rdi), %r13	; variable_access_91(D)->content.name, name
; temp/codegen.c:712:         if (name == NULL) {
	testq	%r13, %r13	; name
	je	.L224	;,
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rsi), %rdx	; status_92(D)->current_subroutine, _187
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rdx, %rdx	; _187
	je	.L225	;,
; temp/codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rdx), %rcx	; _187->parameters, _187->parameters
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rcx, %rcx	; _187->parameters
	je	.L98	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rcx), %rax	; _188->head, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L98	;,
	.p2align 4,,10
	.p2align 3
.L101:
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	; current_423->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	; var
	je	.L99	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r13	; var_201->original_name, name
	je	.L221	;,
.L99:
; temp/codegen.c:205:         current = current->next;
	movq	(%rax), %rax	; current_423->next, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L101	;,
.L98:
; temp/codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rdx), %rax	; _187->local_vars, _190
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	; _190
	je	.L105	;,
	.p2align 4,,10
	.p2align 3
.L102:
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	;* _190, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L105	;,
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	; current_159->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	; var
	je	.L102	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r13	; var_211->original_name, name
	jne	.L102	;,
	.p2align 4,,10
	.p2align 3
.L221:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; _19, tmp265
	movhps	16(%rbx), %xmm0	;, tmp265
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp325, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp265,* <retval>
.L87:
; temp/codegen.c:833: }
	popq	%rbx	;
	movq	%r14, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L91:
; temp/codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _5
	je	.L226	;,
; temp/codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _5
	je	.L227	;,
; temp/codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _5
	jne	.L128	;,
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rdi), %rdi	; variable_access_91(D)->base, _45
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _45
	je	.L228	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rdi)	;, _45->type
	jne	.L130	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rdi), %r13	; _45->content.attr_name, callee_name
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r13, %r13	; callee_name
	je	.L130	;,
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r13), %eax	; _48->kind, tmp359
	subl	$1, %eax	;, tmp291
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	;, tmp291
	ja	.L130	;,
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rdi), %rdi	; _45->base, _51
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rdi, %rdi	; _51
	je	.L144	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	16(%rdi), %edx	; _51->type,
	testl	%edx, %edx	;
	jne	.L132	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rdi), %rax	; _51->content.name, _53
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _53
	je	.L132	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _53->kind,
	testl	%eax, %eax	;
	je	.L144	;,
.L132:
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbp, %rsi	; status,
	call	codegen_variable_access	;
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rax, %rdi	; tmp336, _55
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	call	load_rvalue	;
	movq	%rax, %rdi	; tmp337, receiver
; temp/codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	; receiver
	je	.L144	;,
; temp/codegen.c:806:             emit_param_instruction(receiver, status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:807:             ++argument_count;
	movl	$1, %r12d	;, argument_count
; temp/codegen.c:806:             emit_param_instruction(receiver, status);
	call	emit_param_instruction	;
.L134:
; temp/codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbx), %rdi	; variable_access_91(D)->content.args, variable_access_91(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp339, args
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L138	;
	.p2align 4,,10
	.p2align 3
.L140:
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	codegen_expression	;
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rax, %rdi	; tmp340, _65
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	call	load_rvalue	;
	movq	%rax, %rdi	; tmp341, arg_value
; temp/codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	; arg_value
	je	.L229	;,
; temp/codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:818:             ++argument_count;
	addq	$1, %r12	;, argument_count
; temp/codegen.c:817:             emit_param_instruction(arg_value, status);
	call	emit_param_instruction	;
.L138:
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbx, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp342, arg_expr
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	jne	.L140	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp343, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$5, 16(%rax)	;, arg_310->kind
; temp/codegen.c:168:             arg->value.string_value = NULL;
	movq	$0, (%rax)	;, arg_310->value.string_value
; temp/codegen.c:169:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void.17_319
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_310->is_get
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	0(%r13), %rsi	; callee_name_73->type, _67
; temp/codegen.c:169:             arg->type = name_void;
	movq	%rax, 8(%r14)	; name_void.17_319, arg_310->type
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rsi, %rsi	; _67
	je	.L141	;,
	cmpq	%rax, %rsi	; name_void.17_319, _67
	je	.L141	;,
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp344, _69
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; _69, tmp306
	movhps	16(%rbx), %xmm0	; _69->type, tmp306
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_322->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp345, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_322->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp306, MEM <vector(2) long unsigned int> [(void *)arg_322]
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	0(%r13), %rsi	; callee_name_73->type, _67
.L141:
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r13, %rdi	; callee_name,
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	; tmp346, _72
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; _72, tmp308
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movhps	16(%rbx), %xmm0	; _72->type, tmp308
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp347, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	;, arg_346->kind
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp308, MEM <vector(2) long unsigned int> [(void *)arg_346]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_346->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	; argument_count, arg_334->value.int_value
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp348, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_334->kind
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;, arg_334->is_get
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int, arg_334->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_161->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp349, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; <retval>, inst_161->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; arg, inst_161->arg3
; temp/codegen.c:136:     inst->type = type;
	movl	$22, 24(%rax)	;, inst_161->type
; temp/codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rbp), %rax	; status_92(D)->current_block, status_92(D)->current_block
	movq	8(%rax), %rdi	; _74->instructions, _74->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:828:         return result;
	jmp	.L87	;
	.p2align 4,,10
	.p2align 3
.L227:
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rdi), %rdi	; variable_access_91(D)->base, _28
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rdi, %rdi	; _28
	je	.L123	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rbx)	;, variable_access_91(D)->content.index
	je	.L123	;,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	;
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	; tmp329, _31
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	load_rvalue	;
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rbx), %rdi	; variable_access_91(D)->content.index, variable_access_91(D)->content.index
	movq	%rbp, %rsi	; status,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %r12	; tmp330, sequence
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	codegen_expression	;
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rax, %rdi	; tmp331, _33
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	load_rvalue	;
	movq	%rax, %r13	; tmp332, index
; temp/codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%r12, %r12	; sequence
	je	.L146	;,
	testq	%rax, %rax	; index
	je	.L146	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%r12), %rsi	; sequence_125->type, _38
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_float(%rip), %rsi	; name_float, _38
; temp/codegen.c:755:         Symbol* element_type = name_int;
	movq	name_int(%rip), %rax	; name_int, element_type
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	je	.L127	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_bool(%rip), %rsi	; name_bool, _38
	je	.L127	;,
; temp/codegen.c:755:         Symbol* element_type = name_int;
	cmpq	name_string(%rip), %rsi	; name_string, _38
	cmovne	%rax, %rsi	; _38,, element_type, _38
.L127:
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp333, _42
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; _42, tmp285
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	; _42->type, tmp285
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp334, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_298->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp285, MEM <vector(2) long unsigned int> [(void *)arg_298]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_298->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; sequence, inst_160->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp335, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$16, 24(%rax)	;, inst_160->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; <retval>, inst_160->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; index, inst_160->arg3
; temp/codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_92(D)->current_block, status_92(D)->current_block
	movq	8(%rax), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:761:         result->is_get = true;
	movb	$1, 20(%r14)	;, arg_298->is_get
; temp/codegen.c:762:         return result;
	jmp	.L87	;
	.p2align 4,,10
	.p2align 3
.L130:
; temp/codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rbp, %rsi	; status,
	call	codegen_variable_access	;
; temp/codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	; callee
	je	.L230	;,
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %edx	; callee_99->kind, _57
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %edx	;, _57
	je	.L231	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%edx, %edx	; _57
	jne	.L137	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	; callee_99->value.variable, _59
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	; _59
	je	.L137	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r13	; _59->original_name, callee_name
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r13, %r13	; callee_name
	je	.L137	;,
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r13), %eax	; _60->kind, tmp360
	subl	$1, %eax	;, tmp295
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp295
	jbe	.L144	;,
	.p2align 4,,10
	.p2align 3
.L137:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp298
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:801:             return NULL;
	jmp	.L90	;
	.p2align 4,,10
	.p2align 3
.L226:
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rdi), %rdi	; variable_access_91(D)->base, _20
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rdi, %rdi	; _20
	je	.L118	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rbx), %rbx	; variable_access_91(D)->content.attr_name, _21
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rbx, %rbx	; _21
	je	.L118	;,
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rbx), %eax	; _21->kind, tmp356
	subl	$1, %eax	;, tmp269
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	;, tmp269
	jbe	.L232	;,
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	;
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rbp, %rdx	; status,
	movq	%rbx, %rsi	; _21,
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	movq	%rax, %rdi	; tmp328, object
; temp/codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	; object
	je	.L233	;,
.L223:
; temp/codegen.c:833: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	jmp	emit_attribute_access	;
	.p2align 4,,10
	.p2align 3
.L225:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	; status_92(D)->tac, status_92(D)->tac
	movq	16(%rax), %rax	; _217->global_vars, _336
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	; _336
	je	.L215	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	; _336->head, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L215	;,
	.p2align 4,,10
	.p2align 3
.L111:
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	; current_140->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	; var
	je	.L110	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r13	; var_221->original_name, name
	je	.L221	;,
.L110:
; temp/codegen.c:205:         current = current->next;
	movq	(%rax), %rax	; current_140->next, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L111	;,
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r13)	;, name_144->kind
	jbe	.L96	;,
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rdx, %rdx	; _187
	je	.L97	;,
	movq	16(%rdx), %rcx	; _187->parameters, _187->parameters
.L104:
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	(%rcx), %rbx	; _251->head, current
; temp/codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L97	;,
	.p2align 4,,10
	.p2align 3
.L114:
; temp/codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%rbx), %r12	; current_83->content, var
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%r12, %r12	; var
	je	.L115	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%r12), %rax	; var_254->original_name, _255
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	; _255
	je	.L115	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rdi	; _255->name, _255->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	; tmp322
	jne	.L234	;,
.L115:
; temp/codegen.c:232:         current = current->next;
	movq	(%rbx), %rbx	; current_83->next, current
; temp/codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L114	;,
.L97:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r13), %rcx	; name_144->name, name_144->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC13(%rip), %rdx	;, tmp263
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	0(%r13), %rsi	; name_144->type, name_144->type
	movq	%rbp, %rcx	; status,
	movq	%r13, %rdi	; name,
	movl	$118, %edx	;,
	call	create_var	;
	movq	%rax, %rbx	; tmp324, _19
	jmp	.L221	;
	.p2align 4,,10
	.p2align 3
.L234:
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%r12), %rax	; var_254->type, _10
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	; _10
	je	.L97	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movl	32(%rax), %ecx	; _10->kind,
	testl	%ecx, %ecx	;
	jne	.L97	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	; _10->ast_node.class, _10->ast_node.class
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	; _13->class_scope, tmp353
	cmpq	%rax, 24(%r13)	; tmp353, name_144->ast_node.scope
	jne	.L97	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; var, tmp259
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; name,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; var_254->type, tmp259
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_262->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	; tmp323, arg
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_262->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp259, MEM <vector(2) long unsigned int> [(void *)arg_262]
	jmp	.L223	;
	.p2align 4,,10
	.p2align 3
.L145:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$40, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp243
	call	*fwrite@GOTPCREL(%rip)	;
.L90:
; temp/codegen.c:708:         return NULL;
	xorl	%r14d, %r14d	; <retval>
	jmp	.L87	;
	.p2align 4,,10
	.p2align 3
.L215:
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r13)	;, name_144->kind
	ja	.L97	;,
	.p2align 4,,10
	.p2align 3
.L96:
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	0(%r13), %rsi	; name_144->type, name_144->type
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r13, %rdi	; name,
.L222:
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	; tmp326, _26
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; _26, tmp272
	movhps	16(%rbx), %xmm0	;, tmp272
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp327, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	;,
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp272,* <retval>
; temp/codegen.c:833: }
	movq	%r14, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L128:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC22(%rip), %rdx	;, tmp314
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:832:     return NULL;
	jmp	.L90	;
	.p2align 4,,10
	.p2align 3
.L229:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp301
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:815:                 return NULL;
	jmp	.L90	;
	.p2align 4,,10
	.p2align 3
.L224:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp245
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:714:             return NULL;
	jmp	.L90	;
	.p2align 4,,10
	.p2align 3
.L232:
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %rsi	; _21->type, _21->type
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbx, %rdi	; _21,
	jmp	.L222	;
	.p2align 4,,10
	.p2align 3
.L231:
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rax), %rax	; callee_99->value.subroutine, _58
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	; _58
	je	.L137	;,
; temp/codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r13	; _58->original_name, callee_name
; temp/codegen.c:799:         if (callee_name == NULL) {
	testq	%r13, %r13	; callee_name
	je	.L137	;,
.L144:
; temp/codegen.c:804:         size_t argument_count = 0;
	xorl	%r12d, %r12d	; argument_count
	jmp	.L134	;
	.p2align 4,,10
	.p2align 3
.L105:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	0(%rbp), %rax	; status_92(D)->tac, status_92(D)->tac
	movq	16(%rax), %rax	;, _193
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	; _193
	je	.L108	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	;* _206, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L111	;,
.L108:
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r13)	;, name_144->kind
	ja	.L104	;,
	jmp	.L96	;
.L123:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp277
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:747:             return NULL;
	jmp	.L90	;
.L118:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rdi	;, tmp268
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:731:             return NULL;
	jmp	.L90	;
.L233:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$61, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp275
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:739:             return NULL;
	jmp	.L90	;
.L228:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp290
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:768:             return NULL;
	jmp	.L90	;
.L146:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$68, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp284
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:753:             return NULL;
	jmp	.L90	;
.L230:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp294
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:789:                 return NULL;
	jmp	.L90	;
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC25:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.text
	.p2align 4
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; temp/codegen.c:655:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; temp/codegen.c:655:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L236	;,
	leaq	.L238(%rip), %rdx	;, tmp136
	movq	%rsi, %rbp	; tmp173, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp138
	addq	%rdx, %rax	; tmp136, tmp139
	jmp	*%rax	; tmp139
	.section	.rodata
	.align 4
	.align 4
.L238:
	.long	.L246-.L238
	.long	.L245-.L238
	.long	.L244-.L238
	.long	.L243-.L238
	.long	.L242-.L238
	.long	.L241-.L238
	.long	.L240-.L238
	.long	.L239-.L238
	.long	.L237-.L238
	.text
	.p2align 4,,10
	.p2align 3
.L239:
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	codegen_primary	;
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp186, _15
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %r13	; tmp187, operand
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp188, _17
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _17, tmp158
	movhps	16(%r12), %xmm0	; _17->type, tmp158
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_174->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp189, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_174->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp158, MEM <vector(2) long unsigned int> [(void *)arg_174]
; temp/codegen.c:687:             if (operand->type == name_int)
	movq	8(%r13), %rax	; operand_42->type, _18
; temp/codegen.c:687:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L253	;,
; temp/codegen.c:689:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L254	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; temp/codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC24(%rip), %rdx	;, tmp165
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L255:
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L237:
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.var
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	jmp	codegen_variable_access	;
	.p2align 4,,10
	.p2align 3
.L246:
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	xorl	%esi, %esi	;
	call	*strtoll@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rbp	; tmp174, _3
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_102->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp175, <retval>
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; _3, arg_102->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int,
.L235:
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L245:
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	xorl	%esi, %esi	;
	call	*strtod@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; _5, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	8(%rsp), %xmm0	; %sfp, _5
; temp/codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_114->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp177, <retval>
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _5, arg_114->value.float_value
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:157:             arg->type = name_float;
	movq	%rax, 8(%rbx)	; name_float,
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L244:
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %xmm0	; primary_36(D)->value.literal_value, _6
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%xmm0, 8(%rsp)	; _6, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movq	8(%rsp), %xmm0	; %sfp, _6
; temp/codegen.c:144:     arg->kind = kind;
	movl	$3, 16(%rax)	;, arg_126->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp178, <retval>
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movhps	name_string(%rip), %xmm0	; name_string, tmp145
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rax)	; tmp145, MEM <vector(2) long unsigned int> [(void *)arg_126]
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L243:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_138->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp179, <retval>
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	;, arg_138->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L242:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_150->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp180, <retval>
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	;, arg_150->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L241:
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	jmp	codegen_expression	;
	.p2align 4,,10
	.p2align 3
.L240:
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	codegen_primary	;
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp181, _9
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	name_bool(%rip), %rsi	; name_bool,
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %r13	; tmp182, operand
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %r12	; tmp183, _11
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _11, tmp152
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _11->type, tmp152
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp184, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_162->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp152, MEM <vector(2) long unsigned int> [(void *)arg_162]
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_162->kind
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; operand, inst_82->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp185, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_82->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$13, 24(%rax)	;, inst_82->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_82->arg3
; temp/codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:703: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L236:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; temp/codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC25(%rip), %rdx	;, tmp170
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L255	;
	.p2align 4,,10
	.p2align 3
.L254:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_198->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp192, arg
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	.LC23(%rip), %rax	;, tmp197
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_198->is_get
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	%rax, (%r12)	; tmp197, arg_198->value.float_value
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%r12)	; name_float, arg_198->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$2, 24(%rax)	;, inst_84->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp193, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg,
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; operand,
.L249:
; temp/codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:696:             return temp;
	jmp	.L235	;
	.p2align 4,,10
	.p2align 3
.L253:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_186->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp190, arg
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_186->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_186->is_get
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%r12)	; name_int, arg_186->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$1, 24(%rax)	;, inst_83->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp191, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg,
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; operand,
	jmp	.L249	;
	.size	codegen_primary, .-codegen_primary
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp146, expression
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp147, status
	subq	$8, %rsp	;,
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
	je	.L270	;,
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
	call	codegen_expression	;
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rax, %rdi	; tmp148, _4
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	call	load_rvalue	;
	movq	%rax, %rbp	; tmp149, <retval>
; temp/codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	; expression_30(D)->operator,
	cmpl	$18, %eax	;, _5
	ja	.L258	;,
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	leaq	CSWTCH.51(%rip), %rdx	;, tmp125
	movq	%rbx, %rsi	; status,
	movl	(%rdx,%rax,4), %r13d	; CSWTCH.51[_5], _50
	call	codegen_expression	;
	movq	%rax, %r14	; tmp150, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp128
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp128
	ja	.L259	;,
; temp/codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	;, _50
	jne	.L263	;,
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_96->kind,
	testl	%eax, %eax	;
	jne	.L271	;,
.L261:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_53->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp155, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_53->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_53->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_53->arg3
; temp/codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%r14)	;, left_96->is_get
	jne	.L272	;,
.L262:
; temp/codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:653: }
	addq	$8, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L258:
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	;, _50
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	call	codegen_expression	;
	movq	%rax, %r14	; tmp161, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp144
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp144
	ja	.L259	;,
.L263:
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r14), %rsi	; left_98->type, left_98->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r15	; tmp151, _9
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _9, tmp131
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r14, %rdi	; left,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r15), %xmm0	; _9->type, tmp131
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_77->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp152, arg
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_77->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp131, MEM <vector(2) long unsigned int> [(void *)arg_77]
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r15	; tmp153, _10
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; _10, inst_52->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp154, inst
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_52->arg3
; temp/codegen.c:639:             right = temp;
	movq	%r12, %rbp	; arg, <retval>
; temp/codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	; _50, inst_52->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_52->arg1
; temp/codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_96->kind,
	testl	%eax, %eax	;
	je	.L261	;,
.L271:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rdi	;, tmp136
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L261	;
	.p2align 4,,10
	.p2align 3
.L259:
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r14), %rsi	; left_97->type, left_97->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r15	; tmp157, _17
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _17, tmp138
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r14, %rdi	; left,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r15), %xmm0	; _17->type, tmp138
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_89->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp158, arg
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_89->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp138, MEM <vector(2) long unsigned int> [(void *)arg_89]
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r14	; tmp159, _18
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_55->arg3
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp160, inst
; temp/codegen.c:649:         right = temp;
	movq	%r12, %rbp	; arg, <retval>
; temp/codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	; _50, inst_55->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_55->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; _18, inst_55->arg2
	jmp	.L262	;
	.p2align 4,,10
	.p2align 3
.L270:
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
; temp/codegen.c:653: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	jmp	codegen_primary	;
	.p2align 4,,10
	.p2align 3
.L272:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$24, 24(%rax)	;, inst_54->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp156, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_54->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_54->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_54->arg3
	jmp	.L262	;
	.size	codegen_expression, .-codegen_expression
	.p2align 4
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%r15	;
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	movq	%rdi, %r15	; tmp186, if_
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movl	$98, %edx	;,
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r14	;
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp187, status
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	subq	$56, %rsp	;,
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp188, then_label
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r15), %rdi	; if__61(D)->else_if, if__61(D)->else_if
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp189, else_label
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp190
	je	.L276	;,
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp192
	jne	.L297	;,
.L276:
; temp/codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, 40(%rsp)	; tmp191, %sfp
.L275:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_185->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp193, arg
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_185->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	40(%rsp), %rax	; %sfp, end_label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_185->is_get
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%r15), %rdi	; if__61(D)->condition, if__61(D)->condition
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rax, (%r14)	; end_label, arg_185->value.label
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	call	codegen_expression	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rax, 16(%rsp)	; condition, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp195, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_173->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_173->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_173->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_173->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; then_label, arg_161->value.label
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_161->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_161->type
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_161->is_get
	movq	%rax, 8(%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	16(%rsp), %rcx	; %sfp, condition
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	8(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp197, inst
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; arg, inst_129->arg3
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_129->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_129->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_129->type
; temp/codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp198, block
; temp/codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	; then_label, block_159->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp199, block_159->instructions
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _10->blocks, _10->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:468:     status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_56(D)->current_block
; temp/codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r15), %rdi	; if__61(D)->body, if__61(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp200, then_statements
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L277	;
	.p2align 4,,10
	.p2align 3
.L278:
; temp/codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L277:
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp201, statement
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L278	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_130->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp202, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_130->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_130->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_130->arg3
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r15), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp203
	je	.L298	;,
.L279:
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp221
	je	.L299	;,
.L286:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp227, block
; temp/codegen.c:109:     block->label = label;
	movq	40(%rsp), %rax	; %sfp, end_label
	movq	%rax, 0(%rbp)	; end_label, block_227->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp228, block_227->instructions
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _40->blocks, _40->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:528:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_56(D)->current_block
; temp/codegen.c:529: }
	addq	$56, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L297:
; temp/codegen.c:457:         end_label = else_label;
	movq	%rbp, 40(%rsp)	; else_label, %sfp
	jmp	.L275	;
	.p2align 4,,10
	.p2align 3
.L299:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp222, block
; temp/codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_225->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp223, block_225->instructions
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:515:         status->current_block = else_block;
	movq	%r12, 16(%rbx)	; block, status_56(D)->current_block
; temp/codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp224, else_statements
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L287	;
	.p2align 4,,10
	.p2align 3
.L288:
; temp/codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L287:
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp225, else_statement
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L288	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_133->arg1
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp226, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_133->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_133->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_133->arg3
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _38->instructions, _38->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L286	;
	.p2align 4,,10
	.p2align 3
.L298:
; temp/codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp204, %sfp
	.p2align 4,,10
	.p2align 3
.L280:
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp220, elif
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L279	;,
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp205, block
; temp/codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_197->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%r13, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp206, block_197->instructions
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:486:             status->current_block = else_if_block;
	movq	%r13, 16(%rbx)	; block, status_56(D)->current_block
; temp/codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 8(%rsp)	; tmp207, %sfp
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	(%r12), %rdi	; elif_87->condition, elif_87->condition
	movq	%rbx, %rsi	; status,
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp208, else_label
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	call	codegen_expression	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rsp), %rdi	; %sfp,
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	%rax, 24(%rsp)	; tmp209, %sfp
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp210
	jne	.L300	;,
.L282:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp212, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_213->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_213->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_213->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_213->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	; tmp213, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_201->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_201->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	8(%rsp), %rax	; %sfp, then_label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rcx)	;, arg_201->is_get
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rax, (%rcx)	; then_label, arg_201->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movq	%rcx, 32(%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	24(%rsp), %rdx	; %sfp, condition
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	32(%rsp), %rcx	; %sfp, arg
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp214, inst
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; arg, inst_131->arg3
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_131->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rdx, (%rax)	; condition, inst_131->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_131->type
; temp/codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _26->instructions, _26->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp215, block
; temp/codegen.c:109:     block->label = label;
	movq	8(%rsp), %rax	; %sfp, then_label
	movq	%rax, 0(%r13)	; then_label, block_199->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp216, block_199->instructions
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _28->blocks, _28->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rdi	; elif_87->body, elif_87->body
; temp/codegen.c:499:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_56(D)->current_block
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp217, elif_statements
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L283	;
	.p2align 4,,10
	.p2align 3
.L284:
; temp/codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L283:
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp218, elif_statement
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L284	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_132->arg1
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp219, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_132->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_132->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_132->arg3
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _31->instructions, _31->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L280	;
	.p2align 4,,10
	.p2align 3
.L300:
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:493:                 else_label = end_label;
	testb	%al, %al	; tmp211
	cmovne	40(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L282	;
	.size	codegen_if, .-codegen_if
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC28:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC29:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.p2align 4
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
; temp/codegen.c:412:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_27(D)->type,
; temp/codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L302	;,
; temp/codegen.c:411: void codegen_statement(Statement* statement, TACStatus* status) {
	pushq	%rbp	;
; temp/codegen.c:412:     switch (statement->type) {
	leaq	.L304(%rip), %rdx	;, tmp120
; temp/codegen.c:411: void codegen_statement(Statement* statement, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp153, status
	subq	$8, %rsp	;,
; temp/codegen.c:412:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp122
	addq	%rdx, %rax	; tmp120, tmp123
	jmp	*%rax	; tmp123
	.section	.rodata
	.align 4
	.align 4
.L304:
	.long	.L311-.L304
	.long	.L310-.L304
	.long	.L309-.L304
	.long	.L308-.L304
	.long	.L307-.L304
	.long	.L306-.L304
	.long	.L305-.L304
	.long	.L303-.L304
	.text
	.p2align 4,,10
	.p2align 3
.L305:
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp157
	jne	.L312	;,
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbx), %rax	; status_28(D)->end_labels, status_28(D)->end_labels
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _12->tail, _12->tail
	movq	8(%rax), %rbp	; _13->content, label
; temp/codegen.c:427:                 if (label != NULL) {
	testq	%rbp, %rbp	; label
	je	.L312	;,
.L324:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp158, inst
	jmp	.L323	;
	.p2align 4,,10
	.p2align 3
.L303:
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp159
	jne	.L313	;,
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rbx), %rax	; status_28(D)->start_labels, status_28(D)->start_labels
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _19->tail, _19->tail
	movq	8(%rax), %rbp	; _20->content, label
; temp/codegen.c:438:                 if (label != NULL) {
	testq	%rbp, %rbp	; label
	jne	.L324	;,
.L313:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
; temp/codegen.c:450: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %rdi	;, tmp149
; temp/codegen.c:450: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L309:
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.if_stmt, statement_27(D)->stmt.if_stmt
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	codegen_if	;
	.p2align 4,,10
	.p2align 3
.L311:
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.expr, statement_27(D)->stmt.expr
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	codegen_expression	;
	.p2align 4,,10
	.p2align 3
.L310:
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rdi), %rax	; statement_27(D)->stmt.var, _3
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	(%rax), %rsi	; _3->type, _3->type
	movq	8(%rax), %rdi	; _3->name, _3->name
	call	create_var	;
	movq	%rax, %rsi	; tmp154, var
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	24(%rax), %rdi	; _69->local_vars, _69->local_vars
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L307:
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.for_stmt, statement_27(D)->stmt.for_stmt
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	codegen_for	;
	.p2align 4,,10
	.p2align 3
.L306:
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rdi), %rdi	; statement_27(D)->stmt.return_expr, statement_27(D)->stmt.return_expr
	call	codegen_expression	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	%rax, %rbp	; tmp155, return_value
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$21, 24(%rax)	;, inst_43->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp156, inst
.L323:
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rsi)	; label,* inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;,
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;,
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rdi	;, _14->instructions
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L308:
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.while_stmt, statement_27(D)->stmt.while_stmt
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	codegen_while	;
	.p2align 4,,10
	.p2align 3
.L312:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
; temp/codegen.c:450: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC27(%rip), %rdi	;, tmp142
; temp/codegen.c:450: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L302:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC29(%rip), %rdx	;, tmp151
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	codegen_statement, .-codegen_statement
	.p2align 4
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp184, for_
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp185, status
	subq	$24, %rsp	;,
; temp/codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rdi), %rax	; for__53(D)->initializer, _1
; temp/codegen.c:532:     if (for_->initializer != NULL)
	testq	%rax, %rax	; _1
	je	.L326	;,
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rax), %rsi	; _1->type, _1->type
	movq	8(%rax), %rdi	; _1->name, _1->name
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp186, var
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	24(%rax), %rdi	; _151->local_vars, _151->local_vars
	call	*list_append@GOTPCREL(%rip)	;
.L326:
; temp/codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	; tmp187, condition_label
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r15	; tmp188, body_label
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp189, end_label
; temp/codegen.c:538:     if (for_->condition != NULL) {
	je	.L327	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp190, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_198->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_198->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp191, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_111->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_111->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_111->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_111->arg3
; temp/codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp192, block
; temp/codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	; condition_label, block_196->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp193, block_196->instructions
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:544:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; block, status_54(D)->current_block
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%r12), %rdi	; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %rbp	; tmp195, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_184->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_184->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; end_label, arg_184->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_184->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_172->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_172->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_172->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_172->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, condition
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_110->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp197, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_110->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_110->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_110->arg3
; temp/codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	;, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L328:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp200, block
; temp/codegen.c:109:     block->label = label;
	movq	%r15, (%rax)	; body_label, block_222->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp201, block_222->instructions
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _16->blocks, _16->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:557:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; block, status_54(D)->current_block
; temp/codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; temp/codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__53(D)->increment
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, (%rsp)	; increment_label, %sfp
	movq	%rax, %rbp	; tmp202, increment_label
; temp/codegen.c:560:     if (for_->increment != NULL)
	je	.L329	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp203, arg
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_224->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_224->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; increment_label, arg_224->value.label
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	*list_append@GOTPCREL(%rip)	;
.L330:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_260->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp206, arg
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_260->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_260->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; end_label, arg_260->value.label
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__53(D)->body, for__53(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp207, body_statements
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L332	;
	.p2align 4,,10
	.p2align 3
.L333:
; temp/codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L332:
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, statement
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L333	;,
; temp/codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__53(D)->increment
	je	.L334	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp209, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_274->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_274->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	(%rsp), %rax	; %sfp, increment_label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_274->is_get
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rax, 0(%rbp)	; increment_label, arg_274->value.label
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp210, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_113->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_113->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_113->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_113->arg3
; temp/codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp211, block
; temp/codegen.c:109:     block->label = label;
	movq	(%rsp), %rax	; %sfp, increment_label
	movq	%rax, 0(%rbp)	; increment_label, block_272->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp212, block_272->instructions
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:579:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; block, status_54(D)->current_block
; temp/codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%r12), %rdi	; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
.L334:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp213, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_286->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_286->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_286->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_286->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_114->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp214, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_114->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_114->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_114->arg3
; temp/codegen.c:584:     if (for_->condition == NULL)
	je	.L340	;,
.L335:
; temp/codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _41->instructions, _41->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp217, block
; temp/codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	; end_label, block_310->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp218, block_310->instructions
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _43->blocks, _43->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:590:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_54(D)->current_block
; temp/codegen.c:591: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L329:
; temp/codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L331	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp204, arg
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_236->value.label
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L330	;
	.p2align 4,,10
	.p2align 3
.L327:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp198, arg
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_210->value.label
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_210->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_112->arg1
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp199, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_112->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_112->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_112->arg3
; temp/codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	;, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L328	;
	.p2align 4,,10
	.p2align 3
.L340:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp215, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_298->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_298->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_298->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_298->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_115->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp216, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_115->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_115->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_115->arg3
	jmp	.L335	;
	.p2align 4,,10
	.p2align 3
.L331:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp205, arg
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_248->value.label
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L330	;
	.size	codegen_for, .-codegen_for
	.p2align 4
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%r15	;
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp141, while_
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp142, status
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	subq	$24, %rsp	;,
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp143, condition_label
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp144, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_137->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_137->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_137->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_137->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp145, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_68->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_68->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_68->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_68->arg3
; temp/codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp146, block
; temp/codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	; condition_label, block_135->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%r13, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp147, block_135->instructions
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:599:     status->current_block = condition_block;
	movq	%r13, 16(%rbx)	; block, status_27(D)->current_block
; temp/codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	xorl	%esi, %esi	;
	movl	$98, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; temp/codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp148, body_label
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	0(%rbp), %rdi	; while__40(D)->condition, while__40(D)->condition
	movq	%rbx, %rsi	; status,
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	; tmp149, end_label
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	call	codegen_expression	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp151, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_123->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_123->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; end_label, arg_123->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_123->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_111->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_111->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; body_label, arg_111->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_111->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, condition
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp153, inst
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	; arg, inst_67->arg3
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_67->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_67->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_67->type
; temp/codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp154, block
; temp/codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	; body_label, block_109->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r15, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r15)	; tmp155, block_109->instructions
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:609:     status->current_block = body_block;
	movq	%r15, 16(%rbx)	; block, status_27(D)->current_block
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_97->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp156, arg
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_97->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_97->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_97->value.label
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_85->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp157, arg
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_85->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_85->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; end_label, arg_85->value.label
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rdi	; while__40(D)->body, while__40(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp158, body_statements
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L342	;
	.p2align 4,,10
	.p2align 3
.L343:
; temp/codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L342:
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp159, statement
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L343	;,
; temp/codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp160, arg
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_151->value.label
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_151->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_151->type
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_151->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp161, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_69->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_69->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_69->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_69->arg3
; temp/codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp162, block
; temp/codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	; end_label, block_149->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp163, block_149->instructions
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _23->blocks, _23->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:625:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_27(D)->current_block
; temp/codegen.c:626: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	codegen_while, .-codegen_while
	.p2align 4
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp114, function
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp115, status
	subq	$16, %rsp	;,
; temp/codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; temp/codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movaps	%xmm0, (%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], %sfp
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:100:     subroutine->name = name;
	movdqa	(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp116, subroutine
; temp/codegen.c:100:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_39]
; temp/codegen.c:102:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp117, subroutine_39->parameters
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp118, subroutine_39->local_vars
; temp/codegen.c:104:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; temp/codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp119, subroutine_39->blocks
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
; temp/codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r13), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp120, parameters
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L346	;
	.p2align 4,,10
	.p2align 3
.L347:
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_39->parameters, subroutine_39->parameters
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp121, _8
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
.L346:
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L347	;,
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	; tmp123, _10
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, block
; temp/codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	; _10, block_43->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_39->blocks, subroutine_39->blocks
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp125, block_43->instructions
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:332:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r13), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp126, statements
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L348	;
	.p2align 4,,10
	.p2align 3
.L349:
; temp/codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L348:
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp127, statement
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L349	;,
; temp/codegen.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:340: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_function, .-codegen_function
	.p2align 4
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp114, method
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp115, status
	subq	$16, %rsp	;,
; temp/codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)]
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; temp/codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movaps	%xmm0, (%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], %sfp
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:100:     subroutine->name = name;
	movdqa	(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)]
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp116, subroutine
; temp/codegen.c:100:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_39]
; temp/codegen.c:102:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp117, subroutine_39->parameters
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp118, subroutine_39->local_vars
; temp/codegen.c:104:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; temp/codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp119, subroutine_39->blocks
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
; temp/codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r13), %rdi	; method_16(D)->parameters, method_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp120, parameters
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L352	;
	.p2align 4,,10
	.p2align 3
.L353:
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_39->parameters, subroutine_39->parameters
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp121, _8
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
.L352:
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L353	;,
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	; tmp123, _10
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, block
; temp/codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	; _10, block_43->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_39->blocks, subroutine_39->blocks
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp125, block_43->instructions
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:354:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r13), %rdi	; method_16(D)->body, method_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp126, statements
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L354	;
	.p2align 4,,10
	.p2align 3
.L355:
; temp/codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L354:
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp127, statement
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L355	;,
; temp/codegen.c:361:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:362: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.p2align 4
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp110, class
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp111, status
	pushq	%rbx	;
; temp/codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_13(D)->members, class_13(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; temp/codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%r13), %r14	; class_13(D)->name, _2
; temp/codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rbx	; tmp112, members
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp113, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%r14, %xmm1	; _2, _2
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%r12, %rsi	; table,
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp114, tmp101
	punpcklqdq	%xmm1, %xmm0	; _2, tmp101
	movups	%xmm0, (%r12)	; tmp101, MEM <vector(2) long unsigned int> [(void *)table_26]
; temp/codegen.c:368:     attr_table->size = class->size;
	movq	24(%r13), %rax	; class_13(D)->size, class_13(D)->size
	movq	%rax, 16(%r12)	; class_13(D)->size, table_26->size
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_19(D)->tac, status_19(D)->tac
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC30(%rip), %r12	;, tmp109
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rdi	; _4->attribute_tables, _4->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L358:
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L366	;,
.L363:
; temp/codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ecx	; member_22->type, _6
; temp/codegen.c:371:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L359	;,
	cmpl	$1, %ecx	;, _6
	je	.L360	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	movq	%r12, %rdx	; tmp109,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	jne	.L363	;,
.L366:
; temp/codegen.c:383: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L360:
; temp/codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_22->content.variable, member_22->content.variable
	movl	$97, %edx	;,
	movq	%rbp, %rsi	; status,
	call	codegen_variable	;
; temp/codegen.c:377:                 break;
	jmp	.L358	;
	.p2align 4,,10
	.p2align 3
.L359:
; temp/codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rdi	; member_22->content.method, member_22->content.method
	movq	%rbp, %rsi	; status,
	call	codegen_method	;
; temp/codegen.c:374:                 break;
	jmp	.L358	;
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC31:
	.string	"main"
	.text
	.p2align 4
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC31(%rip), %r14	;, tmp115
; temp/codegen.c:291: TAC* codegen_code(Code* code) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:291: TAC* codegen_code(Code* code) {
	movq	%rdi, %rbx	; tmp116, code
; temp/codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp117, <retval>
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:78:     tac->entry_point = NULL;
	movq	$0, 8(%r13)	;, tac_29->entry_point
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	movq	%rax, 0(%r13)	; tmp118, tac_29->attribute_tables
; temp/codegen.c:79:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:79:     tac->global_vars = create_list();
	movq	%rax, 16(%r13)	; tmp119, tac_29->global_vars
; temp/codegen.c:80:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %edi	;,
; temp/codegen.c:80:     tac->subroutines = create_list();
	movq	%rax, 24(%r13)	; tmp120, tac_29->subroutines
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp121, status
; temp/codegen.c:85:     status->tac = tac;
	movq	%r13, (%rax)	; <retval>, status_26->tac
; temp/codegen.c:86:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	;, status_26->current_subroutine
; temp/codegen.c:87:     status->current_block = NULL;
	movq	$0, 16(%rax)	;, status_26->current_block
; temp/codegen.c:88:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:88:     status->end_labels = create_list();
	movq	%rax, 24(%rbp)	; tmp122, status_26->end_labels
; temp/codegen.c:89:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:90:     status->attr_count = 0;
	pxor	%xmm0, %xmm0	; tmp101
; temp/codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rdi	; code_17(D)->members, code_17(D)->members
; temp/codegen.c:89:     status->start_labels = create_list();
	movq	%rax, 32(%rbp)	; tmp123, status_26->start_labels
; temp/codegen.c:90:     status->attr_count = 0;
	movups	%xmm0, 40(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 40B]
	movups	%xmm0, 56(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 56B]
	movups	%xmm0, 72(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 72B]
; temp/codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, members
	.p2align 4,,10
	.p2align 3
.L368:
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, code_member
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L376	;,
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L377	;,
; temp/codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L378	;,
; temp/codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L368	;,
; temp/codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	codegen_import	;
	jmp	.L368	;
	.p2align 4,,10
	.p2align 3
.L377:
; temp/codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	(%rbx), %rdi	; code_member_21->content.function, code_member_21->content.function
	movq	%rbp, %rsi	; status,
	call	codegen_function	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	; code_member_21->content.function, code_member_21->content.function
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r14, %rsi	; tmp115,
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rbx	; _4->name, _5
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rdi	; _5->name, _5->name
	call	*strcmp@GOTPCREL(%rip)	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp125
	jne	.L368	;,
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L368	;
	.p2align 4,,10
	.p2align 3
.L378:
; temp/codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	codegen_class	;
	jmp	.L368	;
	.p2align 4,,10
	.p2align 3
.L376:
; temp/codegen.c:308: }
	popq	%rbx	;
	movq	%r13, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_code, .-codegen_code
	.section	.rodata
	.align 32
	.type	CSWTCH.51, @object
	.size	CSWTCH.51, 76
CSWTCH.51:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
