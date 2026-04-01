	.file	"codegen.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	find_var_by_symbol, @function
find_var_by_symbol:
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rdi, %rdi	; vars
	je	.L5	;,
	testq	%rsi, %rsi	; symbol
	je	.L5	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rdi), %rax	; vars_7(D)->head, <retval>
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L4	;,
	ret	
.L3:
; temp/codegen.c:205:         current = current->next;
	movq	(%rax), %rax	; current_14->next, <retval>
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L8	;,
.L4:
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rdx	; current_14->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rdx, %rdx	; var
	je	.L3	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	%rsi, (%rdx)	; symbol, var_11->original_name
	jne	.L3	;,
; temp/codegen.c:204:             return var;
	movq	%rdx, %rax	; var, <retval>
.L1:
; temp/codegen.c:208: }
	ret	
.L8:
	ret	
.L5:
; temp/codegen.c:199:         return NULL;
	movl	$0, %eax	;, <retval>
	ret	
	.size	find_var_by_symbol, .-find_var_by_symbol
	.type	create_instruction, @function
create_instruction:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %r13d	; tmp88, type
	movq	%rsi, %r12	; tmp89, arg1
	movq	%rdx, %rbp	; tmp90, arg2
	movq	%rcx, %rbx	; tmp91, arg3
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
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
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_instruction, .-create_instruction
	.type	create_subroutine, @function
create_subroutine:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r12	; tmp89, name
	movq	%rsi, %rbp	; tmp90, return_type
; temp/codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
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
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, label
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
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
	addq	$8, %rsp	;,
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r13	; tmp112, original_name
	movq	%rsi, %r12	; tmp113, type
	movl	%edx, %ebp	; tmp114, kind
	movq	%rcx, %r14	; tmp115, status
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp116, <retval>
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r13, (%rax)	; original_name, var_19->original_name
; temp/codegen.c:117:     switch (kind) {
	leal	-97(%rbp), %eax	;, tmp95
	cmpl	$21, %eax	;, tmp95
	ja	.L26	;,
	movl	%eax, %eax	; tmp95, tmp96
	leaq	.L18(%rip), %rdx	;, tmp97
	movslq	(%rdx,%rax,4), %rax	;, tmp99
	addq	%rdx, %rax	; tmp97, tmp100
	jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
	.align 4
.L18:
	.long	.L23-.L18
	.long	.L22-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L21-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L20-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L26-.L18
	.long	.L19-.L18
	.long	.L26-.L18
	.long	.L17-.L18
	.text
.L23:
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%r14), %r13	; status_23(D)->attr_count, id
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r13), %rax	;, tmp102
	movq	%rax, 40(%r14)	; tmp102, status_23(D)->attr_count
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L16	;
.L20:
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%r14), %r13	; status_23(D)->param_count, id
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r13), %rax	;, tmp103
	movq	%rax, 48(%r14)	; tmp103, status_23(D)->param_count
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L16	;
.L17:
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%r14), %r13	; status_23(D)->var_count, id
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r13), %rax	;, tmp104
	movq	%rax, 56(%r14)	; tmp104, status_23(D)->var_count
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L16	;
.L19:
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%r14), %r13	; status_23(D)->temp_count, id
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r13), %rax	;, tmp105
	movq	%rax, 64(%r14)	; tmp105, status_23(D)->temp_count
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L16	;
.L22:
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%r14), %r13	; status_23(D)->block_count, id
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r13), %rax	;, tmp106
	movq	%rax, 72(%r14)	; tmp106, status_23(D)->block_count
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L16	;
.L21:
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%r14), %r13	; status_23(D)->subroutine_count, id
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r13), %rax	;, tmp107
	movq	%rax, 80(%r14)	; tmp107, status_23(D)->subroutine_count
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L16	;
.L26:
; temp/codegen.c:117:     switch (kind) {
	movq	$-1, %r13	;, id
.L16:
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp108
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp117, _13
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _13, var_19->name
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, id
	je	.L28	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; id,
	movl	%ebp, %r8d	; kind,
	leaq	.LC2(%rip), %rcx	;, tmp110
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L25:
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
.L28:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%ebp, %r8d	; kind,
	leaq	.LC1(%rip), %rcx	;, tmp109
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L25	;
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
; temp/codegen.c:21:     if (type == NULL)
	testq	%rdi, %rdi	; type
	je	.L32	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_int(%rip)	; type, name_int
	je	.L33	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_float(%rip)	; type, name_float
	je	.L34	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_string(%rip)	; type, name_string
	je	.L35	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rdi, name_bool(%rip)	; type, name_bool
	je	.L36	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rdi, name_void(%rip)	; type, name_void
	je	.L37	;,
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rdi)	;, type_12(D)->kind
	jne	.L31	;,
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rdi), %rax	; type_12(D)->ast_node.class, type_12(D)->ast_node.class
	movq	24(%rax), %rax	; _7->size, <retval>
	ret	
.L31:
; temp/codegen.c:20: static size_t get_type_size(Symbol* type) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdi), %rcx	; type_12(D)->name, type_12(D)->name
	leaq	.LC3(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:30:     return 8;
	movl	$8, %eax	;, <retval>
; temp/codegen.c:31: }
	addq	$8, %rsp	;,
	ret	
.L32:
; temp/codegen.c:22:         return 0;
	movl	$0, %eax	;, <retval>
	ret	
.L33:
; temp/codegen.c:24:         return 8;
	movl	$8, %eax	;, <retval>
	ret	
.L34:
	movl	$8, %eax	;, <retval>
	ret	
.L35:
	movl	$8, %eax	;, <retval>
	ret	
.L36:
; temp/codegen.c:26:         return 1;
	movl	$1, %eax	;, <retval>
	ret	
.L37:
	movl	$1, %eax	;, <retval>
; temp/codegen.c:31: }
	ret	
	.size	get_type_size, .-get_type_size
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebp	; tmp110, kind
	movq	%rsi, %r12	; tmp111, value
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp112, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	%ebp, 16(%rax)	; kind, arg_15->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_15->type
; temp/codegen.c:146:     switch (kind) {
	cmpl	$7, %ebp	;, kind
	ja	.L42	;,
	movl	%ebp, %ebp	; kind, kind
	leaq	.L44(%rip), %rdx	;, tmp97
	movslq	(%rdx,%rbp,4), %rax	;, tmp99
	addq	%rdx, %rax	; tmp97, tmp100
	jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
	.align 4
.L44:
	.long	.L51-.L44
	.long	.L50-.L44
	.long	.L49-.L44
	.long	.L48-.L44
	.long	.L47-.L44
	.long	.L46-.L44
	.long	.L45-.L44
	.long	.L43-.L44
	.text
.L51:
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.variable
; temp/codegen.c:149:             arg->type = arg->value.variable->type;
	movq	16(%r12), %rax	; MEM[(struct Var *)value_19(D)].type, _1
; temp/codegen.c:149:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	; _1, arg_15->type
.L52:
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;, arg_15->is_get
; temp/codegen.c:185: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L50:
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	(%r12), %rax	; MEM[(long long int *)value_19(D)], _2
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	; _2, arg_15->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
	movq	%rax, 8(%rbx)	; name_int, arg_15->type
; temp/codegen.c:154:             break;
	jmp	.L52	;
.L49:
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	(%r12), %xmm0	; MEM[(double *)value_19(D)], _4
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	; _4, arg_15->value.float_value
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%rbx)	; name_float, arg_15->type
; temp/codegen.c:158:             break;
	jmp	.L52	;
.L48:
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movq	%r12, (%rbx)	; value, arg_15->value.string_value
; temp/codegen.c:161:             arg->type = name_string;
	movq	name_string(%rip), %rax	; name_string, name_string
	movq	%rax, 8(%rbx)	; name_string, arg_15->type
; temp/codegen.c:162:             break;
	jmp	.L52	;
.L47:
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movzbl	(%r12), %eax	; MEM[(char *)value_19(D)], _7
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	%al, (%rbx)	; _7, arg_15->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
	movq	%rax, 8(%rbx)	; name_bool, arg_15->type
; temp/codegen.c:166:             break;
	jmp	.L52	;
.L46:
; temp/codegen.c:168:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	;, arg_15->value.string_value
; temp/codegen.c:169:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void
	movq	%rax, 8(%rbx)	; name_void, arg_15->type
; temp/codegen.c:170:             break;
	jmp	.L52	;
.L45:
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.label
; temp/codegen.c:173:             break;
	jmp	.L52	;
.L43:
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.subroutine
; temp/codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	16(%r12), %rax	; MEM[(struct Var *)value_19(D)].type, _10
; temp/codegen.c:176:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	; _10, arg_15->type
; temp/codegen.c:177:             break;
	jmp	.L52	;
.L42:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; kind,
	leaq	.LC4(%rip), %rdx	;, tmp108
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L52	;
	.size	create_arg, .-create_arg
	.type	emit_param_instruction, @function
emit_param_instruction:
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rdi, %rdi	; value
	je	.L57	;,
; temp/codegen.c:283: static void emit_param_instruction(Arg* value, TACStatus* status) {
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %rbx	; tmp102, value
	movq	%rsi, %rbp	; tmp103, status
; temp/codegen.c:284:     if (value == NULL || status == NULL)
	testq	%rsi, %rsi	; status
	je	.L54	;,
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rdi), %rdi	; value_11(D)->type, value_11(D)->type
	call	get_type_size	;
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	%rax, 8(%rsp)	; tmp104, size
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	leaq	8(%rsp), %rsi	;, tmp99
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp105, _7
; temp/codegen.c:287:     Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), value, NULL);
	movl	$0, %ecx	;,
	movq	%rbx, %rdx	; value,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp106, inst
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
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
	movq	%rdi, %rbx	; tmp96, arg
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rdi, %rdi	; arg
	je	.L61	;,
	movq	%rsi, %rbp	; tmp97, status
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_9(D)->is_get
	jne	.L63	;,
.L61:
; temp/codegen.c:195: }
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L63:
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_9(D)->type, arg_9(D)->type
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp98, _3
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %r12	; tmp99, temp
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %ecx	;,
	movq	%rbx, %rdx	; arg,
	movq	%rax, %rsi	; temp,
	movl	$23, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp100, _4
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rdi	; _5->instructions, _5->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:192:         return temp;
	movq	%r12, %rbx	; temp, arg
	jmp	.L61	;
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC5:
	.string	"<unknown>"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"[warning] Invalid attribute access\n"
	.align 8
.LC7:
	.string	"[warning] Attribute '%s' not found in class '%s', fallback index %zu\n"
	.section	.rodata.str1.1
.LC8:
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
	subq	$8, %rsp	;,
; temp/codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rdi, %rdi	; object
	je	.L83	;,
	movq	%rsi, %rbx	; tmp146, attr_name
	movq	%rdx, %r13	; tmp147, status
	testq	%rsi, %rsi	; attr_name
	je	.L83	;,
; temp/codegen.c:269:     Arg* object_value = load_rvalue(object, status);
	movq	%rdx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r14	; tmp148, object_value
; temp/codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	; object_value
	je	.L82	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rax), %rbp	; object_value_20->type, class_type
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rbp, %rbp	; class_type
	je	.L68	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rbp)	;, _5->kind
	je	.L68	;,
; temp/codegen.c:272:     Symbol* class_type = NULL;
	movl	$0, %ebp	;, class_type
.L68:
; temp/codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	0(%r13), %rax	; status_18(D)->tac, status_18(D)->tac
	movq	(%rax), %rdi	; _52->attribute_tables, _52->attribute_tables
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp149, attribute_tables
.L69:
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%r12, %rdi	; attribute_tables,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	; current
	je	.L80	;,
; temp/codegen.c:9:         if (current->name == name)
	cmpq	8(%rax), %rbp	; current_55->name, class_type
	jne	.L69	;,
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rdi	; current_55->attributes, _33
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _33
	je	.L80	;,
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp152, attrs
; temp/codegen.c:243:     size_t index = 0;
	movl	$0, %r12d	;, index
.L73:
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%r15, %rdi	; attrs,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	; attr
	je	.L87	;,
; temp/codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbx	; attr_37->var_name, attr_name
	je	.L74	;,
; temp/codegen.c:252:         ++index;
	addq	$1, %r12	;, index
	jmp	.L73	;
.L83:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp124
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:267:         return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L64	;
.L80:
; temp/codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rbx), %rsi	; attr_name_16(D)->type, attr_name_16(D)->type
	movq	%r13, %rcx	; status,
	movl	$97, %edx	;,
	movq	%rbx, %rdi	; attr_name,
	call	create_var	;
	movq	%rax, %r15	; tmp151, var
	jmp	.L72	;
.L82:
; temp/codegen.c:271:         return NULL;
	movq	%rax, %rbx	; object_value, <retval>
	jmp	.L64	;
.L74:
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp158, var
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	; attr_name, var_32->original_name
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	; attr_name_16(D)->type, _75
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	%rax, 16(%r15)	; _75, var_32->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp137
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; tmp159, var_32->name
	jmp	.L77	;
.L87:
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp160, var
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	; attr_name, var_86->original_name
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	; attr_name_16(D)->type, _88
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	%rax, 16(%r15)	; _88, var_86->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp138
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; tmp161, var_86->name
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC5(%rip), %r8	;, iftmp.44_45
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rbp, %rbp	; class_type
	je	.L79	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbp), %r8	; class_type_12->name, iftmp.44_45
.L79:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbx), %rcx	; attr_name_16(D)->name, attr_name_16(D)->name
	movq	%r12, %r9	; index,
	leaq	.LC7(%rip), %rdx	;, tmp130
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L77:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	8(%r15), %rdi	; var_95->name, var_95->name
	movq	%r12, %r8	; index,
	leaq	.LC8(%rip), %rcx	;, tmp132
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L72:
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rbx), %rsi	; attr_name_16(D)->type, attr_name_16(D)->type
	movq	%r13, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp154, _8
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp155, <retval>
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%r15, %rsi	; var,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	; tmp156, _9
; temp/codegen.c:277:     Instruction* inst = create_instruction(INST_GET_ATTR, result, object_value, create_arg(ARG_VARIABLE, attr_var));
	movq	%r14, %rdx	; object_value,
	movq	%rbx, %rsi	; <retval>,
	movl	$15, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp157, inst
; temp/codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%r13), %rax	; status_18(D)->current_block, status_18(D)->current_block
	movq	8(%rax), %rdi	; _10->instructions, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rbx)	;, result_25->is_get
.L64:
; temp/codegen.c:281: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	emit_attribute_access, .-emit_attribute_access
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	codegen_import
	.type	codegen_import, @function
codegen_import:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp107, tac
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbp	; import_15(D)->name, _1
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbp), %ecx	; _1->kind, _2
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L94	;,
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp100
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp100
	jbe	.L95	;,
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L92	;,
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp111, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%r12)	; tmp112, table_25->attributes
; temp/codegen.c:16:     table->name = name;
	movq	%rbp, 8(%r12)	; _1, table_25->name
; temp/codegen.c:17:     table->size = 0;
	movq	$0, 16(%r12)	;, table_25->size
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rbx), %rdi	; tac_17(D)->attribute_tables, tac_17(D)->attribute_tables
	movq	%r12, %rsi	; table,
	call	*list_append@GOTPCREL(%rip)	;
.L88:
; temp/codegen.c:318: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L94:
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	0(%rbp), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var	;
	movq	%rax, %rsi	; tmp109, _4
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rbx), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L88	;
.L95:
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var	;
	movq	%rax, %rsi	; tmp110, _8
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbx), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L88	;
.L92:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC9(%rip), %rdx	;, tmp105
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:318: }
	jmp	.L88	;
	.size	codegen_import, .-codegen_import
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC11:
	.string	"[warning] Unsupported variable type for codegen_variable: %d\n"
	.text
	.globl	codegen_variable
	.type	codegen_variable, @function
codegen_variable:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp136, variable
	movq	%rsi, %r12	; tmp137, status
	movl	%edx, %ebp	; tmp138, type
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rsi	; variable_20(D)->type, variable_20(D)->type
	movq	8(%rdi), %rdi	; variable_20(D)->name, variable_20(D)->name
	movq	%r12, %rcx	; status,
	call	create_var	;
	movq	%rax, %rsi	; tmp139, var
; temp/codegen.c:386:     switch (type) {
	leal	-97(%rbp), %eax	;, tmp113
	cmpl	$21, %eax	;, tmp113
	ja	.L97	;,
	movl	%eax, %eax	; tmp113, tmp114
	leaq	.L99(%rip), %rdx	;, tmp115
	movslq	(%rdx,%rax,4), %rax	;, tmp117
	addq	%rdx, %rax	; tmp115, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
	.align 4
.L99:
	.long	.L103-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L102-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L101-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L97-.L99
	.long	.L100-.L99
	.long	.L97-.L99
	.long	.L98-.L99
	.text
.L101:
; temp/codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%r12), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	16(%rax), %rdi	; _3->parameters, _3->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L96:
; temp/codegen.c:410: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L98:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%r12), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	24(%rax), %rdi	; _5->local_vars, _5->local_vars
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:392:             break;
	jmp	.L96	;
.L100:
; temp/codegen.c:394:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%r12), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	24(%rax), %rdi	; _7->local_vars, _7->local_vars
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:395:             break;
	jmp	.L96	;
.L102:
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%r12), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	16(%rax), %rdi	; _9->global_vars, _9->global_vars
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:398:             break;
	jmp	.L96	;
.L103:
; temp/codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%r12), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	(%rax), %rdi	; _11->attribute_tables, _11->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp140, attr_table
; temp/codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%r12), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	(%rax), %rdi	; _13->attribute_tables, _13->attribute_tables
	movq	%rbp, %rsi	; attr_table,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movq	(%rbx), %r12	; variable_20(D)->type, _15
	movq	8(%rbx), %r13	; variable_20(D)->name, _16
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp141, attr
; temp/codegen.c:34:     attr->var_name = var_name;
	movq	%r13, (%rax)	; _16, attr_34->var_name
; temp/codegen.c:35:     attr->type = type;
	movq	%r12, 8(%rax)	; _15, attr_34->type
; temp/codegen.c:36:     attr->offset = offset;
	movq	$0, 16(%rax)	;, attr_34->offset
; temp/codegen.c:38:         attr->offset = table->size;
	movq	16(%rbp), %rax	; attr_table_30->size, _35
; temp/codegen.c:38:         attr->offset = table->size;
	movq	%rax, 16(%rbx)	; _35, attr_34->offset
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	%r12, %rdi	; _15,
	call	get_type_size	;
; temp/codegen.c:39:         table->size += get_type_size(type);
	addq	%rax, 16(%rbp)	; tmp142, attr_table_30->size
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	0(%rbp), %rdi	; attr_table_30->attributes, _39
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _39
	je	.L107	;,
; temp/codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rbx, %rsi	; attr,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L96	;
.L107:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rdi	;, tmp133
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L96	;
.L97:
	movl	%ebp, %ecx	; type,
	leaq	.LC11(%rip), %rdx	;, tmp135
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:410: }
	jmp	.L96	;
	.size	codegen_variable, .-codegen_variable
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"[warning] Invalid variable access input\n"
	.align 8
.LC13:
	.string	"[warning] Variable access name is NULL\n"
	.align 8
.LC14:
	.string	"[warning] Unresolved variable access for '%s', creating fallback local\n"
	.align 8
.LC15:
	.string	"[warning] Invalid get-attribute access\n"
	.align 8
.LC16:
	.string	"[warning] Failed to generate object for get-attribute access\n"
	.align 8
.LC17:
	.string	"[warning] Invalid get-sequence access\n"
	.align 8
.LC18:
	.string	"[warning] Failed to generate sequence/index for get-sequence access\n"
	.align 8
.LC19:
	.string	"[warning] Invalid function call without callee\n"
	.align 8
.LC20:
	.string	"[warning] Failed to generate callee for function call\n"
	.align 8
.LC21:
	.string	"[warning] Unsupported callee in function call\n"
	.align 8
.LC22:
	.string	"[warning] Failed to generate function call argument\n"
	.align 8
.LC23:
	.string	"[warning] Unsupported variable access type for codegen_variable_access: %d\n"
	.text
	.globl	codegen_variable_access
	.type	codegen_variable_access, @function
codegen_variable_access:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; temp/codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rdi, %rdi	; variable_access
	je	.L150	;,
	movq	%rdi, %r12	; tmp240, variable_access
	movq	%rsi, %rbp	; tmp241, status
	testq	%rsi, %rsi	; status
	je	.L150	;,
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rdi), %ecx	; variable_access_89(D)->type, _5
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%ecx, %ecx	; _5
	jne	.L112	;,
; temp/codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rdi), %rbx	; variable_access_89(D)->content.name, <retval>
; temp/codegen.c:712:         if (name == NULL) {
	testq	%rbx, %rbx	; <retval>
	je	.L154	;,
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rsi), %r12	; status_90(D)->current_subroutine, _176
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%r12, %r12	; _176
	je	.L114	;,
; temp/codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%r12), %rdi	; _176->parameters, _176->parameters
	movq	%rbx, %rsi	; <retval>,
	call	find_var_by_symbol	;
; temp/codegen.c:215:         if (var != NULL)
	testq	%rax, %rax	; var
	je	.L155	;,
.L148:
; temp/codegen.c:718:             return create_arg(ARG_VARIABLE, existing);
	movq	%rax, %rsi	; var,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp245, <retval>
	jmp	.L108	;
.L150:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$40, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp185
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:708:         return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L108	;
.L154:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rdi	;, tmp187
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:714:             return NULL;
	jmp	.L108	;
.L155:
; temp/codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%r12), %rdi	; _176->local_vars, _176->local_vars
	movq	%rbx, %rsi	; <retval>,
	call	find_var_by_symbol	;
; temp/codegen.c:218:         if (var != NULL)
	testq	%rax, %rax	; var
	jne	.L148	;,
.L114:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	0(%rbp), %rax	; status_90(D)->tac, status_90(D)->tac
	movq	16(%rax), %rdi	; _181->global_vars, _181->global_vars
	movq	%rbx, %rsi	; <retval>,
	call	find_var_by_symbol	;
; temp/codegen.c:717:         if (existing != NULL)
	testq	%rax, %rax	; var
	jne	.L148	;,
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%rbx)	;, name_145->kind
	jbe	.L156	;,
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%r12, %r12	; _176
	je	.L118	;,
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	16(%r12), %rax	; _176->parameters, _176->parameters
	movq	(%rax), %r12	; _186->head, current
; temp/codegen.c:228:     while (current != NULL) {
	testq	%r12, %r12	; current
	jne	.L121	;,
	jmp	.L118	;
.L156:
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %rsi	; name_145->type, name_145->type
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbx, %rdi	; <retval>,
	call	create_var	;
	movq	%rax, %rsi	; tmp246, _9
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp247, <retval>
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	.L108	;
.L119:
; temp/codegen.c:232:         current = current->next;
	movq	(%r12), %r12	; current_175->next, current
; temp/codegen.c:228:     while (current != NULL) {
	testq	%r12, %r12	; current
	je	.L118	;,
.L121:
; temp/codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%r12), %r13	; current_175->content, var
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%r13, %r13	; var
	je	.L119	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	0(%r13), %rax	; var_189->original_name, _190
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	; _190
	je	.L119	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rdi	; _190->name, _190->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	; tmp248
	je	.L119	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%r13), %rax	; var_189->type, _10
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	; _10
	je	.L118	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	cmpl	$0, 32(%rax)	;, _10->kind
	jne	.L118	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	; _10->ast_node.class, _10->ast_node.class
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	; _13->class_scope, tmp279
	cmpq	%rax, 24(%rbx)	; tmp279, name_145->ast_node.scope
	je	.L157	;,
.L118:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbx), %rcx	; name_145->name, name_145->name
	leaq	.LC14(%rip), %rdx	;, tmp200
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	(%rbx), %rsi	; name_145->type, name_145->type
	movq	%rbp, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rbx, %rdi	; <retval>,
	call	create_var	;
	movq	%rax, %rsi	; tmp251, _19
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp252, <retval>
.L108:
; temp/codegen.c:833: }
	movq	%rbx, %rax	; <retval>,
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L157:
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%r13, %rsi	; var,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rdi	; tmp249, _15
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rbp, %rdx	; status,
	movq	%rbx, %rsi	; <retval>,
	call	emit_attribute_access	;
	movq	%rax, %rbx	; tmp250, <retval>
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	jmp	.L108	;
.L112:
; temp/codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _5
	je	.L158	;,
; temp/codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _5
	je	.L159	;,
; temp/codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _5
	jne	.L133	;,
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rdi), %rbx	; variable_access_89(D)->base, <retval>
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rbx, %rbx	; <retval>
	je	.L160	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rbx)	;, _45->type
	jne	.L136	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rbx), %r14	; _45->content.attr_name, callee_name
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r14, %r14	; callee_name
	je	.L136	;,
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r14), %eax	; _48->kind, tmp281
	subl	$1, %eax	;, tmp222
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	;, tmp222
	jbe	.L161	;,
.L136:
; temp/codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rbp, %rsi	; status,
	movq	%rbx, %rdi	; <retval>,
	call	codegen_variable_access	;
	movq	%rax, %rbx	; tmp266, <retval>
; temp/codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L162	;,
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %eax	; callee_97->kind, _57
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %eax	;, _57
	je	.L163	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%eax, %eax	; _57
	jne	.L143	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rbx), %rax	; callee_97->value.variable, _59
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	; _59
	je	.L143	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r14	; _59->original_name, callee_name
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r14, %r14	; callee_name
	je	.L143	;,
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r14), %eax	; _60->kind, tmp282
	subl	$1, %eax	;, tmp226
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp226
	jbe	.L137	;,
.L143:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp229
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:801:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L108	;
.L158:
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rdi), %rdi	; variable_access_89(D)->base, _20
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rdi, %rdi	; _20
	je	.L123	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%r12), %r12	; variable_access_89(D)->content.attr_name, _21
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%r12, %r12	; _21
	je	.L123	;,
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%r12), %eax	; _21->kind, tmp280
	subl	$1, %eax	;, tmp204
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	;, tmp204
	jbe	.L164	;,
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	;
	movq	%rax, %rbx	; tmp255, <retval>
; temp/codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L165	;,
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rbp, %rdx	; status,
	movq	%r12, %rsi	; _21,
	movq	%rax, %rdi	; <retval>,
	call	emit_attribute_access	;
	movq	%rax, %rbx	; tmp256, <retval>
	jmp	.L108	;
.L123:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp203
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:731:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L108	;
.L164:
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rsi	; _21->type, _21->type
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r12, %rdi	; _21,
	call	create_var	;
	movq	%rax, %rsi	; tmp253, _26
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp254, <retval>
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	jmp	.L108	;
.L165:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$61, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp208
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:739:             return NULL;
	jmp	.L108	;
.L159:
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rdi), %rdi	; variable_access_89(D)->base, _28
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rdi, %rdi	; _28
	je	.L128	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%r12)	;, variable_access_89(D)->content.index
	je	.L128	;,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	;
	movq	%rax, %rdi	; tmp257, _31
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	movq	%rbp, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r13	; tmp258, sequence
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%r12), %rdi	; variable_access_89(D)->content.index, variable_access_89(D)->content.index
	movq	%rbp, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %rdi	; tmp259, _33
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	%rbp, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp260, index
; temp/codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%r13, %r13	; sequence
	je	.L151	;,
	testq	%rax, %rax	; index
	je	.L151	;,
; temp/codegen.c:755:         Symbol* element_type = name_int;
	movq	name_int(%rip), %rdx	; name_int, element_type
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%r13), %rax	; sequence_126->type, _38
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	name_float(%rip), %rsi	; name_float, name_float.32_39
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rsi, %rax	; name_float.32_39, _38
	je	.L132	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	name_bool(%rip), %rsi	; name_bool, name_float.32_39
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	%rsi, %rax	; name_float.32_39, _38
	je	.L132	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	name_string(%rip), %rsi	; name_string, name_float.32_39
; temp/codegen.c:755:         Symbol* element_type = name_int;
	cmpq	%rsi, %rax	; name_float.32_39, _38
	cmovne	%rdx, %rsi	; name_float.32_39,, element_type, name_float.32_39
.L132:
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp261, _42
; temp/codegen.c:758:         Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, element_type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp262, <retval>
; temp/codegen.c:759:         Instruction* inst = create_instruction(INST_GET_ELEM, result, sequence, index);
	movq	%r12, %rcx	; index,
	movq	%r13, %rdx	; sequence,
	movq	%rax, %rsi	; <retval>,
	movl	$16, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp263, inst
; temp/codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_90(D)->current_block, status_90(D)->current_block
	movq	8(%rax), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:761:         result->is_get = true;
	movb	$1, 20(%rbx)	;, result_133->is_get
; temp/codegen.c:762:         return result;
	jmp	.L108	;
.L128:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp210
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:747:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L108	;
.L151:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$68, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp217
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:753:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L108	;
.L160:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp221
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:768:             return NULL;
	jmp	.L108	;
.L161:
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rbx), %rdi	; _45->base, _51
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rdi, %rdi	; _51
	je	.L137	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 16(%rdi)	;, _51->type
	jne	.L138	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rdi), %rax	; _51->content.name, _53
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _53
	je	.L138	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	;, _53->kind
	je	.L137	;,
.L138:
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbp, %rsi	; status,
	call	codegen_variable_access	;
	movq	%rax, %rdi	; tmp264, _55
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbp, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %rdi	; tmp265, receiver
; temp/codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	; receiver
	je	.L166	;,
; temp/codegen.c:806:             emit_param_instruction(receiver, status);
	movq	%rbp, %rsi	; status,
	call	emit_param_instruction	;
; temp/codegen.c:807:             ++argument_count;
	movl	$1, %r13d	;, argument_count
.L140:
; temp/codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%r12), %rdi	; variable_access_89(D)->content.args, variable_access_89(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp267, args
.L144:
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp270, arg_expr
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L167	;,
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %rdi	; tmp268, _65
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %rbx	; tmp269, <retval>
; temp/codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L168	;,
; temp/codegen.c:817:             emit_param_instruction(arg_value, status);
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; <retval>,
	call	emit_param_instruction	;
; temp/codegen.c:818:             ++argument_count;
	addq	$1, %r13	;, argument_count
	jmp	.L144	;
.L166:
; temp/codegen.c:804:         size_t argument_count = 0;
	movl	$0, %r13d	;, argument_count
	jmp	.L140	;
.L162:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp225
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:789:                 return NULL;
	jmp	.L108	;
.L163:
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rbx), %rax	; callee_97->value.subroutine, _58
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	; _58
	je	.L143	;,
; temp/codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r14	; _58->original_name, callee_name
; temp/codegen.c:799:         if (callee_name == NULL) {
	testq	%r14, %r14	; callee_name
	je	.L143	;,
.L137:
; temp/codegen.c:804:         size_t argument_count = 0;
	movl	$0, %r13d	;, argument_count
	jmp	.L140	;
.L168:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp232
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:815:                 return NULL;
	jmp	.L108	;
.L167:
; temp/codegen.c:821:         Arg* result = create_arg(ARG_VOID, NULL);
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp271, <retval>
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	(%r14), %rsi	; callee_name_147->type, _67
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	testq	%rsi, %rsi	; _67
	je	.L147	;,
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	name_void(%rip), %rsi	; name_void, _67
	je	.L147	;,
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp272, _69
; temp/codegen.c:823:             result = create_arg(ARG_VARIABLE, create_var(NULL, callee_name->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbx	; tmp273, <retval>
.L147:
; temp/codegen.c:824:         long long count = (long long)argument_count;
	movq	%r13, 8(%rsp)	; argument_count, count
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	(%r14), %rsi	; callee_name_147->type, callee_name_147->type
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r14, %rdi	; callee_name,
	call	create_var	;
	movq	%rax, %rsi	; tmp274, _72
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %r12	; tmp275, callee_arg
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	leaq	8(%rsp), %rsi	;, tmp234
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	; tmp276, _73
; temp/codegen.c:826:         Instruction* call_inst = create_instruction(INST_CALL, result, callee_arg, create_arg(ARG_INT, &count));
	movq	%r12, %rdx	; callee_arg,
	movq	%rbx, %rsi	; <retval>,
	movl	$22, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp277, call_inst
; temp/codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rbp), %rax	; status_90(D)->current_block, status_90(D)->current_block
	movq	8(%rax), %rdi	; _74->instructions, _74->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:828:         return result;
	jmp	.L108	;
.L133:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC23(%rip), %rdx	;, tmp238
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:832:     return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L108	;
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC26:
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
	movl	8(%rdi), %ecx	; primary_36(D)->type, _1
; temp/codegen.c:655:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L170	;,
	movq	%rsi, %rbx	; tmp150, status
	movl	%ecx, %ecx	; _1, _1
	leaq	.L172(%rip), %rdx	;, tmp118
	movslq	(%rdx,%rcx,4), %rax	;, tmp120
	addq	%rdx, %rax	; tmp118, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L172:
	.long	.L180-.L172
	.long	.L179-.L172
	.long	.L178-.L172
	.long	.L177-.L172
	.long	.L176-.L172
	.long	.L175-.L172
	.long	.L174-.L172
	.long	.L173-.L172
	.long	.L171-.L172
	.text
.L180:
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	movl	$0, %esi	;,
	call	*strtoll@GOTPCREL(%rip)	;
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 8(%rsp)	; tmp151, MEM[(long long int *)_91]
; temp/codegen.c:658:             return create_arg(ARG_INT, &t);
	leaq	8(%rsp), %rsi	;, tmp124
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp152, <retval>
.L169:
; temp/codegen.c:703: }
	movq	%rbp, %rax	; <retval>,
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L179:
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$0, %esi	;,
	call	*strtod@GOTPCREL(%rip)	;
; temp/codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; tmp153, MEM[(double *)_91]
; temp/codegen.c:662:             return create_arg(ARG_FLOAT, &t);
	leaq	8(%rsp), %rsi	;, tmp126
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp154, <retval>
	jmp	.L169	;
.L178:
; temp/codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %rsi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$3, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp155, <retval>
	jmp	.L169	;
.L177:
; temp/codegen.c:666:             bool t = true;
	movb	$1, 8(%rsp)	;, MEM[(char *)_91]
; temp/codegen.c:667:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp128
	movl	$4, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp156, <retval>
	jmp	.L169	;
.L176:
; temp/codegen.c:670:             bool t = false;
	movb	$0, 8(%rsp)	;, MEM[(char *)_91]
; temp/codegen.c:671:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp129
	movl	$4, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp157, <retval>
	jmp	.L169	;
.L175:
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
	call	codegen_expression	;
	movq	%rax, %rbp	; tmp158, <retval>
	jmp	.L169	;
.L174:
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	codegen_primary	;
	movq	%rax, %rdi	; tmp159, _9
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp160, operand
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movq	name_bool(%rip), %rsi	; name_bool,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp161, _11
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp162, <retval>
; temp/codegen.c:677:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %ecx	;,
	movq	%r12, %rdx	; operand,
	movq	%rax, %rsi	; <retval>,
	movl	$13, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp163, inst
; temp/codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	; _12->instructions, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:679:             return temp;
	jmp	.L169	;
.L173:
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	codegen_primary	;
	movq	%rax, %rdi	; tmp164, _15
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp165, operand
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp166, _17
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp167, <retval>
; temp/codegen.c:685:             long long zero_int = 0;
	movq	$0, (%rsp)	;, zero_int
; temp/codegen.c:686:             double neg_one_float = -1.0;
	movq	.LC24(%rip), %rax	;, tmp174
	movq	%rax, 8(%rsp)	; tmp174, MEM[(double *)_91]
; temp/codegen.c:687:             if (operand->type == name_int)
	movq	8(%r12), %rax	; operand_42->type, _18
; temp/codegen.c:687:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L187	;,
; temp/codegen.c:689:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L188	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	leaq	.LC25(%rip), %rdx	;, tmp142
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:693:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L169	;
.L187:
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rsp, %rsi	;, tmp138
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp168, _20
; temp/codegen.c:688:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbp, %rsi	; <retval>,
	movl	$1, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp169, inst
	jmp	.L183	;
.L188:
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	8(%rsp), %rsi	;, tmp139
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp170, _22
; temp/codegen.c:690:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbp, %rsi	; <retval>,
	movl	$2, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp171, inst
.L183:
; temp/codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	; _25->instructions, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:696:             return temp;
	jmp	.L169	;
.L171:
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.var, primary_36(D)->value.var
	call	codegen_variable_access	;
	movq	%rax, %rbp	; tmp172, <retval>
	jmp	.L169	;
.L170:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC26(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:701:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L169	;
	.size	codegen_primary, .-codegen_primary
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbp	; tmp142, expression
	movq	%rsi, %rbx	; tmp143, status
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rdi)	;, expression_31(D)->operator
	je	.L217	;,
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_31(D)->right, expression_31(D)->right
	call	codegen_expression	;
	movq	%rax, %rdi	; tmp145, _4
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r14	; tmp146, right
; temp/codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %r13d	; expression_31(D)->operator, _61
; temp/codegen.c:51:     switch (op) {
	cmpl	$18, %r13d	;, _61
	ja	.L192	;,
	movl	%r13d, %eax	; _61, _61
	leaq	.L194(%rip), %rdx	;, tmp119
	movslq	(%rdx,%rax,4), %rax	;, tmp121
	addq	%rdx, %rax	; tmp119, tmp122
	jmp	*%rax	; tmp122
	.section	.rodata
	.align 4
	.align 4
.L194:
	.long	.L198-.L194
	.long	.L197-.L194
	.long	.L213-.L194
	.long	.L195-.L194
	.long	.L193-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L196-.L194
	.long	.L199-.L194
	.long	.L198-.L194
	.long	.L197-.L194
	.long	.L213-.L194
	.long	.L195-.L194
	.long	.L193-.L194
	.text
.L217:
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_31(D)->prim_left, expression_31(D)->prim_left
	call	codegen_primary	;
	movq	%rax, %rbp	; tmp144, <retval>
	jmp	.L189	;
.L195:
; temp/codegen.c:59:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %r13d	;, _61
.L196:
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %r12	; tmp158, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	;, tmp137
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp137
	jbe	.L211	;,
.L208:
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; left_76->type, left_76->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp154, _18
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp155, <retval>
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue	;
	movq	%rax, %rdx	; tmp156, _19
; temp/codegen.c:648:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r14, %rcx	; right,
	movq	%rbp, %rsi	; <retval>,
	movl	%r13d, %edi	; _61,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp157, inst
	jmp	.L210	;
.L193:
; temp/codegen.c:61:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %r13d	;, _61
	jmp	.L196	;
.L192:
; temp/codegen.c:72:         default: return INST_NONE;
	movl	$25, %r13d	;, _61
	jmp	.L196	;
.L198:
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %r12	; tmp147, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	;, tmp125
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp125
	ja	.L214	;,
	movl	$0, %r13d	;, _61
.L211:
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; left_74->type, left_74->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp148, _10
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp149, <retval>
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue	;
	movq	%rax, %rdx	; tmp150, _11
; temp/codegen.c:637:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r14, %rcx	; right,
	movq	%rbp, %rsi	; <retval>,
	movl	%r13d, %edi	; _61,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, inst
; temp/codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rdi	; _12->instructions, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L212:
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%r12)	;, left_75->kind
	jne	.L218	;,
.L209:
; temp/codegen.c:643:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; <retval>,
	movq	%r12, %rsi	; left,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp152, inst
; temp/codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%r12)	;, left_75->is_get
	jne	.L219	;,
.L210:
; temp/codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rdi	; _20->instructions, _20->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L189:
; temp/codegen.c:653: }
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L218:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L209	;
.L219:
; temp/codegen.c:645:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; <retval>,
	movq	%r12, %rsi	; left,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp153, inst
	jmp	.L210	;
.L214:
	movl	$0, %r13d	;, _61
	jmp	.L208	;
.L197:
; temp/codegen.c:55:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %r13d	;, _61
	jmp	.L196	;
.L213:
; temp/codegen.c:51:     switch (op) {
	movl	$2, %r13d	;, _61
	jmp	.L196	;
.L199:
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %r12	; tmp159, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	;, tmp140
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp140
	ja	.L220	;,
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	%r14, %rbp	; right, <retval>
	jmp	.L212	;
.L220:
; temp/codegen.c:62:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %r13d	;, _61
	jmp	.L208	;
	.size	codegen_expression, .-codegen_expression
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
	movq	%rdi, %r14	; tmp181, if_
	movq	%rsi, %rbx	; tmp182, status
; temp/codegen.c:453:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r12	; tmp183, then_label
; temp/codegen.c:454:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp184, else_label
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp185
	je	.L222	;,
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:457:         end_label = else_label;
	movq	%rbp, 24(%rsp)	; else_label, %sfp
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp186
	jne	.L223	;,
.L222:
; temp/codegen.c:459:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, 24(%rsp)	; tmp187, %sfp
.L223:
; temp/codegen.c:460:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	24(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, 16(%rsp)	; tmp188, %sfp
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%r14), %rdi	; if__61(D)->condition, if__61(D)->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %r15	; tmp189, condition
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %r13	; tmp190, _6
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rsi	; then_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp191, _7
; temp/codegen.c:463:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %rcx	; _6,
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp192, inst
; temp/codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:466:     Block* then_block = create_block(then_label);
	movq	%r12, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r12	; tmp193, then_block
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _10->blocks, _10->blocks
	movq	%r12, %rsi	; then_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:468:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	; then_block, status_56(D)->current_block
; temp/codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rdi	; if__61(D)->body, if__61(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp194, then_statements
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L224	;
.L225:
; temp/codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L224:
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp195, statement
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L225	;,
; temp/codegen.c:475:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp196, jump_to_end
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp197
	je	.L238	;,
.L226:
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp213
	je	.L239	;,
.L232:
; temp/codegen.c:526:     Block* end_block = create_block(end_label);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %rbp	; tmp218, end_block
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _40->blocks, _40->blocks
	movq	%rbp, %rsi	; end_block,
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
.L238:
; temp/codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp198, elif_list
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L227	;
.L240:
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:493:                 else_label = end_label;
	testb	%al, %al	; tmp204
	cmovne	24(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L228	;
.L230:
; temp/codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L229:
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp210, elif_statement
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L230	;,
; temp/codegen.c:506:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp211, jump_to_end
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _31->instructions, _31->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L227:
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r15, %rdi	; elif_list,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp212, elif
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L226	;,
; temp/codegen.c:484:             Block* else_if_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp199, else_if_block
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	movq	%rbp, %rsi	; else_if_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:486:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	; else_if_block, status_56(D)->current_block
; temp/codegen.c:488:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r13	; tmp200, then_label
; temp/codegen.c:489:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp201, else_label
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	(%r12), %rdi	; elif_90->condition, elif_90->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, 8(%rsp)	; tmp202, %sfp
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r15, %rdi	; elif_list,
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp203
	jne	.L240	;,
.L228:
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, (%rsp)	; tmp205, %sfp
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %rsi	; then_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp206, _25
; temp/codegen.c:494:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp207, inst
; temp/codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _26->instructions, _26->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:497:             then_block = create_block(then_label);
	movq	%r13, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r13	; tmp208, then_block
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _28->blocks, _28->blocks
	movq	%r13, %rsi	; then_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:499:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	; then_block, status_56(D)->current_block
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rdi	; elif_90->body, elif_90->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp209, elif_statements
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L229	;
.L239:
; temp/codegen.c:513:         Block* else_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp214, else_block
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	movq	%rbp, %rsi	; else_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:515:         status->current_block = else_block;
	movq	%rbp, 16(%rbx)	; else_block, status_56(D)->current_block
; temp/codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp215, else_statements
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L233	;
.L234:
; temp/codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L233:
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp216, else_statement
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L234	;,
; temp/codegen.c:522:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp217, jump_to_end
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _38->instructions, _38->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L232	;
	.size	codegen_if, .-codegen_if
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC29:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC30:
	.string	"[warning] Unsupported statement type for codegen_statement: %d\n"
	.text
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
	pushq	%rbx	;
; temp/codegen.c:412:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_27(D)->type, _1
; temp/codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L242	;,
	movq	%rsi, %rbx	; tmp145, status
	movl	%ecx, %ecx	; _1, _1
	leaq	.L244(%rip), %rdx	;, tmp115
	movslq	(%rdx,%rcx,4), %rax	;, tmp117
	addq	%rdx, %rax	; tmp115, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
	.align 4
.L244:
	.long	.L251-.L244
	.long	.L250-.L244
	.long	.L249-.L244
	.long	.L248-.L244
	.long	.L247-.L244
	.long	.L246-.L244
	.long	.L245-.L244
	.long	.L243-.L244
	.text
.L251:
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.expr, statement_27(D)->stmt.expr
	call	codegen_expression	;
.L241:
; temp/codegen.c:450: }
	popq	%rbx	;
	ret	
.L250:
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.var, statement_27(D)->stmt.var
	movl	$118, %edx	;,
	call	codegen_variable	;
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L241	;
.L249:
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.if_stmt, statement_27(D)->stmt.if_stmt
	call	codegen_if	;
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	.L241	;
.L248:
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.while_stmt, statement_27(D)->stmt.while_stmt
	call	codegen_while	;
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	.L241	;
.L247:
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.for_stmt, statement_27(D)->stmt.for_stmt
	call	codegen_for	;
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	.L241	;
.L246:
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rdi), %rdi	; statement_27(D)->stmt.return_expr, statement_27(D)->stmt.return_expr
	call	codegen_expression	;
	movq	%rax, %rsi	; tmp146, return_value
; temp/codegen.c:420:             Instruction* inst = create_instruction(INST_RET, return_value, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$21, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp147, inst
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:422:             break;
	jmp	.L241	;
.L245:
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp148
	jne	.L253	;,
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbx), %rax	; status_28(D)->end_labels, status_28(D)->end_labels
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _12->tail, _12->tail
	movq	8(%rax), %rsi	; _13->content, label
; temp/codegen.c:427:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L253	;,
; temp/codegen.c:428:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp149, inst
; temp/codegen.c:429:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:430:                     break;
	jmp	.L241	;
.L253:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC28(%rip), %rdi	;, tmp134
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L241	;
.L243:
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp150
	jne	.L254	;,
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rbx), %rax	; status_28(D)->start_labels, status_28(D)->start_labels
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _19->tail, _19->tail
	movq	8(%rax), %rsi	; _20->content, label
; temp/codegen.c:438:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L254	;,
; temp/codegen.c:439:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, inst
; temp/codegen.c:440:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:441:                     break;
	jmp	.L241	;
.L254:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rdi	;, tmp141
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L241	;
.L242:
	leaq	.LC30(%rip), %rdx	;, tmp143
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:450: }
	jmp	.L241	;
	.size	codegen_statement, .-codegen_statement
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp171, for_
	movq	%rsi, %rbx	; tmp172, status
; temp/codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rdi), %rdi	; for__53(D)->initializer, _1
; temp/codegen.c:532:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L257	;,
; temp/codegen.c:533:         codegen_variable(for_->initializer, status, VAR_VAR);
	movl	$118, %edx	;,
	call	codegen_variable	;
.L257:
; temp/codegen.c:535:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r13	; tmp173, condition_label
; temp/codegen.c:536:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r15	; tmp174, body_label
; temp/codegen.c:537:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r14	; tmp175, end_label
; temp/codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L258	;,
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp176, _3
; temp/codegen.c:540:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp177, inst
; temp/codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:542:         Block* condition_block = create_block(condition_label);
	movq	%r13, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp178, condition_block
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	movq	%rbp, %rsi	; condition_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:544:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; condition_block, status_54(D)->current_block
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%r12), %rdi	; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, 8(%rsp)	; tmp179, %sfp
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp180, _9
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp181, _10
; temp/codegen.c:547:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rcx	; _9,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp182, inst
; temp/codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L259:
; temp/codegen.c:555:     Block* body_block = create_block(body_label);
	movq	%r15, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp185, body_block
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _16->blocks, _16->blocks
	movq	%rbp, %rsi	; body_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:557:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; body_block, status_54(D)->current_block
; temp/codegen.c:559:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, 8(%rsp)	; increment_label, %sfp
; temp/codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__53(D)->increment
	je	.L260	;,
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp187, _19
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
.L261:
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp190, _26
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__53(D)->body, for__53(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp191, body_statements
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L263	;
.L258:
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp183, _13
; temp/codegen.c:551:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp184, inst
; temp/codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L259	;
.L260:
; temp/codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L262	;,
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp188, _22
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L261	;
.L262:
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp189, _24
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L261	;
.L264:
; temp/codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L263:
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp192, statement
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L264	;,
; temp/codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__53(D)->increment
	je	.L265	;,
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	8(%rsp), %rbp	; %sfp, increment_label
	movq	%rbp, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp193, _32
; temp/codegen.c:575:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp194, inst
; temp/codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:577:         Block* increment_block = create_block(increment_label);
	movq	%rbp, %rdi	; increment_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp195, increment_block
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	movq	%rbp, %rsi	; increment_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:579:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; increment_block, status_54(D)->current_block
; temp/codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%r12), %rdi	; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
.L265:
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp196, _38
; temp/codegen.c:583:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp197, inst
; temp/codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L268	;,
.L266:
; temp/codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _41->instructions, _41->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:588:     Block* end_block = create_block(end_label);
	movq	%r14, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp200, end_block
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _43->blocks, _43->blocks
	movq	%rbp, %rsi	; end_block,
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
.L268:
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp198, _40
; temp/codegen.c:585:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp199, inst
	jmp	.L266	;
	.size	codegen_for, .-codegen_for
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r13	; tmp138, while_
	movq	%rsi, %rbx	; tmp139, status
; temp/codegen.c:594:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp140, condition_label
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp141, _1
; temp/codegen.c:595:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp142, inst
; temp/codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:597:     Block* condition_block = create_block(condition_label);
	movq	%rbp, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r12	; tmp143, condition_block
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	movq	%r12, %rsi	; condition_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:599:     status->current_block = condition_block;
	movq	%r12, 16(%rbx)	; condition_block, status_27(D)->current_block
; temp/codegen.c:601:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r14	; tmp144, body_label
; temp/codegen.c:602:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r12	; tmp145, end_label
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	0(%r13), %rdi	; while__42(D)->condition, while__42(D)->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, 8(%rsp)	; tmp146, %sfp
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %r15	; tmp147, _7
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp148, _8
; temp/codegen.c:604:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rcx	; _7,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp149, inst
; temp/codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:607:     Block* body_block = create_block(body_label);
	movq	%r14, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp150, body_block
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	movq	%r14, %rsi	; body_block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:609:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_27(D)->current_block
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp151, _13
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp152, _15
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r13), %rdi	; while__42(D)->body, while__42(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp153, body_statements
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L270	;
.L271:
; temp/codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L270:
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r13, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp154, statement
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L271	;,
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
	movq	%rax, %rsi	; tmp155, _20
; temp/codegen.c:620:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp156, inst
; temp/codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:623:     Block* end_block = create_block(end_label);
	movq	%r12, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp157, end_block
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _23->blocks, _23->blocks
	movq	%rbp, %rsi	; end_block,
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
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp112, function
	movq	%rsi, %rbx	; tmp113, status
; temp/codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rdi), %rsi	; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rdi), %rdi	; function_16(D)->name, function_16(D)->name
	call	create_subroutine	;
	movq	%rax, %rbp	; tmp114, subroutine
; temp/codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	movq	%rbp, %rsi	; subroutine,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r13), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp115, parameters
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L274	;
.L275:
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp116, _8
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_18->parameters, subroutine_18->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L274:
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L275	;,
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rdi	; tmp118, _10
; temp/codegen.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
	movq	%rax, %r12	; tmp119, block
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:332:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r13), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp120, statements
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L276	;
.L277:
; temp/codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L276:
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp121, statement
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L277	;,
; temp/codegen.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:340: }
	addq	$8, %rsp	;,
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
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp112, method
	movq	%rsi, %rbx	; tmp113, status
; temp/codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rdi), %rsi	; method_16(D)->return_type, method_16(D)->return_type
	movq	(%rdi), %rdi	; method_16(D)->name, method_16(D)->name
	call	create_subroutine	;
	movq	%rax, %rbp	; tmp114, subroutine
; temp/codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	movq	%rbp, %rsi	; subroutine,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r13), %rdi	; method_16(D)->parameters, method_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp115, parameters
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L280	;
.L281:
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp116, _8
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_18->parameters, subroutine_18->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L280:
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L281	;,
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rdi	; tmp118, _10
; temp/codegen.c:352:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
	movq	%rax, %r12	; tmp119, block
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:354:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r13), %rdi	; method_16(D)->body, method_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp120, statements
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L282	;
.L283:
; temp/codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L282:
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp121, statement
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L283	;,
; temp/codegen.c:361:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:362: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"[warning] Unsupported class member type for codegen_class: %d\n"
	.text
	.globl	codegen_class
	.type	codegen_class, @function
codegen_class:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r13	; tmp105, class
	movq	%rsi, %rbp	; tmp106, status
; temp/codegen.c:364:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_12(D)->members, class_12(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp107, members
; temp/codegen.c:366:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%r13), %r14	; class_12(D)->name, _2
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp108, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, (%r12)	; tmp109, table_26->attributes
; temp/codegen.c:16:     table->name = name;
	movq	%r14, 8(%r12)	; _2, table_26->name
; temp/codegen.c:17:     table->size = 0;
	movq	$0, 16(%r12)	;, table_26->size
; temp/codegen.c:368:     attr_table->size = class->size;
	movq	24(%r13), %rax	; class_12(D)->size, _3
; temp/codegen.c:368:     attr_table->size = class->size;
	movq	%rax, 16(%r12)	; _3, table_26->size
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_18(D)->tac, status_18(D)->tac
	movq	(%rax), %rdi	; _4->attribute_tables, _4->attribute_tables
	movq	%r12, %rsi	; table,
	call	*list_append@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC31(%rip), %r12	;, tmp104
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L286	;
.L287:
; temp/codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rdi	; member_21->content.method, member_21->content.method
	movq	%rbp, %rsi	; status,
	call	codegen_method	;
.L286:
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L294	;,
; temp/codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ecx	; member_21->type, _6
; temp/codegen.c:371:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L287	;,
	cmpl	$1, %ecx	;, _6
	je	.L288	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdx	; tmp104,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L286	;
.L288:
; temp/codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_21->content.variable, member_21->content.variable
	movl	$97, %edx	;,
	movq	%rbp, %rsi	; status,
	call	codegen_variable	;
; temp/codegen.c:377:                 break;
	jmp	.L286	;
.L294:
; temp/codegen.c:383: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC32:
	.string	"main"
	.text
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp113, code
; temp/codegen.c:76:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp114, <retval>
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:77:     tac->attribute_tables = create_list();
	movq	%rax, 0(%r13)	; tmp115, tac_29->attribute_tables
; temp/codegen.c:78:     tac->entry_point = NULL;
	movq	$0, 8(%r13)	;, tac_29->entry_point
; temp/codegen.c:79:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:79:     tac->global_vars = create_list();
	movq	%rax, 16(%r13)	; tmp116, tac_29->global_vars
; temp/codegen.c:80:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:80:     tac->subroutines = create_list();
	movq	%rax, 24(%r13)	; tmp117, tac_29->subroutines
; temp/codegen.c:84:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$88, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp118, status
; temp/codegen.c:85:     status->tac = tac;
	movq	%r13, (%rax)	; <retval>, status_26->tac
; temp/codegen.c:86:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	;, status_26->current_subroutine
; temp/codegen.c:87:     status->current_block = NULL;
	movq	$0, 16(%rax)	;, status_26->current_block
; temp/codegen.c:88:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:88:     status->end_labels = create_list();
	movq	%rax, 24(%rbp)	; tmp119, status_26->end_labels
; temp/codegen.c:89:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:89:     status->start_labels = create_list();
	movq	%rax, 32(%rbp)	; tmp120, status_26->start_labels
; temp/codegen.c:90:     status->attr_count = 0;
	movq	$0, 40(%rbp)	;, status_26->attr_count
; temp/codegen.c:91:     status->param_count = 0;
	movq	$0, 48(%rbp)	;, status_26->param_count
; temp/codegen.c:92:     status->var_count = 0;
	movq	$0, 56(%rbp)	;, status_26->var_count
; temp/codegen.c:93:     status->temp_count = 0;
	movq	$0, 64(%rbp)	;, status_26->temp_count
; temp/codegen.c:94:     status->block_count = 0;
	movq	$0, 72(%rbp)	;, status_26->block_count
; temp/codegen.c:95:     status->subroutine_count = 0;
	movq	$0, 80(%rbp)	;, status_26->subroutine_count
; temp/codegen.c:295:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rdi	; code_17(D)->members, code_17(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp121, members
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC32(%rip), %r14	;, tmp112
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L296	;
.L303:
; temp/codegen.c:299:             codegen_function(code_member->content.function, status);
	movq	(%rbx), %rdi	; code_member_21->content.function, code_member_21->content.function
	movq	%rbp, %rsi	; status,
	call	codegen_function	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	; code_member_21->content.function, code_member_21->content.function
	movq	(%rax), %rbx	; _4->name, _5
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rdi	; _5->name, _5->name
	movq	%r14, %rsi	; tmp112,
	call	*strcmp@GOTPCREL(%rip)	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp122
	jne	.L296	;,
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L296	;
.L304:
; temp/codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	codegen_class	;
.L296:
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp123, code_member
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L302	;,
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L303	;,
; temp/codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L304	;,
; temp/codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L296	;,
; temp/codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	codegen_import	;
	jmp	.L296	;
.L302:
; temp/codegen.c:308: }
	movq	%r13, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	codegen_code, .-codegen_code
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC24:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
