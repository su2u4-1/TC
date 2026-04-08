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
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:212: static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp89, arg1
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp90, arg2
	pushq	%rbx	 ;
	movq	%r9, %rbx	 ; tmp91, arg3
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
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
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:222: static Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp116, value
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	%esi, 16(%rax)	 ; kind, arg_16->kind
 ; D:/TC/src/tac.c:227:     switch (kind) {
	decl	%esi	 ;
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	%rcx, 8(%rax)	 ;, arg_16->type
 ; D:/TC/src/tac.c:227:     switch (kind) {
	cmpl	$7, %esi	 ;, tmp95
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
	.long	.L9-.L10
	.text
.L16:
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	 ; MEM[(long long int *)value_20(D)], _2
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	 ; _2, arg_16->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp103
	jmp	.L20	 ;
.L15:
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	 ; MEM[(double *)value_20(D)], _4
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp105
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	 ; _4, arg_16->value.float_value
	jmp	.L20	 ;
.L14:
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movq	%rbx, (%rax)	 ; value, arg_16->value.string_value
 ; D:/TC/src/tac.c:242:             arg->type = name_string;
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp107
	jmp	.L20	 ;
.L13:
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	(%rbx), %dl	 ; MEM[(char *)value_20(D)], _7
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	%dl, (%rax)	 ; _7, arg_16->value.bool_value
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp109
	jmp	.L20	 ;
.L12:
 ; D:/TC/src/tac.c:249:             arg->value.string_value = NULL;
	xorl	%edx, %edx	 ;
	movq	%rdx, (%rax)	 ;, arg_16->value.string_value
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp111
.L20:
	movq	(%rdx), %rdx	 ;, name_void
	jmp	.L19	 ;
.L11:
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	 ; value, arg_16->value.label
 ; D:/TC/src/tac.c:254:             break;
	jmp	.L17	 ;
.L9:
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	 ; value,* <retval>
 ; D:/TC/src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	 ; MEM[(struct Var *)value_20(D)].type, MEM[(struct Var *)value_20(D)].type
.L19:
	movq	%rdx, 8(%rax)	 ; MEM[(struct Var *)value_20(D)].type, arg_16->type
.L17:
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_16->is_get
 ; D:/TC/src/tac.c:268: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
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
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %r8	 ; type_14(D)->name, _8
	movq	%r8, 40(%rsp)	 ; _8, %sfp
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
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
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L78	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_3(D)->is_get
	je	.L78	 ;,
	movq	%rdx, %rdi	 ; tmp97, status
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_3(D)->type, arg_3(D)->type
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %r9	 ; status,
	call	create_var	 ;
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp98, _10
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %r8	 ; arg,
	xorl	%r9d, %r9d	 ;
	movl	$23, %ecx	 ;,
	movq	%rax, %rdx	 ; temp,
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp99, temp
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rsi, %rbx	 ; temp, arg
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rdx	 ; tmp100, _12
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
.L78:
 ; D:/TC/src/tac.c:283: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC4:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
.LC5:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
.LC6:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
.LC7:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
.LC8:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
.LC9:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC10:
	.ascii "arr\0"
.LC11:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
.LC12:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
.LC13:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
.LC14:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp301, variable_access
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp302, status
	subq	$80, %rsp	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rcx)	 ;, variable_access_141(D)->type
	jne	.L84	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_141(D)->content.name, _2
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L84	 ;,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, _3
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp226
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp226
	ja	.L85	 ;,
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type,
	movl	$102, %r8d	 ;,
	jmp	.L125	 ;
.L85:
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movl	$118, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _3
	je	.L126	 ;,
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type,
.L126:
	call	create_var	 ;
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rdx	 ; tmp305, _10
	jmp	.L124	 ;
.L84:
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rcx	 ; variable_access_141(D)->base, _11
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _11
	jne	.L87	 ;,
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	leaq	.LC4(%rip), %rcx	 ;, tmp228
	movq	24(%rax), %rdx	 ; _12->_stderr, _12->_stderr
	jmp	.L119	 ;
.L87:
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_variable_access	 ;
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rcx	 ; tmp307, _14
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rsi	 ; tmp308, base
 ; D:/TC/src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	jne	.L89	 ;,
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	leaq	.LC5(%rip), %rcx	 ;, tmp230
	movq	24(%rax), %rdx	 ; _15->_stderr, _15->_stderr
.L119:
	call	fputs	 ;
 ; D:/TC/src/tac.c:769:         return NULL;
	jmp	.L123	 ;
.L89:
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %r8d	 ; variable_access_141(D)->type, _17
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %r8d	 ;, _17
	jne	.L91	 ;,
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	 ; base_154->type, _18
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _18->kind, _19
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp231
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp231
	ja	.L92	 ;,
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %r8	 ; _18->name, _21
	movq	%r8, 48(%rsp)	 ; _21, %sfp
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	48(%rsp), %r8	 ; %sfp, _21
	leaq	.LC6(%rip), %rdx	 ;, tmp233
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	jmp	.L120	 ;
.L92:
 ; D:/TC/src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _18->ast_node.scope, scope
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _19
	jne	.L93	 ;,
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_219].class_scope, scope
.L93:
 ; D:/TC/src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	 ; variable_access_141(D)->content.attr_name, variable_access_141(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _24->name, _24->name
	call	search_name_use_strcmp	 ;
	movq	%rax, %rdi	 ; tmp311, attr
 ; D:/TC/src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	jne	.L94	 ;,
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; base_154->type, base_154->type
	movq	8(%rax), %r9	 ; _26->name, _27
	movq	8(%rbp), %rax	 ; variable_access_141(D)->content.attr_name, variable_access_141(D)->content.attr_name
	movq	8(%rax), %r8	 ; _28->name, _29
	movq	%r9, 56(%rsp)	 ; _27, %sfp
	movq	%r8, 48(%rsp)	 ; _29, %sfp
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	56(%rsp), %r9	 ; %sfp, _27
	movq	48(%rsp), %r8	 ; %sfp, _29
	leaq	.LC7(%rip), %rdx	 ;, tmp239
	movq	24(%rax), %rcx	 ; _30->_stderr, _30->_stderr
	jmp	.L121	 ;
.L94:
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	 ; attr_222->kind, _32
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _32
	jne	.L95	 ;,
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; base_154->type, base_154->type
	movq	8(%rax), %r9	 ; _33->name, _34
	movq	8(%rbp), %rax	 ; variable_access_141(D)->content.attr_name, variable_access_141(D)->content.attr_name
	movq	8(%rax), %r8	 ; _35->name, _36
	movq	%r9, 56(%rsp)	 ; _34, %sfp
	movq	%r8, 48(%rsp)	 ; _36, %sfp
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	56(%rsp), %r9	 ; %sfp, _34
	movq	48(%rsp), %r8	 ; %sfp, _36
	leaq	.LC8(%rip), %rdx	 ;, tmp243
	movq	24(%rax), %rcx	 ; _37->_stderr, _37->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_222->type,
	movq	%rbx, %r9	 ; status,
	movq	%rdi, %rcx	 ; attr,
	movl	$102, %r8d	 ;,
.L125:
	call	create_var	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %ecx	 ;,
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp314, _40
	jmp	.L124	 ;
.L95:
 ; D:/TC/src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _32
	jne	.L96	 ;,
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_222->type,
	movq	%rdi, %rcx	 ; attr,
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp315, _42
.L124:
 ; D:/TC/src/tac.c:862: }
	addq	$80, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	create_arg	 ;
.L96:
 ; D:/TC/src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _32
	je	.L97	 ;,
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; base_154->type, base_154->type
	movq	8(%rax), %r9	 ; _43->name, _44
	movq	8(%rbp), %rax	 ; variable_access_141(D)->content.attr_name, variable_access_141(D)->content.attr_name
	movq	8(%rax), %r8	 ; _45->name, _46
	movq	%r9, 56(%rsp)	 ; _44, %sfp
	movq	%r8, 48(%rsp)	 ; _46, %sfp
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	56(%rsp), %r9	 ; %sfp, _44
	movq	48(%rsp), %r8	 ; %sfp, _46
	leaq	.LC9(%rip), %rdx	 ;, tmp247
	movq	24(%rax), %rcx	 ; _47->_stderr, _47->_stderr
.L121:
	call	fprintf	 ;
 ; D:/TC/src/tac.c:795:             return NULL;
	jmp	.L123	 ;
.L97:
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rdi), %rdx	 ; attr_222->type,
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp317, _50
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %rcx	 ; variable_access_141(D)->content.attr_name, _51
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp318, <retval>
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _51->type,
	call	create_var	 ;
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rdx	 ; tmp319, _53
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rsi, %r8	 ; base,
	movq	%rdi, %rdx	 ; <retval>,
	movl	$15, %ecx	 ;,
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r9	 ;, tmp320
	jmp	.L127	 ;
.L91:
 ; D:/TC/src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %r8d	 ;, _17
	jne	.L98	 ;,
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	 ; base_154->type, base_154->type
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC10(%rip), %rdx	 ;, tmp255
	movq	8(%rax), %rcx	 ; _57->name, _57->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp322
	je	.L99	 ;,
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rsi), %rax	 ; base_154->value.variable, base_154->value.variable
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	 ; _60->original_name, _60->original_name
	movq	8(%rax), %r8	 ; _61->name, _62
	movq	%r8, 48(%rsp)	 ; _62, %sfp
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	48(%rsp), %r8	 ; %sfp, _62
	leaq	.LC11(%rip), %rdx	 ;, tmp259
	movq	24(%rax), %rcx	 ; _63->_stderr, _63->_stderr
.L120:
	call	fprintf	 ;
 ; D:/TC/src/tac.c:808:             return NULL;
	jmp	.L123	 ;
.L99:
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rcx	 ; variable_access_141(D)->content.index, variable_access_141(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rcx	 ; tmp324, _66
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rbp	 ; tmp325, index
 ; D:/TC/src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	jne	.L100	 ;,
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	leaq	.LC12(%rip), %rcx	 ;, tmp262
	movq	24(%rax), %rdx	 ; _67->_stderr, _67->_stderr
	jmp	.L119	 ;
.L100:
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	.refptr.name_int(%rip), %rax	 ;, tmp263
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; name_int,
	call	create_var	 ;
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp327, _70
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rbp, %r9	 ; index,
	movq	%rsi, %r8	 ; base,
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp328, <retval>
 ; D:/TC/src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rdx	 ; <retval>,
.L127:
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rdx	 ; tmp329, inst
	jmp	.L122	 ;
.L98:
 ; D:/TC/src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %r8d	 ;, _17
	jne	.L101	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 16(%rax)	 ;, base_154->kind
	jne	.L102	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_154->type, _74
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	 ;, _74->kind
	jne	.L102	 ;,
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rcx	 ; _74->name, _74->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp266
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp330, _78
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rsi), %rax	 ; base_154->type, base_154->type
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _79->ast_node.class, _79->ast_node.class
	movq	16(%rax), %rcx	 ; _80->class_scope, _80->class_scope
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_159->type,
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp331, attr
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %ecx	 ;,
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp332, _83
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_arg	 ;
	movq	%rax, %rsi	 ; tmp333, base
.L102:
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movl	16(%rsi), %r8d	 ; base_130->kind, _84
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%r8), %eax	 ;, tmp271
	movl	%r8d, 56(%rsp)	 ; _84, %sfp
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	 ;, tmp271
	jbe	.L103	 ;,
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rsi), %rax	 ; base_130->type, base_130->type
	movq	8(%rax), %r9	 ; _86->name, _87
	movq	%r9, 48(%rsp)	 ; _87, %sfp
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	48(%rsp), %r9	 ; %sfp, _87
	movl	56(%rsp), %r8d	 ; %sfp, _84
	leaq	.LC13(%rip), %rdx	 ;, tmp274
	movq	24(%rax), %rcx	 ; _88->_stderr, _88->_stderr
	call	fprintf	 ;
.L123:
 ; D:/TC/src/tac.c:832:             return NULL;
	xorl	%edi, %edi	 ; <retval>
	jmp	.L83	 ;
.L103:
 ; D:/TC/src/tac.c:834:         long long arg_count = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 64(%rsp)	 ;, arg_count
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%rsi)	 ;, base_130->kind
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	movq	%rax, %rdi	 ; tmp335, arguments
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	jne	.L106	 ;,
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rsi), %rax	 ; base_130->type, base_130->type
	movq	8(%rax), %rcx	 ; _92->name, _92->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp275
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp336, _94
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rsi), %rax	 ; base_130->value.subroutine, base_130->value.subroutine
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _95->original_name, _95->original_name
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rcx	 ; _96->name, _96->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; tmp337
	je	.L106	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	0(%rbp), %rax	 ; variable_access_141(D)->base, variable_access_141(D)->base
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$8, %ecx	 ;,
	movq	(%rax), %rax	 ; _99->base, _99->base
	movq	%rax, 32(%rsp)	 ; _99->base,
	call	create_primary	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %r8	 ;, tmp338
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	create_expression	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rcx	 ; tmp339, _102
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rcx	 ; tmp340, _103
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%rax), %rcx	 ; self_171->type, self_171->type
	movq	%rax, 48(%rsp)	 ; self, %sfp
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	72(%rsp), %rdx	 ;, tmp287
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 72(%rsp)	 ; tmp342, MEM[(long long int *)_7]
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	48(%rsp), %r8	 ; %sfp, self
	xorl	%r9d, %r9d	 ;
	movl	$17, %ecx	 ;,
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rax, %rdx	 ; tmp343, _107
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rdi, %rcx	 ; arguments,
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rax, %rdx	 ; tmp344, _108
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	list_append	 ;
 ; D:/TC/src/tac.c:840:             arg_count++;
	incq	64(%rsp)	 ; arg_count
.L106:
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rcx	 ; variable_access_141(D)->content.args, variable_access_141(D)->content.args
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	72(%rsp), %r12	 ;, tmp300
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp345, args
.L108:
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbp, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp351, arg_expr
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L110	 ;,
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rax, %rcx	 ; tmp346, _112
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_194->type, arg_194->type
	movq	%rax, 48(%rsp)	 ; arg, %sfp
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r12, %rdx	 ; tmp300,
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 72(%rsp)	 ; tmp348, MEM[(long long int *)_7]
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	48(%rsp), %r8	 ; %sfp, arg
	xorl	%r9d, %r9d	 ;
	movl	$17, %ecx	 ;,
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rax, %rdx	 ; tmp349, _116
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rdi, %rcx	 ; arguments,
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rax, %rdx	 ; tmp350, _117
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	list_append	 ;
 ; D:/TC/src/tac.c:848:             arg_count++;
	incq	64(%rsp)	 ; arg_count
	jmp	.L108	 ;
.L110:
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	%rdi, %rcx	 ; arguments,
	call	list_pop	 ;
	movq	%rax, %rdx	 ; tmp352, arg
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	 ; arg
	je	.L128	 ;,
 ; D:/TC/src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	 ; status_142(D)->current_block, status_142(D)->current_block
	movq	8(%rax), %rcx	 ; _120->instructions, _120->instructions
	call	list_append	 ;
	jmp	.L110	 ;
.L128:
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; base_130->type, base_130->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp353, _123
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	leaq	64(%rsp), %rdx	 ;, tmp294
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp354, <retval>
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rdi, %rdx	 ; <retval>,
	movq	%rsi, %r8	 ; base,
	movl	$22, %ecx	 ;,
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rax, %r9	 ;, tmp355
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp356, _125
.L122:
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	 ; status_142(D)->current_block, status_142(D)->current_block
	movq	8(%rax), %rcx	 ;, _126->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:856:         return temp;
	jmp	.L83	 ;
.L101:
	movl	%r8d, 48(%rsp)	 ; _17, %sfp
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	48(%rsp), %r8d	 ; %sfp, _17
	leaq	.LC14(%rip), %rdx	 ;, tmp298
	movq	24(%rax), %rcx	 ; _128->_stderr, _128->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:860:         return NULL;
	jmp	.L123	 ;
.L83:
 ; D:/TC/src/tac.c:862: }
	addq	$80, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC16:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
.LC17:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	movl	8(%rcx), %r8d	 ; primary_38(D)->type,
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %r8d	 ;, _1
	ja	.L130	 ;,
	movq	%rdx, %rsi	 ; tmp146, status
	leaq	.L132(%rip), %rdx	 ;, tmp120
	movslq	(%rdx,%r8,4), %rax	 ;, tmp122
	addq	%rdx, %rax	 ; tmp120, tmp123
	jmp	*%rax	 ; tmp123
	.section .rdata,"dr"
	.align 4
.L132:
	.long	.L140-.L132
	.long	.L139-.L132
	.long	.L138-.L132
	.long	.L137-.L132
	.long	.L136-.L132
	.long	.L135-.L132
	.long	.L134-.L132
	.long	.L133-.L132
	.long	.L131-.L132
	.text
.L140:
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	movl	$10, %r8d	 ;,
	call	strtoll	 ;
 ; D:/TC/src/tac.c:685:             return create_arg(ARG_INT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp125
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 56(%rsp)	 ; tmp147, MEM[(long long int *)_94]
	jmp	.L149	 ;
.L139:
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.literal_value,
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:/TC/src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	leaq	56(%rsp), %rdx	 ;, tmp126
	movl	$2, %ecx	 ;,
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 56(%rsp)	 ; tmp149, MEM[(double *)_94]
.L149:
 ; D:/TC/src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	 ;
	movq	%rax, %rbx	 ; tmp150, <retval>
	jmp	.L129	 ;
.L138:
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %rdx	 ; primary_38(D)->value.literal_value,
 ; D:/TC/src/tac.c:742: }
	addq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %ecx	 ;,
 ; D:/TC/src/tac.c:742: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	 ;
.L137:
 ; D:/TC/src/tac.c:695:             bool t = true;
	movb	$1, 56(%rsp)	 ;, MEM[(char *)_94]
	jmp	.L150	 ;
.L136:
 ; D:/TC/src/tac.c:700:             bool t = false;
	movb	$0, 56(%rsp)	 ;, MEM[(char *)_94]
.L150:
 ; D:/TC/src/tac.c:702:             return create_arg(ARG_BOOL, &t);
	leaq	56(%rsp), %rdx	 ;, tmp128
	movl	$4, %ecx	 ;,
	jmp	.L149	 ;
.L135:
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr,
 ; D:/TC/src/tac.c:742: }
	addq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:742: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	 ;
.L134:
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp153, _9
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp154, operand
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp129
	movq	(%rax), %rdx	 ; name_bool,
	call	create_var	 ;
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp155, _11
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; operand,
	movl	$13, %ecx	 ;,
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp156, <retval>
 ; D:/TC/src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rdx	 ; <retval>,
	jmp	.L147	 ;
.L133:
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand,
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp158, _15
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	 ; tmp159, operand
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp160, _17
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp134
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rbx	 ; tmp161, <retval>
 ; D:/TC/src/tac.c:719:             long long zero_int = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 48(%rsp)	 ;, zero_int
 ; D:/TC/src/tac.c:720:             double neg_one_float = -1.0;
	movq	.LC15(%rip), %rax	 ;, tmp169
	movq	%rax, 56(%rsp)	 ; tmp169, MEM[(double *)_94]
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; operand_44->type, _18
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	cmpq	(%rdx), %rax	 ; name_int, _18
	jne	.L142	 ;,
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	leaq	48(%rsp), %rdx	 ;, tmp135
	movl	$1, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %r8	 ;, tmp162
	jmp	.L147	 ;
.L142:
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp136
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	cmpq	(%rdx), %rax	 ; name_float, _18
	jne	.L144	 ;,
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	56(%rsp), %rdx	 ;, tmp137
	movl	$2, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rdi, %r9	 ; operand,
	movq	%rbx, %rdx	 ; <retval>,
	movl	$2, %ecx	 ;,
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %r8	 ;, tmp164
.L147:
 ; D:/TC/src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp165, inst
 ; D:/TC/src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:732:             return temp;
	jmp	.L129	 ;
.L144:
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %r8	 ; _18->name, _23
	movq	%r8, 40(%rsp)	 ; _23, %sfp
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	40(%rsp), %r8	 ; %sfp, _23
	leaq	.LC16(%rip), %rdx	 ;, tmp139
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	call	fprintf	 ;
	jmp	.L148	 ;
.L131:
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.var,
 ; D:/TC/src/tac.c:742: }
	addq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:742: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	 ;
.L130:
	movl	%r8d, 40(%rsp)	 ; _1, %sfp
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	40(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC17(%rip), %rdx	 ;, tmp143
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
.L148:
 ; D:/TC/src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
.L129:
 ; D:/TC/src/tac.c:742: }
	addq	$64, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.section .rdata,"dr"
.LC18:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
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
 ; D:/TC/src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	jne	.L152	 ;,
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; D:/TC/src/tac.c:678: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
.L152:
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
 ; D:/TC/src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r12d	 ;, _67
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rcx	 ; tmp131, _4
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp132, <retval>
 ; D:/TC/src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %eax	 ; expression_31(D)->operator,
	cmpl	$18, %eax	 ;, _5
	ja	.L153	 ;,
	leaq	CSWTCH.21(%rip), %rdx	 ;, tmp116
	movzbl	(%rdx,%rax), %r12d	 ; CSWTCH.21[_5], _67
.L153:
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rcx	 ; expression_31(D)->expr_left,
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp133, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp118
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp118
	ja	.L154	 ;,
 ; D:/TC/src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, %r12d	 ;, _67
	je	.L155	 ;,
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp134, _9
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp135, temp
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _67,
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp136
 ; D:/TC/src/tac.c:663:             right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; D:/TC/src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp137, inst
 ; D:/TC/src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
.L155:
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rsi)	 ;, left_38->kind
	je	.L156	 ;,
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	leaq	.LC18(%rip), %rcx	 ;, tmp124
	movq	24(%rax), %rdx	 ; _14->_stderr, _14->_stderr
	call	fputs	 ;
.L156:
 ; D:/TC/src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %rdx	 ; left,
	movq	%rdi, %r8	 ; <retval>,
	movl	$14, %ecx	 ;,
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%rsi)	 ;, left_38->is_get
 ; D:/TC/src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rdx	 ; tmp139, inst
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	je	.L157	 ;,
 ; D:/TC/src/tac.c:669:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rsi, %rdx	 ; left,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; <retval>,
	movl	$24, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp140, inst
	jmp	.L157	 ;
.L154:
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rsi), %rdx	 ; left_38->type, left_38->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rdx	 ; tmp141, _18
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%rsi, %rcx	 ; left,
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rbp	 ; tmp142, temp
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rdi, %r9	 ; <retval>,
	movq	%rbp, %rdx	 ; temp,
	movl	%r12d, %ecx	 ; _67,
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r8	 ;, tmp143
 ; D:/TC/src/tac.c:673:         right = temp;
	movq	%rbp, %rdi	 ; temp, <retval>
 ; D:/TC/src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp144, inst
.L157:
 ; D:/TC/src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:678: }
	addq	$32, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC19:
	.ascii "Error: create_attribute received NULL table\12\0"
.LC20:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp125, variable
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp126, status
	subq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:403:     if (is_attr) {
	testb	%r8b, %r8b	 ; tmp127
	je	.L164	 ;,
 ; D:/TC/src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	(%rax), %rcx	 ; _1->attribute_tables,
	call	list_pop_back	 ;
	movq	%rax, %rsi	 ; tmp128, attr_table
 ; D:/TC/src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	%rsi, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _3->attribute_tables,
	call	list_append	 ;
 ; D:/TC/src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rdi), %rbp	 ; variable_11(D)->type, _5
	movq	8(%rdi), %r12	 ; variable_11(D)->name, _6
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%rbp, %rdx	 ; _5,
	movq	%r12, %rcx	 ; _6,
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rdi	 ; tmp129, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:198:     attr->type = type;
	movq	%rbp, 8(%rdi)	 ; _5, attr_17->type
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%rdi)	 ; tmp130, attr_17->var
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	%rdx, 16(%rdi)	 ;, attr_17->offset
 ; D:/TC/src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%rsi, %rsi	 ; attr_table
	je	.L165	 ;,
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rsi), %rax	 ; attr_table_14->size, attr_table_14->size
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%rbp, %rcx	 ; _5,
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rdi)	 ; attr_table_14->size, attr_17->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%rsi), %rcx	 ; attr_table_14->attributes, _28
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rsi)	 ; tmp131, attr_table_14->size
 ; D:/TC/src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rdi, %rdx	 ; attr,
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _28
	jne	.L176	 ;,
	jmp	.L166	 ;
.L165:
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	leaq	.LC19(%rip), %rcx	 ;, tmp118
	movq	24(%rax), %rdx	 ; _26->_stderr, _26->_stderr
	call	fputs	 ;
.L166:
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	leaq	.LC20(%rip), %rcx	 ;, tmp120
	movq	24(%rax), %rdx	 ; _29->_stderr, _29->_stderr
 ; D:/TC/src/tac.c:421: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fputs	 ;
.L164:
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	8(%rcx), %rcx	 ; variable_11(D)->name, variable_11(D)->name
	movq	%rdx, %r9	 ; status,
	movq	(%rdi), %rdx	 ; variable_11(D)->type,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rdi), %rcx	 ; variable_11(D)->value, _34
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	%rax, %rsi	 ; tmp134, var
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	testq	%rcx, %rcx	 ; _34
	je	.L168	 ;,
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rax, %rcx	 ; tmp135, _35
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	call	load_rvalue	 ;
	jmp	.L175	 ;
.L168:
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	xorl	%eax, %eax	 ;
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	leaq	56(%rsp), %rdx	 ;, tmp122
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	%rax, 56(%rsp)	 ;, D.6327
 ; D:/TC/src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	call	create_arg	 ;
.L175:
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rsi, %rdx	 ; var,
	xorl	%ecx, %ecx	 ;
	movq	%rax, 40(%rsp)	 ; value, %sfp
	call	create_arg	 ;
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	40(%rsp), %r8	 ; %sfp, value
	movl	$14, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rax, %rdx	 ; tmp138, _38
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp139, _40
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	 ; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rcx	 ; _41->instructions, _41->instructions
.L176:
 ; D:/TC/src/tac.c:421: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	list_append	 ;
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp181, if_
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp182, status
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp183, then_label
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%rdi), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp184, else_label
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp185
	jne	.L178	 ;,
.L180:
 ; D:/TC/src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rbp	 ; tmp186, end_label
	jmp	.L179	 ;
.L178:
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%rdi), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp187
	je	.L180	 ;,
 ; D:/TC/src/tac.c:472:         end_label = else_label;
	movq	%rsi, %rbp	 ; else_label, end_label
.L179:
 ; D:/TC/src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rbp, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%rdi), %rcx	 ; if__63(D)->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, 32(%rsp)	 ; tmp188, %sfp
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rax, %rcx	 ; tmp189, _6
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rax, %r13	 ; tmp190, condition
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _7, %sfp
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _7
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp192
 ; D:/TC/src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp193, inst
 ; D:/TC/src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:481:     Block* then_block = create_block(then_label);
	movq	%r12, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp194, then_block
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%r12, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:483:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	 ; then_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%rdi), %rcx	 ; if__63(D)->body, if__63(D)->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp195, then_statements
.L181:
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp196, statement
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L201	 ;,
 ; D:/TC/src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L181	 ;
.L201:
 ; D:/TC/src/tac.c:490:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp197, jump_to_end
 ; D:/TC/src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%rdi), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp198
	jne	.L183	 ;,
 ; D:/TC/src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%rdi), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp199, elif_list
.L184:
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r13, %rcx	 ; elif_list,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp214, elif
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L183	 ;,
 ; D:/TC/src/tac.c:499:             Block* else_if_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp200, else_if_block
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_if_block,
	movq	32(%rax), %rcx	 ; _19->blocks, _19->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:501:             status->current_block = else_if_block;
	movq	%rsi, 16(%rbx)	 ; else_if_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	 ; tmp201, then_label
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	(%r12), %rcx	 ; elif_93->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp202, else_label
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rax, %rcx	 ; tmp203, _22
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r13, %rcx	 ; elif_list,
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rax, %r15	 ; tmp204, condition
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp205
	je	.L186	 ;,
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%rdi), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	 ; tmp206
	cmovne	%rbp, %rsi	 ; else_label,, end_label, else_label
.L186:
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rsi, %rdx	 ; else_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rdx	 ; then_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 40(%rsp)	 ; _26, %sfp
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	40(%rsp), %r9	 ; %sfp, _26
	movq	%r15, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %r8	 ;, tmp208
 ; D:/TC/src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp209, inst
 ; D:/TC/src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _28->instructions, _28->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:512:             then_block = create_block(then_label);
	movq	%r14, %rcx	 ; then_label,
	call	create_block	 ;
	movq	%rax, %r14	 ; tmp210, then_block
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%r14, %rdx	 ; then_block,
	movq	32(%rax), %rcx	 ; _30->blocks, _30->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:514:             status->current_block = then_block;
	movq	%r14, 16(%rbx)	 ; then_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rcx	 ; elif_93->body, elif_93->body
	call	list_copy	 ;
	movq	%rax, %r12	 ; tmp211, elif_statements
.L187:
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp212, elif_statement
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	je	.L202	 ;,
 ; D:/TC/src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L187	 ;
.L202:
 ; D:/TC/src/tac.c:521:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp213, jump_to_end
 ; D:/TC/src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
	jmp	.L184	 ;
.L183:
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%rdi), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp215
	jne	.L190	 ;,
 ; D:/TC/src/tac.c:528:         Block* else_block = create_block(else_label);
	movq	%rsi, %rcx	 ; else_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp216, else_block
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%rsi, %rdx	 ; else_block,
	movq	32(%rax), %rcx	 ; _37->blocks, _37->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:530:         status->current_block = else_block;
	movq	%rsi, 16(%rbx)	 ; else_block, status_58(D)->current_block
 ; D:/TC/src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%rdi), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp217, else_statements
.L191:
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp218, else_statement
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	je	.L203	 ;,
 ; D:/TC/src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L191	 ;
.L203:
 ; D:/TC/src/tac.c:537:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	32(%rsp), %rdx	 ; %sfp,
	movl	$20, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp219, jump_to_end
 ; D:/TC/src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _40->instructions, _40->instructions
	call	list_append	 ;
.L190:
 ; D:/TC/src/tac.c:541:     Block* end_block = create_block(end_label);
	movq	%rbp, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp220, end_block
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _42->blocks, _42->blocks
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
	.section .rdata,"dr"
.LC21:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
.LC22:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
.LC23:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	movl	8(%rcx), %r8d	 ; statement_35(D)->type,
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %r8d	 ;, _1
	ja	.L205	 ;,
	movq	%rdx, %rbx	 ; tmp144, status
	leaq	.L207(%rip), %rdx	 ;, tmp120
	movq	%rcx, %rsi	 ; tmp143, statement
	movslq	(%rdx,%r8,4), %rax	 ;, tmp122
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
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.expr,
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rax, %rcx	 ; tmp145, _3
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	jmp	load_rvalue	 ;
.L213:
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.var,
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	%rbx, %rdx	 ; status,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	tac_variable	 ;
.L212:
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.if_stmt,
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	 ;
.L211:
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.while_stmt,
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	 ;
.L210:
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_35(D)->stmt.for_stmt,
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	 ;
.L209:
 ; D:/TC/src/tac.c:431:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$5, %ecx	 ;,
	xorl	%edx, %edx	 ;
	call	create_arg	 ;
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_35(D)->stmt.return_expr, _8
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _8
	je	.L215	 ;,
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rax, %rcx	 ; tmp147, _9
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	call	load_rvalue	 ;
.L215:
 ; D:/TC/src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, %rdx	 ; return_value,
	movl	$21, %ecx	 ;,
	jmp	.L228	 ;
.L208:
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rbx), %rcx	 ; status_36(D)->end_labels, status_36(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp150
	jne	.L216	 ;,
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbx), %rax	 ; status_36(D)->end_labels, status_36(D)->end_labels
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _15->tail, _15->tail
	movq	8(%rax), %rdx	 ; _16->content, label
 ; D:/TC/src/tac.c:440:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	je	.L216	 ;,
.L230:
 ; D:/TC/src/tac.c:441:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
.L228:
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp151, inst
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_36(D)->current_block, status_36(D)->current_block
	movq	8(%rax), %rcx	 ;, _17->instructions
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
.L216:
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	leaq	.LC21(%rip), %rcx	 ;, tmp133
	movq	24(%rax), %rdx	 ; _19->_stderr, _19->_stderr
	jmp	.L229	 ;
.L206:
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rbx), %rcx	 ; status_36(D)->start_labels, status_36(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp153
	jne	.L217	 ;,
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbx), %rax	 ; status_36(D)->start_labels, status_36(D)->start_labels
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _23->tail, _23->tail
	movq	8(%rax), %rdx	 ; _24->content, label
 ; D:/TC/src/tac.c:451:                 if (label != NULL) {
	testq	%rdx, %rdx	 ; label
	jne	.L230	 ;,
.L217:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	leaq	.LC22(%rip), %rcx	 ;, tmp140
	movq	24(%rax), %rdx	 ; _27->_stderr, _27->_stderr
.L229:
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	jmp	fputs	 ;
.L205:
	movl	%r8d, 44(%rsp)	 ; _1, %sfp
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	44(%rsp), %r8d	 ; %sfp, _1
	leaq	.LC23(%rip), %rdx	 ;, tmp142
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
 ; D:/TC/src/tac.c:464: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp173, for_
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp174, status
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__55(D)->initializer, _1
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L232	 ;,
 ; D:/TC/src/tac.c:550:         tac_variable(for_->initializer, status, false);
	xorl	%r8d, %r8d	 ;
	call	tac_variable	 ;
.L232:
 ; D:/TC/src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp175, condition_label
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp176, body_label
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, for__55(D)->condition
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp177, end_label
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	je	.L233	 ;,
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp178, _3
 ; D:/TC/src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp179, inst
 ; D:/TC/src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:559:         Block* condition_block = create_block(condition_label);
	movq	%rbp, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp180, condition_block
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r13, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:561:         status->current_block = condition_block;
	movq	%r13, 16(%rbx)	 ; condition_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rsi), %rcx	 ; for__55(D)->condition, for__55(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rax, %rcx	 ; tmp181, _9
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rax, %r13	 ; tmp182, condition
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 40(%rsp)	 ; _10, %sfp
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	40(%rsp), %r9	 ; %sfp, _10
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp184
	jmp	.L246	 ;
.L233:
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp186, _14
.L246:
 ; D:/TC/src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp187, inst
 ; D:/TC/src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ;, _15->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:572:     Block* body_block = create_block(body_label);
	movq	%rdi, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp188, body_block
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r13, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _17->blocks, _17->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:574:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; body_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%rsi)	 ;, for__55(D)->increment
 ; D:/TC/src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp189, increment_label
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rdx	 ; increment_label,
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	jne	.L247	 ;,
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rsi)	 ;, for__55(D)->condition
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rdx	 ; condition_label,
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	jne	.L247	 ;,
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rdi, %rdx	 ; body_label,
.L247:
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rdx	 ; tmp192, _25
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_56(D)->end_labels, status_56(D)->end_labels
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp193, _27
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; for__55(D)->body, for__55(D)->body
	call	list_copy	 ;
	movq	%rax, %r14	 ; tmp194, body_statements
.L238:
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r14, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L248	 ;,
 ; D:/TC/src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L238	 ;
.L248:
 ; D:/TC/src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_56(D)->end_labels, status_56(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, for__55(D)->increment
	je	.L240	 ;,
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r13, %rdx	 ; increment_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp196, _33
 ; D:/TC/src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:/TC/src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _34->instructions, _34->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:594:         Block* increment_block = create_block(increment_label);
	movq	%r13, %rcx	 ; increment_label,
	call	create_block	 ;
	movq	%rax, %r13	 ; tmp198, increment_block
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r13, %rdx	 ; increment_block,
	movq	32(%rax), %rcx	 ; _36->blocks, _36->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:596:         status->current_block = increment_block;
	movq	%r13, 16(%rbx)	 ; increment_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rsi), %rcx	 ; for__55(D)->increment, for__55(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rax, %rcx	 ; tmp199, _39
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	call	load_rvalue	 ;
.L240:
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp200, _40
 ; D:/TC/src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%rsi)	 ;, for__55(D)->condition
	jne	.L241	 ;,
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rdi, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp202, _42
 ; D:/TC/src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	 ;
.L241:
 ; D:/TC/src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rdx	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rdx), %rcx	 ; _43->instructions, _43->instructions
	movq	%rax, %rdx	 ; inst,
	call	list_append	 ;
 ; D:/TC/src/tac.c:605:     Block* end_block = create_block(end_label);
	movq	%r12, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp204, end_block
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _45->blocks, _45->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:607:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_56(D)->current_block
 ; D:/TC/src/tac.c:609: }
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
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp138, while_
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp139, status
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %ecx	 ;,
	movq	%rax, %rdx	 ; condition_label,
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp140, condition_label
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	 ;
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp141, _1
 ; D:/TC/src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp142, inst
 ; D:/TC/src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:616:     Block* condition_block = create_block(condition_label);
	movq	%rsi, %rcx	 ; condition_label,
	call	create_block	 ;
	movq	%rax, %rdi	 ; tmp143, condition_block
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	%rdi, %rdx	 ; condition_block,
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:618:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; condition_block, status_28(D)->current_block
 ; D:/TC/src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	xorl	%edx, %edx	 ;
	movl	$98, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp144, body_label
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	0(%rbp), %rcx	 ; while__43(D)->condition,
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp145, end_label
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rax, %rcx	 ; tmp146, _7
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rax, %r13	 ; tmp147, condition
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rdx	 ; body_label,
	movl	$6, %ecx	 ;,
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 40(%rsp)	 ; _8, %sfp
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	40(%rsp), %r9	 ; %sfp, _8
	movq	%r13, %rdx	 ; condition,
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r8	 ;, tmp149
 ; D:/TC/src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp150, inst
 ; D:/TC/src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _10->instructions, _10->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:626:     Block* body_block = create_block(body_label);
	movq	%r12, %rcx	 ; body_label,
	call	create_block	 ;
	movq	%rax, %r12	 ; tmp151, body_block
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	%r12, %rdx	 ; body_block,
	movq	32(%rax), %rcx	 ; _12->blocks, _12->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; body_block, status_28(D)->current_block
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_28(D)->start_labels, status_28(D)->start_labels
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rdx	 ; tmp152, _14
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rdi, %rdx	 ; end_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_28(D)->end_labels, status_28(D)->end_labels
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	 ; tmp153, _16
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rcx	 ; while__43(D)->body, while__43(D)->body
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp154, body_statements
.L250:
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp155, statement
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L253	 ;,
 ; D:/TC/src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L250	 ;
.L253:
 ; D:/TC/src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_28(D)->start_labels, status_28(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_28(D)->end_labels, status_28(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rsi, %rdx	 ; condition_label,
	movl	$6, %ecx	 ;,
	call	create_arg	 ;
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$20, %ecx	 ;,
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rdx	 ; tmp156, _21
 ; D:/TC/src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	 ;
	movq	%rax, %rdx	 ; tmp157, inst
 ; D:/TC/src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:642:     Block* end_block = create_block(end_label);
	movq	%rdi, %rcx	 ; end_label,
	call	create_block	 ;
	movq	%rax, %rsi	 ; tmp158, end_block
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	%rsi, %rdx	 ; end_block,
	movq	32(%rax), %rcx	 ; _24->blocks, _24->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:644:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; end_block, status_28(D)->current_block
 ; D:/TC/src/tac.c:646: }
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
 ; D:/TC/src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rcx), %rdx	 ; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rcx), %rcx	 ; function_16(D)->name,
	call	create_subroutine	 ;
 ; D:/TC/src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %rdi	 ; tmp112, subroutine
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
	movq	%rdi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rsi), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp113, parameters
.L255:
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L260	 ;,
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	(%rax), %rdx	 ; parameter_25->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rdi), %rcx	 ; subroutine_18->parameters, subroutine_18->parameters
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp114, _8
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L255	 ;
.L260:
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp116, _10
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rdi), %rcx	 ; subroutine_18->blocks, subroutine_18->blocks
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rbp	 ; tmp117, block
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:332:     status->current_block = block;
	movq	%rbp, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:/TC/src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rsi), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp118, statements
.L257:
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp119, statement
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L261	 ;,
 ; D:/TC/src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L257	 ;
.L261:
 ; D:/TC/src/tac.c:339:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:341: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC24:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp153, method
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp154, status
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rcx), %rdx	 ; method_44(D)->return_type, method_44(D)->return_type
	movq	(%rcx), %rcx	 ; method_44(D)->name,
	call	create_subroutine	 ;
 ; D:/TC/src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	 ; subroutine, status_47(D)->current_subroutine
 ; D:/TC/src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %rdi	 ; tmp155, subroutine
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_47(D)->tac, status_47(D)->tac
	movq	%rdi, %rdx	 ; subroutine,
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rsi), %rcx	 ; method_44(D)->parameters, method_44(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp156, parameters
.L263:
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rbp, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L271	 ;,
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rcx	 ; parameter_53->name, parameter_53->name
	movq	(%rax), %rdx	 ; parameter_53->type,
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rdi), %rcx	 ; subroutine_46->parameters, subroutine_46->parameters
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp157, _8
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
	jmp	.L263	 ;
.L271:
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, %rcx	 ; tmp159, _10
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	 ;
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rdi), %rcx	 ; subroutine_46->blocks, subroutine_46->blocks
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %rbp	 ; tmp160, block
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rdx	 ; block,
	call	list_append	 ;
 ; D:/TC/src/tac.c:356:     status->current_block = block;
	movq	%rbp, 16(%rbx)	 ; block, status_47(D)->current_block
 ; D:/TC/src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rsi), %rcx	 ; method_44(D)->body, method_44(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp161, statements
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_47(D)->current_class, status_47(D)->current_class
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _14->name, _14->name
	movq	8(%rax), %rcx	 ; _15->name, _15->name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp139
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME,
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp162, _17
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rsi), %rax	 ; method_44(D)->name, method_44(D)->name
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _18->name, _18->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp163
	jne	.L268	 ;,
 ; D:/TC/src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rdi, %rcx	 ; statements,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 8(%rax)	 ;, stmt_63->type
	jne	.L266	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; stmt_63->stmt.expr, _22
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	 ;, _22->operator
	jne	.L266	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _22->prim_left, _24
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	 ;, _24->type
	jne	.L266	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _24->value.var, _26
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 16(%rax)	 ;, _26->type
	je	.L267	 ;,
.L266:
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	(%rsi), %rax	 ; method_44(D)->name, method_44(D)->name
	movq	8(%rax), %r8	 ; _28->name, _29
	movq	%r8, 40(%rsp)	 ; _29, %sfp
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	40(%rsp), %r8	 ; %sfp, _29
	leaq	.LC24(%rip), %rdx	 ;, tmp149
	movq	24(%rax), %rcx	 ; _30->_stderr, _30->_stderr
 ; D:/TC/src/tac.c:375: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	jmp	fprintf	 ;
.L267:
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r12	 ; _26->content.name, self
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	 ; status_47(D)->current_class, tmp172
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %ecx	 ;,
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	leaq	24(%rax), %rdx	 ;, tmp150
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r12), %rdx	 ; self_64->type,
	movq	%rbx, %r9	 ; status,
	movq	%r12, %rcx	 ; self,
	movl	$118, %r8d	 ;,
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	 ; tmp166, _34
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_var	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp167, _36
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$18, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%rsi, %r8	 ; _34,
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp168, _37
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_instruction	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rbp), %rcx	 ; block_56->instructions, block_56->instructions
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	 ; tmp169, _38
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
.L268:
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rdi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp170, statement
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L272	 ;,
 ; D:/TC/src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
	jmp	.L268	 ;
.L272:
 ; D:/TC/src/tac.c:373:     status->current_subroutine = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%rbx)	 ;, status_47(D)->current_subroutine
 ; D:/TC/src/tac.c:375: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.section .rdata,"dr"
.LC25:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp102, class
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp103, status
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:378:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_13(D)->current_class
 ; D:/TC/src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_14(D)->members, class_14(D)->members
	call	list_copy	 ;
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rsi), %rbp	 ; class_14(D)->name, _2
 ; D:/TC/src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rdi	 ; tmp104, members
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp105, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:11:     table->size = 0;
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:10:     table->name = name;
	movq	%rbp, 8(%rsi)	 ; _2, table_28->name
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rsi)	 ; tmp106, table_28->attributes
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_13(D)->tac, status_13(D)->tac
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	%rdx, 16(%rsi)	 ;, table_28->size
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rsi, %rdx	 ; table,
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC25(%rip), %rsi	 ;, tmp101
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rcx	 ; _3->attribute_tables,
	call	list_append	 ;
.L274:
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L282	 ;,
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %r8d	 ; member_22->type, _5
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	testl	%r8d, %r8d	 ; _5
	je	.L275	 ;,
	cmpl	$1, %r8d	 ;, _5
	jne	.L283	 ;,
 ; D:/TC/src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rcx	 ; member_22->content.variable,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:391:                 break;
	jmp	.L274	 ;
.L275:
 ; D:/TC/src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_22->content.method,
	movq	%rbx, %rdx	 ; status,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:388:                 break;
	jmp	.L274	 ;
.L283:
	movl	%r8d, 44(%rsp)	 ; _5, %sfp
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	44(%rsp), %r8d	 ; %sfp, _5
	movq	%rsi, %rdx	 ; tmp101,
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:394:                 break;
	jmp	.L274	 ;
.L282:
 ; D:/TC/src/tac.c:397:     status->current_class = NULL;
	xorl	%eax, %eax	 ;
	movq	%rax, 24(%rbx)	 ;, status_13(D)->current_class
 ; D:/TC/src/tac.c:399: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC26:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rbx	 ;
	movq	%r8, %r9	 ; tmp105, status
	movq	%rdx, %rbx	 ; tmp104, tac
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rcx	 ; import_15(D)->name, _1
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rcx), %r8d	 ; _1->kind, _2
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %r8d	 ;, _2
	jne	.L285	 ;,
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movl	$118, %r8d	 ;,
	jmp	.L289	 ;
.L285:
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%r8), %eax	 ;, tmp98
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp98
	ja	.L286	 ;,
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movl	$102, %r8d	 ;,
.L289:
	movq	(%rcx), %rdx	 ; _1->type,
	call	create_var	 ;
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbx), %rcx	 ; tac_21(D)->global_vars, tac_21(D)->global_vars
 ; D:/TC/src/tac.c:317: }
	addq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp107, _8
 ; D:/TC/src/tac.c:317: }
	popq	%rbx	 ;
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
.L286:
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%r8d, %r8d	 ; _2
	jne	.L287	 ;,
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rcx), %rcx	 ; _1->ast_node.class, _1->ast_node.class
 ; D:/TC/src/tac.c:317: }
	addq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	%r9, %rdx	 ; status,
 ; D:/TC/src/tac.c:317: }
	popq	%rbx	 ;
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	jmp	tac_class	 ;
.L287:
	movl	%r8d, 44(%rsp)	 ; _2, %sfp
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	44(%rsp), %r8d	 ; %sfp, _2
	leaq	.LC26(%rip), %rdx	 ;, tmp102
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
 ; D:/TC/src/tac.c:317: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.section .rdata,"dr"
.LC27:
	.ascii "main\0"
	.text
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%r12	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC27(%rip), %r12	 ;, tmp108
 ; D:/TC/src/tac.c:285: TAC* tac_code(Code* code) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp109, code
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:285: TAC* tac_code(Code* code) {
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
 ; D:/TC/src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rdi), %rcx	 ; code_17(D)->members,
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rbx)	 ; tmp116, status_26->start_labels
 ; D:/TC/src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp117, members
.L291:
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rbp, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp119, code_member
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L299	 ;,
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rdi), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	jne	.L292	 ;,
 ; D:/TC/src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.function,
	movq	%rbx, %rdx	 ; status,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rdi), %rax	 ; code_member_21->content.function, code_member_21->content.function
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r12, %rdx	 ; tmp108,
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rdi	 ; _4->name, _5
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rdi), %rcx	 ; _5->name, _5->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp118
	jne	.L291	 ;,
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rdi, 8(%rsi)	 ; _5, tac_29->entry_point
	jmp	.L291	 ;
.L292:
 ; D:/TC/src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	jne	.L295	 ;,
 ; D:/TC/src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.class,
	movq	%rbx, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L291	 ;
.L295:
 ; D:/TC/src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L291	 ;,
 ; D:/TC/src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%rdi), %rcx	 ; code_member_21->content.import,
	movq	%rbx, %r8	 ; status,
	movq	%rsi, %rdx	 ; <retval>,
	call	tac_import	 ;
	jmp	.L291	 ;
.L299:
 ; D:/TC/src/tac.c:304: }
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
CSWTCH.21:
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
.LC15:
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
	.def	fputs;	.scl	2;	.type	32;	.endef
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
