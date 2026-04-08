	.file	"tac.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
	.text
	.p2align 4
	.def	get_type_size;	.scl	3;	.type	32;	.endef
get_type_size:
 ; D:/TC/src/tac.c:19:         result = 0;
	xorl	%eax, %eax	 ; <retval>
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%rcx, %rcx	 ; type
	je	.L10	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rax	 ;, tmp94
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_int
	je	.L11	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rax	 ;, tmp95
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_float
	je	.L11	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rax	 ;, tmp96
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rcx, (%rax)	 ; type, name_string
	je	.L11	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp97
 ; D:/TC/src/tac.c:23:         result = 1;
	movl	$1, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rdx)	 ; type, name_bool
	je	.L10	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp98
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rcx, (%rdx)	 ; type, name_void
	je	.L10	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%rcx), %eax	 ; type_14(D)->kind,
	testl	%eax, %eax	 ;
	jne	.L4	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rcx), %rax	 ; type_14(D)->ast_node.class, type_14(D)->ast_node.class
	movq	24(%rax), %rax	 ; _7->size, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:/TC/src/tac.c:30: }
	ret	
	.p2align 4,,10
	.p2align 3
.L11:
 ; D:/TC/src/tac.c:21:         result = 8;
	movl	$8, %eax	 ;, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
 ; D:/TC/src/tac.c:15: static size_t get_type_size(Symbol* type) {
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_14(D)->name, _8
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC0(%rip), %rdx	 ;, tmp101
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	movq	%rbx, %r8	 ; _8,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:30: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:21:         result = 8;
	movl	$8, %eax	 ;, <retval>
 ; D:/TC/src/tac.c:30: }
	popq	%rbx	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "\0"
.LC2:
	.ascii "$%d-error\0"
.LC3:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movl	%r8d, %r12d	 ; tmp192, kind
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp191, type
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp190, original_name
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp193, status
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	je	.L16	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%rdx), %ecx	 ; type_34(D)->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	 ;
	jne	.L17	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rdx), %rax	 ; type_34(D)->ast_node.class, type_34(D)->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%r9), %r14	 ; status_35(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; type_34(D)->ast_node.class, status_35(D)->current_class
.L17:
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, _57
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	 ; _57
	je	.L23	 ;,
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rcx	 ; _57->local_vars, _57->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	 ; tmp194
	je	.L21	 ;,
.L27:
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, _65
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	 ; _65
	je	.L23	 ;,
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rcx	 ; _65->parameters, _65->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	 ; tmp197
	je	.L69	 ;,
.L23:
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rsi)	 ;, status_35(D)->current_class
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rsi), %rax	 ; status_35(D)->tac, status_35(D)->tac
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	je	.L20	 ;,
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rcx	 ; pretmp_17->attribute_tables, pretmp_17->attribute_tables
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	 ; tmp201
	je	.L64	 ;,
.L67:
	movq	(%rsi), %rax	 ; status_35(D)->tac, status_35(D)->tac
.L20:
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	16(%rax), %rcx	 ; _93->global_vars, _93->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	 ; tmp200
	jne	.L65	 ;,
 ; D:/TC/src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%rsi), %rax	 ; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rcx	 ; _96->global_vars, _96->global_vars
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp207, vars
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L39	 ;
	.p2align 4,,10
	.p2align 3
.L40:
 ; D:/TC/src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; var_99->original_name, original_name
	je	.L25	 ;,
.L39:
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp208, <retval>
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L40	 ;,
.L65:
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%rbp), %eax	 ; type_34(D)->kind,
	testl	%eax, %eax	 ;
	jne	.L16	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rsi)	 ; current_class, status_35(D)->current_class
.L16:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%rdi, (%rax)	 ; original_name, var_42->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp209, <retval>
 ; D:/TC/src/tac.c:174:     switch (kind) {
	leal	-97(%r12), %eax	 ;,
	cmpl	$21, %eax	 ;, tmp161
	ja	.L43	 ;,
	leaq	.L45(%rip), %rdx	 ;, tmp163
	movslq	(%rdx,%rax,4), %rax	 ;, tmp165
	addq	%rdx, %rax	 ; tmp163, tmp166
	jmp	*%rax	 ; tmp166
	.section .rdata,"dr"
	.align 4
.L45:
	.long	.L50-.L45
	.long	.L49-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L48-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L47-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L43-.L45
	.long	.L46-.L45
	.long	.L43-.L45
	.long	.L44-.L45
	.text
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:/TC/src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _60->local_vars, _60->local_vars
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp195, vars
	.p2align 4,,10
	.p2align 3
.L24:
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp196, <retval>
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L27	 ;,
 ; D:/TC/src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; var_63->original_name, original_name
	jne	.L24	 ;,
.L25:
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%rbp), %edx	 ; type_34(D)->kind,
	testl	%edx, %edx	 ;
	jne	.L14	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rsi)	 ; current_class, status_35(D)->current_class
.L14:
 ; D:/TC/src/tac.c:193: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
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
.L43:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC1(%rip), %rcx	 ;, tmp168
	call	create_string	 ;
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%r12d, %r8d	 ; kind,
	leaq	.LC2(%rip), %rdx	 ;, tmp169
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _105, var_42->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp210, _105
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	call	sprintf	 ;
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rbp, 16(%rbx)	 ; type, var_42->type
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L64:
 ; D:/TC/src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rsi), %rax	 ; status_35(D)->tac, status_35(D)->tac
	movq	(%rax), %rcx	 ; _77->attribute_tables, _77->attribute_tables
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp202, tables
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	jmp	.L33	 ;
	.p2align 4,,10
	.p2align 3
.L37:
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rsi), %rax	 ; status_35(D)->current_class, status_35(D)->current_class
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	 ; _82->name, tmp216
	cmpq	%rax, 8(%rbx)	 ; tmp216, table_80->name
	je	.L70	 ;,
.L33:
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r13, %rcx	 ; tables,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp206, table
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	 ; table
	jne	.L37	 ;,
	jmp	.L67	 ;
	.p2align 4,,10
	.p2align 3
.L69:
 ; D:/TC/src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	16(%rax), %rcx	 ; _68->parameters, _68->parameters
	call	list_copy	 ;
	movq	%rax, %r13	 ; tmp198, vars
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L28	 ;
	.p2align 4,,10
	.p2align 3
.L29:
 ; D:/TC/src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; var_71->original_name, original_name
	je	.L25	 ;,
.L28:
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r13, %rcx	 ; vars,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp199, <retval>
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L29	 ;,
	jmp	.L23	 ;
.L44:
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rsi), %rdi	 ; status_35(D)->var_count, id
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp172
	movq	%rax, 64(%rsi)	 ; tmp172, status_35(D)->var_count
	.p2align 4,,10
	.p2align 3
.L52:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC1(%rip), %rcx	 ;, tmp176
	movl	$32, %edx	 ;,
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _16, var_42->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp211, _16
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, id
	je	.L71	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; id,
	movl	%r12d, %r8d	 ; kind,
	leaq	.LC3(%rip), %rdx	 ;, tmp178
	call	sprintf	 ;
.L54:
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %r12d	 ;, tmp179
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rbp, 16(%rbx)	 ; type, var_42->type
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %r12d	 ;, tmp179
	jne	.L14	 ;,
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	%rbx, %rdx	 ; <retval>,
	movq	24(%rax), %rcx	 ; _20->local_vars, _20->local_vars
	call	list_append	 ;
	jmp	.L14	 ;
.L46:
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %rdi	 ; status_35(D)->temp_count, id
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp173
	movq	%rax, 72(%rsi)	 ; tmp173, status_35(D)->temp_count
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L52	 ;
.L47:
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rsi), %rdi	 ; status_35(D)->param_count, id
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp171
	movq	%rax, 56(%rsi)	 ; tmp171, status_35(D)->param_count
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L52	 ;
.L48:
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rsi), %rdi	 ; status_35(D)->subroutine_count, id
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp175
	movq	%rax, 88(%rsi)	 ; tmp175, status_35(D)->subroutine_count
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L52	 ;
.L49:
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rsi), %rdi	 ; status_35(D)->block_count, id
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp174
	movq	%rax, 80(%rsi)	 ; tmp174, status_35(D)->block_count
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L52	 ;
.L50:
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rsi), %rdi	 ; status_35(D)->attr_count, id
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp170
	movq	%rax, 48(%rsi)	 ; tmp170, status_35(D)->attr_count
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L70:
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rbx), %rcx	 ; table_80->attributes, table_80->attributes
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	 ; tmp203
	jne	.L33	 ;,
 ; D:/TC/src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%rbx), %rcx	 ; table_80->attributes, table_80->attributes
	call	list_copy	 ;
	movq	%rax, %r15	 ; tmp204, attributes
	.p2align 4,,10
	.p2align 3
.L35:
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%r15, %rcx	 ; attributes,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	 ; attr
	je	.L33	 ;,
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rbx	 ; attr_90->var, <retval>
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	(%rbx), %rdi	 ; _91->original_name, original_name
	jne	.L35	 ;,
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%r12d, %r8d	 ; kind,
	leaq	.LC2(%rip), %rdx	 ;, tmp177
	call	sprintf	 ;
	jmp	.L54	 ;
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp	 ;
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$116, %r8d	 ;,
 ; D:/TC/src/tac.c:269: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp100, arg
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp101, status
	pushq	%rsi	 ;
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rdi, %r9	 ; status,
 ; D:/TC/src/tac.c:269: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_1(D)->type, arg_1(D)->type
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp102, _4
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; _4, tmp95
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; _4->type, tmp95
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_19->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp103, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_19->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp95, MEM <vector(2) long unsigned int> [(void *)arg_19]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_6->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp104, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_6->arg1
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$23, 24(%rax)	 ;, inst_6->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_6->arg3
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rcx	 ; _7->instructions, _7->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:283: }
	leaq	-32(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC5:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC6:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC7:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC8:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC9:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC10:
	.ascii "arr\0"
	.align 8
.LC11:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC12:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC14:
	.ascii "[Warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.section	.text.unlikely,"x"
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4
	.globl	tac_variable_access
	.def	tac_variable_access;	.scl	2;	.type	32;	.endef
tac_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp375, variable_access
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp376, status
	andq	$-16, %rsp	 ;,
	subq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rcx), %ecx	 ; variable_access_138(D)->type,
	testl	%ecx, %ecx	 ;
	jne	.L75	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rsi), %rcx	 ; variable_access_138(D)->content.name, _2
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L75	 ;,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, _3
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp266
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp266
	jbe	.L126	 ;,
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _3
	je	.L127	 ;,
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
.L125:
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rbx	 ; tmp381, _10
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _10, tmp273
	movhps	16(%rbx), %xmm0	 ;, tmp273
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp382, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp273,* <retval>
 ; D:/TC/src/tac.c:757:             return result;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L75:
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	movq	(%rsi), %rcx	 ; variable_access_138(D)->base, _11
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _11
	je	.L128	 ;,
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_variable_access	 ;
	movq	%rax, %r12	 ; tmp384, base
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; base
	je	.L83	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _14->is_get
	jne	.L129	 ;,
.L82:
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rsi), %edi	 ; variable_access_138(D)->type, _17
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %edi	 ;, _17
	je	.L130	 ;,
 ; D:/TC/src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %edi	 ;, _17
	je	.L131	 ;,
 ; D:/TC/src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %edi	 ;, _17
	jne	.L96	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%r12), %edi	 ; _148->kind, _73
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%edi, %edi	 ; _73
	je	.L132	 ;,
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rdi), %eax	 ;, tmp338
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	 ;, tmp338
	jbe	.L99	 ;,
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r12), %rax	 ; _148->type, _74
.L98:
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rbx	 ; prephitmp_127->name, _87
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movl	%edi, %r8d	 ; _73,
	leaq	.LC13(%rip), %rdx	 ;, tmp340
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rcx	 ; _88->_stderr, _88->_stderr
	movq	%rbx, %r9	 ; _87,
	call	fprintf	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r12), %rax	 ; _148->type, _18
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _18->kind, _19
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp279
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp279
	jbe	.L133	 ;,
 ; D:/TC/src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _18->ast_node.scope, scope
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _19
	jne	.L86	 ;,
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_211].class_scope, scope
.L86:
 ; D:/TC/src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rsi), %rax	 ; variable_access_138(D)->content.attr_name, variable_access_138(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _24->name, _24->name
	call	search_name_use_strcmp	 ;
	movq	%rax, %rdi	 ; tmp388, attr
 ; D:/TC/src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	je	.L134	 ;,
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	 ; attr_214->kind, _32
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _32
	je	.L135	 ;,
 ; D:/TC/src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _32
	je	.L136	 ;,
 ; D:/TC/src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _32
	jne	.L137	 ;,
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rdi), %rdx	 ; attr_214->type, attr_214->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %r13	 ; tmp396, _50
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; _50, tmp303
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; _50->type, tmp303
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_351->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp397, <retval>
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp303, MEM <vector(2) long unsigned int> [(void *)arg_351]
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rsi), %rcx	 ; variable_access_138(D)->content.attr_name, _51
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_351->kind
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _51->type, _51->type
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r13	 ; tmp398, _53
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; _53, tmp306
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; _53->type, tmp306
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_338->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp399, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_338->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp306, MEM <vector(2) long unsigned int> [(void *)arg_338]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; base, inst_240->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp400, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$15, 24(%rax)	 ;, inst_240->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_240->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_240->arg3
 ; D:/TC/src/tac.c:799:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_139(D)->current_block, status_139(D)->current_block
	movq	8(%rax), %rcx	 ;, _55->instructions
	call	list_append	 ;
.L74:
 ; D:/TC/src/tac.c:862: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
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
.L127:
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L129:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; base,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp386, base
 ; D:/TC/src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	jne	.L82	 ;,
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	24(%rax), %r9	 ; _15->_stderr,
	leaq	.LC5(%rip), %rcx	 ;, tmp278
	call	fwrite	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%r12), %rax	 ; _148->type, _74
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %edx	 ; _74->kind,
	testl	%edx, %edx	 ;
	jne	.L98	 ;,
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ;, tmp329
	movq	8(%rax), %rcx	 ; _74->name, _74->name
	movq	(%rdx), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp409, _78
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r12), %rax	 ; _148->type, _148->type
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _79->ast_node.class, _79->ast_node.class
	movq	16(%rax), %rcx	 ; _80->class_scope, _80->class_scope
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_156->type, attr_156->type
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp410, attr
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdi	 ; tmp411, _83
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rdi, %xmm0	 ; _83, tmp336
	movhps	16(%rdi), %xmm0	 ; _83->type, tmp336
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	 ;, arg_380->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp412, base
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_380->is_get
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp336, MEM <vector(2) long unsigned int> [(void *)arg_380]
.L99:
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%r12)	 ;, base_451->kind
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	movq	%rax, 56(%rsp)	 ; tmp414, %sfp
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	je	.L100	 ;,
.L102:
 ; D:/TC/src/tac.c:834:         long long arg_count = 0;
	xorl	%r13d, %r13d	 ; arg_count
.L101:
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rsi), %rcx	 ; variable_access_138(D)->content.args, variable_access_138(D)->content.args
	call	list_copy	 ;
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %r15	 ;, tmp374
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	%rax, 48(%rsp)	 ; tmp424, %sfp
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L105	 ;
	.p2align 4,,10
	.p2align 3
.L107:
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rsi), %rcx	 ; _424->type, _424->type
 ; D:/TC/src/tac.c:848:             arg_count++;
	addq	$1, %r13	 ;, arg_count
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, %rdi	 ; tmp427, _113
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_409->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp428, arg
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rdi, (%rax)	 ; _113, arg_409->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%r15), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r14)	 ;, arg_409->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r14)	 ; name_int, arg_409->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_243->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp429, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	 ; arg, inst_243->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; _111, inst_243->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_243->arg3
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	list_append	 ;
.L105:
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp430, arg_expr
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L109	 ;,
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp425, _111
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _111
	je	.L106	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _111->is_get
	je	.L107	 ;,
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _111,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp426, _111
	jmp	.L107	 ;
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%r12), %rax	 ; _148->type, _148->type
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC10(%rip), %rdx	 ;, tmp315
	movq	8(%rax), %rcx	 ; _57->name, _57->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp401
	jne	.L138	 ;,
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rsi), %rcx	 ; variable_access_138(D)->content.index, variable_access_138(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r13	 ; tmp403, _66
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _66
	je	.L95	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _66->is_get
	jne	.L139	 ;,
.L94:
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	.refptr.name_int(%rip), %rax	 ;, tmp323
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; name_int, name_int
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp406, _70
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; _70, tmp325
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; _70->type, tmp325
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_367->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp407, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_367->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp325, MEM <vector(2) long unsigned int> [(void *)arg_367]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; base, inst_241->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp408, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_241->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	 ; _66, inst_241->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$16, 24(%rax)	 ;, inst_241->type
 ; D:/TC/src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_139(D)->current_block, status_139(D)->current_block
	movq	8(%rax), %rcx	 ;, _71->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:823:         return temp;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L110:
 ; D:/TC/src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	 ; status_139(D)->current_block, status_139(D)->current_block
	movq	8(%rax), %rcx	 ; _118->instructions, _118->instructions
	call	list_append	 ;
.L109:
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rdx	 ; tmp431, arg
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	 ; arg
	jne	.L110	 ;,
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; base_451->type, base_451->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp432, _121
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; _121, tmp363
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; _121->type, tmp363
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_438->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp433, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_438->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp363, MEM <vector(2) long unsigned int> [(void *)arg_438]
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r13, (%rax)	 ; arg_count, arg_425->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp434, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_425->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp365
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rsi)	 ;, arg_425->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rsi)	 ; name_int, arg_425->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; base, inst_244->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp435, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_244->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_244->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$22, 24(%rax)	 ;, inst_244->type
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	 ; status_139(D)->current_block, status_139(D)->current_block
	movq	8(%rax), %rcx	 ;, _123->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:856:         return temp;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L137:
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rax	 ; _148->type, _148->type
	movq	8(%rax), %rdi	 ; _43->name, _44
	movq	8(%rsi), %rax	 ; variable_access_138(D)->content.attr_name, variable_access_138(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _45->name, _46
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rdi, %r9	 ; _44,
	leaq	.LC9(%rip), %rdx	 ;, tmp301
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _47->_stderr, _47->_stderr
	movq	%rbx, %r8	 ; _46,
	call	fprintf	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L128:
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %r9	 ; _12->_stderr,
	leaq	.LC4(%rip), %rcx	 ;, tmp276
	call	fwrite	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L126:
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L124:
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp391, _40
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _40, tmp293
	movhps	16(%rbx), %xmm0	 ;, tmp293
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp392, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp293,* <retval>
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L96:
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%edi, %r8d	 ; _17,
	leaq	.LC14(%rip), %rdx	 ;, tmp370
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rcx	 ; _125->_stderr, _125->_stderr
	call	fprintf	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%r12), %rax	 ; _148->value.variable, _148->value.variable
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	 ; _60->original_name, _60->original_name
	movq	8(%rax), %rbx	 ; _61->name, _62
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	leaq	.LC11(%rip), %rdx	 ;, tmp319
	movq	24(%rax), %rcx	 ; _63->_stderr, _63->_stderr
	movq	%rbx, %r8	 ; _62,
	call	fprintf	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rax	 ; _148->type, _148->type
	movq	8(%rax), %r12	 ; _33->name, _34
	movq	8(%rsi), %rax	 ; variable_access_138(D)->content.attr_name, variable_access_138(D)->content.attr_name
	movq	8(%rax), %rsi	 ; _35->name, _36
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%r12, %r9	 ; _34,
	leaq	.LC8(%rip), %rdx	 ;, tmp291
	movq	24(%rax), %rcx	 ; _37->_stderr, _37->_stderr
	movq	%rsi, %r8	 ; _36,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_214->type, attr_214->type
	movq	%rbx, %r9	 ; status,
	movq	%rdi, %rcx	 ; attr,
	movl	$102, %r8d	 ;,
	jmp	.L124	 ;
	.p2align 4,,10
	.p2align 3
.L139:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _66,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r13	 ; tmp405, _66
 ; D:/TC/src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	 ; _66
	jne	.L94	 ;,
.L95:
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	24(%rax), %r9	 ; _67->_stderr,
	leaq	.LC12(%rip), %rcx	 ;, tmp322
	call	fwrite	 ;
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L136:
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_214->type, attr_214->type
	movq	%rbx, %r9	 ; status,
	movq	%rdi, %rcx	 ; attr,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp393, _42
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _42, tmp296
	movhps	16(%rbx), %xmm0	 ;, tmp296
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	 ;, arg_325->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp394, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp296,* <retval>
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L100:
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp341
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	8(%r12), %rax	 ; base_451->type, base_451->type
	movq	8(%rax), %rcx	 ; _92->name, _92->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp415, _94
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%r12), %rax	 ; base_451->value.subroutine, base_451->value.subroutine
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _95->original_name, _95->original_name
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rcx	 ; _96->name, _96->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; tmp416
	je	.L102	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	(%rsi), %rax	 ; variable_access_138(D)->base, variable_access_138(D)->base
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
	movq	%rax, %r8	 ;, tmp417
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	create_expression	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rcx	 ; tmp418, _102
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	 ;
	movq	%rax, %r14	 ; tmp419, _103
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _103
	je	.L103	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _103->is_get
	jne	.L140	 ;,
.L104:
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%r14), %rcx	 ; _408->type, _408->type
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, %r15	 ; tmp421, _105
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r15, (%rax)	 ; _105, arg_393->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp422, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_393->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp354
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_393->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%r13)	 ; name_int, arg_393->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_242->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp423, inst
 ; D:/TC/src/tac.c:840:             arg_count++;
	movl	$1, %r13d	 ;, arg_count
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_242->type
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _103, inst_242->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_242->arg3
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	list_append	 ;
	jmp	.L101	 ;
	.p2align 4,,10
	.p2align 3
.L133:
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _21
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	leaq	.LC6(%rip), %rdx	 ;, tmp281
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	movq	%rbx, %r8	 ; _21,
	call	fprintf	 ;
	jmp	.L74	 ;
.L134:
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rax	 ; _148->type, _148->type
	movq	8(%rax), %rdi	 ; _26->name, _27
	movq	8(%rsi), %rax	 ; variable_access_138(D)->content.attr_name, variable_access_138(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _28->name, _29
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rdi, %r9	 ; _27,
	leaq	.LC7(%rip), %rdx	 ;, tmp287
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _30->_stderr, _30->_stderr
	movq	%rbx, %r8	 ; _29,
	call	fprintf	 ;
	jmp	.L74	 ;
.L140:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _103,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp420, _103
	jmp	.L104	 ;
	.section	.text.unlikely,"x"
	.def	tac_variable_access.cold;	.scl	3;	.type	32;	.endef
tac_variable_access.cold:
.L106:
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _395
	ud2	
.L103:
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _452
	ud2	
	.text
	.section	.text.unlikely,"x"
.LCOLDE15:
	.text
.LHOTE15:
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "[Warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC18:
	.ascii "[Warning] Unsupported primary type for tac_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4
	.globl	tac_primary
	.def	tac_primary;	.scl	2;	.type	32;	.endef
tac_primary:
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
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_38(D)->type,
 ; D:/TC/src/tac.c:679: Arg* tac_primary(Primary* primary, TACStatus* status) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L142	 ;,
	leaq	.L144(%rip), %r8	 ;, tmp139
	movq	%rdx, %rsi	 ; tmp186, status
	movslq	(%r8,%rbx,4), %rax	 ;, tmp141
	addq	%r8, %rax	 ; tmp139, tmp142
	jmp	*%rax	 ; tmp142
	.section .rdata,"dr"
	.align 4
.L144:
	.long	.L152-.L144
	.long	.L151-.L144
	.long	.L150-.L144
	.long	.L149-.L144
	.long	.L148-.L144
	.long	.L147-.L144
	.long	.L146-.L144
	.long	.L145-.L144
	.long	.L143-.L144
	.text
	.p2align 4,,10
	.p2align 3
.L145:
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %rdi	 ; tmp199, _15
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _15
	je	.L155	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _15->is_get
	jne	.L165	 ;,
.L156:
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rdi), %rdx	 ; _202->type, _202->type
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %r12	 ; tmp201, _17
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	 ; _17, tmp167
	movhps	16(%r12), %xmm0	 ; _17->type, tmp167
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %r12	 ;, tmp169
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_187->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp202, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_187->kind
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp167, MEM <vector(2) long unsigned int> [(void *)arg_187]
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	8(%rdi), %rax	 ; _202->type, _18
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	cmpq	(%r12), %rax	 ; name_int, _18
	je	.L166	 ;,
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %r13	 ;, tmp172
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	cmpq	0(%r13), %rax	 ; name_float, _18
	je	.L167	 ;,
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	leaq	.LC17(%rip), %rdx	 ;, tmp177
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
 ; D:/TC/src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L143:
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.var
 ; D:/TC/src/tac.c:742: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	 ;
	.p2align 4,,10
	.p2align 3
.L152:
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	xorl	%edx, %edx	 ;
	call	strtoll	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rsi	 ; tmp187, _3
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; _3, arg_106->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp188, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_106->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp145
	movq	(%rax), %rax	 ;, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int,
.L141:
 ; D:/TC/src/tac.c:742: }
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
.L151:
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movapd	%xmm0, %xmm6	 ; tmp189, _5
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm6, (%rax)	 ; _5, arg_119->value.float_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp190, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_119->kind
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp148
	movq	(%rax), %rax	 ;, name_float
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	%rax, 8(%rbx)	 ; name_float,
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L150:
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %xmm6	 ; primary_38(D)->value.literal_value, _6
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$3, 16(%rax)	 ;, arg_132->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp191, <retval>
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movdqa	%xmm6, %xmm0	 ; _6, tmp150
	movq	.refptr.name_string(%rip), %rax	 ;, tmp151
	movhps	(%rax), %xmm0	 ; name_string, tmp150
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rbx)	 ; tmp150, MEM <vector(2) long unsigned int> [(void *)arg_132]
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L149:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	 ;, arg_145->value.bool_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp192, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_145->kind
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp153
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L148:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	 ;, arg_158->value.bool_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp193, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_158->kind
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp155
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
 ; D:/TC/src/tac.c:742: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	 ;
	.p2align 4,,10
	.p2align 3
.L146:
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
	movq	%rax, %r12	 ; tmp194, _9
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _9
	je	.L154	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L168	 ;,
.L154:
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp159
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; name_bool, name_bool
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp196, _11
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; _11, tmp161
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; _11->type, tmp161
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_171->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp197, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_171->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp161, MEM <vector(2) long unsigned int> [(void *)arg_171]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; _9, inst_88->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp198, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_88->arg1
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$13, 24(%rax)	 ;, inst_88->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_88->arg3
 ; D:/TC/src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _12->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:713:             return temp;
	jmp	.L141	 ;
.L142:
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC18(%rip), %rdx	 ;, tmp182
 ; D:/TC/src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L167:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_216->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp205, arg
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	.LC16(%rip), %rax	 ;, tmp213
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_216->is_get
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	%rax, (%r12)	 ; tmp213, arg_216->value.float_value
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	0(%r13), %rax	 ; name_float, name_float
	movq	%rax, 8(%r12)	 ; name_float, arg_216->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$2, 24(%rax)	 ;, inst_90->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp206, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_90->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_90->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; _15,
.L158:
 ; D:/TC/src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:732:             return temp;
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L165:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _15,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp200, _15
	jmp	.L156	 ;
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _9,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp195, _9
	jmp	.L154	 ;
	.p2align 4,,10
	.p2align 3
.L166:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_203->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp203, arg
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_203->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%r12), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_203->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r13)	 ; name_int, arg_203->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$1, 24(%rax)	 ;, inst_89->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp204, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_89->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_89->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; _15,
	jmp	.L158	 ;
	.section	.text.unlikely,"x"
	.def	tac_primary.cold;	.scl	3;	.type	32;	.endef
tac_primary.cold:
.L155:
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _305
	ud2	
	.text
	.section	.text.unlikely,"x"
.LCOLDE19:
	.text
.LHOTE19:
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "[Warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp146, status
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp145, expression
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	je	.L190	 ;,
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp147, <retval>
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L171	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _4->is_get
	jne	.L191	 ;,
.L171:
 ; D:/TC/src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbx), %eax	 ; expression_31(D)->operator,
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rbx), %rcx	 ; expression_31(D)->expr_left, pretmp_113
	cmpl	$18, %eax	 ;, _5
	ja	.L172	 ;,
	leaq	CSWTCH.21(%rip), %rdx	 ;, tmp126
	movl	(%rdx,%rax,4), %r13d	 ; CSWTCH.21[_5], _53
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp149, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbx), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp128
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp128
	ja	.L173	 ;,
 ; D:/TC/src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	 ;, _53
	jne	.L179	 ;,
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	 ; left_45->kind,
	testl	%eax, %eax	 ;
	jne	.L192	 ;,
.L176:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_56->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; left, inst_56->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_56->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_56->arg3
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%r12)	 ;, left_45->is_get
	jne	.L193	 ;,
.L177:
 ; D:/TC/src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:678: }
	leaq	-48(%rbp), %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L172:
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	 ;, _53
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp161, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbx), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp143
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp143
	ja	.L173	 ;,
.L179:
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; left_125->type, left_125->type
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp150, _9
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _9, tmp131
	movhps	16(%r14), %xmm0	 ; _9->type, tmp131
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_85->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp151, arg
 ; D:/TC/src/tac.c:282:     return arg;
	movq	%r12, %r14	 ; left, _83
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_85->kind
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp131, MEM <vector(2) long unsigned int> [(void *)arg_85]
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%r12)	 ;, left_125->is_get
	jne	.L194	 ;,
.L175:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _83, inst_55->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp153, inst
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_55->arg3
 ; D:/TC/src/tac.c:663:             right = temp;
	movq	%rbx, %rsi	 ; arg, <retval>
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _53, inst_55->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; arg, inst_55->arg1
 ; D:/TC/src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	 ; left_45->kind,
	testl	%eax, %eax	 ;
	je	.L176	 ;,
.L192:
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp136
	movq	24(%rax), %r9	 ; _14->_stderr,
	call	fwrite	 ;
	jmp	.L176	 ;
	.p2align 4,,10
	.p2align 3
.L173:
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; left_127->type, left_127->type
	xorl	%ecx, %ecx	 ;
	movq	%rdi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp157, _18
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _18, tmp138
	movhps	16(%r14), %xmm0	 ; _18->type, tmp138
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_101->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp158, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_101->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp138, MEM <vector(2) long unsigned int> [(void *)arg_101]
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%r12)	 ;, left_127->is_get
	jne	.L195	 ;,
.L178:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_58->arg3
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp160, inst
 ; D:/TC/src/tac.c:673:         right = temp;
	movq	%rbx, %rsi	 ; arg, <retval>
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _53, inst_58->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; arg, inst_58->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; left, inst_58->arg2
	jmp	.L177	 ;
	.p2align 4,,10
	.p2align 3
.L190:
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; D:/TC/src/tac.c:678: }
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
	.p2align 4,,10
	.p2align 3
.L193:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$24, 24(%rax)	 ;, inst_57->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp156, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; left, inst_57->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_57->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_57->arg3
	jmp	.L177	 ;
	.p2align 4,,10
	.p2align 3
.L191:
	movq	%rdi, %rdx	 ; status,
	movq	%rax, %rcx	 ; <retval>,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp148, <retval>
	jmp	.L171	 ;
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%r12, %rcx	 ; left,
	movq	%rdi, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp159, left
	jmp	.L178	 ;
	.p2align 4,,10
	.p2align 3
.L194:
	movq	%rdi, %rdx	 ; status,
	movq	%r12, %rcx	 ; left,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp152, _83
	jmp	.L175	 ;
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "Error: create_attribute received NULL table\12\0"
	.align 8
.LC22:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.text
	.p2align 4
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp140, variable
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp141, status
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:403:     if (is_attr) {
	testb	%r8b, %r8b	 ; tmp142
	je	.L197	 ;,
 ; D:/TC/src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	(%rax), %rcx	 ; _1->attribute_tables, _1->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rdi	 ; tmp143, attr_table
 ; D:/TC/src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_12(D)->tac, status_12(D)->tac
	movq	%rdi, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	call	list_append	 ;
 ; D:/TC/src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rsi), %r12	 ; variable_11(D)->type, _5
	movq	8(%rsi), %r13	 ; variable_11(D)->name, _6
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%r12, %rdx	 ; _5,
	movq	%r13, %rcx	 ; _6,
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rsi	 ; tmp144, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm1	 ; _5, _5
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rsi)	 ;, attr_17->offset
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	 ; tmp145, tmp126
	punpcklqdq	%xmm1, %xmm0	 ; _5, tmp126
	movups	%xmm0, (%rsi)	 ; tmp126, MEM <vector(2) long unsigned int> [(void *)attr_17]
 ; D:/TC/src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%rdi, %rdi	 ; attr_table
	jne	.L212	 ;,
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp129
	movq	24(%rax), %r9	 ; _26->_stderr,
	call	fwrite	 ;
.L199:
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp131
	movq	24(%rax), %r9	 ; _29->_stderr,
 ; D:/TC/src/tac.c:421: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fwrite	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rdi), %rax	 ; attr_table_14->size, attr_table_14->size
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%r12, %rcx	 ; _5,
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rsi)	 ; attr_table_14->size, attr_17->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%rdi), %rcx	 ; attr_table_14->attributes, _28
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rdi)	 ; tmp146, attr_table_14->size
 ; D:/TC/src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _28
	je	.L199	 ;,
.L211:
 ; D:/TC/src/tac.c:421: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L197:
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	(%rcx), %rdx	 ; variable_11(D)->type, variable_11(D)->type
	movq	8(%rcx), %rcx	 ; variable_11(D)->name, variable_11(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rsi), %rcx	 ; variable_11(D)->value, _34
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	%rax, %rdi	 ; tmp149, var
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	testq	%rcx, %rcx	 ; _34
	je	.L201	 ;,
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp150, arg
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; arg
	je	.L202	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _35->is_get
	jne	.L213	 ;,
.L202:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp136
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_33->type, tmp136
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_59->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp153, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_59->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp136, MEM <vector(2) long unsigned int> [(void *)arg_59]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg, inst_39->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp154, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_39->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_39->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_39->arg3
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	 ; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rcx	 ; _41->instructions, _41->instructions
	jmp	.L211	 ;
	.p2align 4,,10
	.p2align 3
.L201:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_46->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp152, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_46->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp134
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rsi)	 ;, arg_46->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rsi)	 ; name_int, arg_46->type
	jmp	.L202	 ;
	.p2align 4,,10
	.p2align 3
.L213:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; arg,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp151, arg
	jmp	.L202	 ;
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp188, if_
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp189, status
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	subq	$72, %rsp	 ;,
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp190, then_label
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
 ; D:/TC/src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp191, else_label
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp192
	je	.L217	 ;,
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp194
	jne	.L246	 ;,
.L217:
 ; D:/TC/src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, 56(%rsp)	 ; tmp193, %sfp
.L216:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_194->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp195, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_194->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	56(%rsp), %rax	 ; %sfp, end_label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_194->is_get
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r14), %rcx	 ; if__63(D)->condition, if__63(D)->condition
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, 0(%r13)	 ; end_label, arg_194->value.label
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	 ;
	movq	%rax, %r15	 ; tmp196, _6
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _6
	je	.L218	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _6->is_get
	jne	.L247	 ;,
.L218:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_178->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp198, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_178->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; else_label, arg_178->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_178->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; then_label, arg_165->value.label
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp199, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_165->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_165->type
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_165->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp200, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_133->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	 ; arg, inst_133->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_133->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; _6, inst_133->arg1
 ; D:/TC/src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; then_label, block_163->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp201, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp202, block_163->instructions
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:483:     status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_58(D)->current_block
 ; D:/TC/src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rcx	 ; if__63(D)->body, if__63(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp203, then_statements
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L219	 ;
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:/TC/src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L219:
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp204, statement
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L220	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_134->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp205, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_134->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_134->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_134->arg3
 ; D:/TC/src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _14->instructions, _14->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp206
	je	.L248	 ;,
.L221:
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp225
	je	.L249	 ;,
.L229:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp231, block
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	56(%rsp), %rax	 ; %sfp, end_label
	movq	%rax, (%rsi)	 ; end_label, block_242->label
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp232, block_242->instructions
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _42->blocks, _42->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:543:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_58(D)->current_block
 ; D:/TC/src/tac.c:545: }
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
.L246:
 ; D:/TC/src/tac.c:472:         end_label = else_label;
	movq	%rsi, 56(%rsp)	 ; else_label, %sfp
	jmp	.L216	 ;
	.p2align 4,,10
	.p2align 3
.L249:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; else_label, block_240->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp226, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp227, block_240->instructions
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _37->blocks, _37->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:530:         status->current_block = else_block;
	movq	%rdi, 16(%rbx)	 ; block, status_58(D)->current_block
 ; D:/TC/src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp228, else_statements
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L230	 ;
	.p2align 4,,10
	.p2align 3
.L231:
 ; D:/TC/src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L230:
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp229, else_statement
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L231	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_137->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp230, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_137->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_137->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_137->arg3
 ; D:/TC/src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _40->instructions, _40->instructions
	call	list_append	 ;
	jmp	.L229	 ;
	.p2align 4,,10
	.p2align 3
.L248:
 ; D:/TC/src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rcx	 ; if__63(D)->else_if, if__63(D)->else_if
	call	list_copy	 ;
	movq	%rax, 40(%rsp)	 ; tmp207, %sfp
	.p2align 4,,10
	.p2align 3
.L222:
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp224, elif
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L221	 ;,
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; else_label, block_210->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp208, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp209, block_210->instructions
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _19->blocks, _19->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:501:             status->current_block = else_if_block;
	movq	%rdi, 16(%rbx)	 ; block, status_58(D)->current_block
 ; D:/TC/src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	xorl	%edx, %edx	 ;
	movl	$98, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp210, then_label
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	0(%rbp), %rcx	 ; elif_90->condition, elif_90->condition
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp211, else_label
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp212, _22
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _22
	je	.L223	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _22->is_get
	jne	.L250	 ;,
.L223:
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp214
	jne	.L251	 ;,
.L225:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_227->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	 ; tmp216, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_227->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; else_label, arg_227->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_227->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_214->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_214->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; then_label, arg_214->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_214->is_get
	movq	%rax, 48(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	48(%rsp), %r9	 ; %sfp, arg
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp218, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; _22, inst_135->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r9, 8(%rax)	 ; arg, inst_135->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_135->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	 ; arg, inst_135->arg3
 ; D:/TC/src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _28->instructions, _28->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; then_label, block_212->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp219, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp220, block_212->instructions
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _30->blocks, _30->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:514:             status->current_block = then_block;
	movq	%rdi, 16(%rbx)	 ; block, status_58(D)->current_block
 ; D:/TC/src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rbp), %rcx	 ; elif_90->body, elif_90->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp221, elif_statements
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L226	 ;
	.p2align 4,,10
	.p2align 3
.L227:
 ; D:/TC/src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L226:
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp222, elif_statement
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L227	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_136->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp223, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_136->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_136->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_136->arg3
 ; D:/TC/src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rcx	 ; _33->instructions, _33->instructions
	call	list_append	 ;
	jmp	.L222	 ;
	.p2align 4,,10
	.p2align 3
.L251:
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__63(D)->else_body, if__63(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	 ; tmp215
	cmovne	56(%rsp), %rsi	 ; else_label,, %sfp, else_label
	jmp	.L225	 ;
	.p2align 4,,10
	.p2align 3
.L250:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _22,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp213, _22
	jmp	.L223	 ;
.L247:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _6,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r15	 ; tmp197, _6
	jmp	.L218	 ;
	.section .rdata,"dr"
	.align 8
.LC23:
	.ascii "[Warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC24:
	.ascii "[Warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC25:
	.ascii "[Warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.p2align 4
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_34(D)->type,
 ; D:/TC/src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L253	 ;,
	movq	%rdx, %rdi	 ; tmp153, status
	leaq	.L255(%rip), %rdx	 ;, tmp122
	movq	%rcx, %rsi	 ; tmp152, statement
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp124
	addq	%rdx, %rax	 ; tmp122, tmp125
	jmp	*%rax	 ; tmp125
	.section .rdata,"dr"
	.align 4
.L255:
	.long	.L262-.L255
	.long	.L261-.L255
	.long	.L260-.L255
	.long	.L259-.L255
	.long	.L258-.L255
	.long	.L257-.L255
	.long	.L256-.L255
	.long	.L254-.L255
	.text
	.p2align 4,,10
	.p2align 3
.L256:
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rdi), %rcx	 ; status_35(D)->end_labels, status_35(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp159
	jne	.L265	 ;,
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rdi), %rax	 ; status_35(D)->end_labels, status_35(D)->end_labels
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _14->tail, _14->tail
	movq	8(%rax), %rbx	 ; _15->content, label
 ; D:/TC/src/tac.c:440:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	je	.L265	 ;,
.L285:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp160, inst
	jmp	.L283	 ;
	.p2align 4,,10
	.p2align 3
.L254:
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rdi), %rcx	 ; status_35(D)->start_labels, status_35(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp162
	jne	.L266	 ;,
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rdi), %rax	 ; status_35(D)->start_labels, status_35(D)->start_labels
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _22->tail, _22->tail
	movq	8(%rax), %rbx	 ; _23->content, label
 ; D:/TC/src/tac.c:451:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	jne	.L285	 ;,
.L266:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp149
	movq	24(%rax), %r9	 ; _26->_stderr,
	jmp	.L284	 ;
	.p2align 4,,10
	.p2align 3
.L260:
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_34(D)->stmt.if_stmt, statement_34(D)->stmt.if_stmt
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	 ;
	.p2align 4,,10
	.p2align 3
.L262:
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rcx), %rcx	 ; statement_34(D)->stmt.expr, statement_34(D)->stmt.expr
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _3
	je	.L252	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _3->is_get
	jne	.L286	 ;,
.L252:
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L261:
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	(%rcx), %rcx	 ; statement_34(D)->stmt.var, statement_34(D)->stmt.var
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	%rdi, %rdx	 ; status,
	xorl	%r8d, %r8d	 ;
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	tac_variable	 ;
	.p2align 4,,10
	.p2align 3
.L258:
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_34(D)->stmt.for_stmt, statement_34(D)->stmt.for_stmt
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	 ;
	.p2align 4,,10
	.p2align 3
.L257:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:249:             arg->value.string_value = NULL;
	movq	$0, (%rax)	 ;, arg_81->value.string_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp155, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$5, 16(%rax)	 ;, arg_81->kind
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp132
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_81->is_get
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_34(D)->stmt.return_expr, _8
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	(%rax), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_81->type
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _8
	je	.L264	 ;,
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp156, arg
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; arg
	je	.L264	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L287	 ;,
.L264:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$21, 24(%rax)	 ;, inst_60->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp158, inst
.L283:
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_35(D)->current_block, status_35(D)->current_block
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rdx)	 ; label,* inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rdx)	 ;,
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rdx)	 ;,
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rcx	 ;, _16->instructions
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L259:
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_34(D)->stmt.while_stmt, statement_34(D)->stmt.while_stmt
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:464: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	 ;
	.p2align 4,,10
	.p2align 3
.L265:
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp142
	movq	24(%rax), %r9	 ; _18->_stderr,
.L284:
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	jmp	fwrite	 ;
.L253:
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC25(%rip), %rdx	 ;, tmp151
	movq	24(%rax), %rcx	 ; _28->_stderr, _28->_stderr
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:460:             fprintf(stderr, "[Warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L287:
	movq	%rdi, %rdx	 ; status,
	movq	%rax, %rcx	 ; arg,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rbx	 ; tmp157, arg
	jmp	.L264	 ;
	.p2align 4,,10
	.p2align 3
.L286:
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	movq	%rdi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _3,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	jmp	load_rvalue.part.0	 ;
	.p2align 4
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp178, for_
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp179, status
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__55(D)->initializer, _1
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L289	 ;,
 ; D:/TC/src/tac.c:550:         tac_variable(for_->initializer, status, false);
	xorl	%r8d, %r8d	 ;
	call	tac_variable	 ;
.L289:
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
	movq	%rax, %rbp	 ; tmp180, condition_label
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp181, body_label
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__55(D)->condition
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp182, end_label
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	je	.L290	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp183, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_181->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_181->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp184, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_115->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_115->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_115->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_115->arg3
 ; D:/TC/src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _4->instructions, _4->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; condition_label, block_179->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp185, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp186, block_179->instructions
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _6->blocks, _6->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:561:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rdi), %rcx	 ; for__55(D)->condition, for__55(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r15	 ; tmp187, _9
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _9
	je	.L291	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L312	 ;,
.L291:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_163->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp189, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_163->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; end_label, arg_163->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_163->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_150->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp190, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_150->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_150->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_150->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_114->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp191, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_114->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; _9, inst_114->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_114->arg3
 ; D:/TC/src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ;, _12->instructions
	call	list_append	 ;
.L292:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; body_label, block_207->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp194, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp195, block_207->instructions
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _17->blocks, _17->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:574:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__55(D)->increment
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	 ; tmp196, increment_label
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	je	.L293	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp197, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_209->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_209->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; increment_label, arg_209->value.label
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	list_append	 ;
.L294:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_248->is_get
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_56(D)->end_labels, status_56(D)->end_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp200, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_248->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_248->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; end_label, arg_248->value.label
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__55(D)->body, for__55(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp201, body_statements
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L296	 ;
	.p2align 4,,10
	.p2align 3
.L297:
 ; D:/TC/src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L296:
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp202, statement
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L297	 ;,
 ; D:/TC/src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_56(D)->end_labels, status_56(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__55(D)->increment
	je	.L299	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_266->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp203, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_266->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; increment_label, arg_266->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_266->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp204, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_117->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_117->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_117->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_117->arg3
 ; D:/TC/src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _34->instructions, _34->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	 ; increment_label, block_264->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp205, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp206, block_264->instructions
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _36->blocks, _36->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:596:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rdi), %rcx	 ; for__55(D)->increment, for__55(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _39
	je	.L299	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _39->is_get
	jne	.L313	 ;,
.L299:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_279->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp208, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_279->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_279->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_279->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__55(D)->condition
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_118->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp209, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_118->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_118->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_118->arg3
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	je	.L314	 ;,
.L301:
 ; D:/TC/src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _43->instructions, _43->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; end_label, block_305->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp212, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp213, block_305->instructions
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _45->blocks, _45->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:607:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:609: }
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
.L293:
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__55(D)->condition
	je	.L295	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp198, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_222->value.label
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
	jmp	.L294	 ;
	.p2align 4,,10
	.p2align 3
.L290:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_194->value.label
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp192, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_194->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_116->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp193, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_116->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_116->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_116->arg3
 ; D:/TC/src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ;, _15->instructions
	call	list_append	 ;
	jmp	.L292	 ;
	.p2align 4,,10
	.p2align 3
.L313:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _39,
	call	load_rvalue.part.0	 ;
	jmp	.L299	 ;
	.p2align 4,,10
	.p2align 3
.L314:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_292->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp210, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_292->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_292->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_292->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_119->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp211, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_119->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_119->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_119->arg3
	jmp	.L301	 ;
	.p2align 4,,10
	.p2align 3
.L295:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_56(D)->start_labels, status_56(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp199, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_235->value.label
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
	jmp	.L294	 ;
	.p2align 4,,10
	.p2align 3
.L312:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _9,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r15	 ; tmp188, _9
	jmp	.L291	 ;
	.p2align 4
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp142, while_
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp143, status
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp144, condition_label
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_146->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp145, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_146->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_146->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_146->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp146, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_70->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_70->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_70->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_70->arg3
 ; D:/TC/src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; condition_label, block_144->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp147, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp148, block_144->instructions
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:618:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; block, status_28(D)->current_block
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
	movq	%rax, %r13	 ; tmp149, body_label
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	(%rsi), %rcx	 ; while__41(D)->condition, while__41(D)->condition
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp150, end_label
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	tac_expression	 ;
	movq	%rax, %r15	 ; tmp151, _7
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _7
	je	.L316	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _7->is_get
	jne	.L323	 ;,
.L316:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_128->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp153, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_128->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; end_label, arg_128->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_128->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_115->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp154, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_115->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_115->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_115->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_69->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; arg, inst_69->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_69->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; _7, inst_69->arg1
 ; D:/TC/src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _10->instructions, _10->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; body_label, block_113->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r12	 ; tmp156, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r12, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	 ; tmp157, block_113->instructions
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _12->blocks, _12->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; block, status_28(D)->current_block
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_100->is_get
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_28(D)->start_labels, status_28(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp158, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_100->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_100->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_100->value.label
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_87->is_get
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_28(D)->end_labels, status_28(D)->end_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp159, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_87->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_87->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; end_label, arg_87->value.label
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__41(D)->body, while__41(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp160, body_statements
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L317	 ;
	.p2align 4,,10
	.p2align 3
.L318:
 ; D:/TC/src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L317:
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp161, statement
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L318	 ;,
 ; D:/TC/src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_28(D)->start_labels, status_28(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_28(D)->end_labels, status_28(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_161->value.label
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp162, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_161->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_161->type
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_161->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp163, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_71->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_71->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_71->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_71->arg3
 ; D:/TC/src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; end_label, block_159->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp164, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp165, block_159->instructions
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _24->blocks, _24->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:644:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_28(D)->current_block
 ; D:/TC/src/tac.c:646: }
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
.L323:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _7,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r15	 ; tmp152, _7
	jmp	.L316	 ;
	.p2align 4
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp114, function
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp115, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_39]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp116, subroutine
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp117, subroutine_39->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp118, subroutine_39->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp119, subroutine_39->blocks
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
 ; D:/TC/src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r12), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp120, parameters
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L325	 ;
	.p2align 4,,10
	.p2align 3
.L326:
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_39->parameters, subroutine_39->parameters
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp121, _8
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L325:
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L326	 ;,
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	 ; tmp123, _10
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; _10, block_43->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp124, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_39->blocks, subroutine_39->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp125, block_43->instructions
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:332:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:/TC/src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r12), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp126, statements
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L327	 ;
	.p2align 4,,10
	.p2align 3
.L328:
 ; D:/TC/src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L327:
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp127, statement
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L328	 ;,
 ; D:/TC/src/tac.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:341: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC26:
	.ascii "[Warning] Constructor '%s' does not start with 'self' initialization\12\0"
	.text
	.p2align 4
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp166, method
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp167, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_43(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_43(D)]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_43(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_83]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp168, subroutine
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp169, subroutine_83->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp170, subroutine_83->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp171, subroutine_83->blocks
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_46(D)->tac, status_46(D)->tac
 ; D:/TC/src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_46(D)->current_subroutine
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rcx	 ; method_43(D)->parameters, method_43(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp172, parameters
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L331	 ;
	.p2align 4,,10
	.p2align 3
.L332:
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_52->type, parameter_52->type
	movq	8(%rax), %rcx	 ; parameter_52->name, parameter_52->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_83->parameters, subroutine_83->parameters
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp173, _8
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L331:
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L332	 ;,
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	 ; tmp175, _10
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; _10, block_87->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp176, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_83->blocks, subroutine_83->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp177, block_87->instructions
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:356:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_46(D)->current_block
 ; D:/TC/src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r12), %rcx	 ; method_43(D)->body, method_43(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp178, statements
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp148
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_46(D)->current_class, status_46(D)->current_class
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _14->name, _14->name
	movq	8(%rax), %rcx	 ; _15->name, _15->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp179, _17
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%r12), %rax	 ; method_43(D)->name, method_43(D)->name
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _18->name, _18->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp180
	jne	.L336	 ;,
	jmp	.L339	 ;
	.p2align 4,,10
	.p2align 3
.L337:
 ; D:/TC/src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L336:
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp187, statement
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L337	 ;,
 ; D:/TC/src/tac.c:373:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_46(D)->current_subroutine
 ; D:/TC/src/tac.c:375: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L339:
 ; D:/TC/src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	8(%rax), %ecx	 ; stmt_62->type,
	testl	%ecx, %ecx	 ;
	jne	.L334	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; stmt_62->stmt.expr, _22
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	 ;, _22->operator
	jne	.L334	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _22->prim_left, _24
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	 ;, _24->type
	jne	.L334	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _24->value.var, _26
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	16(%rax), %edx	 ; _26->type,
	testl	%edx, %edx	 ;
	je	.L335	 ;,
.L334:
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	(%r12), %rax	 ; method_43(D)->name, method_43(D)->name
	movq	8(%rax), %rbx	 ; _28->name, _29
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:375: }
	movaps	32(%rsp), %xmm6	 ;,
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	leaq	.LC26(%rip), %rdx	 ;, tmp159
	movq	24(%rax), %rcx	 ; _30->_stderr, _30->_stderr
 ; D:/TC/src/tac.c:375: }
	leaq	-48(%rbp), %rsp	 ;,
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	%rbx, %r8	 ; _29,
 ; D:/TC/src/tac.c:375: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	jmp	fprintf	 ;
.L335:
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r14	 ; status_46(D)->current_class, _32
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r13	 ; _26->content.name, self
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp183, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_102->kind
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	24(%r14), %rax	 ; MEM[(long long int *)_32 + 24B], _104
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%r13, %rcx	 ; self,
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_102->is_get
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	0(%r13), %rdx	 ; self_63->type, self_63->type
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%r12)	 ; _104, arg_102->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp160
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%r12)	 ; name_int, arg_102->type
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %r14	 ; tmp184, _36
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _36, tmp163
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _36->type, tmp163
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_89->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp185, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_89->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp163, MEM <vector(2) long unsigned int> [(void *)arg_89]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_87->instructions, block_87->instructions
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$18, 24(%rax)	 ;, inst_77->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp186, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_77->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_77->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_77->arg3
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
	jmp	.L336	 ;
	.section .rdata,"dr"
	.align 8
.LC27:
	.ascii "[Warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.p2align 4
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC27(%rip), %r12	 ;, tmp108
 ; D:/TC/src/tac.c:376: void tac_class(Class* class, TACStatus* status) {
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp110, status
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp109, class
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:378:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_13(D)->current_class
 ; D:/TC/src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_14(D)->members, class_14(D)->members
	call	list_copy	 ;
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rbx), %xmm6	 ; class_14(D)->name, _2
 ; D:/TC/src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rsi	 ; tmp111, members
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp112, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_28->size
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rbx, %rdx	 ; table,
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp113, tmp101
	punpcklqdq	%xmm6, %xmm0	 ; _2, tmp101
	movups	%xmm0, (%rbx)	 ; tmp101, MEM <vector(2) long unsigned int> [(void *)table_28]
 ; D:/TC/src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_13(D)->tac, status_13(D)->tac
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	call	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L341:
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L349	 ;,
.L346:
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_22->type, _5
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	testl	%ebx, %ebx	 ; _5
	je	.L342	 ;,
	cmpl	$1, %ebx	 ;, _5
	je	.L343	 ;,
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:393:                 fprintf(stderr, "[Warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	%ebx, %r8d	 ; _5,
	movq	%r12, %rdx	 ; tmp108,
	movq	24(%rax), %rcx	 ; _9->_stderr, _9->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	jne	.L346	 ;,
.L349:
 ; D:/TC/src/tac.c:397:     status->current_class = NULL;
	movq	$0, 24(%rdi)	 ;, status_13(D)->current_class
 ; D:/TC/src/tac.c:399: }
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
.L343:
 ; D:/TC/src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rcx	 ; member_22->content.variable, member_22->content.variable
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:391:                 break;
	jmp	.L341	 ;
	.p2align 4,,10
	.p2align 3
.L342:
 ; D:/TC/src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_22->content.method, member_22->content.method
	movq	%rdi, %rdx	 ; status,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:388:                 break;
	jmp	.L341	 ;
	.section .rdata,"dr"
	.align 8
.LC28:
	.ascii "[Warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp106, tac
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rcx	 ; import_15(D)->name, _1
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rcx), %ebx	 ; _1->kind, _2
 ; D:/TC/src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L356	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp99
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp99
	jbe	.L357	 ;,
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L353	 ;,
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rcx), %rcx	 ; _1->ast_node.class, _1->ast_node.class
 ; D:/TC/src/tac.c:317: }
	addq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	%r8, %rdx	 ; status,
 ; D:/TC/src/tac.c:317: }
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	jmp	tac_class	 ;
	.p2align 4,,10
	.p2align 3
.L353:
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC28(%rip), %rdx	 ;, tmp104
	movq	24(%rax), %rcx	 ; _11->_stderr, _11->_stderr
 ; D:/TC/src/tac.c:317: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:315:         fprintf(stderr, "[Warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L357:
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L355:
	call	create_var	 ;
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rsi), %rcx	 ; tac_21(D)->global_vars, tac_21(D)->global_vars
 ; D:/TC/src/tac.c:317: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp109, _8
 ; D:/TC/src/tac.c:317: }
	popq	%rsi	 ;
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L356:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%r8, %r9	 ; status,
	movq	(%rcx), %rdx	 ; _1->type, _1->type
	movl	$118, %r8d	 ;,
	jmp	.L355	 ;
	.section .rdata,"dr"
.LC29:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC29(%rip), %r13	 ;, tmp115
 ; D:/TC/src/tac.c:285: TAC* tac_code(Code* code) {
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp116, code
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:285: TAC* tac_code(Code* code) {
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp117, <retval>
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:63:     tac->entry_point = NULL;
	movq	$0, 8(%r12)	 ;, tac_29->entry_point
 ; D:/TC/src/tac.c:62:     tac->attribute_tables = create_list();
	movq	%rax, (%r12)	 ; tmp118, tac_29->attribute_tables
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:64:     tac->global_vars = create_list();
	movq	%rax, 16(%r12)	 ; tmp119, tac_29->global_vars
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %ecx	 ;,
 ; D:/TC/src/tac.c:65:     tac->subroutines = create_list();
	movq	%rax, 24(%r12)	 ; tmp120, tac_29->subroutines
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:72:     status->tac = tac;
	movq	%r12, (%rax)	 ; <retval>, status_26->tac
 ; D:/TC/src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rsi	 ; tmp121, status
 ; D:/TC/src/tac.c:73:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	 ;, status_26->current_subroutine
 ; D:/TC/src/tac.c:74:     status->current_block = NULL;
	movq	$0, 16(%rax)	 ;, status_26->current_block
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:75:     status->end_labels = create_list();
	movq	%rax, 32(%rsi)	 ; tmp122, status_26->end_labels
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:77:     status->attr_count = 0;
	pxor	%xmm0, %xmm0	 ; tmp101
 ; D:/TC/src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rcx	 ; code_17(D)->members, code_17(D)->members
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rsi)	 ; tmp123, status_26->start_labels
 ; D:/TC/src/tac.c:77:     status->attr_count = 0;
	movups	%xmm0, 48(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 48B]
	movups	%xmm0, 64(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 64B]
	movups	%xmm0, 80(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 80B]
 ; D:/TC/src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp124, members
	.p2align 4,,10
	.p2align 3
.L359:
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L367	 ;,
.L365:
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L368	 ;,
 ; D:/TC/src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L369	 ;,
 ; D:/TC/src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L359	 ;,
 ; D:/TC/src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.import, code_member_21->content.import
	movq	%rsi, %r8	 ; status,
	movq	%r12, %rdx	 ; <retval>,
	call	tac_import	 ;
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	jne	.L365	 ;,
.L367:
 ; D:/TC/src/tac.c:304: }
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
.L368:
 ; D:/TC/src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.function, code_member_21->content.function
	movq	%rsi, %rdx	 ; status,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	 ; code_member_21->content.function, code_member_21->content.function
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r13, %rdx	 ; tmp115,
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rbx	 ; _4->name, _5
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rcx	 ; _5->name, _5->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp125
	jne	.L359	 ;,
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r12)	 ; _5, tac_29->entry_point
	jmp	.L359	 ;
	.p2align 4,,10
	.p2align 3
.L369:
 ; D:/TC/src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L359	 ;
	.section .rdata,"dr"
	.align 32
CSWTCH.21:
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
.LC16:
	.long	0
	.long	-1074790400
	.ident	"GCC: (GNU) 13.2.0"
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
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
