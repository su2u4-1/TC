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
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	%ebp, 24(%rax)	 ; type, inst_3->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg1, inst_3->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg2, inst_3->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	 ; arg3, inst_3->arg3
 ; D:/TC/src/tac.c:221: }
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
	.ascii "[Warning] Unsupported argument type for create_arg: %d\12\0"
	.text
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movl	%ecx, %esi	 ; tmp116, kind
	movq	%rdx, %rdi	 ; tmp117, value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp118, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_16->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_16->type
 ; D:/TC/src/tac.c:227:     switch (kind) {
	cmpl	$8, %esi	 ;, kind
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
	.long	.L9-.L10
	.text
.L17:
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.variable
 ; D:/TC/src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_20(D)].type, _1
 ; D:/TC/src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	 ; _1, arg_16->type
.L18:
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_16->is_get
 ; D:/TC/src/tac.c:268: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L16:
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	(%rdi), %rax	 ; MEM[(long long int *)value_20(D)], _2
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	 ; _2, arg_16->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp103
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rbx)	 ; name_int, arg_16->type
 ; D:/TC/src/tac.c:235:             break;
	jmp	.L18	 ;
.L15:
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	(%rdi), %xmm0	 ; MEM[(double *)value_20(D)], _4
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	 ; _4, arg_16->value.float_value
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp105
	movq	(%rax), %rax	 ; name_float, name_float
	movq	%rax, 8(%rbx)	 ; name_float, arg_16->type
 ; D:/TC/src/tac.c:239:             break;
	jmp	.L18	 ;
.L14:
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.string_value
 ; D:/TC/src/tac.c:242:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rax	 ;, tmp107
	movq	(%rax), %rax	 ; name_string, name_string
	movq	%rax, 8(%rbx)	 ; name_string, arg_16->type
 ; D:/TC/src/tac.c:243:             break;
	jmp	.L18	 ;
.L13:
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movzbl	(%rdi), %eax	 ; MEM[(char *)value_20(D)], _7
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	%al, (%rbx)	 ; _7, arg_16->value.bool_value
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp109
	movq	(%rax), %rax	 ; name_bool, name_bool
	movq	%rax, 8(%rbx)	 ; name_bool, arg_16->type
 ; D:/TC/src/tac.c:247:             break;
	jmp	.L18	 ;
.L12:
 ; D:/TC/src/tac.c:249:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	 ;, arg_16->value.string_value
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp111
	movq	(%rax), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_16->type
 ; D:/TC/src/tac.c:251:             break;
	jmp	.L18	 ;
.L11:
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.label
 ; D:/TC/src/tac.c:254:             break;
	jmp	.L18	 ;
.L9:
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rdi, (%rbx)	 ; value, arg_16->value.subroutine
 ; D:/TC/src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	16(%rdi), %rax	 ; MEM[(struct Var *)value_20(D)].type, _10
 ; D:/TC/src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	 ; _10, arg_16->type
 ; D:/TC/src/tac.c:259:             break;
	jmp	.L18	 ;
.L8:
 ; D:/TC/src/tac.c:262:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:262:             fprintf(stderr, "[Warning] Unsupported argument type for create_arg: %d\n", kind);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	movl	%esi, %r8d	 ; kind,
	leaq	.LC0(%rip), %rdx	 ;, tmp114
	call	fprintf	 ;
 ; D:/TC/src/tac.c:263:             break;
	jmp	.L18	 ;
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
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
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_13(D)->name, _8
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
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
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L76	 ;,
	movq	%rdx, %rsi	 ; tmp97, status
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_9(D)->is_get
	jne	.L78	 ;,
.L76:
 ; D:/TC/src/tac.c:283: }
	movq	%rbx, %rax	 ; arg,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L78:
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_9(D)->type, arg_9(D)->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp98, _3
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdi	 ; tmp99, temp
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %r9d	 ;,
	movq	%rbx, %r8	 ; arg,
	movq	%rax, %rdx	 ; temp,
	movl	$23, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp100, _4
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rsi), %rax	 ; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rcx	 ; _5->instructions, _5->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:279:         return temp;
	movq	%rdi, %rbx	 ; temp, arg
	jmp	.L76	 ;
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC6:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC7:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC8:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC9:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC10:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC11:
	.ascii "arr\0"
	.align 8
.LC12:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC14:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC15:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp308, variable_access
	movq	%rdx, %rbx	 ; tmp309, status
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rcx)	 ;, variable_access_140(D)->type
	jne	.L80	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_140(D)->content.name, _2
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L80	 ;,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, _3
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp223
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp223
	jbe	.L107	 ;,
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _3
	jne	.L83	 ;,
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp312, _7
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp313, <retval>
.L79:
 ; D:/TC/src/tac.c:862: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
.L107:
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp310, _6
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp311, <retval>
 ; D:/TC/src/tac.c:749:             return result;
	jmp	.L79	 ;
.L83:
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp314, _9
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp315, <retval>
 ; D:/TC/src/tac.c:757:             return result;
	jmp	.L79	 ;
.L80:
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	movq	(%rdi), %rsi	 ; variable_access_140(D)->base, <retval>
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rsi, %rsi	 ; <retval>
	je	.L108	 ;,
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; <retval>,
	call	tac_variable_access	 ;
	movq	%rax, %rcx	 ; tmp317, _13
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp318, base
 ; D:/TC/src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	je	.L109	 ;,
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rdi), %esi	 ; variable_access_140(D)->type, _16
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %esi	 ;, _16
	je	.L110	 ;,
 ; D:/TC/src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %esi	 ;, _16
	je	.L111	 ;,
 ; D:/TC/src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %esi	 ;, _16
	jne	.L96	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %esi	 ; base_153->kind, _72
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%esi, %esi	 ; _72
	jne	.L97	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_153->type, _73
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	 ;, _73->kind
	je	.L112	 ;,
.L98:
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rbp), %rax	 ; base_254->type, base_254->type
	movq	8(%rax), %rbx	 ; _85->name, _86
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rcx	 ; _87->_stderr, _87->_stderr
	movq	%rbx, %r9	 ; _86,
	movl	%esi, %r8d	 ; _72,
	leaq	.LC14(%rip), %rdx	 ;, tmp280
	call	fprintf	 ;
 ; D:/TC/src/tac.c:832:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L79	 ;
.L108:
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %r9	 ; _11->_stderr,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp227
	call	fwrite	 ;
 ; D:/TC/src/tac.c:763:         return NULL;
	jmp	.L79	 ;
.L109:
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	24(%rax), %r9	 ; _14->_stderr,
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp229
	call	fwrite	 ;
 ; D:/TC/src/tac.c:769:         return NULL;
	movq	%rbp, %rsi	 ; base, <retval>
	jmp	.L79	 ;
.L110:
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	 ; base_153->type, _17
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _17->kind, _18
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp230
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp230
	jbe	.L113	 ;,
 ; D:/TC/src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _17->ast_node.scope, scope
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _18
	jne	.L88	 ;,
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_218].class_scope, scope
.L88:
 ; D:/TC/src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rdi), %rax	 ; variable_access_140(D)->content.attr_name, variable_access_140(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _23->name, _23->name
	call	search_name_use_strcmp	 ;
	movq	%rax, %rsi	 ; tmp321, <retval>
 ; D:/TC/src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L114	 ;,
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	 ; attr_221->kind, _31
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _31
	je	.L115	 ;,
 ; D:/TC/src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _31
	je	.L116	 ;,
 ; D:/TC/src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _31
	jne	.L117	 ;,
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rsi), %rdx	 ; attr_221->type, attr_221->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp329, _49
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp330, <retval>
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rdi), %rcx	 ; variable_access_140(D)->content.attr_name, _50
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _50->type, _50->type
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp331, _52
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp332
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbp, %r8	 ; base,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp333, inst
 ; D:/TC/src/tac.c:799:         temp->is_get = true;
	movb	$1, 20(%rsi)	 ;, temp_224->is_get
 ; D:/TC/src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_141(D)->current_block, status_141(D)->current_block
	movq	8(%rax), %rcx	 ; _54->instructions, _54->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:802:         return temp;
	jmp	.L79	 ;
.L113:
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _17->name, _20
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	movq	%rbx, %r8	 ; _20,
	leaq	.LC7(%rip), %rdx	 ;, tmp232
	call	fprintf	 ;
 ; D:/TC/src/tac.c:775:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L79	 ;
.L114:
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	 ; base_153->type, base_153->type
	movq	8(%rax), %rbp	 ; _25->name, _26
	movq	8(%rdi), %rax	 ; variable_access_140(D)->content.attr_name, variable_access_140(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _27->name, _28
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movq	%rbp, %r9	 ; _26,
	movq	%rbx, %r8	 ; _28,
	leaq	.LC8(%rip), %rdx	 ;, tmp238
	call	fprintf	 ;
 ; D:/TC/src/tac.c:784:             return NULL;
	jmp	.L79	 ;
.L115:
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	 ; base_153->type, base_153->type
	movq	8(%rax), %rbp	 ; _32->name, _33
	movq	8(%rdi), %rax	 ; variable_access_140(D)->content.attr_name, variable_access_140(D)->content.attr_name
	movq	8(%rax), %rdi	 ; _34->name, _35
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _36->_stderr, _36->_stderr
	movq	%rbp, %r9	 ; _33,
	movq	%rdi, %r8	 ; _35,
	leaq	.LC9(%rip), %rdx	 ;, tmp242
	call	fprintf	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; attr_221->type, attr_221->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp324, _39
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp325, <retval>
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L79	 ;
.L116:
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; attr_221->type, attr_221->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rsi, %rcx	 ; <retval>,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp326, _41
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp327, <retval>
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L79	 ;
.L117:
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	 ; base_153->type, base_153->type
	movq	8(%rax), %rsi	 ; _42->name, _43
	movq	8(%rdi), %rax	 ; variable_access_140(D)->content.attr_name, variable_access_140(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _44->name, _45
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _46->_stderr, _46->_stderr
	movq	%rsi, %r9	 ; _43,
	movq	%rbx, %r8	 ; _45,
	leaq	.LC10(%rip), %rdx	 ;, tmp248
	call	fprintf	 ;
 ; D:/TC/src/tac.c:795:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L79	 ;
.L111:
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	 ; base_153->type, base_153->type
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rcx	 ; _56->name, _56->name
	leaq	.LC11(%rip), %rdx	 ;, tmp258
	call	strcmp	 ;
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp334
	jne	.L118	 ;,
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rdi), %rcx	 ; variable_access_140(D)->content.index, variable_access_140(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp336, _65
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp337, index
 ; D:/TC/src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	je	.L119	 ;,
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	.refptr.name_int(%rip), %rax	 ;, tmp266
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; name_int, name_int
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp339, _69
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp340, <retval>
 ; D:/TC/src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rdi, %r9	 ; index,
	movq	%rbp, %r8	 ; base,
	movq	%rax, %rdx	 ; <retval>,
	movl	$16, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp341, inst
 ; D:/TC/src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%rsi)	 ;, temp_209->is_get
 ; D:/TC/src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_141(D)->current_block, status_141(D)->current_block
	movq	8(%rax), %rcx	 ; _70->instructions, _70->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:823:         return temp;
	jmp	.L79	 ;
.L118:
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	0(%rbp), %rax	 ; base_153->value.variable, base_153->value.variable
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	 ; _59->original_name, _59->original_name
	movq	8(%rax), %rbx	 ; _60->name, _61
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	24(%rax), %rcx	 ; _62->_stderr, _62->_stderr
	movq	%rbx, %r8	 ; _61,
	leaq	.LC12(%rip), %rdx	 ;, tmp262
	call	fprintf	 ;
 ; D:/TC/src/tac.c:808:             return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L79	 ;
.L119:
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	24(%rax), %r9	 ; _66->_stderr,
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC13(%rip), %rcx	 ;, tmp265
	call	fwrite	 ;
 ; D:/TC/src/tac.c:814:             return NULL;
	movq	%rdi, %rsi	 ; index, <retval>
	jmp	.L79	 ;
.L112:
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ;, tmp270
	movq	(%rdx), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	8(%rax), %rcx	 ; _73->name, _73->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp342, _77
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rbp), %rax	 ; base_153->type, base_153->type
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _78->ast_node.class, _78->ast_node.class
	movq	16(%rax), %rcx	 ; _79->class_scope, _79->class_scope
	call	search_name_use_strcmp	 ;
	movq	%rax, %rcx	 ; tmp343, attr
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; attr_158->type, attr_158->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp344, _82
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbp	 ; tmp345, base
.L97:
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movl	16(%rbp), %esi	 ; base_129->kind, _72
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rsi), %eax	 ;, tmp277
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	 ;, tmp277
	ja	.L98	 ;,
 ; D:/TC/src/tac.c:834:         long long arg_count = 0;
	movq	$0, 48(%rsp)	 ;, arg_count
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	create_list	 ;
	movq	%rax, %rsi	 ; tmp347, arguments
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%rbp)	 ;, base_129->kind
	je	.L120	 ;,
.L101:
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rcx	 ; variable_access_140(D)->content.args, variable_access_140(D)->content.args
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp357, args
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	56(%rsp), %r13	 ;, tmp307
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L102	 ;
.L120:
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp281
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	8(%rbp), %rax	 ; base_129->type, base_129->type
	movq	8(%rax), %rcx	 ; _91->name, _91->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp348, _93
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	0(%rbp), %rax	 ; base_129->value.subroutine, base_129->value.subroutine
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _94->original_name, _94->original_name
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rcx	 ; _95->name, _95->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; tmp349
	je	.L101	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	(%rdi), %rax	 ; variable_access_140(D)->base, variable_access_140(D)->base
	movq	(%rax), %rax	 ; _98->base, _98->base
	movq	%rax, 32(%rsp)	 ; _98->base,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
	movq	%rax, %r8	 ;, tmp350
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rcx	 ; tmp351, _101
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp352, _102
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp353, self
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%rax), %rcx	 ; self_170->type, self_170->type
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 56(%rsp)	 ; tmp354, MEM[(long long int *)_250]
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	56(%rsp), %rdx	 ;, tmp294
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp355, _106
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movl	$0, %r9d	 ;,
	movq	%r12, %r8	 ; self,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp356, _107
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rsi, %rcx	 ; arguments,
	call	list_append	 ;
 ; D:/TC/src/tac.c:840:             arg_count++;
	addq	$1, 48(%rsp)	 ;, arg_count
	jmp	.L101	 ;
.L103:
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp358, _111
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp359, arg
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_193->type, arg_193->type
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 56(%rsp)	 ; tmp360, MEM[(long long int *)_250]
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r13, %rdx	 ; tmp307,
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp361, _115
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; arg,
	movl	$17, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp362, _116
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rsi, %rcx	 ; arguments,
	call	list_append	 ;
 ; D:/TC/src/tac.c:848:             arg_count++;
	addq	$1, 48(%rsp)	 ;, arg_count
.L102:
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp363, arg_expr
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	jne	.L103	 ;,
	jmp	.L104	 ;
.L105:
 ; D:/TC/src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	 ; status_141(D)->current_block, status_141(D)->current_block
	movq	8(%rax), %rcx	 ; _119->instructions, _119->instructions
	call	list_append	 ;
.L104:
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	%rsi, %rcx	 ; arguments,
	call	list_pop	 ;
	movq	%rax, %rdx	 ; tmp364, arg
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	 ; arg
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rbp), %rdx	 ; base_129->type, base_129->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp365, _122
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp366, <retval>
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	leaq	48(%rsp), %rdx	 ;, tmp301
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r9	 ;, tmp367
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rbp, %r8	 ; base,
	movq	%rsi, %rdx	 ; <retval>,
	movl	$22, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp368, _124
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	 ; status_141(D)->current_block, status_141(D)->current_block
	movq	8(%rax), %rcx	 ; _125->instructions, _125->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:856:         return temp;
	jmp	.L79	 ;
.L96:
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	movl	%esi, %r8d	 ; _16,
	leaq	.LC15(%rip), %rdx	 ;, tmp305
	call	fprintf	 ;
 ; D:/TC/src/tac.c:860:         return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L79	 ;
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC18:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_38(D)->type, _1
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L122	 ;,
	movq	%rdx, %rsi	 ; tmp154, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L124(%rip), %r8	 ;, tmp120
	movslq	(%r8,%rbx,4), %rax	 ;, tmp122
	addq	%r8, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L124:
	.long	.L132-.L124
	.long	.L131-.L124
	.long	.L130-.L124
	.long	.L129-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L126-.L124
	.long	.L125-.L124
	.long	.L123-.L124
	.text
.L132:
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	strtoll	 ;
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 40(%rsp)	 ; tmp155, MEM[(long long int *)_95]
 ; D:/TC/src/tac.c:685:             return create_arg(ARG_INT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp126
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp156, <retval>
.L121:
 ; D:/TC/src/tac.c:742: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L131:
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$0, %edx	 ;,
	call	strtod	 ;
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 40(%rsp)	 ; tmp157, MEM[(double *)_95]
 ; D:/TC/src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	leaq	40(%rsp), %rdx	 ;, tmp128
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp158, <retval>
	jmp	.L121	 ;
.L130:
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_38(D)->value.literal_value, primary_38(D)->value.literal_value
	movl	$3, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp159, <retval>
	jmp	.L121	 ;
.L129:
 ; D:/TC/src/tac.c:695:             bool t = true;
	movb	$1, 40(%rsp)	 ;, MEM[(char *)_95]
 ; D:/TC/src/tac.c:697:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp130
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp160, <retval>
	jmp	.L121	 ;
.L128:
 ; D:/TC/src/tac.c:700:             bool t = false;
	movb	$0, 40(%rsp)	 ;, MEM[(char *)_95]
 ; D:/TC/src/tac.c:702:             return create_arg(ARG_BOOL, &t);
	leaq	40(%rsp), %rdx	 ;, tmp131
	movl	$4, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp161, <retval>
	jmp	.L121	 ;
.L127:
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp162, <retval>
	jmp	.L121	 ;
.L126:
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rcx	 ; tmp163, _9
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp164, operand
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp134
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; name_bool, name_bool
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp165, _11
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp166, <retval>
 ; D:/TC/src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; operand,
	movq	%rax, %rdx	 ; <retval>,
	movl	$13, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp167, inst
 ; D:/TC/src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:713:             return temp;
	jmp	.L121	 ;
.L125:
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rcx	 ; tmp168, _15
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp169, operand
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp170, _17
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp171, <retval>
 ; D:/TC/src/tac.c:719:             long long zero_int = 0;
	movq	$0, 32(%rsp)	 ;, zero_int
 ; D:/TC/src/tac.c:720:             double neg_one_float = -1.0;
	movq	.LC16(%rip), %rax	 ;, tmp180
	movq	%rax, 40(%rsp)	 ; tmp180, MEM[(double *)_95]
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_44->type, _18
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp141
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	cmpq	(%rdx), %rax	 ; name_int, _18
	je	.L139	 ;,
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp143
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	cmpq	(%rdx), %rax	 ; name_float, _18
	je	.L140	 ;,
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
	leaq	.LC17(%rip), %rdx	 ;, tmp146
	call	fprintf	 ;
 ; D:/TC/src/tac.c:728:                 return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L121	 ;
.L139:
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	32(%rsp), %rdx	 ;, tmp142
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp172
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp173, inst
	jmp	.L135	 ;
.L140:
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	40(%rsp), %rdx	 ;, tmp144
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp174
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp175, inst
.L135:
 ; D:/TC/src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:732:             return temp;
	jmp	.L121	 ;
.L123:
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.var, primary_38(D)->value.var
	call	tac_variable_access	 ;
	movq	%rax, %rbx	 ; tmp177, <retval>
	jmp	.L121	 ;
.L122:
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC18(%rip), %rdx	 ;, tmp151
	call	fprintf	 ;
 ; D:/TC/src/tac.c:740:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L121	 ;
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
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
 ; D:/TC/src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	je	.L169	 ;,
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp146, _4
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp147, right
 ; D:/TC/src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rsi), %ebp	 ; expression_31(D)->operator, _63
 ; D:/TC/src/tac.c:35:     switch (op) {
	cmpl	$18, %ebp	 ;, _63
	ja	.L144	 ;,
	movl	%ebp, %eax	 ; _63, _63
	leaq	.L146(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%rax,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L146:
	.long	.L150-.L146
	.long	.L149-.L146
	.long	.L165-.L146
	.long	.L147-.L146
	.long	.L145-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L151-.L146
	.long	.L150-.L146
	.long	.L149-.L146
	.long	.L165-.L146
	.long	.L147-.L146
	.long	.L145-.L146
	.text
.L169:
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
	call	tac_primary	 ;
	movq	%rax, %rsi	 ; tmp145, <retval>
 ; D:/TC/src/tac.c:652:         return result;
	jmp	.L141	 ;
.L147:
 ; D:/TC/src/tac.c:43:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %ebp	 ;, _63
.L148:
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp160, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp138
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp138
	jbe	.L163	 ;,
.L160:
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_78->type, left_78->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp156, _18
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp157, <retval>
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp158
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _63,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp159, inst
	jmp	.L162	 ;
.L145:
 ; D:/TC/src/tac.c:45:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %ebp	 ;, _63
	jmp	.L148	 ;
.L144:
 ; D:/TC/src/tac.c:56:         default: return INST_NONE;
	movl	$25, %ebp	 ;, _63
	jmp	.L148	 ;
.L150:
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp148, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp126
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp126
	ja	.L166	 ;,
	movl	$0, %ebp	 ;, _63
.L163:
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; left_76->type, left_76->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp149, _9
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp150, <retval>
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue	 ;
	movq	%rax, %r8	 ;, tmp151
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %r9	 ; right,
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; _63,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp152, inst
 ; D:/TC/src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L164:
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rdi)	 ;, left_77->kind
	jne	.L170	 ;,
.L161:
 ; D:/TC/src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp154, inst
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_77->is_get
	jne	.L171	 ;,
.L162:
 ; D:/TC/src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
.L141:
 ; D:/TC/src/tac.c:678: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L170:
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movq	24(%rax), %r9	 ; _14->_stderr,
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rcx	 ;, tmp132
	call	fwrite	 ;
	jmp	.L161	 ;
.L171:
 ; D:/TC/src/tac.c:669:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; <retval>,
	movq	%rdi, %rdx	 ; left,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
	jmp	.L162	 ;
.L166:
	movl	$0, %ebp	 ;, _63
	jmp	.L160	 ;
.L149:
 ; D:/TC/src/tac.c:39:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %ebp	 ;, _63
	jmp	.L148	 ;
.L165:
 ; D:/TC/src/tac.c:35:     switch (op) {
	movl	$2, %ebp	 ;, _63
	jmp	.L148	 ;
.L151:
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp161, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp141
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp141
	ja	.L172	 ;,
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%r12, %rsi	 ; right, <retval>
	jmp	.L164	 ;
.L172:
 ; D:/TC/src/tac.c:46:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %ebp	 ;, _63
	jmp	.L160	 ;
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC21:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp127, variable
	movq	%rdx, %rbx	 ; tmp128, status
 ; D:/TC/src/tac.c:403:     if (is_attr) {
	testb	%r8b, %r8b	 ; tmp129
	je	.L174	 ;,
 ; D:/TC/src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _1->attribute_tables, _1->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rdi	 ; tmp130, attr_table
 ; D:/TC/src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	movq	%rdi, %rdx	 ; attr_table,
	call	list_append	 ;
 ; D:/TC/src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rsi), %r12	 ; variable_20(D)->type, _5
	movq	8(%rsi), %rbp	 ; variable_20(D)->name, _6
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp131, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%r12, %rdx	 ; _5,
	movq	%rbp, %rcx	 ; _6,
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%rsi)	 ; tmp132, attr_38->var
 ; D:/TC/src/tac.c:198:     attr->type = type;
	movq	%r12, 8(%rsi)	 ; _5, attr_38->type
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rsi)	 ;, attr_38->offset
 ; D:/TC/src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%rdi, %rdi	 ; attr_table
	jne	.L183	 ;,
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movq	24(%rax), %r9	 ; _47->_stderr,
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp119
	call	fwrite	 ;
.L176:
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movq	24(%rax), %r9	 ; _50->_stderr,
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp121
	call	fwrite	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L173	 ;
.L183:
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rdi), %rax	 ; attr_table_35->size, _43
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rsi)	 ; _43, attr_38->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%r12, %rcx	 ; _5,
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rdi)	 ; tmp133, attr_table_35->size
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%rdi), %rcx	 ; attr_table_35->attributes, _49
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _49
	je	.L176	 ;,
 ; D:/TC/src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
	call	list_append	 ;
	jmp	.L173	 ;
.L174:
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp136, var
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rsi), %rcx	 ; variable_20(D)->value, _9
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	testq	%rcx, %rcx	 ; _9
	je	.L179	 ;,
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp137, _10
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rsi	 ; tmp138, value
.L180:
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rdi, %rdx	 ; var,
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp140, _11
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movl	$0, %r9d	 ;,
	movq	%rsi, %r8	 ; value,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp141, _12
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
.L173:
 ; D:/TC/src/tac.c:421: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L179:
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	$0, 40(%rsp)	 ;, D.5728
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	leaq	40(%rsp), %rdx	 ;, tmp124
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp139, value
	jmp	.L180	 ;
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
	movq	%rcx, %r12	 ; tmp183, if_
	movq	%rdx, %rbx	 ; tmp184, status
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp185, then_label
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp186, else_label
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r12), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp187
	je	.L185	 ;,
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r12), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:472:         end_label = else_label;
	movq	%rsi, %r15	 ; else_label, end_label
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp188
	jne	.L186	 ;,
.L185:
 ; D:/TC/src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r15	 ; tmp189, end_label
.L186:
 ; D:/TC/src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r15, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r13	 ; tmp190, end_block_arg
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r12), %rcx	 ; if__63(D)->condition, if__63(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp191, _6
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp192, condition
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp193, _7
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rdi, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp194
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %r9	 ; _7,
	movq	%rbp, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp195, inst
 ; D:/TC/src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:481:     Block* then_block = create_block(then_label);
	movq	%rdi, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp196, then_block
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	movq	%rdi, %rdx	 ; then_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:483:     status->current_block = then_block;
	movq	%rdi, 16(%rbx)	 ; then_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r12), %rcx	 ; if__63(D)->body, if__63(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp197, then_statements
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L187	 ;
.L188:
 ; D:/TC/src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L187:
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp198, statement
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L188	 ;,
 ; D:/TC/src/tac.c:490:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp199, jump_to_end
 ; D:/TC/src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r12), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp200
	je	.L201	 ;,
.L189:
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r12), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp217
	je	.L202	 ;,
.L195:
 ; D:/TC/src/tac.c:541:     Block* end_block = create_block(end_label);
	movq	%r15, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp222, end_block
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _42->blocks, _42->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:543:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:545: }
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
.L201:
 ; D:/TC/src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r12), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp201, elif_list
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L190	 ;
.L203:
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r12), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	 ; tmp208
	cmovne	%r15, %rsi	 ; else_label,, end_label, else_label
	jmp	.L191	 ;
.L193:
 ; D:/TC/src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L192:
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp214, elif_statement
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L193	 ;,
 ; D:/TC/src/tac.c:521:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp215, jump_to_end
 ; D:/TC/src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
.L190:
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r14, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp216, elif
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L189	 ;,
 ; D:/TC/src/tac.c:499:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp202, else_if_block
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _19->blocks, _19->blocks
	movq	%rsi, %rdx	 ; else_if_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:501:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp203, then_label
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rsi	 ; tmp204, else_label
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	(%rdi), %rcx	 ; elif_93->condition, elif_93->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp205, _22
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, 40(%rsp)	 ; tmp206, %sfp
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r14, %rcx	 ; elif_list,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp207
	jne	.L203	 ;,
.L191:
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, 32(%rsp)	 ; tmp209, %sfp
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp210
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	32(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp211, inst
 ; D:/TC/src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _28->instructions, _28->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:512:             then_block = create_block(then_label);
	movq	%rbp, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp212, then_block
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _30->blocks, _30->blocks
	movq	%rbp, %rdx	 ; then_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:514:             status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; then_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rdi), %rcx	 ; elif_93->body, elif_93->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp213, elif_statements
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L192	 ;
.L202:
 ; D:/TC/src/tac.c:528:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp218, else_block
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _37->blocks, _37->blocks
	movq	%rsi, %rdx	 ; else_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:530:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp219, else_statements
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L196	 ;
.L197:
 ; D:/TC/src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L196:
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp220, else_statement
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L197	 ;,
 ; D:/TC/src/tac.c:537:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; end_block_arg,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp221, jump_to_end
 ; D:/TC/src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _40->instructions, _40->instructions
	call	list_append	 ;
	jmp	.L195	 ;
	.section .rdata,"dr"
	.align 8
.LC22:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC23:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC24:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_35(D)->type, _1
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L205	 ;,
	movq	%rcx, %rsi	 ; tmp148, statement
	movq	%rdx, %rdi	 ; tmp149, status
	movl	%ebx, %ebx	 ; _1, _1
	leaq	.L207(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L207:
	.long	.L214-.L207
	.long	.L213-.L207
	.long	.L212-.L207
	.long	.L211-.L207
	.long	.L210-.L207
	.long	.L209-.L207
	.long	.L208-.L207
	.long	.L206-.L207
	.text
.L214:
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.expr, statement_35(D)->stmt.expr
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp150, _3
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rdi, %rdx	 ; status,
	call	load_rvalue	 ;
.L204:
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
.L213:
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.var, statement_35(D)->stmt.var
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	.L204	 ;
.L212:
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.if_stmt, statement_35(D)->stmt.if_stmt
	movq	%rdi, %rdx	 ; status,
	call	tac_if	 ;
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L204	 ;
.L211:
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.while_stmt, statement_35(D)->stmt.while_stmt
	movq	%rdi, %rdx	 ; status,
	call	tac_while	 ;
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L204	 ;
.L210:
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.for_stmt, statement_35(D)->stmt.for_stmt
	movq	%rdi, %rdx	 ; status,
	call	tac_for	 ;
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L204	 ;
.L209:
 ; D:/TC/src/tac.c:431:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_35(D)->stmt.return_expr, _8
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _8
	je	.L216	 ;,
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp152, _9
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rdi, %rdx	 ; status,
	call	load_rvalue	 ;
.L216:
 ; D:/TC/src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	%rax, %rdx	 ; return_value,
	movl	$21, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp154, _10
 ; D:/TC/src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	16(%rdi), %rax	 ; status_36(D)->current_block, status_36(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:435:             break;
	jmp	.L204	 ;
.L208:
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rdi), %rcx	 ; status_36(D)->end_labels, status_36(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp155
	jne	.L217	 ;,
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rdi), %rax	 ; status_36(D)->end_labels, status_36(D)->end_labels
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _15->tail, _15->tail
	movq	8(%rax), %rdx	 ; _16->content, label
 ; D:/TC/src/tac.c:440:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L217	 ;,
 ; D:/TC/src/tac.c:441:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp156, inst
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_36(D)->current_block, status_36(D)->current_block
	movq	8(%rax), %rcx	 ; _17->instructions, _17->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:443:                     break;
	jmp	.L204	 ;
.L217:
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movq	24(%rax), %r9	 ; _19->_stderr,
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp138
	call	fwrite	 ;
 ; D:/TC/src/tac.c:447:             break;
	jmp	.L204	 ;
.L206:
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rdi), %rcx	 ; status_36(D)->start_labels, status_36(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp158
	jne	.L218	 ;,
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rdi), %rax	 ; status_36(D)->start_labels, status_36(D)->start_labels
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _23->tail, _23->tail
	movq	8(%rax), %rdx	 ; _24->content, label
 ; D:/TC/src/tac.c:451:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L218	 ;,
 ; D:/TC/src/tac.c:452:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp159, inst
 ; D:/TC/src/tac.c:453:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_36(D)->current_block, status_36(D)->current_block
	movq	8(%rax), %rcx	 ; _25->instructions, _25->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:454:                     break;
	jmp	.L204	 ;
.L218:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movq	24(%rax), %r9	 ; _27->_stderr,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp145
	call	fwrite	 ;
 ; D:/TC/src/tac.c:458:             break;
	jmp	.L204	 ;
.L205:
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC24(%rip), %rdx	 ;, tmp147
	call	fprintf	 ;
 ; D:/TC/src/tac.c:464: }
	jmp	.L204	 ;
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
	movq	%rcx, %rdi	 ; tmp173, for_
	movq	%rdx, %rbx	 ; tmp174, status
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__55(D)->initializer, _1
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L221	 ;,
 ; D:/TC/src/tac.c:550:         tac_variable(for_->initializer, status, false);
	movl	$0, %r8d	 ;,
	call	tac_variable	 ;
.L221:
 ; D:/TC/src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp175, condition_label
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r13	 ; tmp176, body_label
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp177, end_label
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__55(D)->condition
	je	.L222	 ;,
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp178, _3
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp179, inst
 ; D:/TC/src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:559:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp180, condition_block
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	movq	%rsi, %rdx	 ; condition_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:561:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; condition_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rdi), %rcx	 ; for__55(D)->condition, for__55(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp181, _9
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %rsi	 ; tmp182, condition
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp183, _10
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp184
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _10,
	movq	%rsi, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp185, inst
 ; D:/TC/src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
.L223:
 ; D:/TC/src/tac.c:572:     Block* body_block = create_block(body_label);
	movq	%r13, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp188, body_block
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _17->blocks, _17->blocks
	movq	%rsi, %rdx	 ; body_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:574:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; body_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r14	 ; tmp189, increment_label
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__55(D)->increment
	je	.L224	 ;,
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp190, _20
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
	call	list_append	 ;
.L225:
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp193, _27
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_56(D)->end_labels, status_56(D)->end_labels
	call	list_append	 ;
 ; D:/TC/src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__55(D)->body, for__55(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp194, body_statements
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L227	 ;
.L222:
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp186, _14
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp187, inst
 ; D:/TC/src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _15->instructions, _15->instructions
	call	list_append	 ;
	jmp	.L223	 ;
.L224:
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__55(D)->condition
	je	.L226	 ;,
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp191, _23
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
	call	list_append	 ;
	jmp	.L225	 ;
.L226:
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp192, _25
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
	call	list_append	 ;
	jmp	.L225	 ;
.L228:
 ; D:/TC/src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L227:
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L228	 ;,
 ; D:/TC/src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_56(D)->end_labels, status_56(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__55(D)->increment
	je	.L229	 ;,
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp196, _33
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:/TC/src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _34->instructions, _34->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:594:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp198, increment_block
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _36->blocks, _36->blocks
	movq	%rsi, %rdx	 ; increment_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:596:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; increment_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rdi), %rcx	 ; for__55(D)->increment, for__55(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp199, _39
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
.L229:
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp200, _40
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp201, inst
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__55(D)->condition
	je	.L232	 ;,
.L230:
 ; D:/TC/src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _43->instructions, _43->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:605:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp204, end_block
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _45->blocks, _45->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:607:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:609: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L232:
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r13, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp202, _42
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp203, inst
	jmp	.L230	 ;
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
	movq	%rcx, %rsi	 ; tmp139, while_
	movq	%rdx, %rbx	 ; tmp140, status
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rdi	 ; tmp141, condition_label
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp142, _1
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp143, inst
 ; D:/TC/src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:616:     Block* condition_block = create_block(condition_label);
	movq	%rdi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rbp	 ; tmp144, condition_block
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	movq	%rbp, %rdx	 ; condition_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:618:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	 ; condition_block, status_28(D)->current_block
 ; D:/TC/src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %r12	 ; tmp145, body_label
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp146, end_label
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	(%rsi), %rcx	 ; while__43(D)->condition, while__43(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rcx	 ; tmp147, _7
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue	 ;
	movq	%rax, %r13	 ; tmp148, condition
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r14	 ; tmp149, _8
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %r8	 ;, tmp150
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %r9	 ; _8,
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp151, inst
 ; D:/TC/src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _10->instructions, _10->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:626:     Block* body_block = create_block(body_label);
	movq	%r12, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp152, body_block
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _12->blocks, _12->blocks
	movq	%r12, %rdx	 ; body_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; body_block, status_28(D)->current_block
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp153, _14
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_28(D)->start_labels, status_28(D)->start_labels
	call	list_append	 ;
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp154, _16
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_28(D)->end_labels, status_28(D)->end_labels
	call	list_append	 ;
 ; D:/TC/src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__43(D)->body, while__43(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp155, body_statements
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L234	 ;
.L235:
 ; D:/TC/src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L234:
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp156, statement
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L235	 ;,
 ; D:/TC/src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_28(D)->start_labels, status_28(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_28(D)->end_labels, status_28(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rdi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp157, _21
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp158, inst
 ; D:/TC/src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:642:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp159, end_block
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _24->blocks, _24->blocks
	movq	%rsi, %rdx	 ; end_block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:644:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_28(D)->current_block
 ; D:/TC/src/tac.c:646: }
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
 ; D:/TC/src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rcx), %rdx	 ; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rcx), %rcx	 ; function_16(D)->name, function_16(D)->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp114, subroutine
 ; D:/TC/src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; D:/TC/src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp115, parameters
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L238	 ;
.L239:
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp116, _8
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
	call	list_append	 ;
.L238:
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L239	 ;,
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp118, _10
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp119, block
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:332:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:/TC/src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rbp), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp120, statements
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L240	 ;
.L241:
 ; D:/TC/src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L240:
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp121, statement
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L241	 ;,
 ; D:/TC/src/tac.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:341: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rbp	 ; tmp157, method
	movq	%rdx, %rbx	 ; tmp158, status
 ; D:/TC/src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rcx), %rdx	 ; method_44(D)->return_type, method_44(D)->return_type
	movq	(%rcx), %rcx	 ; method_44(D)->name, method_44(D)->name
	call	create_subroutine	 ;
	movq	%rax, %rsi	 ; tmp159, subroutine
 ; D:/TC/src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_47(D)->current_subroutine
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_47(D)->tac, status_47(D)->tac
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	movq	%rsi, %rdx	 ; subroutine,
	call	list_append	 ;
 ; D:/TC/src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rcx	 ; method_44(D)->parameters, method_44(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp160, parameters
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L244	 ;
.L245:
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_53->type, parameter_53->type
	movq	8(%rax), %rcx	 ; parameter_53->name, parameter_53->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp161, _8
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_46->parameters, subroutine_46->parameters
	call	list_append	 ;
.L244:
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L245	 ;,
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp163, _10
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp164, block
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_46->blocks, subroutine_46->blocks
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:356:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_47(D)->current_block
 ; D:/TC/src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rbp), %rcx	 ; method_44(D)->body, method_44(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp165, statements
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp141
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_47(D)->current_class, status_47(D)->current_class
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _14->name, _14->name
	movq	8(%rax), %rcx	 ; _15->name, _15->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp166, _17
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%rbp), %rax	 ; method_44(D)->name, method_44(D)->name
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _18->name, _18->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp167
	jne	.L250	 ;,
 ; D:/TC/src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 8(%rax)	 ;, stmt_63->type
	jne	.L247	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; stmt_63->stmt.expr, _22
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	 ;, _22->operator
	jne	.L247	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _22->prim_left, _24
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	 ;, _24->type
	jne	.L247	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _24->value.var, _26
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 16(%rax)	 ;, _26->type
	je	.L248	 ;,
.L247:
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	0(%rbp), %rax	 ; method_44(D)->name, method_44(D)->name
	movq	8(%rax), %rbx	 ; _28->name, _29
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	24(%rax), %rcx	 ; _30->_stderr, _30->_stderr
	movq	%rbx, %r8	 ; _29,
	leaq	.LC25(%rip), %rdx	 ;, tmp152
	call	fprintf	 ;
 ; D:/TC/src/tac.c:363:             return;
	jmp	.L243	 ;
.L248:
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r12	 ; _26->content.name, self
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	 ; status_47(D)->current_class, tmp176
	leaq	24(%rax), %rdx	 ;, tmp153
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rbp	 ; tmp170, _34
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r12), %rdx	 ; self_64->type, self_64->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%r12, %rcx	 ; self,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp171, _36
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %ecx	 ;,
	call	create_arg	 ;
	movq	%rax, %rdx	 ; tmp172, _37
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %r9d	 ;,
	movq	%rbp, %r8	 ; _34,
	movl	$18, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp173, _38
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_56->instructions, block_56->instructions
	call	list_append	 ;
	jmp	.L250	 ;
.L251:
 ; D:/TC/src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L250:
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp174, statement
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L251	 ;,
 ; D:/TC/src/tac.c:373:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_47(D)->current_subroutine
.L243:
 ; D:/TC/src/tac.c:375: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC26:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp105, class
	movq	%rdx, %rdi	 ; tmp106, status
 ; D:/TC/src/tac.c:378:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_13(D)->current_class
 ; D:/TC/src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_14(D)->members, class_14(D)->members
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp107, members
 ; D:/TC/src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rbx), %rbp	 ; class_14(D)->name, _2
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp108, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp109, table_28->attributes
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	%rbp, 8(%rbx)	 ; _2, table_28->name
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_28->size
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_13(D)->tac, status_13(D)->tac
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	movq	%rbx, %rdx	 ; table,
	call	list_append	 ;
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC26(%rip), %rbp	 ;, tmp104
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L254	 ;
.L255:
 ; D:/TC/src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_22->content.method, member_22->content.method
	movq	%rdi, %rdx	 ; status,
	call	tac_method	 ;
.L254:
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L262	 ;,
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_22->type, _5
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	testl	%ebx, %ebx	 ; _5
	je	.L255	 ;,
	cmpl	$1, %ebx	 ;, _5
	je	.L256	 ;,
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	movl	%ebx, %r8d	 ; _5,
	movq	%rbp, %rdx	 ; tmp104,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:394:                 break;
	jmp	.L254	 ;
.L256:
 ; D:/TC/src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rcx	 ; member_22->content.variable, member_22->content.variable
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:391:                 break;
	jmp	.L254	 ;
.L262:
 ; D:/TC/src/tac.c:397:     status->current_class = NULL;
	movq	$0, 24(%rdi)	 ;, status_13(D)->current_class
 ; D:/TC/src/tac.c:399: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rdx, %rsi	 ; tmp106, tac
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rcx	 ; import_15(D)->name, _1
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rcx), %ebx	 ; _1->kind, _2
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L269	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp99
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp99
	jbe	.L270	 ;,
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L267	 ;,
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rcx), %rcx	 ; _1->ast_node.class, _1->ast_node.class
	movq	%r8, %rdx	 ; status,
	call	tac_class	 ;
.L263:
 ; D:/TC/src/tac.c:317: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L269:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp108, _4
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rsi), %rcx	 ; tac_21(D)->global_vars, tac_21(D)->global_vars
	call	list_append	 ;
	jmp	.L263	 ;
.L270:
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp109, _8
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rsi), %rcx	 ; tac_21(D)->global_vars, tac_21(D)->global_vars
	call	list_append	 ;
	jmp	.L263	 ;
.L267:
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC27(%rip), %rdx	 ;, tmp104
	call	fprintf	 ;
 ; D:/TC/src/tac.c:317: }
	jmp	.L263	 ;
	.section .rdata,"dr"
.LC28:
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
 ; D:/TC/src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rcx	 ; code_17(D)->members, code_17(D)->members
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp121, members
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC28(%rip), %r12	 ;, tmp112
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L272	 ;
.L279:
 ; D:/TC/src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.function, code_member_21->content.function
	movq	%rsi, %rdx	 ; status,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	 ; code_member_21->content.function, code_member_21->content.function
	movq	(%rax), %rbx	 ; _4->name, _5
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rcx	 ; _5->name, _5->name
	movq	%r12, %rdx	 ; tmp112,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp122
	jne	.L272	 ;,
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%rbp)	 ; _5, tac_29->entry_point
	jmp	.L272	 ;
.L280:
 ; D:/TC/src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
.L272:
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp123, code_member
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L278	 ;,
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L279	 ;,
 ; D:/TC/src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L280	 ;,
 ; D:/TC/src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L272	 ;,
 ; D:/TC/src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.import, code_member_21->content.import
	movq	%rsi, %r8	 ; status,
	movq	%rbp, %rdx	 ; <retval>,
	call	tac_import	 ;
	jmp	.L272	 ;
.L278:
 ; D:/TC/src/tac.c:304: }
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
.LC16:
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
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
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
