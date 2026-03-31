	.file	"D:\\TC\\temp\\codegen.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	emit_param_instruction.part.0;	.scl	3;	.type	32;	.endef
emit_param_instruction.part.0:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp116, status
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp115, value
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	8(%rcx), %rax	 ; value_1(D)->type, _2
 ; D:\TC\temp\codegen.c:21:     if (type == NULL)
	testq	%rax, %rax	 ; _2
	je	.L5	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rbp	 ;, tmp114
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	0(%rbp), %rax	 ; name_int, _2
	je	.L3	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp103
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_float, _2
	je	.L3	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp104
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_string, _2
	je	.L3	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp105
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	(%rdx), %rax	 ; name_bool, _2
	je	.L7	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp106
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	(%rdx), %rax	 ; name_void, _2
	je	.L7	 ;,
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %edx	 ; _2->kind,
	testl	%edx, %edx	 ;
	jne	.L4	 ;,
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rax), %rax	 ; _2->ast_node.class, _2->ast_node.class
 ; D:\TC\temp\codegen.c:286:     long long size = (long long)get_type_size(value->type);
	movq	24(%rax), %r12	 ; _40->size, prephitmp_53
.L2:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	 ; prephitmp_53, arg_21->value.int_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp118, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_21->kind
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	0(%rbp), %rax	 ; name_int, name_int
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_21->is_get
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int, arg_21->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; value, inst_6->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp119, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_6->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; arg, inst_6->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_6->arg3
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_7(D)->current_block, status_7(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
 ; D:\TC\temp\codegen.c:289: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\temp\codegen.c:288:     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$1, %r12d	 ;, prephitmp_53
	jmp	.L2	 ;
	.p2align 4,,10
	.p2align 3
.L5:
	movq	.refptr.name_int(%rip), %rbp	 ;, tmp114
	xorl	%r12d, %r12d	 ; prephitmp_53
	jmp	.L2	 ;
	.p2align 4,,10
	.p2align 3
.L4:
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rax), %rbx	 ; _2->name, _42
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC0(%rip), %rdx	 ;, tmp109
	movq	24(%rax), %rcx	 ; _43->_stderr, _43->_stderr
	movq	%rbx, %r8	 ; _42,
	call	fprintf	 ;
.L3:
	movl	$8, %r12d	 ;, prephitmp_53
	jmp	.L2	 ;
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp106, arg
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp107, status
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:190:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %r13	 ; arg_1(D)->type, _2
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rdi), %rsi	 ; status_3(D)->temp_count, _39
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp98
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_32->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp108, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp97
	movq	%rax, 64(%rdi)	 ; tmp97, status_3(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _45, var_32->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp109, _45
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _39
	je	.L14	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _39,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp100
	call	sprintf	 ;
.L12:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _2, var_32->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp101
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; var_32->type, tmp101
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_19->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp110, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_19->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp101, MEM <vector(2) long unsigned int> [(void *)arg_19]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_6->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp111, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; <retval>, inst_6->arg1
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$23, 24(%rax)	 ;, inst_6->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_6->arg3
 ; D:\TC\temp\codegen.c:191:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rcx	 ; _7->instructions, _7->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:195: }
	leaq	-40(%rbp), %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L14:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp99
	call	sprintf	 ;
	jmp	.L12	 ;
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
	subq	$64, %rsp	 ;,
 ; D:\TC\temp\codegen.c:265:     if (object == NULL || attr_name == NULL) {
	testq	%rcx, %rcx	 ; object
	je	.L40	 ;,
	movq	%rdx, %rbx	 ; tmp172, attr_name
	testq	%rdx, %rdx	 ; attr_name
	je	.L40	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, object_16(D)->is_get
	movq	%rcx, %rdi	 ; tmp171, object
	movq	%r8, %r12	 ; tmp173, status
	jne	.L46	 ;,
.L19:
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movq	8(%rdi), %rsi	 ; _27->type, class_type
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	testq	%rsi, %rsi	 ; class_type
	je	.L21	 ;,
 ; D:\TC\temp\codegen.c:273:     if (object_value->type != NULL && object_value->type->kind == SYMBOL_CLASS)
	movl	32(%rsi), %eax	 ; _6->kind,
	testl	%eax, %eax	 ;
	jne	.L47	 ;,
.L21:
 ; D:\TC\temp\codegen.c:6:     list(AttributeTable*) attribute_tables = list_copy(status->tac->attribute_tables);
	movq	(%r12), %rax	 ; MEM[(struct TAC * *)status_19(D)], MEM[(struct TAC * *)status_19(D)]
	movq	(%rax), %rcx	 ; _104->attribute_tables, _104->attribute_tables
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp176, attribute_tables
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L24:
 ; D:\TC\temp\codegen.c:9:         if (current->name == name)
	cmpq	%rsi, 8(%rax)	 ; class_type, current_108->name
	je	.L23	 ;,
.L22:
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	movq	%r13, %rcx	 ; attribute_tables,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:8:     while ((current = (AttributeTable*)list_pop(attribute_tables)) != NULL)
	testq	%rax, %rax	 ; current
	jne	.L24	 ;,
.L25:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	movq	(%rbx), %rsi	 ; attr_name_17(D)->type, _85
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %r15	 ;, tmp164
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%r12), %r13	 ; status_19(D)->attr_count, _113
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp164,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	 ; attr_name, var_112->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp178, var
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r13), %rax	 ;, tmp142
	movq	%rax, 40(%r12)	 ; tmp142, status_19(D)->attr_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _125, var_112->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp179, _125
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	 ;, _113
	je	.L48	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r13, %r9	 ; _113,
	movl	$97, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp145
	call	sprintf	 ;
.L28:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rsi, 16(%r14)	 ; _85, var_112->type
 ; D:\TC\temp\codegen.c:242:         return create_var(attr_name, attr_name->type, VAR_ATTR, status);
	jmp	.L29	 ;
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	movq	(%rax), %rcx	 ; current_108->attributes, _84
 ; D:\TC\temp\codegen.c:241:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _84
	je	.L25	 ;,
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	call	list_copy	 ;
 ; D:\TC\temp\codegen.c:243:     size_t index = 0;
	xorl	%r13d, %r13d	 ; index
 ; D:\TC\temp\codegen.c:245:     list(Attribute*) attrs = list_copy(table->attributes);
	movq	%rax, %r14	 ; tmp180, attrs
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	jmp	.L30	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:\TC\temp\codegen.c:248:         if (attr->var_name == attr_name) {
	cmpq	(%rax), %rbx	 ; attr_88->var_name, attr_name
	je	.L31	 ;,
 ; D:\TC\temp\codegen.c:252:         ++index;
	addq	$1, %r13	 ;, index
.L30:
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	movq	%r14, %rcx	 ; attrs,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:247:     while ((attr = (Attribute*)list_pop(attrs)) != NULL) {
	testq	%rax, %rax	 ; attr
	jne	.L32	 ;,
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %r15	 ;, tmp164
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	movq	%r15, %rcx	 ; tmp164,
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	 ; attr_name, var_20->original_name
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp188, var
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	 ; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rax, 16(%r14)	 ; attr_name_17(D)->type, var_20->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; tmp189, var_20->name
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	testq	%rsi, %rsi	 ; class_type
	je	.L49	 ;,
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rsi), %rsi	 ; class_type_111->name, iftmp.19_96
.L37:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	8(%rbx), %r8	 ; attr_name_17(D)->name, _97
	movq	%r8, 56(%rsp)	 ; _97, %sfp
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	movq	56(%rsp), %r8	 ; %sfp, _97
	movq	%rsi, %r9	 ; iftmp.19_96,
	leaq	.LC6(%rip), %rdx	 ;, tmp147
	movq	24(%rax), %rcx	 ; _98->_stderr, _98->_stderr
	movq	%r13, 32(%rsp)	 ; index,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	8(%r14), %rcx	 ; var_20->name, pretmp_135
	jmp	.L38	 ;
	.p2align 4,,10
	.p2align 3
.L47:
 ; D:\TC\temp\codegen.c:272:     Symbol* class_type = NULL;
	xorl	%esi, %esi	 ; class_type
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L31:
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %r15	 ;, tmp164
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp164,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:255:     var->original_name = attr_name;
	movq	%rbx, (%rax)	 ; attr_name, var_175->original_name
 ; D:\TC\temp\codegen.c:254:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp190, var
 ; D:\TC\temp\codegen.c:256:     var->type = attr_name->type;
	movq	(%rbx), %rax	 ; attr_name_17(D)->type, attr_name_17(D)->type
	movq	%rax, 16(%r14)	 ; attr_name_17(D)->type, var_175->type
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; pretmp_135, var_175->name
 ; D:\TC\temp\codegen.c:257:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp191, pretmp_135
.L38:
 ; D:\TC\temp\codegen.c:260:     sprintf(var->name, "$a%zu", index);
	movq	%r13, %r8	 ; index,
	leaq	.LC7(%rip), %rdx	 ;, tmp148
	call	sprintf	 ;
.L29:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:276:     Arg* result = create_arg(ARG_VARIABLE, create_var(NULL, attr_name->type, VAR_TEMP, status));
	movq	(%rbx), %rsi	 ; attr_name_17(D)->type, _8
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%r12), %r13	 ; status_19(D)->temp_count, _75
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp164,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_68->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp183, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r13), %rax	 ;, tmp149
	movq	%rax, 64(%r12)	 ; tmp149, status_19(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _81, var_68->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp184, _81
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	 ;, _75
	je	.L50	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r13, %r9	 ; _75,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp152
	call	sprintf	 ;
.L35:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rsi, 16(%rbx)	 ; _8, var_68->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp153
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; var_68->type, tmp153
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_55->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp185, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_55->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp153, MEM <vector(2) long unsigned int> [(void *)arg_55]
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp155
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _103->type, tmp155
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_42->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp186, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_42->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp155, MEM <vector(2) long unsigned int> [(void *)arg_42]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; object, inst_35->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp187, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$15, 24(%rax)	 ;, inst_35->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; <retval>, inst_35->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg, inst_35->arg3
 ; D:\TC\temp\codegen.c:278:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%r12), %rax	 ; status_19(D)->current_block, status_19(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:279:     result->is_get = true;
	movb	$1, 20(%rsi)	 ;, arg_55->is_get
.L15:
 ; D:\TC\temp\codegen.c:281: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
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
.L50:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp151
	call	sprintf	 ;
	jmp	.L35	 ;
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$97, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp144
	call	sprintf	 ;
	jmp	.L28	 ;
.L49:
 ; D:\TC\temp\codegen.c:259:         fprintf(stderr, "[warning] Attribute '%s' not found in class '%s', fallback index %zu\n", attr_name->name, class_type != NULL ? class_type->name : "<unknown>", index);
	leaq	.LC4(%rip), %rsi	 ;, iftmp.19_96
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L46:
	movq	%r8, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp175, object
 ; D:\TC\temp\codegen.c:270:     if (object_value == NULL)
	testq	%rax, %rax	 ; object
	jne	.L19	 ;,
 ; D:\TC\temp\codegen.c:267:         return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L15	 ;
	.p2align 4,,10
	.p2align 3
.L40:
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:\TC\temp\codegen.c:267:         return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\temp\codegen.c:266:         fprintf(stderr, "[warning] Invalid attribute access\n");
	movq	24(%rax), %r9	 ; _4->_stderr,
	leaq	.LC5(%rip), %rcx	 ;, tmp139
	call	fwrite	 ;
	jmp	.L15	 ;
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
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp124, tac
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp125, status
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
	je	.L61	 ;,
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp113
 ; D:\TC\temp\codegen.c:312:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp113
	jbe	.L62	 ;,
 ; D:\TC\temp\codegen.c:314:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L58	 ;,
 ; D:\TC\temp\codegen.c:14:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp130, table
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rsi, %xmm1	 ; _1, _1
 ; D:\TC\temp\codegen.c:17:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_57->size
 ; D:\TC\temp\codegen.c:15:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp131, tmp119
	punpcklqdq	%xmm1, %xmm0	 ; _1, tmp119
	movups	%xmm0, (%rbx)	 ; tmp119, MEM <vector(2) long unsigned int> [(void *)table_57]
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%r12), %rcx	 ; tac_20(D)->attribute_tables, tac_20(D)->attribute_tables
.L60:
 ; D:\TC\temp\codegen.c:318: }
	leaq	-40(%rbp), %rsp	 ;,
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%rbx, %rdx	 ; table,
 ; D:\TC\temp\codegen.c:318: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:315:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L58:
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC8(%rip), %rdx	 ;, tmp122
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
 ; D:\TC\temp\codegen.c:318: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:317:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L62:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %r13	 ; _1->type, _7
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp115
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rsi, (%rax)	 ; _1, var_42->original_name
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rdi), %rsi	 ; status_22(D)->subroutine_count, _53
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp128, var
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp114
	movq	%rax, 80(%rdi)	 ; tmp114, status_22(D)->subroutine_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _55, var_42->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp129, _55
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _53
	je	.L63	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _53,
	movl	$102, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp117
	call	sprintf	 ;
.L57:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _7,
 ; D:\TC\temp\codegen.c:313:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
	jmp	.L60	 ;
	.p2align 4,,10
	.p2align 3
.L61:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:311:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rsi), %r13	 ; _1->type, _3
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp109
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rsi, (%rax)	 ; _1, var_27->original_name
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rdi), %rsi	 ; status_22(D)->var_count, _32
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp126, var
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp108
	movq	%rax, 56(%rdi)	 ; tmp108, status_22(D)->var_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _40, var_27->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp127, _40
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _32
	je	.L64	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _32,
	movl	$118, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp111
	call	sprintf	 ;
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L63:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$102, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp116
	call	sprintf	 ;
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L64:
	movl	$118, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp110
	call	sprintf	 ;
	jmp	.L57	 ;
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
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	movq	%rcx, %r13	 ; tmp186, variable
	pushq	%r12	 ;
	movl	%r8d, %r12d	 ; tmp188, type
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp187, status
	pushq	%rbx	 ;
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	8(%rcx), %rdi	 ; variable_21(D)->name, _2
	movq	(%rcx), %r14	 ; variable_21(D)->type, _1
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:384: void codegen_variable(Variable* variable, TACStatus* status, VarType type) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rdi, (%rax)	 ; _2, var_36->original_name
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	leal	-97(%r12), %edi	 ;,
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp189, var
 ; D:\TC\temp\codegen.c:117:     switch (kind) {
	cmpl	$21, %edi	 ;, tmp185
	ja	.L66	 ;,
	leaq	.L68(%rip), %rdx	 ;, tmp134
	movl	%edi, %eax	 ; tmp185, tmp133
	movslq	(%rdx,%rax,4), %rax	 ;, tmp136
	addq	%rdx, %rax	 ; tmp134, tmp137
	jmp	*%rax	 ; tmp137
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
	.p2align 4,,10
	.p2align 3
.L66:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp139
	movl	$32, %edx	 ;,
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _49, var_36->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp190, _49
.L74:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	%r12d, %r8d	 ; type,
	leaq	.LC2(%rip), %rdx	 ;, tmp147
	call	sprintf	 ;
.L77:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r14, 16(%rbx)	 ; _1, var_36->type
 ; D:\TC\temp\codegen.c:386:     switch (type) {
	cmpl	$21, %edi	 ;, tmp185
	ja	.L78	 ;,
	leaq	.L80(%rip), %rdx	 ;, tmp151
	movslq	(%rdx,%rdi,4), %rax	 ;, tmp153
	addq	%rdx, %rax	 ; tmp151, tmp154
	jmp	*%rax	 ; tmp154
	.section .rdata,"dr"
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
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:410: }
	movaps	32(%rsp), %xmm6	 ;,
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	movl	%r12d, %r8d	 ; type,
	leaq	.LC10(%rip), %rdx	 ;, tmp184
	movq	24(%rax), %rcx	 ; _17->_stderr, _17->_stderr
 ; D:\TC\temp\codegen.c:410: }
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:407:             fprintf(stderr, "[warning] Unsupported variable type for codegen_variable: %d\n", type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	24(%rax), %rcx	 ;, _5->local_vars
.L99:
	movq	%rbx, %rdx	 ; var,
.L100:
 ; D:\TC\temp\codegen.c:410: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L82:
 ; D:\TC\temp\codegen.c:388:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rsi), %rax	 ; status_23(D)->current_subroutine, status_23(D)->current_subroutine
	movq	16(%rax), %rcx	 ;, _3->parameters
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:\TC\temp\codegen.c:397:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rsi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	16(%rax), %rcx	 ;, _9->global_vars
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:\TC\temp\codegen.c:400:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	(%rax), %rcx	 ; _11->attribute_tables, _11->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rdi	 ; tmp192, attr_table
 ; D:\TC\temp\codegen.c:401:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rsi), %rax	 ; status_23(D)->tac, status_23(D)->tac
	movq	%rdi, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _13->attribute_tables, _13->attribute_tables
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqu	0(%r13), %xmm0	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)]
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:402:             create_attribute(variable->name, variable->type, attr_table, 0);
	movdqa	%xmm0, %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], vect__15.87
	movq	%xmm0, %rbx	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], _74
	shufpd	$1, %xmm0, %xmm6	 ;, MEM <vector(2) long unsigned int> [(struct Symbol * *)variable_21(D)], vect__15.87
 ; D:\TC\temp\codegen.c:33:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp193, attr
 ; D:\TC\temp\codegen.c:34:     attr->var_name = var_name;
	movups	%xmm6, (%rax)	 ; vect__15.87, MEM <vector(2) long unsigned int> [(struct Symbol * *)attr_51]
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	16(%rdi), %rax	 ; attr_table_31->size, _52
 ; D:\TC\temp\codegen.c:38:         attr->offset = table->size;
	movq	%rax, 16(%rsi)	 ; _52, attr_51->offset
 ; D:\TC\temp\codegen.c:21:     if (type == NULL)
	testq	%rbx, %rbx	 ; _74
	je	.L85	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp169
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rbx, (%rdx)	 ; _74, name_int
	je	.L97	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp170
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rbx, (%rdx)	 ; _74, name_float
	je	.L97	 ;,
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp171
 ; D:\TC\temp\codegen.c:23:     if (type == name_int || type == name_float || type == name_string)
	cmpq	%rbx, (%rdx)	 ; _74, name_string
	je	.L97	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp172
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rbx, (%rdx)	 ; _74, name_bool
	je	.L98	 ;,
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp173
 ; D:\TC\temp\codegen.c:25:     if (type == name_bool || type == name_void)
	cmpq	%rbx, (%rdx)	 ; _74, name_void
	je	.L98	 ;,
 ; D:\TC\temp\codegen.c:27:     if (type->kind == SYMBOL_CLASS)
	movl	32(%rbx), %edx	 ; _73->kind,
	testl	%edx, %edx	 ;
	jne	.L91	 ;,
 ; D:\TC\temp\codegen.c:28:         return type->ast_node.class->size;
	movq	24(%rbx), %rdx	 ; _73->ast_node.class, _73->ast_node.class
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	 ; _65->size, _52
.L85:
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	movq	(%rdi), %rcx	 ; attr_table_31->attributes, _56
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	%rax, 16(%rdi)	 ; _52, attr_table_31->size
 ; D:\TC\temp\codegen.c:44:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
 ; D:\TC\temp\codegen.c:41:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _56
	jne	.L100	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:410: }
	movaps	32(%rsp), %xmm6	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	movq	24(%rax), %r9	 ; _57->_stderr,
 ; D:\TC\temp\codegen.c:410: }
	leaq	-56(%rbp), %rsp	 ;,
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	leaq	.LC9(%rip), %rcx	 ;, tmp182
 ; D:\TC\temp\codegen.c:410: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:42:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L73:
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	movq	40(%rsi), %r15	 ; status_23(D)->attr_count, id
 ; D:\TC\temp\codegen.c:118:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r15), %rax	 ;, tmp140
	movq	%rax, 40(%rsi)	 ; tmp140, status_23(D)->attr_count
	.p2align 4,,10
	.p2align 3
.L75:
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp146
	movl	$32, %edx	 ;,
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _49, var_36->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp191, _49
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, id
	je	.L74	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; id,
	movl	%r12d, %r8d	 ; type,
	leaq	.LC3(%rip), %rdx	 ;, tmp148
	call	sprintf	 ;
	jmp	.L77	 ;
	.p2align 4,,10
	.p2align 3
.L72:
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rsi), %r15	 ; status_23(D)->block_count, id
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r15), %rax	 ;, tmp144
	movq	%rax, 72(%rsi)	 ; tmp144, status_23(D)->block_count
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rsi), %r15	 ; status_23(D)->subroutine_count, id
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r15), %rax	 ;, tmp145
	movq	%rax, 80(%rsi)	 ; tmp145, status_23(D)->subroutine_count
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L70:
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rsi), %r15	 ; status_23(D)->param_count, id
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r15), %rax	 ;, tmp141
	movq	%rax, 48(%rsi)	 ; tmp141, status_23(D)->param_count
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L69:
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rsi), %r15	 ; status_23(D)->temp_count, id
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp143
	movq	%rax, 64(%rsi)	 ; tmp143, status_23(D)->temp_count
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L67:
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rsi), %r15	 ; status_23(D)->var_count, id
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r15), %rax	 ;, tmp142
	movq	%rax, 56(%rsi)	 ; tmp142, status_23(D)->var_count
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L91:
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rbx), %rbx	 ; _73->name, _67
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:29:     fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC0(%rip), %rdx	 ;, tmp179
	movq	24(%rax), %rcx	 ; _68->_stderr, _68->_stderr
	movq	%rbx, %r8	 ; _67,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	movq	16(%rdi), %rax	 ; attr_table_31->size, tmp200
.L97:
	addq	$8, %rax	 ;, _52
 ; D:\TC\temp\codegen.c:30:     return 8;
	jmp	.L85	 ;
	.p2align 4,,10
	.p2align 3
.L98:
 ; D:\TC\temp\codegen.c:39:         table->size += get_type_size(type);
	addq	$1, %rax	 ;, _52
	jmp	.L85	 ;
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
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:706:     if (variable_access == NULL || status == NULL) {
	testq	%rcx, %rcx	 ; variable_access
	je	.L175	 ;,
	movq	%rdx, %rsi	 ; tmp377, status
	testq	%rdx, %rdx	 ; status
	je	.L175	 ;,
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	movl	16(%rcx), %edi	 ; variable_access_101(D)->type, _6
	movq	%rcx, %rbx	 ; tmp376, variable_access
 ; D:\TC\temp\codegen.c:710:     if (variable_access->type == VAR_NAME) {
	testl	%edi, %edi	 ; _6
	jne	.L105	 ;,
 ; D:\TC\temp\codegen.c:711:         Symbol* name = variable_access->content.name;
	movq	8(%rcx), %r12	 ; variable_access_101(D)->content.name, name
 ; D:\TC\temp\codegen.c:712:         if (name == NULL) {
	testq	%r12, %r12	 ; name
	je	.L261	 ;,
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	movq	8(%rdx), %rdx	 ; status_102(D)->current_subroutine, _222
 ; D:\TC\temp\codegen.c:213:     if (status->current_subroutine != NULL) {
	testq	%rdx, %rdx	 ; _222
	je	.L262	 ;,
 ; D:\TC\temp\codegen.c:214:         Var* var = find_var_by_symbol(status->current_subroutine->parameters, symbol);
	movq	16(%rdx), %rcx	 ; _222->parameters, _222->parameters
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rcx, %rcx	 ; _222->parameters
	je	.L112	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rcx), %rax	 ; _223->head, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L112	 ;,
	.p2align 4,,10
	.p2align 3
.L115:
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	 ; current_90->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	 ; var
	je	.L113	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r12	 ; var_228->original_name, name
	je	.L259	 ;,
.L113:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	(%rax), %rax	 ; current_90->next, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L115	 ;,
.L112:
 ; D:\TC\temp\codegen.c:217:         var = find_var_by_symbol(status->current_subroutine->local_vars, symbol);
	movq	24(%rdx), %rax	 ; _222->local_vars, _232
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	 ; _232
	je	.L119	 ;,
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	 ;* _232, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L119	 ;,
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	 ; current_234->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	 ; var
	je	.L116	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r12	 ; var_237->original_name, name
	jne	.L116	 ;,
	.p2align 4,,10
	.p2align 3
.L259:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp301
	movhps	16(%rbx), %xmm0	 ;, tmp301
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp389, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp301,* <retval>
.L101:
 ; D:\TC\temp\codegen.c:833: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%r13, %rax	 ; <retval>,
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
.L105:
 ; D:\TC\temp\codegen.c:728:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %edi	 ;, _6
	je	.L263	 ;,
 ; D:\TC\temp\codegen.c:744:     if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %edi	 ;, _6
	je	.L264	 ;,
 ; D:\TC\temp\codegen.c:765:     if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %edi	 ;, _6
	jne	.L152	 ;,
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_101(D)->base, _52
 ; D:\TC\temp\codegen.c:766:         if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _52
	je	.L265	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$2, 16(%rcx)	 ;, _52->type
	jne	.L154	 ;,
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	movq	8(%rcx), %r12	 ; _52->content.attr_name, callee_name
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	testq	%r12, %r12	 ; callee_name
	je	.L154	 ;,
 ; D:\TC\temp\codegen.c:775:             (callee_access->content.attr_name->kind == SYMBOL_METHOD || callee_access->content.attr_name->kind == SYMBOL_FUNCTION)) {
	movl	32(%r12), %eax	 ; _56->kind, tmp436
	subl	$1, %eax	 ;, tmp338
 ; D:\TC\temp\codegen.c:774:         if (callee_access->type == VAR_GET_ATTR && callee_access->content.attr_name != NULL &&
	cmpl	$1, %eax	 ;, tmp338
	ja	.L154	 ;,
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	movq	(%rcx), %rcx	 ; _52->base, _59
 ; D:\TC\temp\codegen.c:777:             if (callee_access->base != NULL) {
	testq	%rcx, %rcx	 ; _59
	je	.L174	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	16(%rcx), %edx	 ; _59->type,
	testl	%edx, %edx	 ;
	jne	.L156	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movq	8(%rcx), %rax	 ; _59->content.name, _61
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	testq	%rax, %rax	 ; _61
	je	.L156	 ;,
 ; D:\TC\temp\codegen.c:779:                 if (callee_access->base->type == VAR_NAME && callee_access->base->content.name != NULL && callee_access->base->content.name->kind == SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; _61->kind,
	testl	%eax, %eax	 ;
	je	.L174	 ;,
.L156:
 ; D:\TC\temp\codegen.c:782:                     receiver = load_rvalue(codegen_variable_access(callee_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable_access	 ;
	movq	%rax, %rcx	 ; tmp407, receiver
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; receiver
	je	.L174	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _63->is_get
	jne	.L266	 ;,
.L157:
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:807:             ++argument_count;
	movl	$1, %edi	 ;, argument_count
	call	emit_param_instruction.part.0	 ;
.L158:
 ; D:\TC\temp\codegen.c:809:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbx), %rcx	 ; variable_access_101(D)->content.args, variable_access_101(D)->content.args
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp412, args
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L162	 ;
	.p2align 4,,10
	.p2align 3
.L164:
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:818:             ++argument_count;
	addq	$1, %rdi	 ;, argument_count
	call	emit_param_instruction.part.0	 ;
.L162:
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbx, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp416, arg_expr
 ; D:\TC\temp\codegen.c:811:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L267	 ;,
 ; D:\TC\temp\codegen.c:812:             Arg* arg_value = load_rvalue(codegen_expression(arg_expr, status), status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rcx	 ; tmp413, _75
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; _75
	je	.L165	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _75->is_get
	je	.L164	 ;,
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rcx	 ; tmp415, _75
 ; D:\TC\temp\codegen.c:813:             if (arg_value == NULL) {
	testq	%rax, %rax	 ; _75
	jne	.L164	 ;,
	.p2align 4,,10
	.p2align 3
.L165:
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:814:                 fprintf(stderr, "[warning] Failed to generate function call argument\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp348
	movq	24(%rax), %r9	 ; _76->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:815:                 return NULL;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L264:
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_101(D)->base, _33
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	testq	%rcx, %rcx	 ; _33
	je	.L143	 ;,
 ; D:\TC\temp\codegen.c:745:         if (variable_access->base == NULL || variable_access->content.index == NULL) {
	cmpq	$0, 8(%rbx)	 ;, variable_access_101(D)->content.index
	je	.L143	 ;,
 ; D:\TC\temp\codegen.c:749:         Arg* sequence = load_rvalue(codegen_variable_access(variable_access->base, status), status);
	call	codegen_variable_access	 ;
	movq	%rax, %rdi	 ; tmp397, _37
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; _37
	je	.L145	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _37->is_get
	jne	.L268	 ;,
.L145:
 ; D:\TC\temp\codegen.c:750:         Arg* index = load_rvalue(codegen_expression(variable_access->content.index, status), status);
	movq	8(%rbx), %rcx	 ; variable_access_101(D)->content.index, variable_access_101(D)->content.index
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %r12	 ; tmp399, _39
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; _39
	je	.L148	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _39->is_get
	jne	.L269	 ;,
.L147:
 ; D:\TC\temp\codegen.c:751:         if (sequence == NULL || index == NULL) {
	testq	%rdi, %rdi	 ; _37
	je	.L148	 ;,
	testq	%r12, %r12	 ; _39
	je	.L148	 ;,
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp324
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	8(%rdi), %r13	 ; _192->type, _45
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	movq	(%rax), %rdx	 ; name_int, element_type
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp325
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rax), %r13	 ; name_float, _45
	je	.L149	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp326
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	cmpq	(%rax), %r13	 ; name_bool, _45
	je	.L149	 ;,
 ; D:\TC\temp\codegen.c:756:         if (sequence->type == name_float || sequence->type == name_bool || sequence->type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp327
 ; D:\TC\temp\codegen.c:755:         Symbol* element_type = name_int;
	cmpq	(%rax), %r13	 ; name_string, _45
	cmovne	%rdx, %r13	 ; _45,, element_type, _45
.L149:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rsi), %r14	 ; status_102(D)->temp_count, _393
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp329
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_386->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp402, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	 ;, tmp328
	movq	%rax, 64(%rsi)	 ; tmp328, status_102(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _399, var_386->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp403, _399
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _393
	je	.L270	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _393,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp331
	call	sprintf	 ;
.L151:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _45, var_386->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp332
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; var_386->type, tmp332
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_373->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp404, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_373->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp332, MEM <vector(2) long unsigned int> [(void *)arg_373]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; _37, inst_193->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp405, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$16, 24(%rax)	 ;, inst_193->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_193->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _39, inst_193->arg3
 ; D:\TC\temp\codegen.c:760:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_102(D)->current_block, status_102(D)->current_block
	movq	8(%rax), %rcx	 ; _50->instructions, _50->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:761:         result->is_get = true;
	movb	$1, 20(%r13)	 ;, arg_373->is_get
 ; D:\TC\temp\codegen.c:762:         return result;
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L154:
 ; D:\TC\temp\codegen.c:786:             Arg* callee = codegen_variable_access(callee_access, status);
	movq	%rsi, %rdx	 ; status,
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:787:             if (callee == NULL) {
	testq	%rax, %rax	 ; callee
	je	.L271	 ;,
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movl	16(%rax), %edx	 ; callee_108->kind, _66
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	cmpl	$7, %edx	 ;, _66
	je	.L272	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testl	%edx, %edx	 ; _66
	jne	.L161	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %rax	 ; callee_108->value.variable, _68
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%rax, %rax	 ; _68
	je	.L161	 ;,
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	movq	(%rax), %r12	 ; _68->original_name, callee_name
 ; D:\TC\temp\codegen.c:793:             else if (callee->kind == ARG_VARIABLE && callee->value.variable != NULL && callee->value.variable->original_name != NULL) {
	testq	%r12, %r12	 ; callee_name
	je	.L161	 ;,
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	movl	32(%r12), %eax	 ; _69->kind, tmp437
	subl	$1, %eax	 ;, tmp342
 ; D:\TC\temp\codegen.c:795:                 if (maybe_subroutine->kind == SYMBOL_FUNCTION || maybe_subroutine->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp342
	jbe	.L174	 ;,
	.p2align 4,,10
	.p2align 3
.L161:
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:800:             fprintf(stderr, "[warning] Unsupported callee in function call\n");
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp345
	movq	24(%rax), %r9	 ; _72->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:801:             return NULL;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L263:
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	(%rcx), %rcx	 ; variable_access_101(D)->base, _23
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rcx, %rcx	 ; _23
	je	.L136	 ;,
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	movq	8(%rbx), %rbx	 ; variable_access_101(D)->content.attr_name, _24
 ; D:\TC\temp\codegen.c:729:         if (variable_access->base == NULL || variable_access->content.attr_name == NULL) {
	testq	%rbx, %rbx	 ; _24
	je	.L136	 ;,
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	movl	32(%rbx), %eax	 ; _24->kind, tmp433
	subl	$1, %eax	 ;, tmp305
 ; D:\TC\temp\codegen.c:734:         if (attr_name->kind == SYMBOL_METHOD || attr_name->kind == SYMBOL_FUNCTION)
	cmpl	$1, %eax	 ;, tmp305
	jbe	.L273	 ;,
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	call	codegen_variable_access	 ;
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	movq	%rsi, %r8	 ; status,
	movq	%rbx, %rdx	 ; _24,
 ; D:\TC\temp\codegen.c:736:         Arg* object = codegen_variable_access(variable_access->base, status);
	movq	%rax, %rcx	 ; tmp394, object
 ; D:\TC\temp\codegen.c:737:         if (object == NULL) {
	testq	%rax, %rax	 ; object
	je	.L274	 ;,
.L260:
 ; D:\TC\temp\codegen.c:833: }
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:741:         return emit_attribute_access(object, attr_name, status);
	jmp	emit_attribute_access	 ;
	.p2align 4,,10
	.p2align 3
.L262:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	 ; status_102(D)->tac, status_102(D)->tac
	movq	16(%rax), %rax	 ; _537->global_vars, _83
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	 ; _83
	je	.L253	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	 ; _83->head, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L253	 ;,
	.p2align 4,,10
	.p2align 3
.L125:
 ; D:\TC\temp\codegen.c:202:         Var* var = (Var*)current->content;
	movq	8(%rax), %rbx	 ; current_225->content, var
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	testq	%rbx, %rbx	 ; var
	je	.L124	 ;,
 ; D:\TC\temp\codegen.c:203:         if (var != NULL && var->original_name == symbol)
	cmpq	(%rbx), %r12	 ; var_247->original_name, name
	je	.L259	 ;,
.L124:
 ; D:\TC\temp\codegen.c:205:         current = current->next;
	movq	(%rax), %rax	 ; current_225->next, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L125	 ;,
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r12)	 ;, name_166->kind
	jbe	.L110	 ;,
 ; D:\TC\temp\codegen.c:225:     if (status == NULL || status->current_subroutine == NULL)
	testq	%rdx, %rdx	 ; _222
	je	.L111	 ;,
	movq	16(%rdx), %rcx	 ; _222->parameters, _222->parameters
.L118:
 ; D:\TC\temp\codegen.c:227:     Node* current = status->current_subroutine->parameters->head;
	movq	(%rcx), %rbx	 ; _293->head, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L111	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %r13	 ;, tmp375
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:\TC\temp\codegen.c:229:         Var* var = (Var*)current->content;
	movq	8(%rbx), %rdi	 ; current_621->content, var
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rdi, %rdi	 ; var
	je	.L131	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	(%rdi), %rax	 ; var_296->original_name, _297
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testq	%rax, %rax	 ; _297
	je	.L131	 ;,
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	movq	0(%r13), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	8(%rax), %rcx	 ; _297->name, _297->name
	call	string_equal	 ;
 ; D:\TC\temp\codegen.c:230:         if (var != NULL && var->original_name != NULL && string_equal(var->original_name->name, SELF_KEYWORD))
	testb	%al, %al	 ; tmp384
	jne	.L275	 ;,
.L131:
 ; D:\TC\temp\codegen.c:232:         current = current->next;
	movq	(%rbx), %rbx	 ; current_621->next, current
 ; D:\TC\temp\codegen.c:228:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L130	 ;,
.L111:
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	movq	8(%r12), %rbx	 ; name_166->name, _18
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:724:         fprintf(stderr, "[warning] Unresolved variable access for '%s', creating fallback local\n", name->name);
	leaq	.LC13(%rip), %rdx	 ;, tmp296
	movq	24(%rax), %rcx	 ; _19->_stderr, _19->_stderr
	movq	%rbx, %r8	 ; _18,
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:725:         return create_arg(ARG_VARIABLE, create_var(name, name->type, VAR_VAR, status));
	movq	(%r12), %r13	 ; name_166->type, _21
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rsi), %rdi	 ; status_102(D)->var_count, _335
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp298
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; name, var_330->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp387, var
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp297
	movq	%rax, 56(%rsi)	 ; tmp297, status_102(D)->var_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _343, var_330->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp388, _343
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _335
	je	.L276	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _335,
	movl	$118, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp300
	call	sprintf	 ;
.L134:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _21, var_330->type
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L275:
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rdi), %rax	 ; var_296->type, _12
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	testq	%rax, %rax	 ; _12
	je	.L111	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movl	32(%rax), %ecx	 ; _12->kind,
	testl	%ecx, %ecx	 ;
	jne	.L111	 ;,
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	24(%rax), %rax	 ; _12->ast_node.class, _12->ast_node.class
 ; D:\TC\temp\codegen.c:722:         if (self != NULL && self->type != NULL && self->type->kind == SYMBOL_CLASS && name->ast_node.scope == self->type->ast_node.class->class_scope)
	movq	16(%rax), %rax	 ; _15->class_scope, tmp430
	cmpq	%rax, 24(%r12)	 ; tmp430, name_166->ast_node.scope
	jne	.L111	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp293
 ; D:\TC\temp\codegen.c:723:             return emit_attribute_access(create_arg(ARG_VARIABLE, self), name, status);
	movq	%rsi, %r8	 ; status,
	movq	%r12, %rdx	 ; name,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_296->type, tmp293
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_304->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	 ; tmp385, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_304->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp293, MEM <vector(2) long unsigned int> [(void *)arg_304]
	jmp	.L260	 ;
	.p2align 4,,10
	.p2align 3
.L175:
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:707:         fprintf(stderr, "[warning] Invalid variable access input\n");
	movl	$40, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rcx	 ;, tmp273
	movq	24(%rax), %r9	 ; _4->_stderr,
	call	fwrite	 ;
.L104:
 ; D:\TC\temp\codegen.c:708:         return NULL;
	xorl	%r13d, %r13d	 ; <retval>
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L253:
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r12)	 ;, name_166->kind
	ja	.L111	 ;,
	.p2align 4,,10
	.p2align 3
.L110:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %r13	 ; name_166->type, _10
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rsi), %rdi	 ; status_102(D)->subroutine_count, _288
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp282
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; name, var_277->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp381, var
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp281
	movq	%rax, 80(%rsi)	 ; tmp281, status_102(D)->subroutine_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _290, var_277->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp382, _290
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _288
	je	.L277	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _288,
	movl	$102, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp284
	call	sprintf	 ;
.L128:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _10, var_277->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp285
	movhps	16(%rbx), %xmm0	 ;, tmp285
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;, arg_264->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp383, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp285,* <retval>
 ; D:\TC\temp\codegen.c:720:             return create_arg(ARG_SUBROUTINE, create_var(name, name->type, VAR_SUBROUTINE, status));
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L119:
 ; D:\TC\temp\codegen.c:221:     return find_var_by_symbol(status->tac->global_vars, symbol);
	movq	(%rsi), %rax	 ; status_102(D)->tac, status_102(D)->tac
	movq	16(%rax), %rax	 ;, _242
 ; D:\TC\temp\codegen.c:198:     if (vars == NULL || symbol == NULL)
	testq	%rax, %rax	 ; _242
	je	.L122	 ;,
 ; D:\TC\temp\codegen.c:200:     Node* current = vars->head;
	movq	(%rax), %rax	 ;* _608, current
 ; D:\TC\temp\codegen.c:201:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L125	 ;,
.L122:
 ; D:\TC\temp\codegen.c:719:         if (name->kind == SYMBOL_FUNCTION || name->kind == SYMBOL_METHOD || name->kind == SYMBOL_CLASS)
	cmpl	$2, 32(%r12)	 ;, name_166->kind
	ja	.L118	 ;,
	jmp	.L110	 ;
	.p2align 4,,10
	.p2align 3
.L152:
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:831:     fprintf(stderr, "[warning] Unsupported variable access type for codegen_variable_access: %d\n", variable_access->type);
	movl	%edi, %r8d	 ; _6,
	leaq	.LC22(%rip), %rdx	 ;, tmp371
	movq	24(%rax), %rcx	 ; _87->_stderr, _87->_stderr
	call	fprintf	 ;
 ; D:\TC\temp\codegen.c:832:     return NULL;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L276:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$118, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp299
	call	sprintf	 ;
	jmp	.L134	 ;
	.p2align 4,,10
	.p2align 3
.L270:
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp330
	call	sprintf	 ;
	jmp	.L151	 ;
	.p2align 4,,10
	.p2align 3
.L261:
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:713:             fprintf(stderr, "[warning] Variable access name is NULL\n");
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rcx	 ;, tmp275
	movq	24(%rax), %r9	 ; _7->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:714:             return NULL;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L273:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %r12	 ; _24->type, _29
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp308
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rbx, (%rax)	 ; _24, var_358->original_name
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rsi), %rbx	 ; status_102(D)->subroutine_count, _369
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp391, var
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp307
	movq	%rax, 80(%rsi)	 ; tmp307, status_102(D)->subroutine_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _371, var_358->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp392, _371
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	 ;, _369
	je	.L278	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _369,
	movl	$102, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp310
	call	sprintf	 ;
.L140:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r12, 16(%rdi)	 ; _29, var_358->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp311
	movhps	16(%rdi), %xmm0	 ; var_358->type, tmp311
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;, arg_345->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp393, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp311,* <retval>
 ; D:\TC\temp\codegen.c:735:             return create_arg(ARG_SUBROUTINE, create_var(attr_name, attr_name->type, VAR_SUBROUTINE, status));
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L272:
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	movq	(%rax), %rax	 ; callee_108->value.subroutine, _67
 ; D:\TC\temp\codegen.c:791:             if (callee->kind == ARG_SUBROUTINE && callee->value.subroutine != NULL)
	testq	%rax, %rax	 ; _67
	je	.L161	 ;,
 ; D:\TC\temp\codegen.c:792:                 callee_name = callee->value.subroutine->original_name;
	movq	(%rax), %r12	 ; _67->original_name, callee_name
 ; D:\TC\temp\codegen.c:799:         if (callee_name == NULL) {
	testq	%r12, %r12	 ; callee_name
	je	.L161	 ;,
.L174:
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	xorl	%edi, %edi	 ; argument_count
	jmp	.L158	 ;
	.p2align 4,,10
	.p2align 3
.L267:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	leaq	.LC1(%rip), %r15	 ;, tmp373
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:168:             arg->value.string_value = NULL;
	movq	$0, (%rax)	 ;, arg_401->value.string_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp417, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$5, 16(%rax)	 ;, arg_401->kind
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp349
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_401->is_get
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	movq	(%r12), %r14	 ; callee_name_168->type, _78
 ; D:\TC\temp\codegen.c:169:             arg->type = name_void;
	movq	(%rax), %rax	 ; name_void, name_void.9_410
	movq	%rax, 8(%r13)	 ; name_void.9_410, arg_401->type
 ; D:\TC\temp\codegen.c:822:         if (callee_name->type != NULL && callee_name->type != name_void)
	cmpq	%rax, %r14	 ; name_void.9_410, _78
	je	.L167	 ;,
	testq	%r14, %r14	 ; _78
	je	.L167	 ;,
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rsi), %r13	 ; status_102(D)->temp_count, _434
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp373,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_427->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp418, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r13), %rax	 ;, tmp354
	movq	%rax, 64(%rsi)	 ; tmp354, status_102(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _440, var_427->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp419, _440
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r13	 ;, _434
	je	.L279	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r13, %r9	 ; _434,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp357
	call	sprintf	 ;
.L169:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r14, 16(%rbx)	 ; _78, var_427->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp358
	movhps	16(%rbx), %xmm0	 ; var_427->type, tmp358
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_414->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp420, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_414->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp358, MEM <vector(2) long unsigned int> [(void *)arg_414]
 ; D:\TC\temp\codegen.c:825:         Arg* callee_arg = create_arg(ARG_SUBROUTINE, create_var(callee_name, callee_name->type, VAR_SUBROUTINE, status));
	movq	(%r12), %r14	 ; callee_name_168->type, _78
.L167:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp373,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; callee_name, var_468->original_name
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	80(%rsi), %r12	 ; status_102(D)->subroutine_count, _479
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp421, var
 ; D:\TC\temp\codegen.c:123:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r12), %rax	 ;, tmp360
	movq	%rax, 80(%rsi)	 ; tmp360, status_102(D)->subroutine_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _481, var_468->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp422, _481
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	 ;, _479
	je	.L280	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r12, %r9	 ; _479,
	movl	$102, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp363
	call	sprintf	 ;
.L171:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r14, 16(%rbx)	 ; _78, var_468->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp364
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; var_468->type, tmp364
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;, arg_455->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp423, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_455->is_get
 ; D:\TC\temp\codegen.c:175:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp364, MEM <vector(2) long unsigned int> [(void *)arg_455]
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rdi, (%rax)	 ; argument_count, arg_442->value.int_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp424, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_442->kind
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp366
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_442->is_get
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rbx)	 ; name_int, arg_442->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_199->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp425, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_199->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg, inst_199->arg3
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$22, 24(%rax)	 ;, inst_199->type
 ; D:\TC\temp\codegen.c:827:         list_append(status->current_block->instructions, (pointer)call_inst);
	movq	16(%rsi), %rax	 ; status_102(D)->current_block, status_102(D)->current_block
	movq	8(%rax), %rcx	 ; _85->instructions, _85->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:828:         return result;
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L277:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$102, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp283
	call	sprintf	 ;
	jmp	.L128	 ;
.L143:
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:746:             fprintf(stderr, "[warning] Invalid get-sequence access\n");
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rcx	 ;, tmp316
	movq	24(%rax), %r9	 ; _35->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:747:             return NULL;
	jmp	.L104	 ;
.L136:
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:730:             fprintf(stderr, "[warning] Invalid get-attribute access\n");
	movl	$39, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp304
	movq	24(%rax), %r9	 ; _25->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:731:             return NULL;
	jmp	.L104	 ;
.L269:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _39,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp401, _39
	jmp	.L147	 ;
.L268:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _37,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp398, _37
	jmp	.L145	 ;
.L274:
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:738:             fprintf(stderr, "[warning] Failed to generate object for get-attribute access\n");
	movl	$61, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp314
	movq	24(%rax), %r9	 ; _31->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:739:             return NULL;
	jmp	.L104	 ;
.L265:
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:767:             fprintf(stderr, "[warning] Invalid function call without callee\n");
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rcx	 ;, tmp337
	movq	24(%rax), %r9	 ; _53->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:768:             return NULL;
	jmp	.L104	 ;
.L148:
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:752:             fprintf(stderr, "[warning] Failed to generate sequence/index for get-sequence access\n");
	movl	$68, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rcx	 ;, tmp319
	movq	24(%rax), %r9	 ; _43->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:753:             return NULL;
	jmp	.L104	 ;
.L278:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$102, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp309
	call	sprintf	 ;
	jmp	.L140	 ;
.L280:
	movl	$102, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp362
	call	sprintf	 ;
	jmp	.L171	 ;
.L271:
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:788:                 fprintf(stderr, "[warning] Failed to generate callee for function call\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp341
	movq	24(%rax), %r9	 ; _64->_stderr,
	call	fwrite	 ;
 ; D:\TC\temp\codegen.c:789:                 return NULL;
	jmp	.L104	 ;
.L279:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp356
	call	sprintf	 ;
	jmp	.L169	 ;
.L266:
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rcx	 ; tmp408, receiver
 ; D:\TC\temp\codegen.c:805:         if (receiver != NULL) {
	testq	%rax, %rax	 ; receiver
	jne	.L157	 ;,
 ; D:\TC\temp\codegen.c:804:         size_t argument_count = 0;
	xorl	%edi, %edi	 ; argument_count
	jmp	.L158	 ;
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC25:
	.ascii "[warning] Unsupported primary type for codegen_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB26:
	.text
.LHOTB26:
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
	ja	.L282	 ;,
	movq	%rdx, %rsi	 ; tmp198, status
	leaq	.L284(%rip), %rdx	 ;, tmp145
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp147
	addq	%rdx, %rax	 ; tmp145, tmp148
	jmp	*%rax	 ; tmp148
	.section .rdata,"dr"
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
 ; D:\TC\temp\codegen.c:682:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	movq	%rsi, %rdx	 ; status,
	call	codegen_primary	 ;
	movq	%rax, %r12	 ; tmp212, _15
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; _15
	je	.L297	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _15->is_get
	jne	.L309	 ;,
.L298:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%r12), %r13	 ; _90->type, _16
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rsi), %rbx	 ; status_39(D)->temp_count, _225
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp176
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_218->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp214, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp175
	movq	%rax, 64(%rsi)	 ; tmp175, status_39(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _231, var_218->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp215, _231
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	 ;, _225
	je	.L310	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _225,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp178
	call	sprintf	 ;
.L300:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rdi)	 ; _16, var_218->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp179
	movhps	16(%rdi), %xmm0	 ; var_218->type, tmp179
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdi	 ;, tmp181
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_205->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp216, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_205->kind
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp179, MEM <vector(2) long unsigned int> [(void *)arg_205]
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	movq	8(%r12), %rax	 ; _90->type, _18
 ; D:\TC\temp\codegen.c:687:             if (operand->type == name_int)
	cmpq	(%rdi), %rax	 ; name_int, _18
	je	.L311	 ;,
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %r13	 ;, tmp184
 ; D:\TC\temp\codegen.c:689:             else if (operand->type == name_float)
	cmpq	0(%r13), %rax	 ; name_float, _18
	je	.L312	 ;,
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	leaq	.LC24(%rip), %rdx	 ;, tmp189
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
 ; D:\TC\temp\codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:\TC\temp\codegen.c:692:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L283:
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.var
 ; D:\TC\temp\codegen.c:703: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
 ; D:\TC\temp\codegen.c:698:         case PRIM_VARIABLE_ACCESS: return codegen_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:703: }
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
.L292:
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	xorl	%edx, %edx	 ;
	call	strtoll	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:657:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rsi	 ; tmp199, _3
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; _3, arg_112->value.int_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp200, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_112->kind
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp151
	movq	(%rax), %rax	 ;, name_int
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int,
.L281:
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
.L291:
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:661:             double t = strtod(primary->value.literal_value, NULL);
	movapd	%xmm0, %xmm6	 ; tmp201, _5
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movsd	%xmm6, (%rax)	 ; _5, arg_125->value.float_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp202, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_125->kind
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp154
	movq	(%rax), %rax	 ;, name_float
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	%rax, 8(%rbx)	 ; name_float,
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L290:
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %xmm6	 ; primary_38(D)->value.literal_value, _6
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$3, 16(%rax)	 ;, arg_138->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp203, <retval>
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movdqa	%xmm6, %xmm0	 ; _6, tmp156
	movq	.refptr.name_string(%rip), %rax	 ;, tmp157
	movhps	(%rax), %xmm0	 ; name_string, tmp156
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:160:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rbx)	 ; tmp156, MEM <vector(2) long unsigned int> [(void *)arg_138]
 ; D:\TC\temp\codegen.c:664:         case PRIM_STRING: return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L289:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	 ;, arg_151->value.bool_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp204, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_151->kind
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp159
	movq	(%rax), %rax	 ;, name_bool
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L288:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:164:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	 ;, arg_164->value.bool_value
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp205, <retval>
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_164->kind
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp161
	movq	(%rax), %rax	 ;, name_bool
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:\TC\temp\codegen.c:165:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L287:
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
 ; D:\TC\temp\codegen.c:703: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
 ; D:\TC\temp\codegen.c:673:         case PRIM_EXPRESSION: return codegen_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:703: }
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
.L286:
 ; D:\TC\temp\codegen.c:675:             Arg* operand = load_rvalue(codegen_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	movq	%rsi, %rdx	 ; status,
	call	codegen_primary	 ;
	movq	%rax, %r12	 ; tmp206, _9
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; _9
	je	.L294	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L313	 ;,
.L294:
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp165
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:676:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %r13	 ; name_bool, name_bool.10_10
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rsi), %rbx	 ; status_39(D)->temp_count, _197
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp167
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_190->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp208, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp166
	movq	%rax, 64(%rsi)	 ; tmp166, status_39(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _203, var_190->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp209, _203
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	 ;, _197
	je	.L314	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _197,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp169
	call	sprintf	 ;
.L296:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r13, 16(%rdi)	 ; name_bool.10_10, var_190->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp170
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_190->type, tmp170
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_177->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp210, <retval>
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_177->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp170, MEM <vector(2) long unsigned int> [(void *)arg_177]
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; _9, inst_84->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp211, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_84->arg1
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$13, 24(%rax)	 ;, inst_84->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_84->arg3
 ; D:\TC\temp\codegen.c:678:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _12->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:679:             return temp;
	jmp	.L281	 ;
.L282:
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC25(%rip), %rdx	 ;, tmp194
 ; D:\TC\temp\codegen.c:701:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:\TC\temp\codegen.c:700:             fprintf(stderr, "[warning] Unsupported primary type for codegen_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L312:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_246->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp219, arg
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	.LC23(%rip), %rax	 ;, tmp227
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_246->is_get
 ; D:\TC\temp\codegen.c:156:             arg->value.float_value = *(double*)value;
	movq	%rax, (%rdi)	 ; tmp227, arg_246->value.float_value
 ; D:\TC\temp\codegen.c:157:             arg->type = name_float;
	movq	0(%r13), %rax	 ; name_float, name_float
	movq	%rax, 8(%rdi)	 ; name_float, arg_246->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$2, 24(%rax)	 ;, inst_92->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp220, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_92->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; arg, inst_92->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _15,
.L302:
 ; D:\TC\temp\codegen.c:695:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:696:             return temp;
	jmp	.L281	 ;
	.p2align 4,,10
	.p2align 3
.L310:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp177
	call	sprintf	 ;
	jmp	.L300	 ;
	.p2align 4,,10
	.p2align 3
.L314:
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp168
	call	sprintf	 ;
	jmp	.L296	 ;
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _9,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp207, _9
	jmp	.L294	 ;
	.p2align 4,,10
	.p2align 3
.L309:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _15,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp213, _15
	jmp	.L298	 ;
	.p2align 4,,10
	.p2align 3
.L311:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_233->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp217, arg
 ; D:\TC\temp\codegen.c:152:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_233->value.int_value
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	(%rdi), %rax	 ; name_int, name_int
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_233->is_get
 ; D:\TC\temp\codegen.c:153:             arg->type = name_int;
	movq	%rax, 8(%r13)	 ; name_int, arg_233->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$1, 24(%rax)	 ;, inst_91->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp218, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_91->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_91->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _15,
	jmp	.L302	 ;
	.section	.text.unlikely,"x"
	.def	codegen_primary.cold;	.scl	3;	.type	32;	.endef
codegen_primary.cold:
.L297:
 ; D:\TC\temp\codegen.c:683:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _349
	ud2	
	.text
	.section	.text.unlikely,"x"
.LCOLDE26:
	.text
.LHOTE26:
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	codegen_expression
	.def	codegen_expression;	.scl	2;	.type	32;	.endef
codegen_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp157, expression
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp158, status
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:\TC\temp\codegen.c:628:     if (expression->operator == OP_NONE)
	cmpl	$19, 24(%rcx)	 ;, expression_29(D)->operator
	je	.L340	 ;,
 ; D:\TC\temp\codegen.c:630:     Arg* right = load_rvalue(codegen_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_29(D)->right, expression_29(D)->right
	call	codegen_expression	 ;
	movq	%rax, %rsi	 ; tmp159, <retval>
 ; D:\TC\temp\codegen.c:187:     if (arg == NULL)
	testq	%rax, %rax	 ; <retval>
	je	.L317	 ;,
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _4->is_get
	jne	.L341	 ;,
.L317:
 ; D:\TC\temp\codegen.c:631:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	 ; expression_29(D)->operator,
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	(%r12), %rcx	 ; expression_29(D)->expr_left, pretmp_100
	cmpl	$18, %eax	 ;, _5
	ja	.L318	 ;,
	leaq	CSWTCH.22(%rip), %rdx	 ;, tmp132
	movl	(%rdx,%rax,4), %r13d	 ; CSWTCH.22[_5], _47
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
	movq	%rax, %rdi	 ; tmp161, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	 ; expression_29(D)->operator, expression_29(D)->operator
	subl	$13, %eax	 ;, tmp134
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp134
	ja	.L319	 ;,
 ; D:\TC\temp\codegen.c:635:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	 ;, _47
	jne	.L329	 ;,
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%rdi), %eax	 ; left_40->kind,
	testl	%eax, %eax	 ;
	jne	.L342	 ;,
.L324:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_56->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp168, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; left, inst_56->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_56->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_56->arg3
 ; D:\TC\temp\codegen.c:644:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_40->is_get
	jne	.L343	 ;,
.L325:
 ; D:\TC\temp\codegen.c:651:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_30(D)->current_block, status_30(D)->current_block
	movq	8(%rax), %rcx	 ; _18->instructions, _18->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:653: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
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
.L318:
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	 ;, _47
 ; D:\TC\temp\codegen.c:632:     Arg* left = codegen_expression(expression->expr_left, status);
	call	codegen_expression	 ;
	movq	%rax, %rdi	 ; tmp175, left
 ; D:\TC\temp\codegen.c:48:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	 ; expression_29(D)->operator, expression_29(D)->operator
	subl	$13, %eax	 ;, tmp155
 ; D:\TC\temp\codegen.c:634:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp155
	ja	.L319	 ;,
.L329:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:636:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %r12	 ; left_161->type, _8
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbx), %r15	 ; status_30(D)->temp_count, _108
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp137
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_101->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp162, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp136
	movq	%rax, 64(%rbx)	 ; tmp136, status_30(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _114, var_101->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp163, _114
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _108
	je	.L344	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _108,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp139
	call	sprintf	 ;
.L322:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r12, 16(%r14)	 ; _8, var_101->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp140
	movhps	16(%r14), %xmm0	 ; var_101->type, tmp140
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_88->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp164, arg
 ; D:\TC\temp\codegen.c:194:     return arg;
	movq	%rdi, %r14	 ; left, _54
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_88->kind
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp140, MEM <vector(2) long unsigned int> [(void *)arg_88]
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	 ;, left_161->is_get
	jne	.L345	 ;,
.L323:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _54, inst_52->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp166, inst
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_52->arg3
 ; D:\TC\temp\codegen.c:639:             right = temp;
	movq	%r12, %rsi	 ; arg, <retval>
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _47, inst_52->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_52->arg1
 ; D:\TC\temp\codegen.c:638:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_30(D)->current_block, status_30(D)->current_block
	movq	8(%rax), %rcx	 ; _10->instructions, _10->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:641:         if (left->kind != ARG_VARIABLE)
	movl	16(%rdi), %eax	 ; left_40->kind,
	testl	%eax, %eax	 ;
	je	.L324	 ;,
.L342:
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:642:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rcx	 ;, tmp145
	movq	24(%rax), %r9	 ; _13->_stderr,
	call	fwrite	 ;
	jmp	.L324	 ;
	.p2align 4,,10
	.p2align 3
.L319:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:647:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %r12	 ; left_127->type, _16
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	movq	64(%rbx), %r15	 ; status_30(D)->temp_count, _136
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp147
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_129->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp170, var
 ; D:\TC\temp\codegen.c:121:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp146
	movq	%rax, 64(%rbx)	 ; tmp146, status_30(D)->temp_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _142, var_129->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp171, _142
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _136
	je	.L346	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _136,
	movl	$116, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp149
	call	sprintf	 ;
.L327:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%r12, 16(%r14)	 ; _16, var_129->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp150
	movhps	16(%r14), %xmm0	 ; var_129->type, tmp150
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_116->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp172, arg
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_116->is_get
 ; D:\TC\temp\codegen.c:148:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp150, MEM <vector(2) long unsigned int> [(void *)arg_116]
 ; D:\TC\temp\codegen.c:189:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	 ;, left_127->is_get
	jne	.L347	 ;,
.L328:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_58->arg3
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp174, inst
 ; D:\TC\temp\codegen.c:649:         right = temp;
	movq	%r12, %rsi	 ; arg, <retval>
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _47, inst_58->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_58->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; left, inst_58->arg2
	jmp	.L325	 ;
	.p2align 4,,10
	.p2align 3
.L340:
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_29(D)->prim_left, expression_29(D)->prim_left
 ; D:\TC\temp\codegen.c:653: }
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:629:         return codegen_primary(expression->prim_left, status);
	jmp	codegen_primary	 ;
	.p2align 4,,10
	.p2align 3
.L346:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp148
	call	sprintf	 ;
	jmp	.L327	 ;
	.p2align 4,,10
	.p2align 3
.L344:
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp138
	call	sprintf	 ;
	jmp	.L322	 ;
	.p2align 4,,10
	.p2align 3
.L343:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$24, 24(%rax)	 ;, inst_57->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp169, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; left, inst_57->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_57->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_57->arg3
	jmp	.L325	 ;
	.p2align 4,,10
	.p2align 3
.L341:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; <retval>,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp160, <retval>
	jmp	.L317	 ;
	.p2align 4,,10
	.p2align 3
.L347:
	movq	%rdi, %rcx	 ; left,
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp173, left
	jmp	.L328	 ;
	.p2align 4,,10
	.p2align 3
.L345:
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp165, _54
	jmp	.L323	 ;
	.p2align 4
	.globl	codegen_if
	.def	codegen_if;	.scl	2;	.type	32;	.endef
codegen_if:
	pushq	%r15	 ;
	pushq	%r14	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %r14	 ;, tmp221
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r13	 ;
	movq	%rcx, %r13	 ; tmp224, if_
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:451: void codegen_if(If* if_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp225, status
	subq	$72, %rsp	 ;,
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rsi	 ; status_52(D)->block_count, _223
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_214->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp226, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp170
	movq	%rax, 72(%rbx)	 ; tmp170, status_52(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _227, var_214->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp227, _227
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _223
	je	.L382	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _223,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp173
	call	sprintf	 ;
.L350:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_214->type
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rbp	 ; status_52(D)->block_count, _208
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_199->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp228, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp174
	movq	%rax, 72(%rbx)	 ; tmp174, status_52(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _212, var_199->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp229, _212
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _208
	je	.L383	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _208,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp177
	call	sprintf	 ;
.L352:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rsi)	 ;, var_199->type
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r13), %rcx	 ; if__57(D)->else_if, if__57(D)->else_if
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp230
	je	.L357	 ;,
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r13), %rcx	 ; if__57(D)->else_body, if__57(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:457:         end_label = else_label;
	movq	%rsi, 56(%rsp)	 ; var, %sfp
 ; D:\TC\temp\codegen.c:456:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp233
	je	.L357	 ;,
.L356:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rbx, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_114->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp234, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_114->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	56(%rsp), %rax	 ; %sfp, var
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_114->is_get
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	0(%r13), %rcx	 ; if__57(D)->condition, if__57(D)->condition
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rax, (%r12)	 ; var, arg_114->value.label
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:462:     Arg* condition = codegen_expression(if_->condition, status);
	movq	%rax, 40(%rsp)	 ; condition, %sfp
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_113->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp236, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_113->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; var, arg_113->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_113->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_112->value.label
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_112->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_112->type
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_112->is_get
	movq	%rax, 32(%rsp)	 ; arg, %sfp
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	40(%rsp), %r9	 ; %sfp, condition
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	32(%rsp), %r8	 ; %sfp, arg
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp238, inst
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	 ; arg, inst_111->arg3
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r8, 8(%rax)	 ; arg, inst_111->arg2
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r9, (%rax)	 ; condition, inst_111->arg1
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_111->type
 ; D:\TC\temp\codegen.c:464:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _6->instructions, _6->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_109->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp239, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp240, block_109->instructions
 ; D:\TC\temp\codegen.c:467:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _8->blocks, _8->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:468:     status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:\TC\temp\codegen.c:470:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r13), %rcx	 ; if__57(D)->body, if__57(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp241, then_statements
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L359	 ;
	.p2align 4,,10
	.p2align 3
.L360:
 ; D:\TC\temp\codegen.c:473:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L359:
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp242, statement
 ; D:\TC\temp\codegen.c:472:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L360	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_115->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp243, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_115->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_115->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_115->arg3
 ; D:\TC\temp\codegen.c:476:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r13), %rcx	 ; if__57(D)->else_if, if__57(D)->else_if
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:478:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp244
	je	.L384	 ;,
.L361:
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r13), %rcx	 ; if__57(D)->else_body, if__57(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:511:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp264
	je	.L385	 ;,
.L372:
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp270, block
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	56(%rsp), %rax	 ; %sfp, var
	movq	%rax, (%rsi)	 ; var, block_127->label
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp271, block_127->instructions
 ; D:\TC\temp\codegen.c:527:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _36->blocks, _36->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:528:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_52(D)->current_block
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
.L357:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rbp	 ; status_52(D)->block_count, _238
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_229->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	 ; tmp231, var
	movq	%rax, 56(%rsp)	 ; var, %sfp
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp179
	movq	%rax, 72(%rbx)	 ; tmp179, status_52(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	 ; _242, var_229->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp232, _242
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _238
	je	.L386	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _238,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp183
	call	sprintf	 ;
.L358:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	56(%rsp), %rax	 ; %sfp, var
	movq	$0, 16(%rax)	 ;, var_229->type
	jmp	.L356	 ;
	.p2align 4,,10
	.p2align 3
.L386:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp182
	call	sprintf	 ;
	jmp	.L358	 ;
	.p2align 4,,10
	.p2align 3
.L383:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp176
	call	sprintf	 ;
	jmp	.L352	 ;
	.p2align 4,,10
	.p2align 3
.L382:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp172
	call	sprintf	 ;
	jmp	.L350	 ;
	.p2align 4,,10
	.p2align 3
.L385:
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rsi, (%rax)	 ; var, block_124->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp265, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp266, block_124->instructions
 ; D:\TC\temp\codegen.c:514:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _31->blocks, _31->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:515:         status->current_block = else_block;
	movq	%rdi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:\TC\temp\codegen.c:517:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r13), %rcx	 ; if__57(D)->else_body, if__57(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp267, else_statements
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L373	 ;
	.p2align 4,,10
	.p2align 3
.L374:
 ; D:\TC\temp\codegen.c:520:             codegen_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L373:
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp268, else_statement
 ; D:\TC\temp\codegen.c:519:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L374	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_126->arg1
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp269, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_126->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_126->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_126->arg3
 ; D:\TC\temp\codegen.c:523:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _34->instructions, _34->instructions
	call	list_append	 ;
	jmp	.L372	 ;
	.p2align 4,,10
	.p2align 3
.L384:
 ; D:\TC\temp\codegen.c:480:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r13), %rcx	 ; if__57(D)->else_if, if__57(D)->else_if
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp245, %sfp
	.p2align 4,,10
	.p2align 3
.L362:
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp263, elif
 ; D:\TC\temp\codegen.c:482:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L361	 ;,
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rsi, (%rax)	 ; var, block_116->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp246, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp247, block_116->instructions
 ; D:\TC\temp\codegen.c:485:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _16->blocks, _16->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:486:             status->current_block = else_if_block;
	movq	%rdi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rsi	 ; status_52(D)->block_count, _268
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_259->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp248, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp196
	movq	%rax, 72(%rbx)	 ; tmp196, status_52(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _272, var_259->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp249, _272
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _268
	je	.L387	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _268,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;,
	call	sprintf	 ;
.L364:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_259->type
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r15	 ; status_52(D)->block_count, _253
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_244->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp250, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r15), %rax	 ;, tmp200
	movq	%rax, 72(%rbx)	 ; tmp200, status_52(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _257, var_244->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp251, _257
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _253
	je	.L388	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _253,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;,
	call	sprintf	 ;
.L366:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rsi)	 ;, var_244->type
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	0(%rbp), %rcx	 ; elif_77->condition, elif_77->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	32(%rsp), %rcx	 ; %sfp,
 ; D:\TC\temp\codegen.c:491:             condition = codegen_expression(elif->condition, status);
	movq	%rax, 40(%rsp)	 ; tmp252, %sfp
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp253
	jne	.L389	 ;,
.L368:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_122->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	 ; tmp255, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_122->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; var, arg_122->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_122->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_121->value.label
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_121->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_121->type
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_121->is_get
	movq	%rax, 48(%rsp)	 ; arg, %sfp
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	48(%rsp), %r9	 ; %sfp, arg
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp257, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_120->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	40(%rsp), %rax	 ; %sfp, condition
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r9, 8(%rdx)	 ; arg, inst_120->arg2
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rax, (%rdx)	 ; condition, inst_120->arg1
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r15, 16(%rdx)	 ; arg, inst_120->arg3
 ; D:\TC\temp\codegen.c:495:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_118->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r15	 ; tmp258, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r15, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r15)	 ; tmp259, block_118->instructions
 ; D:\TC\temp\codegen.c:498:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _24->blocks, _24->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:499:             status->current_block = then_block;
	movq	%r15, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:\TC\temp\codegen.c:501:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rbp), %rcx	 ; elif_77->body, elif_77->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp260, elif_statements
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L369	 ;
	.p2align 4,,10
	.p2align 3
.L370:
 ; D:\TC\temp\codegen.c:504:                 codegen_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L369:
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp261, elif_statement
 ; D:\TC\temp\codegen.c:503:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L370	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_123->arg1
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp262, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_123->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_123->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_123->arg3
 ; D:\TC\temp\codegen.c:507:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _27->instructions, _27->instructions
	call	list_append	 ;
	jmp	.L362	 ;
	.p2align 4,,10
	.p2align 3
.L388:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L366	 ;
	.p2align 4,,10
	.p2align 3
.L387:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L364	 ;
	.p2align 4,,10
	.p2align 3
.L389:
 ; D:\TC\temp\codegen.c:492:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r13), %rcx	 ; if__57(D)->else_body, if__57(D)->else_body
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:493:                 else_label = end_label;
	testb	%al, %al	 ; tmp254
	cmovne	56(%rsp), %rsi	 ; var,, %sfp, var
	jmp	.L368	 ;
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
	.p2align 4
	.globl	codegen_statement
	.def	codegen_statement;	.scl	2;	.type	32;	.endef
codegen_statement:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_30(D)->type,
 ; D:\TC\temp\codegen.c:412:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L391	 ;,
	movq	%rdx, %rsi	 ; tmp161, status
	leaq	.L393(%rip), %rdx	 ;, tmp126
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp128
	addq	%rdx, %rax	 ; tmp126, tmp129
	jmp	*%rax	 ; tmp129
	.section .rdata,"dr"
	.align 4
.L393:
	.long	.L400-.L393
	.long	.L399-.L393
	.long	.L398-.L393
	.long	.L397-.L393
	.long	.L396-.L393
	.long	.L395-.L393
	.long	.L394-.L393
	.long	.L392-.L393
	.text
	.p2align 4,,10
	.p2align 3
.L394:
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	movq	24(%rsi), %rcx	 ; status_31(D)->end_labels, status_31(D)->end_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:425:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp166
	jne	.L403	 ;,
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	24(%rsi), %rax	 ; status_31(D)->end_labels, status_31(D)->end_labels
 ; D:\TC\temp\codegen.c:426:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _12->tail, _12->tail
	movq	8(%rax), %rbx	 ; _13->content, label
 ; D:\TC\temp\codegen.c:427:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	je	.L403	 ;,
.L415:
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;,
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp170, inst
	jmp	.L413	 ;
	.p2align 4,,10
	.p2align 3
.L392:
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	movq	32(%rsi), %rcx	 ; status_31(D)->start_labels, status_31(D)->start_labels
	call	list_is_empty	 ;
 ; D:\TC\temp\codegen.c:436:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp169
	jne	.L404	 ;,
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	32(%rsi), %rax	 ; status_31(D)->start_labels, status_31(D)->start_labels
 ; D:\TC\temp\codegen.c:437:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _20->tail, _20->tail
	movq	8(%rax), %rbx	 ; _21->content, label
 ; D:\TC\temp\codegen.c:438:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	jne	.L415	 ;,
.L404:
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rcx	 ;, tmp157
	movq	24(%rax), %r9	 ; _24->_stderr,
	jmp	.L414	 ;
	.p2align 4,,10
	.p2align 3
.L398:
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.if_stmt, statement_30(D)->stmt.if_stmt
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:415:         case IF_STATEMENT: codegen_if(statement->stmt.if_stmt, status); break;
	jmp	codegen_if	 ;
	.p2align 4,,10
	.p2align 3
.L400:
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.expr, statement_30(D)->stmt.expr
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:413:         case EXPRESSION_STATEMENT: codegen_expression(statement->stmt.expr, status); break;
	jmp	codegen_expression	 ;
	.p2align 4,,10
	.p2align 3
.L399:
 ; D:\TC\temp\codegen.c:414:         case VARIABLE_STATEMENT: codegen_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rcx), %rax	 ; statement_30(D)->stmt.var, _3
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	8(%rax), %rdi	 ; _3->name, _71
	movq	(%rax), %rbp	 ; _3->type, _70
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp133
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%rdi, (%rax)	 ; _71, var_90->original_name
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rsi), %rdi	 ; status_31(D)->var_count, _95
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp162, var
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp132
	movq	%rax, 56(%rsi)	 ; tmp132, status_31(D)->var_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _103, var_90->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp163, _103
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _95
	je	.L416	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _95,
	movl	$118, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp135
	call	sprintf	 ;
.L402:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_31(D)->current_subroutine, status_31(D)->current_subroutine
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rbx)	 ; _70, var_90->type
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rbx, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _75->local_vars, _75->local_vars
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L396:
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.for_stmt, statement_30(D)->stmt.for_stmt
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:417:         case FOR_STATEMENT: codegen_for(statement->stmt.for_stmt, status); break;
	jmp	codegen_for	 ;
	.p2align 4,,10
	.p2align 3
.L395:
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.return_expr, statement_30(D)->stmt.return_expr
	movq	%rsi, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:419:             Arg* return_value = codegen_expression(statement->stmt.return_expr, status);
	movq	%rax, %rbx	 ; tmp164, return_value
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$21, 24(%rax)	 ;, inst_52->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp165, inst
.L413:
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_31(D)->current_block, status_31(D)->current_block
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbx, (%rdx)	 ; return_value,* inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rdx)	 ;,
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rdx)	 ;,
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rcx	 ;, _8->instructions
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:421:             list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L397:
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_30(D)->stmt.while_stmt, statement_30(D)->stmt.while_stmt
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	movq	%rsi, %rdx	 ; status,
 ; D:\TC\temp\codegen.c:450: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:416:         case WHILE_STATEMENT: codegen_while(statement->stmt.while_stmt, status); break;
	jmp	codegen_while	 ;
	.p2align 4,,10
	.p2align 3
.L403:
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:433:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC28(%rip), %rcx	 ;, tmp150
	movq	24(%rax), %r9	 ; _16->_stderr,
.L414:
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:444:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	jmp	fwrite	 ;
.L391:
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC30(%rip), %rdx	 ;, tmp159
	movq	24(%rax), %rcx	 ; _26->_stderr, _26->_stderr
 ; D:\TC\temp\codegen.c:450: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\temp\codegen.c:447:             fprintf(stderr, "[warning] Unsupported statement type for codegen_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L416:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$118, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp134
	call	sprintf	 ;
	jmp	.L402	 ;
	.p2align 4
	.globl	codegen_for
	.def	codegen_for;	.scl	2;	.type	32;	.endef
codegen_for:
	pushq	%r15	 ;
	leaq	.LC1(%rip), %r15	 ;, tmp217
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp218, for_
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp219, status
	subq	$56, %rsp	 ;,
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	movq	(%rcx), %rax	 ; for__42(D)->initializer, _1
 ; D:\TC\temp\codegen.c:532:     if (for_->initializer != NULL)
	testq	%rax, %rax	 ; _1
	je	.L418	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	8(%rax), %r12	 ; _1->name, _207
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:385:     Var* var = create_var(variable->name, variable->type, type, status);
	movq	(%rax), %rbp	 ; _1->type, _206
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp217,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; _207, var_226->original_name
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	movq	56(%rbx), %r12	 ; status_43(D)->var_count, _231
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp220, var
 ; D:\TC\temp\codegen.c:120:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	 ;, tmp168
	movq	%rax, 56(%rbx)	 ; tmp168, status_43(D)->var_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _239, var_226->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp221, _239
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r12	 ;, _231
	je	.L442	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r12, %r9	 ; _231,
	movl	$118, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp171
	call	sprintf	 ;
.L420:
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_43(D)->current_subroutine, status_43(D)->current_subroutine
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rbp, 16(%rsi)	 ; _206, var_226->type
 ; D:\TC\temp\codegen.c:391:             list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rsi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _211->local_vars, _211->local_vars
	call	list_append	 ;
.L418:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rsi	 ; status_43(D)->block_count, _288
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp217,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_279->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	 ; tmp222, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp174
	movq	%rax, 72(%rbx)	 ; tmp174, status_43(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	 ; _292, var_279->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp223, _292
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _288
	je	.L443	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _288,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp177
	call	sprintf	 ;
.L422:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rbp)	 ;, var_279->type
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rsi	 ; status_43(D)->block_count, _273
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp217,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_264->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp224, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp178
	movq	%rax, 72(%rbx)	 ; tmp178, status_43(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _277, var_264->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp225, _277
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _273
	je	.L444	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _273,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp181
	call	sprintf	 ;
.L424:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%r13)	 ;, var_264->type
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rsi	 ; status_43(D)->block_count, _258
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp217,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_249->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp226, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp182
	movq	%rax, 72(%rbx)	 ; tmp182, status_43(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _262, var_249->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp227, _262
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _258
	je	.L445	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _258,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp185
	call	sprintf	 ;
.L426:
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__42(D)->condition
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_249->type
 ; D:\TC\temp\codegen.c:538:     if (for_->condition != NULL) {
	je	.L427	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp228, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_86->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_86->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp229, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_85->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_85->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_85->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_85->arg3
 ; D:\TC\temp\codegen.c:541:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rcx	 ; _3->instructions, _3->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	 ; var, block_83->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp230, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp231, block_83->instructions
 ; D:\TC\temp\codegen.c:543:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _5->blocks, _5->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:544:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; block, status_43(D)->current_block
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	8(%rdi), %rcx	 ; for__42(D)->condition, for__42(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:546:         Arg* condition = codegen_expression(for_->condition, status);
	movq	%rax, 40(%rsp)	 ; condition, %sfp
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_82->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp233, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_82->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_82->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_82->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_81->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp234, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_81->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_81->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_81->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	40(%rsp), %r8	 ; %sfp, condition
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_80->arg2
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp235, inst
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_80->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r8, (%rax)	 ; condition, inst_80->arg1
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_80->arg3
 ; D:\TC\temp\codegen.c:548:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rcx	 ;, _8->instructions
	call	list_append	 ;
.L428:
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r13, (%rax)	 ; var, block_89->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp238, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp239, block_89->instructions
 ; D:\TC\temp\codegen.c:556:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _12->blocks, _12->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:557:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; block, status_43(D)->current_block
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rsi	 ; status_43(D)->block_count, _303
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp217,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_294->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp240, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp197
	movq	%rax, 72(%rbx)	 ; tmp197, status_43(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _307, var_294->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp241, _307
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _303
	je	.L446	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _303,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp200
	call	sprintf	 ;
.L430:
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__42(D)->increment
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%r14)	 ;, var_294->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:560:     if (for_->increment != NULL)
	je	.L431	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	32(%rbx), %rcx	 ; status_43(D)->start_labels, status_43(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp242, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_91->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_91->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; var, arg_91->value.label
 ; D:\TC\temp\codegen.c:561:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	list_append	 ;
.L432:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_94->is_get
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_43(D)->end_labels, status_43(D)->end_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp245, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_94->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_94->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_94->value.label
 ; D:\TC\temp\codegen.c:566:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:567:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__42(D)->body, for__42(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp246, body_statements
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L434	 ;
	.p2align 4,,10
	.p2align 3
.L435:
 ; D:\TC\temp\codegen.c:570:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L434:
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp247, statement
 ; D:\TC\temp\codegen.c:569:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L435	 ;,
 ; D:\TC\temp\codegen.c:571:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_43(D)->start_labels, status_43(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:572:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_43(D)->end_labels, status_43(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:573:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__42(D)->increment
	je	.L436	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_98->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp248, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_98->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; var, arg_98->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_98->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp249, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_97->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_97->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_97->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_97->arg3
 ; D:\TC\temp\codegen.c:576:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rcx	 ; _24->instructions, _24->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r14, (%rax)	 ; var, block_95->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp250, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp251, block_95->instructions
 ; D:\TC\temp\codegen.c:578:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _26->blocks, _26->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:579:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; block, status_43(D)->current_block
 ; D:\TC\temp\codegen.c:580:         codegen_expression(for_->increment, status);
	movq	16(%rdi), %rcx	 ; for__42(D)->increment, for__42(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
.L436:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_100->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp252, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_100->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_100->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_100->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__42(D)->condition
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_99->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp253, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_99->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_99->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_99->arg3
 ; D:\TC\temp\codegen.c:584:     if (for_->condition == NULL)
	je	.L447	 ;,
.L437:
 ; D:\TC\temp\codegen.c:586:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rcx	 ; _30->instructions, _30->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_103->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp256, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp257, block_103->instructions
 ; D:\TC\temp\codegen.c:589:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_43(D)->current_subroutine, status_43(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _32->blocks, _32->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:590:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_43(D)->current_block
 ; D:\TC\temp\codegen.c:591: }
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
	.p2align 4,,10
	.p2align 3
.L431:
 ; D:\TC\temp\codegen.c:562:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__42(D)->condition
	je	.L433	 ;,
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_43(D)->start_labels, status_43(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp243, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_92->value.label
 ; D:\TC\temp\codegen.c:563:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
	jmp	.L432	 ;
	.p2align 4,,10
	.p2align 3
.L446:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp199
	call	sprintf	 ;
	jmp	.L430	 ;
	.p2align 4,,10
	.p2align 3
.L445:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp184
	call	sprintf	 ;
	jmp	.L426	 ;
	.p2align 4,,10
	.p2align 3
.L444:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp180
	call	sprintf	 ;
	jmp	.L424	 ;
	.p2align 4,,10
	.p2align 3
.L443:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp176
	call	sprintf	 ;
	jmp	.L422	 ;
	.p2align 4,,10
	.p2align 3
.L427:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_88->value.label
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp236, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_88->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_87->arg1
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp237, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_87->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_87->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_87->arg3
 ; D:\TC\temp\codegen.c:552:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_43(D)->current_block, status_43(D)->current_block
	movq	8(%rax), %rcx	 ;, _10->instructions
	call	list_append	 ;
	jmp	.L428	 ;
	.p2align 4,,10
	.p2align 3
.L442:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$118, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp170
	call	sprintf	 ;
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L447:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_102->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp254, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_102->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_102->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_102->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_101->type
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp255, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_101->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_101->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_101->arg3
	jmp	.L437	 ;
	.p2align 4,,10
	.p2align 3
.L433:
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	32(%rbx), %rcx	 ; status_43(D)->start_labels, status_43(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp244, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_93->value.label
 ; D:\TC\temp\codegen.c:565:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
	jmp	.L432	 ;
	.p2align 4
	.globl	codegen_while
	.def	codegen_while;	.scl	2;	.type	32;	.endef
codegen_while:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %r13	 ;, tmp162
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp163, while_
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:592: void codegen_while(While* while_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp164, status
	subq	$40, %rsp	 ;,
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rbp	 ; status_21(D)->block_count, _160
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp162,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_151->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp165, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp132
	movq	%rax, 72(%rbx)	 ; tmp132, status_21(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _164, var_151->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp166, _164
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _160
	je	.L458	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _160,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp135
	call	sprintf	 ;
.L450:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_151->type
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_59->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp167, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_59->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_59->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_59->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp168, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	 ; arg, inst_58->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_58->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_58->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_58->arg3
 ; D:\TC\temp\codegen.c:596:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _1->instructions, _1->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_56->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp169, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp170, block_56->instructions
 ; D:\TC\temp\codegen.c:598:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _3->blocks, _3->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:599:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	 ; block, status_21(D)->current_block
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rbp	 ; status_21(D)->block_count, _145
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp162,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_136->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp171, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp140
	movq	%rax, 72(%rbx)	 ; tmp140, status_21(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _149, var_136->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp172, _149
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _145
	je	.L459	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _145,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp143
	call	sprintf	 ;
.L452:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_136->type
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %r14	 ; status_21(D)->block_count, _130
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp162,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_121->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	 ; tmp173, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	 ;, tmp144
	movq	%rax, 72(%rbx)	 ; tmp144, status_21(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	 ; _134, var_121->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp174, _134
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _130
	je	.L460	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _130,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp147
	call	sprintf	 ;
.L454:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%rbp)	 ;, var_121->type
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	(%rsi), %rcx	 ; while__31(D)->condition, while__31(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	codegen_expression	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:603:     Arg* condition = codegen_expression(while_->condition, status);
	movq	%rax, %r15	 ; tmp175, condition
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_55->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp176, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_55->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_55->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_55->is_get
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_54->kind
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp177, arg
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_54->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_54->value.label
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_54->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp178, inst
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_53->arg2
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	 ; arg, inst_53->arg3
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_53->type
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_53->arg1
 ; D:\TC\temp\codegen.c:605:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _6->instructions, _6->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_51->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r13	 ; tmp179, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r13, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%r13)	 ; tmp180, block_51->instructions
 ; D:\TC\temp\codegen.c:608:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _8->blocks, _8->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:609:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; block, status_21(D)->current_block
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_50->is_get
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	32(%rbx), %rcx	 ; status_21(D)->start_labels, status_21(D)->start_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp181, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_50->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_50->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_50->value.label
 ; D:\TC\temp\codegen.c:611:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_49->is_get
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	24(%rbx), %rcx	 ; status_21(D)->end_labels, status_21(D)->end_labels
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp182, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_49->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_49->type
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_49->value.label
 ; D:\TC\temp\codegen.c:612:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:613:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__31(D)->body, while__31(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp183, body_statements
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L455	 ;
	.p2align 4,,10
	.p2align 3
.L456:
 ; D:\TC\temp\codegen.c:616:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L455:
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp184, statement
 ; D:\TC\temp\codegen.c:615:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L456	 ;,
 ; D:\TC\temp\codegen.c:617:     list_pop_back(status->start_labels);
	movq	32(%rbx), %rcx	 ; status_21(D)->start_labels, status_21(D)->start_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:618:     list_pop_back(status->end_labels);
	movq	24(%rbx), %rcx	 ; status_21(D)->end_labels, status_21(D)->end_labels
	call	list_pop_back	 ;
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:\TC\temp\codegen.c:172:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_63->value.label
 ; D:\TC\temp\codegen.c:143:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp185, arg
 ; D:\TC\temp\codegen.c:144:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_63->kind
 ; D:\TC\temp\codegen.c:145:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_63->type
 ; D:\TC\temp\codegen.c:183:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_63->is_get
 ; D:\TC\temp\codegen.c:135:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp186, inst
 ; D:\TC\temp\codegen.c:137:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_62->arg1
 ; D:\TC\temp\codegen.c:138:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_62->arg2
 ; D:\TC\temp\codegen.c:136:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_62->type
 ; D:\TC\temp\codegen.c:139:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_62->arg3
 ; D:\TC\temp\codegen.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _15->instructions, _15->instructions
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%rbp, (%rax)	 ; var, block_60->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp187, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp188, block_60->instructions
 ; D:\TC\temp\codegen.c:624:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _17->blocks, _17->blocks
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:625:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_21(D)->current_block
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
	.p2align 4,,10
	.p2align 3
.L458:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp134
	call	sprintf	 ;
	jmp	.L450	 ;
	.p2align 4,,10
	.p2align 3
.L460:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp146
	call	sprintf	 ;
	jmp	.L454	 ;
	.p2align 4,,10
	.p2align 3
.L459:
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp142
	call	sprintf	 ;
	jmp	.L452	 ;
	.p2align 4
	.globl	codegen_function
	.def	codegen_function;	.scl	2;	.type	32;	.endef
codegen_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	leaq	.LC1(%rip), %r13	 ;, tmp126
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp130, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
 ; D:\TC\temp\codegen.c:319: void codegen_function(Function* function, TACStatus* status) {
	movq	%rcx, 16(%rbp)	 ; tmp129, function
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_43]
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp131, subroutine
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp132, subroutine_43->parameters
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp133, subroutine_43->local_vars
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp134, subroutine_43->blocks
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
 ; D:\TC\temp\codegen.c:322:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp147
	movq	16(%rax), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp135, parameters
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L463:
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _50,
	movl	$112, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;,
	call	sprintf	 ;
.L464:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rdi, 16(%r14)	 ; _6, var_47->type
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_43->parameters, subroutine_43->parameters
	movq	%r14, %rdx	 ; var,
	call	list_append	 ;
.L462:
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L471	 ;,
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	 ; parameter_25->name, _7
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdi	 ; parameter_25->type, _6
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp126,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r15, (%rax)	 ; _7, var_47->original_name
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rbx), %r15	 ; status_19(D)->param_count, _50
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp136, var
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r15), %rax	 ;, tmp115
	movq	%rax, 48(%rbx)	 ; tmp115, status_19(D)->param_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _60, var_47->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp137, _60
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _50
	jne	.L463	 ;,
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$112, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L464	 ;
	.p2align 4,,10
	.p2align 3
.L471:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rdi	 ; status_19(D)->block_count, _71
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp126,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_62->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp139, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp120
	movq	%rax, 72(%rbx)	 ; tmp120, status_19(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _75, var_62->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp140, _75
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _71
	je	.L472	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _71,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp123
	call	sprintf	 ;
.L467:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_62->type
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_37->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp141, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_43->blocks, subroutine_43->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp142, block_37->instructions
 ; D:\TC\temp\codegen.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp148
 ; D:\TC\temp\codegen.c:332:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rax), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp143, statements
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L468	 ;
	.p2align 4,,10
	.p2align 3
.L469:
 ; D:\TC\temp\codegen.c:337:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L468:
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp144, statement
 ; D:\TC\temp\codegen.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L469	 ;,
 ; D:\TC\temp\codegen.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:340: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-56(%rbp), %rsp	 ;,
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
.L472:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp122
	call	sprintf	 ;
	jmp	.L467	 ;
	.p2align 4
	.globl	codegen_method
	.def	codegen_method;	.scl	2;	.type	32;	.endef
codegen_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	leaq	.LC1(%rip), %r13	 ;, tmp126
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp130, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:\TC\temp\codegen.c:343:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)]
 ; D:\TC\temp\codegen.c:341: void codegen_method(Method* method, TACStatus* status) {
	movq	%rcx, 16(%rbp)	 ; tmp129, method
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:100:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_43]
 ; D:\TC\temp\codegen.c:99:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp131, subroutine
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:102:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp132, subroutine_43->parameters
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:103:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp133, subroutine_43->local_vars
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:\TC\temp\codegen.c:104:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp134, subroutine_43->blocks
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
 ; D:\TC\temp\codegen.c:344:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:345:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:347:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rax	 ; method, tmp147
	movq	16(%rax), %rcx	 ; method_16(D)->parameters, method_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp135, parameters
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L474	 ;
	.p2align 4,,10
	.p2align 3
.L475:
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _50,
	movl	$112, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;,
	call	sprintf	 ;
.L476:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	%rdi, 16(%r14)	 ; _6, var_47->type
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_43->parameters, subroutine_43->parameters
	movq	%r14, %rdx	 ; var,
	call	list_append	 ;
.L474:
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:349:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L483	 ;,
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	 ; parameter_25->name, _7
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:\TC\temp\codegen.c:350:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdi	 ; parameter_25->type, _6
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp126,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	%r15, (%rax)	 ; _7, var_47->original_name
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	movq	48(%rbx), %r15	 ; status_19(D)->param_count, _50
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp136, var
 ; D:\TC\temp\codegen.c:119:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r15), %rax	 ;, tmp115
	movq	%rax, 48(%rbx)	 ; tmp115, status_19(D)->param_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _60, var_47->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp137, _60
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _50
	jne	.L475	 ;,
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$112, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L476	 ;
	.p2align 4,,10
	.p2align 3
.L483:
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	movq	72(%rbx), %rdi	 ; status_19(D)->block_count, _71
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp126,
	movl	$32, %edx	 ;,
 ; D:\TC\temp\codegen.c:115:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_62->original_name
 ; D:\TC\temp\codegen.c:114:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp139, var
 ; D:\TC\temp\codegen.c:122:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp120
	movq	%rax, 72(%rbx)	 ; tmp120, status_19(D)->block_count
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _75, var_62->name
 ; D:\TC\temp\codegen.c:126:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp140, _75
 ; D:\TC\temp\codegen.c:127:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _71
	je	.L484	 ;,
 ; D:\TC\temp\codegen.c:130:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _71,
	movl	$98, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp123
	call	sprintf	 ;
.L479:
 ; D:\TC\temp\codegen.c:131:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_62->type
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\temp\codegen.c:109:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_37->label
 ; D:\TC\temp\codegen.c:108:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp141, block
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	call	create_list	 ;
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_43->blocks, subroutine_43->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:\TC\temp\codegen.c:110:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp142, block_37->instructions
 ; D:\TC\temp\codegen.c:353:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:\TC\temp\codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	16(%rbp), %rax	 ; method, tmp148
 ; D:\TC\temp\codegen.c:354:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:\TC\temp\codegen.c:356:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rax), %rcx	 ; method_16(D)->body, method_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp143, statements
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L480	 ;
	.p2align 4,,10
	.p2align 3
.L481:
 ; D:\TC\temp\codegen.c:359:         codegen_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	codegen_statement	 ;
.L480:
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp144, statement
 ; D:\TC\temp\codegen.c:358:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L481	 ;,
 ; D:\TC\temp\codegen.c:361:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:\TC\temp\codegen.c:362: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-56(%rbp), %rsp	 ;,
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
.L484:
 ; D:\TC\temp\codegen.c:128:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp122
	call	sprintf	 ;
	jmp	.L479	 ;
	.section .rdata,"dr"
	.align 8
.LC31:
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
	leaq	.LC31(%rip), %r12	 ;, tmp110
 ; D:\TC\temp\codegen.c:368:     attr_table->size = class->size;
	movq	%rax, 16(%rbx)	 ; class_14(D)->size, table_28->size
 ; D:\TC\temp\codegen.c:369:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rcx	 ; _4->attribute_tables, _4->attribute_tables
	call	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L486:
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:\TC\temp\codegen.c:370:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L494	 ;,
.L491:
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_23->type, _6
 ; D:\TC\temp\codegen.c:371:         switch (member->type) {
	testl	%ebx, %ebx	 ; _6
	je	.L487	 ;,
	cmpl	$1, %ebx	 ;, _6
	je	.L488	 ;,
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
	jne	.L491	 ;,
.L494:
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
.L488:
 ; D:\TC\temp\codegen.c:376:                 codegen_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_23->content.variable, member_23->content.variable
	movl	$97, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	codegen_variable	 ;
 ; D:\TC\temp\codegen.c:377:                 break;
	jmp	.L486	 ;
	.p2align 4,,10
	.p2align 3
.L487:
 ; D:\TC\temp\codegen.c:373:                 codegen_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_23->content.method, member_23->content.method
	movq	%rdi, %rdx	 ; status,
	call	codegen_method	 ;
 ; D:\TC\temp\codegen.c:374:                 break;
	jmp	.L486	 ;
	.section .rdata,"dr"
.LC32:
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
	leaq	.LC32(%rip), %r13	 ;, tmp115
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
.L496:
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:\TC\temp\codegen.c:297:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L504	 ;,
.L502:
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:\TC\temp\codegen.c:298:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L505	 ;,
 ; D:\TC\temp\codegen.c:302:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L506	 ;,
 ; D:\TC\temp\codegen.c:304:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L496	 ;,
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
	jne	.L502	 ;,
.L504:
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
.L505:
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
	jne	.L496	 ;,
 ; D:\TC\temp\codegen.c:301:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r12)	 ; _5, tac_29->entry_point
	jmp	.L496	 ;
	.p2align 4,,10
	.p2align 3
.L506:
 ; D:\TC\temp\codegen.c:303:             codegen_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	codegen_class	 ;
	jmp	.L496	 ;
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
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
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
