	.file	"codegen.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.p2align 4
	.type	emit_param_instruction.part.0, @function
emit_param_instruction.part.0:
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp108, value
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp109, status
	pushq	%rbx	;
	subq	$8, %rsp	;,
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rdi), %rax	; value_1(D)->type, _2
; temp/codegen.c:21:     if (type == NULL)
	testq	%rax, %rax	; _2
	je	.L5	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, _2
	je	.L3	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, _2
	je	.L3	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, _2
	je	.L3	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, _2
	je	.L7	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, _2
	je	.L7	;,
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %edx	; _2->kind,
	testl	%edx, %edx	;
	jne	.L4	;,
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rax), %rax	; _2->ast_node.class, _2->ast_node.class
; temp/codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	24(%rax), %r13	; _39->size, prephitmp_50
.L2:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%r13, (%rax)	; prephitmp_50, arg_21->value.int_value
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp110, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_21->kind
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;, arg_21->is_get
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int, arg_21->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; value, inst_6->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp111, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_6->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; arg, inst_6->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_6->arg3
; temp/codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_7(D)->current_block, status_7(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
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
.L7:
	movl	$1, %r13d	;, prephitmp_50
	jmp	.L2	;
	.p2align 4,,10
	.p2align 3
.L5:
	xorl	%r13d, %r13d	; prephitmp_50
	jmp	.L2	;
	.p2align 4,,10
	.p2align 3
.L4:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _2->name, _2->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC0(%rip), %rdx	;, tmp104
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L3:
	movl	$8, %r13d	;, prephitmp_50
	jmp	.L2	;
	.size	emit_param_instruction.part.0, .-emit_param_instruction.part.0
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	""
.LC2:
	.string	"$%d-error"
.LC3:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	load_rvalue.part.0, @function
load_rvalue.part.0:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp106, arg
	pushq	%r12	;
	movq	%rsi, %r12	; tmp107, status
	pushq	%rbp	;
	pushq	%rbx	;
; temp/codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rbp	; arg_1(D)->type, _2
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%r12), %r14	; status_3(D)->temp_count, _38
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp98
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_31->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp108, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	;, tmp97
	movq	%rax, 64(%r12)	; tmp97, status_3(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _44, var_31->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp109, _44
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _38
	je	.L14	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _38,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp100
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L12:
; temp/codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rbx)	; _2, var_31->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp101
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	; var_31->type, tmp101
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp110, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_19->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp101, MEM <vector(2) long unsigned int> [(void *)arg_19]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_19->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_6->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp111, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; <retval>, inst_6->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_6->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_6->arg3
; temp/codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%r12), %rax	; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rdi	; _7->instructions, _7->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:195: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L14:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp99
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L12	;
	.size	load_rvalue.part.0, .-load_rvalue.part.0
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
	subq	$24, %rsp	;,
; temp/codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rdi, %rdi	; object
	je	.L40	;,
	movq	%rsi, %rbx	; tmp171, attr_name
	testq	%rsi, %rsi	; attr_name
	je	.L40	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, object_15(D)->is_get
	movq	%rdi, %r14	; tmp170, object
	movq	%rdx, %r15	; tmp172, status
	jne	.L46	;,
.L19:
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%r14), %rbp	; _26->type, class_type
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rbp, %rbp	; class_type
	je	.L21	;,
; temp/codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movl	32(%rbp), %eax	; _5->kind,
	testl	%eax, %eax	;
	jne	.L47	;,
.L21:
; temp/codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%r15), %rax	; MEM[(struct TAC * *)status_18(D)], MEM[(struct TAC * *)status_18(D)]
	movq	(%rax), %rdi	; _102->attribute_tables, _102->attribute_tables
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp174, attribute_tables
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L24:
; temp/codegen.c:9:         if (current->name == name)
	cmpq	%rbp, 8(%rax)	; class_type, current_106->name
	je	.L23	;,
.L22:
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%r12, %rdi	; attribute_tables,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	; current
	jne	.L24	;,
.L25:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rbx), %rbp	; attr_name_16(D)->type, _83
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%r15), %r12	; status_18(D)->attr_count, _111
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	; attr_name, var_110->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp176, var
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r12), %rax	;, tmp140
	movq	%rax, 40(%r15)	; tmp140, status_18(D)->attr_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rax	;, tmp163
	movq	%rax, %rdi	; tmp163,
	movq	%rax, 8(%rsp)	; tmp163, %sfp
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _123, var_110->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp177, _123
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _111
	je	.L48	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _111,
	movl	$97, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp143
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L28:
; temp/codegen.c:131:     var->type = type;
	movq	%rbp, 16(%r13)	; _83, var_110->type
; temp/codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	jmp	.L29	;
	.p2align 4,,10
	.p2align 3
.L23:
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rdi	; current_106->attributes, _82
; temp/codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _82
	je	.L25	;,
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	*list_copy@GOTPCREL(%rip)	;
; temp/codegen.c:243:     size_t index = 0;
	xorl	%r12d, %r12d	; index
; temp/codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	%rax, %r13	; tmp178, attrs
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	jmp	.L30	;
	.p2align 4,,10
	.p2align 3
.L32:
; temp/codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbx	; attr_86->var_name, attr_name
	je	.L31	;,
; temp/codegen.c:252:         ++index;
	addq	$1, %r12	;, index
.L30:
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%r13, %rdi	; attrs,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	; attr
	jne	.L32	;,
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	; attr_name, var_125->original_name
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp185, var
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	; attr_name_16(D)->type, attr_name_16(D)->type
	movq	%rax, 16(%r13)	; attr_name_16(D)->type, var_125->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rax	;, tmp163
	movq	%rax, 8(%rsp)	; tmp163, %sfp
	movq	%rax, %rdi	; tmp163,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC4(%rip), %r8	;, iftmp.44_94
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; tmp186, var_125->name
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rbp, %rbp	; class_type
	je	.L37	;,
; temp/codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbp), %r8	; class_type_109->name, iftmp.44_94
.L37:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rbx), %rcx	; attr_name_16(D)->name, attr_name_16(D)->name
	movq	%r12, %r9	; index,
	xorl	%eax, %eax	;
	leaq	.LC6(%rip), %rdx	;, tmp146
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	8(%r13), %rdi	; var_125->name, prephitmp_100
.L38:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r8	; index,
	leaq	.LC7(%rip), %rcx	;, tmp147
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L29:
; temp/codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rbx), %rbp	; attr_name_16(D)->type, _7
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%r15), %r12	; status_18(D)->temp_count, _71
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_64->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp180, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r12), %rax	;, tmp148
	movq	%rax, 64(%r15)	; tmp148, status_18(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _77, var_64->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp181, _77
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _71
	je	.L49	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _71,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp151
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L35:
; temp/codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rbx)	; _7, var_64->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp152
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	; var_64->type, tmp152
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp182, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_52->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp152, MEM <vector(2) long unsigned int> [(void *)arg_52]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_52->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; var, tmp154
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	; _101->type, tmp154
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp183, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_40->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp154, MEM <vector(2) long unsigned int> [(void *)arg_40]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_40->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; object, inst_32->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp184, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$15, 24(%rax)	;, inst_32->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; <retval>, inst_32->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; arg, inst_32->arg3
; temp/codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%r15), %rax	; status_18(D)->current_block, status_18(D)->current_block
	movq	8(%rax), %rdi	; _10->instructions, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rbp)	;, arg_52->is_get
.L15:
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
	.p2align 4,,10
	.p2align 3
.L47:
; temp/codegen.c:272:     Symbol* class_type = NULL;
	xorl	%ebp, %ebp	; class_type
	jmp	.L21	;
	.p2align 4,,10
	.p2align 3
.L49:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp150
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L35	;
	.p2align 4,,10
	.p2align 3
.L31:
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %esi	;,
; temp/codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	; attr_name, var_174->original_name
; temp/codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp187, var
; temp/codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	; attr_name_16(D)->type, attr_name_16(D)->type
	movq	%rax, 16(%r13)	; attr_name_16(D)->type, var_174->type
; temp/codegen.c:257:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rax	;, tmp163
	movq	%rax, %rdi	; tmp163,
	movq	%rax, 8(%rsp)	; tmp163, %sfp
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; prephitmp_100, var_174->name
; temp/codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp188, prephitmp_100
	jmp	.L38	;
	.p2align 4,,10
	.p2align 3
.L48:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$97, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp142
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L28	;
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%rdx, %rsi	; status,
	call	load_rvalue.part.0	;
	movq	%rax, %r14	; tmp173, object
; temp/codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	; object
	jne	.L19	;,
; temp/codegen.c:267:         return NULL;
	xorl	%ebp, %ebp	; <retval>
	jmp	.L15	;
	.p2align 4,,10
	.p2align 3
.L40:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
; temp/codegen.c:267:         return NULL;
	xorl	%ebp, %ebp	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC5(%rip), %rdi	;, tmp137
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L15	;
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rsi, %r12	; tmp123, tac
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp124, status
	pushq	%rbx	;
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbx	; import_15(D)->name, _1
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbx), %ecx	; _1->kind, _2
; temp/codegen.c:310:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L62	;,
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp112
; temp/codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp112
	jbe	.L63	;,
; temp/codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L57	;,
; temp/codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp129, table
; temp/codegen.c:15:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rbx, %xmm1	; _1, _1
; temp/codegen.c:17:     table->size = 0;
	movq	$0, 16(%rbp)	;, table_59->size
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%rbp, %rsi	; table,
; temp/codegen.c:15:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp130, tmp118
	punpcklqdq	%xmm1, %xmm0	; _1, tmp118
	movups	%xmm0, 0(%rbp)	; tmp118, MEM <vector(2) long unsigned int> [(void *)table_59]
; temp/codegen.c:318: }
	popq	%rbx	;
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%r12), %rdi	; tac_17(D)->attribute_tables, tac_17(D)->attribute_tables
; temp/codegen.c:318: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L57:
; temp/codegen.c:318: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; temp/codegen.c:318: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC8(%rip), %rdx	;, tmp121
; temp/codegen.c:318: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L63:
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %r14	; _1->type, _7
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp114
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	; _1, var_42->original_name
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rbp), %rbx	; status_19(D)->subroutine_count, _53
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp127, var
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rbx), %rax	;, tmp113
	movq	%rax, 80(%rbp)	; tmp113, status_19(D)->subroutine_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbx, %r9	; _53,
	movl	$102, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _55, var_42->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp128, _55
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	;, _53
	je	.L64	;,
.L60:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp116
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L56:
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%r13)	; _7,
; temp/codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
	movq	%r13, %rsi	; var,
; temp/codegen.c:318: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; temp/codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L62:
; temp/codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rbx), %r14	; _1->type, _3
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp108
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	; _1, var_25->original_name
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbp), %rbx	; status_19(D)->var_count, _30
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp125, var
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rbx), %rax	;, tmp107
	movq	%rax, 56(%rbp)	; tmp107, status_19(D)->var_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$118, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _38, var_25->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp126, _38
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	;, _30
	je	.L61	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbx, %r9	; _30,
	movl	$118, %r8d	;,
	jmp	.L60	;
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$102, %r8d	;,
.L61:
	leaq	.LC2(%rip), %rcx	;, tmp115
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L56	;
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
	pushq	%r15	;
	pushq	%r14	;
	movq	%rdi, %r14	; tmp179, variable
	pushq	%r13	;
	movl	%edx, %r13d	; tmp181, type
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp180, status
	pushq	%rbx	;
	subq	$24, %rsp	;,
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	8(%rdi), %r12	; variable_20(D)->name, _2
	movq	(%rdi), %r15	; variable_20(D)->type, _1
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	; _2, var_34->original_name
; temp/codegen.c:117:     switch (kind) {
	leal	-97(%r13), %r12d	;,
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp182, var
; temp/codegen.c:117:     switch (kind) {
	cmpl	$21, %r12d	;, tmp178
	ja	.L66	;,
	leaq	.L68(%rip), %rdx	;, tmp131
	movl	%r12d, %eax	; tmp178, tmp130
	movslq	(%rdx,%rax,4), %rax	;, tmp133
	addq	%rdx, %rax	; tmp131, tmp134
	jmp	*%rax	; tmp134
	.section	.rodata
	.align 4
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
	.p2align 4,,10
	.p2align 3
.L66:
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp136
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _47, var_34->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp183, _47
.L74:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%r13d, %r8d	; type,
	leaq	.LC2(%rip), %rcx	;, tmp144
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L77:
; temp/codegen.c:131:     var->type = type;
	movq	%r15, 16(%rbx)	; _1, var_34->type
; temp/codegen.c:386:     switch (type) {
	cmpl	$21, %r12d	;, tmp178
	ja	.L78	;,
	leaq	.L80(%rip), %rdx	;, tmp148
	movslq	(%rdx,%r12,4), %rax	;, tmp150
	addq	%rdx, %rax	; tmp148, tmp151
	jmp	*%rax	; tmp151
	.section	.rodata
	.align 4
	.align 4
.L80:
	.long	.L84-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L83-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L82-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L79-.L80
	.long	.L78-.L80
	.long	.L79-.L80
	.text
	.p2align 4,,10
	.p2align 3
.L78:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; temp/codegen.c:410: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r13d, %ecx	; type,
	xorl	%eax, %eax	;
; temp/codegen.c:410: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC10(%rip), %rdx	;, tmp177
; temp/codegen.c:410: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; temp/codegen.c:410: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L79:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbp), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	24(%rax), %rdi	;, _5->local_vars
.L99:
	movq	%rbx, %rsi	; var,
.L100:
; temp/codegen.c:410: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L82:
; temp/codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbp), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	16(%rax), %rdi	;, _3->parameters
	jmp	.L99	;
	.p2align 4,,10
	.p2align 3
.L83:
; temp/codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	0(%rbp), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	16(%rax), %rdi	;, _9->global_vars
	jmp	.L99	;
	.p2align 4,,10
	.p2align 3
.L84:
; temp/codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	0(%rbp), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	(%rax), %rdi	; _11->attribute_tables, _11->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp185, attr_table
; temp/codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_22(D)->tac, status_22(D)->tac
	movq	%r12, %rsi	; attr_table,
	movq	(%rax), %rdi	; _13->attribute_tables, _13->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqu	(%r14), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)]
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
; temp/codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqa	%xmm0, %xmm1	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], vect__15.115
	movq	%xmm0, %rbx	; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], _71
	shufpd	$1, %xmm0, %xmm1	;, MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_20(D)], vect__15.115
	movaps	%xmm1, (%rsp)	; vect__15.115, %sfp
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:34:     attr->var_name = var_name;
	movdqa	(%rsp), %xmm1	; %sfp, vect__15.115
; temp/codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rbp	; tmp186, attr
; temp/codegen.c:34:     attr->var_name = var_name;
	movups	%xmm1, (%rax)	; vect__15.115, MEM <vector(2) long unsigned int> [(struct Symbol * *)attr_51]
; temp/codegen.c:38:         attr->offset = table->size;
	movq	16(%r12), %rax	; attr_table_30->size, _52
; temp/codegen.c:38:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; _52, attr_51->offset
; temp/codegen.c:21:     if (type == NULL)
	testq	%rbx, %rbx	; _71
	je	.L85	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rbx	; name_int, _71
	je	.L97	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rbx	; name_float, _71
	je	.L97	;,
; temp/codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rbx	; name_string, _71
	je	.L97	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rbx	; name_bool, _71
	je	.L98	;,
; temp/codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rbx	; name_void, _71
	je	.L98	;,
; temp/codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movl	32(%rbx), %edx	; _50->kind,
	testl	%edx, %edx	;
	jne	.L91	;,
; temp/codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rbx), %rdx	; _50->ast_node.class, _50->ast_node.class
; temp/codegen.c:39:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	; _64->size, _52
.L85:
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%r12), %rdi	; attr_table_30->attributes, _56
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	%rax, 16(%r12)	; _52, attr_table_30->size
; temp/codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; temp/codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _56
	jne	.L100	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
; temp/codegen.c:410: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
; temp/codegen.c:410: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC9(%rip), %rdi	;, tmp175
; temp/codegen.c:410: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L73:
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rbp), %r9	; status_22(D)->attr_count, id
; temp/codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r9), %rax	;, tmp137
	movq	%rax, 40(%rbp)	; tmp137, status_22(D)->attr_count
	.p2align 4,,10
	.p2align 3
.L75:
	movq	%r9, (%rsp)	; id, %sfp
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp143
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	(%rsp), %r9	; %sfp, id
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _47, var_34->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp184, _47
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, id
	je	.L74	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%r13d, %r8d	; type,
	leaq	.LC3(%rip), %rcx	;, tmp145
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L77	;
	.p2align 4,,10
	.p2align 3
.L72:
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbp), %r9	; status_22(D)->block_count, id
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	;, tmp141
	movq	%rax, 72(%rbp)	; tmp141, status_22(D)->block_count
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L75	;
	.p2align 4,,10
	.p2align 3
.L71:
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rbp), %r9	; status_22(D)->subroutine_count, id
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r9), %rax	;, tmp142
	movq	%rax, 80(%rbp)	; tmp142, status_22(D)->subroutine_count
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L75	;
	.p2align 4,,10
	.p2align 3
.L70:
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rbp), %r9	; status_22(D)->param_count, id
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r9), %rax	;, tmp138
	movq	%rax, 48(%rbp)	; tmp138, status_22(D)->param_count
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L75	;
	.p2align 4,,10
	.p2align 3
.L69:
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbp), %r9	; status_22(D)->temp_count, id
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	;, tmp140
	movq	%rax, 64(%rbp)	; tmp140, status_22(D)->temp_count
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L75	;
	.p2align 4,,10
	.p2align 3
.L67:
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbp), %r9	; status_22(D)->var_count, id
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r9), %rax	;, tmp139
	movq	%rax, 56(%rbp)	; tmp139, status_22(D)->var_count
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L75	;
	.p2align 4,,10
	.p2align 3
.L91:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rbx), %rcx	; _50->name, _50->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC0(%rip), %rdx	;, tmp172
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:39:         table->size += get_type_size(type);
	movq	16(%r12), %rax	; attr_table_30->size, tmp190
.L97:
	addq	$8, %rax	;, _52
; temp/codegen.c:30:     return 8;
	jmp	.L85	;
	.p2align 4,,10
	.p2align 3
.L98:
; temp/codegen.c:39:         table->size += get_type_size(type);
	addq	$1, %rax	;, _52
	jmp	.L85	;
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; temp/codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rdi, %rdi	; variable_access
	je	.L175	;,
	movq	%rsi, %rbp	; tmp358, status
	testq	%rsi, %rsi	; status
	je	.L175	;,
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rdi), %ecx	; variable_access_89(D)->type, _5
	movq	%rdi, %rbx	; tmp357, variable_access
; temp/codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%ecx, %ecx	; _5
	jne	.L105	;,
; temp/codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rdi), %r13	; variable_access_89(D)->content.name, name
; temp/codegen.c:712:         if (name == NULL) {
	testq	%r13, %r13	; name
	je	.L261	;,
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rsi), %rdx	; status_90(D)->current_subroutine, _198
; temp/codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rdx, %rdx	; _198
	je	.L262	;,
; temp/codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rdx), %rcx	; _198->parameters, _198->parameters
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rcx, %rcx	; _198->parameters
	je	.L112	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rcx), %rax	; _199->head, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L112	;,
	.p2align 4,,10
	.p2align 3
.L115:
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	; current_78->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	; var
	je	.L113	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r13	; var_204->original_name, name
	je	.L259	;,
.L113:
; temp/codegen.c:205:         current = current->next;
	movq	(%rax), %rax	; current_78->next, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L115	;,
.L112:
; temp/codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rdx), %rax	; _198->local_vars, _208
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	; _208
	je	.L119	;,
	.p2align 4,,10
	.p2align 3
.L116:
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	;* _208, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L119	;,
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	; current_210->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	; var
	je	.L116	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r13	; var_213->original_name, name
	jne	.L116	;,
	.p2align 4,,10
	.p2align 3
.L259:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp289
	movhps	16(%rbx), %xmm0	;, tmp289
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp367, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp289,* <retval>
.L101:
; temp/codegen.c:833: }
	addq	$8, %rsp	;,
	movq	%r15, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L105:
; temp/codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _5
	je	.L263	;,
; temp/codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _5
	je	.L264	;,
; temp/codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _5
	jne	.L152	;,
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rdi), %rdi	; variable_access_89(D)->base, _45
; temp/codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _45
	je	.L265	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rdi)	;, _45->type
	jne	.L154	;,
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rdi), %r13	; _45->content.attr_name, callee_name
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r13, %r13	; callee_name
	je	.L154	;,
; temp/codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r13), %eax	; _48->kind, tmp405
	subl	$1, %eax	;, tmp322
; temp/codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	;, tmp322
	ja	.L154	;,
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rdi), %rdi	; _45->base, _51
; temp/codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rdi, %rdi	; _51
	je	.L174	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	16(%rdi), %edx	; _51->type,
	testl	%edx, %edx	;
	jne	.L156	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rdi), %rax	; _51->content.name, _53
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	; _53
	je	.L156	;,
; temp/codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	; _53->kind,
	testl	%eax, %eax	;
	je	.L174	;,
.L156:
; temp/codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rbp, %rsi	; status,
	call	codegen_variable_access	;
	movq	%rax, %rdi	; tmp380, receiver
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; receiver
	je	.L174	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _55->is_get
	jne	.L266	;,
.L157:
	movq	%rbp, %rsi	; status,
; temp/codegen.c:807:             ++argument_count;
	movl	$1, %r12d	;, argument_count
	call	emit_param_instruction.part.0	;
.L158:
; temp/codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbx), %rdi	; variable_access_89(D)->content.args, variable_access_89(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp383, args
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L162	;
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%rbp, %rsi	; status,
; temp/codegen.c:818:             ++argument_count;
	addq	$1, %r12	;, argument_count
	call	emit_param_instruction.part.0	;
.L162:
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbx, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp386, arg_expr
; temp/codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L267	;,
; temp/codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %rdi	; tmp384, _65
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; _65
	je	.L165	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _65->is_get
	je	.L164	;,
	movq	%rbp, %rsi	; status,
	call	load_rvalue.part.0	;
	movq	%rax, %rdi	; tmp385, _65
; temp/codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	; _65
	jne	.L164	;,
	.p2align 4,,10
	.p2align 3
.L165:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp332
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:815:                 return NULL;
	jmp	.L104	;
	.p2align 4,,10
	.p2align 3
.L264:
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rdi), %rdi	; variable_access_89(D)->base, _28
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rdi, %rdi	; _28
	je	.L143	;,
; temp/codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rbx)	;, variable_access_89(D)->content.index
	je	.L143	;,
; temp/codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	;
	movq	%rax, %r12	; tmp372, _31
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; _31
	je	.L145	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _31->is_get
	jne	.L268	;,
.L145:
; temp/codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rbx), %rdi	; variable_access_89(D)->content.index, variable_access_89(D)->content.index
	movq	%rbp, %rsi	; status,
	call	codegen_expression	;
	movq	%rax, %r13	; tmp374, _33
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; _33
	je	.L148	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _33->is_get
	jne	.L269	;,
.L147:
; temp/codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%r12, %r12	; _31
	je	.L148	;,
	testq	%r13, %r13	; _33
	je	.L148	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%r12), %r14	; _156->type, _38
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_float(%rip), %r14	; name_float, _38
; temp/codegen.c:755:         Symbol* element_type = name_int;
	movq	name_int(%rip), %rax	; name_int, element_type
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	je	.L149	;,
; temp/codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	name_bool(%rip), %r14	; name_bool, _38
	je	.L149	;,
; temp/codegen.c:755:         Symbol* element_type = name_int;
	cmpq	name_string(%rip), %r14	; name_string, _38
	cmovne	%rax, %r14	; _38,, element_type, _38
.L149:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbp), %r15	; status_90(D)->temp_count, _369
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp313
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_362->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp376, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	;, tmp312
	movq	%rax, 64(%rbp)	; tmp312, status_90(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _375, var_362->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp377, _375
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	;, _369
	je	.L270	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _369,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp315
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L151:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%rbx)	; _38, var_362->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp316
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	; var_362->type, tmp316
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp378, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_350->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp316, MEM <vector(2) long unsigned int> [(void *)arg_350]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_350->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; _31, inst_157->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp379, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$16, 24(%rax)	;, inst_157->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; <retval>, inst_157->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; _33, inst_157->arg3
; temp/codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_90(D)->current_block, status_90(D)->current_block
	movq	8(%rax), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:761:         result->is_get = true;
	movb	$1, 20(%r15)	;, arg_350->is_get
; temp/codegen.c:762:         return result;
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L154:
; temp/codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rbp, %rsi	; status,
	call	codegen_variable_access	;
; temp/codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	; callee
	je	.L271	;,
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %edx	; callee_94->kind, _57
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %edx	;, _57
	je	.L272	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%edx, %edx	; _57
	jne	.L161	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	; callee_94->value.variable, _59
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	; _59
	je	.L161	;,
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r13	; _59->original_name, callee_name
; temp/codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r13, %r13	; callee_name
	je	.L161	;,
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r13), %eax	; _60->kind, tmp406
	subl	$1, %eax	;, tmp326
; temp/codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp326
	jbe	.L174	;,
	.p2align 4,,10
	.p2align 3
.L161:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp329
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:801:             return NULL;
	jmp	.L104	;
	.p2align 4,,10
	.p2align 3
.L263:
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rdi), %rdi	; variable_access_89(D)->base, _20
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rdi, %rdi	; _20
	je	.L136	;,
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rbx), %rbx	; variable_access_89(D)->content.attr_name, _21
; temp/codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rbx, %rbx	; _21
	je	.L136	;,
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rbx), %eax	; _21->kind, tmp402
	subl	$1, %eax	;, tmp293
; temp/codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	;, tmp293
	jbe	.L273	;,
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	;
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rbp, %rdx	; status,
	movq	%rbx, %rsi	; _21,
; temp/codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	movq	%rax, %rdi	; tmp371, object
; temp/codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	; object
	je	.L274	;,
.L260:
; temp/codegen.c:833: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; temp/codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	jmp	emit_attribute_access	;
	.p2align 4,,10
	.p2align 3
.L262:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	; status_90(D)->tac, status_90(D)->tac
	movq	16(%rax), %rax	; _349->global_vars, _219
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	; _219
	je	.L253	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	; _219->head, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L253	;,
	.p2align 4,,10
	.p2align 3
.L125:
; temp/codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	; current_201->content, var
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	; var
	je	.L124	;,
; temp/codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r13	; var_223->original_name, name
	je	.L259	;,
.L124:
; temp/codegen.c:205:         current = current->next;
	movq	(%rax), %rax	; current_201->next, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L125	;,
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r13)	;, name_136->kind
	jbe	.L110	;,
; temp/codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rdx, %rdx	; _198
	je	.L111	;,
	movq	16(%rdx), %rcx	; _198->parameters, _198->parameters
.L118:
; temp/codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	(%rcx), %rbx	; _269->head, current
; temp/codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L111	;,
	.p2align 4,,10
	.p2align 3
.L130:
; temp/codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%rbx), %r12	; current_599->content, var
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%r12, %r12	; var
	je	.L131	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%r12), %rax	; var_272->original_name, _273
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	; _273
	je	.L131	;,
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	8(%rax), %rdi	; _273->name, _273->name
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	*string_equal@GOTPCREL(%rip)	;
; temp/codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	; tmp363
	jne	.L275	;,
.L131:
; temp/codegen.c:232:         current = current->next;
	movq	(%rbx), %rbx	; current_599->next, current
; temp/codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L130	;,
.L111:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r13), %rcx	; name_136->name, name_136->name
	leaq	.LC13(%rip), %rdx	;, tmp284
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	0(%r13), %r12	; name_136->type, _18
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp286
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r13, (%rax)	; name, var_304->original_name
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbp), %r13	; status_90(D)->var_count, _309
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp365, var
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r13), %rax	;, tmp285
	movq	%rax, 56(%rbp)	; tmp285, status_90(D)->var_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _317, var_304->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp366, _317
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _309
	je	.L276	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _309,
	movl	$118, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp288
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L134:
; temp/codegen.c:131:     var->type = type;
	movq	%r12, 16(%rbx)	; _18, var_304->type
	jmp	.L259	;
	.p2align 4,,10
	.p2align 3
.L275:
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%r12), %rax	; var_272->type, _10
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	; _10
	je	.L111	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movl	32(%rax), %ecx	; _10->kind,
	testl	%ecx, %ecx	;
	jne	.L111	;,
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	; _10->ast_node.class, _10->ast_node.class
; temp/codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	; _13->class_scope, tmp399
	cmpq	%rax, 24(%r13)	; tmp399, name_136->ast_node.scope
	jne	.L111	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; var, tmp280
; temp/codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; name,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; var_272->type, tmp280
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_280->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	; tmp364, arg
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_280->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp280, MEM <vector(2) long unsigned int> [(void *)arg_280]
	jmp	.L260	;
	.p2align 4,,10
	.p2align 3
.L175:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$40, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp261
	call	*fwrite@GOTPCREL(%rip)	;
.L104:
; temp/codegen.c:708:         return NULL;
	xorl	%r15d, %r15d	; <retval>
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L253:
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r13)	;, name_136->kind
	ja	.L111	;,
	.p2align 4,,10
	.p2align 3
.L110:
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	0(%r13), %r12	; name_136->type, _8
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp270
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r13, (%rax)	; name, var_251->original_name
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rbp), %r13	; status_90(D)->subroutine_count, _262
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp360, var
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r13), %rax	;, tmp269
	movq	%rax, 80(%rbp)	; tmp269, status_90(D)->subroutine_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _264, var_251->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp361, _264
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _262
	je	.L277	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _262,
	movl	$102, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp272
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L128:
; temp/codegen.c:131:     var->type = type;
	movq	%r12, 16(%rbx)	; _8, var_251->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp273
	movhps	16(%rbx), %xmm0	;, tmp273
; temp/codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	;, arg_239->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp362, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp273,* <retval>
; temp/codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L119:
; temp/codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	0(%rbp), %rax	; status_90(D)->tac, status_90(D)->tac
	movq	16(%rax), %rax	;, _218
; temp/codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	; _218
	je	.L122	;,
; temp/codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	;* _418, current
; temp/codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L125	;,
.L122:
; temp/codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r13)	;, name_136->kind
	ja	.L118	;,
	jmp	.L110	;
	.p2align 4,,10
	.p2align 3
.L152:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC22(%rip), %rdx	;, tmp353
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; temp/codegen.c:832:     return NULL;
	jmp	.L104	;
	.p2align 4,,10
	.p2align 3
.L276:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$118, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp287
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L134	;
	.p2align 4,,10
	.p2align 3
.L270:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp314
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L151	;
	.p2align 4,,10
	.p2align 3
.L261:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp263
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:714:             return NULL;
	jmp	.L104	;
	.p2align 4,,10
	.p2align 3
.L273:
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %r13	; _21->type, _25
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp296
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	; _21, var_333->original_name
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rbp), %rbx	; status_90(D)->subroutine_count, _344
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp368, var
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rbx), %rax	;, tmp295
	movq	%rax, 80(%rbp)	; tmp295, status_90(D)->subroutine_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _346, var_333->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp369, _346
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	;, _344
	je	.L278	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbx, %r9	; _344,
	movl	$102, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp298
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L140:
; temp/codegen.c:131:     var->type = type;
	movq	%r13, 16(%r12)	; _25, var_333->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%r12, %xmm0	; var, tmp299
	movhps	16(%r12), %xmm0	; var_333->type, tmp299
; temp/codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	;, arg_321->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp370, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp299,* <retval>
; temp/codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L272:
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rax), %rax	; callee_94->value.subroutine, _58
; temp/codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	; _58
	je	.L161	;,
; temp/codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r13	; _58->original_name, callee_name
; temp/codegen.c:799:         if (callee_name == NULL) {
	testq	%r13, %r13	; callee_name
	je	.L161	;,
.L174:
; temp/codegen.c:804:         size_t argument_count = 0;
	xorl	%r12d, %r12d	; argument_count
	jmp	.L158	;
	.p2align 4,,10
	.p2align 3
.L267:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp387, <retval>
; temp/codegen.c:144:     arg->kind = kind;
	movl	$5, 16(%rax)	;, arg_379->kind
; temp/codegen.c:168:             arg->value.string_value = NULL;
	movq	$0, (%rax)	;, arg_379->value.string_value
; temp/codegen.c:169:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void.17_388
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r15)	;, arg_379->is_get
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	0(%r13), %r14	; callee_name_137->type, _67
; temp/codegen.c:169:             arg->type = name_void;
	movq	%rax, 8(%r15)	; name_void.17_388, arg_379->type
; temp/codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	%rax, %r14	; name_void.17_388, _67
	je	.L167	;,
	testq	%r14, %r14	; _67
	je	.L167	;,
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbp), %r15	; status_90(D)->temp_count, _410
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_403->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp388, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	;, tmp337
	movq	%rax, 64(%rbp)	; tmp337, status_90(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _416, var_403->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp389, _416
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	;, _410
	je	.L279	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _410,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp340
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L169:
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%rbx)	; _67, var_403->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp341
	movhps	16(%rbx), %xmm0	; var_403->type, tmp341
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_391->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp390, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_391->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp341, MEM <vector(2) long unsigned int> [(void *)arg_391]
; temp/codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	0(%r13), %r14	; callee_name_137->type, _67
.L167:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r13, (%rax)	; callee_name, var_444->original_name
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rbp), %r13	; status_90(D)->subroutine_count, _455
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp391, var
; temp/codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r13), %rax	;, tmp343
	movq	%rax, 80(%rbp)	; tmp343, status_90(D)->subroutine_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _457, var_444->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp392, _457
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _455
	je	.L280	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _455,
	movl	$102, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp346
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L171:
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%rbx)	; _67, var_444->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp347
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movhps	16(%rbx), %xmm0	; var_444->type, tmp347
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp393, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	;, arg_432->kind
; temp/codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp347, MEM <vector(2) long unsigned int> [(void *)arg_432]
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_432->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	; argument_count, arg_420->value.int_value
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp394, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_420->kind
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;, arg_420->is_get
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int, arg_420->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_163->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp395, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; <retval>, inst_163->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; arg, inst_163->arg3
; temp/codegen.c:136:     inst->type = type;
	movl	$22, 24(%rax)	;, inst_163->type
; temp/codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rbp), %rax	; status_90(D)->current_block, status_90(D)->current_block
	movq	8(%rax), %rdi	; _74->instructions, _74->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:828:         return result;
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L277:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$102, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp271
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L128	;
.L143:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp304
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:747:             return NULL;
	jmp	.L104	;
.L136:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$39, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rdi	;, tmp292
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:731:             return NULL;
	jmp	.L104	;
.L269:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _33,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp375, _33
	jmp	.L147	;
.L268:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _31,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp373, _31
	jmp	.L145	;
.L274:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$61, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp302
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:739:             return NULL;
	jmp	.L104	;
.L265:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rdi	;, tmp321
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:768:             return NULL;
	jmp	.L104	;
.L148:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$68, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp307
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:753:             return NULL;
	jmp	.L104	;
.L278:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$102, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp297
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L140	;
.L280:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$102, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp345
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L171	;
.L271:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp325
	call	*fwrite@GOTPCREL(%rip)	;
; temp/codegen.c:789:                 return NULL;
	jmp	.L104	;
.L279:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp339
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L169	;
.L266:
	movq	%rbp, %rsi	; status,
	call	load_rvalue.part.0	;
	movq	%rax, %rdi	; tmp381, receiver
; temp/codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	; receiver
	jne	.L157	;,
	jmp	.L174	;
	.size	codegen_variable_access, .-codegen_variable_access
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC25:
	.string	"[warning] Unsupported primary type for codegen_primary: %d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB26:
	.text
.LHOTB26:
	.p2align 4
	.globl	codegen_primary
	.type	codegen_primary, @function
codegen_primary:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; temp/codegen.c:655:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; temp/codegen.c:655:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L282	;,
	leaq	.L284(%rip), %rdx	;, tmp143
	movq	%rsi, %rbp	; tmp187, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp145
	addq	%rdx, %rax	; tmp143, tmp146
	jmp	*%rax	; tmp146
	.section	.rodata
	.align 4
	.align 4
.L284:
	.long	.L292-.L284
	.long	.L291-.L284
	.long	.L290-.L284
	.long	.L289-.L284
	.long	.L288-.L284
	.long	.L287-.L284
	.long	.L286-.L284
	.long	.L285-.L284
	.long	.L283-.L284
	.text
	.p2align 4,,10
	.p2align 3
.L285:
; temp/codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	codegen_primary	;
	movq	%rax, %r13	; tmp201, _15
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; _15
	je	.L297	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _15->is_get
	jne	.L309	;,
.L298:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%r13), %rbx	; _84->type, _16
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbp), %r14	; status_37(D)->temp_count, _216
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp168
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_209->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp203, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	;, tmp167
	movq	%rax, 64(%rbp)	; tmp167, status_37(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _222, var_209->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp204, _222
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _216
	je	.L310	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _216,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp170
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L300:
; temp/codegen.c:131:     var->type = type;
	movq	%rbx, 16(%r12)	; _16, var_209->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; var, tmp171
	movhps	16(%r12), %xmm0	; var_209->type, tmp171
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_197->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp205, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_197->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp171, MEM <vector(2) long unsigned int> [(void *)arg_197]
; temp/codegen.c:687:             if (operand->type == name_int)
	movq	8(%r13), %rax	; _84->type, _18
; temp/codegen.c:687:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L311	;,
; temp/codegen.c:689:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L312	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; temp/codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC24(%rip), %rdx	;, tmp178
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L315:
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L283:
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.var
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; temp/codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	jmp	codegen_variable_access	;
	.p2align 4,,10
	.p2align 3
.L292:
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	xorl	%esi, %esi	;
	call	*strtoll@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rbp	; tmp188, _3
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_108->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp189, <retval>
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; _3, arg_108->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int,
.L281:
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L291:
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
	movl	$2, 16(%rax)	;, arg_120->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp191, <retval>
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _5, arg_120->value.float_value
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:157:             arg->type = name_float;
	movq	%rax, 8(%rbx)	; name_float,
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L290:
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
	movl	$3, 16(%rax)	;, arg_132->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp192, <retval>
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movhps	name_string(%rip), %xmm0	; name_string, tmp152
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:160:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rax)	; tmp152, MEM <vector(2) long unsigned int> [(void *)arg_132]
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L289:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_144->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp193, <retval>
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	;, arg_144->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L288:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_156->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp194, <retval>
; temp/codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	;, arg_156->value.bool_value
; temp/codegen.c:165:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; temp/codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L287:
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; temp/codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	jmp	codegen_expression	;
	.p2align 4,,10
	.p2align 3
.L286:
; temp/codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	codegen_primary	;
	movq	%rax, %r13	; tmp195, _9
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; _9
	je	.L294	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L313	;,
.L294:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	name_bool(%rip), %rbx	; name_bool, name_bool.20_10
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbp), %r14	; status_37(D)->temp_count, _187
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp159
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_180->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp197, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	;, tmp158
	movq	%rax, 64(%rbp)	; tmp158, status_37(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _193, var_180->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp198, _193
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _187
	je	.L314	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _187,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp161
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L296:
; temp/codegen.c:131:     var->type = type;
	movq	%rbx, 16(%r12)	; name_bool.20_10, var_180->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; var, tmp162
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; var_180->type, tmp162
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp199, <retval>
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_168->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp162, MEM <vector(2) long unsigned int> [(void *)arg_168]
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_168->kind
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; _9, inst_78->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp200, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_78->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$13, 24(%rax)	;, inst_78->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_78->arg3
; temp/codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:703: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L282:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; temp/codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC25(%rip), %rdx	;, tmp183
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L315	;
	.p2align 4,,10
	.p2align 3
.L312:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_238->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp208, arg
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	.LC23(%rip), %rax	;, tmp213
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_238->is_get
; temp/codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	%rax, (%r12)	; tmp213, arg_238->value.float_value
; temp/codegen.c:157:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%r12)	; name_float, arg_238->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$2, 24(%rax)	;, inst_86->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp209, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg,
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; _15,
.L302:
; temp/codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:696:             return temp;
	jmp	.L281	;
	.p2align 4,,10
	.p2align 3
.L310:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp169
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L300	;
	.p2align 4,,10
	.p2align 3
.L314:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp160
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L296	;
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _9,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp196, _9
	jmp	.L294	;
	.p2align 4,,10
	.p2align 3
.L309:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _15,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp202, _15
	jmp	.L298	;
	.p2align 4,,10
	.p2align 3
.L311:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_226->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp206, arg
; temp/codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_226->value.int_value
; temp/codegen.c:153:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_226->is_get
; temp/codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%r12)	; name_int, arg_226->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$1, 24(%rax)	;, inst_85->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp207, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg,
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; _15,
	jmp	.L302	;
	.section	.text.unlikely
	.type	codegen_primary.cold, @function
codegen_primary.cold:
.L297:
; temp/codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _340
	ud2	
	.text
	.size	codegen_primary, .-codegen_primary
	.section	.text.unlikely
	.size	codegen_primary.cold, .-codegen_primary.cold
.LCOLDE26:
	.text
.LHOTE26:
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	codegen_expression
	.type	codegen_expression, @function
codegen_expression:
	pushq	%r15	;
	pushq	%r14	;
	movq	%rdi, %r14	; tmp156, expression
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp157, status
	subq	$24, %rsp	;,
; temp/codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rdi)	;, expression_28(D)->operator
	je	.L341	;,
; temp/codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_28(D)->right, expression_28(D)->right
	call	codegen_expression	;
	movq	%rax, %rbp	; tmp158, <retval>
; temp/codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	; <retval>
	je	.L318	;,
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _4->is_get
	jne	.L342	;,
.L318:
; temp/codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r14), %eax	; expression_28(D)->operator,
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%r14), %rdi	; expression_28(D)->expr_left, pretmp_112
	cmpl	$18, %eax	;, _5
	ja	.L319	;,
	leaq	CSWTCH.51(%rip), %rdx	;, tmp131
	movq	%rbx, %rsi	; status,
	movl	(%rdx,%rax,4), %r13d	; CSWTCH.51[_5], _44
	call	codegen_expression	;
	movq	%rax, %r12	; tmp160, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r14), %eax	; expression_28(D)->operator, expression_28(D)->operator
	subl	$13, %eax	;, tmp133
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp133
	ja	.L320	;,
; temp/codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	;, _44
	jne	.L330	;,
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	; left_36->kind,
	testl	%eax, %eax	;
	jne	.L343	;,
.L325:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_53->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp166, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; left, inst_53->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_53->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_53->arg3
; temp/codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%r12)	;, left_36->is_get
	jne	.L344	;,
.L326:
; temp/codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_29(D)->current_block, status_29(D)->current_block
	movq	8(%rax), %rdi	; _17->instructions, _17->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:653: }
	addq	$24, %rsp	;,
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
.L319:
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	;, _44
; temp/codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	call	codegen_expression	;
	movq	%rax, %r12	; tmp173, left
; temp/codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r14), %eax	; expression_28(D)->operator, expression_28(D)->operator
	subl	$13, %eax	;, tmp154
; temp/codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp154
	ja	.L320	;,
.L330:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %r15	; left_177->type, _8
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbx), %r9	; status_29(D)->temp_count, _105
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp136
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_98->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	; tmp161, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	;, tmp135
	movq	%r9, 8(%rsp)	; _105, %sfp
	movq	%rax, 64(%rbx)	; tmp135, status_29(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	8(%rsp), %r9	; %sfp, _105
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	; _111, var_98->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp162, _111
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, _105
	je	.L345	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp138
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L323:
; temp/codegen.c:131:     var->type = type;
	movq	%r15, 16(%r14)	; _8, var_98->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; var, tmp139
	movhps	16(%r14), %xmm0	; var_98->type, tmp139
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_86->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp163, arg
; temp/codegen.c:194:     return arg;
	movq	%r12, %r14	; left, _51
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_86->kind
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp139, MEM <vector(2) long unsigned int> [(void *)arg_86]
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%r12)	;, left_177->is_get
	jne	.L346	;,
.L324:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; _51, inst_49->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp165, inst
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_49->arg3
; temp/codegen.c:639:             right = temp;
	movq	%r15, %rbp	; arg, <retval>
; temp/codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	; _44, inst_49->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; arg, inst_49->arg1
; temp/codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_29(D)->current_block, status_29(D)->current_block
	movq	8(%rax), %rdi	; _10->instructions, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	; left_36->kind,
	testl	%eax, %eax	;
	je	.L325	;,
.L343:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rdi	;, tmp144
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L325	;
	.p2align 4,,10
	.p2align 3
.L320:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %r15	; left_154->type, _15
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbx), %r9	; status_29(D)->temp_count, _134
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;, tmp146
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_127->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	; tmp168, var
; temp/codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	;, tmp145
	movq	%r9, 8(%rsp)	; _134, %sfp
	movq	%rax, 64(%rbx)	; tmp145, status_29(D)->temp_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	8(%rsp), %r9	; %sfp, _134
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	; _140, var_127->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp169, _140
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, _134
	je	.L347	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp148
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L328:
; temp/codegen.c:131:     var->type = type;
	movq	%r15, 16(%r14)	; _15, var_127->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; var, tmp149
	movhps	16(%r14), %xmm0	; var_127->type, tmp149
; temp/codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_115->kind
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp170, arg
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_115->is_get
; temp/codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp149, MEM <vector(2) long unsigned int> [(void *)arg_115]
; temp/codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%r12)	;, left_154->is_get
	jne	.L348	;,
.L329:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_55->arg3
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp172, inst
; temp/codegen.c:649:         right = temp;
	movq	%r15, %rbp	; arg, <retval>
; temp/codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	; _44, inst_55->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; arg, inst_55->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; left, inst_55->arg2
	jmp	.L326	;
	.p2align 4,,10
	.p2align 3
.L341:
; temp/codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_28(D)->prim_left, expression_28(D)->prim_left
; temp/codegen.c:653: }
	addq	$24, %rsp	;,
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
.L347:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp147
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L328	;
	.p2align 4,,10
	.p2align 3
.L345:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp137
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L323	;
	.p2align 4,,10
	.p2align 3
.L344:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$24, 24(%rax)	;, inst_54->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp167, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; left, inst_54->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_54->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_54->arg3
	jmp	.L326	;
	.p2align 4,,10
	.p2align 3
.L342:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; <retval>,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp159, <retval>
	jmp	.L318	;
	.p2align 4,,10
	.p2align 3
.L348:
	movq	%r12, %rdi	; left,
	movq	%rbx, %rsi	; status,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp171, left
	jmp	.L329	;
	.p2align 4,,10
	.p2align 3
.L346:
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue.part.0	;
	movq	%rax, %r14	; tmp164, _51
	jmp	.L324	;
	.size	codegen_expression, .-codegen_expression
	.p2align 4
	.globl	codegen_if
	.type	codegen_if, @function
codegen_if:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp224, if_
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp225, status
	subq	$56, %rsp	;,
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rbp	; status_52(D)->block_count, _225
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_216->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp226, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	;, tmp170
	movq	%rax, 72(%rbx)	; tmp170, status_52(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _229, var_216->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp227, _229
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	;, _225
	je	.L383	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbp, %r9	; _225,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp173
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L351:
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	;, var_216->type
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r13	; status_52(D)->block_count, _208
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_199->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	; tmp228, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r13), %rax	;, tmp174
	movq	%rax, 72(%rbx)	; tmp174, status_52(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _212, var_199->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp229, _212
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _208
	je	.L384	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _208,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp177
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L353:
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%rbp)	;, var_199->type
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r15), %rdi	; if__57(D)->else_if, if__57(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp230
	je	.L358	;,
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__57(D)->else_body, if__57(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:457:         end_label = else_label;
	movq	%rbp, 32(%rsp)	; var, %sfp
; temp/codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp233
	je	.L358	;,
.L357:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	32(%rsp), %rdx	; %sfp, var
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rbx, %rsi	; status,
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_114->is_get
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	(%r15), %rdi	; if__57(D)->condition, if__57(D)->condition
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdx, (%rax)	; var, arg_114->value.label
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_114->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_114->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, 24(%rsp)	; arg, %sfp
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	call	codegen_expression	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp236, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_113->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_113->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; var, arg_113->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_113->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; var, arg_112->value.label
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp237, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_112->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_112->type
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_112->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	8(%rsp), %rdx	; %sfp, condition
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp238, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; arg, inst_111->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rdx, (%rax)	; condition, inst_111->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; arg, inst_111->arg3
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_111->type
; temp/codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _6->instructions, _6->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp239, block
; temp/codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	; var, block_109->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp240, block_109->instructions
; temp/codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _8->blocks, _8->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:468:     status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_52(D)->current_block
; temp/codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r15), %rdi	; if__57(D)->body, if__57(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp241, then_statements
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L360	;
	.p2align 4,,10
	.p2align 3
.L361:
; temp/codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L360:
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp242, statement
; temp/codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L361	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_115->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp243, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	24(%rsp), %rax	; %sfp, arg
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;, inst_115->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rax, (%rsi)	; arg, inst_115->arg1
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;, inst_115->arg3
; temp/codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r15), %rdi	; if__57(D)->else_if, if__57(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp244
	je	.L385	;,
.L362:
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r15), %rdi	; if__57(D)->else_body, if__57(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp264
	je	.L386	;,
.L373:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp270, block
; temp/codegen.c:109:     block->label = label;
	movq	32(%rsp), %rax	; %sfp, var
	movq	%rax, 0(%rbp)	; var, block_127->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp271, block_127->instructions
; temp/codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _36->blocks, _36->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:528:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_52(D)->current_block
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
.L358:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r13	; status_52(D)->block_count, _242
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_233->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	; tmp231, var
	movq	%rax, 32(%rsp)	; var, %sfp
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r13), %rax	;, tmp179
	movq	%rax, 72(%rbx)	; tmp179, status_52(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	; _246, var_233->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp232, _246
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _242
	je	.L387	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _242,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp183
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L359:
; temp/codegen.c:131:     var->type = type;
	movq	32(%rsp), %rax	; %sfp, var
	movq	$0, 16(%rax)	;, var_233->type
	jmp	.L357	;
	.p2align 4,,10
	.p2align 3
.L387:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp182
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L359	;
	.p2align 4,,10
	.p2align 3
.L384:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp176
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L353	;
	.p2align 4,,10
	.p2align 3
.L383:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp172
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L351	;
	.p2align 4,,10
	.p2align 3
.L386:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp265, block
; temp/codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	; var, block_124->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp266, block_124->instructions
; temp/codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _31->blocks, _31->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:515:         status->current_block = else_block;
	movq	%r12, 16(%rbx)	; block, status_52(D)->current_block
; temp/codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; if__57(D)->else_body, if__57(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp267, else_statements
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L374	;
	.p2align 4,,10
	.p2align 3
.L375:
; temp/codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L374:
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp268, else_statement
; temp/codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L375	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp269, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_126->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	24(%rsp), %rax	; %sfp, arg
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;, inst_126->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rax, (%rsi)	; arg, inst_126->arg1
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;, inst_126->arg3
; temp/codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rdi	; _34->instructions, _34->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L373	;
	.p2align 4,,10
	.p2align 3
.L385:
; temp/codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; if__57(D)->else_if, if__57(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%r15, 40(%rsp)	; if_, %sfp
	movq	%rax, 8(%rsp)	; tmp245, %sfp
	.p2align 4,,10
	.p2align 3
.L363:
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp263, elif
; temp/codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L388	;,
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp246, block
; temp/codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	; var, block_116->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp247, block_116->instructions
; temp/codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _16->blocks, _16->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:486:             status->current_block = else_if_block;
	movq	%r12, 16(%rbx)	; block, status_52(D)->current_block
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rbp	; status_52(D)->block_count, _276
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_267->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp248, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	;, tmp196
	movq	%rax, 72(%rbx)	; tmp196, status_52(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _280, var_267->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp249, _280
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	;, _276
	je	.L389	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbp, %r9	; _276,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L365:
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	;, var_267->type
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r14	; status_52(D)->block_count, _259
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_250->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	; tmp250, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	;, tmp200
	movq	%rax, 72(%rbx)	; tmp200, status_52(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _263, var_250->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp251, _263
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _259
	je	.L390	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _259,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L367:
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%rbp)	;, var_250->type
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	0(%r13), %rdi	; elif_77->condition, elif_77->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	8(%rsp), %rdi	; %sfp,
; temp/codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	%rax, %r14	; tmp252, condition
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp253
	jne	.L391	;,
.L369:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp255, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_122->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_122->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; var, arg_122->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_122->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; var, arg_121->value.label
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_121->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_121->type
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_121->is_get
	movq	%rax, 16(%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	16(%rsp), %rcx	; %sfp, arg
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp257, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; condition, inst_120->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_120->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_120->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	; arg, inst_120->arg3
; temp/codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _22->instructions, _22->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp258, block
; temp/codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	; var, block_118->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r14, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r14)	; tmp259, block_118->instructions
; temp/codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _24->blocks, _24->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:499:             status->current_block = then_block;
	movq	%r14, 16(%rbx)	; block, status_52(D)->current_block
; temp/codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r13), %rdi	; elif_77->body, elif_77->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp260, elif_statements
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L370	;
	.p2align 4,,10
	.p2align 3
.L371:
; temp/codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L370:
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp261, elif_statement
; temp/codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L371	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp262, inst
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_123->type
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	24(%rsp), %rax	; %sfp, arg
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;, inst_123->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rax, (%rsi)	; arg, inst_123->arg1
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;, inst_123->arg3
; temp/codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	8(%rax), %rdi	; _27->instructions, _27->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L363	;
	.p2align 4,,10
	.p2align 3
.L390:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L367	;
	.p2align 4,,10
	.p2align 3
.L389:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L365	;
	.p2align 4,,10
	.p2align 3
.L391:
; temp/codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	40(%rsp), %rax	; %sfp, if_
	movq	24(%rax), %rdi	; if__57(D)->else_body, if__57(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:493:                 else_label = end_label;
	testb	%al, %al	; tmp254
	cmovne	32(%rsp), %rbp	; var,, %sfp, var
	jmp	.L369	;
	.p2align 4,,10
	.p2align 3
.L388:
	movq	40(%rsp), %r15	; %sfp, if_
	jmp	.L362	;
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
	.p2align 4
	.globl	codegen_statement
	.type	codegen_statement, @function
codegen_statement:
; temp/codegen.c:412:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_27(D)->type,
; temp/codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L393	;,
; temp/codegen.c:411: void codegen_statement(Statement* statement, TACStatus* status) {
	pushq	%r13	;
; temp/codegen.c:412:     switch (statement->type) {
	leaq	.L395(%rip), %rdx	;, tmp123
; temp/codegen.c:411: void codegen_statement(Statement* statement, TACStatus* status) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp158, status
	subq	$8, %rsp	;,
; temp/codegen.c:412:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp125
	addq	%rdx, %rax	; tmp123, tmp126
	jmp	*%rax	; tmp126
	.section	.rodata
	.align 4
	.align 4
.L395:
	.long	.L402-.L395
	.long	.L401-.L395
	.long	.L400-.L395
	.long	.L399-.L395
	.long	.L398-.L395
	.long	.L397-.L395
	.long	.L396-.L395
	.long	.L394-.L395
	.text
	.p2align 4,,10
	.p2align 3
.L396:
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp163
	jne	.L405	;,
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rbx), %rax	; status_28(D)->end_labels, status_28(D)->end_labels
; temp/codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _12->tail, _12->tail
	movq	8(%rax), %rbp	; _13->content, label
; temp/codegen.c:427:                 if (label != NULL) {
	testq	%rbp, %rbp	; label
	je	.L405	;,
.L419:
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;,
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp166, inst
	jmp	.L417	;
	.p2align 4,,10
	.p2align 3
.L394:
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; temp/codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp165
	jne	.L406	;,
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rbx), %rax	; status_28(D)->start_labels, status_28(D)->start_labels
; temp/codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _19->tail, _19->tail
	movq	8(%rax), %rbp	; _20->content, label
; temp/codegen.c:438:                 if (label != NULL) {
	testq	%rbp, %rbp	; label
	jne	.L419	;,
.L406:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rdi	;, tmp154
	jmp	.L418	;
	.p2align 4,,10
	.p2align 3
.L400:
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.if_stmt, statement_27(D)->stmt.if_stmt
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	codegen_if	;
	.p2align 4,,10
	.p2align 3
.L402:
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.expr, statement_27(D)->stmt.expr
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	codegen_expression	;
	.p2align 4,,10
	.p2align 3
.L401:
; temp/codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rdi), %rax	; statement_27(D)->stmt.var, _3
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	8(%rax), %r12	; _3->name, _65
	movq	(%rax), %r13	; _3->type, _64
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;, tmp130
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	; _65, var_83->original_name
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbx), %r12	; status_28(D)->var_count, _88
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	; tmp159, var
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	;, tmp129
	movq	%rax, 56(%rbx)	; tmp129, status_28(D)->var_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _96, var_83->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp160, _96
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _88
	je	.L420	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _88,
	movl	$118, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp132
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L404:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
; temp/codegen.c:131:     var->type = type;
	movq	%r13, 16(%rbp)	; _64, var_83->type
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rbp, %rsi	; var,
	movq	24(%rax), %rdi	; _69->local_vars, _69->local_vars
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L398:
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.for_stmt, statement_27(D)->stmt.for_stmt
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	codegen_for	;
	.p2align 4,,10
	.p2align 3
.L397:
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rdi), %rdi	; statement_27(D)->stmt.return_expr, statement_27(D)->stmt.return_expr
	call	codegen_expression	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	%rax, %rbp	; tmp161, return_value
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$21, 24(%rax)	;, inst_43->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp162, inst
.L417:
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rsi)	; return_value,* inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;,
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;,
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rdi	;, _8->instructions
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L399:
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_27(D)->stmt.while_stmt, statement_27(D)->stmt.while_stmt
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; temp/codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	codegen_while	;
	.p2align 4,,10
	.p2align 3
.L405:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC28(%rip), %rdi	;, tmp147
.L418:
; temp/codegen.c:450: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L393:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC30(%rip), %rdx	;, tmp156
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L420:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$118, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp131
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L404	;
	.size	codegen_statement, .-codegen_statement
	.p2align 4
	.globl	codegen_for
	.type	codegen_for, @function
codegen_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp218, for_
	pushq	%rbp	;
	leaq	.LC1(%rip), %rbp	;, tmp217
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp219, status
	subq	$40, %rsp	;,
; temp/codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rdi), %rax	; for__42(D)->initializer, _1
; temp/codegen.c:532:     if (for_->initializer != NULL)
	testq	%rax, %rax	; _1
	je	.L422	;,
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	8(%rax), %r15	; _1->name, _207
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rax), %r14	; _1->type, _206
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rbp, %rdi	; tmp217,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r15, (%rax)	; _207, var_225->original_name
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbx), %r15	; status_43(D)->var_count, _230
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp220, var
; temp/codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r15), %rax	;, tmp168
	movq	%rax, 56(%rbx)	; tmp168, status_43(D)->var_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _238, var_225->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp221, _238
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	;, _230
	je	.L446	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _230,
	movl	$118, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp171
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L424:
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	; status_43(D)->current_subroutine, status_43(D)->current_subroutine
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%r13)	; _206, var_225->type
; temp/codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r13, %rsi	; var,
	movq	24(%rax), %rdi	; _211->local_vars, _211->local_vars
	call	*list_append@GOTPCREL(%rip)	;
.L422:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r14	; status_43(D)->block_count, _292
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rbp, %rdi	; tmp217,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_283->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp222, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	;, tmp174
	movq	%rax, 72(%rbx)	; tmp174, status_43(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _296, var_283->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp223, _296
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _292
	je	.L447	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _292,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp177
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L426:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r13)	;, var_283->type
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r14	; status_43(D)->block_count, _275
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rbp, %rdi	; tmp217,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_266->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	; tmp224, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	;, tmp178
	movq	%rax, 72(%rbx)	; tmp178, status_43(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; _279, var_266->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp225, _279
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _275
	je	.L448	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _275,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp181
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L428:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r15)	;, var_266->type
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r9	; status_43(D)->block_count, _258
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rbp, %rdi	; tmp217,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_249->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	; tmp226, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	;, tmp182
	movq	%r9, 8(%rsp)	; _258, %sfp
	movq	%rax, 72(%rbx)	; tmp182, status_43(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	8(%rsp), %r9	; %sfp, _258
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	; _262, var_249->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp227, _262
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, _258
	je	.L449	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp185
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L430:
; temp/codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__42(D)->condition
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r14)	;, var_249->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:538:     if (for_->condition != NULL) {
	je	.L431	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; var, arg_86->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_86->is_get
	movq	%rax, 8(%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	8(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp229, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_85->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rdx, (%rax)	; arg, inst_85->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_85->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_85->arg3
; temp/codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rdi	; _3->instructions, _3->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	; var, block_83->label
	movq	%rax, 8(%rsp)	; block, %sfp
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:110:     block->instructions = create_list();
	movq	8(%rsp), %rdx	; %sfp, block
	movq	%rax, 8(%rdx)	; tmp231, block_83->instructions
; temp/codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	%rdx, %rsi	; block,
	movq	32(%rax), %rdi	; _5->blocks, _5->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:544:         status->current_block = condition_block;
	movq	8(%rsp), %rdx	; %sfp, block
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%r12), %rdi	; for__42(D)->condition, for__42(D)->condition
	movq	%rbx, %rsi	; status,
; temp/codegen.c:544:         status->current_block = condition_block;
	movq	%rdx, 16(%rbx)	; block, status_43(D)->current_block
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	call	codegen_expression	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	%rax, 24(%rsp)	; condition, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_82->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_82->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; var, arg_82->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_82->is_get
	movq	%rax, 16(%rsp)	; arg, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_81->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_81->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; var, arg_81->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_81->is_get
	movq	%rax, 8(%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	24(%rsp), %r8	; %sfp, condition
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	8(%rsp), %rcx	; %sfp, arg
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	16(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_80->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp235, inst
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_80->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r8, (%rax)	; condition, inst_80->arg1
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%rdx, 16(%rax)	; arg, inst_80->arg3
; temp/codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rdi	;, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L432:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:109:     block->label = label;
	movq	%r15, (%rax)	; var, block_89->label
	movq	%rax, 8(%rsp)	; block, %sfp
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:110:     block->instructions = create_list();
	movq	8(%rsp), %rdx	; %sfp, block
	movq	%rax, 8(%rdx)	; tmp239, block_89->instructions
; temp/codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	%rdx, %rsi	; block,
	movq	32(%rax), %rdi	; _12->blocks, _12->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:557:     status->current_block = body_block;
	movq	8(%rsp), %rdx	; %sfp, block
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:557:     status->current_block = body_block;
	movq	%rdx, 16(%rbx)	; block, status_43(D)->current_block
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r9	; status_43(D)->block_count, _309
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rbp, %rdi	; tmp217,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_300->original_name
	movq	%rax, 8(%rsp)	; var, %sfp
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	;, tmp197
	movq	%r9, 16(%rsp)	; _309, %sfp
	movq	%rax, 72(%rbx)	; tmp197, status_43(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	16(%rsp), %r9	; %sfp, _309
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp241, _313
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	8(%rsp), %rax	; %sfp, var
	movq	%rdi, 8(%rax)	; _313, var_300->name
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, _309
	je	.L450	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp200
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L434:
; temp/codegen.c:131:     var->type = type;
	movq	8(%rsp), %rbp	; %sfp, var
; temp/codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__42(D)->increment
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%rbp)	;, var_300->type
; temp/codegen.c:560:     if (for_->increment != NULL)
	je	.L435	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp242, arg
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	32(%rbx), %rdi	; status_43(D)->start_labels, status_43(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_91->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_91->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; var, arg_91->value.label
; temp/codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	*list_append@GOTPCREL(%rip)	;
.L436:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_94->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp245, arg
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_43(D)->end_labels, status_43(D)->end_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_94->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_94->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; var, arg_94->value.label
; temp/codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__42(D)->body, for__42(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp246, body_statements
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L438	;
	.p2align 4,,10
	.p2align 3
.L439:
; temp/codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L438:
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp247, statement
; temp/codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L439	;,
; temp/codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_43(D)->start_labels, status_43(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_43(D)->end_labels, status_43(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__42(D)->increment
	je	.L440	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp248, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_98->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_98->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	8(%rsp), %rax	; %sfp, var
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_98->is_get
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rax, 0(%rbp)	; var, arg_98->value.label
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp249, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_97->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_97->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_97->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_97->arg3
; temp/codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rdi	; _24->instructions, _24->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp250, block
; temp/codegen.c:109:     block->label = label;
	movq	8(%rsp), %rax	; %sfp, var
	movq	%rax, 0(%rbp)	; var, block_95->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp251, block_95->instructions
; temp/codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	32(%rax), %rdi	; _26->blocks, _26->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:579:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; block, status_43(D)->current_block
; temp/codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%r12), %rdi	; for__42(D)->increment, for__42(D)->increment
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
.L440:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp252, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_100->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_100->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; var, arg_100->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_100->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__42(D)->condition
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_99->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp253, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_99->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_99->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_99->arg3
; temp/codegen.c:584:     if (for_->condition == NULL)
	je	.L451	;,
.L441:
; temp/codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rdi	; _30->instructions, _30->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp256, block
; temp/codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	; var, block_103->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp257, block_103->instructions
; temp/codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	32(%rax), %rdi	; _32->blocks, _32->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:590:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_43(D)->current_block
; temp/codegen.c:591: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L435:
; temp/codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__42(D)->condition
	je	.L437	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp243, arg
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_43(D)->start_labels, status_43(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; var, arg_92->value.label
; temp/codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L436	;
	.p2align 4,,10
	.p2align 3
.L450:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp199
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L434	;
	.p2align 4,,10
	.p2align 3
.L449:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp184
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L430	;
	.p2align 4,,10
	.p2align 3
.L448:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp180
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L428	;
	.p2align 4,,10
	.p2align 3
.L447:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp176
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L426	;
	.p2align 4,,10
	.p2align 3
.L431:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; var, arg_88->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movq	%rax, 8(%rsp)	; arg, %sfp
	movb	$0, 20(%rax)	;, arg_88->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	8(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_87->arg2
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp237, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rdx, (%rax)	; arg, inst_87->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_87->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_87->arg3
; temp/codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rdi	;, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L432	;
	.p2align 4,,10
	.p2align 3
.L446:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$118, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp170
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L424	;
	.p2align 4,,10
	.p2align 3
.L451:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp254, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_102->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_102->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; var, arg_102->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_102->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_101->type
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp255, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_101->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_101->arg2
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_101->arg3
	jmp	.L441	;
	.p2align 4,,10
	.p2align 3
.L437:
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp244, arg
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rdi	; status_43(D)->start_labels, status_43(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; var, arg_93->value.label
; temp/codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L436	;
	.size	codegen_for, .-codegen_for
	.p2align 4
	.globl	codegen_while
	.type	codegen_while, @function
codegen_while:
	pushq	%r15	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %r15	;, tmp162
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp163, while_
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp164, status
	subq	$24, %rsp	;,
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r13	; status_21(D)->block_count, _164
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rdi	; tmp162,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_155->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp165, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r13), %rax	;, tmp132
	movq	%rax, 72(%rbx)	; tmp132, status_21(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _168, var_155->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp166, _168
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _164
	je	.L462	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _164,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp135
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L454:
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	;, var_155->type
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp167, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_59->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_59->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; var, arg_59->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_59->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp168, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_58->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_58->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_58->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_58->arg3
; temp/codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _1->instructions, _1->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp169, block
; temp/codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	; var, block_56->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%r13, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp170, block_56->instructions
; temp/codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rdi	; _3->blocks, _3->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:599:     status->current_block = condition_block;
	movq	%r13, 16(%rbx)	; block, status_21(D)->current_block
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r13	; status_21(D)->block_count, _147
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rdi	; tmp162,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_138->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	; tmp171, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r13), %rax	;, tmp140
	movq	%rax, 72(%rbx)	; tmp140, status_21(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	; _151, var_138->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp172, _151
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _147
	je	.L463	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _147,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp143
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L456:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r14)	;, var_138->type
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r9	; status_21(D)->block_count, _130
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rdi	; tmp162,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_121->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp173, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	;, tmp144
	movq	%r9, (%rsp)	; _130, %sfp
	movq	%rax, 72(%rbx)	; tmp144, status_21(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:127:     if (id == (size_t)-1)
	movq	(%rsp), %r9	; %sfp, _130
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _134, var_121->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp174, _134
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, _130
	je	.L464	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC3(%rip), %rcx	;, tmp147
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L458:
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r13)	;, var_121->type
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	0(%rbp), %rdi	; while__31(D)->condition, while__31(D)->condition
	movq	%rbx, %rsi	; status,
	call	codegen_expression	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp176, arg
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_55->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_55->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; var, arg_55->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_55->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_54->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_54->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; var, arg_54->value.label
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_54->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, condition
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp178, inst
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	; arg, inst_53->arg3
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_53->arg2
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_53->arg1
; temp/codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_53->type
; temp/codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _6->instructions, _6->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp179, block
; temp/codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	; var, block_51->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r15, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r15)	; tmp180, block_51->instructions
; temp/codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rdi	; _8->blocks, _8->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; temp/codegen.c:609:     status->current_block = body_block;
	movq	%r15, 16(%rbx)	; block, status_21(D)->current_block
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_50->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp181, arg
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rdi	; status_21(D)->start_labels, status_21(D)->start_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_50->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_50->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; var, arg_50->value.label
; temp/codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_49->is_get
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp182, arg
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rdi	; status_21(D)->end_labels, status_21(D)->end_labels
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_49->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_49->type
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; var, arg_49->value.label
; temp/codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rdi	; while__31(D)->body, while__31(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp183, body_statements
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L459	;
	.p2align 4,,10
	.p2align 3
.L460:
; temp/codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L459:
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp184, statement
; temp/codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L460	;,
; temp/codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rdi	; status_21(D)->start_labels, status_21(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rdi	; status_21(D)->end_labels, status_21(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; temp/codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp185, arg
; temp/codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; var, arg_63->value.label
; temp/codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_63->kind
; temp/codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_63->type
; temp/codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_63->is_get
; temp/codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp186, inst
; temp/codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_62->arg1
; temp/codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_62->arg2
; temp/codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_62->type
; temp/codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_62->arg3
; temp/codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _15->instructions, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp187, block
; temp/codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	; var, block_60->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp188, block_60->instructions
; temp/codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rdi	; _17->blocks, _17->blocks
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:625:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_21(D)->current_block
; temp/codegen.c:626: }
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
.L462:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp134
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L454	;
	.p2align 4,,10
	.p2align 3
.L464:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp146
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L458	;
	.p2align 4,,10
	.p2align 3
.L463:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp142
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L456	;
	.size	codegen_while, .-codegen_while
	.p2align 4
	.globl	codegen_function
	.type	codegen_function, @function
codegen_function:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp129, function
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp130, status
	subq	$24, %rsp	;,
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
	movq	%rax, %rbp	; tmp131, subroutine
; temp/codegen.c:100:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_43]
; temp/codegen.c:102:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp132, subroutine_43->parameters
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp133, subroutine_43->local_vars
; temp/codegen.c:104:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; temp/codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp134, subroutine_43->blocks
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
; temp/codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r15), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%r15, (%rsp)	; function, %sfp
	movq	%rax, %r13	; tmp135, parameters
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L466	;
	.p2align 4,,10
	.p2align 3
.L467:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _50,
	movl	$112, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L468:
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%r12)	; _6, var_47->type
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_43->parameters, subroutine_43->parameters
	movq	%r12, %rsi	; var,
	call	*list_append@GOTPCREL(%rip)	;
.L466:
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L475	;,
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	; parameter_25->name, _7
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %r14	; parameter_25->type, _6
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r15, (%rax)	; _7, var_47->original_name
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rbx), %r15	; status_19(D)->param_count, _50
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp136, var
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r15), %rax	;, tmp115
	movq	%rax, 48(%rbx)	; tmp115, status_19(D)->param_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _60, var_47->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp137, _60
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	;, _50
	jne	.L467	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$112, %r8d	;,
	leaq	.LC2(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L468	;
	.p2align 4,,10
	.p2align 3
.L475:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	movq	(%rsp), %r15	; %sfp, function
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r12	; status_19(D)->block_count, _73
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_64->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp139, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	;, tmp120
	movq	%rax, 72(%rbx)	; tmp120, status_19(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _77, var_64->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp140, _77
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _73
	je	.L476	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _73,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp123
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L471:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r13)	;, var_64->type
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp141, block
; temp/codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	; var, block_37->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_43->blocks, subroutine_43->blocks
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp142, block_37->instructions
; temp/codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:332:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r15), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp143, statements
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L472	;
	.p2align 4,,10
	.p2align 3
.L473:
; temp/codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L472:
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp144, statement
; temp/codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L473	;,
; temp/codegen.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:340: }
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
.L476:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp122
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L471	;
	.size	codegen_function, .-codegen_function
	.p2align 4
	.globl	codegen_method
	.type	codegen_method, @function
codegen_method:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp129, method
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp130, status
	subq	$24, %rsp	;,
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
	movq	%rax, %rbp	; tmp131, subroutine
; temp/codegen.c:100:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_43]
; temp/codegen.c:102:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp132, subroutine_43->parameters
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp133, subroutine_43->local_vars
; temp/codegen.c:104:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; temp/codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp134, subroutine_43->blocks
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
; temp/codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; temp/codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r15), %rdi	; method_16(D)->parameters, method_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%r15, (%rsp)	; method, %sfp
	movq	%rax, %r13	; tmp135, parameters
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L478	;
	.p2align 4,,10
	.p2align 3
.L479:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r15, %r9	; _50,
	movl	$112, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L480:
; temp/codegen.c:131:     var->type = type;
	movq	%r14, 16(%r12)	; _6, var_47->type
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_43->parameters, subroutine_43->parameters
	movq	%r12, %rsi	; var,
	call	*list_append@GOTPCREL(%rip)	;
.L478:
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L487	;,
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	; parameter_25->name, _7
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; temp/codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %r14	; parameter_25->type, _6
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rdi	;,
	movl	$32, %esi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	%r15, (%rax)	; _7, var_47->original_name
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rbx), %r15	; status_19(D)->param_count, _50
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	; tmp136, var
; temp/codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r15), %rax	;, tmp115
	movq	%rax, 48(%rbx)	; tmp115, status_19(D)->param_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	; _60, var_47->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp137, _60
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	;, _50
	jne	.L479	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$112, %r8d	;,
	leaq	.LC2(%rip), %rcx	;,
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L480	;
	.p2align 4,,10
	.p2align 3
.L487:
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	movq	(%rsp), %r15	; %sfp, method
	call	*alloc_memory@GOTPCREL(%rip)	;
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r12	; status_19(D)->block_count, _73
; temp/codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC1(%rip), %rdi	;,
; temp/codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_64->original_name
; temp/codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	; tmp139, var
; temp/codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	;, tmp120
	movq	%rax, 72(%rbx)	; tmp120, status_19(D)->block_count
; temp/codegen.c:126:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	; _77, var_64->name
; temp/codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp140, _77
; temp/codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _73
	je	.L488	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _73,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC3(%rip), %rcx	;, tmp123
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L483:
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; temp/codegen.c:131:     var->type = type;
	movq	$0, 16(%r13)	;, var_64->type
; temp/codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp141, block
; temp/codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	; var, block_37->label
; temp/codegen.c:110:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_43->blocks, subroutine_43->blocks
	movq	%r12, %rsi	; block,
; temp/codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp142, block_37->instructions
; temp/codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; temp/codegen.c:354:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; temp/codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r15), %rdi	; method_16(D)->body, method_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp143, statements
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L484	;
	.p2align 4,,10
	.p2align 3
.L485:
; temp/codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	codegen_statement	;
.L484:
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp144, statement
; temp/codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L485	;,
; temp/codegen.c:361:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; temp/codegen.c:362: }
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
.L488:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC2(%rip), %rcx	;, tmp122
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L483	;
	.size	codegen_method, .-codegen_method
	.section	.rodata.str1.8
	.align 8
.LC31:
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
	leaq	.LC31(%rip), %r12	;, tmp109
; temp/codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rdi	; _4->attribute_tables, _4->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L490:
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; temp/codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L498	;,
.L495:
; temp/codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ecx	; member_22->type, _6
; temp/codegen.c:371:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L491	;,
	cmpl	$1, %ecx	;, _6
	je	.L492	;,
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
	jne	.L495	;,
.L498:
; temp/codegen.c:383: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L492:
; temp/codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_22->content.variable, member_22->content.variable
	movl	$97, %edx	;,
	movq	%rbp, %rsi	; status,
	call	codegen_variable	;
; temp/codegen.c:377:                 break;
	jmp	.L490	;
	.p2align 4,,10
	.p2align 3
.L491:
; temp/codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rdi	; member_22->content.method, member_22->content.method
	movq	%rbp, %rsi	; status,
	call	codegen_method	;
; temp/codegen.c:374:                 break;
	jmp	.L490	;
	.size	codegen_class, .-codegen_class
	.section	.rodata.str1.1
.LC32:
	.string	"main"
	.text
	.p2align 4
	.globl	codegen_code
	.type	codegen_code, @function
codegen_code:
	pushq	%r14	;
; temp/codegen.c:300:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC32(%rip), %r14	;, tmp115
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
.L500:
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, code_member
; temp/codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L508	;,
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; temp/codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L509	;,
; temp/codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L510	;,
; temp/codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L500	;,
; temp/codegen.c:305:             codegen_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	codegen_import	;
	jmp	.L500	;
	.p2align 4,,10
	.p2align 3
.L509:
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
	jne	.L500	;,
; temp/codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L500	;
	.p2align 4,,10
	.p2align 3
.L510:
; temp/codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	codegen_class	;
	jmp	.L500	;
	.p2align 4,,10
	.p2align 3
.L508:
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
