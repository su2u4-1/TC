	.file	"D:\\TC\\temp\\codegen.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	find_var_by_symbol;	.scl	3;	.type	32;	.endef
find_var_by_symbol:
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rcx, %rcx	 ; vars
	je	.L6	 ;,
	testq	%rdx, %rdx	 ; symbol
	je	.L6	 ;,
.L4:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	(%rcx), %rcx	 ;* current, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rcx, %rcx	 ; current
	je	.L6	 ;,
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rcx), %rax	 ; current_5->content, <retval>
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rax, %rax	 ; <retval>
	je	.L4	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	%rdx, (%rax)	 ; symbol, var_12->original_name
	jne	.L4	 ;,
	ret	
.L6:
 ; D:\TC\temp\codegen.c:199:         return NULL;
	xorl	%eax, %eax	 ; <retval>
.L1:
 ; D:\TC\temp\codegen.c:208: }
	ret	
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp	 ;
	movl	%ecx, %ebp	 ; tmp88, type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:134: static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, arg1
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, arg2
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, arg3
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
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
	movq	%rcx, %rdi	 ; tmp89, name
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
 ; D:\TC\temp\codegen.c:98: static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp90, return_type
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movq	%rdi, (%rax)	 ; name, subroutine_6->name
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbx	 ; tmp91, <retval>
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
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.def	create_block;	.scl	3;	.type	32;	.endef
create_block:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:\TC\temp\codegen.c:107: static Block* create_block(Var* label) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rsi, (%rax)	 ; label, block_4->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, block_4->instructions
 ; D:\TC\temp\codegen.c:112: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; D:\TC\temp\codegen.c:22:         return 0;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\temp\codegen.c:21:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L25	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_int
	je	.L26	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_float
	je	.L26	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_string
	je	.L26	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp97
 ; D:\TC\temp\codegen.c:26:         return 1;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rdx)	 ; type, name_bool
	je	.L25	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp98
	cmpq	%rcx, (%rdx)	 ; type, name_void
	je	.L25	 ;,
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rcx)	 ;, type_13(D)->kind
	jne	.L20	 ;,
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
.L20:
 ; D:\TC\temp\codegen.c:20: static size_t get_type_size(Symbol* type) {
	subq	$56, %rsp	 ;,
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %r8	 ; type_13(D)->name, _8
	movq	%r8, 40(%rsp)	 ; _8, %sfp
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	40(%rsp), %r8	 ; %sfp, _8
	leaq	.LC0(%rip), %rdx	 ;, tmp101
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:24:         return 8;
	movl	$8, %eax	 ;, <retval>
 ; D:\TC\temp\codegen.c:31: }
	addq	$56, %rsp	 ;,
	ret	
.L26:
 ; D:\TC\temp\codegen.c:24:         return 8;
	movl	$8, %eax	 ;, <retval>
	ret	
.L25:
 ; D:\TC\temp\codegen.c:31: }
	ret	
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp115, kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:142: static Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp116, value
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_16->kind
 ; D:\TC\temp\codegen.c:146:     switch (kind) {
	decl	%esi	 ;
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	%rcx, 8(%rax)	 ;, arg_16->type
 ; D:\TC\temp\codegen.c:146:     switch (kind) {
	cmpl	$6, %esi	 ;, tmp95
	ja	.L30	 ;,
	leaq	.L31(%rip), %rcx	 ;, tmp97
	movslq	(%rcx,%rsi,4), %rdx	 ;, tmp99
	addq	%rcx, %rdx	 ; tmp97, tmp100
	jmp	*%rdx	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L31:
	.long	.L37-.L31
	.long	.L36-.L31
	.long	.L35-.L31
	.long	.L34-.L31
	.long	.L33-.L31
	.long	.L32-.L31
	.long	.L30-.L31
	.text
.L37:
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	 ; MEM[(long long int *)value_20(D)], _2
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	 ; _2, arg_16->value.int_value
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp103
	jmp	.L41	 ;
.L36:
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	 ; MEM[(double *)value_20(D)], _4
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp105
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	 ; _4, arg_16->value.float_value
	jmp	.L41	 ;
.L35:
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movq	%rbx, (%rax)	 ; value, arg_16->value.string_value
 ; D:\TC\temp\codegen.c:161:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp107
	jmp	.L41	 ;
.L34:
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	(%rbx), %dl	 ; MEM[(char *)value_20(D)], _7
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	%dl, (%rax)	 ; _7, arg_16->value.bool_value
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp109
	jmp	.L41	 ;
.L33:
 ; D:\TC\temp\codegen.c:168:             arg->value.string_value = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, arg_16->value.string_value
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp111
.L41:
	movq	(%rdx), %rdx	 ;, name_void
	jmp	.L40	 ;
.L32:
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	 ; value, arg_16->value.label
 ; D:\TC\temp\codegen.c:173:             break;
	jmp	.L38	 ;
.L30:
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	 ; value,* <retval>
 ; D:\TC\temp\codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	 ; MEM[(struct Var *)value_20(D)].type, MEM[(struct Var *)value_20(D)].type
.L40:
	movq	%rdx, 8(%rax)	 ; MEM[(struct Var *)value_20(D)].type, arg_16->type
.L38:
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_16->is_get
 ; D:\TC\temp\codegen.c:185: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
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
	movq	%rdx, %rbp	 ; tmp106, type
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp108, status
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp105, original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:113: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:113: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	movl	%r8d, 96(%rsp)	 ; kind, kind
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	movl	96(%rsp), %r8d	 ; kind, kind
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	 ; original_name, var_19->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp109, <retval>
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	cmpl	$112, %r8d	 ;, kind
	je	.L43	 ;,
	ja	.L44	 ;,
	cmpl	$98, %r8d	 ;, kind
	je	.L45	 ;,
	cmpl	$102, %r8d	 ;, kind
	je	.L46	 ;,
	cmpl	$97, %r8d	 ;, kind
	je	.L47	 ;,
	jmp	.L54	 ;
.L44:
	cmpl	$116, %r8d	 ;, kind
	je	.L49	 ;,
	cmpl	$118, %r8d	 ;, kind
	je	.L50	 ;,
.L54:
	orq	$-1, %rbx	 ;, id
	jmp	.L48	 ;
.L47:
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rsi), %rbx	 ; status_23(D)->attr_count, id
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp95
	movq	%rax, 40(%rsi)	 ; tmp95, status_23(D)->attr_count
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L48	 ;
.L43:
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rsi), %rbx	 ; status_23(D)->param_count, id
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp96
	movq	%rax, 48(%rsi)	 ; tmp96, status_23(D)->param_count
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L48	 ;
.L50:
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rsi), %rbx	 ; status_23(D)->var_count, id
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp97
	movq	%rax, 56(%rsi)	 ; tmp97, status_23(D)->var_count
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L48	 ;
.L49:
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rsi), %rbx	 ; status_23(D)->temp_count, id
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp98
	movq	%rax, 64(%rsi)	 ; tmp98, status_23(D)->temp_count
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L48	 ;
.L45:
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rsi), %rbx	 ; status_23(D)->block_count, id
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp99
	movq	%rax, 72(%rsi)	 ; tmp99, status_23(D)->block_count
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L48	 ;
.L46:
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rsi), %rbx	 ; status_23(D)->subroutine_count, id
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp100
	movq	%rax, 80(%rsi)	 ; tmp100, status_23(D)->subroutine_count
.L48:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp101
	movl	$32, %edx	 ;,
	movl	%r8d, 96(%rsp)	 ; kind, kind
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	 ;, id
	movl	96(%rsp), %r8d	 ; kind, kind
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _13, var_19->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp110, _13
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	jne	.L51	 ;,
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	leaq	.LC2(%rip), %rdx	 ;, tmp102
	call	sprintf	 ;
	jmp	.L52	 ;
.L51:
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; id,
	leaq	.LC3(%rip), %rdx	 ;, tmp103
	call	sprintf	 ;
.L52:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rdi)	 ; type, var_19->type
 ; D:\TC\temp\codegen.c:133: }
	addq	$40, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.def	emit_param_instruction;	.scl	3;	.type	32;	.endef
emit_param_instruction:
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rcx, %rcx	 ; value
	je	.L58	 ;,
 ; D:\TC\temp\codegen.c:283: static void emit_param_instruction(Arg* value, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp103, status
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rdx, %rdx	 ; status
	je	.L55	 ;,
	movq	%rcx, %r8	 ; tmp102, value
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rcx), %rcx	 ; value_4(D)->type, value_4(D)->type
	movq	%r8, 64(%rsp)	 ; value, value
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	leaq	40(%rsp), %rdx	 ;, tmp99
	movl	$1, %ecx	 ;,
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, 40(%rsp)	 ; tmp104, size
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movq	64(%rsp), %r8	 ; value, value
	movl	$17, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movq	%rax, %rdx	 ; tmp105, _12
 ; D:\TC\temp\codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp106, inst
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_5(D)->current_block, status_5(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
.L55:
 ; D:\TC\temp\codegen.c:289: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L58:
	ret	
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp96, arg
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rcx, %rcx	 ; arg
	je	.L62	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_3(D)->is_get
	je	.L62	 ;,
	movq	%rdx, %rdi	 ; tmp97, status
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_3(D)->type, arg_3(D)->type
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %r9	 ; status,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp98, _10
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %r8	 ; arg,
	xorl	%r9d, %r9d	 ;
	movl	$23, %ecx	 ;,
	movq	%rax, %rdx	 ; temp,
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp99, temp
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	 ;
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rsi, %rbx	 ; temp, arg
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rdx	 ; tmp100, _12
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
.L62:
 ; D:\TC\temp\codegen.c:195: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC4:
	.ascii "<unknown>\0"
.LC5:
	.ascii "[warning] Invalid attribute access\12\0"
.LC6:
	.ascii "[warning] Attribute '%s' not found in class '%s', fallback index %zu\12\0"
.LC7:
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
	subq	$64, %rsp	 ;,
 ; D:\TC\temp\codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rcx, %rcx	 ; object
	je	.L88	 ;,
	movq	%rdx, %rsi	 ; tmp149, attr_name
	testq	%rdx, %rdx	 ; attr_name
	jne	.L68	 ;,
.L88:
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	leaq	.LC5(%rip), %rcx	 ;, tmp125
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	call	fputs	 ;
 ; D:\TC\temp\codegen.c:267:         return NULL;
	jmp	.L70	 ;
.L68:
 ; D:\TC\temp\codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	%r8, %rdx	 ; status,
	movq	%r8, %rdi	 ; tmp150, status
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp152, object_value
 ; D:\TC\temp\codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	 ; object_value
	jne	.L71	 ;,
.L70:
 ; D:\TC\temp\codegen.c:267:         return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L67	 ;
.L71:
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rax), %rbp	 ; object_value_22->type, class_type
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rbp, %rbp	 ; class_type
	je	.L73	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	 ;, _6->kind
	je	.L73	 ;,
 ; D:\TC\temp\codegen.c:272:     Symbol* class_type = NULL;
	xorl	%ebp, %ebp	 ; class_type
.L73:
 ; D:\TC\temp\codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%rdi), %rax	 ; MEM[(struct TAC * *)status_20(D)], MEM[(struct TAC * *)status_20(D)]
	movq	(%rax), %rcx	 ; _56->attribute_tables,
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp153, attribute_tables
.L74:
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%rbx, %rcx	 ; attribute_tables,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	 ; current
	je	.L77	 ;,
 ; D:\TC\temp\codegen.c:9:         if (current->name == name)
	cmpq	%rbp, 8(%rax)	 ; class_type, current_60->name
	jne	.L74	 ;,
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rcx	 ; current_60->attributes, _36
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _36
	jne	.L78	 ;,
.L77:
 ; D:\TC\temp\codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rsi), %rdx	 ; attr_name_18(D)->type,
	movq	%rdi, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rsi, %rcx	 ; attr_name,
	call	create_var	 ;
	movq	%rax, %rbx	 ; tmp155, var
	jmp	.L79	 ;
.L78:
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	list_copy	 ;
 ; D:\TC\temp\codegen.c:243:     size_t index = 0;
	xorl	%r13d, %r13d	 ; index
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	%rax, %rbx	 ; tmp156, attrs
.L80:
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%rbx, %rcx	 ; attrs,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	 ; attr
	je	.L94	 ;,
 ; D:\TC\temp\codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rsi	 ; attr_40->var_name, attr_name
	je	.L86	 ;,
 ; D:\TC\temp\codegen.c:252:         ++index;
	incq	%r13	 ; index
	jmp	.L80	 ;
.L94:
 ; D:\TC\temp\codegen.c:244:     bool found = false;
	xorl	%r14d, %r14d	 ; found
	jmp	.L81	 ;
.L86:
 ; D:\TC\temp\codegen.c:249:             found = true;
	movb	$1, %r14b	 ;, found
.L81:
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp128
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rsi, (%rax)	 ; attr_name, var_44->original_name
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp158, var
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rsi), %rax	 ; attr_name_18(D)->type, attr_name_18(D)->type
	movq	%rax, 16(%rbx)	 ; attr_name_18(D)->type, var_44->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; tmp159, var_44->name
 ; D:\TC\temp\codegen.c:258:     if (!found)
	testb	%r14b, %r14b	 ; found
	jne	.L83	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC4(%rip), %r9	 ;, iftmp.19_52
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rbp, %rbp	 ; class_type
	je	.L84	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbp), %r9	 ; class_type_63->name, iftmp.19_52
.L84:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rsi), %r8	 ; attr_name_18(D)->name, _49
	movq	%r9, 56(%rsp)	 ; iftmp.19_52, %sfp
	movq	%r8, 48(%rsp)	 ; _49, %sfp
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	56(%rsp), %r9	 ; %sfp, iftmp.19_52
	movq	48(%rsp), %r8	 ; %sfp, _49
	leaq	.LC6(%rip), %rdx	 ;, tmp130
	movq	24(%rax), %rcx	 ; _50->_stderr, _50->_stderr
	movq	%r13, 32(%rsp)	 ; index,
	call	fprintf	 ;
.L83:
 ; D:\TC\temp\codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	8(%rbx), %rcx	 ; var_44->name, var_44->name
	movq	%r13, %r8	 ; index,
	leaq	.LC7(%rip), %rdx	 ;, tmp132
	call	sprintf	 ;
.L79:
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rsi), %rdx	 ; attr_name_18(D)->type,
	movq	%rdi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp161, _10
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%rbx, %rdx	 ; var,
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp162, <retval>
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%r12, %r8	 ; object_value,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%rax, %r9	 ;, tmp163
 ; D:\TC\temp\codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp164, inst
 ; D:\TC\temp\codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_20(D)->current_block, status_20(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rsi)	 ;, result_27->is_get
.L67:
 ; D:\TC\temp\codegen.c:281: }
	addq	$64, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.section .rdata,"dr"
.LC8:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	codegen_import
	.def	codegen_import;	.scl	2;	.type	32;	.endef
codegen_import:
	pushq	%rdi	 ;
	movq	%r8, %r9	 ; tmp106, status
	movq	%rdx, %rdi	 ; tmp105, tac
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movl	$118, %r8d	 ;,
 ; D:\TC\temp\codegen.c:309: void codegen_import(Import* import, TAC* tac, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rsi	 ; import_16(D)->name, _1
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rsi), %ebx	 ; _1->kind, _2
 ; D:\TC\temp\codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L100	 ;,
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp100
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp100
	ja	.L97	 ;,
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movl	$102, %r8d	 ;,
.L100:
	movq	(%rsi), %rdx	 ; _1->type,
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp108, _8
.L101:
 ; D:\TC\temp\codegen.c:318: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
.L97:
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L98	 ;,
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp109, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:16:     table->name = name;
	movq	%rsi, 8(%rbx)	 ; _1, table_27->name
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rdi), %rcx	 ; tac_20(D)->attribute_tables,
	movq	%rbx, %rdx	 ; table,
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp110, table_27->attributes
 ; D:\TC\temp\codegen.c:17:     table->size = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 16(%rbx)	 ;, table_27->size
	jmp	.L101	 ;
.L98:
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC8(%rip), %rdx	 ;, tmp103
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
 ; D:\TC\temp\codegen.c:318: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC9:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
.LC10:
	.ascii "[warning] Unsupported variable type for codegen_variable: %d\12\0"
	.text
	.globl	codegen_variable
	.def	codegen_variable;	.scl	2;	.type	32;	.endef
codegen_variable:
	pushq	%rbp	 ;
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	%rdx, %r9	 ; status,
 ; D:\TC\temp\codegen.c:384: void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp129, variable
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp130, status
	pushq	%rbx	 ;
	movl	%r8d, %ebx	 ; tmp131, type
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rdx	 ; variable_21(D)->type,
	movq	8(%rcx), %rcx	 ; variable_21(D)->name, variable_21(D)->name
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp132, var
 ; D:\TC\temp\codegen.c:386:     switch (type) {
	cmpl	$112, %ebx	 ;, type
	je	.L103	 ;,
	ja	.L104	 ;,
	cmpl	$97, %ebx	 ;, type
	je	.L105	 ;,
	cmpl	$102, %ebx	 ;, type
	jne	.L107	 ;,
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rsi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	jmp	.L113	 ;
.L104:
 ; D:\TC\temp\codegen.c:386:     switch (type) {
	cmpl	$116, %ebx	 ;, type
	je	.L109	 ;,
	cmpl	$118, %ebx	 ;, type
	je	.L109	 ;,
	jmp	.L107	 ;
.L103:
 ; D:\TC\temp\codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rsi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	jmp	.L113	 ;
.L109:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	24(%rax), %rcx	 ;, _5->local_vars
.L112:
 ; D:\TC\temp\codegen.c:410: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	list_append	 ;
.L113:
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rcx	 ;, _9->global_vars
	jmp	.L112	 ;
.L105:
 ; D:\TC\temp\codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	(%rax), %rcx	 ; _11->attribute_tables,
	call	list_pop_back	 ;
	movq	%rax, %rbx	 ; tmp133, attr_table
 ; D:\TC\temp\codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rsi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	%rbx, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _13->attribute_tables,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	(%rdi), %rbp	 ; variable_21(D)->type, _15
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	8(%rdi), %rdi	 ; variable_21(D)->name, _16
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:34:     attr->var_name = var_name;
	movq	%rdi, (%rax)	 ; _16, attr_36->var_name
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rsi	 ; tmp134, attr
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	%rbp, %rcx	 ; _15,
 ; D:\TC\temp\codegen.c:35:     attr->type = type;
	movq	%rbp, 8(%rax)	 ; _15, attr_36->type
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	16(%rbx), %rax	 ; attr_table_31->size, attr_table_31->size
	movq	%rax, 16(%rsi)	 ; attr_table_31->size, attr_36->offset
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%rbx), %rcx	 ; attr_table_31->attributes, _41
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, 16(%rbx)	 ; tmp135, attr_table_31->size
 ; D:\TC\temp\codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _41
	jne	.L112	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	leaq	.LC9(%rip), %rcx	 ;, tmp126
	movq	24(%rax), %rdx	 ; _42->_stderr, _42->_stderr
 ; D:\TC\temp\codegen.c:410: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fputs	 ;
.L107:
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movl	%ebx, %r8d	 ; type,
	leaq	.LC10(%rip), %rdx	 ;, tmp128
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
 ; D:\TC\temp\codegen.c:410: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC11:
	.ascii "[warning] Invalid variable access input\12\0"
.LC12:
	.ascii "[warning] Variable access name is NULL\12\0"
.LC13:
	.ascii "[warning] Unresolved variable access for '%s', creating fallback local\12\0"
.LC14:
	.ascii "[warning] Invalid get-attribute access\12\0"
.LC15:
	.ascii "[warning] Failed to generate object for get-attribute access\12\0"
.LC16:
	.ascii "[warning] Invalid get-sequence access\12\0"
.LC17:
	.ascii "[warning] Failed to generate sequence/index for get-sequence access\12\0"
.LC18:
	.ascii "[warning] Invalid function call without callee\12\0"
.LC19:
	.ascii "[warning] Failed to generate callee for function call\12\0"
.LC20:
	.ascii "[warning] Unsupported callee in function call\12\0"
.LC21:
	.ascii "[warning] Failed to generate function call argument\12\0"
.LC22:
	.ascii "[warning] Unsupported variable access type for codegen_variable_access: %d\12\0"
	.text
	.globl	codegen_variable_access
	.def	codegen_variable_access;	.scl	2;	.type	32;	.endef
codegen_variable_access:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:\TC\temp\codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rcx, %rcx	 ; variable_access
	je	.L160	 ;,
	movq	%rdx, %rbx	 ; tmp263, status
	testq	%rdx, %rdx	 ; status
	jne	.L115	 ;,
.L160:
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	leaq	.LC11(%rip), %rcx	 ;, tmp204
	movq	24(%rax), %rdx	 ; _4->_stderr, _4->_stderr
	jmp	.L203	 ;
.L115:
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rcx), %r8d	 ; variable_access_103(D)->type, _6
	movq	%rcx, %rsi	 ; tmp262, variable_access
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%r8d, %r8d	 ; _6
	jne	.L118	 ;,
 ; D:\TC\temp\codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rcx), %rsi	 ; variable_access_103(D)->content.name, name
 ; D:\TC\temp\codegen.c:712:         if (name == NULL) {
	testq	%rsi, %rsi	 ; name
	jne	.L119	 ;,
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	leaq	.LC12(%rip), %rcx	 ;, tmp206
	movq	24(%rax), %rdx	 ; _7->_stderr, _7->_stderr
	jmp	.L203	 ;
.L119:
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rdx), %r8	 ; status_104(D)->current_subroutine, _203
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%r8, %r8	 ; _203
	je	.L121	 ;,
 ; D:\TC\temp\codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%r8), %rcx	 ; _203->parameters, _203->parameters
	movq	%rsi, %rdx	 ; name,
	call	find_var_by_symbol	 ;
 ; D:\TC\temp\codegen.c:215:         if (var != NULL)
	testq	%rax, %rax	 ; var
	jne	.L207	 ;,
 ; D:\TC\temp\codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%r8), %rcx	 ; _203->local_vars, _203->local_vars
	call	find_var_by_symbol	 ;
 ; D:\TC\temp\codegen.c:218:         if (var != NULL)
	testq	%rax, %rax	 ; var
	jne	.L207	 ;,
.L121:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rbx), %rax	 ; status_104(D)->tac, status_104(D)->tac
	movq	%rsi, %rdx	 ; name,
	movq	16(%rax), %rcx	 ; _208->global_vars, _208->global_vars
	call	find_var_by_symbol	 ;
 ; D:\TC\temp\codegen.c:717:         if (existing != NULL)
	testq	%rax, %rax	 ; var
	jne	.L207	 ;,
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%rsi)	 ;, name_176->kind
	ja	.L124	 ;,
.L206:
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ;* name,
	movq	%rsi, %rcx	 ; name,
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp269, _11
.L205:
 ; D:\TC\temp\codegen.c:833: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	create_arg	 ;
.L124:
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%r8, %r8	 ; _203
	je	.L125	 ;,
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%r8), %rax	 ; _203->parameters, _203->parameters
	movq	(%rax), %rbp	 ; _213->head, current
.L126:
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rbp, %rbp	 ; current
	je	.L125	 ;,
 ; D:\TC\temp\codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%rbp), %rdi	 ; current_215->content, var
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rdi, %rdi	 ; var
	jne	.L127	 ;,
.L128:
 ; D:\TC\temp\codegen.c:232:         current = current->next;
	movq	0(%rbp), %rbp	 ; current_215->next, current
	jmp	.L126	 ;
.L127:
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%rdi), %rax	 ; var_216->original_name, _217
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	 ; _217
	je	.L128	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rcx	 ; _217->name, _217->name
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp309
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	 ; tmp270
	je	.L128	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rdi), %rax	 ; var_216->type, _12
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	 ; _12
	je	.L125	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpl	$0, 32(%rax)	 ;, _12->kind
	je	.L208	 ;,
.L125:
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	8(%rsi), %r8	 ; name_176->name, _18
	movq	%r8, 40(%rsp)	 ; _18, %sfp
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	40(%rsp), %r8	 ; %sfp, _18
	leaq	.LC13(%rip), %rdx	 ;, tmp217
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	(%rsi), %rdx	 ; name_176->type,
	movq	%rbx, %r9	 ; status,
	movq	%rsi, %rcx	 ; name,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
.L207:
	movq	%rax, %rdx	 ; tmp273, _22
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	xorl	%ecx, %ecx	 ;
	jmp	.L205	 ;
.L118:
 ; D:\TC\temp\codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %r8d	 ;, _6
	jne	.L131	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_103(D)->base, _23
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rcx, %rcx	 ; _23
	je	.L132	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rsi), %rsi	 ; variable_access_103(D)->content.attr_name, _24
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rsi, %rsi	 ; _24
	jne	.L133	 ;,
.L132:
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	leaq	.LC14(%rip), %rcx	 ;, tmp219
	movq	24(%rax), %rdx	 ; _25->_stderr, _25->_stderr
	jmp	.L203	 ;
.L133:
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rsi), %eax	 ; _24->kind, tmp311
	decl	%eax	 ; tmp220
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	 ;, tmp220
	jbe	.L206	 ;,
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	 ;
	movq	%rax, %rcx	 ; tmp276, object
 ; D:\TC\temp\codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	 ; object
	jne	.L135	 ;,
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	leaq	.LC15(%rip), %rcx	 ;, tmp223
	movq	24(%rax), %rdx	 ; _31->_stderr, _31->_stderr
	jmp	.L203	 ;
.L208:
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	 ; _12->ast_node.class, _12->ast_node.class
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	 ; _15->class_scope, tmp310
	cmpq	%rax, 24(%rsi)	 ; tmp310, name_176->ast_node.scope
	jne	.L125	 ;,
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %rdx	 ; var,
	call	create_arg	 ;
	movq	%rax, %rcx	 ; tmp271, _17
.L135:
 ; D:\TC\temp\codegen.c:833: }
	addq	$72, %rsp	 ;,
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rbx, %r8	 ; status,
	movq	%rsi, %rdx	 ; _24,
 ; D:\TC\temp\codegen.c:833: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	jmp	emit_attribute_access	 ;
.L131:
 ; D:\TC\temp\codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %r8d	 ;, _6
	jne	.L136	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_103(D)->base, _33
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rcx, %rcx	 ; _33
	je	.L137	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rsi)	 ;, variable_access_103(D)->content.index
	jne	.L138	 ;,
.L137:
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	leaq	.LC16(%rip), %rcx	 ;, tmp225
	movq	24(%rax), %rdx	 ; _35->_stderr, _35->_stderr
	jmp	.L203	 ;
.L138:
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %rcx	 ; tmp279, _37
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rsi), %rcx	 ; variable_access_103(D)->content.index, variable_access_103(D)->content.index
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	 ; tmp280, sequence
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rax, %rcx	 ; tmp281, _39
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp282, index
 ; D:\TC\temp\codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%rdi, %rdi	 ; sequence
	je	.L161	 ;,
	testq	%rax, %rax	 ; index
	jne	.L139	 ;,
.L161:
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	leaq	.LC17(%rip), %rcx	 ;, tmp232
	movq	24(%rax), %rdx	 ; _43->_stderr, _43->_stderr
	jmp	.L203	 ;
.L139:
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp233
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_float(%rip), %rcx	 ;, tmp234
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%rdi), %rdx	 ; sequence_149->type, _45
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	(%rax), %rax	 ; name_int, element_type
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rcx), %rdx	 ; name_float, _45
	je	.L141	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_bool(%rip), %rcx	 ;, tmp235
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rcx), %rdx	 ; name_bool, _45
	je	.L141	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_string(%rip), %rcx	 ;, tmp236
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rcx), %rdx	 ; name_string, _45
	je	.L141	 ;,
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	%rax, %rdx	 ; element_type, _45
.L141:
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp284, _49
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	movq	%rbp, %r9	 ; index,
	movq	%rdi, %r8	 ; sequence,
	movl	$16, %ecx	 ;,
	movq	%rax, %rdx	 ; <retval>,
 ; D:\TC\temp\codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp285, <retval>
 ; D:\TC\temp\codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp286, inst
 ; D:\TC\temp\codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_104(D)->current_block, status_104(D)->current_block
	movq	8(%rax), %rcx	 ; _50->instructions, _50->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:761:         result->is_get = true;
	movb	$1, 20(%rsi)	 ;, result_156->is_get
 ; D:\TC\temp\codegen.c:762:         return result;
	jmp	.L114	 ;
.L136:
 ; D:\TC\temp\codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %r8d	 ;, _6
	jne	.L142	 ;,
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_103(D)->base, _52
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _52
	jne	.L143	 ;,
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	leaq	.LC18(%rip), %rcx	 ;, tmp240
	movq	24(%rax), %rdx	 ; _53->_stderr, _53->_stderr
	jmp	.L203	 ;
.L143:
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rcx)	 ;, _52->type
	jne	.L145	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rcx), %rdi	 ; _52->content.attr_name, callee_name
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%rdi, %rdi	 ; callee_name
	je	.L145	 ;,
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%rdi), %eax	 ; _56->kind, tmp312
	decl	%eax	 ; tmp241
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	 ;, tmp241
	ja	.L145	 ;,
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rcx), %rcx	 ; _52->base, _59
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rcx, %rcx	 ; _59
	je	.L159	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 16(%rcx)	 ;, _59->type
	jne	.L147	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rcx), %rax	 ; _59->content.name, _61
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _61
	je	.L147	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, _61->kind
	je	.L159	 ;,
.L147:
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rax, %rcx	 ; tmp288, _63
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ; tmp289, receiver
 ; D:\TC\temp\codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	 ; receiver
	je	.L159	 ;,
 ; D:\TC\temp\codegen.c:806:             emit_param_instruction(receiver, status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:807:             ++argument_count;
	movl	$1, %ebp	 ;, argument_count
 ; D:\TC\temp\codegen.c:806:             emit_param_instruction(receiver, status);
	call	emit_param_instruction	 ;
	jmp	.L149	 ;
.L145:
 ; D:\TC\temp\codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	 ; callee
	jne	.L150	 ;,
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	leaq	.LC19(%rip), %rcx	 ;, tmp244
	movq	24(%rax), %rdx	 ; _64->_stderr, _64->_stderr
.L203:
	call	fputs	 ;
.L204:
 ; D:\TC\temp\codegen.c:768:             return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L114	 ;
.L150:
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %edx	 ; callee_113->kind, _66
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %edx	 ;, _66
	jne	.L152	 ;,
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rax), %rax	 ; callee_113->value.subroutine, _67
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	 ; _67
	je	.L153	 ;,
 ; D:\TC\temp\codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %rdi	 ; _67->original_name, callee_name
 ; D:\TC\temp\codegen.c:799:         if (callee_name == NULL) {
	testq	%rdi, %rdi	 ; callee_name
	jne	.L159	 ;,
	jmp	.L153	 ;
.L152:
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%edx, %edx	 ; _66
	jne	.L153	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	 ; callee_113->value.variable, _68
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	 ; _68
	je	.L153	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rdi	 ; _68->original_name, callee_name
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rdi, %rdi	 ; callee_name
	je	.L153	 ;,
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%rdi), %eax	 ; _69->kind, tmp313
	decl	%eax	 ; tmp245
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp245
	jbe	.L159	 ;,
.L153:
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	leaq	.LC20(%rip), %rcx	 ;, tmp248
	movq	24(%rax), %rdx	 ; _72->_stderr, _72->_stderr
	jmp	.L203	 ;
.L159:
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	xorl	%ebp, %ebp	 ; argument_count
.L149:
 ; D:\TC\temp\codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rsi), %rcx	 ; variable_access_103(D)->content.args, variable_access_103(D)->content.args
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp293, args
.L154:
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rsi, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp297, arg_expr
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L209	 ;,
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rax, %rcx	 ; tmp294, _75
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rcx	 ; tmp295, arg_value
 ; D:\TC\temp\codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	 ; arg_value
	jne	.L155	 ;,
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	leaq	.LC21(%rip), %rcx	 ;, tmp251
	movq	24(%rax), %rdx	 ; _76->_stderr, _76->_stderr
	jmp	.L203	 ;
.L155:
 ; D:\TC\temp\codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:818:             ++argument_count;
	incq	%rbp	 ; argument_count
 ; D:\TC\temp\codegen.c:817:             emit_param_instruction(arg_value, status);
	call	emit_param_instruction	 ;
	jmp	.L154	 ;
.L209:
 ; D:\TC\temp\codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	(%rdi), %rdx	 ; callee_name_241->type, _78
 ; D:\TC\temp\codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	movq	%rax, %rsi	 ; tmp298, <retval>
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rdx, %rdx	 ; _78
	je	.L157	 ;,
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp252
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	(%rax), %rdx	 ; name_void, _78
	je	.L157	 ;,
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp299, _80
 ; D:\TC\temp\codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp300, <retval>
.L157:
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; callee_name_241->type,
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rdi, %rcx	 ; callee_name,
 ; D:\TC\temp\codegen.c:824:         long long count = (long long)argument_count;
	movq	%rbp, 56(%rsp)	 ; argument_count, count
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp301, _83
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	leaq	56(%rsp), %rdx	 ;, tmp253
	movl	$1, %ecx	 ;,
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, 40(%rsp)	 ; callee_arg, %sfp
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	40(%rsp), %r8	 ; %sfp, callee_arg
	movq	%rsi, %rdx	 ; <retval>,
	movl	$22, %ecx	 ;,
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	%rax, %r9	 ;, tmp303
 ; D:\TC\temp\codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp304, call_inst
 ; D:\TC\temp\codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rbx), %rax	 ; status_104(D)->current_block, status_104(D)->current_block
	movq	8(%rax), %rcx	 ; _85->instructions, _85->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:828:         return result;
	jmp	.L114	 ;
.L142:
	movl	%r8d, 40(%rsp)	 ; _6, %sfp
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movl	40(%rsp), %r8d	 ; %sfp, _6
	leaq	.LC22(%rip), %rdx	 ;, tmp257
	movq	24(%rax), %rcx	 ; _87->_stderr, _87->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:832:     return NULL;
	jmp	.L204	 ;
.L114:
 ; D:\TC\temp\codegen.c:833: }
	addq	$72, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC24:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
.LC25:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.text
	.globl	codegen_primary
	.def	codegen_primary;	.scl	2;	.type	32;	.endef
codegen_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	movl	8(%rcx), %r8d	 ; primary_38(D)->type,
 ; D:\TC\temp\codegen.c:655:     switch (primary->type) {
	cmpl	$8, %r8d	 ;, _1
	ja	.L211	 ;,
	movq	%rdx, %rsi	 ; tmp146, status
	leaq	.L213(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%r8,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L213:
	.long	.L221-.L213
	.long	.L220-.L213
	.long	.L219-.L213
	.long	.L218-.L213
	.long	.L217-.L213
	.long	.L216-.L213
	.long	.L215-.L213
	.long	.L214-.L213
	.long	.L212-.L213
	.text
.L221:
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	movl	$10, %r8d	 ;,
	call	strtoll	 ;
 ; D:\TC\temp\codegen.c:658:             return create_arg(ARG_INT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp125
	movl	$1, %ecx	 ;,
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 56(%rsp)	 ; tmp147, MEM[(long long int *)_94]
	jmp	.L230	 ;
.L220:
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:\TC\temp\codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp126
	movl	$2, %ecx	 ;,
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 56(%rsp)	 ; tmp149, MEM[(double *)_94]
.L230:
 ; D:\TC\temp\codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp150, <retval>
	jmp	.L210	 ;
.L219:
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_38(D)->value.literal_value,
 ; D:\TC\temp\codegen.c:703: }
	addq	$64, %rsp	 ;,
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %ecx	 ;,
 ; D:\TC\temp\codegen.c:703: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	 ;
.L218:
 ; D:\TC\temp\codegen.c:666:             bool t = true;
	movb	$1, 56(%rsp)	 ;, MEM[(char *)_94]
	jmp	.L231	 ;
.L217:
 ; D:\TC\temp\codegen.c:670:             bool t = false;
	movb	$0, 56(%rsp)	 ;, MEM[(char *)_94]
.L231:
 ; D:\TC\temp\codegen.c:671:             return create_arg(ARG_BOOL, &t);
	leaq	56(%rsp), %rdx	 ;, tmp128
	movl	$4, %ecx	 ;,
	jmp	.L230	 ;
.L216:
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr,
 ; D:\TC\temp\codegen.c:703: }
	addq	$64, %rsp	 ;,
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:703: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	jmp	codegen_expression	 ;
.L215:
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	codegen_primary	 ;
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp153, _9
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp154, operand
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp129
	movq	(%rax), %rdx	 ; name_bool,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp155, _11
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; operand,
	movl	$13, %ecx	 ;,
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp156, <retval>
 ; D:\TC\temp\codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rdx	 ; <retval>,
	jmp	.L228	 ;
.L214:
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	codegen_primary	 ;
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp158, _15
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp159, operand
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp160, _17
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp134
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp161, <retval>
 ; D:\TC\temp\codegen.c:685:             long long zero_int = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 48(%rsp)	 ;, zero_int
 ; D:\TC\temp\codegen.c:686:             double neg_one_float = -1.0;
	movq	.LC23(%rip), %rax	 ;, tmp169
	movq	%rax, 56(%rsp)	 ; tmp169, MEM[(double *)_94]
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_44->type, _18
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	cmpq	(%rdx), %rax	 ; name_int, _18
	jne	.L223	 ;,
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	48(%rsp), %rdx	 ;, tmp135
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
 ; D:\TC\temp\codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %r8	 ;, tmp162
	jmp	.L228	 ;
.L223:
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp136
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	cmpq	(%rdx), %rax	 ; name_float, _18
	jne	.L225	 ;,
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	56(%rsp), %rdx	 ;, tmp137
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %r8	 ;, tmp164
.L228:
 ; D:\TC\temp\codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp165, inst
 ; D:\TC\temp\codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:696:             return temp;
	jmp	.L210	 ;
.L225:
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %r8	 ; _18->name, _23
	movq	%r8, 40(%rsp)	 ; _23, %sfp
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	40(%rsp), %r8	 ; %sfp, _23
	leaq	.LC24(%rip), %rdx	 ;, tmp139
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	call	fprintf	 ;
	jmp	.L229	 ;
.L212:
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.var,
 ; D:\TC\temp\codegen.c:703: }
	addq	$64, %rsp	 ;,
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:703: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	jmp	codegen_variable_access	 ;
.L211:
	movl	%r8d, 40(%rsp)	 ; _1, %sfp
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movl	40(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC25(%rip), %rdx	 ;, tmp143
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
.L229:
 ; D:\TC\temp\codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L210:
 ; D:\TC\temp\codegen.c:703: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC26:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp129, expression
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp130, status
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	jne	.L233	 ;,
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; D:\TC\temp\codegen.c:653: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	jmp	codegen_primary	 ;
.L233:
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
 ; D:\TC\temp\codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r12d	 ;, _67
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rax, %rcx	 ; tmp131, _4
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp132, <retval>
 ; D:\TC\temp\codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %eax	 ; expression_31(D)->operator,
	cmpl	$18, %eax	 ;, _5
	ja	.L234	 ;,
	leaq	CSWTCH.22(%rip), %rdx	 ;, tmp116
	movzbl	(%rdx,%rax), %r12d	 ; CSWTCH.22[_5], _67
.L234:
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	0(%rbp), %rcx	 ; expression_31(D)->expr_left,
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rsi	 ; tmp133, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp118
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp118
	ja	.L235	 ;,
 ; D:\TC\temp\codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, %r12d	 ;, _67
	je	.L236	 ;,
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp134, _9
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp135, temp
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _67,
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp136
 ; D:\TC\temp\codegen.c:639:             right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; D:\TC\temp\codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp137, inst
 ; D:\TC\temp\codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L236:
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rsi)	 ;, left_38->kind
	je	.L237	 ;,
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	leaq	.LC26(%rip), %rcx	 ;, tmp124
	movq	24(%rax), %rdx	 ; _14->_stderr, _14->_stderr
	call	fputs	 ;
.L237:
 ; D:\TC\temp\codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %rdx	 ; left,
	movq	%rdi, %r8	 ; <retval>,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%rsi)	 ;, left_38->is_get
 ; D:\TC\temp\codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rdx	 ; tmp139, inst
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	je	.L238	 ;,
 ; D:\TC\temp\codegen.c:645:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rsi, %rdx	 ; left,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; <retval>,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp140, inst
	jmp	.L238	 ;
.L235:
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp141, _18
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp142, temp
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _67,
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp143
 ; D:\TC\temp\codegen.c:649:         right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; D:\TC\temp\codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp144, inst
.L238:
 ; D:\TC\temp\codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:653: }
	addq	$32, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15	 ;
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp179, if_
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp180, status
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	subq	$56, %rsp	 ;,
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp181, then_label
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rdi), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
 ; D:\TC\temp\codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp182, else_label
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp183
	jne	.L245	 ;,
.L247:
 ; D:\TC\temp\codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp184, end_label
	jmp	.L246	 ;
.L245:
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp185
	je	.L247	 ;,
 ; D:\TC\temp\codegen.c:457:         end_label = else_label;
	movq	%rsi, %rbp	 ; else_label, end_label
.L246:
 ; D:\TC\temp\codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%rdi), %rcx	 ; if__61(D)->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, 32(%rsp)	 ; tmp186, %sfp
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rax, %r13	 ; tmp187, condition
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _6, %sfp
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _6
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp189
 ; D:\TC\temp\codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp190, inst
 ; D:\TC\temp\codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:466:     Block* then_block = create_block(then_label);
	movq	%r12, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp191, then_block
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r12, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _10->blocks, _10->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:468:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%rdi), %rcx	 ; if__61(D)->body, if__61(D)->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp192, then_statements
.L248:
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp193, statement
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L268	 ;,
 ; D:\TC\temp\codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L248	 ;
.L268:
 ; D:\TC\temp\codegen.c:475:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp194, jump_to_end
 ; D:\TC\temp\codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%rdi), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp195
	jne	.L250	 ;,
 ; D:\TC\temp\codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%rdi), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp196, elif_list
.L251:
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r13, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp210, elif
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L250	 ;,
 ; D:\TC\temp\codegen.c:484:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp197, else_if_block
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_if_block,
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:486:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_56(D)->current_block
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
	movq	%rax, %r14	 ; tmp198, then_label
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	(%r12), %rcx	 ; elif_90->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp199, else_label
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r13, %rcx	 ; elif_list,
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	%rax, %r15	 ; tmp200, condition
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp201
	je	.L253	 ;,
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:493:                 else_label = end_label;
	testb	%al, %al	 ; tmp202
	cmovne	%rbp, %rsi	 ; else_label,, end_label, else_label
.L253:
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _24, %sfp
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _24
	movq	%r15, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp204
 ; D:\TC\temp\codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp205, inst
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:497:             then_block = create_block(then_label);
	movq	%r14, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r14	 ; tmp206, then_block
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _28->blocks, _28->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:499:             status->current_block = then_block;
	movq	%r14, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rcx	 ; elif_90->body, elif_90->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp207, elif_statements
.L254:
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, elif_statement
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	je	.L269	 ;,
 ; D:\TC\temp\codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L254	 ;
.L269:
 ; D:\TC\temp\codegen.c:506:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp209, jump_to_end
 ; D:\TC\temp\codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _31->instructions, _31->instructions
	call	list_append	 ;
	jmp	.L251	 ;
.L250:
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp211
	jne	.L257	 ;,
 ; D:\TC\temp\codegen.c:513:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp212, else_block
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_block,
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:515:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_56(D)->current_block
 ; D:\TC\temp\codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp213, else_statements
.L258:
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp214, else_statement
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	je	.L270	 ;,
 ; D:\TC\temp\codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L258	 ;
.L270:
 ; D:\TC\temp\codegen.c:522:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	movl	$20, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp215, jump_to_end
 ; D:\TC\temp\codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _38->instructions, _38->instructions
	call	list_append	 ;
.L257:
 ; D:\TC\temp\codegen.c:526:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp216, end_block
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _40->blocks, _40->blocks
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
	.section .rdata,"dr"
.LC27:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
.LC28:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
.LC29:
	.ascii "[warning] Unsupported statement type for codegen_statement: %d\12\0"
	.text
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	movl	8(%rcx), %r8d	 ; statement_30(D)->type,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	cmpl	$7, %r8d	 ;, _1
	ja	.L272	 ;,
	movq	%rdx, %rbx	 ; tmp142, status
	leaq	.L274(%rip), %rdx	 ;, tmp118
	movslq	(%rdx,%r8,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L274:
	.long	.L281-.L274
	.long	.L280-.L274
	.long	.L279-.L274
	.long	.L278-.L274
	.long	.L277-.L274
	.long	.L276-.L274
	.long	.L275-.L274
	.long	.L273-.L274
	.text
.L281:
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.expr,
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	codegen_expression	 ;
.L280:
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.var,
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	%rbx, %rdx	 ; status,
	movl	$118, %r8d	 ;,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	codegen_variable	 ;
.L279:
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.if_stmt,
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	codegen_if	 ;
.L278:
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.while_stmt,
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	codegen_while	 ;
.L277:
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.for_stmt,
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	codegen_for	 ;
.L276:
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.return_expr,
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:420:             Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$21, %ecx	 ;,
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	%rax, %rdx	 ; tmp143, return_value
	jmp	.L291	 ;
.L275:
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rbx), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp145
	jne	.L282	 ;,
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbx), %rax	 ; status_31(D)->end_labels, status_31(D)->end_labels
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _12->tail, _12->tail
	movq	8(%rax), %rdx	 ; _13->content, label
 ; D:\TC\temp\codegen.c:427:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L282	 ;,
.L293:
 ; D:\TC\temp\codegen.c:428:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
.L291:
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp146, inst
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rcx	 ;, _14->instructions
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
.L282:
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	leaq	.LC27(%rip), %rcx	 ;, tmp131
	movq	24(%rax), %rdx	 ; _16->_stderr, _16->_stderr
	jmp	.L292	 ;
.L273:
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rbx), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp148
	jne	.L283	 ;,
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rbx), %rax	 ; status_31(D)->start_labels, status_31(D)->start_labels
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _20->tail, _20->tail
	movq	8(%rax), %rdx	 ; _21->content, label
 ; D:\TC\temp\codegen.c:438:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	jne	.L293	 ;,
.L283:
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	leaq	.LC28(%rip), %rcx	 ;, tmp138
	movq	24(%rax), %rdx	 ; _24->_stderr, _24->_stderr
.L292:
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	jmp	fputs	 ;
.L272:
	movl	%r8d, 44(%rsp)	 ; _1, %sfp
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movl	44(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC29(%rip), %rdx	 ;, tmp140
	movq	24(%rax), %rcx	 ; _26->_stderr, _26->_stderr
 ; D:\TC\temp\codegen.c:450: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp171, for_
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp172, status
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__53(D)->initializer, _1
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L295	 ;,
 ; D:\TC\temp\codegen.c:533:         codegen_variable(for_->initializer, status, VAR_VAR);
	movl	$118, %r8d	 ;,
	call	codegen_variable	 ;
.L295:
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
	movq	%rax, %rbp	 ; tmp173, condition_label
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp174, body_label
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, for__53(D)->condition
 ; D:\TC\temp\codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp175, end_label
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	je	.L296	 ;,
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp176, _3
 ; D:\TC\temp\codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp177, inst
 ; D:\TC\temp\codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:542:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp178, condition_block
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%r13, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:544:         status->current_block = condition_block;
	movq	%r13, 16(%rbx)	 ; condition_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%rsi), %rcx	 ; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	%rax, %r13	 ; tmp179, condition
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 40(%rsp)	 ; _9, %sfp
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	40(%rsp), %r9	 ; %sfp, _9
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:\TC\temp\codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp181
	jmp	.L309	 ;
.L296:
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp183, _13
.L309:
 ; D:\TC\temp\codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp184, inst
 ; D:\TC\temp\codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ;, _14->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:555:     Block* body_block = create_block(body_label);
	movq	%rdi, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp185, body_block
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%r13, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _16->blocks, _16->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:557:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; body_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%rsi)	 ;, for__53(D)->increment
 ; D:\TC\temp\codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp186, increment_label
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	jne	.L310	 ;,
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rsi)	 ;, for__53(D)->condition
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	jne	.L310	 ;,
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rdi, %rdx	 ; body_label,
.L310:
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rdx	 ; tmp189, _24
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp190, _26
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; for__53(D)->body, for__53(D)->body
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp191, body_statements
.L301:
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r14, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp192, statement
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L311	 ;,
 ; D:\TC\temp\codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L301	 ;
.L311:
 ; D:\TC\temp\codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, for__53(D)->increment
	je	.L303	 ;,
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r13, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp193, _32
 ; D:\TC\temp\codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp194, inst
 ; D:\TC\temp\codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:577:         Block* increment_block = create_block(increment_label);
	movq	%r13, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp195, increment_block
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%r13, %rdx	 ; increment_block,
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:579:         status->current_block = increment_block;
	movq	%r13, 16(%rbx)	 ; increment_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%rsi), %rcx	 ; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
.L303:
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp196, _38
 ; D:\TC\temp\codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%rsi)	 ;, for__53(D)->condition
	jne	.L304	 ;,
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp198, _40
 ; D:\TC\temp\codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
.L304:
 ; D:\TC\temp\codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rdx	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rdx), %rcx	 ; _41->instructions, _41->instructions
	movq	%rax, %rdx	 ; inst,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:588:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp200, end_block
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _43->blocks, _43->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:590:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_54(D)->current_block
 ; D:\TC\temp\codegen.c:591: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r13	 ;
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp137, while_
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp138, status
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	subq	$56, %rsp	 ;,
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %ecx	 ;,
	movq	%rax, %rdx	 ; condition_label,
 ; D:\TC\temp\codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp139, condition_label
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp140, _1
 ; D:\TC\temp\codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp141, inst
 ; D:\TC\temp\codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:597:     Block* condition_block = create_block(condition_label);
	movq	%rsi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp142, condition_block
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%rdi, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:599:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; condition_block, status_27(D)->current_block
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
	movq	%rax, %r12	 ; tmp143, body_label
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	0(%rbp), %rcx	 ; while__42(D)->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp144, end_label
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	%rax, %r13	 ; tmp145, condition
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 40(%rsp)	 ; _7, %sfp
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	40(%rsp), %r9	 ; %sfp, _7
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp147
 ; D:\TC\temp\codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp148, inst
 ; D:\TC\temp\codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:607:     Block* body_block = create_block(body_label);
	movq	%r12, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp149, body_block
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%r12, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:609:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; body_block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rdx	 ; tmp150, _13
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp151, _15
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rcx	 ; while__42(D)->body, while__42(D)->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp152, body_statements
.L313:
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp153, statement
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L316	 ;,
 ; D:\TC\temp\codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L313	 ;
.L316:
 ; D:\TC\temp\codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp154, _20
 ; D:\TC\temp\codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:\TC\temp\codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:623:     Block* end_block = create_block(end_label);
	movq	%rdi, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp156, end_block
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _23->blocks, _23->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:625:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_27(D)->current_block
 ; D:\TC\temp\codegen.c:626: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp110, function
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp111, status
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rcx), %rdx	 ; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rcx), %rcx	 ; function_16(D)->name,
	call	create_subroutine	 ;
 ; D:\TC\temp\codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %rdi	 ; tmp112, subroutine
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	%rdi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rsi), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp113, parameters
.L318:
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L323	 ;,
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	(%rax), %rdx	 ; parameter_25->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rdi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp114, _8
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L318	 ;
.L323:
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp116, _10
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rdi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
 ; D:\TC\temp\codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rbp	 ; tmp117, block
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:332:     status->current_block = block;
	movq	%rbp, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rsi), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp118, statements
.L320:
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp119, statement
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L324	 ;,
 ; D:\TC\temp\codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L320	 ;
.L324:
 ; D:\TC\temp\codegen.c:339:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, status_19(D)->current_subroutine
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
	movq	%rcx, %rsi	 ; tmp110, method
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp111, status
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rcx), %rdx	 ; method_16(D)->return_type, method_16(D)->return_type
	movq	(%rcx), %rcx	 ; method_16(D)->name,
	call	create_subroutine	 ;
 ; D:\TC\temp\codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %rdi	 ; tmp112, subroutine
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	%rdi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rsi), %rcx	 ; method_16(D)->parameters, method_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp113, parameters
.L326:
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L331	 ;,
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	(%rax), %rdx	 ; parameter_25->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rdi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp114, _8
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L326	 ;
.L331:
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp116, _10
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rdi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
 ; D:\TC\temp\codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rbp	 ; tmp117, block
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:354:     status->current_block = block;
	movq	%rbp, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rsi), %rcx	 ; method_16(D)->body, method_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp118, statements
.L328:
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp119, statement
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L332	 ;,
 ; D:\TC\temp\codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
	jmp	.L328	 ;
.L332:
 ; D:\TC\temp\codegen.c:361:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:362: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC30:
	.ascii "[warning] Unsupported class member type for codegen_class: %d\12\0"
	.text
	.globl	codegen_class
	.def	codegen_class;	.scl	2;	.type	32;	.endef
codegen_class:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp104, class
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp105, status
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_14(D)->members, class_14(D)->members
	call	list_copy	 ;
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rdi), %r12	 ; class_14(D)->name, _2
 ; D:\TC\temp\codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rbp	 ; tmp106, members
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp107, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:16:     table->name = name;
	movq	%r12, 8(%rbx)	 ; _2, table_28->name
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rbx, %rdx	 ; table,
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp108, table_28->attributes
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	24(%rdi), %rax	 ; class_14(D)->size, class_14(D)->size
	movq	%rax, 16(%rbx)	 ; class_14(D)->size, table_28->size
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rsi), %rax	 ; status_20(D)->tac, status_20(D)->tac
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	leaq	.LC30(%rip), %rbx	 ;, tmp103
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rcx	 ; _4->attribute_tables,
	call	list_append	 ;
.L334:
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbp, %rcx	 ; members,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L342	 ;,
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	movl	8(%rax), %r8d	 ; member_23->type, _6
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	testl	%r8d, %r8d	 ; _6
	je	.L335	 ;,
	cmpl	$1, %r8d	 ;, _6
	jne	.L343	 ;,
 ; D:\TC\temp\codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_23->content.variable,
	movl	$97, %r8d	 ;,
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:377:                 break;
	jmp	.L334	 ;
.L335:
 ; D:\TC\temp\codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_23->content.method,
	movq	%rsi, %rdx	 ; status,
	call	codegen_method	 ;
 ; D:\TC\temp\codegen.c:374:                 break;
	jmp	.L334	 ;
.L343:
	movl	%r8d, 44(%rsp)	 ; _6, %sfp
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:379:                 fprintf(stderr, "[warning] Unsupported class member type for codegen_class: %d\n", member->type);
	movl	44(%rsp), %r8d	 ; %sfp, _6
	movq	%rbx, %rdx	 ; tmp103,
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:380:                 break;
	jmp	.L334	 ;
.L342:
 ; D:\TC\temp\codegen.c:383: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC31:
	.ascii "main\0"
	.text
	.globl	codegen_code
	.def	codegen_code;	.scl	2;	.type	32;	.endef
codegen_code:
	pushq	%r12	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC31(%rip), %r12	 ;, tmp108
 ; D:\TC\temp\codegen.c:291: TAC* codegen_code(Code* code) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp109, code
 ; D:\TC\temp\codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:291: TAC* codegen_code(Code* code) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp110, <retval>
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:77:     tac->attribute_tables = create_list();
	movq	%rax, (%rsi)	 ; tmp111, tac_29->attribute_tables
 ; D:\TC\temp\codegen.c:78:     tac->entry_point = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rsi)	 ;, tac_29->entry_point
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:79:     tac->global_vars = create_list();
	movq	%rax, 16(%rsi)	 ; tmp112, tac_29->global_vars
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %ecx	 ;,
 ; D:\TC\temp\codegen.c:80:     tac->subroutines = create_list();
	movq	%rax, 24(%rsi)	 ; tmp113, tac_29->subroutines
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:87:     status->current_block = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rax)	 ;, status_26->current_subroutine
 ; D:\TC\temp\codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rbx	 ; tmp114, status
 ; D:\TC\temp\codegen.c:87:     status->current_block = NULL;
	movq	%rdx, 16(%rax)	 ;, status_26->current_block
 ; D:\TC\temp\codegen.c:85:     status->tac = tac;
	movq	%rsi, (%rax)	 ; <retval>, status_26->tac
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:88:     status->end_labels = create_list();
	movq	%rax, 24(%rbx)	 ; tmp115, status_26->end_labels
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:93:     status->temp_count = 0;
	xorl	%ecx, %ecx	 ;
	movq	%rcx, 40(%rbx)	 ;, status_26->attr_count
	movq	%rcx, 48(%rbx)	 ;, status_26->param_count
	movq	%rcx, 56(%rbx)	 ;, status_26->var_count
 ; D:\TC\temp\codegen.c:95:     status->subroutine_count = 0;
	movq	%rcx, 64(%rbx)	 ;, status_26->temp_count
	movq	%rcx, 72(%rbx)	 ;, status_26->block_count
	movq	%rcx, 80(%rbx)	 ;, status_26->subroutine_count
 ; D:\TC\temp\codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rcx	 ; code_17(D)->members,
 ; D:\TC\temp\codegen.c:89:     status->start_labels = create_list();
	movq	%rax, 32(%rbx)	 ; tmp116, status_26->start_labels
 ; D:\TC\temp\codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp117, members
.L345:
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rbp, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp119, code_member
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L353	 ;,
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rdi), %eax	 ; code_member_21->type, _2
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	jne	.L346	 ;,
 ; D:\TC\temp\codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.function,
	movq	%rbx, %rdx	 ; status,
	call	codegen_function	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rdi), %rax	 ; code_member_21->content.function, code_member_21->content.function
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r12, %rdx	 ; tmp108,
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rdi	 ; _4->name, _5
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rdi), %rcx	 ; _5->name, _5->name
	call	strcmp	 ;
 ; D:\TC\temp\codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp118
	jne	.L345	 ;,
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rdi, 8(%rsi)	 ; _5, tac_29->entry_point
	jmp	.L345	 ;
.L346:
 ; D:\TC\temp\codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	jne	.L349	 ;,
 ; D:\TC\temp\codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.class,
	movq	%rbx, %rdx	 ; status,
	call	codegen_class	 ;
	jmp	.L345	 ;
.L349:
 ; D:\TC\temp\codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L345	 ;,
 ; D:\TC\temp\codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.import,
	movq	%rbx, %r8	 ; status,
	movq	%rsi, %rdx	 ; <retval>,
	call	codegen_import	 ;
	jmp	.L345	 ;
.L353:
 ; D:\TC\temp\codegen.c:308: }
	addq	$32, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
	.align 16
CSWTCH.22:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	14
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
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
