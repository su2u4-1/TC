	.file	"tac.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.def	create_instruction;	.scl	3;	.type	32;	.endef
create_instruction:
	pushq	%rbp	 ;
	movl	%ecx, %ebp	 ; tmp88, type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:211: static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, arg1
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, arg2
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, arg3
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
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
	movq	%rcx, %rdi	 ; tmp89, name
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
 ; D:/TC/src/tac.c:86: static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp90, return_type
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movq	%rdi, (%rax)	 ; name, subroutine_6->name
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbx	 ; tmp91, <retval>
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
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:97: static Block* create_block(Var* label) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; label, block_4->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	 ; tmp88, block_4->instructions
 ; D:/TC/src/tac.c:104: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.def	create_arg;	.scl	3;	.type	32;	.endef
create_arg:
	pushq	%rsi	 ;
	movl	%ecx, %esi	 ; tmp115, kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:221: static Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp116, value
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_16->kind
 ; D:/TC/src/tac.c:226:     switch (kind) {
	decl	%esi	 ;
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	%rcx, 8(%rax)	 ;, arg_16->type
 ; D:/TC/src/tac.c:226:     switch (kind) {
	cmpl	$6, %esi	 ;, tmp95
	ja	.L9	 ;,
	leaq	.L10(%rip), %rcx	 ;, tmp97
	movslq	(%rcx,%rsi,4), %rdx	 ;, tmp99
	addq	%rcx, %rdx	 ; tmp97, tmp100
	jmp	*%rdx	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L10:
	.long	.L16-.L10
	.long	.L15-.L10
	.long	.L14-.L10
	.long	.L13-.L10
	.long	.L12-.L10
	.long	.L11-.L10
	.long	.L9-.L10
	.text
.L16:
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	 ; MEM[(long long int *)value_20(D)], _2
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	 ; _2, arg_16->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp103
	jmp	.L20	 ;
.L15:
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	 ; MEM[(double *)value_20(D)], _4
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp105
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	 ; _4, arg_16->value.float_value
	jmp	.L20	 ;
.L14:
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movq	%rbx, (%rax)	 ; value, arg_16->value.string_value
 ; D:/TC/src/tac.c:241:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp107
	jmp	.L20	 ;
.L13:
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	(%rbx), %dl	 ; MEM[(char *)value_20(D)], _7
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	%dl, (%rax)	 ; _7, arg_16->value.bool_value
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp109
	jmp	.L20	 ;
.L12:
 ; D:/TC/src/tac.c:248:             arg->value.string_value = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, arg_16->value.string_value
 ; D:/TC/src/tac.c:249:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp111
.L20:
	movq	(%rdx), %rdx	 ;, name_void
	jmp	.L19	 ;
.L11:
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	 ; value, arg_16->value.label
 ; D:/TC/src/tac.c:253:             break;
	jmp	.L17	 ;
.L9:
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	 ; value,* <retval>
 ; D:/TC/src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	 ; MEM[(struct Var *)value_20(D)].type, MEM[(struct Var *)value_20(D)].type
.L19:
	movq	%rdx, 8(%rax)	 ; MEM[(struct Var *)value_20(D)].type, arg_16->type
.L17:
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_16->is_get
 ; D:/TC/src/tac.c:266: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
	.text
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; D:/TC/src/tac.c:19:         result = 0;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L30	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_int
	je	.L31	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_float
	je	.L31	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_string
	je	.L31	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp97
 ; D:/TC/src/tac.c:23:         result = 1;
	movl	$1, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rdx)	 ; type, name_bool
	je	.L30	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp98
	cmpq	%rcx, (%rdx)	 ; type, name_void
	je	.L30	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rcx)	 ;, type_14(D)->kind
	jne	.L25	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_14(D)->ast_node.class, type_14(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
.L25:
 ; D:/TC/src/tac.c:15: static size_t get_type_size(Symbol* type) {
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %r8	 ; type_14(D)->name, _8
	movq	%r8, 40(%rsp)	 ; _8, %sfp
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	40(%rsp), %r8	 ; %sfp, _8
	leaq	.LC0(%rip), %rdx	 ;, tmp101
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:21:         result = 8;
	movl	$8, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:30: }
	addq	$56, %rsp	 ;,
	ret	
.L31:
 ; D:/TC/src/tac.c:21:         result = 8;
	movl	$8, %eax	 ;, <retval>
	ret	
.L30:
 ; D:/TC/src/tac.c:30: }
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
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp170, type
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp169, original_name
	pushq	%rdi	 ;
	movl	%r8d, %edi	 ; tmp171, kind
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp172, status
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	jne	.L34	 ;,
.L67:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%rbp, (%rax)	 ; original_name, var_42->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp173, <retval>
 ; D:/TC/src/tac.c:174:     switch (kind) {
	cmpl	$112, %edi	 ;, kind
	je	.L35	 ;,
	ja	.L36	 ;,
	cmpl	$98, %edi	 ;, kind
	je	.L37	 ;,
	cmpl	$102, %edi	 ;, kind
	je	.L38	 ;,
	cmpl	$97, %edi	 ;, kind
	je	.L39	 ;,
	jmp	.L76	 ;
.L36:
	cmpl	$116, %edi	 ;, kind
	je	.L41	 ;,
	cmpl	$118, %edi	 ;, kind
	je	.L42	 ;,
.L76:
	orq	$-1, %r9	 ;, id
	jmp	.L40	 ;
.L34:
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rdx)	 ;, type_34(D)->kind
	jne	.L43	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rdx), %rax	 ; type_34(D)->ast_node.class, type_34(D)->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%r9), %r14	 ; status_35(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; type_34(D)->ast_node.class, status_35(D)->current_class
.L43:
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rbx), %rax	 ; status_35(D)->current_subroutine, _57
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	 ; _57
	jne	.L44	 ;,
.L47:
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rbx), %rax	 ; status_35(D)->current_subroutine, _65
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	 ; _65
	jne	.L45	 ;,
	jmp	.L46	 ;
.L44:
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rcx	 ; _57->local_vars, _57->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	 ; tmp174
	jne	.L47	 ;,
 ; D:/TC/src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rbx), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _60->local_vars, _60->local_vars
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp175, vars
.L48:
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp176, <retval>
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L47	 ;,
 ; D:/TC/src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	(%rsi), %rbp	 ; var_63->original_name, original_name
	jne	.L48	 ;,
	jmp	.L49	 ;
.L45:
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rcx	 ; _65->parameters, _65->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	 ; tmp177
	jne	.L46	 ;,
 ; D:/TC/src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rbx), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	16(%rax), %rcx	 ; _68->parameters, _68->parameters
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp178, vars
.L53:
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp179, <retval>
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L54	 ;,
.L46:
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rbx)	 ;, status_35(D)->current_class
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rbx), %rax	 ; status_35(D)->tac, pretmp_17
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	jne	.L51	 ;,
	jmp	.L52	 ;
.L54:
 ; D:/TC/src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	(%rsi), %rbp	 ; var_71->original_name, original_name
	jne	.L53	 ;,
	jmp	.L49	 ;
.L51:
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rcx	 ; pretmp_17->attribute_tables,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	 ; tmp181
	jne	.L52	 ;,
 ; D:/TC/src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rbx), %rax	 ; status_35(D)->tac, status_35(D)->tac
	movq	(%rax), %rcx	 ; _77->attribute_tables,
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp182, tables
.L58:
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r13, %rcx	 ; tables,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp186, table
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	 ; table
	jne	.L62	 ;,
.L52:
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	(%rbx), %rax	 ; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rcx	 ; _93->global_vars, _93->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	 ; tmp180
	je	.L55	 ;,
	jmp	.L56	 ;
.L62:
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rbx), %rax	 ; status_35(D)->current_class, status_35(D)->current_class
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	 ; _82->name, tmp192
	cmpq	%rax, 8(%rsi)	 ; tmp192, table_80->name
	jne	.L58	 ;,
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rsi), %rcx	 ; table_80->attributes,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	 ; tmp183
	jne	.L58	 ;,
 ; D:/TC/src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%rsi), %rcx	 ; table_80->attributes,
	call	list_copy	 ;
	movq	%rax, %r15	 ; tmp184, attributes
.L60:
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%r15, %rcx	 ; attributes,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	 ; attr
	je	.L58	 ;,
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rsi	 ; attr_90->var, <retval>
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	(%rsi), %rbp	 ; _91->original_name, original_name
	jne	.L60	 ;,
	jmp	.L49	 ;
.L55:
 ; D:/TC/src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%rbx), %rax	 ; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rcx	 ; _96->global_vars, _96->global_vars
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp187, vars
.L63:
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp188, <retval>
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L64	 ;,
.L56:
 ; D:/TC/src/tac.c:153:     return NULL;
	xorl	%esi, %esi	 ; <retval>
	jmp	.L49	 ;
.L64:
 ; D:/TC/src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	(%rsi), %rbp	 ; var_99->original_name, original_name
	jne	.L63	 ;,
.L49:
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r12)	 ;, type_34(D)->kind
	jne	.L65	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	 ; current_class, status_35(D)->current_class
.L65:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	 ; <retval>
	jne	.L33	 ;,
	jmp	.L67	 ;
.L39:
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rbx), %r9	 ; status_35(D)->attr_count, id
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r9), %rax	 ;, tmp154
	movq	%rax, 48(%rbx)	 ; tmp154, status_35(D)->attr_count
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L40	 ;
.L35:
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbx), %r9	 ; status_35(D)->param_count, id
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r9), %rax	 ;, tmp155
	movq	%rax, 56(%rbx)	 ; tmp155, status_35(D)->param_count
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L40	 ;
.L42:
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rbx), %r9	 ; status_35(D)->var_count, id
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r9), %rax	 ;, tmp156
	movq	%rax, 64(%rbx)	 ; tmp156, status_35(D)->var_count
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L40	 ;
.L41:
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r9	 ; status_35(D)->temp_count, id
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	 ;, tmp157
	movq	%rax, 72(%rbx)	 ; tmp157, status_35(D)->temp_count
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L40	 ;
.L37:
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %r9	 ; status_35(D)->block_count, id
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	 ;, tmp158
	movq	%rax, 80(%rbx)	 ; tmp158, status_35(D)->block_count
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L40	 ;
.L38:
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rbx), %r9	 ; status_35(D)->subroutine_count, id
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r9), %rax	 ;, tmp159
	movq	%rax, 88(%rbx)	 ; tmp159, status_35(D)->subroutine_count
.L40:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp160
	movl	$32, %edx	 ;,
	movq	%r9, 40(%rsp)	 ; id, %sfp
	call	create_string	 ;
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	movq	40(%rsp), %r9	 ; %sfp, id
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%edi, %r8d	 ; kind,
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _16, var_42->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp189, _16
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r9	 ;, id
	jne	.L68	 ;,
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	leaq	.LC2(%rip), %rdx	 ;, tmp161
	call	sprintf	 ;
	jmp	.L69	 ;
.L68:
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	leaq	.LC3(%rip), %rdx	 ;, tmp162
	call	sprintf	 ;
.L69:
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %edi	 ;, tmp163
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r12, 16(%rsi)	 ; type, var_42->type
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %edi	 ;, tmp163
	jne	.L33	 ;,
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	%rsi, %rdx	 ; <retval>,
	movq	24(%rax), %rcx	 ; _20->local_vars, _20->local_vars
	call	list_append	 ;
.L33:
 ; D:/TC/src/tac.c:193: }
	addq	$56, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp96, arg
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L78	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_3(D)->is_get
	je	.L78	 ;,
	movq	%rdx, %rdi	 ; tmp97, status
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_3(D)->type, arg_3(D)->type
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %r9	 ; status,
	call	create_var	 ;
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp98, _10
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %r8	 ; arg,
	xorl	%r9d, %r9d	 ;
	movl	$23, %ecx	 ;,
	movq	%rax, %rdx	 ; temp,
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp99, temp
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rsi, %rbx	 ; temp, arg
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rdx	 ; tmp100, _12
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
.L78:
 ; D:/TC/src/tac.c:281: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC4:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rdi	 ;
	movq	%r8, %r9	 ; tmp106, status
	movq	%rdx, %rdi	 ; tmp105, tac
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movl	$118, %r8d	 ;,
 ; D:/TC/src/tac.c:303: void tac_import(Import* import, TAC* tac, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rsi	 ; import_16(D)->name, _1
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rsi), %ebx	 ; _1->kind, _2
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L88	 ;,
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp100
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp100
	ja	.L85	 ;,
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movl	$102, %r8d	 ;,
.L88:
	movq	(%rsi), %rdx	 ; _1->type,
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp108, _8
.L89:
 ; D:/TC/src/tac.c:314: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
.L85:
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L86	 ;,
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp109, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	%rsi, 8(%rbx)	 ; _1, table_27->name
 ; D:/TC/src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rdi), %rcx	 ; tac_20(D)->attribute_tables,
	movq	%rbx, %rdx	 ; table,
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rbx)	 ; tmp110, table_27->attributes
 ; D:/TC/src/tac.c:11:     table->size = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 16(%rbx)	 ;, table_27->size
	jmp	.L89	 ;
.L86:
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC4(%rip), %rdx	 ;, tmp103
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
 ; D:/TC/src/tac.c:314: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC5:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
.LC6:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp128, variable
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp129, status
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:395:     switch (type) {
	cmpl	$112, %r8d	 ;, type
	je	.L91	 ;,
	ja	.L92	 ;,
	cmpl	$97, %r8d	 ;, type
	je	.L93	 ;,
	cmpl	$102, %r8d	 ;, type
	jne	.L95	 ;,
 ; D:/TC/src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	%rdx, %r9	 ; status,
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	(%rsi), %rdx	 ; variable_20(D)->type,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp132, var
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	jmp	.L99	 ;
.L92:
 ; D:/TC/src/tac.c:395:     switch (type) {
	movl	%r8d, %eax	 ; type, tmp114
	andl	$-3, %eax	 ;, tmp114
	cmpl	$116, %eax	 ;, tmp114
	jne	.L95	 ;,
	jmp	.L101	 ;
.L91:
 ; D:/TC/src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	%rdx, %r9	 ; status,
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	(%rsi), %rdx	 ; variable_20(D)->type,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp131, var
 ; D:/TC/src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
.L99:
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rcx	 ;, _7->global_vars
.L100:
 ; D:/TC/src/tac.c:418: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	jmp	list_append	 ;
.L93:
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _9->attribute_tables,
	call	list_pop_back	 ;
	movq	%rax, %rdi	 ; tmp133, attr_table
 ; D:/TC/src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	%rdi, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _11->attribute_tables,
	call	list_append	 ;
 ; D:/TC/src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rsi), %rbp	 ; variable_20(D)->type, _13
	movq	8(%rsi), %r12	 ; variable_20(D)->name, _14
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rbp, %rdx	 ; _13,
	movq	%r12, %rcx	 ; _14,
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rsi	 ; tmp134, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:198:     attr->type = type;
	movq	%rbp, 8(%rsi)	 ; _13, attr_34->type
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%rbp, %rcx	 ; _13,
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%rsi)	 ; tmp135, attr_34->var
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rdi), %rax	 ; attr_table_29->size, attr_table_29->size
	movq	%rax, 16(%rsi)	 ; attr_table_29->size, attr_34->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%rdi), %rcx	 ; attr_table_29->attributes, _40
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rdi)	 ; tmp136, attr_table_29->size
 ; D:/TC/src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _40
	jne	.L100	 ;,
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	leaq	.LC5(%rip), %rcx	 ;, tmp125
	movq	24(%rax), %rdx	 ; _41->_stderr, _41->_stderr
 ; D:/TC/src/tac.c:418: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fputs	 ;
.L95:
	movl	%r8d, 44(%rsp)	 ; type, %sfp
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movl	44(%rsp), %r8d	 ; %sfp, type
	leaq	.LC6(%rip), %rdx	 ;, tmp127
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
 ; D:/TC/src/tac.c:418: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	jmp	fprintf	 ;
.L101:
 ; D:/TC/src/tac.c:418: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC7:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
.LC8:
	.ascii "[warning] Failed to generate variable access for base\12\0"
.LC9:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
.LC10:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
.LC11:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC12:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC13:
	.ascii "arr\0"
.LC14:
	.ascii "[warning] Failed to generate variable access for index\12\0"
.LC15:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC16:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp250, variable_access
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp251, status
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rcx)	 ;, variable_access_109(D)->type
	jne	.L103	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_109(D)->content.name, _2
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L103	 ;,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, tmp294
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, pretmp_8
	movq	%rsi, %r9	 ; status,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	decl	%eax	 ; tmp193
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, tmp193
	jbe	.L104	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rdx	 ; tmp252, _6
	jmp	.L135	 ;
.L104:
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$102, %r8d	 ;,
	jmp	.L136	 ;
.L103:
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rcx	 ; variable_access_109(D)->base, _10
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _10
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	leaq	.LC7(%rip), %rcx	 ;, tmp196
	movq	24(%rax), %rdx	 ; _11->_stderr, _11->_stderr
	jmp	.L129	 ;
.L105:
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
	call	tac_variable_access	 ;
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rcx	 ; tmp255, _13
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rbx	 ; tmp256, base
 ; D:/TC/src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	jne	.L107	 ;,
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	leaq	.LC8(%rip), %rcx	 ;, tmp198
	movq	24(%rax), %rdx	 ; _14->_stderr, _14->_stderr
.L129:
	call	fputs	 ;
 ; D:/TC/src/tac.c:762:         return NULL;
	jmp	.L134	 ;
.L107:
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %r8d	 ; variable_access_109(D)->type, _16
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %r8d	 ;, _16
	jne	.L109	 ;,
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	 ; base_119->type, _17
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _17->kind, _18
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp199
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp199
	ja	.L110	 ;,
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %r8	 ; _17->name, _20
	movq	%r8, 32(%rsp)	 ; _20, %sfp
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	32(%rsp), %r8	 ; %sfp, _20
	leaq	.LC9(%rip), %rdx	 ;, tmp201
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	jmp	.L130	 ;
.L110:
 ; D:/TC/src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _17->ast_node.scope, scope
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _18
	jne	.L111	 ;,
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_169].class_scope, scope
.L111:
 ; D:/TC/src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	 ; variable_access_109(D)->content.attr_name, variable_access_109(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _23->name, _23->name
	call	search_name_use_strcmp	 ;
	movq	%rax, %rcx	 ; tmp259, attr
 ; D:/TC/src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	jne	.L112	 ;,
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbx), %rax	 ; base_119->type, base_119->type
	movq	8(%rax), %r9	 ; _25->name, _26
	movq	8(%rbp), %rax	 ; variable_access_109(D)->content.attr_name, variable_access_109(D)->content.attr_name
	movq	8(%rax), %r8	 ; _27->name, _28
	movq	%r9, 40(%rsp)	 ; _26, %sfp
	movq	%r8, 32(%rsp)	 ; _28, %sfp
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	40(%rsp), %r9	 ; %sfp, _26
	movq	32(%rsp), %r8	 ; %sfp, _28
	leaq	.LC10(%rip), %rdx	 ;, tmp207
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	jmp	.L131	 ;
.L112:
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %eax	 ; attr_172->kind, _31
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rax), %edx	 ;, tmp208
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %edx	 ;, tmp208
	ja	.L113	 ;,
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; attr_172->type,
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L136:
	call	create_var	 ;
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp261, _34
.L135:
 ; D:/TC/src/tac.c:845: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	create_arg	 ;
.L113:
 ; D:/TC/src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _31
	je	.L114	 ;,
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbx), %rax	 ; base_119->type, base_119->type
	movq	8(%rax), %r9	 ; _35->name, _36
	movq	8(%rbp), %rax	 ; variable_access_109(D)->content.attr_name, variable_access_109(D)->content.attr_name
	movq	8(%rax), %r8	 ; _37->name, _38
	movq	%r9, 40(%rsp)	 ; _36, %sfp
	movq	%r8, 32(%rsp)	 ; _38, %sfp
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	40(%rsp), %r9	 ; %sfp, _36
	movq	32(%rsp), %r8	 ; %sfp, _38
	leaq	.LC11(%rip), %rdx	 ;, tmp212
	movq	24(%rax), %rcx	 ; _39->_stderr, _39->_stderr
.L131:
	call	fprintf	 ;
 ; D:/TC/src/tac.c:784:             return NULL;
	jmp	.L134	 ;
.L114:
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rcx), %rdx	 ; attr_172->type,
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp263, _42
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %rcx	 ; variable_access_109(D)->content.attr_name, _43
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rsi, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp264, <retval>
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _43->type,
	call	create_var	 ;
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rdx	 ; tmp265, _45
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r8	 ; base,
	movq	%rdi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r9	 ;, tmp266
	jmp	.L137	 ;
.L109:
 ; D:/TC/src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %r8d	 ;, _16
	jne	.L115	 ;,
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rax), %rax	 ; base_119->type, _49
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rdi	 ; _49->name, pretmp_195
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	 ; _49->kind, _49->kind
	subl	$3, %eax	 ;, tmp215
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	 ;, tmp215
	ja	.L132	 ;,
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC13(%rip), %rdx	 ;, tmp220
	movq	%rdi, %rcx	 ; pretmp_195,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp269
	je	.L117	 ;,
.L132:
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	%rdi, %r8	 ; pretmp_195,
	leaq	.LC12(%rip), %rdx	 ;, tmp222
	movq	24(%rax), %rcx	 ;, _57->_stderr
.L130:
	call	fprintf	 ;
 ; D:/TC/src/tac.c:801:             return NULL;
	jmp	.L134	 ;
.L117:
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rcx	 ; variable_access_109(D)->content.index, variable_access_109(D)->content.index
	movq	%rsi, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rcx	 ; tmp271, _60
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp272, index
 ; D:/TC/src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	jne	.L118	 ;,
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	leaq	.LC14(%rip), %rcx	 ;, tmp225
	movq	24(%rax), %rdx	 ; _61->_stderr, _61->_stderr
	jmp	.L129	 ;
.L118:
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%rbx), %rax	 ; base_119->type, base_119->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; _63->type,
	call	create_var	 ;
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp274, _65
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rbp, %r9	 ; index,
	movq	%rbx, %r8	 ; base,
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp275, <retval>
 ; D:/TC/src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rdx	 ; <retval>,
.L137:
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rdx	 ; tmp276, inst
	jmp	.L133	 ;
.L115:
 ; D:/TC/src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %r8d	 ;, _16
	jne	.L119	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 16(%rax)	 ;, base_119->kind
	jne	.L120	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_119->type, _69
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	 ;, _69->kind
	jne	.L120	 ;,
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rcx	 ; _69->name, _69->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp229
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp277, _73
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rbx), %rax	 ; base_119->type, base_119->type
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _74->ast_node.class, _74->ast_node.class
	movq	16(%rax), %rcx	 ; _75->class_scope, _75->class_scope
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rsi, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_124->type,
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp278, attr
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp279, _78
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp280, base
.L120:
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	movl	16(%rbx), %r8d	 ; base_100->kind, _79
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %r8d	 ;, _79
	movl	%r8d, 40(%rsp)	 ; _79, %sfp
	je	.L121	 ;,
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rbx), %rax	 ; base_100->type, base_100->type
	movq	8(%rax), %r9	 ; _80->name, _81
	movq	%r9, 32(%rsp)	 ; _81, %sfp
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	32(%rsp), %r9	 ; %sfp, _81
	movl	40(%rsp), %r8d	 ; %sfp, _79
	leaq	.LC15(%rip), %rdx	 ;, tmp236
	movq	24(%rax), %rcx	 ; _82->_stderr, _82->_stderr
	call	fprintf	 ;
.L134:
 ; D:/TC/src/tac.c:823:             return NULL;
	xorl	%edi, %edi	 ; <retval>
	jmp	.L102	 ;
.L121:
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rcx	 ; variable_access_109(D)->content.args, variable_access_109(D)->content.args
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	leaq	56(%rsp), %rbp	 ;, tmp249
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp282, args
 ; D:/TC/src/tac.c:827:         long long arg_count = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 48(%rsp)	 ;, arg_count
.L123:
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rdi, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp287, arg_expr
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L138	 ;,
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rsi, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_141->type, arg_141->type
	movq	%rax, 32(%rsp)	 ; arg, %sfp
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	%rbp, %rdx	 ; tmp249,
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 56(%rsp)	 ; tmp284, size
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	call	create_arg	 ;
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	32(%rsp), %r8	 ; %sfp, arg
	xorl	%r9d, %r9d	 ;
	movl	$17, %ecx	 ;,
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	%rax, %rdx	 ; tmp285, _88
 ; D:/TC/src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp286, inst
 ; D:/TC/src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_110(D)->current_block, status_110(D)->current_block
	movq	8(%rax), %rcx	 ; _89->instructions, _89->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:833:             arg_count++;
	incq	48(%rsp)	 ; arg_count
	jmp	.L123	 ;
.L138:
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rbx), %rdx	 ; base_100->type, base_100->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp288, _94
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	leaq	48(%rsp), %rdx	 ;, tmp243
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp289, <retval>
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%rdi, %rdx	 ; <retval>,
	movq	%rbx, %r8	 ; base,
	movl	$22, %ecx	 ;,
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%rax, %r9	 ;, tmp290
 ; D:/TC/src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp291, inst
.L133:
 ; D:/TC/src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_110(D)->current_block, status_110(D)->current_block
	movq	8(%rax), %rcx	 ;, _96->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:839:         return temp;
	jmp	.L102	 ;
.L119:
	movl	%r8d, 32(%rsp)	 ; _16, %sfp
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	32(%rsp), %r8d	 ; %sfp, _16
	leaq	.LC16(%rip), %rdx	 ;, tmp247
	movq	24(%rax), %rcx	 ; _98->_stderr, _98->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:843:         return NULL;
	jmp	.L134	 ;
.L102:
 ; D:/TC/src/tac.c:845: }
	addq	$72, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC18:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
.LC19:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	movl	8(%rcx), %r8d	 ; primary_38(D)->type,
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %r8d	 ;, _1
	ja	.L140	 ;,
	movq	%rdx, %rsi	 ; tmp146, status
	leaq	.L142(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%r8,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L142:
	.long	.L150-.L142
	.long	.L149-.L142
	.long	.L148-.L142
	.long	.L147-.L142
	.long	.L146-.L142
	.long	.L145-.L142
	.long	.L144-.L142
	.long	.L143-.L142
	.long	.L141-.L142
	.text
.L150:
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	movl	$10, %r8d	 ;,
	call	strtoll	 ;
 ; D:/TC/src/tac.c:682:             return create_arg(ARG_INT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp125
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 56(%rsp)	 ; tmp147, MEM[(long long int *)_94]
	jmp	.L159	 ;
.L149:
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:/TC/src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp126
	movl	$2, %ecx	 ;,
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 56(%rsp)	 ; tmp149, MEM[(double *)_94]
.L159:
 ; D:/TC/src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp150, <retval>
	jmp	.L139	 ;
.L148:
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_38(D)->value.literal_value,
 ; D:/TC/src/tac.c:739: }
	addq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %ecx	 ;,
 ; D:/TC/src/tac.c:739: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	 ;
.L147:
 ; D:/TC/src/tac.c:692:             bool t = true;
	movb	$1, 56(%rsp)	 ;, MEM[(char *)_94]
	jmp	.L160	 ;
.L146:
 ; D:/TC/src/tac.c:697:             bool t = false;
	movb	$0, 56(%rsp)	 ;, MEM[(char *)_94]
.L160:
 ; D:/TC/src/tac.c:699:             return create_arg(ARG_BOOL, &t);
	leaq	56(%rsp), %rdx	 ;, tmp128
	movl	$4, %ecx	 ;,
	jmp	.L159	 ;
.L145:
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr,
 ; D:/TC/src/tac.c:739: }
	addq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:739: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	 ;
.L144:
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp153, _9
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp154, operand
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp129
	movq	(%rax), %rdx	 ; name_bool,
	call	create_var	 ;
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp155, _11
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; operand,
	movl	$13, %ecx	 ;,
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp156, <retval>
 ; D:/TC/src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rdx	 ; <retval>,
	jmp	.L157	 ;
.L143:
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp158, _15
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp159, operand
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp160, _17
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp134
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp161, <retval>
 ; D:/TC/src/tac.c:716:             long long zero_int = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 48(%rsp)	 ;, zero_int
 ; D:/TC/src/tac.c:717:             double neg_one_float = -1.0;
	movq	.LC17(%rip), %rax	 ;, tmp169
	movq	%rax, 56(%rsp)	 ; tmp169, MEM[(double *)_94]
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_44->type, _18
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	cmpq	(%rdx), %rax	 ; name_int, _18
	jne	.L152	 ;,
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	48(%rsp), %rdx	 ;, tmp135
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %r8	 ;, tmp162
	jmp	.L157	 ;
.L152:
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp136
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	cmpq	(%rdx), %rax	 ; name_float, _18
	jne	.L154	 ;,
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	56(%rsp), %rdx	 ;, tmp137
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %r8	 ;, tmp164
.L157:
 ; D:/TC/src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp165, inst
 ; D:/TC/src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:729:             return temp;
	jmp	.L139	 ;
.L154:
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %r8	 ; _18->name, _23
	movq	%r8, 40(%rsp)	 ; _23, %sfp
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	40(%rsp), %r8	 ; %sfp, _23
	leaq	.LC18(%rip), %rdx	 ;, tmp139
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	call	fprintf	 ;
	jmp	.L158	 ;
.L141:
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.var,
 ; D:/TC/src/tac.c:739: }
	addq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:739: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	 ;
.L140:
	movl	%r8d, 40(%rsp)	 ; _1, %sfp
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	40(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC19(%rip), %rdx	 ;, tmp143
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
.L158:
 ; D:/TC/src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L139:
 ; D:/TC/src/tac.c:739: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC20:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp129, expression
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp130, status
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	jne	.L162	 ;,
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; D:/TC/src/tac.c:675: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
.L162:
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
 ; D:/TC/src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r12d	 ;, _67
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rcx	 ; tmp131, _4
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp132, <retval>
 ; D:/TC/src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %eax	 ; expression_31(D)->operator,
	cmpl	$18, %eax	 ;, _5
	ja	.L163	 ;,
	leaq	CSWTCH.18(%rip), %rdx	 ;, tmp116
	movzbl	(%rdx,%rax), %r12d	 ; CSWTCH.18[_5], _67
.L163:
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rcx	 ; expression_31(D)->expr_left,
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp133, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp118
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp118
	ja	.L164	 ;,
 ; D:/TC/src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, %r12d	 ;, _67
	je	.L165	 ;,
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp134, _9
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp135, temp
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _67,
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp136
 ; D:/TC/src/tac.c:660:             right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp137, inst
 ; D:/TC/src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L165:
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rsi)	 ;, left_38->kind
	je	.L166	 ;,
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	leaq	.LC20(%rip), %rcx	 ;, tmp124
	movq	24(%rax), %rdx	 ; _14->_stderr, _14->_stderr
	call	fputs	 ;
.L166:
 ; D:/TC/src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %rdx	 ; left,
	movq	%rdi, %r8	 ; <retval>,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%rsi)	 ;, left_38->is_get
 ; D:/TC/src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rdx	 ; tmp139, inst
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	je	.L167	 ;,
 ; D:/TC/src/tac.c:666:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rsi, %rdx	 ; left,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; <retval>,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp140, inst
	jmp	.L167	 ;
.L164:
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp141, _18
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp142, temp
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _67,
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp143
 ; D:/TC/src/tac.c:670:         right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp144, inst
.L167:
 ; D:/TC/src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:675: }
	addq	$32, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp179, if_
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp180, status
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp181, then_label
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rdi), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp182, else_label
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp183
	jne	.L174	 ;,
.L176:
 ; D:/TC/src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp184, end_label
	jmp	.L175	 ;
.L174:
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp185
	je	.L176	 ;,
 ; D:/TC/src/tac.c:469:         end_label = else_label;
	movq	%rsi, %rbp	 ; else_label, end_label
.L175:
 ; D:/TC/src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%rdi), %rcx	 ; if__61(D)->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, 32(%rsp)	 ; tmp186, %sfp
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rax, %r13	 ; tmp187, condition
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _6, %sfp
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _6
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp189
 ; D:/TC/src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp190, inst
 ; D:/TC/src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:478:     Block* then_block = create_block(then_label);
	movq	%r12, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp191, then_block
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r12, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _10->blocks, _10->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:480:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%rdi), %rcx	 ; if__61(D)->body, if__61(D)->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp192, then_statements
.L177:
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp193, statement
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L197	 ;,
 ; D:/TC/src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L177	 ;
.L197:
 ; D:/TC/src/tac.c:487:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp194, jump_to_end
 ; D:/TC/src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%rdi), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp195
	jne	.L179	 ;,
 ; D:/TC/src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%rdi), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp196, elif_list
.L180:
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r13, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp210, elif
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L179	 ;,
 ; D:/TC/src/tac.c:496:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp197, else_if_block
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_if_block,
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:498:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	 ; tmp198, then_label
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%r12), %rcx	 ; elif_90->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp199, else_label
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r13, %rcx	 ; elif_list,
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	%rax, %r15	 ; tmp200, condition
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp201
	je	.L182	 ;,
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	 ; tmp202
	cmovne	%rbp, %rsi	 ; else_label,, end_label, else_label
.L182:
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _24, %sfp
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _24
	movq	%r15, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp204
 ; D:/TC/src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp205, inst
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:509:             then_block = create_block(then_label);
	movq	%r14, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r14	 ; tmp206, then_block
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _28->blocks, _28->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:511:             status->current_block = then_block;
	movq	%r14, 16(%rbx)	 ; then_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rcx	 ; elif_90->body, elif_90->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp207, elif_statements
.L183:
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp208, elif_statement
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	je	.L198	 ;,
 ; D:/TC/src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L183	 ;
.L198:
 ; D:/TC/src/tac.c:518:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp209, jump_to_end
 ; D:/TC/src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _31->instructions, _31->instructions
	call	list_append	 ;
	jmp	.L180	 ;
.L179:
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp211
	jne	.L186	 ;,
 ; D:/TC/src/tac.c:525:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp212, else_block
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_block,
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:527:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%rdi), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp213, else_statements
.L187:
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp214, else_statement
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	je	.L199	 ;,
 ; D:/TC/src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L187	 ;
.L199:
 ; D:/TC/src/tac.c:534:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	movl	$20, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp215, jump_to_end
 ; D:/TC/src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _38->instructions, _38->instructions
	call	list_append	 ;
.L186:
 ; D:/TC/src/tac.c:538:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp216, end_block
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _40->blocks, _40->blocks
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
	.section .rdata,"dr"
.LC21:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
.LC22:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
.LC23:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	movl	8(%rcx), %r8d	 ; statement_32(D)->type,
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %r8d	 ;, _1
	ja	.L201	 ;,
	movq	%rdx, %rbx	 ; tmp141, status
	leaq	.L203(%rip), %rdx	 ;, tmp117
	movq	%rcx, %rsi	 ; tmp140, statement
	movslq	(%rdx,%r8,4), %rax	 ;, tmp119
	addq	%rdx, %rax	 ; tmp117, tmp120
	jmp	*%rax	 ; tmp120
	.section .rdata,"dr"
	.align 4
.L203:
	.long	.L210-.L203
	.long	.L200-.L203
	.long	.L208-.L203
	.long	.L207-.L203
	.long	.L206-.L203
	.long	.L205-.L203
	.long	.L204-.L203
	.long	.L202-.L203
	.text
.L210:
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_32(D)->stmt.expr,
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	jmp	tac_expression	 ;
.L208:
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_32(D)->stmt.if_stmt,
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	 ;
.L207:
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_32(D)->stmt.while_stmt,
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	 ;
.L206:
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_32(D)->stmt.for_stmt,
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	 ;
.L205:
 ; D:/TC/src/tac.c:428:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$5, %ecx	 ;,
	xorl	%edx, %edx	 ;
	call	create_arg	 ;
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_32(D)->stmt.return_expr, _6
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _6
	je	.L211	 ;,
 ; D:/TC/src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
.L211:
 ; D:/TC/src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, %rdx	 ; return_value,
	movl	$21, %ecx	 ;,
	jmp	.L224	 ;
.L204:
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rbx), %rcx	 ; status_33(D)->end_labels, status_33(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp145
	jne	.L212	 ;,
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbx), %rax	 ; status_33(D)->end_labels, status_33(D)->end_labels
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _12->tail, _12->tail
	movq	8(%rax), %rdx	 ; _13->content, label
 ; D:/TC/src/tac.c:437:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L212	 ;,
.L226:
 ; D:/TC/src/tac.c:438:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
.L224:
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp146, inst
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rcx	 ;, _14->instructions
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
.L212:
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	leaq	.LC21(%rip), %rcx	 ;, tmp130
	movq	24(%rax), %rdx	 ; _16->_stderr, _16->_stderr
	jmp	.L225	 ;
.L202:
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rbx), %rcx	 ; status_33(D)->start_labels, status_33(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp148
	jne	.L213	 ;,
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbx), %rax	 ; status_33(D)->start_labels, status_33(D)->start_labels
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _20->tail, _20->tail
	movq	8(%rax), %rdx	 ; _21->content, label
 ; D:/TC/src/tac.c:448:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	jne	.L226	 ;,
.L213:
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	leaq	.LC22(%rip), %rcx	 ;, tmp137
	movq	24(%rax), %rdx	 ; _24->_stderr, _24->_stderr
.L225:
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	jmp	fputs	 ;
.L201:
	movl	%r8d, 44(%rsp)	 ; _1, %sfp
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	44(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC23(%rip), %rdx	 ;, tmp139
	movq	24(%rax), %rcx	 ; _26->_stderr, _26->_stderr
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	jmp	fprintf	 ;
.L200:
 ; D:/TC/src/tac.c:461: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r14	 ;
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp170, for_
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp171, status
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp172, condition_label
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp173, body_label
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, for__51(D)->condition
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp174, end_label
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	je	.L228	 ;,
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp175, _2
 ; D:/TC/src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp176, inst
 ; D:/TC/src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _3->instructions, _3->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:556:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp177, condition_block
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%r13, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _5->blocks, _5->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:558:         status->current_block = condition_block;
	movq	%r13, 16(%rbx)	 ; condition_block, status_52(D)->current_block
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%rsi), %rcx	 ; for__51(D)->condition, for__51(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	%rax, %r13	 ; tmp178, condition
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 40(%rsp)	 ; _8, %sfp
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	40(%rsp), %r9	 ; %sfp, _8
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp180
	jmp	.L238	 ;
.L228:
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp182, _12
.L238:
 ; D:/TC/src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp183, inst
 ; D:/TC/src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ;, _13->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:569:     Block* body_block = create_block(body_label);
	movq	%rdi, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp184, body_block
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%r13, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _15->blocks, _15->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:571:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; body_block, status_52(D)->current_block
 ; D:/TC/src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%rsi)	 ;, for__51(D)->increment
 ; D:/TC/src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp185, increment_label
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	jne	.L239	 ;,
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rsi)	 ;, for__51(D)->condition
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	jne	.L239	 ;,
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rdi, %rdx	 ; body_label,
.L239:
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_52(D)->start_labels, status_52(D)->start_labels
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rdx	 ; tmp188, _23
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_52(D)->end_labels, status_52(D)->end_labels
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp189, _25
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; for__51(D)->body, for__51(D)->body
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp190, body_statements
.L233:
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r14, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp191, statement
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L240	 ;,
 ; D:/TC/src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L233	 ;
.L240:
 ; D:/TC/src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_52(D)->start_labels, status_52(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_52(D)->end_labels, status_52(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, for__51(D)->increment
	je	.L235	 ;,
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r13, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp192, _31
 ; D:/TC/src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp193, inst
 ; D:/TC/src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _32->instructions, _32->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:591:         Block* increment_block = create_block(increment_label);
	movq	%r13, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp194, increment_block
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%r13, %rdx	 ; increment_block,
	movq	32(%rax), %rcx	 ; _34->blocks, _34->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:593:         status->current_block = increment_block;
	movq	%r13, 16(%rbx)	 ; increment_block, status_52(D)->current_block
 ; D:/TC/src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%rsi), %rcx	 ; for__51(D)->increment, for__51(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
.L235:
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp195, _37
 ; D:/TC/src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%rsi)	 ;, for__51(D)->condition
	jne	.L236	 ;,
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp197, _39
 ; D:/TC/src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
.L236:
 ; D:/TC/src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rdx	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rdx), %rcx	 ; _40->instructions, _40->instructions
	movq	%rax, %rdx	 ; inst,
	call	list_append	 ;
 ; D:/TC/src/tac.c:602:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp199, end_block
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _42->blocks, _42->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:604:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_52(D)->current_block
 ; D:/TC/src/tac.c:606: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r13	 ;
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp137, while_
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp138, status
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %ecx	 ;,
	movq	%rax, %rdx	 ; condition_label,
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp139, condition_label
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	 ;
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp140, _1
 ; D:/TC/src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp141, inst
 ; D:/TC/src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:613:     Block* condition_block = create_block(condition_label);
	movq	%rsi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp142, condition_block
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%rdi, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:615:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; condition_block, status_27(D)->current_block
 ; D:/TC/src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	xorl	%edx, %edx	 ;
	movl	$98, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp143, body_label
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	0(%rbp), %rcx	 ; while__42(D)->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp144, end_label
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	%rax, %r13	 ; tmp145, condition
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 40(%rsp)	 ; _7, %sfp
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	40(%rsp), %r9	 ; %sfp, _7
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp147
 ; D:/TC/src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp148, inst
 ; D:/TC/src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:623:     Block* body_block = create_block(body_label);
	movq	%r12, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp149, body_block
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%r12, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:625:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; body_block, status_27(D)->current_block
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rdx	 ; tmp150, _13
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp151, _15
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rcx	 ; while__42(D)->body, while__42(D)->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp152, body_statements
.L242:
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp153, statement
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L245	 ;,
 ; D:/TC/src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L242	 ;
.L245:
 ; D:/TC/src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp154, _20
 ; D:/TC/src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:/TC/src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:639:     Block* end_block = create_block(end_label);
	movq	%rdi, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp156, end_block
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _23->blocks, _23->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:641:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_27(D)->current_block
 ; D:/TC/src/tac.c:643: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp110, function
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp111, status
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rcx), %rdx	 ; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rcx), %rcx	 ; function_16(D)->name,
	call	create_subroutine	 ;
 ; D:/TC/src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %rdi	 ; tmp112, subroutine
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	%rdi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rsi), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp113, parameters
.L247:
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L252	 ;,
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	(%rax), %rdx	 ; parameter_25->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rdi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp114, _8
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L247	 ;
.L252:
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp116, _10
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rdi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rbp	 ; tmp117, block
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:329:     status->current_block = block;
	movq	%rbp, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:/TC/src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rsi), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp118, statements
.L249:
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp119, statement
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L253	 ;,
 ; D:/TC/src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L249	 ;
.L253:
 ; D:/TC/src/tac.c:336:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, status_19(D)->current_subroutine
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
	movq	%rcx, %rsi	 ; tmp139, method
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp140, status
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rcx), %rdx	 ; method_33(D)->return_type, method_33(D)->return_type
	movq	(%rcx), %rcx	 ; method_33(D)->name,
	call	create_subroutine	 ;
 ; D:/TC/src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_36(D)->current_subroutine
 ; D:/TC/src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %rdi	 ; tmp141, subroutine
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_36(D)->tac, status_36(D)->tac
	movq	%rdi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rsi), %rcx	 ; method_33(D)->parameters, method_33(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp142, parameters
.L255:
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L261	 ;,
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_42->name, parameter_42->name
	movq	(%rax), %rdx	 ; parameter_42->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rdi), %rcx	 ; subroutine_35->parameters, subroutine_35->parameters
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp143, _8
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L255	 ;
.L261:
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp145, _10
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rdi), %rcx	 ; subroutine_35->blocks, subroutine_35->blocks
	movq	%rax, %rdx	 ; block,
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rbp	 ; tmp146, block
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_36(D)->current_class, status_36(D)->current_class
 ; D:/TC/src/tac.c:353:     status->current_block = block;
	movq	%rbp, 16(%rbx)	 ; block, status_36(D)->current_block
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _13->name, _13->name
	movq	8(%rax), %rcx	 ; _14->name, _14->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp126
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp147, _16
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rsi), %rax	 ; method_33(D)->name, method_33(D)->name
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _17->name, _17->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp148
	jne	.L257	 ;,
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	 ; status_36(D)->current_class, status_36(D)->current_class
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; _20->name,
	call	create_var	 ;
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp149, _22
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp150, temp
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	 ; status_36(D)->current_class, tmp156
	leaq	24(%rax), %rdx	 ;, tmp135
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rdi, %rdx	 ; temp,
	movl	$18, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %r8	 ;, tmp151
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rbp), %rcx	 ; block_45->instructions, block_45->instructions
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp152, _26
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
.L257:
 ; D:/TC/src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rsi), %rcx	 ; method_33(D)->body, method_33(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp153, statements
.L258:
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp154, statement
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L262	 ;,
 ; D:/TC/src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L258	 ;
.L262:
 ; D:/TC/src/tac.c:364:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, status_36(D)->current_subroutine
 ; D:/TC/src/tac.c:366: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC24:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp104, class
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp105, status
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:369:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_14(D)->current_class
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_15(D)->members, class_15(D)->members
	call	list_copy	 ;
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rdi), %r12	 ; class_15(D)->name, _2
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rbp	 ; tmp106, members
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp107, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	%r12, 8(%rsi)	 ; _2, table_30->name
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rsi, %rdx	 ; table,
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rsi)	 ; tmp108, table_30->attributes
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	24(%rdi), %rax	 ; class_15(D)->size, class_15(D)->size
	movq	%rax, 16(%rsi)	 ; class_15(D)->size, table_30->size
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_14(D)->tac, status_14(D)->tac
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC24(%rip), %rsi	 ;, tmp103
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rcx	 ; _4->attribute_tables,
	call	list_append	 ;
.L264:
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbp, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L272	 ;,
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %r8d	 ; member_24->type, _6
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	testl	%r8d, %r8d	 ; _6
	je	.L265	 ;,
	cmpl	$1, %r8d	 ;, _6
	jne	.L273	 ;,
 ; D:/TC/src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_24->content.variable,
	movl	$97, %r8d	 ;,
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:383:                 break;
	jmp	.L264	 ;
.L265:
 ; D:/TC/src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_24->content.method,
	movq	%rbx, %rdx	 ; status,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:380:                 break;
	jmp	.L264	 ;
.L273:
	movl	%r8d, 44(%rsp)	 ; _6, %sfp
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	44(%rsp), %r8d	 ; %sfp, _6
	movq	%rsi, %rdx	 ; tmp103,
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:386:                 break;
	jmp	.L264	 ;
.L272:
 ; D:/TC/src/tac.c:389:     status->current_class = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 24(%rbx)	 ;, status_14(D)->current_class
 ; D:/TC/src/tac.c:391: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC25:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%r12	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC25(%rip), %r12	 ;, tmp108
 ; D:/TC/src/tac.c:283: TAC* tac_code(Code* code) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp109, code
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:283: TAC* tac_code(Code* code) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp110, <retval>
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	movq	%rax, (%rsi)	 ; tmp111, tac_29->attribute_tables
 ; D:/TC/src/tac.c:63:     tac->entry_point = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rsi)	 ;, tac_29->entry_point
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	movq	%rax, 16(%rsi)	 ; tmp112, tac_29->global_vars
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %ecx	 ;,
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	movq	%rax, 24(%rsi)	 ; tmp113, tac_29->subroutines
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:74:     status->current_block = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, 8(%rax)	 ;, status_26->current_subroutine
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rbx	 ; tmp114, status
 ; D:/TC/src/tac.c:74:     status->current_block = NULL;
	movq	%rdx, 16(%rax)	 ;, status_26->current_block
 ; D:/TC/src/tac.c:72:     status->tac = tac;
	movq	%rsi, (%rax)	 ; <retval>, status_26->tac
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	movq	%rax, 32(%rbx)	 ; tmp115, status_26->end_labels
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:80:     status->temp_count = 0;
	xorl	%ecx, %ecx	 ;
	movq	%rcx, 48(%rbx)	 ;, status_26->attr_count
	movq	%rcx, 56(%rbx)	 ;, status_26->param_count
	movq	%rcx, 64(%rbx)	 ;, status_26->var_count
 ; D:/TC/src/tac.c:82:     status->subroutine_count = 0;
	movq	%rcx, 72(%rbx)	 ;, status_26->temp_count
	movq	%rcx, 80(%rbx)	 ;, status_26->block_count
	movq	%rcx, 88(%rbx)	 ;, status_26->subroutine_count
 ; D:/TC/src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rcx	 ; code_17(D)->members,
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rbx)	 ; tmp116, status_26->start_labels
 ; D:/TC/src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp117, members
.L275:
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rbp, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp119, code_member
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L283	 ;,
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rdi), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	jne	.L276	 ;,
 ; D:/TC/src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.function,
	movq	%rbx, %rdx	 ; status,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rdi), %rax	 ; code_member_21->content.function, code_member_21->content.function
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r12, %rdx	 ; tmp108,
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rdi	 ; _4->name, _5
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rdi), %rcx	 ; _5->name, _5->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp118
	jne	.L275	 ;,
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rdi, 8(%rsi)	 ; _5, tac_29->entry_point
	jmp	.L275	 ;
.L276:
 ; D:/TC/src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	jne	.L279	 ;,
 ; D:/TC/src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.class,
	movq	%rbx, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L275	 ;
.L279:
 ; D:/TC/src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L275	 ;,
 ; D:/TC/src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.import,
	movq	%rbx, %r8	 ; status,
	movq	%rsi, %rdx	 ; <retval>,
	call	tac_import	 ;
	jmp	.L275	 ;
.L283:
 ; D:/TC/src/tac.c:302: }
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
CSWTCH.18:
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
.LC17:
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
	.def	fputs;	.scl	2;	.type	32;	.endef
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
