	.file	"codegen.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	find_var_by_symbol, @function
find_var_by_symbol:
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rdi, %rdi	; vars
	je	.L6	;,
	testq	%rsi, %rsi	; symbol
	je	.L6	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rdi), %rdx	; vars_7(D)->head, current
.L3:
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rdx, %rdx	; current
	je	.L6	;,
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rdx), %rax	; current_5->content, <retval>
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rax, %rax	; <retval>
	je	.L4	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	%rsi, (%rax)	; symbol, var_12->original_name
	je	.L1	;,
.L4:
; temp/codegen.c:205:         current = current->next;
	movq	(%rdx), %rdx	; current_5->next, current
	jmp	.L3	;
.L6:
; temp/codegen.c:199:         return NULL;
	xorl	%eax, %eax	; <retval>
.L1:
; temp/codegen.c:208: }
	ret	
	.size	find_var_by_symbol, .-find_var_by_symbol
	.type	create_instruction, @function
create_instruction:
	pushq	%r13	;
	movl	%edi, %r13d	; tmp88, type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:134: static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, arg1
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, arg2
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, arg3
	pushq	%rax	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	; type, inst_3->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg1, inst_3->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg2, inst_3->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; arg3, inst_3->arg3
; temp/codegen.c:141: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_instruction, .-create_instruction
	.type	create_subroutine, @function
create_subroutine:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp89, name
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; temp/codegen.c:98: static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp90, return_type
	pushq	%rbx	;
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp91, <retval>
; temp/codegen.c:100:     subroutine->name = name;
	movq	%r12, (%rax)	; name, subroutine_6->name
; temp/codegen.c:101:     subroutine->return_type = return_type;
	movq	%rbp, 8(%rax)	; return_type, subroutine_6->return_type
; temp/codegen.c:102:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbx)	; tmp92, subroutine_6->parameters
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbx)	; tmp93, subroutine_6->local_vars
; temp/codegen.c:104:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbx)	; tmp94, subroutine_6->blocks
; temp/codegen.c:106: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_subroutine, .-create_subroutine
	.type	create_block, @function
create_block:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, label
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; temp/codegen.c:107: static Block* create_block(Var* label) {
	pushq	%rbx	;
	pushq	%rax	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp87, <retval>
; temp/codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	; label, block_4->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	; tmp88, block_4->instructions
; temp/codegen.c:112: }
	movq	%rbx, %rax	; <retval>,
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_block, .-create_block
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%r13	;
	movq	%rdi, %r13	; tmp105, original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:113: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp106, type
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp108, status
	subq	$24, %rsp	;,
; temp/codegen.c:113: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	movl	%edx, (%rsp)	; kind, %sfp
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:117:     switch (kind) {
	movl	(%rsp), %r8d	; %sfp, kind
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r13, (%rax)	; original_name, var_19->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	; tmp109, <retval>
; temp/codegen.c:117:     switch (kind) {
	cmpl	$112, %r8d	;, kind
	je	.L18	;,
	ja	.L19	;,
	cmpl	$98, %r8d	;, kind
	je	.L20	;,
	cmpl	$102, %r8d	;, kind
	je	.L21	;,
	cmpl	$97, %r8d	;, kind
	je	.L22	;,
	jmp	.L29	;
.L19:
	cmpl	$116, %r8d	;, kind
	je	.L24	;,
	cmpl	$118, %r8d	;, kind
	je	.L25	;,
.L29:
	orq	$-1, %r9	;, id
	jmp	.L23	;
.L22:
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rbx), %r9	; status_23(D)->attr_count, id
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r9), %rax	;, tmp95
	movq	%rax, 40(%rbx)	; tmp95, status_23(D)->attr_count
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L23	;
.L18:
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rbx), %r9	; status_23(D)->param_count, id
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r9), %rax	;, tmp96
	movq	%rax, 48(%rbx)	; tmp96, status_23(D)->param_count
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L23	;
.L25:
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbx), %r9	; status_23(D)->var_count, id
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r9), %rax	;, tmp97
	movq	%rax, 56(%rbx)	; tmp97, status_23(D)->var_count
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L23	;
.L24:
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbx), %r9	; status_23(D)->temp_count, id
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	;, tmp98
	movq	%rax, 64(%rbx)	; tmp98, status_23(D)->temp_count
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L23	;
.L20:
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r9	; status_23(D)->block_count, id
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	;, tmp99
	movq	%rax, 72(%rbx)	; tmp99, status_23(D)->block_count
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L23	;
.L21:
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rbx), %r9	; status_23(D)->subroutine_count, id
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r9), %rax	;, tmp100
	movq	%rax, 80(%rbx)	; tmp100, status_23(D)->subroutine_count
.L23:
	movq	%r9, (%rsp)	; id, %sfp
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp101
	movl	$32, %esi	;,
	movl	%r8d, 12(%rsp)	; kind, %sfp
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	(%rsp), %r9	; %sfp, id
	movl	12(%rsp), %r8d	; %sfp, kind
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _13, var_19->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp110, _13
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, id
	jne	.L26	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC1(%rip), %rcx	;, tmp102
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L27	;
.L26:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp103
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L27:
; temp/codegen.c:131:     var->type = type;
	movq	%r12, 16(%rbp)	; type, var_19->type
; temp/codegen.c:133: }
	addq	$24, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_var, .-create_var
	.section	.rodata.str1.1
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
; temp/codegen.c:22:         return 0;
	xorl	%eax, %eax	; <retval>
; temp/codegen.c:21:     if (type == NULL)
	testq	%rdi, %rdi	; type
	je	.L38	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_int(%rip)	; type, name_int
	je	.L39	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_float(%rip)	; type, name_float
	je	.L39	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_string(%rip)	; type, name_string
	je	.L39	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rdi, name_bool(%rip)	; type, name_bool
; temp/codegen.c:26:         return 1;
	movl	$1, %eax	;, <retval>
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	je	.L38	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rdi, name_void(%rip)	; type, name_void
	je	.L38	;,
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rdi)	;, type_12(D)->kind
	jne	.L33	;,
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rdi), %rax	; type_12(D)->ast_node.class, type_12(D)->ast_node.class
	movq	24(%rax), %rax	; _7->size, <retval>
	ret	
.L33:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
; temp/codegen.c:20: static size_t get_type_size(Symbol* type) {
	pushq	%rax	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movq	8(%rdi), %rcx	; type_12(D)->name, type_12(D)->name
	movq	stderr(%rip), %rdi	; stderr,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:24:         return 8;
	movl	$8, %eax	;, <retval>
; temp/codegen.c:31: }
	popq	%rdx	;
	ret	
.L39:
; temp/codegen.c:24:         return 8;
	movl	$8, %eax	;, <retval>
	ret	
.L38:
; temp/codegen.c:31: }
	ret	
	.size	get_type_size, .-get_type_size
	.type	create_arg, @function
create_arg:
	pushq	%rbp	;
	movl	%edi, %ebp	; tmp110, kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:142: static Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, value
	pushq	%r8	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:145:     arg->type = NULL;
	xorl	%r9d, %r9d	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	%ebp, 16(%rax)	; kind, arg_15->kind
; temp/codegen.c:146:     switch (kind) {
	decl	%ebp	;
; temp/codegen.c:145:     arg->type = NULL;
	movq	%r9, 8(%rax)	;, arg_15->type
; temp/codegen.c:146:     switch (kind) {
	cmpl	$6, %ebp	;, tmp95
	ja	.L43	;,
	leaq	.L44(%rip), %rcx	;, tmp97
	movslq	(%rcx,%rbp,4), %rdx	;, tmp99
	addq	%rcx, %rdx	; tmp97, tmp100
	jmp	*%rdx	; tmp100
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L50:
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	; MEM[(long long int *)value_19(D)], _2
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	; _2, arg_15->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rdx	; name_int, name_int
	jmp	.L53	;
.L49:
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	; MEM[(double *)value_19(D)], _4
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rdx	; name_float, name_float
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _4, arg_15->value.float_value
	jmp	.L53	;
.L48:
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movq	%rbx, (%rax)	; value, arg_15->value.string_value
; temp/codegen.c:161:             arg->type = name_string;
	movq	name_string(%rip), %rdx	; name_string, name_string
	jmp	.L53	;
.L47:
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	(%rbx), %dl	; MEM[(char *)value_19(D)], _7
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	%dl, (%rax)	; _7, arg_15->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	; name_bool, name_bool
	jmp	.L53	;
.L46:
; temp/codegen.c:168:             arg->value.string_value = NULL;
	xorl	%ecx, %ecx	;
; temp/codegen.c:169:             arg->type = name_void;
	movq	name_void(%rip), %rdx	; name_void, name_void
; temp/codegen.c:168:             arg->value.string_value = NULL;
	movq	%rcx, (%rax)	;, arg_15->value.string_value
	jmp	.L53	;
.L45:
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	; value, arg_15->value.label
; temp/codegen.c:173:             break;
	jmp	.L51	;
.L43:
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	; value,* <retval>
; temp/codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	; MEM[(struct Var *)value_19(D)].type, MEM[(struct Var *)value_19(D)].type
.L53:
	movq	%rdx, 8(%rax)	; MEM[(struct Var *)value_19(D)].type, arg_15->type
.L51:
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_15->is_get
; temp/codegen.c:185: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_arg, .-create_arg
	.type	emit_param_instruction, @function
emit_param_instruction:
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rdi, %rdi	; value
	je	.L57	;,
; temp/codegen.c:283: static void emit_param_instruction(Arg* value, TACStatus* status) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp103, status
	pushq	%rbx	;
	subq	$24, %rsp	;,
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rsi, %rsi	; status
	je	.L54	;,
	movq	%rdi, %rbx	; tmp102, value
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rdi), %rdi	; value_4(D)->type, value_4(D)->type
	call	get_type_size	;
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	leaq	8(%rsp), %rsi	;, tmp99
	movl	$1, %edi	;,
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, 8(%rsp)	; tmp104, size
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	call	create_arg	;
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movl	$17, %edi	;,
	xorl	%ecx, %ecx	;
	movq	%rbx, %rdx	; value,
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movq	%rax, %rsi	; tmp105, _12
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp106, inst
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_5(D)->current_block, status_5(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L54:
; temp/codegen.c:289: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L57:
	ret	
	.size	emit_param_instruction, .-emit_param_instruction
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:186: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	movq	%rdi, %rbx	; tmp96, arg
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rdi, %rdi	; arg
	je	.L61	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_3(D)->is_get
	je	.L61	;,
	movq	%rsi, %r12	; tmp97, status
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_3(D)->type, arg_3(D)->type
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	%r12, %rcx	; status,
	call	create_var	;
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp98, _10
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %rdx	; arg,
	xorl	%ecx, %ecx	;
	movl	$23, %edi	;,
	movq	%rax, %rsi	; temp,
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp99, temp
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	;
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbp, %rbx	; temp, arg
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rsi	; tmp100, _12
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%r12), %rax	; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L61:
; temp/codegen.c:195: }
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC4:
	.string	"<unknown>"
.LC5:
	.string	"[warning] Invalid attribute access\n"
.LC6:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
.LC7:
	.string	"$a%zu"
	.text
	.type	emit_attribute_access, @function
emit_attribute_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; temp/codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rdi, %rdi	; object
	je	.L87	;,
	movq	%rsi, %rbp	; tmp148, attr_name
	testq	%rsi, %rsi	; attr_name
	jne	.L67	;,
.L87:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC5(%rip), %rdi	;, tmp123
	call	*fputs@GOTPCREL(%rip)	;
; temp/codegen.c:267:         return NULL;
	jmp	.L69	;
.L67:
; temp/codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	%rdx, %rsi	; status,
	movq	%rdx, %r12	; tmp149, status
	call	load_rvalue	;
	movq	%rax, %r14	; tmp150, object_value
; temp/codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	; object_value
	jne	.L70	;,
.L69:
; temp/codegen.c:267:         return NULL;
	xorl	%ebp, %ebp	; <retval>
	jmp	.L66	;
.L70:
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rax), %r13	; object_value_21->type, class_type
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	; class_type
	je	.L72	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	;, _5->kind
	je	.L72	;,
; temp/codegen.c:272:     Symbol* class_type = NULL;
	xorl	%r13d, %r13d	; class_type
.L72:
; temp/codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%r12), %rax	; MEM[(struct TAC * *)status_19(D)], MEM[(struct TAC * *)status_19(D)]
	movq	(%rax), %rdi	; _54->attribute_tables,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp151, attribute_tables
.L73:
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%rbx, %rdi	; attribute_tables,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	; current
	je	.L76	;,
; temp/codegen.c:9:         if (current->name == name)
	cmpq	%r13, 8(%rax)	; class_type, current_58->name
	jne	.L73	;,
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rdi	; current_58->attributes, _34
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _34
	jne	.L77	;,
.L76:
; temp/codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	0(%rbp), %rsi	; attr_name_17(D)->type,
	movq	%r12, %rcx	; status,
	movl	$97, %edx	;,
	movq	%rbp, %rdi	; attr_name,
	call	create_var	;
	movq	%rax, %rbx	; tmp153, var
	jmp	.L78	;
.L77:
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	*list_copy@GOTPCREL(%rip)	;
; temp/codegen.c:243:     size_t index = 0;
	xorl	%r15d, %r15d	; index
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	%rax, %rbx	; tmp154, attrs
.L79:
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%rbx, %rdi	; attrs,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	; attr
	je	.L93	;,
; temp/codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbp	; attr_38->var_name, attr_name
	je	.L85	;,
; temp/codegen.c:252:         ++index;
	incq	%r15	; index
	jmp	.L79	;
.L93:
; temp/codegen.c:244:     bool found = false;
	xorl	%edx, %edx	; found
	jmp	.L80	;
.L85:
; temp/codegen.c:249:             found = true;
	movb	$1, %dl	;, found
.L80:
	movb	%dl, 15(%rsp)	; found, %sfp
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp126
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbp, (%rax)	; attr_name, var_42->original_name
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp156, var
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	0(%rbp), %rax	; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rax, 16(%rbx)	; attr_name_17(D)->type, var_42->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:258:     if (!found)
	movb	15(%rsp), %dl	; %sfp, found
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; tmp157, var_42->name
; temp/codegen.c:258:     if (!found)
	testb	%dl, %dl	; found
	jne	.L82	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC4(%rip), %r8	;, iftmp.44_49
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%r13, %r13	; class_type
	je	.L83	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%r13), %r8	; class_type_61->name, iftmp.44_49
.L83:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbp), %rcx	; attr_name_17(D)->name, attr_name_17(D)->name
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r15, %r9	; index,
	xorl	%eax, %eax	;
	leaq	.LC6(%rip), %rdx	;, tmp129
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L82:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	8(%rbx), %rdi	; var_42->name, var_42->name
	movq	%r15, %r8	; index,
	leaq	.LC7(%rip), %rcx	;, tmp131
	xorl	%eax, %eax	;
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L78:
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	0(%rbp), %rsi	; attr_name_17(D)->type,
	movq	%r12, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp158, _9
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%rbx, %rsi	; var,
	xorl	%edi, %edi	;
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp159, <retval>
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	call	create_arg	;
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%r14, %rdx	; object_value,
	movq	%rbp, %rsi	; <retval>,
	movl	$15, %edi	;,
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%rax, %rcx	; tmp160, _10
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp161, inst
; temp/codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%r12), %rax	; status_19(D)->current_block, status_19(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rbp)	;, result_26->is_get
.L66:
; temp/codegen.c:281: }
	addq	$24, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	emit_attribute_access, .-emit_attribute_access
	.section	.rodata.str1.1
.LC8:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp104, tac
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbp	; import_15(D)->name, _1
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbp), %ecx	; _1->kind, _2
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	jne	.L95	;,
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rdx, %rcx	; status,
	movl	$118, %edx	;,
	jmp	.L99	;
.L95:
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp99
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp99
	ja	.L96	;,
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
.L99:
	movq	0(%rbp), %rsi	; _1->type,
	movq	%rbp, %rdi	; _1,
	call	create_var	;
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp107, _8
.L100:
; temp/codegen.c:318: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
.L96:
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L97	;,
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp108, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:16:     table->name = name;
	movq	%rbp, 8(%rbx)	; _1, table_25->name
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%r12), %rdi	; tac_17(D)->attribute_tables,
	movq	%rbx, %rsi	; table,
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%rbx)	; tmp109, table_25->attributes
; temp/codegen.c:17:     table->size = 0;
	xorl	%eax, %eax	;
	movq	%rax, 16(%rbx)	;, table_25->size
	jmp	.L100	;
.L97:
; temp/codegen.c:318: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; temp/codegen.c:318: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC8(%rip), %rdx	;, tmp102
; temp/codegen.c:318: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	codegen_import, .-codegen_import
	.section	.rodata.str1.1
.LC9:
	.string	"Error: create_attribute received NULL table or attributes list\n"
.LC10:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%r13	;
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	%rsi, %rcx	; status,
; temp/codegen.c:384: void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
	pushq	%r12	;
	movq	%rdi, %r12	; tmp127, variable
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp128, status
	pushq	%rbx	;
	movl	%edx, %ebx	; tmp129, type
	pushq	%r11	;
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%r12), %rsi	; variable_20(D)->type,
	movq	8(%rdi), %rdi	; variable_20(D)->name, variable_20(D)->name
	call	create_var	;
	movq	%rax, %rsi	; tmp130, var
; temp/codegen.c:386:     switch (type) {
	cmpl	$112, %ebx	;, type
	je	.L102	;,
	ja	.L103	;,
	cmpl	$97, %ebx	;, type
	je	.L104	;,
	cmpl	$102, %ebx	;, type
	jne	.L106	;,
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	0(%rbp), %rax	; status_22(D)->tac, status_22(D)->tac
	jmp	.L112	;
.L103:
; temp/codegen.c:386:     switch (type) {
	cmpl	$116, %ebx	;, type
	je	.L108	;,
	cmpl	$118, %ebx	;, type
	je	.L108	;,
	jmp	.L106	;
.L102:
; temp/codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbp), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	jmp	.L112	;
.L108:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbp), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	24(%rax), %rdi	;, _5->local_vars
.L111:
; temp/codegen.c:410: }
	popq	%r10	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
.L112:
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rdi	;, _9->global_vars
	jmp	.L111	;
.L104:
; temp/codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	0(%rbp), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	(%rax), %rdi	; _11->attribute_tables,
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp131, attr_table
; temp/codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	%rbx, %rsi	; attr_table,
	movq	(%rax), %rdi	; _13->attribute_tables,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	(%r12), %r13	; variable_20(D)->type, _15
	movq	8(%r12), %r12	; variable_20(D)->name, _16
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:34:     attr->var_name = var_name;
	movq	%r12, (%rax)	; _16, attr_34->var_name
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rbp	; tmp132, attr
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _15,
; temp/codegen.c:35:     attr->type = type;
	movq	%r13, 8(%rax)	; _15, attr_34->type
; temp/codegen.c:38:         attr->offset = table->size;
	movq	16(%rbx), %rax	; attr_table_30->size, attr_table_30->size
	movq	%rax, 16(%rbp)	; attr_table_30->size, attr_34->offset
; temp/codegen.c:39:         table->size += get_type_size(type);
	call	get_type_size	;
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%rbx), %rdi	; attr_table_30->attributes, _39
; temp/codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, 16(%rbx)	; tmp133, attr_table_30->size
; temp/codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _39
	jne	.L111	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC9(%rip), %rdi	;, tmp124
; temp/codegen.c:410: }
	popq	%r9	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L106:
	movq	stderr(%rip), %rdi	; stderr,
	movl	%ebx, %ecx	; type,
; temp/codegen.c:410: }
	popq	%r8	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; temp/codegen.c:410: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC10(%rip), %rdx	;, tmp126
; temp/codegen.c:410: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; temp/codegen.c:410: }
	popq	%r12	;
	popq	%r13	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	codegen_variable, .-codegen_variable
	.section	.rodata.str1.1
.LC11:
	.string	"[warning] Invalid variable access input\n"
.LC12:
	.string	"[warning] Variable access name is NULL\n"
.LC13:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
.LC14:
	.string	"[warning] Invalid get-attribute access\n"
.LC15:
	.string	"[warning] Failed to generate object for get-attribute access\n"
.LC16:
	.string	"[warning] Invalid get-sequence access\n"
.LC17:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
.LC18:
	.string	"[warning] Invalid function call without callee\n"
.LC19:
	.string	"[warning] Failed to generate callee for function call\n"
.LC20:
	.string	"[warning] Unsupported callee in function call\n"
.LC21:
	.string	"[warning] Failed to generate function call argument\n"
.LC22:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; temp/codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rdi, %rdi	; variable_access
	je	.L159	;,
	movq	%rsi, %rbx	; tmp246, status
	testq	%rsi, %rsi	; status
	jne	.L114	;,
.L159:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC11(%rip), %rdi	;, tmp192
	jmp	.L202	;
.L114:
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rdi), %ecx	; variable_access_91(D)->type, _5
	movq	%rdi, %rbp	; tmp245, variable_access
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%ecx, %ecx	; _5
	jne	.L117	;,
; temp/codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rdi), %rbp	; variable_access_91(D)->content.name, name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC12(%rip), %rdi	;, tmp194
; temp/codegen.c:712:         if (name == NULL) {
	testq	%rbp, %rbp	; name
	je	.L202	;,
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rbx), %rcx	; status_92(D)->current_subroutine, _179
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rcx, %rcx	; _179
	je	.L120	;,
; temp/codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rcx), %rdi	; _179->parameters, _179->parameters
	movq	%rbp, %rsi	; name,
	call	find_var_by_symbol	;
; temp/codegen.c:215:         if (var != NULL)
	testq	%rax, %rax	; var
	jne	.L206	;,
; temp/codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rcx), %rdi	; _179->local_vars, _179->local_vars
	call	find_var_by_symbol	;
; temp/codegen.c:218:         if (var != NULL)
	testq	%rax, %rax	; var
	jne	.L206	;,
.L120:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rbx), %rax	; status_92(D)->tac, status_92(D)->tac
	movq	%rbp, %rsi	; name,
	movq	16(%rax), %rdi	; _184->global_vars, _184->global_vars
	call	find_var_by_symbol	;
; temp/codegen.c:717:         if (existing != NULL)
	testq	%rax, %rax	; var
	jne	.L206	;,
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%rbp)	;, name_148->kind
	ja	.L123	;,
.L205:
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %rsi	;* name,
	movq	%rbp, %rdi	; name,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp250, _9
.L204:
; temp/codegen.c:833: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	create_arg	;
.L123:
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rcx, %rcx	; _179
	je	.L124	;,
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%rcx), %rax	; _179->parameters, _179->parameters
	movq	(%rax), %r13	; _189->head, current
.L125:
; temp/codegen.c:228:     while (current != NULL) {
	testq	%r13, %r13	; current
	je	.L124	;,
; temp/codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%r13), %r12	; current_191->content, var
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%r12, %r12	; var
	jne	.L126	;,
.L127:
; temp/codegen.c:232:         current = current->next;
	movq	0(%r13), %r13	; current_191->next, current
	jmp	.L125	;
.L126:
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%r12), %rax	; var_192->original_name, _193
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	; _193
	je	.L127	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rdi	; _193->name, _193->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	; tmp251
	je	.L127	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%r12), %rax	; var_192->type, _10
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	; _10
	je	.L124	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpl	$0, 32(%rax)	;, _10->kind
	je	.L207	;,
.L124:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbp), %rcx	; name_148->name, name_148->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC13(%rip), %rdx	;, tmp206
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	0(%rbp), %rsi	; name_148->type,
	movq	%rbx, %rcx	; status,
	movq	%rbp, %rdi	; name,
	movl	$118, %edx	;,
	call	create_var	;
.L206:
	movq	%rax, %rsi	; tmp253, _19
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	xorl	%edi, %edi	;
	jmp	.L204	;
.L117:
; temp/codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _5
	jne	.L130	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rdi), %rdi	; variable_access_91(D)->base, _20
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rdi, %rdi	; _20
	je	.L131	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rbp), %rbp	; variable_access_91(D)->content.attr_name, _21
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rbp, %rbp	; _21
	jne	.L132	;,
.L131:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC14(%rip), %rdi	;, tmp208
	jmp	.L202	;
.L132:
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rbp), %eax	; _21->kind, tmp281
	decl	%eax	; tmp209
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	;, tmp209
	jbe	.L205	;,
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	;
	movq	%rax, %rdi	; tmp255, object
; temp/codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	; object
	jne	.L134	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC15(%rip), %rdi	;, tmp212
	jmp	.L202	;
.L207:
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	; _10->ast_node.class, _10->ast_node.class
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	; _13->class_scope, tmp280
	cmpq	%rax, 24(%rbp)	; tmp280, name_148->ast_node.scope
	jne	.L124	;,
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	xorl	%edi, %edi	;
	movq	%r12, %rsi	; var,
	call	create_arg	;
	movq	%rax, %rdi	; tmp252, _15
.L134:
; temp/codegen.c:833: }
	addq	$24, %rsp	;,
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rbx, %rdx	; status,
	movq	%rbp, %rsi	; _21,
; temp/codegen.c:833: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	jmp	emit_attribute_access	;
.L130:
; temp/codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _5
	jne	.L135	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rdi), %rdi	; variable_access_91(D)->base, _28
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rdi, %rdi	; _28
	je	.L136	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rbp)	;, variable_access_91(D)->content.index
	jne	.L137	;,
.L136:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC16(%rip), %rdi	;, tmp214
	jmp	.L202	;
.L137:
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	;
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	; tmp256, _31
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	load_rvalue	;
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rdi	; variable_access_91(D)->content.index, variable_access_91(D)->content.index
	movq	%rbx, %rsi	; status,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rax, %r12	; tmp257, sequence
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	codegen_expression	;
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rax, %rdi	; tmp258, _33
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	call	load_rvalue	;
	movq	%rax, %r13	; tmp259, index
; temp/codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%r12, %r12	; sequence
	je	.L160	;,
	testq	%rax, %rax	; index
	jne	.L138	;,
.L160:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC17(%rip), %rdi	;, tmp221
	jmp	.L202	;
.L138:
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%r12), %rsi	; sequence_129->type, _38
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_float(%rip), %rsi	; name_float, _38
; temp/codegen.c:755:         Symbol* element_type = name_int;
	movq	name_int(%rip), %rax	; name_int, element_type
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	je	.L140	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_bool(%rip), %rsi	; name_bool, _38
	je	.L140	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_string(%rip), %rsi	; name_string, _38
	je	.L140	;,
; temp/codegen.c:755:         Symbol* element_type = name_int;
	movq	%rax, %rsi	; element_type, _38
.L140:
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp260, _42
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	movq	%r13, %rcx	; index,
	movq	%r12, %rdx	; sequence,
	movl	$16, %edi	;,
	movq	%rax, %rsi	; <retval>,
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp261, <retval>
; temp/codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp262, inst
; temp/codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_92(D)->current_block, status_92(D)->current_block
	movq	8(%rax), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:761:         result->is_get = true;
	movb	$1, 20(%rbp)	;, result_136->is_get
; temp/codegen.c:762:         return result;
	jmp	.L113	;
.L135:
; temp/codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _5
	jne	.L141	;,
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rdi), %rdi	; variable_access_91(D)->base, _45
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _45
	jne	.L142	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC18(%rip), %rdi	;, tmp225
	jmp	.L202	;
.L142:
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rdi)	;, _45->type
	jne	.L144	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rdi), %r12	; _45->content.attr_name, callee_name
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r12, %r12	; callee_name
	je	.L144	;,
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r12), %eax	; _48->kind, tmp282
	decl	%eax	; tmp226
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	;, tmp226
	ja	.L144	;,
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rdi), %rdi	; _45->base, _51
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rdi, %rdi	; _51
	je	.L158	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 16(%rdi)	;, _51->type
	jne	.L146	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rdi), %rax	; _51->content.name, _53
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _53
	je	.L146	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	;, _53->kind
	je	.L158	;,
.L146:
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	codegen_variable_access	;
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rax, %rdi	; tmp263, _55
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	call	load_rvalue	;
	movq	%rax, %rdi	; tmp264, receiver
; temp/codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	; receiver
	je	.L158	;,
; temp/codegen.c:806:             emit_param_instruction(receiver, status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:807:             ++argument_count;
	movl	$1, %r13d	;, argument_count
; temp/codegen.c:806:             emit_param_instruction(receiver, status);
	call	emit_param_instruction	;
	jmp	.L148	;
.L144:
; temp/codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rbx, %rsi	; status,
	call	codegen_variable_access	;
; temp/codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	; callee
	jne	.L149	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC19(%rip), %rdi	;, tmp229
.L202:
	call	*fputs@GOTPCREL(%rip)	;
.L203:
; temp/codegen.c:768:             return NULL;
	xorl	%ebp, %ebp	; <retval>
	jmp	.L113	;
.L149:
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %edx	; callee_100->kind, _57
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %edx	;, _57
	jne	.L151	;,
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rax), %rax	; callee_100->value.subroutine, _58
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	; _58
	je	.L152	;,
; temp/codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r12	; _58->original_name, callee_name
; temp/codegen.c:799:         if (callee_name == NULL) {
	testq	%r12, %r12	; callee_name
	jne	.L158	;,
	jmp	.L152	;
.L151:
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%edx, %edx	; _57
	jne	.L152	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	; callee_100->value.variable, _59
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	; _59
	je	.L152	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r12	; _59->original_name, callee_name
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r12, %r12	; callee_name
	je	.L152	;,
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r12), %eax	; _60->kind, tmp283
	decl	%eax	; tmp230
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp230
	jbe	.L158	;,
.L152:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC20(%rip), %rdi	;, tmp233
	jmp	.L202	;
.L158:
; temp/codegen.c:804:         size_t argument_count = 0;
	xorl	%r13d, %r13d	; argument_count
.L148:
; temp/codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rdi	; variable_access_91(D)->content.args, variable_access_91(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp266, args
.L153:
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbp, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp269, arg_expr
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L208	;,
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rax, %rdi	; tmp267, _65
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	call	load_rvalue	;
	movq	%rax, %rdi	; tmp268, arg_value
; temp/codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	; arg_value
	jne	.L154	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC21(%rip), %rdi	;, tmp236
	jmp	.L202	;
.L154:
; temp/codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:818:             ++argument_count;
	incq	%r13	; argument_count
; temp/codegen.c:817:             emit_param_instruction(arg_value, status);
	call	emit_param_instruction	;
	jmp	.L153	;
.L208:
; temp/codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	create_arg	;
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	(%r12), %rsi	; callee_name_217->type, _67
; temp/codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	movq	%rax, %rbp	; tmp270, <retval>
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rsi, %rsi	; _67
	je	.L156	;,
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	name_void(%rip), %rsi	; name_void, _67
	je	.L156	;,
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp271, _69
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	call	create_arg	;
	movq	%rax, %rbp	; tmp272, <retval>
.L156:
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rsi	; callee_name_217->type,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r12, %rdi	; callee_name,
; temp/codegen.c:824:         long long count = (long long)argument_count;
	movq	%r13, 8(%rsp)	; argument_count, count
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	call	create_var	;
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp273, _72
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	call	create_arg	;
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	leaq	8(%rsp), %rsi	;, tmp237
	movl	$1, %edi	;,
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	%rax, %r12	; tmp274, callee_arg
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	call	create_arg	;
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	%rbp, %rsi	; <retval>,
	movq	%r12, %rdx	; callee_arg,
	movl	$22, %edi	;,
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	%rax, %rcx	; tmp275, _73
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp276, call_inst
; temp/codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rbx), %rax	; status_92(D)->current_block, status_92(D)->current_block
	movq	8(%rax), %rdi	; _74->instructions, _74->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:828:         return result;
	jmp	.L113	;
.L141:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC22(%rip), %rdx	;, tmp241
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:832:     return NULL;
	jmp	.L203	;
.L113:
; temp/codegen.c:833: }
	addq	$24, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.1
.LC24:
	.string	"[warning] Unsupported type for negation: %s\n"
.LC25:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.text
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; temp/codegen.c:655:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; temp/codegen.c:655:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L210	;,
	leaq	.L212(%rip), %rdx	;, tmp118
	movq	%rsi, %rbp	; tmp143, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp120
	addq	%rdx, %rax	; tmp118, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L212:
	.long	.L220-.L212
	.long	.L219-.L212
	.long	.L218-.L212
	.long	.L217-.L212
	.long	.L216-.L212
	.long	.L215-.L212
	.long	.L214-.L212
	.long	.L213-.L212
	.long	.L211-.L212
	.text
.L220:
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value,
	xorl	%esi, %esi	;
	movl	$10, %edx	;,
	call	*strtoll@GOTPCREL(%rip)	;
; temp/codegen.c:658:             return create_arg(ARG_INT, &t);
	leaq	8(%rsp), %rsi	;, tmp123
	movl	$1, %edi	;,
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 8(%rsp)	; tmp144, MEM[(long long int *)_90]
	jmp	.L229	;
.L219:
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value,
	xorl	%esi, %esi	;
	call	*strtod@GOTPCREL(%rip)	;
; temp/codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	leaq	8(%rsp), %rsi	;, tmp124
	movl	$2, %edi	;,
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; tmp146, MEM[(double *)_90]
.L229:
; temp/codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	;
	movq	%rax, %rbx	; tmp147, <retval>
	jmp	.L209	;
.L218:
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %rsi	; primary_36(D)->value.literal_value,
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %edi	;,
; temp/codegen.c:703: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	;
.L217:
; temp/codegen.c:666:             bool t = true;
	movb	$1, 8(%rsp)	;, MEM[(char *)_90]
	jmp	.L230	;
.L216:
; temp/codegen.c:670:             bool t = false;
	movb	$0, 8(%rsp)	;, MEM[(char *)_90]
.L230:
; temp/codegen.c:671:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp126
	movl	$4, %edi	;,
	jmp	.L229	;
.L215:
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr,
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	jmp	codegen_expression	;
.L214:
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand,
	call	codegen_primary	;
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp150, _9
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	name_bool(%rip), %rsi	; name_bool,
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %r12	; tmp151, operand
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_var	;
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp152, _11
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; operand,
	movl	$13, %edi	;,
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp153, <retval>
; temp/codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rsi	; <retval>,
	jmp	.L227	;
.L213:
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand,
	call	codegen_primary	;
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp155, _15
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rax, %r12	; tmp156, operand
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	;
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp157, _17
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:685:             long long zero_int = 0;
	xorl	%r10d, %r10d	;
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp158, <retval>
; temp/codegen.c:686:             double neg_one_float = -1.0;
	movq	.LC23(%rip), %rax	;, tmp164
; temp/codegen.c:685:             long long zero_int = 0;
	movq	%r10, (%rsp)	;, zero_int
; temp/codegen.c:686:             double neg_one_float = -1.0;
	movq	%rax, 8(%rsp)	; tmp164, MEM[(double *)_90]
; temp/codegen.c:687:             if (operand->type == name_int)
	movq	8(%r12), %rax	; operand_42->type, _18
; temp/codegen.c:687:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	jne	.L222	;,
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rsp, %rsi	;, tmp132
	movl	$1, %edi	;,
	call	create_arg	;
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbx, %rsi	; <retval>,
	movl	$1, %edi	;,
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %rdx	; tmp159, _20
	jmp	.L227	;
.L222:
; temp/codegen.c:689:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	jne	.L224	;,
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	8(%rsp), %rsi	;, tmp133
	movl	$2, %edi	;,
	call	create_arg	;
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbx, %rsi	; <retval>,
	movl	$2, %edi	;,
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %rdx	; tmp161, _22
.L227:
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp162, inst
; temp/codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:696:             return temp;
	jmp	.L209	;
.L224:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC24(%rip), %rdx	;, tmp136
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L228	;
.L211:
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.var,
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	jmp	codegen_variable_access	;
.L210:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC25(%rip), %rdx	;, tmp140
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L228:
; temp/codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	; <retval>
.L209:
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	codegen_primary, .-codegen_primary
	.section	.rodata.str1.1
.LC26:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp128, expression
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
; temp/codegen.c:627: Arg* codegen_expression(Expression* expression, TACStatus* status) {
	movq	%rsi, %rbx	; tmp129, status
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	jne	.L232	;,
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
; temp/codegen.c:653: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	jmp	codegen_primary	;
.L232:
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
; temp/codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r14d	;, _65
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	call	codegen_expression	;
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rax, %rdi	; tmp130, _4
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	call	load_rvalue	;
	movq	%rax, %r12	; tmp131, <retval>
; temp/codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r13), %eax	; expression_30(D)->operator,
	cmpl	$18, %eax	;, _5
	ja	.L233	;,
	leaq	CSWTCH.51(%rip), %rdx	;, tmp115
	movzbl	(%rdx,%rax), %r14d	; CSWTCH.51[_5], _65
.L233:
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	0(%r13), %rdi	; expression_30(D)->expr_left,
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %rbp	; tmp132, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r13), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp117
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp117
	ja	.L234	;,
; temp/codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, %r14d	;, _65
	je	.L235	;,
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; left_38->type, left_38->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp133, _9
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; left,
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp134, temp
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %rcx	; <retval>,
	movq	%r13, %rsi	; temp,
	movl	%r14d, %edi	; _65,
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %rdx	; tmp135, _10
; temp/codegen.c:639:             right = temp;
	movq	%r13, %r12	; temp, <retval>
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp136, inst
; temp/codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L235:
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rbp)	;, left_38->kind
	je	.L236	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC26(%rip), %rdi	;, tmp123
	call	*fputs@GOTPCREL(%rip)	;
.L236:
; temp/codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%ecx, %ecx	;
	movq	%rbp, %rsi	; left,
	movq	%r12, %rdx	; <retval>,
	movl	$14, %edi	;,
	call	create_instruction	;
; temp/codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%rbp)	;, left_38->is_get
; temp/codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rsi	; tmp137, inst
; temp/codegen.c:644:         if (left->is_get)
	je	.L237	;,
; temp/codegen.c:645:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rbp, %rsi	; left,
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; <retval>,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp138, inst
	jmp	.L237	;
.L234:
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; left_38->type, left_38->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp139, _17
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	;
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; left,
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp140, temp
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %rcx	; <retval>,
	movq	%r13, %rsi	; temp,
	movl	%r14d, %edi	; _65,
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %rdx	; tmp141, _18
; temp/codegen.c:649:         right = temp;
	movq	%r13, %r12	; temp, <retval>
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp142, inst
.L237:
; temp/codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:653: }
	popq	%rbx	;
	movq	%r12, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_expression, .-codegen_expression
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%r15	;
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp179, if_
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp180, status
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	subq	$40, %rsp	;,
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp181, then_label
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r12), %rdi	; if__61(D)->else_if, if__61(D)->else_if
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp182, else_label
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp183
	jne	.L244	;,
.L246:
; temp/codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %r13	; tmp184, end_label
	jmp	.L245	;
.L244:
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp185
	je	.L246	;,
; temp/codegen.c:457:         end_label = else_label;
	movq	%rbp, %r13	; else_label, end_label
.L245:
; temp/codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r13, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%r12), %rdi	; if__61(D)->condition,
	movq	%rbx, %rsi	; status,
; temp/codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, (%rsp)	; tmp186, %sfp
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	call	codegen_expression	;
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rax, %r15	; tmp187, condition
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rsi	; then_label,
	movl	$6, %edi	;,
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 8(%rsp)	; _6, %sfp
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	8(%rsp), %rcx	; %sfp, _6
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %rdx	; tmp189, _7
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp190, inst
; temp/codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:466:     Block* then_block = create_block(then_label);
	movq	%r14, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r14	; tmp191, then_block
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rsi	; then_block,
	movq	32(%rax), %rdi	; _10->blocks, _10->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:468:     status->current_block = then_block;
	movq	%r14, 16(%rbx)	; then_block, status_56(D)->current_block
; temp/codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r12), %rdi	; if__61(D)->body, if__61(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp192, then_statements
.L247:
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r14, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp193, statement
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L267	;,
; temp/codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L247	;
.L267:
; temp/codegen.c:475:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp194, jump_to_end
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r12), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp195
	jne	.L249	;,
; temp/codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r12), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp196, %sfp
.L250:
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp210, elif
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L249	;,
; temp/codegen.c:484:             Block* else_if_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp197, else_if_block
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; else_if_block,
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:486:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	; else_if_block, status_56(D)->current_block
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
	movq	%rax, 16(%rsp)	; tmp198, %sfp
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	(%r14), %rdi	; elif_90->condition,
	movq	%rbx, %rsi	; status,
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp199, else_label
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	call	codegen_expression	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	8(%rsp), %rdi	; %sfp,
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	%rax, %r15	; tmp200, condition
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp201
	je	.L252	;,
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:493:                 else_label = end_label;
	testb	%al, %al	; tmp202
	cmovne	%r13, %rbp	; else_label,, end_label, else_label
.L252:
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	16(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 24(%rsp)	; _24, %sfp
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	24(%rsp), %rcx	; %sfp, _24
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %rdx	; tmp204, _25
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp205, inst
; temp/codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _26->instructions, _26->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:497:             then_block = create_block(then_label);
	movq	16(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %r15	; tmp206, then_block
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r15, %rsi	; then_block,
	movq	32(%rax), %rdi	; _28->blocks, _28->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r14), %rdi	; elif_90->body, elif_90->body
; temp/codegen.c:499:             status->current_block = then_block;
	movq	%r15, 16(%rbx)	; then_block, status_56(D)->current_block
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp207, elif_statements
.L253:
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r14, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, elif_statement
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	je	.L268	;,
; temp/codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L253	;
.L268:
; temp/codegen.c:506:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp209, jump_to_end
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _31->instructions, _31->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L250	;
.L249:
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp211
	jne	.L256	;,
; temp/codegen.c:513:         Block* else_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp212, else_block
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; else_block,
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:515:         status->current_block = else_block;
	movq	%rbp, 16(%rbx)	; else_block, status_56(D)->current_block
; temp/codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp213, else_statements
.L257:
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp214, else_statement
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	je	.L269	;,
; temp/codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L257	;
.L269:
; temp/codegen.c:522:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	create_instruction	;
	movq	%rax, %rsi	; tmp215, jump_to_end
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _38->instructions, _38->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L256:
; temp/codegen.c:526:     Block* end_block = create_block(end_label);
	movq	%r13, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp216, end_block
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _40->blocks, _40->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:528:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_56(D)->current_block
; temp/codegen.c:529: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	codegen_if, .-codegen_if
	.section	.rodata.str1.1
.LC27:
	.string	"[warning] 'break' statement used outside of loop\n"
.LC28:
	.string	"[warning] 'continue' statement used outside of loop\n"
.LC29:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
; temp/codegen.c:412:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_27(D)->type,
; temp/codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L271	;,
	leaq	.L273(%rip), %rdx	;, tmp115
; temp/codegen.c:411: void codegen_statement(Statement* statement, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp139, status
; temp/codegen.c:412:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp117
	addq	%rdx, %rax	; tmp115, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
	.align 4
.L273:
	.long	.L280-.L273
	.long	.L279-.L273
	.long	.L278-.L273
	.long	.L277-.L273
	.long	.L276-.L273
	.long	.L275-.L273
	.long	.L274-.L273
	.long	.L272-.L273
	.text
.L280:
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.expr,
; temp/codegen.c:450: }
	popq	%rbx	;
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	codegen_expression	;
.L279:
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.var,
	movl	$118, %edx	;,
; temp/codegen.c:450: }
	popq	%rbx	;
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	codegen_variable	;
.L278:
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.if_stmt,
; temp/codegen.c:450: }
	popq	%rbx	;
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	codegen_if	;
.L277:
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.while_stmt,
; temp/codegen.c:450: }
	popq	%rbx	;
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	codegen_while	;
.L276:
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.for_stmt,
; temp/codegen.c:450: }
	popq	%rbx	;
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	codegen_for	;
.L275:
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rdi), %rdi	; statement_27(D)->stmt.return_expr,
	call	codegen_expression	;
; temp/codegen.c:420:             Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$21, %edi	;,
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	%rax, %rsi	; tmp140, return_value
	jmp	.L292	;
.L274:
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp142
	jne	.L281	;,
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbx), %rax	; status_28(D)->end_labels, status_28(D)->end_labels
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _12->tail, _12->tail
	movq	8(%rax), %rsi	; _13->content, label
; temp/codegen.c:427:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L281	;,
.L294:
; temp/codegen.c:428:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
.L292:
	call	create_instruction	;
	movq	%rax, %rsi	; tmp143, inst
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
; temp/codegen.c:450: }
	popq	%rbx	;
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rdi	;, _14->instructions
	jmp	*list_append@GOTPCREL(%rip)	;
.L281:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC27(%rip), %rdi	;, tmp128
	jmp	.L293	;
.L272:
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp144
	jne	.L282	;,
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rbx), %rax	; status_28(D)->start_labels, status_28(D)->start_labels
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _19->tail, _19->tail
	movq	8(%rax), %rsi	; _20->content, label
; temp/codegen.c:438:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	jne	.L294	;,
.L282:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC28(%rip), %rdi	;, tmp135
.L293:
; temp/codegen.c:450: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L271:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC29(%rip), %rdx	;, tmp137
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	codegen_statement, .-codegen_statement
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp171, for_
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp172, status
	subq	$24, %rsp	;,
; temp/codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rdi), %rdi	; for__53(D)->initializer, _1
; temp/codegen.c:532:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L296	;,
; temp/codegen.c:533:         codegen_variable(for_->initializer, status, VAR_VAR);
	movl	$118, %edx	;,
	call	codegen_variable	;
.L296:
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
	movq	%rax, %r13	; tmp173, condition_label
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp174, body_label
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rbp)	;, for__53(D)->condition
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 8(%rsp)	; tmp175, %sfp
; temp/codegen.c:538:     if (for_->condition != NULL) {
	je	.L297	;,
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp176, _3
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp177, inst
; temp/codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:542:         Block* condition_block = create_block(condition_label);
	movq	%r13, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r14	; tmp178, condition_block
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%r14, %rsi	; condition_block,
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:544:         status->current_block = condition_block;
	movq	%r14, 16(%rbx)	; condition_block, status_54(D)->current_block
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%rbp), %rdi	; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	%rax, %r14	; tmp179, condition
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r15	; tmp180, _9
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rcx	; _9,
	movq	%r14, %rsi	; condition,
	movl	$19, %edi	;,
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	; tmp181, _10
	jmp	.L310	;
.L297:
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rsi	; tmp183, _13
.L310:
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp184, inst
; temp/codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	;, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:555:     Block* body_block = create_block(body_label);
	movq	%r12, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp185, body_block
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%r14, %rsi	; body_block,
	movq	32(%rax), %rdi	; _16->blocks, _16->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:557:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_54(D)->current_block
; temp/codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; temp/codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%rbp)	;, for__53(D)->increment
; temp/codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp186, increment_label
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rsi	; increment_label,
; temp/codegen.c:560:     if (for_->increment != NULL)
	jne	.L311	;,
; temp/codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rbp)	;, for__53(D)->condition
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%r13, %rsi	; condition_label,
; temp/codegen.c:562:     else if (for_->condition != NULL)
	jne	.L311	;,
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r12, %rsi	; body_label,
.L311:
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rsi	; tmp189, _24
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rsi	; tmp190, _26
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rbp), %rdi	; for__53(D)->body, for__53(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp191, body_statements
.L302:
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r15, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp192, statement
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L312	;,
; temp/codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L302	;
.L312:
; temp/codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rbp)	;, for__53(D)->increment
	je	.L304	;,
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rsi	; tmp193, _32
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp194, inst
; temp/codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:577:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rdi	; increment_label,
	call	create_block	;
	movq	%rax, %r14	; tmp195, increment_block
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%r14, %rsi	; increment_block,
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:579:         status->current_block = increment_block;
	movq	%r14, 16(%rbx)	; increment_block, status_54(D)->current_block
; temp/codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%rbp), %rdi	; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
.L304:
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp196, _38
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
; temp/codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%rbp)	;, for__53(D)->condition
	jne	.L305	;,
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rsi	; tmp198, _40
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	;
.L305:
; temp/codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rdx	; status_54(D)->current_block, status_54(D)->current_block
	movq	%rax, %rsi	; inst,
	movq	8(%rdx), %rdi	; _41->instructions, _41->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:588:     Block* end_block = create_block(end_label);
	movq	8(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %rbp	; tmp200, end_block
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _43->blocks, _43->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:590:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_54(D)->current_block
; temp/codegen.c:591: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	codegen_for, .-codegen_for
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
	movq	%rdi, %r13	; tmp137, while_
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp138, status
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	subq	$24, %rsp	;,
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %edi	;,
	movq	%rax, %rsi	; condition_label,
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp139, condition_label
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	;
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp140, _1
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp141, inst
; temp/codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:597:     Block* condition_block = create_block(condition_label);
	movq	%rbp, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r12	; tmp142, condition_block
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%r12, %rsi	; condition_block,
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:599:     status->current_block = condition_block;
	movq	%r12, 16(%rbx)	; condition_block, status_27(D)->current_block
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
	movq	%rax, %r14	; tmp143, body_label
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	0(%r13), %rdi	; while__42(D)->condition,
	movq	%rbx, %rsi	; status,
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp144, end_label
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	call	codegen_expression	;
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	%rax, %r15	; tmp145, condition
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; body_label,
	movl	$6, %edi	;,
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 8(%rsp)	; _7, %sfp
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rcx	; %sfp, _7
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	; tmp147, _8
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp148, inst
; temp/codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:607:     Block* body_block = create_block(body_label);
	movq	%r14, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp149, body_block
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%r14, %rsi	; body_block,
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:609:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_27(D)->current_block
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rsi	; tmp150, _13
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rsi	; tmp151, _15
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r13), %rdi	; while__42(D)->body, while__42(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp152, body_statements
.L314:
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r13, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp153, statement
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L317	;,
; temp/codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L314	;
.L317:
; temp/codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp154, _20
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp155, inst
; temp/codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:623:     Block* end_block = create_block(end_label);
	movq	%r12, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp156, end_block
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _23->blocks, _23->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:625:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_27(D)->current_block
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
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp110, function
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, status
	pushq	%rcx	;
; temp/codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rdi), %rsi	; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rdi), %rdi	; function_16(D)->name,
	call	create_subroutine	;
; temp/codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %r12	; tmp112, subroutine
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	%r12, %rsi	; subroutine,
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp113, parameters
.L319:
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L324	;,
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	(%rax), %rsi	; parameter_25->type,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_18->parameters, subroutine_18->parameters
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp114, _8
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L319	;
.L324:
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %rdi	; tmp116, _10
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_18->blocks, subroutine_18->blocks
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	; tmp117, block
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rbp), %rdi	; function_16(D)->body, function_16(D)->body
; temp/codegen.c:332:     status->current_block = block;
	movq	%r13, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp118, statements
.L321:
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp119, statement
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L325	;,
; temp/codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L321	;
.L325:
; temp/codegen.c:339:     status->current_subroutine = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:340: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	codegen_function, .-codegen_function
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp110, method
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, status
	pushq	%rcx	;
; temp/codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rdi), %rsi	; method_16(D)->return_type, method_16(D)->return_type
	movq	(%rdi), %rdi	; method_16(D)->name,
	call	create_subroutine	;
; temp/codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %r12	; tmp112, subroutine
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	%r12, %rsi	; subroutine,
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rdi	; method_16(D)->parameters, method_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp113, parameters
.L327:
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L332	;,
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	(%rax), %rsi	; parameter_25->type,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_18->parameters, subroutine_18->parameters
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp114, _8
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L327	;
.L332:
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %rdi	; tmp116, _10
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_18->blocks, subroutine_18->blocks
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	; tmp117, block
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rbp), %rdi	; method_16(D)->body, method_16(D)->body
; temp/codegen.c:354:     status->current_block = block;
	movq	%r13, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp118, statements
.L329:
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp119, statement
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L333	;,
; temp/codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
	jmp	.L329	;
.L333:
; temp/codegen.c:361:     status->current_subroutine = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:362: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.1
.LC30:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp103, class
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp104, status
	pushq	%rbx	;
; temp/codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_13(D)->members, class_13(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; temp/codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%r13), %r14	; class_13(D)->name, _2
; temp/codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %r12	; tmp105, members
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp106, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:16:     table->name = name;
	movq	%r14, 8(%rbx)	; _2, table_26->name
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rbx, %rsi	; table,
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%rbx)	; tmp107, table_26->attributes
; temp/codegen.c:368:     attr_table->size = class->size;
	movq	24(%r13), %rax	; class_13(D)->size, class_13(D)->size
	movq	%rax, 16(%rbx)	; class_13(D)->size, table_26->size
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_19(D)->tac, status_19(D)->tac
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC30(%rip), %rbx	;, tmp102
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rdi	; _4->attribute_tables,
	call	*list_append@GOTPCREL(%rip)	;
.L335:
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L343	;,
; temp/codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ecx	; member_22->type, _6
; temp/codegen.c:371:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L336	;,
	cmpl	$1, %ecx	;, _6
	jne	.L344	;,
; temp/codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_22->content.variable,
	movl	$97, %edx	;,
	movq	%rbp, %rsi	; status,
	call	codegen_variable	;
; temp/codegen.c:377:                 break;
	jmp	.L335	;
.L336:
; temp/codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rdi	; member_22->content.method,
	movq	%rbp, %rsi	; status,
	call	codegen_method	;
; temp/codegen.c:374:                 break;
	jmp	.L335	;
.L344:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbx, %rdx	; tmp102,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L335	;
.L343:
; temp/codegen.c:383: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC31:
	.string	"main"
	.text
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC31(%rip), %r14	;, tmp108
; temp/codegen.c:291: TAC* codegen_code(Code* code) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp109, code
; temp/codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
; temp/codegen.c:291: TAC* codegen_code(Code* code) {
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp110, <retval>
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	movq	%rax, 0(%rbp)	; tmp111, tac_29->attribute_tables
; temp/codegen.c:78:     tac->entry_point = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbp)	;, tac_29->entry_point
; temp/codegen.c:79:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:79:     tac->global_vars = create_list();
	movq	%rax, 16(%rbp)	; tmp112, tac_29->global_vars
; temp/codegen.c:80:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %edi	;,
; temp/codegen.c:80:     tac->subroutines = create_list();
	movq	%rax, 24(%rbp)	; tmp113, tac_29->subroutines
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:87:     status->current_block = NULL;
	xorl	%edx, %edx	;
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rbx	; tmp114, status
; temp/codegen.c:87:     status->current_block = NULL;
	movq	%rdx, 8(%rax)	;, status_26->current_subroutine
	movq	%rdx, 16(%rax)	;, status_26->current_block
; temp/codegen.c:85:     status->tac = tac;
	movq	%rbp, (%rax)	; <retval>, status_26->tac
; temp/codegen.c:88:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:88:     status->end_labels = create_list();
	movq	%rax, 24(%rbx)	; tmp115, status_26->end_labels
; temp/codegen.c:89:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:93:     status->temp_count = 0;
	xorl	%ecx, %ecx	;
; temp/codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	(%r12), %rdi	; code_17(D)->members,
; temp/codegen.c:89:     status->start_labels = create_list();
	movq	%rax, 32(%rbx)	; tmp116, status_26->start_labels
; temp/codegen.c:93:     status->temp_count = 0;
	movq	%rcx, 40(%rbx)	;, status_26->attr_count
	movq	%rcx, 48(%rbx)	;, status_26->param_count
	movq	%rcx, 56(%rbx)	;, status_26->var_count
; temp/codegen.c:95:     status->subroutine_count = 0;
	movq	%rcx, 64(%rbx)	;, status_26->temp_count
	movq	%rcx, 72(%rbx)	;, status_26->block_count
	movq	%rcx, 80(%rbx)	;, status_26->subroutine_count
; temp/codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp117, members
.L346:
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r13, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp119, code_member
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L354	;,
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%r12), %eax	; code_member_21->type, _2
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	jne	.L347	;,
; temp/codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	(%r12), %rdi	; code_member_21->content.function,
	movq	%rbx, %rsi	; status,
	call	codegen_function	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%r12), %rax	; code_member_21->content.function, code_member_21->content.function
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r14, %rsi	; tmp108,
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %r12	; _4->name, _5
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%r12), %rdi	; _5->name, _5->name
	call	*strcmp@GOTPCREL(%rip)	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp118
	jne	.L346	;,
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%r12, 8(%rbp)	; _5, tac_29->entry_point
	jmp	.L346	;
.L347:
; temp/codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	jne	.L350	;,
; temp/codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%r12), %rdi	; code_member_21->content.class,
	movq	%rbx, %rsi	; status,
	call	codegen_class	;
	jmp	.L346	;
.L350:
; temp/codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L346	;,
; temp/codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%r12), %rdi	; code_member_21->content.import,
	movq	%rbx, %rdx	; status,
	movq	%rbp, %rsi	; <retval>,
	call	codegen_import	;
	jmp	.L346	;
.L354:
; temp/codegen.c:308: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_code, .-codegen_code
	.section	.rodata
	.align 16
	.type	CSWTCH.51, @object
	.size	CSWTCH.51, 19
CSWTCH.51:
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
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC23:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
