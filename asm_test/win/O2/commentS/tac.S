	.file	"tac.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
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
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rcx), %rbx	 ; type_14(D)->name, _8
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
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
	.def	load_rvalue;	.scl	3;	.type	32;	.endef
load_rvalue:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp102, arg
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rcx, %rcx	 ; arg
	je	.L73	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rcx)	 ;, arg_4(D)->is_get
	jne	.L78	 ;,
.L73:
 ; D:/TC/src/tac.c:281: }
	leaq	-32(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L78:
	movq	%rdx, %rsi	 ; tmp103, status
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %rdx	 ; arg_4(D)->type, arg_4(D)->type
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rsi, %r9	 ; status,
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %r12	 ; tmp104, _10
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	 ; _10, tmp97
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	 ; _10->type, tmp97
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_16->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp105, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_16->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp97, MEM <vector(2) long unsigned int> [(void *)arg_16]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	 ; arg, inst_12->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp106, inst
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rdi, %rbx	 ; arg, arg
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_12->arg1
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	 ;, inst_12->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_12->arg3
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rsi), %rax	 ; status_7(D)->current_block, status_7(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:281: }
	leaq	-32(%rbp), %rsp	 ;,
	movq	%rbx, %rax	 ; arg,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[warning] Unsupported symbol kind for import: %d\12\0"
	.text
	.p2align 4
	.globl	tac_import
	.def	tac_import;	.scl	2;	.type	32;	.endef
tac_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp112, tac
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rcx), %rsi	 ; import_16(D)->name, _1
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rsi), %ebx	 ; _1->kind, _2
 ; D:/TC/src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ebx	 ;, _2
	je	.L86	 ;,
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp104
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp104
	jbe	.L87	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L82	 ;,
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp116, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rsi, %xmm1	 ; _1, _1
 ; D:/TC/src/tac.c:11:     table->size = 0;
	movq	$0, 16(%rbx)	 ;, table_27->size
 ; D:/TC/src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%rbx, %rdx	 ; table,
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp117, tmp107
	punpcklqdq	%xmm1, %xmm0	 ; _1, tmp107
	movups	%xmm0, (%rbx)	 ; tmp107, MEM <vector(2) long unsigned int> [(void *)table_27]
 ; D:/TC/src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rdi), %rcx	 ; tac_20(D)->attribute_tables, tac_20(D)->attribute_tables
 ; D:/TC/src/tac.c:314: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L82:
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC4(%rip), %rdx	 ;, tmp110
	movq	24(%rax), %rcx	 ; _12->_stderr, _12->_stderr
 ; D:/TC/src/tac.c:314: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L87:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L84:
	movq	%rsi, %rcx	 ; _1,
	call	create_var	 ;
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rdi), %rcx	 ; tac_20(D)->global_vars, tac_20(D)->global_vars
 ; D:/TC/src/tac.c:314: }
	leaq	-24(%rbp), %rsp	 ;,
	popq	%rbx	 ;
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdx	 ; tmp115, _8
 ; D:/TC/src/tac.c:314: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L86:
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%r8, %r9	 ; status,
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movl	$118, %r8d	 ;,
	jmp	.L84	 ;
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error: create_attribute received NULL table or attributes list\12\0"
	.align 8
.LC6:
	.ascii "[warning] Unsupported variable type for tac_variable: %d\12\0"
	.text
	.p2align 4
	.globl	tac_variable
	.def	tac_variable;	.scl	2;	.type	32;	.endef
tac_variable:
	pushq	%rbp	 ;
 ; D:/TC/src/tac.c:395:     switch (type) {
	leal	-97(%r8), %eax	 ;,
 ; D:/TC/src/tac.c:392: void tac_variable(Variable* variable, TACStatus* status, VarType type) {
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:395:     switch (type) {
	cmpl	$21, %eax	 ;, tmp116
	ja	.L89	 ;,
	movq	%rdx, %rbx	 ; tmp142, status
	leaq	.L91(%rip), %rdx	 ;, tmp118
	movq	%rcx, %rdi	 ; tmp141, variable
	movslq	(%rdx,%rax,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L91:
	.long	.L94-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L93-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L92-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L89-.L91
	.long	.L88-.L91
	.long	.L89-.L91
	.long	.L88-.L91
	.text
	.p2align 4,,10
	.p2align 3
.L89:
	movl	%r8d, 44(%rsp)	 ; type, %sfp
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movl	44(%rsp), %r8d	 ; %sfp, type
	leaq	.LC6(%rip), %rdx	 ;, tmp140
	movq	24(%rax), %rcx	 ; _15->_stderr, _15->_stderr
 ; D:/TC/src/tac.c:418: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	jmp	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L88:
 ; D:/TC/src/tac.c:418: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L92:
 ; D:/TC/src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp144, var
 ; D:/TC/src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
.L97:
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rcx	 ;, _7->global_vars
.L98:
 ; D:/TC/src/tac.c:418: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L93:
 ; D:/TC/src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp145, var
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	jmp	.L97	 ;
	.p2align 4,,10
	.p2align 3
.L94:
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _9->attribute_tables, _9->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rsi	 ; tmp146, attr_table
 ; D:/TC/src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	%rsi, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _11->attribute_tables, _11->attribute_tables
	call	list_append	 ;
 ; D:/TC/src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rdi), %r12	 ; variable_20(D)->type, _13
	movq	8(%rdi), %r13	 ; variable_20(D)->name, _14
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%r12, %rdx	 ; _13,
	movq	%r13, %rcx	 ; _14,
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rdi	 ; tmp147, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm1	 ; _13, _13
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%r12, %rcx	 ; _13,
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	 ; tmp148, tmp135
	punpcklqdq	%xmm1, %xmm0	 ; _13, tmp135
	movups	%xmm0, (%rdi)	 ; tmp135, MEM <vector(2) long unsigned int> [(void *)attr_34]
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rsi), %rax	 ; attr_table_29->size, attr_table_29->size
	movq	%rax, 16(%rdi)	 ; attr_table_29->size, attr_34->offset
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%rsi), %rcx	 ; attr_table_29->attributes, _40
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rsi)	 ; tmp149, attr_table_29->size
 ; D:/TC/src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rdi, %rdx	 ; attr,
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _40
	jne	.L98	 ;,
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp138
	movq	24(%rax), %r9	 ; _41->_stderr,
 ; D:/TC/src/tac.c:418: }
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	fwrite	 ;
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "[warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC8:
	.ascii "[warning] Failed to generate variable access for base\12\0"
	.align 8
.LC9:
	.ascii "[warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC10:
	.ascii "[warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC11:
	.ascii "[warning] Symbol '%s' in type '%s' is not an attribute\12\0"
	.align 8
.LC12:
	.ascii "[warning] Attempting to index non-array type: %s\12\0"
.LC13:
	.ascii "arr\0"
	.align 8
.LC14:
	.ascii "[warning] Failed to generate variable access for index\12\0"
	.align 8
.LC15:
	.ascii "[warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC16:
	.ascii "[warning] Unsupported variable access type for tac_variable_access: %u\12\0"
	.text
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
	movq	%rcx, %rsi	 ; tmp304, variable_access
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp305, status
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rcx), %ecx	 ; variable_access_109(D)->type,
	testl	%ecx, %ecx	 ;
	jne	.L100	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rsi), %rcx	 ; variable_access_109(D)->content.name, _2
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L100	 ;,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, tmp351
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, pretmp_415
	movq	%rbx, %r9	 ; status,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	subl	$1, %eax	 ;, tmp224
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, tmp224
	jbe	.L101	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rbx	 ; tmp306, _6
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _6, tmp226
	movhps	16(%rbx), %xmm0	 ;, tmp226
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_211->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp307, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp226,* <retval>
.L99:
 ; D:/TC/src/tac.c:845: }
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
.L100:
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	movq	(%rsi), %rcx	 ; variable_access_109(D)->base, _10
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _10
	je	.L131	 ;,
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_variable_access	 ;
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rcx	 ; tmp311, _13
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	 ;
	movq	%rax, %r12	 ; tmp312, arg
 ; D:/TC/src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	 ; arg
	je	.L132	 ;,
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rsi), %edi	 ; variable_access_109(D)->type, _16
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %edi	 ;, _16
	je	.L133	 ;,
 ; D:/TC/src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %edi	 ;, _16
	je	.L134	 ;,
 ; D:/TC/src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %edi	 ;, _16
	jne	.L116	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %edi	 ; base_119->kind, _68
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%edi, %edi	 ; _68
	je	.L135	 ;,
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %edi	 ;, _68
	je	.L119	 ;,
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	 ; base_119->type, _69
.L118:
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rbx	 ; prephitmp_104->name, _81
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movl	%edi, %r8d	 ; _68,
	leaq	.LC15(%rip), %rdx	 ;, tmp286
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rcx	 ; _82->_stderr, _82->_stderr
	movq	%rbx, %r9	 ; _81,
	call	fprintf	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L133:
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	 ; base_119->type, _17
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _17->kind, _18
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp234
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp234
	jbe	.L136	 ;,
 ; D:/TC/src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _17->ast_node.scope, scope
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _18
	jne	.L108	 ;,
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_163].class_scope, scope
.L108:
 ; D:/TC/src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rsi), %rax	 ; variable_access_109(D)->content.attr_name, variable_access_109(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _23->name, _23->name
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	je	.L137	 ;,
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %edx	 ; attr_166->kind, _31
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rdx), %ecx	 ;, tmp243
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %ecx	 ;, tmp243
	jbe	.L138	 ;,
 ; D:/TC/src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %edx	 ;, _31
	jne	.L139	 ;,
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; attr_166->type, attr_166->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %r13	 ; tmp320, _42
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; _42, tmp252
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; _42->type, tmp252
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_263->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp321, <retval>
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp252, MEM <vector(2) long unsigned int> [(void *)arg_263]
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rsi), %rcx	 ; variable_access_109(D)->content.attr_name, _43
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_263->kind
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _43->type, _43->type
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r13	 ; tmp322, _45
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; _45, tmp255
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; _45->type, tmp255
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_250->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp323, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_250->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp255, MEM <vector(2) long unsigned int> [(void *)arg_250]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_187->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp324, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_187->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_187->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$15, 24(%rax)	 ;, inst_187->type
 ; D:/TC/src/tac.c:788:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_110(D)->current_block, status_110(D)->current_block
	movq	8(%rax), %rcx	 ;, _47->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:791:         return temp;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	 ; base_119->type, _69
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %edx	 ; _69->kind,
	testl	%edx, %edx	 ;
	jne	.L118	 ;,
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ;, tmp276
	movq	8(%rax), %rcx	 ; _69->name, _69->name
	movq	(%rdx), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp334, _73
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r12), %rax	 ; base_119->type, base_119->type
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _74->ast_node.class, _74->ast_node.class
	movq	16(%rax), %rcx	 ; _75->class_scope, _75->class_scope
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_124->type, attr_124->type
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp335, attr
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdi	 ; tmp336, _78
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rdi, %xmm0	 ; _78, tmp283
	movhps	16(%rdi), %xmm0	 ; _78->type, tmp283
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;, arg_289->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp337, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_289->is_get
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp283, MEM <vector(2) long unsigned int> [(void *)arg_289]
.L119:
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rsi), %rcx	 ; variable_access_109(D)->content.args, variable_access_109(D)->content.args
 ; D:/TC/src/tac.c:827:         long long arg_count = 0;
	xorl	%esi, %esi	 ; arg_count
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	call	list_copy	 ;
	movq	.refptr.name_int(%rip), %r13	 ;, tmp303
	movq	%rax, 40(%rsp)	 ; tmp339, %sfp
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L120	 ;
	.p2align 4,,10
	.p2align 3
.L121:
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:833:             arg_count++;
	addq	$1, %rsi	 ;, arg_count
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rcx	 ; arg_139->type, arg_139->type
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rax, %r15	 ; tmp340, arg
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	call	get_type_size	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, %rdi	 ; tmp341, _86
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_302->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp342, arg
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rdi, (%rax)	 ; _86, arg_302->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	0(%r13), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	 ;, arg_302->is_get
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	 ; name_int, arg_302->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	 ; arg, inst_189->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp343, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_189->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	 ; arg, inst_189->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_189->arg3
 ; D:/TC/src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_110(D)->current_block, status_110(D)->current_block
	movq	8(%rax), %rcx	 ; _89->instructions, _89->instructions
	call	list_append	 ;
.L120:
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp344, arg_expr
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	jne	.L121	 ;,
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; base_364->type, base_364->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp345, _94
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _94, tmp294
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _94->type, tmp294
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_328->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp346, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_328->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp294, MEM <vector(2) long unsigned int> [(void *)arg_328]
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; arg_count, arg_315->value.int_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp347, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_315->kind
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	0(%r13), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	 ;, arg_315->is_get
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	 ; name_int, arg_315->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_190->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp348, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_190->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	 ; arg, inst_190->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$22, 24(%rax)	 ;, inst_190->type
 ; D:/TC/src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_110(D)->current_block, status_110(D)->current_block
	movq	8(%rax), %rcx	 ;, _96->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:839:         return temp;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L101:
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$102, %r8d	 ;,
.L130:
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp317, _34
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _34, tmp245
	movhps	16(%rbx), %xmm0	 ;, tmp245
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp318, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp245,* <retval>
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L134:
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rax), %rax	 ; base_119->type, _49
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rdi	 ; _49->name, pretmp_406
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	 ; _49->kind, _49->kind
	subl	$3, %eax	 ;, tmp259
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	 ;, tmp259
	ja	.L129	 ;,
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC13(%rip), %rdx	 ;, tmp264
	movq	%rdi, %rcx	 ; pretmp_406,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp326
	jne	.L129	 ;,
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rsi), %rcx	 ; variable_access_109(D)->content.index, variable_access_109(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rcx	 ; tmp328, _60
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	 ;
	movq	%rax, %r13	 ; tmp329, index
 ; D:/TC/src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	 ; index
	je	.L140	 ;,
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%r12), %rax	 ; base_119->type, base_119->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; _63->type, _63->type
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp331, _65
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; _65, tmp272
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; _65->type, tmp272
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_276->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp332, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_276->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp272, MEM <vector(2) long unsigned int> [(void *)arg_276]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_188->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp333, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_188->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	 ; index, inst_188->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$16, 24(%rax)	 ;, inst_188->type
 ; D:/TC/src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_110(D)->current_block, status_110(D)->current_block
	movq	8(%rax), %rcx	 ;, _66->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:814:         return temp;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L139:
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rax	 ; base_119->type, base_119->type
	movq	8(%rax), %rdi	 ; _35->name, _36
	movq	8(%rsi), %rax	 ; variable_access_109(D)->content.attr_name, variable_access_109(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _37->name, _38
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rdi, %r9	 ; _36,
	leaq	.LC11(%rip), %rdx	 ;, tmp250
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _39->_stderr, _39->_stderr
	movq	%rbx, %r8	 ; _38,
	call	fprintf	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %r9	 ; _11->_stderr,
	leaq	.LC7(%rip), %rcx	 ;, tmp231
	call	fwrite	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%edi, %r8d	 ; _16,
	leaq	.LC16(%rip), %rdx	 ;, tmp301
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rcx	 ; _98->_stderr, _98->_stderr
	call	fprintf	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L129:
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	%rdi, %r8	 ; pretmp_406,
	leaq	.LC12(%rip), %rdx	 ;, tmp266
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	24(%rax), %rcx	 ;, _57->_stderr
	call	fprintf	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; attr_166->type, attr_166->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; attr,
	jmp	.L130	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movq	24(%rax), %r9	 ; _14->_stderr,
	leaq	.LC8(%rip), %rcx	 ;, tmp233
	call	fwrite	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L140:
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movq	24(%rax), %r9	 ; _61->_stderr,
	leaq	.LC14(%rip), %rcx	 ;, tmp269
	call	fwrite	 ;
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L136:
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _17->name, _20
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	leaq	.LC9(%rip), %rdx	 ;, tmp236
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	movq	%rbx, %r8	 ; _20,
	call	fprintf	 ;
	jmp	.L99	 ;
.L137:
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r12), %rax	 ; base_119->type, base_119->type
	movq	8(%rax), %rdi	 ; _25->name, _26
	movq	8(%rsi), %rax	 ; variable_access_109(D)->content.attr_name, variable_access_109(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _27->name, _28
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rdi, %r9	 ; _26,
	leaq	.LC10(%rip), %rdx	 ;, tmp242
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movq	%rbx, %r8	 ; _28,
	call	fprintf	 ;
	jmp	.L99	 ;
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC19:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.text
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
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	movl	8(%rcx), %ebx	 ; primary_38(D)->type,
 ; D:/TC/src/tac.c:676: Arg* tac_primary(Primary* primary, TACStatus* status) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L142	 ;,
	leaq	.L144(%rip), %r8	 ;, tmp138
	movq	%rdx, %rsi	 ; tmp184, status
	movslq	(%r8,%rbx,4), %rax	 ;, tmp140
	addq	%r8, %rax	 ; tmp138, tmp141
	jmp	*%rax	 ; tmp141
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
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp197, _15
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %rdx	 ; operand_44->type, operand_44->type
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r12	 ; tmp198, operand
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp199, _17
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; _17, tmp166
	movhps	16(%rdi), %xmm0	 ; _17->type, tmp166
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdi	 ;, tmp168
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_184->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp200, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_184->kind
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp166, MEM <vector(2) long unsigned int> [(void *)arg_184]
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	8(%r12), %rax	 ; operand_44->type, _18
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	cmpq	(%rdi), %rax	 ; name_int, _18
	je	.L159	 ;,
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %r13	 ;, tmp171
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	cmpq	0(%r13), %rax	 ; name_float, _18
	je	.L160	 ;,
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _18->name, _23
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	leaq	.LC18(%rip), %rdx	 ;, tmp176
	movq	24(%rax), %rcx	 ; _24->_stderr, _24->_stderr
	movq	%rbx, %r8	 ; _23,
 ; D:/TC/src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L143:
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.var
 ; D:/TC/src/tac.c:739: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	 ;
	.p2align 4,,10
	.p2align 3
.L152:
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	movl	$10, %r8d	 ;,
	xorl	%edx, %edx	 ;
	call	strtoll	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rsi	 ; tmp185, _3
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; _3, arg_106->value.int_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp186, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_106->kind
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp144
	movq	(%rax), %rax	 ;, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int,
.L141:
 ; D:/TC/src/tac.c:739: }
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
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ;* primary, primary_38(D)->value.literal_value
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movapd	%xmm0, %xmm6	 ; tmp187, _5
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm6, (%rax)	 ; _5, arg_119->value.float_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp188, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_119->kind
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp147
	movq	(%rax), %rax	 ;, name_float
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	%rax, 8(%rbx)	 ; name_float,
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L150:
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %xmm6	 ; primary_38(D)->value.literal_value, _6
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$3, 16(%rax)	 ;, arg_132->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp189, <retval>
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movdqa	%xmm6, %xmm0	 ; _6, tmp149
	movq	.refptr.name_string(%rip), %rax	 ;, tmp150
	movhps	(%rax), %xmm0	 ; name_string, tmp149
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rbx)	 ; tmp149, MEM <vector(2) long unsigned int> [(void *)arg_132]
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L149:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	 ;, arg_145->value.bool_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp190, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_145->kind
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp152
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L148:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	 ;, arg_158->value.bool_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp191, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_158->kind
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp154
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.expr, primary_38(D)->value.expr
 ; D:/TC/src/tac.c:739: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	 ;
	.p2align 4,,10
	.p2align 3
.L146:
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_38(D)->value.operand, primary_38(D)->value.operand
	call	tac_primary	 ;
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rcx	 ; tmp192, _9
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rsi, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r12	 ; tmp193, operand
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp158
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %rdx	 ; name_bool, name_bool
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rdi	 ; tmp194, _11
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; _11, tmp160
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; _11->type, tmp160
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_171->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp195, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_171->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp160, MEM <vector(2) long unsigned int> [(void *)arg_171]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; operand, inst_88->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp196, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_88->arg1
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$13, 24(%rax)	 ;, inst_88->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_88->arg3
 ; D:/TC/src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _12->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:710:             return temp;
	jmp	.L141	 ;
.L142:
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC19(%rip), %rdx	 ;, tmp181
 ; D:/TC/src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	call	fprintf	 ;
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L160:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_210->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp203, arg
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	.LC17(%rip), %rax	 ;, tmp211
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_210->is_get
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	%rax, (%rdi)	 ; tmp211, arg_210->value.float_value
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	0(%r13), %rax	 ; name_float, name_float
	movq	%rax, 8(%rdi)	 ; name_float, arg_210->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$2, 24(%rax)	 ;, inst_90->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp204, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_90->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; arg, inst_90->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; operand,
.L155:
 ; D:/TC/src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_39(D)->current_block, status_39(D)->current_block
	movq	8(%rax), %rcx	 ;, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:729:             return temp;
	jmp	.L141	 ;
	.p2align 4,,10
	.p2align 3
.L159:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_197->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp201, arg
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_197->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	(%rdi), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_197->is_get
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r13)	 ; name_int, arg_197->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$1, 24(%rax)	 ;, inst_89->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp202, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_89->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_89->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; operand,
	jmp	.L155	 ;
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
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
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp147, expression
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp148, status
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_31(D)->operator
	je	.L175	 ;,
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_31(D)->right, expression_31(D)->right
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rcx	 ; tmp149, _4
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	 ;
	movq	%rax, %rdi	 ; tmp150, <retval>
 ; D:/TC/src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rsi), %eax	 ; expression_31(D)->operator,
	cmpl	$18, %eax	 ;, _5
	ja	.L163	 ;,
	leaq	CSWTCH.18(%rip), %rdx	 ;, tmp126
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movl	(%rdx,%rax,4), %r13d	 ; CSWTCH.18[_5], _53
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp151, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp129
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp129
	ja	.L164	 ;,
 ; D:/TC/src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	 ;, _53
	jne	.L168	 ;,
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	 ; left_91->kind,
	testl	%eax, %eax	 ;
	jne	.L176	 ;,
.L166:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_56->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp157, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; left, inst_56->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; <retval>, inst_56->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_56->arg3
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%r12)	 ;, left_91->is_get
	jne	.L177	 ;,
.L167:
 ; D:/TC/src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _20->instructions, _20->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:675: }
	leaq	-48(%rbp), %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
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
.L163:
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%rsi), %rcx	 ; expression_31(D)->expr_left, expression_31(D)->expr_left
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	 ;, _53
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp163, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rsi), %eax	 ; expression_31(D)->operator, expression_31(D)->operator
	subl	$13, %eax	 ;, tmp145
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp145
	ja	.L164	 ;,
.L168:
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; left_104->type, left_104->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp152, _9
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _9, tmp132
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%r12, %rcx	 ; left,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _9->type, tmp132
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_79->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp153, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_79->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp132, MEM <vector(2) long unsigned int> [(void *)arg_79]
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r14	 ; tmp154, _10
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _10, inst_55->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp155, inst
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; <retval>, inst_55->arg3
 ; D:/TC/src/tac.c:660:             right = temp;
	movq	%rsi, %rdi	 ; arg, <retval>
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _53, inst_55->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_55->arg1
 ; D:/TC/src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%r12), %eax	 ; left_91->kind,
	testl	%eax, %eax	 ;
	je	.L166	 ;,
.L176:
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp137
	movq	24(%rax), %r9	 ; _14->_stderr,
	call	fwrite	 ;
	jmp	.L166	 ;
	.p2align 4,,10
	.p2align 3
.L164:
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rdx	 ; left_102->type, left_102->type
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r14	 ; tmp159, _18
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _18, tmp139
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rdx	 ; status,
	movq	%r12, %rcx	 ; left,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _18->type, tmp139
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_92->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp160, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_92->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp139, MEM <vector(2) long unsigned int> [(void *)arg_92]
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r12	 ; tmp161, _19
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; <retval>, inst_58->arg3
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp162, inst
 ; D:/TC/src/tac.c:670:         right = temp;
	movq	%rsi, %rdi	 ; arg, <retval>
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _53, inst_58->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_58->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; _19, inst_58->arg2
	jmp	.L167	 ;
	.p2align 4,,10
	.p2align 3
.L175:
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_31(D)->prim_left, expression_31(D)->prim_left
 ; D:/TC/src/tac.c:675: }
	leaq	-48(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
	.p2align 4,,10
	.p2align 3
.L177:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$24, 24(%rax)	 ;, inst_57->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp158, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; left, inst_57->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; <retval>, inst_57->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_57->arg3
	jmp	.L167	 ;
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp186, if_
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp187, status
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	subq	$72, %rsp	 ;,
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp188, then_label
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
 ; D:/TC/src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp189, else_label
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp190
	je	.L181	 ;,
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp192
	jne	.L202	 ;,
.L181:
 ; D:/TC/src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
	movq	%rax, 56(%rsp)	 ; tmp191, %sfp
.L180:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_187->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp193, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_187->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	56(%rsp), %rax	 ; %sfp, end_label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_187->is_get
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%r14), %rcx	 ; if__61(D)->condition, if__61(D)->condition
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, (%r12)	 ; end_label, arg_187->value.label
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rax, %r15	 ; tmp194, condition
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_174->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp195, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_174->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; else_label, arg_174->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_174->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; then_label, arg_161->value.label
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp196, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_161->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_161->type
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_161->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp197, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_129->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	 ; arg, inst_129->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_129->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_129->arg1
 ; D:/TC/src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _8->instructions, _8->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; then_label, block_159->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp198, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp199, block_159->instructions
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _10->blocks, _10->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:480:     status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rcx	 ; if__61(D)->body, if__61(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp200, then_statements
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L182	 ;
	.p2align 4,,10
	.p2align 3
.L183:
 ; D:/TC/src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L182:
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp201, statement
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L183	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_130->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp202, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_130->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_130->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_130->arg3
 ; D:/TC/src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _13->instructions, _13->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp203
	je	.L203	 ;,
.L184:
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp221
	je	.L204	 ;,
.L191:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp227, block
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	56(%rsp), %rax	 ; %sfp, end_label
	movq	%rax, (%rsi)	 ; end_label, block_232->label
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp228, block_232->instructions
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _40->blocks, _40->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:540:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:542: }
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
.L202:
 ; D:/TC/src/tac.c:469:         end_label = else_label;
	movq	%rsi, 56(%rsp)	 ; else_label, %sfp
	jmp	.L180	 ;
	.p2align 4,,10
	.p2align 3
.L204:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; else_label, block_230->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp222, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp223, block_230->instructions
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _35->blocks, _35->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:527:         status->current_block = else_block;
	movq	%rdi, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp224, else_statements
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L192	 ;
	.p2align 4,,10
	.p2align 3
.L193:
 ; D:/TC/src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L192:
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp225, else_statement
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L193	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_133->arg1
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp226, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_133->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_133->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_133->arg3
 ; D:/TC/src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _38->instructions, _38->instructions
	call	list_append	 ;
	jmp	.L191	 ;
	.p2align 4,,10
	.p2align 3
.L203:
 ; D:/TC/src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rcx	 ; if__61(D)->else_if, if__61(D)->else_if
	call	list_copy	 ;
	movq	%rax, 40(%rsp)	 ; tmp204, %sfp
	.p2align 4,,10
	.p2align 3
.L185:
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp220, elif
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L184	 ;,
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; else_label, block_200->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp205, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp206, block_200->instructions
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:498:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	 ; block, status_56(D)->current_block
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
	movq	%rax, %rbp	 ; tmp207, then_label
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%rdi), %rcx	 ; elif_87->condition, elif_87->condition
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rsi	 ; tmp208, else_label
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	%rax, %r13	 ; tmp209, condition
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp210
	jne	.L205	 ;,
.L187:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_217->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	 ; tmp212, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_217->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; else_label, arg_217->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_217->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_204->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_204->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; then_label, arg_204->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_204->is_get
	movq	%rax, 48(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	48(%rsp), %r9	 ; %sfp, arg
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp214, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; condition, inst_131->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r9, 8(%rax)	 ; arg, inst_131->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_131->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	 ; arg, inst_131->arg3
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _26->instructions, _26->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; then_label, block_202->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r13	 ; tmp215, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	 ; tmp216, block_202->instructions
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _28->blocks, _28->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:511:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	 ; block, status_56(D)->current_block
 ; D:/TC/src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rdi), %rcx	 ; elif_87->body, elif_87->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp217, elif_statements
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L188	 ;
	.p2align 4,,10
	.p2align 3
.L189:
 ; D:/TC/src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L188:
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp218, elif_statement
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L189	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_132->arg1
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp219, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_132->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_132->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_132->arg3
 ; D:/TC/src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rcx	 ; _31->instructions, _31->instructions
	call	list_append	 ;
	jmp	.L185	 ;
	.p2align 4,,10
	.p2align 3
.L205:
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__61(D)->else_body, if__61(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	 ; tmp211
	cmovne	56(%rsp), %rsi	 ; else_label,, %sfp, else_label
	jmp	.L187	 ;
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] 'break' statement used outside of loop\12\0"
	.align 8
.LC22:
	.ascii "[warning] 'continue' statement used outside of loop\12\0"
	.align 8
.LC23:
	.ascii "[warning] Unsupported statement type for tac_statement: %d\12\0"
	.text
	.p2align 4
	.globl	tac_statement
	.def	tac_statement;	.scl	2;	.type	32;	.endef
tac_statement:
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	movl	8(%rcx), %ebx	 ; statement_31(D)->type,
 ; D:/TC/src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %ebx	 ;, _1
	ja	.L207	 ;,
	movq	%rdx, %rdi	 ; tmp148, status
	leaq	.L209(%rip), %rdx	 ;, tmp118
	movq	%rcx, %rsi	 ; tmp147, statement
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L209:
	.long	.L216-.L209
	.long	.L206-.L209
	.long	.L214-.L209
	.long	.L213-.L209
	.long	.L212-.L209
	.long	.L211-.L209
	.long	.L210-.L209
	.long	.L208-.L209
	.text
	.p2align 4,,10
	.p2align 3
.L210:
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rdi), %rcx	 ; status_32(D)->end_labels, status_32(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp152
	jne	.L218	 ;,
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rdi), %rax	 ; status_32(D)->end_labels, status_32(D)->end_labels
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _11->tail, _11->tail
	movq	8(%rax), %rbx	 ; _12->content, label
 ; D:/TC/src/tac.c:437:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	je	.L218	 ;,
.L232:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp153, inst
	jmp	.L230	 ;
	.p2align 4,,10
	.p2align 3
.L208:
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rdi), %rcx	 ; status_32(D)->start_labels, status_32(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp155
	jne	.L219	 ;,
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rdi), %rax	 ; status_32(D)->start_labels, status_32(D)->start_labels
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _19->tail, _19->tail
	movq	8(%rax), %rbx	 ; _20->content, label
 ; D:/TC/src/tac.c:448:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	jne	.L232	 ;,
.L219:
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp144
	movq	24(%rax), %r9	 ; _23->_stderr,
	jmp	.L231	 ;
	.p2align 4,,10
	.p2align 3
.L214:
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_31(D)->stmt.if_stmt, statement_31(D)->stmt.if_stmt
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	 ;
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	(%rcx), %rcx	 ; statement_31(D)->stmt.expr, statement_31(D)->stmt.expr
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	jmp	tac_expression	 ;
	.p2align 4,,10
	.p2align 3
.L206:
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_31(D)->stmt.for_stmt, statement_31(D)->stmt.for_stmt
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	 ;
	.p2align 4,,10
	.p2align 3
.L211:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:248:             arg->value.string_value = NULL;
	movq	$0, (%rax)	 ;, arg_72->value.string_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp149, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$5, 16(%rax)	 ;, arg_72->kind
 ; D:/TC/src/tac.c:249:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp127
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_72->is_get
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_31(D)->stmt.return_expr, _6
 ; D:/TC/src/tac.c:249:             arg->type = name_void;
	movq	(%rax), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_72->type
 ; D:/TC/src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _6
	je	.L217	 ;,
 ; D:/TC/src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp150, arg
.L217:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$21, 24(%rax)	 ;, inst_54->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp151, inst
.L230:
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rdi), %rax	 ; status_32(D)->current_block, status_32(D)->current_block
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rdx)	 ; label,* inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rdx)	 ;,
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rdx)	 ;,
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rcx	 ;, _13->instructions
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L213:
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rcx), %rcx	 ; statement_31(D)->stmt.while_stmt, statement_31(D)->stmt.while_stmt
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	%rdi, %rdx	 ; status,
 ; D:/TC/src/tac.c:461: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	 ;
	.p2align 4,,10
	.p2align 3
.L218:
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp137
	movq	24(%rax), %r9	 ; _15->_stderr,
.L231:
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	jmp	fwrite	 ;
.L207:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC23(%rip), %rdx	 ;, tmp146
	movq	24(%rax), %rcx	 ; _25->_stderr, _25->_stderr
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	jmp	fprintf	 ;
	.p2align 4
	.globl	tac_for
	.def	tac_for;	.scl	2;	.type	32;	.endef
tac_for:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp174, for_
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp175, status
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp176, condition_label
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	 ; tmp177, body_label
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__51(D)->condition
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	 ; tmp178, end_label
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	je	.L234	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp179, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_171->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_171->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp180, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_108->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_108->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_108->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_108->arg3
 ; D:/TC/src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _3->instructions, _3->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; condition_label, block_169->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp181, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp182, block_169->instructions
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _5->blocks, _5->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:558:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%rdi), %rcx	 ; for__51(D)->condition, for__51(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	%rax, %r15	 ; tmp183, condition
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_156->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp184, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_156->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; end_label, arg_156->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_156->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_143->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp185, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_143->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_143->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_143->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_107->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp186, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_107->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_107->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_107->arg3
 ; D:/TC/src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ;, _10->instructions
	call	list_append	 ;
.L235:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; body_label, block_197->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp189, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp190, block_197->instructions
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _15->blocks, _15->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:571:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
	xorl	%edx, %edx	 ;
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__51(D)->increment
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	 ; tmp191, increment_label
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	je	.L236	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_52(D)->start_labels, status_52(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp192, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_199->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_199->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; increment_label, arg_199->value.label
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	list_append	 ;
.L237:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_238->is_get
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_52(D)->end_labels, status_52(D)->end_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp195, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_238->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_238->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; end_label, arg_238->value.label
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__51(D)->body, for__51(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp196, body_statements
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L239	 ;
	.p2align 4,,10
	.p2align 3
.L240:
 ; D:/TC/src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L239:
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp197, statement
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L240	 ;,
 ; D:/TC/src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_52(D)->start_labels, status_52(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_52(D)->end_labels, status_52(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__51(D)->increment
	je	.L241	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_253->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp198, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_253->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; increment_label, arg_253->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_253->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp199, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_110->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_110->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_110->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_110->arg3
 ; D:/TC/src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _32->instructions, _32->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	 ; increment_label, block_251->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp200, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp201, block_251->instructions
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _34->blocks, _34->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:593:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%rdi), %rcx	 ; for__51(D)->increment, for__51(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
.L241:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_266->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp202, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_266->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_266->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_266->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__51(D)->condition
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_111->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp203, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_111->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_111->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_111->arg3
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	je	.L244	 ;,
.L242:
 ; D:/TC/src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _40->instructions, _40->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; end_label, block_292->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp206, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp207, block_292->instructions
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _42->blocks, _42->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:604:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:606: }
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
.L236:
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__51(D)->condition
	je	.L238	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_52(D)->start_labels, status_52(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp193, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_212->value.label
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
	jmp	.L237	 ;
	.p2align 4,,10
	.p2align 3
.L234:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_184->value.label
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp187, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_184->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_109->arg1
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp188, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_109->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_109->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_109->arg3
 ; D:/TC/src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ;, _13->instructions
	call	list_append	 ;
	jmp	.L235	 ;
	.p2align 4,,10
	.p2align 3
.L244:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_279->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp204, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_279->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_279->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_279->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_112->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp205, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_112->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_112->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_112->arg3
	jmp	.L242	 ;
	.p2align 4,,10
	.p2align 3
.L238:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_52(D)->start_labels, status_52(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp194, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_225->value.label
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
	jmp	.L237	 ;
	.p2align 4
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rdx, %r9	 ; status,
	movl	$98, %r8d	 ;,
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp141, while_
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%ecx, %ecx	 ;
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp142, status
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edx, %edx	 ;
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	 ; tmp143, condition_label
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_141->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp144, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_141->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_141->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_141->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp145, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_68->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_68->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_68->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_68->arg3
 ; D:/TC/src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; condition_label, block_139->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp146, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp147, block_139->instructions
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:615:     status->current_block = condition_block;
	movq	%rdi, 16(%rbx)	 ; block, status_27(D)->current_block
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
	movq	%rax, %r13	 ; tmp148, body_label
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	(%rsi), %rcx	 ; while__40(D)->condition, while__40(D)->condition
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rdi	 ; tmp149, end_label
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	%rax, %r15	 ; tmp150, condition
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_126->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp151, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_126->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; end_label, arg_126->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_126->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_113->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp152, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_113->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; body_label, arg_113->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_113->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp153, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_67->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; arg, inst_67->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_67->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_67->arg1
 ; D:/TC/src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; body_label, block_111->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r12	 ; tmp154, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r12, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	 ; tmp155, block_111->instructions
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:625:     status->current_block = body_block;
	movq	%r12, 16(%rbx)	 ; block, status_27(D)->current_block
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_98->is_get
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp156, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_98->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_98->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_98->value.label
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_85->is_get
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp157, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_85->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_85->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; end_label, arg_85->value.label
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__40(D)->body, while__40(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp158, body_statements
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L246	 ;
	.p2align 4,,10
	.p2align 3
.L247:
 ; D:/TC/src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L246:
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp159, statement
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L247	 ;,
 ; D:/TC/src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_27(D)->start_labels, status_27(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_27(D)->end_labels, status_27(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; condition_label, arg_156->value.label
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp160, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_156->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_156->type
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_156->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp161, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_69->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_69->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_69->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_69->arg3
 ; D:/TC/src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rcx	 ; _21->instructions, _21->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; end_label, block_154->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp162, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp163, block_154->instructions
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _23->blocks, _23->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:641:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_27(D)->current_block
 ; D:/TC/src/tac.c:643: }
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
 ; D:/TC/src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
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
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp119, subroutine_39->blocks
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_19(D)->tac, status_19(D)->tac
 ; D:/TC/src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r12), %rcx	 ; function_16(D)->parameters, function_16(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp120, parameters
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L250	 ;
	.p2align 4,,10
	.p2align 3
.L251:
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_25->type, parameter_25->type
	movq	8(%rax), %rcx	 ; parameter_25->name, parameter_25->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_39->parameters, subroutine_39->parameters
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp121, _8
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L250:
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L251	 ;,
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	 ; tmp123, _10
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; _10, block_43->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp124, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_39->blocks, subroutine_39->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp125, block_43->instructions
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:329:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_19(D)->current_block
 ; D:/TC/src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r12), %rcx	 ; function_16(D)->body, function_16(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp126, statements
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L252	 ;
	.p2align 4,,10
	.p2align 3
.L253:
 ; D:/TC/src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L252:
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp127, statement
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L253	 ;,
 ; D:/TC/src/tac.c:336:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_19(D)->current_subroutine
 ; D:/TC/src/tac.c:338: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp152, method
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp153, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_67]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp154, subroutine
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp155, subroutine_67->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp156, subroutine_67->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp157, subroutine_67->blocks
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_35(D)->tac, status_35(D)->tac
 ; D:/TC/src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_35(D)->current_subroutine
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rcx	 ; method_32(D)->parameters, method_32(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp158, parameters
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L256	 ;
	.p2align 4,,10
	.p2align 3
.L257:
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_41->type, parameter_41->type
	movq	8(%rax), %rcx	 ; parameter_41->name, parameter_41->name
	movq	%rbx, %r9	 ; status,
	movl	$112, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_67->parameters, subroutine_67->parameters
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp159, _8
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L256:
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L257	 ;,
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %r9	 ; status,
	movl	$98, %r8d	 ;,
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_var	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
 ; D:/TC/src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	 ; tmp161, _10
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; _10, block_71->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp162, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_67->blocks, subroutine_67->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp163, block_71->instructions
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp135
 ; D:/TC/src/tac.c:353:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_35(D)->current_block
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_35(D)->current_class, status_35(D)->current_class
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _13->name, _13->name
	movq	8(%rax), %rcx	 ; _14->name, _14->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp164, _16
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%r12), %rax	 ; method_32(D)->name, method_32(D)->name
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _17->name, _17->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp165
	je	.L262	 ;,
.L258:
 ; D:/TC/src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r12), %rcx	 ; method_32(D)->body, method_32(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp170, statements
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L260:
 ; D:/TC/src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L259:
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp171, statement
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L260	 ;,
 ; D:/TC/src/tac.c:364:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_35(D)->current_subroutine
 ; D:/TC/src/tac.c:366: }
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
.L262:
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	 ; status_35(D)->current_class, status_35(D)->current_class
	movq	%rbx, %r9	 ; status,
	movl	$116, %r8d	 ;,
	xorl	%ecx, %ecx	 ;
	movq	(%rax), %rdx	 ; _20->name, _20->name
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rsi	 ; tmp166, _22
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; _22, tmp146
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; _22->type, tmp146
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_86->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp167, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_86->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp146, MEM <vector(2) long unsigned int> [(void *)arg_86]
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r14	 ; status_35(D)->current_class, _23
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp168, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_73->kind
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	24(%r14), %rax	 ; MEM[(long long int *)_23 + 24B], _75
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rsi)	 ;, arg_73->is_get
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rsi)	 ; _75, arg_73->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp148
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rsi)	 ; name_int, arg_73->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_71->instructions, block_71->instructions
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$18, 24(%rax)	 ;, inst_61->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp169, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_61->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg, inst_61->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_61->arg3
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
	jmp	.L258	 ;
	.section .rdata,"dr"
	.align 8
.LC24:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.p2align 4
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp112, status
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp111, class
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:369:     status->current_class = class;
	movq	%rcx, 24(%rdx)	 ; class, status_14(D)->current_class
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rcx), %rcx	 ; class_15(D)->members, class_15(D)->members
	call	list_copy	 ;
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%rbx), %xmm6	 ; class_15(D)->name, _2
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rsi	 ; tmp113, members
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp114, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%r12, %rdx	 ; table,
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp115, tmp102
	punpcklqdq	%xmm6, %xmm0	 ; _2, tmp102
	movups	%xmm0, (%r12)	 ; tmp102, MEM <vector(2) long unsigned int> [(void *)table_30]
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	24(%rbx), %rax	 ; class_15(D)->size, class_15(D)->size
	movq	%rax, 16(%r12)	 ; class_15(D)->size, table_30->size
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rdi), %rax	 ; status_14(D)->tac, status_14(D)->tac
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	leaq	.LC24(%rip), %r12	 ;, tmp110
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rcx	 ; _4->attribute_tables, _4->attribute_tables
	call	list_append	 ;
	.p2align 4,,10
	.p2align 3
.L264:
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L272	 ;,
.L269:
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_24->type, _6
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	testl	%ebx, %ebx	 ; _6
	je	.L265	 ;,
	cmpl	$1, %ebx	 ;, _6
	je	.L266	 ;,
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	%ebx, %r8d	 ; _6,
	movq	%r12, %rdx	 ; tmp110,
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	jne	.L269	 ;,
.L272:
 ; D:/TC/src/tac.c:389:     status->current_class = NULL;
	movq	$0, 24(%rdi)	 ;, status_14(D)->current_class
 ; D:/TC/src/tac.c:391: }
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
.L266:
 ; D:/TC/src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rcx	 ; member_24->content.variable, member_24->content.variable
	movl	$97, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:383:                 break;
	jmp	.L264	 ;
	.p2align 4,,10
	.p2align 3
.L265:
 ; D:/TC/src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_24->content.method, member_24->content.method
	movq	%rdi, %rdx	 ; status,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:380:                 break;
	jmp	.L264	 ;
	.section .rdata,"dr"
.LC25:
	.ascii "main\0"
	.text
	.p2align 4
	.globl	tac_code
	.def	tac_code;	.scl	2;	.type	32;	.endef
tac_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC25(%rip), %r13	 ;, tmp115
 ; D:/TC/src/tac.c:283: TAC* tac_code(Code* code) {
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp116, code
 ; D:/TC/src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:283: TAC* tac_code(Code* code) {
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
 ; D:/TC/src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rcx	 ; code_17(D)->members, code_17(D)->members
 ; D:/TC/src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rsi)	 ; tmp123, status_26->start_labels
 ; D:/TC/src/tac.c:77:     status->attr_count = 0;
	movups	%xmm0, 48(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 48B]
	movups	%xmm0, 64(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 64B]
	movups	%xmm0, 80(%rsi)	 ; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 80B]
 ; D:/TC/src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp124, members
	.p2align 4,,10
	.p2align 3
.L274:
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L282	 ;,
.L280:
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L283	 ;,
 ; D:/TC/src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L284	 ;,
 ; D:/TC/src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L274	 ;,
 ; D:/TC/src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.import, code_member_21->content.import
	movq	%rsi, %r8	 ; status,
	movq	%r12, %rdx	 ; <retval>,
	call	tac_import	 ;
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	jne	.L280	 ;,
.L282:
 ; D:/TC/src/tac.c:302: }
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
.L283:
 ; D:/TC/src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.function, code_member_21->content.function
	movq	%rsi, %rdx	 ; status,
	call	tac_function	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	 ; code_member_21->content.function, code_member_21->content.function
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r13, %rdx	 ; tmp115,
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rbx	 ; _4->name, _5
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rcx	 ; _5->name, _5->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	 ; tmp125
	jne	.L274	 ;,
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r12)	 ; _5, tac_29->entry_point
	jmp	.L274	 ;
	.p2align 4,,10
	.p2align 3
.L284:
 ; D:/TC/src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L274	 ;
	.section .rdata,"dr"
	.align 32
CSWTCH.18:
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
.LC17:
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
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
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
