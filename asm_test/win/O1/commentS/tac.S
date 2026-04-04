	.file	"tac.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
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
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	%ebp, 24(%rax)	 ; type, inst_3->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg1, inst_3->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg2, inst_3->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg3, inst_3->arg3
 ; D:/TC/src/tac.c:220: }
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
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp91, <retval>
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movq	%rdi, (%rax)	 ; name, subroutine_6->name
 ; D:/TC/src/tac.c:90:     subroutine->return_type = return_type;
	movq	%rsi, 8(%rax)	 ; return_type, subroutine_6->return_type
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbx)	 ; tmp92, subroutine_6->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbx)	 ; tmp93, subroutine_6->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbx)	 ; tmp94, subroutine_6->blocks
 ; D:/TC/src/tac.c:96: }
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
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; label, block_4->label
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, block_4->instructions
 ; D:/TC/src/tac.c:104: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC0:
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
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp118, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_16->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_16->type
 ; D:/TC/src/tac.c:226:     switch (kind) {
	cmpl	$7, %esi	 ;, kind
	ja	.L8	 ;,
	movl	%esi, %esi	 ; kind, kind
	leaq	.L10(%rip), %rdx	 ;, tmp98
	movslq	(%rdx,%rsi,4), %rax	 ;, tmp100
	addq	%rdx, %rax	 ; tmp98, tmp101
	jmp	*%rax	 ; tmp101
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L17-.L10
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L17:
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.variable
 ; D:/TC/src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_20(D)].type, _1
 ; D:/TC/src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	 ; _1, arg_16->type
.L18:
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_16->is_get
 ; D:/TC/src/tac.c:266: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L16:
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	(%rdi), %rax	 ; MEM[(long long int *)value_20(D)], _2
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	 ; _2, arg_16->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rbx)	 ; name_int, arg_16->type
 ; D:/TC/src/tac.c:234:             break;
	jmp	.L18	 ;
.L15:
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	(%rdi), %xmm0	 ; MEM[(double *)value_20(D)], _4
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	 ; _4, arg_16->value.float_value
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; name_float, name_float
	movq	%rax, 8(%rbx)	 ; name_float, arg_16->type
 ; D:/TC/src/tac.c:238:             break;
	jmp	.L18	 ;
.L14:
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.string_value
 ; D:/TC/src/tac.c:241:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; name_string, name_string
	movq	%rax, 8(%rbx)	 ; name_string, arg_16->type
 ; D:/TC/src/tac.c:242:             break;
	jmp	.L18	 ;
.L13:
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movzbl	(%rdi), %eax	 ; MEM[(char *)value_20(D)], _7
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	%al, (%rbx)	 ; _7, arg_16->value.bool_value
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp109
	movq	(%rax), %rax	 ; name_bool, name_bool
	movq	%rax, 8(%rbx)	 ; name_bool, arg_16->type
 ; D:/TC/src/tac.c:246:             break;
	jmp	.L18	 ;
.L12:
 ; D:/TC/src/tac.c:248:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	 ;, arg_16->value.string_value
 ; D:/TC/src/tac.c:249:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp111
	movq	(%rax), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_16->type
 ; D:/TC/src/tac.c:250:             break;
	jmp	.L18	 ;
.L11:
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.label
 ; D:/TC/src/tac.c:253:             break;
	jmp	.L18	 ;
.L9:
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.subroutine
 ; D:/TC/src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_20(D)].type, _10
 ; D:/TC/src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	 ; _10, arg_16->type
 ; D:/TC/src/tac.c:257:             break;
	jmp	.L18	 ;
.L8:
 ; D:/TC/src/tac.c:260:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:260:             fprintf(stderr, "[warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	movl	%esi, %r8d	 ; kind,
	leaq	.LC0(%rip), %rdx	 ;, tmp114
	call	fprintf	 ;
 ; D:/TC/src/tac.c:261:             break;
	jmp	.L18	 ;
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; D:/TC/src/tac.c:19:         result = 0;
	movl	$0, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L30	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_int
	je	.L24	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_float
	je	.L25	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_string
	je	.L26	 ;,
 ; D:/TC/src/tac.c:23:         result = 1;
	movl	$1, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp97
	cmpq	%rcx, (%rdx)	 ; type, name_bool
	je	.L30	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp98
	cmpq	%rcx, (%rdx)	 ; type, name_void
	je	.L30	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rcx)	 ;, type_13(D)->kind
	jne	.L22	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
.L22:
 ; D:/TC/src/tac.c:15: static size_t get_type_size(Symbol* type) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_13(D)->name, _8
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	movq	%rbx, %r8	 ; _8,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	call	fprintf	 ;
 ; D:/TC/src/tac.c:17:     size_t result = 8;
	movl	$8, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:30: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
.L24:
 ; D:/TC/src/tac.c:21:         result = 8;
	movl	$8, %eax	 ;, <retval>
	ret	
.L25:
	movl	$8, %eax	 ;, <retval>
	ret	
.L26:
	movl	$8, %eax	 ;, <retval>
	ret	
.L30:
 ; D:/TC/src/tac.c:30: }
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
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp180, original_name
	movq	%rdx, %r12	 ; tmp181, type
	movl	%r8d, %ebp	 ; tmp182, kind
	movq	%r9, %rsi	 ; tmp183, status
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	je	.L33	 ;,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	movl	$0, %r13d	 ;, current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rdx)	 ;, type_33(D)->kind
	jne	.L34	 ;,
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%r9), %r13	 ; status_34(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rdx), %rax	 ; type_33(D)->ast_node.class, _2
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; _2, status_34(D)->current_class
.L34:
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rsi), %rax	 ; status_34(D)->current_subroutine, _56
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	 ; _56
	je	.L35	 ;,
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rcx	 ; _56->local_vars, _56->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	 ; tmp184
	je	.L71	 ;,
.L36:
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rsi), %rax	 ; status_34(D)->current_subroutine, _64
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	 ; _64
	je	.L35	 ;,
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rcx	 ; _64->parameters, _64->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	 ; tmp187
	je	.L72	 ;,
.L35:
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rsi)	 ;, status_34(D)->current_class
	je	.L42	 ;,
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rsi), %rax	 ; status_34(D)->tac, status_34(D)->tac
	movq	(%rax), %rcx	 ; _73->attribute_tables, _73->attribute_tables
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	 ; tmp190
	je	.L73	 ;,
.L42:
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	(%rsi), %rax	 ; status_34(D)->tac, status_34(D)->tac
	movq	16(%rax), %rcx	 ; _90->global_vars, _90->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	 ; tmp196
	jne	.L49	 ;,
 ; D:/TC/src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%rsi), %rax	 ; status_34(D)->tac, status_34(D)->tac
	movq	16(%rax), %rcx	 ; _93->global_vars, _93->global_vars
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp197, vars
.L50:
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp198, <retval>
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L49	 ;,
 ; D:/TC/src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; var_96->original_name, original_name
	jne	.L50	 ;,
.L38:
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, type_33(D)->kind
	je	.L65	 ;,
	jmp	.L32	 ;
.L71:
 ; D:/TC/src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rsi), %rax	 ; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _59->local_vars, _59->local_vars
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp185, vars
.L37:
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp186, <retval>
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L36	 ;,
 ; D:/TC/src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; var_62->original_name, original_name
	jne	.L37	 ;,
	jmp	.L38	 ;
.L72:
 ; D:/TC/src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rsi), %rax	 ; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	16(%rax), %rcx	 ; _67->parameters, _67->parameters
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp188, vars
.L40:
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp189, <retval>
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L35	 ;,
 ; D:/TC/src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; var_70->original_name, original_name
	jne	.L40	 ;,
	jmp	.L38	 ;
.L73:
 ; D:/TC/src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rsi), %rax	 ; status_34(D)->tac, status_34(D)->tac
	movq	(%rax), %rcx	 ; _76->attribute_tables, _76->attribute_tables
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp191, tables
.L44:
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r14, %rcx	 ; tables,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp195, table
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	 ; table
	je	.L42	 ;,
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rsi), %rax	 ; status_34(D)->current_class, status_34(D)->current_class
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	 ; _81->name, tmp203
	cmpq	%rax, 8(%rbx)	 ; tmp203, table_79->name
	jne	.L44	 ;,
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rbx), %rcx	 ; table_79->attributes, table_79->attributes
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	 ; tmp192
	jne	.L44	 ;,
 ; D:/TC/src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%rbx), %rcx	 ; table_79->attributes, table_79->attributes
	call	list_copy	 ;
	movq	%rax, %r15	 ; tmp193, attributes
.L46:
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%r15, %rcx	 ; attributes,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	 ; attr
	je	.L44	 ;,
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rbx	 ; attr_87->var, <retval>
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; _88->original_name, original_name
	jne	.L46	 ;,
	jmp	.L38	 ;
.L67:
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	$0, %ebx	 ;, <retval>
.L65:
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rsi)	 ; current_class, status_34(D)->current_class
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	jne	.L32	 ;,
	jmp	.L33	 ;
.L53:
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rsi), %rdi	 ; status_34(D)->attr_count, id
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp159
	movq	%rax, 48(%rsi)	 ; tmp159, status_34(D)->attr_count
.L54:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp165
	call	create_string	 ;
	movq	%rax, %rcx	 ; tmp199, _16
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _16, var_130->name
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, id
	je	.L63	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; id,
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC4(%rip), %rdx	 ;, tmp167
	call	sprintf	 ;
.L61:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r12, 16(%rbx)	 ; type, var_130->type
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebp	 ;, tmp168
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebp	 ;, tmp168
	je	.L74	 ;,
.L32:
 ; D:/TC/src/tac.c:193: }
	movq	%rbx, %rax	 ; <retval>,
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
.L55:
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rsi), %rdi	 ; status_34(D)->param_count, id
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp160
	movq	%rax, 56(%rsi)	 ; tmp160, status_34(D)->param_count
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L54	 ;
.L56:
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rsi), %rdi	 ; status_34(D)->var_count, id
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp161
	movq	%rax, 64(%rsi)	 ; tmp161, status_34(D)->var_count
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L54	 ;
.L57:
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %rdi	 ; status_34(D)->temp_count, id
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp162
	movq	%rax, 72(%rsi)	 ; tmp162, status_34(D)->temp_count
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L54	 ;
.L58:
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rsi), %rdi	 ; status_34(D)->block_count, id
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp163
	movq	%rax, 80(%rsi)	 ; tmp163, status_34(D)->block_count
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L54	 ;
.L59:
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rsi), %rdi	 ; status_34(D)->subroutine_count, id
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp164
	movq	%rax, 88(%rsi)	 ; tmp164, status_34(D)->subroutine_count
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L54	 ;
.L74:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _20->local_vars, _20->local_vars
	movq	%rbx, %rdx	 ; <retval>,
	call	list_append	 ;
	jmp	.L32	 ;
.L62:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp172
	call	create_string	 ;
	movq	%rax, %rcx	 ; tmp200, _16
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _16, var_130->name
.L63:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC3(%rip), %rdx	 ;, tmp166
	call	sprintf	 ;
	jmp	.L61	 ;
.L49:
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, type_33(D)->kind
	je	.L67	 ;,
.L33:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp201, <retval>
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%rdi, (%rax)	 ; original_name, var_130->original_name
 ; D:/TC/src/tac.c:174:     switch (kind) {
	leal	-97(%rbp), %eax	 ;, tmp173
	cmpl	$21, %eax	 ;, tmp173
	ja	.L62	 ;,
	movl	%eax, %eax	 ; tmp173, tmp174
	leaq	.L64(%rip), %rdx	 ;, tmp175
	movslq	(%rdx,%rax,4), %rax	 ;, tmp177
	addq	%rdx, %rax	 ; tmp175, tmp178
	jmp	*%rax	 ; tmp178
	.section .rdata,"dr"
	.align 4
.L64:
	.long	.L53-.L64
	.long	.L58-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L59-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L55-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L62-.L64
	.long	.L57-.L64
	.long	.L62-.L64
	.long	.L56-.L64
	.text
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp96, arg
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L76	 ;,
	movq	%rdx, %rsi	 ; tmp97, status
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_9(D)->is_get
	jne	.L78	 ;,
.L76:
 ; D:/TC/src/tac.c:281: }
	movq	%rbx, %rax	 ; arg,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L78:
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_9(D)->type, arg_9(D)->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdi	 ; tmp99, temp
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; arg,
	movq	%rax, %rdx	 ; temp,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp100, _4
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rsi), %rax	 ; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rcx	 ; _5->instructions, _5->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:277:         return temp;
	movq	%rdi, %rbx	 ; temp, arg
	jmp	.L76	 ;
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rdx, %rdi	 ; tmp108, tac
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rsi	 ; import_16(D)->name, _1
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rsi), %ebx	 ; _1->kind, _2
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L85	 ;,
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp101
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp101
	jbe	.L86	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L83	 ;,
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp112, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp113, table_27->attributes
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	%rsi, 8(%rbx)	 ; _1, table_27->name
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_27->size
 ; D:/TC/src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rdi), %rcx	 ; tac_20(D)->attribute_tables, tac_20(D)->attribute_tables
	movq	%rbx, %rdx	 ; table,
	call	list_append	 ;
.L79:
 ; D:/TC/src/tac.c:314: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L85:
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp110, _4
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
	call	list_append	 ;
	jmp	.L79	 ;
.L86:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp111, _8
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
	call	list_append	 ;
	jmp	.L79	 ;
.L83:
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC5(%rip), %rdx	 ;, tmp106
	call	fprintf	 ;
 ; D:/TC/src/tac.c:314: }
	jmp	.L79	 ;
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC7:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%r8d, %esi	 ; tmp138, type
 ; D:/TC/src/tac.c:395:     switch (type) {
	leal	-97(%r8), %eax	 ;, tmp113
	cmpl	$21, %eax	 ;, tmp113
	ja	.L88	 ;,
	movq	%rcx, %rdi	 ; tmp136, variable
	movq	%rdx, %rbx	 ; tmp137, status
	movl	%eax, %eax	 ; tmp113, tmp114
	leaq	.L90(%rip), %rdx	 ;, tmp115
	movslq	(%rdx,%rax,4), %rax	 ;, tmp117
	addq	%rdx, %rax	 ; tmp115, tmp118
	jmp	*%rax	 ; tmp118
	.section .rdata,"dr"
	.align 4
.L90:
	.long	.L93-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L92-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L91-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L88-.L90
	.long	.L87-.L90
	.long	.L88-.L90
	.long	.L87-.L90
	.text
.L91:
 ; D:/TC/src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp139, var
 ; D:/TC/src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	16(%rax), %rcx	 ; _3->parameters, _3->parameters
	call	list_append	 ;
.L87:
 ; D:/TC/src/tac.c:418: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L92:
 ; D:/TC/src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp140, var
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	16(%rax), %rcx	 ; _7->global_vars, _7->global_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:405:             break;
	jmp	.L87	 ;
.L93:
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _9->attribute_tables, _9->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rsi	 ; tmp141, attr_table
 ; D:/TC/src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _11->attribute_tables, _11->attribute_tables
	movq	%rsi, %rdx	 ; attr_table,
	call	list_append	 ;
 ; D:/TC/src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rdi), %rbp	 ; variable_20(D)->type, _13
	movq	8(%rdi), %r12	 ; variable_20(D)->name, _14
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rdi	 ; tmp142, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rbp, %rdx	 ; _13,
	movq	%r12, %rcx	 ; _14,
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%rdi)	 ; tmp143, attr_34->var
 ; D:/TC/src/tac.c:198:     attr->type = type;
	movq	%rbp, 8(%rdi)	 ; _13, attr_34->type
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rdi)	 ;, attr_34->offset
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rsi), %rax	 ; attr_table_29->size, _36
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rdi)	 ; _36, attr_34->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%rbp, %rcx	 ; _13,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rsi)	 ; tmp144, attr_table_29->size
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%rsi), %rcx	 ; attr_table_29->attributes, _40
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _40
	je	.L96	 ;,
 ; D:/TC/src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rdi, %rdx	 ; attr,
	call	list_append	 ;
	jmp	.L87	 ;
.L96:
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	24(%rax), %r9	 ; _41->_stderr,
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp133
	call	fwrite	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L87	 ;
.L88:
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
	movl	%esi, %r8d	 ; type,
	leaq	.LC7(%rip), %rdx	 ;, tmp135
	call	fprintf	 ;
 ; D:/TC/src/tac.c:418: }
	jmp	.L87	 ;
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC9:
	.ascii "[warning] Failed to generate variable access for base\12\0"
	.align 8
.LC10:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC11:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC12:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
	.align 8
.LC13:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC14:
	.ascii "arr\0"
	.align 8
.LC15:
	.ascii "[warning] Failed to generate variable access for index\12\0"
	.align 8
.LC16:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC17:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp257, variable_access
	movq	%rdx, %rbx	 ; tmp258, status
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rcx)	 ;, variable_access_108(D)->type
	jne	.L98	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_108(D)->content.name, _2
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L98	 ;,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, tmp304
	subl	$1, %eax	 ;, tmp192
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, tmp192
	jbe	.L99	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp259, _6
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp260, <retval>
.L97:
 ; D:/TC/src/tac.c:845: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L99:
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp261, _8
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp262, <retval>
 ; D:/TC/src/tac.c:750:             return result;
	jmp	.L97	 ;
.L98:
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	movq	(%rdi), %rsi	 ; variable_access_108(D)->base, <retval>
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rsi, %rsi	 ; <retval>
	je	.L121	 ;,
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; <retval>,
	call	tac_variable_access	 ;
	movq	%rax, %rcx	 ; tmp264, _12
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp265, base
 ; D:/TC/src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	je	.L122	 ;,
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rdi), %esi	 ; variable_access_108(D)->type, _15
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %esi	 ;, _15
	je	.L123	 ;,
 ; D:/TC/src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %esi	 ;, _15
	je	.L124	 ;,
 ; D:/TC/src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %esi	 ;, _15
	jne	.L113	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %esi	 ; base_118->kind, _67
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%esi, %esi	 ; _67
	jne	.L114	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_118->type, _68
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	 ;, _68->kind
	je	.L125	 ;,
.L115:
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rbp), %rax	 ; base_198->type, base_198->type
	movq	8(%rax), %rbx	 ; _79->name, _80
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rcx	 ; _81->_stderr, _81->_stderr
	movq	%rbx, %r9	 ; _80,
	movl	%esi, %r8d	 ; _67,
	leaq	.LC16(%rip), %rdx	 ;, tmp243
	call	fprintf	 ;
 ; D:/TC/src/tac.c:823:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L97	 ;
.L121:
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %r9	 ; _10->_stderr,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp197
	call	fwrite	 ;
 ; D:/TC/src/tac.c:756:         return NULL;
	jmp	.L97	 ;
.L122:
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movq	24(%rax), %r9	 ; _13->_stderr,
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rcx	 ;, tmp199
	call	fwrite	 ;
 ; D:/TC/src/tac.c:762:         return NULL;
	movq	%rbp, %rsi	 ; base, <retval>
	jmp	.L97	 ;
.L123:
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	 ; base_118->type, _16
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _16->kind, _17
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp200
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp200
	jbe	.L126	 ;,
 ; D:/TC/src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _16->ast_node.scope, scope
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _17
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_168].class_scope, scope
.L105:
 ; D:/TC/src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rdi), %rax	 ; variable_access_108(D)->content.attr_name, variable_access_108(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _22->name, _22->name
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp268, <retval>
 ; D:/TC/src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L127	 ;,
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %eax	 ; attr_171->kind, _30
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rax), %edx	 ;, tmp209
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %edx	 ;, tmp209
	jbe	.L128	 ;,
 ; D:/TC/src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _30
	jne	.L129	 ;,
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rsi), %rdx	 ; attr_171->type, attr_171->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp273, _41
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp274, <retval>
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rdi), %rcx	 ; variable_access_108(D)->content.attr_name, _42
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _42->type, _42->type
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp275, _44
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp276
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbp, %r8	 ; base,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp277, inst
 ; D:/TC/src/tac.c:788:         temp->is_get = true;
	movb	$1, 20(%rsi)	 ;, temp_174->is_get
 ; D:/TC/src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_109(D)->current_block, status_109(D)->current_block
	movq	8(%rax), %rcx	 ; _46->instructions, _46->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:791:         return temp;
	jmp	.L97	 ;
.L126:
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _16->name, _19
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	24(%rax), %rcx	 ; _20->_stderr, _20->_stderr
	movq	%rbx, %r8	 ; _19,
	leaq	.LC10(%rip), %rdx	 ;, tmp202
	call	fprintf	 ;
 ; D:/TC/src/tac.c:768:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L97	 ;
.L127:
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	 ; base_118->type, base_118->type
	movq	8(%rax), %rbp	 ; _24->name, _25
	movq	8(%rdi), %rax	 ; variable_access_108(D)->content.attr_name, variable_access_108(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _26->name, _27
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _28->_stderr, _28->_stderr
	movq	%rbp, %r9	 ; _25,
	movq	%rbx, %r8	 ; _27,
	leaq	.LC11(%rip), %rdx	 ;, tmp208
	call	fprintf	 ;
 ; D:/TC/src/tac.c:777:             return NULL;
	jmp	.L97	 ;
.L128:
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; attr_171->type, attr_171->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp270, _33
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp271, <retval>
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L97	 ;
.L129:
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	 ; base_118->type, base_118->type
	movq	8(%rax), %rsi	 ; _34->name, _35
	movq	8(%rdi), %rax	 ; variable_access_108(D)->content.attr_name, variable_access_108(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _36->name, _37
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _38->_stderr, _38->_stderr
	movq	%rsi, %r9	 ; _35,
	movq	%rbx, %r8	 ; _37,
	leaq	.LC12(%rip), %rdx	 ;, tmp214
	call	fprintf	 ;
 ; D:/TC/src/tac.c:784:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L97	 ;
.L124:
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rax), %rdx	 ; base_118->type, _48
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rdx), %eax	 ; _48->kind, tmp305
	subl	$3, %eax	 ;, tmp219
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	 ;, tmp219
	ja	.L130	 ;,
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rdx), %rsi	 ; _48->name, _54
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC14(%rip), %rdx	 ;, tmp224
	movq	%rsi, %rcx	 ; _54,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp279
	jne	.L131	 ;,
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rdi), %rcx	 ; variable_access_108(D)->content.index, variable_access_108(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp281, _59
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp282, index
 ; D:/TC/src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	je	.L132	 ;,
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%rbp), %rax	 ; base_118->type, base_118->type
	movq	(%rax), %rdx	 ; _62->type, _62->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp284, _64
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp285, <retval>
 ; D:/TC/src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rdi, %r9	 ; index,
	movq	%rbp, %r8	 ; base,
	movq	%rax, %rdx	 ; <retval>,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp286, inst
 ; D:/TC/src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%rsi)	 ;, temp_157->is_get
 ; D:/TC/src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_109(D)->current_block, status_109(D)->current_block
	movq	8(%rax), %rcx	 ; _65->instructions, _65->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:814:         return temp;
	jmp	.L97	 ;
.L130:
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	8(%rdx), %rbx	 ; _48->name, _51
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:794:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	24(%rax), %rcx	 ; _52->_stderr, _52->_stderr
	movq	%rbx, %r8	 ; _51,
	leaq	.LC13(%rip), %rdx	 ;, tmp222
	call	fprintf	 ;
 ; D:/TC/src/tac.c:796:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L97	 ;
.L131:
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	24(%rax), %rcx	 ; _56->_stderr, _56->_stderr
	movq	%rsi, %r8	 ; _54,
	leaq	.LC13(%rip), %rdx	 ;, tmp226
	call	fprintf	 ;
 ; D:/TC/src/tac.c:801:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L97	 ;
.L132:
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movq	24(%rax), %r9	 ; _60->_stderr,
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rcx	 ;, tmp229
	call	fwrite	 ;
 ; D:/TC/src/tac.c:807:             return NULL;
	movq	%rdi, %rsi	 ; index, <retval>
	jmp	.L97	 ;
.L125:
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ;, tmp234
	movq	(%rdx), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	8(%rax), %rcx	 ; _68->name, _68->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp287, _72
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rbp), %rax	 ; base_118->type, base_118->type
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _73->ast_node.class, _73->ast_node.class
	movq	16(%rax), %rcx	 ; _74->class_scope, _74->class_scope
	call	search_name_use_strcmp	 ;
	movq	%rax, %rcx	 ; tmp288, attr
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; attr_123->type, attr_123->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp289, _77
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbp	 ; tmp290, base
.L114:
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	movl	16(%rbp), %esi	 ; base_99->kind, _67
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %esi	 ;, _67
	jne	.L115	 ;,
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rcx	 ; variable_access_108(D)->content.args, variable_access_108(D)->content.args
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp292, args
 ; D:/TC/src/tac.c:827:         long long arg_count = 0;
	movq	$0, 32(%rsp)	 ;, arg_count
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	leaq	40(%rsp), %r12	 ;, tmp256
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L118	 ;
.L119:
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp293, arg
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_140->type, arg_140->type
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 40(%rsp)	 ; tmp294, size
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	%r12, %rdx	 ; tmp256,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp295, _87
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; arg,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp296, inst
 ; D:/TC/src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_109(D)->current_block, status_109(D)->current_block
	movq	8(%rax), %rcx	 ; _88->instructions, _88->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:833:             arg_count++;
	addq	$1, 32(%rsp)	 ;, arg_count
.L118:
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rdi, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp297, arg_expr
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	jne	.L119	 ;,
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rbp), %rdx	 ; base_99->type, base_99->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp298, _93
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp299, <retval>
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	leaq	32(%rsp), %rdx	 ;, tmp250
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp300
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%rbp, %r8	 ; base,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp301, inst
 ; D:/TC/src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_109(D)->current_block, status_109(D)->current_block
	movq	8(%rax), %rcx	 ; _95->instructions, _95->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:839:         return temp;
	jmp	.L97	 ;
.L113:
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rcx	 ; _97->_stderr, _97->_stderr
	movl	%esi, %r8d	 ; _15,
	leaq	.LC17(%rip), %rdx	 ;, tmp254
	call	fprintf	 ;
 ; D:/TC/src/tac.c:843:         return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L97	 ;
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC20:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_38(D)->type, _1
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L134	 ;,
	movq	%rdx, %rsi	 ; tmp154, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L136(%rip), %r8	 ;, tmp120
	movslq	(%r8,%rbx,4), %rax	 ;, tmp122
	addq	%r8, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L136:
	.long	.L144-.L136
	.long	.L143-.L136
	.long	.L142-.L136
	.long	.L141-.L136
	.long	.L140-.L136
	.long	.L139-.L136
	.long	.L138-.L136
	.long	.L137-.L136
	.long	.L135-.L136
	.text
.L144:
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	strtoll	 ;
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 40(%rsp)	 ; tmp155, MEM[(long long int *)_95]
 ; D:/TC/src/tac.c:682:             return create_arg(ARG_INT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp126
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp156, <retval>
.L133:
 ; D:/TC/src/tac.c:739: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L143:
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$0, %edx	 ;,
	call	strtod	 ;
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 40(%rsp)	 ; tmp157, MEM[(double *)_95]
 ; D:/TC/src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp128
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp158, <retval>
	jmp	.L133	 ;
.L142:
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp159, <retval>
	jmp	.L133	 ;
.L141:
 ; D:/TC/src/tac.c:692:             bool t = true;
	movb	$1, 40(%rsp)	 ;, MEM[(char *)_95]
 ; D:/TC/src/tac.c:694:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp130
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp160, <retval>
	jmp	.L133	 ;
.L140:
 ; D:/TC/src/tac.c:697:             bool t = false;
	movb	$0, 40(%rsp)	 ;, MEM[(char *)_95]
 ; D:/TC/src/tac.c:699:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp131
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp161, <retval>
	jmp	.L133	 ;
.L139:
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp162, <retval>
	jmp	.L133	 ;
.L138:
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rcx	 ; tmp163, _9
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp164, operand
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp134
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; name_bool, name_bool
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp165, _11
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp166, <retval>
 ; D:/TC/src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; operand,
	movq	%rax, %rdx	 ; <retval>,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp167, inst
 ; D:/TC/src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:710:             return temp;
	jmp	.L133	 ;
.L137:
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rcx	 ; tmp168, _15
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp169, operand
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp170, _17
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp171, <retval>
 ; D:/TC/src/tac.c:716:             long long zero_int = 0;
	movq	$0, 32(%rsp)	 ;, zero_int
 ; D:/TC/src/tac.c:717:             double neg_one_float = -1.0;
	movq	.LC18(%rip), %rax	 ;, tmp180
	movq	%rax, 40(%rsp)	 ; tmp180, MEM[(double *)_95]
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_44->type, _18
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp141
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	cmpq	(%rdx), %rax	 ; name_int, _18
	je	.L151	 ;,
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp143
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	cmpq	(%rdx), %rax	 ; name_float, _18
	je	.L152	 ;,
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
	leaq	.LC19(%rip), %rdx	 ;, tmp146
	call	fprintf	 ;
 ; D:/TC/src/tac.c:725:                 return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L133	 ;
.L151:
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	32(%rsp), %rdx	 ;, tmp142
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp172
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp173, inst
	jmp	.L147	 ;
.L152:
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	40(%rsp), %rdx	 ;, tmp144
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp174
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp175, inst
.L147:
 ; D:/TC/src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:729:             return temp;
	jmp	.L133	 ;
.L135:
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.var, primary_38(D)->value.var
	call	tac_variable_access	 ;
	movq	%rax, %rbx	 ; tmp177, <retval>
	jmp	.L133	 ;
.L134:
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC20(%rip), %rdx	 ;, tmp151
	call	fprintf	 ;
 ; D:/TC/src/tac.c:737:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L133	 ;
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp143, expression
	movq	%rdx, %rbx	 ; tmp144, status
 ; D:/TC/src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	je	.L181	 ;,
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp146, _4
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp147, right
 ; D:/TC/src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rsi), %ebp	 ; expression_31(D)->operator, _63
 ; D:/TC/src/tac.c:35:     switch (op) {
	cmpl	$18, %ebp	 ;, _63
	ja	.L156	 ;,
	movl	%ebp, %eax	 ; _63, _63
	leaq	.L158(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%rax,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L158:
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L177-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L163-.L158
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L177-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.text
.L181:
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
	call	tac_primary	 ;
	movq	%rax, %rsi	 ; tmp145, <retval>
 ; D:/TC/src/tac.c:649:         return result;
	jmp	.L153	 ;
.L159:
 ; D:/TC/src/tac.c:43:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %ebp	 ;, _63
.L160:
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp160, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp138
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp138
	jbe	.L175	 ;,
.L172:
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_78->type, left_78->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp156, _18
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp157, <retval>
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp158
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _63,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp159, inst
	jmp	.L174	 ;
.L157:
 ; D:/TC/src/tac.c:45:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %ebp	 ;, _63
	jmp	.L160	 ;
.L156:
 ; D:/TC/src/tac.c:56:         default: return INST_NONE;
	movl	$25, %ebp	 ;, _63
	jmp	.L160	 ;
.L162:
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp148, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp126
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp126
	ja	.L178	 ;,
	movl	$0, %ebp	 ;, _63
.L175:
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_76->type, left_76->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp149, _9
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp150, <retval>
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp151
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _63,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp152, inst
 ; D:/TC/src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L176:
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rdi)	 ;, left_77->kind
	jne	.L182	 ;,
.L173:
 ; D:/TC/src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp154, inst
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_77->is_get
	jne	.L183	 ;,
.L174:
 ; D:/TC/src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
.L153:
 ; D:/TC/src/tac.c:675: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L182:
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movq	24(%rax), %r9	 ; _14->_stderr,
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
	jmp	.L173	 ;
.L183:
 ; D:/TC/src/tac.c:666:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
	jmp	.L174	 ;
.L178:
	movl	$0, %ebp	 ;, _63
	jmp	.L172	 ;
.L161:
 ; D:/TC/src/tac.c:39:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %ebp	 ;, _63
	jmp	.L160	 ;
.L177:
 ; D:/TC/src/tac.c:35:     switch (op) {
	movl	$2, %ebp	 ;, _63
	jmp	.L160	 ;
.L163:
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp161, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp141
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp141
	ja	.L184	 ;,
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%r12, %rsi	 ; right, <retval>
	jmp	.L176	 ;
.L184:
 ; D:/TC/src/tac.c:46:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %ebp	 ;, _63
	jmp	.L172	 ;
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
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
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp183, then_label
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp184, else_label
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r12), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp185
	je	.L186	 ;,
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:469:         end_label = else_label;
	movq	%rsi, %r15	 ; else_label, end_label
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp186
	jne	.L187	 ;,
.L186:
 ; D:/TC/src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r15	 ; tmp187, end_label
.L187:
 ; D:/TC/src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r15, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r13	 ; tmp188, end_block_arg
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%r12), %rcx	 ; if__61(D)->condition, if__61(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rbp	 ; tmp189, condition
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp190, _6
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rdi, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp191
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %r9	 ; _6,
	movq	%rbp, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp192, inst
 ; D:/TC/src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:478:     Block* then_block = create_block(then_label);
	movq	%rdi, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp193, then_block
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _10->blocks, _10->blocks
	movq	%rdi, %rdx	 ; then_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:480:     status->current_block = then_block;
	movq	%rdi, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; if__61(D)->body, if__61(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp194, then_statements
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L188	 ;
.L189:
 ; D:/TC/src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L188:
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L189	 ;,
 ; D:/TC/src/tac.c:487:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp196, jump_to_end
 ; D:/TC/src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r12), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp197
	je	.L202	 ;,
.L190:
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp213
	je	.L203	 ;,
.L196:
 ; D:/TC/src/tac.c:538:     Block* end_block = create_block(end_label);
	movq	%r15, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp218, end_block
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _40->blocks, _40->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:540:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:542: }
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
.L202:
 ; D:/TC/src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r12), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp198, elif_list
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L191	 ;
.L204:
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	 ; tmp204
	cmovne	%r15, %rsi	 ; else_label,, end_label, else_label
	jmp	.L192	 ;
.L194:
 ; D:/TC/src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L193:
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp210, elif_statement
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L194	 ;,
 ; D:/TC/src/tac.c:518:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp211, jump_to_end
 ; D:/TC/src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _31->instructions, _31->instructions
	call	list_append	 ;
.L191:
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r14, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp212, elif
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L190	 ;,
 ; D:/TC/src/tac.c:496:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp199, else_if_block
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	movq	%rsi, %rdx	 ; else_if_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:498:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp200, then_label
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp201, else_label
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%rdi), %rcx	 ; elif_90->condition, elif_90->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, 40(%rsp)	 ; tmp202, %sfp
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r14, %rcx	 ; elif_list,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp203
	jne	.L204	 ;,
.L192:
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, 32(%rsp)	 ; tmp205, %sfp
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp206
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	32(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp207, inst
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:509:             then_block = create_block(then_label);
	movq	%rbp, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp208, then_block
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _28->blocks, _28->blocks
	movq	%rbp, %rdx	 ; then_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:511:             status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rdi), %rcx	 ; elif_90->body, elif_90->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp209, elif_statements
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L193	 ;
.L203:
 ; D:/TC/src/tac.c:525:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp214, else_block
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	movq	%rsi, %rdx	 ; else_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:527:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp215, else_statements
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L197	 ;
.L198:
 ; D:/TC/src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L197:
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp216, else_statement
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L198	 ;,
 ; D:/TC/src/tac.c:534:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp217, jump_to_end
 ; D:/TC/src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _38->instructions, _38->instructions
	call	list_append	 ;
	jmp	.L196	 ;
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC23:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC24:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_33(D)->type, _1
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L206	 ;,
	movq	%rcx, %rsi	 ; tmp146, statement
	movq	%rdx, %rdi	 ; tmp147, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L208(%rip), %rdx	 ;, tmp118
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L208:
	.long	.L215-.L208
	.long	.L214-.L208
	.long	.L213-.L208
	.long	.L212-.L208
	.long	.L211-.L208
	.long	.L210-.L208
	.long	.L209-.L208
	.long	.L207-.L208
	.text
.L215:
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_33(D)->stmt.expr, statement_33(D)->stmt.expr
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
.L205:
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L214:
 ; D:/TC/src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rcx), %rcx	 ; statement_33(D)->stmt.var, statement_33(D)->stmt.var
	movl	$118, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L205	 ;
.L213:
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_33(D)->stmt.if_stmt, statement_33(D)->stmt.if_stmt
	movq	%rdi, %rdx	 ; status,
	call	tac_if	 ;
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L205	 ;
.L212:
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_33(D)->stmt.while_stmt, statement_33(D)->stmt.while_stmt
	movq	%rdi, %rdx	 ; status,
	call	tac_while	 ;
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L205	 ;
.L211:
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_33(D)->stmt.for_stmt, statement_33(D)->stmt.for_stmt
	movq	%rdi, %rdx	 ; status,
	call	tac_for	 ;
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L205	 ;
.L210:
 ; D:/TC/src/tac.c:428:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_33(D)->stmt.return_expr, _7
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _7
	je	.L217	 ;,
 ; D:/TC/src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
.L217:
 ; D:/TC/src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; return_value,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp150, _8
 ; D:/TC/src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	16(%rdi), %rax	 ; status_34(D)->current_block, status_34(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:432:             break;
	jmp	.L205	 ;
.L209:
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rdi), %rcx	 ; status_34(D)->end_labels, status_34(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp151
	jne	.L218	 ;,
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rdi), %rax	 ; status_34(D)->end_labels, status_34(D)->end_labels
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _13->tail, _13->tail
	movq	8(%rax), %rdx	 ; _14->content, label
 ; D:/TC/src/tac.c:437:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L218	 ;,
 ; D:/TC/src/tac.c:438:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp152, inst
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_34(D)->current_block, status_34(D)->current_block
	movq	8(%rax), %rcx	 ; _15->instructions, _15->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:440:                     break;
	jmp	.L205	 ;
.L218:
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movq	24(%rax), %r9	 ; _17->_stderr,
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp136
	call	fwrite	 ;
 ; D:/TC/src/tac.c:444:             break;
	jmp	.L205	 ;
.L207:
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rdi), %rcx	 ; status_34(D)->start_labels, status_34(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp154
	jne	.L219	 ;,
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rdi), %rax	 ; status_34(D)->start_labels, status_34(D)->start_labels
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _21->tail, _21->tail
	movq	8(%rax), %rdx	 ; _22->content, label
 ; D:/TC/src/tac.c:448:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L219	 ;,
 ; D:/TC/src/tac.c:449:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:/TC/src/tac.c:450:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_34(D)->current_block, status_34(D)->current_block
	movq	8(%rax), %rcx	 ; _23->instructions, _23->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:451:                     break;
	jmp	.L205	 ;
.L219:
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movq	24(%rax), %r9	 ; _25->_stderr,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp143
	call	fwrite	 ;
 ; D:/TC/src/tac.c:455:             break;
	jmp	.L205	 ;
.L206:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	24(%rax), %rcx	 ; _27->_stderr, _27->_stderr
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC24(%rip), %rdx	 ;, tmp145
	call	fprintf	 ;
 ; D:/TC/src/tac.c:461: }
	jmp	.L205	 ;
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
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
 ; D:/TC/src/tac.c:546:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__53(D)->initializer, _1
 ; D:/TC/src/tac.c:546:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L222	 ;,
 ; D:/TC/src/tac.c:547:         tac_variable(for_->initializer, status, VAR_VAR);
	movl	$118, %r8d	 ;,
	call	tac_variable	 ;
.L222:
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp173, condition_label
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r13	 ; tmp174, body_label
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp175, end_label
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L223	 ;,
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp176, _3
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp177, inst
 ; D:/TC/src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:556:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp178, condition_block
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	movq	%rsi, %rdx	 ; condition_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:558:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; condition_block, status_54(D)->current_block
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%rdi), %rcx	 ; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp179, condition
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp180, _9
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp181
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _9,
	movq	%rsi, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp182, inst
 ; D:/TC/src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L224:
 ; D:/TC/src/tac.c:569:     Block* body_block = create_block(body_label);
	movq	%r13, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp185, body_block
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _16->blocks, _16->blocks
	movq	%rsi, %rdx	 ; body_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:571:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; body_block, status_54(D)->current_block
 ; D:/TC/src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r14	 ; tmp186, increment_label
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__53(D)->increment
	je	.L225	 ;,
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp187, _19
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_append	 ;
.L226:
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp190, _26
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
	call	list_append	 ;
 ; D:/TC/src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__53(D)->body, for__53(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp191, body_statements
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L228	 ;
.L223:
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp183, _13
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp184, inst
 ; D:/TC/src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
	jmp	.L224	 ;
.L225:
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L227	 ;,
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp188, _22
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_append	 ;
	jmp	.L226	 ;
.L227:
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp189, _24
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_append	 ;
	jmp	.L226	 ;
.L229:
 ; D:/TC/src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L228:
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp192, statement
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L229	 ;,
 ; D:/TC/src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_54(D)->start_labels, status_54(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_54(D)->end_labels, status_54(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__53(D)->increment
	je	.L230	 ;,
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp193, _32
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp194, inst
 ; D:/TC/src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:591:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp195, increment_block
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	movq	%rsi, %rdx	 ; increment_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:593:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; increment_block, status_54(D)->current_block
 ; D:/TC/src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%rdi), %rcx	 ; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
.L230:
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp196, _38
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__53(D)->condition
	je	.L233	 ;,
.L231:
 ; D:/TC/src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _41->instructions, _41->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:602:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp200, end_block
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _43->blocks, _43->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:604:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_54(D)->current_block
 ; D:/TC/src/tac.c:606: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L233:
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp198, _40
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp199, inst
	jmp	.L231	 ;
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
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
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp140, condition_label
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp141, _1
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp142, inst
 ; D:/TC/src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:613:     Block* condition_block = create_block(condition_label);
	movq	%rdi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp143, condition_block
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	movq	%rbp, %rdx	 ; condition_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:615:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	 ; condition_block, status_27(D)->current_block
 ; D:/TC/src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp144, body_label
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp145, end_label
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	(%rsi), %rcx	 ; while__42(D)->condition, while__42(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r13	 ; tmp146, condition
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp147, _7
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp148
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _7,
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp149, inst
 ; D:/TC/src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:623:     Block* body_block = create_block(body_label);
	movq	%r12, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp150, body_block
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	movq	%r12, %rdx	 ; body_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:625:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; body_block, status_27(D)->current_block
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp151, _13
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp152, _15
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_append	 ;
 ; D:/TC/src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__42(D)->body, while__42(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp153, body_statements
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L235	 ;
.L236:
 ; D:/TC/src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L235:
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp154, statement
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L236	 ;,
 ; D:/TC/src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp155, _20
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp156, inst
 ; D:/TC/src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:639:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp157, end_block
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _23->blocks, _23->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:641:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_27(D)->current_block
 ; D:/TC/src/tac.c:643: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp112, function
	movq	%rdx, %rbx	 ; tmp113, status
 ; D:/TC/src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rcx), %rdx	 ; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rcx), %rcx	 ; function_16(D)->name, function_16(D)->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp114, subroutine
 ; D:/TC/src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; D:/TC/src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp115, parameters
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L239	 ;
.L240:
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp116, _8
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
	call	list_append	 ;
.L239:
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L240	 ;,
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp118, _10
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp119, block
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:329:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:/TC/src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rbp), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp120, statements
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L241	 ;
.L242:
 ; D:/TC/src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L241:
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp121, statement
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L242	 ;,
 ; D:/TC/src/tac.c:336:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:338: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp143, method
	movq	%rdx, %rbx	 ; tmp144, status
 ; D:/TC/src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rcx), %rdx	 ; method_33(D)->return_type, method_33(D)->return_type
	movq	(%rcx), %rcx	 ; method_33(D)->name, method_33(D)->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp145, subroutine
 ; D:/TC/src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_36(D)->current_subroutine
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_36(D)->tac, status_36(D)->tac
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; D:/TC/src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rcx	 ; method_33(D)->parameters, method_33(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp146, parameters
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L245	 ;
.L246:
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_42->type, parameter_42->type
	movq	8(%rax), %rcx	 ; parameter_42->name, parameter_42->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp147, _8
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_35->parameters, subroutine_35->parameters
	call	list_append	 ;
.L245:
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L246	 ;,
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp149, _10
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp150, block
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_35->blocks, subroutine_35->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:353:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_36(D)->current_block
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp128
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_36(D)->current_class, status_36(D)->current_class
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _13->name, _13->name
	movq	8(%rax), %rcx	 ; _14->name, _14->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp151, _16
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%rbp), %rax	 ; method_33(D)->name, method_33(D)->name
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _17->name, _17->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp152
	je	.L251	 ;,
.L247:
 ; D:/TC/src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rbp), %rcx	 ; method_33(D)->body, method_33(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp157, statements
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L248	 ;
.L251:
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	 ; status_36(D)->current_class, status_36(D)->current_class
	movq	(%rax), %rdx	 ; _20->name, _20->name
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp153, _22
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp154, temp
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	 ; status_36(D)->current_class, tmp160
	leaq	24(%rax), %rdx	 ;, tmp139
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp155
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %r9d	 ;,
	movq	%rsi, %rdx	 ; temp,
	movl	$18, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp156, _26
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_45->instructions, block_45->instructions
	call	list_append	 ;
	jmp	.L247	 ;
.L249:
 ; D:/TC/src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L248:
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp158, statement
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L249	 ;,
 ; D:/TC/src/tac.c:364:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_36(D)->current_subroutine
 ; D:/TC/src/tac.c:366: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp106, class
	movq	%rdx, %rdi	 ; tmp107, status
 ; D:/TC/src/tac.c:369:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_14(D)->current_class
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_15(D)->members, class_15(D)->members
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp108, members
 ; D:/TC/src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%rbp), %r12	 ; class_15(D)->name, _2
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp109, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp110, table_30->attributes
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	%r12, 8(%rbx)	 ; _2, table_30->name
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_30->size
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	24(%rbp), %rax	 ; class_15(D)->size, _3
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	%rax, 16(%rbx)	 ; _3, table_30->size
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_14(D)->tac, status_14(D)->tac
	movq	(%rax), %rcx	 ; _4->attribute_tables, _4->attribute_tables
	movq	%rbx, %rdx	 ; table,
	call	list_append	 ;
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC25(%rip), %rbp	 ;, tmp105
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L253	 ;
.L254:
 ; D:/TC/src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_24->content.method, member_24->content.method
	movq	%rdi, %rdx	 ; status,
	call	tac_method	 ;
.L253:
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L261	 ;,
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_24->type, _6
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	testl	%ebx, %ebx	 ; _6
	je	.L254	 ;,
	cmpl	$1, %ebx	 ;, _6
	je	.L255	 ;,
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	movl	%ebx, %r8d	 ; _6,
	movq	%rbp, %rdx	 ; tmp105,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:386:                 break;
	jmp	.L253	 ;
.L255:
 ; D:/TC/src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_24->content.variable, member_24->content.variable
	movl	$97, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:383:                 break;
	jmp	.L253	 ;
.L261:
 ; D:/TC/src/tac.c:389:     status->current_class = NULL;
	movq	$0, 24(%rdi)	 ;, status_14(D)->current_class
 ; D:/TC/src/tac.c:391: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC26:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp113, code
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbp	 ; tmp114, <retval>
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	movq	%rax, 0(%rbp)	 ; tmp115, tac_29->attribute_tables
 ; D:/TC/src/tac.c:63:     tac->entry_point = NULL;
	movq	$0, 8(%rbp)	 ;, tac_29->entry_point
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	movq	%rax, 16(%rbp)	 ; tmp116, tac_29->global_vars
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	movq	%rax, 24(%rbp)	 ; tmp117, tac_29->subroutines
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp118, status
 ; D:/TC/src/tac.c:72:     status->tac = tac;
	movq	%rbp, (%rax)	 ; <retval>, status_26->tac
 ; D:/TC/src/tac.c:73:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	 ;, status_26->current_subroutine
 ; D:/TC/src/tac.c:74:     status->current_block = NULL;
	movq	$0, 16(%rax)	 ;, status_26->current_block
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	movq	%rax, 32(%rsi)	 ; tmp119, status_26->end_labels
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rsi)	 ; tmp120, status_26->start_labels
 ; D:/TC/src/tac.c:77:     status->attr_count = 0;
	movq	$0, 48(%rsi)	 ;, status_26->attr_count
 ; D:/TC/src/tac.c:78:     status->param_count = 0;
	movq	$0, 56(%rsi)	 ;, status_26->param_count
 ; D:/TC/src/tac.c:79:     status->var_count = 0;
	movq	$0, 64(%rsi)	 ;, status_26->var_count
 ; D:/TC/src/tac.c:80:     status->temp_count = 0;
	movq	$0, 72(%rsi)	 ;, status_26->temp_count
 ; D:/TC/src/tac.c:81:     status->block_count = 0;
	movq	$0, 80(%rsi)	 ;, status_26->block_count
 ; D:/TC/src/tac.c:82:     status->subroutine_count = 0;
	movq	$0, 88(%rsi)	 ;, status_26->subroutine_count
 ; D:/TC/src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rcx	 ; code_17(D)->members, code_17(D)->members
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp121, members
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC26(%rip), %r12	 ;, tmp112
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L263	 ;
.L270:
 ; D:/TC/src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.function, code_member_21->content.function
	movq	%rsi, %rdx	 ; status,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	 ; code_member_21->content.function, code_member_21->content.function
	movq	(%rax), %rbx	 ; _4->name, _5
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rcx	 ; _5->name, _5->name
	movq	%r12, %rdx	 ; tmp112,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp122
	jne	.L263	 ;,
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%rbp)	 ; _5, tac_29->entry_point
	jmp	.L263	 ;
.L271:
 ; D:/TC/src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
.L263:
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp123, code_member
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L269	 ;,
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L270	 ;,
 ; D:/TC/src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L271	 ;,
 ; D:/TC/src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L263	 ;,
 ; D:/TC/src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.import, code_member_21->content.import
	movq	%rsi, %r8	 ; status,
	movq	%rbp, %rdx	 ; <retval>,
	call	tac_import	 ;
	jmp	.L263	 ;
.L269:
 ; D:/TC/src/tac.c:302: }
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
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
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
