	.file	"tac.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.p2align 4
	.def	search_var;	.scl	3;	.type	32;	.endef
search_var:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp142, original_name
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp143, status
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rdx), %rax	 ; status_46(D)->current_subroutine, _1
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	 ; _1
	je	.L7	 ;,
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rcx	 ; _1->local_vars, _1->local_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	 ; tmp144
	je	.L5	 ;,
.L11:
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rsi), %rax	 ; status_46(D)->current_subroutine, _8
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	 ; _8
	je	.L7	 ;,
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rcx	 ; _8->parameters, _8->parameters
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	 ; tmp147
	je	.L31	 ;,
.L7:
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rsi)	 ;, status_46(D)->current_class
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rsi), %rax	 ; status_46(D)->tac, status_46(D)->tac
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	je	.L4	 ;,
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rcx	 ; pretmp_79->attribute_tables, pretmp_79->attribute_tables
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	 ; tmp151
	je	.L27	 ;,
.L29:
	movq	(%rsi), %rax	 ; status_46(D)->tac, status_46(D)->tac
.L4:
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	16(%rax), %rcx	 ; _29->global_vars, _29->global_vars
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	 ; tmp150
	jne	.L15	 ;,
 ; D:/TC/src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%rsi), %rax	 ; status_46(D)->tac, status_46(D)->tac
	movq	16(%rax), %rcx	 ; _32->global_vars, _32->global_vars
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp157, vars
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L22	 ;
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:/TC/src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	%rdi, (%rax)	 ; original_name, var_74->original_name
	je	.L1	 ;,
.L22:
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%rbx, %rcx	 ; vars,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L23	 ;,
.L15:
 ; D:/TC/src/tac.c:153:     return NULL;
	xorl	%eax, %eax	 ; <retval>
.L1:
 ; D:/TC/src/tac.c:154: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:/TC/src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rsi), %rax	 ; status_46(D)->tac, status_46(D)->tac
	movq	(%rax), %rcx	 ; _19->attribute_tables, _19->attribute_tables
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp152, tables
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	jmp	.L17	 ;
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rsi), %rax	 ; status_46(D)->current_class, status_46(D)->current_class
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	 ; _22->name, tmp160
	cmpq	%rax, 8(%rbx)	 ; tmp160, table_64->name
	je	.L32	 ;,
.L17:
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%rbp, %rcx	 ; tables,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp156, table
 ; D:/TC/src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	 ; table
	jne	.L21	 ;,
	jmp	.L29	 ;
	.p2align 4,,10
	.p2align 3
.L5:
 ; D:/TC/src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rsi), %rax	 ; status_46(D)->current_subroutine, status_46(D)->current_subroutine
	movq	24(%rax), %rcx	 ; _5->local_vars, _5->local_vars
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp145, vars
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L8	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:/TC/src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	%rdi, (%rax)	 ; original_name, var_51->original_name
	je	.L1	 ;,
.L8:
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%rbx, %rcx	 ; vars,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L10	 ;,
	jmp	.L11	 ;
	.p2align 4,,10
	.p2align 3
.L31:
 ; D:/TC/src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rsi), %rax	 ; status_46(D)->current_subroutine, status_46(D)->current_subroutine
	movq	16(%rax), %rcx	 ; _12->parameters, _12->parameters
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp148, vars
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:/TC/src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	%rdi, (%rax)	 ; original_name, var_58->original_name
	je	.L1	 ;,
.L12:
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%rbx, %rcx	 ; vars,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	 ; <retval>
	jne	.L13	 ;,
	jmp	.L7	 ;
	.p2align 4,,10
	.p2align 3
.L32:
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rbx), %rcx	 ; table_64->attributes, table_64->attributes
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	 ; tmp153
	jne	.L17	 ;,
 ; D:/TC/src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%rbx), %rcx	 ; table_64->attributes, table_64->attributes
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp154, attributes
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	jmp	.L19	 ;
	.p2align 4,,10
	.p2align 3
.L20:
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rax	 ; attr_69->var, <retval>
 ; D:/TC/src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	%rdi, (%rax)	 ; original_name, _27->original_name
	je	.L1	 ;,
.L19:
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%rbx, %rcx	 ; attributes,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	 ; attr
	jne	.L20	 ;,
	jmp	.L17	 ;
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "$%d-error\0"
.LC2:
	.ascii "$%c%zu\0"
	.text
	.p2align 4
	.def	create_var.constprop.0;	.scl	3;	.type	32;	.endef
create_var.constprop.0:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp102, type
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp101, original_name
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp103, status
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	je	.L40	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%rdx), %edx	 ; type_2(D)->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r12d, %r12d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	 ;
	jne	.L37	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rbp), %rax	 ; type_2(D)->ast_node.class, type_2(D)->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%r8), %r12	 ; status_4(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r8)	 ; type_2(D)->ast_node.class, status_4(D)->current_class
.L37:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rsi, %rdx	 ; status,
	movq	%rdi, %rcx	 ; original_name,
	call	search_var	 ;
	movq	%rax, %rbx	 ; tmp106, <retval>
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%rbp), %eax	 ; type_2(D)->kind,
	testl	%eax, %eax	 ;
	jne	.L38	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r12, 24(%rsi)	 ; current_class, status_4(D)->current_class
.L38:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L40	 ;,
 ; D:/TC/src/tac.c:193: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L40:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rcx	 ;, tmp94
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%rdi, (%rax)	 ; original_name, var_21->original_name
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rsi), %rdi	 ; status_4(D)->param_count, _24
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp104, <retval>
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp93
	movq	%rax, 56(%rsi)	 ; tmp93, status_4(D)->param_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _34, var_21->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp105, _34
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _24
	je	.L45	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _24,
	movl	$112, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp97
	call	sprintf	 ;
.L41:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rbp, 16(%rbx)	 ; type, var_21->type
 ; D:/TC/src/tac.c:193: }
	addq	$32, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$112, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp96
	call	sprintf	 ;
	jmp	.L41	 ;
	.p2align 4
	.def	create_var;	.scl	3;	.type	32;	.endef
create_var:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp128, original_name
	pushq	%rbp	 ;
	movl	%r8d, %ebp	 ; tmp130, kind
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp129, type
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp131, status
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%rcx, %rcx	 ; original_name
	je	.L59	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%rdx), %edx	 ; type_14(D)->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	 ;
	jne	.L56	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rdi), %rax	 ; type_14(D)->ast_node.class, type_14(D)->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%r9), %r13	 ; status_15(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; type_14(D)->ast_node.class, status_15(D)->current_class
.L56:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rsi, %rdx	 ; status,
	movq	%r12, %rcx	 ; original_name,
	call	search_var	 ;
	movq	%rax, %rbx	 ; tmp133, <retval>
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%rdi), %eax	 ; type_14(D)->kind,
	testl	%eax, %eax	 ;
	jne	.L57	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rsi)	 ; current_class, status_15(D)->current_class
.L57:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L59	 ;,
.L46:
 ; D:/TC/src/tac.c:193: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L59:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%r12, (%rax)	 ; original_name, var_22->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp132, <retval>
 ; D:/TC/src/tac.c:174:     switch (kind) {
	leal	-97(%rbp), %eax	 ;,
	cmpl	$21, %eax	 ;, tmp103
	ja	.L48	 ;,
	leaq	.L50(%rip), %rdx	 ;, tmp105
	movslq	(%rdx,%rax,4), %rax	 ;, tmp107
	addq	%rdx, %rax	 ; tmp105, tmp108
	jmp	*%rax	 ; tmp108
	.section .rdata,"dr"
	.align 4
.L50:
	.long	.L55-.L50
	.long	.L54-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L53-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L52-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L48-.L50
	.long	.L51-.L50
	.long	.L48-.L50
	.long	.L49-.L50
	.text
	.p2align 4,,10
	.p2align 3
.L48:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp111
	call	create_string	 ;
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC1(%rip), %rdx	 ;, tmp112
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _42, var_22->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp134, _42
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	call	sprintf	 ;
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rdi, 16(%rbx)	 ; type, var_22->type
	jmp	.L46	 ;
	.p2align 4,,10
	.p2align 3
.L49:
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rsi), %r12	 ; status_15(D)->var_count, id
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	 ;, tmp115
	movq	%rax, 64(%rsi)	 ; tmp115, status_15(D)->var_count
	.p2align 4,,10
	.p2align 3
.L61:
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rcx	 ;, tmp119
	movl	$32, %edx	 ;,
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _35, var_22->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp135, _35
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r12	 ;, id
	je	.L66	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r12, %r9	 ; id,
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC2(%rip), %rdx	 ;, tmp121
	call	sprintf	 ;
.L63:
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebp	 ;, tmp122
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rdi, 16(%rbx)	 ; type, var_22->type
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebp	 ;, tmp122
	jne	.L46	 ;,
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_15(D)->current_subroutine, status_15(D)->current_subroutine
	movq	%rbx, %rdx	 ; <retval>,
	movq	24(%rax), %rcx	 ; _40->local_vars, _40->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:193: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L51:
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %r12	 ; status_15(D)->temp_count, id
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r12), %rax	 ;, tmp116
	movq	%rax, 72(%rsi)	 ; tmp116, status_15(D)->temp_count
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L61	 ;
	.p2align 4,,10
	.p2align 3
.L52:
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rsi), %r12	 ; status_15(D)->param_count, id
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r12), %rax	 ;, tmp114
	movq	%rax, 56(%rsi)	 ; tmp114, status_15(D)->param_count
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L61	 ;
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rsi), %r12	 ; status_15(D)->subroutine_count, id
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r12), %rax	 ;, tmp118
	movq	%rax, 88(%rsi)	 ; tmp118, status_15(D)->subroutine_count
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L61	 ;
	.p2align 4,,10
	.p2align 3
.L54:
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rsi), %r12	 ; status_15(D)->block_count, id
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	 ;, tmp117
	movq	%rax, 80(%rsi)	 ; tmp117, status_15(D)->block_count
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L61	 ;
	.p2align 4,,10
	.p2align 3
.L55:
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rsi), %r12	 ; status_15(D)->attr_count, id
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r12), %rax	 ;, tmp113
	movq	%rax, 48(%rsi)	 ; tmp113, status_15(D)->attr_count
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L61	 ;
	.p2align 4,,10
	.p2align 3
.L66:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC1(%rip), %rdx	 ;, tmp120
	call	sprintf	 ;
	jmp	.L63	 ;
	.p2align 4
	.def	load_rvalue.part.0;	.scl	3;	.type	32;	.endef
load_rvalue.part.0:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp110, arg
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp111, status
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rcx), %r13	 ; arg_1(D)->type, _2
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rdi), %rsi	 ; status_3(D)->temp_count, _39
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp100
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_32->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	 ; tmp112, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp99
	movq	%rax, 72(%rdi)	 ; tmp99, status_3(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	 ; _45, var_32->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp113, _45
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _39
	je	.L71	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _39,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp102
	call	sprintf	 ;
.L69:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rdi), %rax	 ; status_3(D)->current_subroutine, status_3(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _2, var_32->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rbx, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _50->local_vars, _50->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp105
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; var_32->type, tmp105
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_19->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp114, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_19->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp105, MEM <vector(2) long unsigned int> [(void *)arg_19]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_6->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp115, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; <retval>, inst_6->arg1
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	 ;, inst_6->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_6->arg3
 ; D:/TC/src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rcx	 ; _7->instructions, _7->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:281: }
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
.L71:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	call	sprintf	 ;
	jmp	.L69	 ;
	.section .rdata,"dr"
	.align 8
.LC3:
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
	je	.L79	 ;,
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp104
 ; D:/TC/src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp104
	jbe	.L80	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L75	 ;,
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
.L75:
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:312:         fprintf(stderr, "[warning] Unsupported symbol kind for import: %d\n", import->name->kind);
	movl	%ebx, %r8d	 ; _2,
	leaq	.LC3(%rip), %rdx	 ;, tmp110
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
.L80:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L77:
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
.L79:
 ; D:/TC/src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%r8, %r9	 ; status,
	movq	(%rsi), %rdx	 ; _1->type, _1->type
	movl	$118, %r8d	 ;,
	jmp	.L77	 ;
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "[warning] Unsupported type for size lookup: %s\12\0"
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
	cmpl	$21, %eax	 ;, tmp125
	ja	.L82	 ;,
	movq	%rdx, %rbx	 ; tmp162, status
	leaq	.L84(%rip), %rdx	 ;, tmp127
	movq	%rcx, %rdi	 ; tmp161, variable
	movslq	(%rdx,%rax,4), %rax	 ;, tmp129
	addq	%rdx, %rax	 ; tmp127, tmp130
	jmp	*%rax	 ; tmp130
	.section .rdata,"dr"
	.align 4
.L84:
	.long	.L87-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L86-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L85-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L82-.L84
	.long	.L81-.L84
	.long	.L82-.L84
	.long	.L81-.L84
	.text
	.p2align 4,,10
	.p2align 3
.L82:
	movl	%r8d, 44(%rsp)	 ; type, %sfp
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:414:             fprintf(stderr, "[warning] Unsupported variable type for tac_variable: %d\n", type);
	movl	44(%rsp), %r8d	 ; %sfp, type
	leaq	.LC6(%rip), %rdx	 ;, tmp160
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
.L81:
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
.L85:
 ; D:/TC/src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r8	 ; status,
	call	create_var.constprop.0	 ;
	movq	%rax, %rdx	 ; tmp164, var
 ; D:/TC/src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
.L102:
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rcx	 ;, _7->global_vars
.L103:
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
.L86:
 ; D:/TC/src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rcx), %rdx	 ; variable_20(D)->type, variable_20(D)->type
	movq	8(%rcx), %rcx	 ; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
	movq	%rax, %rdx	 ; tmp165, var
 ; D:/TC/src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	jmp	.L102	 ;
	.p2align 4,,10
	.p2align 3
.L87:
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rbx), %rax	 ; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rcx	 ; _9->attribute_tables, _9->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rsi	 ; tmp166, attr_table
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
	movq	%rax, %rdi	 ; tmp167, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm1	 ; _13, _13
	movq	%rax, %xmm0	 ; tmp168, tmp144
	punpcklqdq	%xmm1, %xmm0	 ; _13, tmp144
	movups	%xmm0, (%rdi)	 ; tmp144, MEM <vector(2) long unsigned int> [(void *)attr_34]
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rsi), %rax	 ; attr_table_29->size, _36
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rdi)	 ; _36, attr_34->offset
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%r12, %r12	 ; _13
	je	.L88	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp145
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %r12	 ; name_int, _13
	je	.L100	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp146
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %r12	 ; name_float, _13
	je	.L100	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp147
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %r12	 ; name_string, _13
	je	.L100	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp148
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %r12	 ; name_bool, _13
	je	.L101	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp149
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %r12	 ; name_void, _13
	je	.L101	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edx	 ; _13->kind,
	testl	%edx, %edx	 ;
	jne	.L94	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%r12), %rdx	 ; _13->ast_node.class, _13->ast_node.class
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	 ; _49->size, _36
	.p2align 4,,10
	.p2align 3
.L88:
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%rsi), %rcx	 ; attr_table_29->attributes, _40
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%rax, 16(%rsi)	 ; _36, attr_table_29->size
 ; D:/TC/src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rdi, %rdx	 ; attr,
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _40
	jne	.L103	 ;,
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp158
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
.L94:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%r12), %rbx	 ; _13->name, _51
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC4(%rip), %rdx	 ;, tmp155
	movq	24(%rax), %rcx	 ; _52->_stderr, _52->_stderr
	movq	%rbx, %r8	 ; _51,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	16(%rsi), %rax	 ; attr_table_29->size, tmp175
	.p2align 4,,10
	.p2align 3
.L100:
	addq	$8, %rax	 ;, _36
	jmp	.L88	 ;
	.p2align 4,,10
	.p2align 3
.L101:
	addq	$1, %rax	 ;, _36
	jmp	.L88	 ;
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
	movq	%rcx, %rdi	 ; tmp354, variable_access
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp355, status
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rcx), %r8d	 ; variable_access_12(D)->type,
	testl	%r8d, %r8d	 ;
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_12(D)->content.name, _2
 ; D:/TC/src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L105	 ;,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, tmp404
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, pretmp_19
	movq	%rbx, %r9	 ; status,
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	subl	$1, %eax	 ;, tmp249
 ; D:/TC/src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	 ;, tmp249
	jbe	.L106	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rbx	 ; tmp356, _7
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _7, tmp251
	movhps	16(%rbx), %xmm0	 ;, tmp251
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_22->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp357, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp251,* <retval>
.L104:
 ; D:/TC/src/tac.c:845: }
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
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	movq	(%rdi), %rcx	 ; variable_access_12(D)->base, _48
 ; D:/TC/src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _48
	je	.L159	 ;,
 ; D:/TC/src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_variable_access	 ;
	movq	%rax, %rsi	 ; tmp361, base
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	 ; base
	je	.L112	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _51->is_get
	jne	.L160	 ;,
.L111:
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rdi), %r12d	 ; variable_access_12(D)->type, _56
 ; D:/TC/src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %r12d	 ;, _56
	je	.L161	 ;,
 ; D:/TC/src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %r12d	 ;, _56
	je	.L162	 ;,
 ; D:/TC/src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %r12d	 ;, _56
	jne	.L129	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rsi), %r12d	 ; _57->kind, _121
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%r12d, %r12d	 ; _121
	jne	.L130	 ;,
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rsi), %rax	 ; _57->type, _122
 ; D:/TC/src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %ecx	 ; _122->kind,
	testl	%ecx, %ecx	 ;
	je	.L163	 ;,
.L131:
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rbx	 ; prephitmp_373->name, _137
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movl	%r12d, %r8d	 ; _121,
	leaq	.LC15(%rip), %rdx	 ;, tmp321
	movq	24(%rax), %rcx	 ; _138->_stderr, _138->_stderr
	movq	%rbx, %r9	 ; _137,
	call	fprintf	 ;
.L109:
 ; D:/TC/src/tac.c:756:         return NULL;
	xorl	%r13d, %r13d	 ; <retval>
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L161:
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rsi), %rax	 ; _57->type, _58
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _58->kind, _59
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp259
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp259
	jbe	.L164	 ;,
 ; D:/TC/src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _58->ast_node.scope, scope
 ; D:/TC/src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _59
	jne	.L115	 ;,
 ; D:/TC/src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_64].class_scope, scope
.L115:
 ; D:/TC/src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rdi), %rax	 ; variable_access_12(D)->content.attr_name, variable_access_12(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _66->name, _66->name
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	je	.L165	 ;,
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %edx	 ; attr_69->kind, _76
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rdx), %ecx	 ;, tmp268
 ; D:/TC/src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %ecx	 ;, tmp268
	jbe	.L166	 ;,
 ; D:/TC/src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %edx	 ;, _76
	jne	.L167	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rax), %r13	 ; attr_69->type, _87
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r14	 ; status_13(D)->temp_count, _210
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp277
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_203->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp370, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	 ;, tmp276
	movq	%rax, 72(%rbx)	 ; tmp276, status_13(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _216, var_203->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp371, _216
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _210
	je	.L168	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _210,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp279
	call	sprintf	 ;
.L120:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_13(D)->current_subroutine, status_13(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%r12)	 ; _87, var_203->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r12, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _221->local_vars, _221->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	 ; var, tmp282
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	 ; var_203->type, tmp282
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_190->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp372, <retval>
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp282, MEM <vector(2) long unsigned int> [(void *)arg_190]
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rdi), %rcx	 ; variable_access_12(D)->content.attr_name, _90
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_190->kind
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _90->type, _90->type
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r12	 ; tmp373, _92
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	 ; _92, tmp285
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	 ; _92->type, tmp285
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_177->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp374, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_177->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp285, MEM <vector(2) long unsigned int> [(void *)arg_177]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; base, inst_94->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp375, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_94->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rdi, 16(%rax)	 ; arg, inst_94->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$15, 24(%rax)	 ;, inst_94->type
 ; D:/TC/src/tac.c:788:         temp->is_get = true;
	movb	$1, 20(%r13)	 ;,
 ; D:/TC/src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_13(D)->current_block, status_13(D)->current_block
	movq	8(%rax), %rcx	 ;, _95->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:791:         return temp;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L160:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; base,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp363, base
 ; D:/TC/src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	jne	.L111	 ;,
	.p2align 4,,10
	.p2align 3
.L112:
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:760:         fprintf(stderr, "[warning] Failed to generate variable access for base\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rcx	 ;, tmp258
	movq	24(%rax), %r9	 ; _54->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:762:         return NULL;
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L106:
 ; D:/TC/src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$102, %r8d	 ;,
.L158:
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp367, _79
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _79, tmp270
	movhps	16(%rbx), %xmm0	 ;, tmp270
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp368, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp270,* <retval>
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L162:
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rsi), %rax	 ; _57->type, _97
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %r12	 ; _97->name, pretmp_466
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	 ; _97->kind, _97->kind
	subl	$3, %eax	 ;, tmp289
 ; D:/TC/src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	 ;, tmp289
	ja	.L157	 ;,
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC13(%rip), %rdx	 ;, tmp294
	movq	%r12, %rcx	 ; pretmp_466,
	call	strcmp	 ;
 ; D:/TC/src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp377
	jne	.L157	 ;,
 ; D:/TC/src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rdi), %rcx	 ; variable_access_12(D)->content.index, variable_access_12(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp379, _108
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	 ; _108
	je	.L126	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _108->is_get
	jne	.L169	 ;,
.L125:
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%rsi), %rax	 ; _57->type, _57->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	(%rax), %r13	 ; _113->type, _114
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r14	 ; status_13(D)->temp_count, _244
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp302
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_237->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp382, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	 ;, tmp301
	movq	%rax, 72(%rbx)	 ; tmp301, status_13(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _250, var_237->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp383, _250
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _244
	je	.L170	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _244,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp304
	call	sprintf	 ;
.L128:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_13(D)->current_subroutine, status_13(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rdi)	 ; _114, var_237->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rdi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _255->local_vars, _255->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp307
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_237->type, tmp307
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_224->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp384, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_224->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp307, MEM <vector(2) long unsigned int> [(void *)arg_224]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; base, inst_117->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp385, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_117->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _108, inst_117->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$16, 24(%rax)	 ;, inst_117->type
 ; D:/TC/src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%r13)	 ;,
 ; D:/TC/src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_13(D)->current_block, status_13(D)->current_block
	movq	8(%rax), %rcx	 ;, _119->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:814:         return temp;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:/TC/src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %r12d	 ;, _121
	je	.L132	 ;,
 ; D:/TC/src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rsi), %rax	 ; _57->type, _122
	jmp	.L131	 ;
	.p2align 4,,10
	.p2align 3
.L163:
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ;, tmp311
	movq	8(%rax), %rcx	 ; _122->name, _122->name
	movq	(%rdx), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp386, _126
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rsi), %rax	 ; _57->type, _57->type
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _127->ast_node.class, _127->ast_node.class
	movq	16(%rax), %rcx	 ; _128->class_scope, _128->class_scope
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_130->type, attr_130->type
 ; D:/TC/src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp387, attr
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %r12	 ; tmp388, _132
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%r12, %xmm0	 ; _132, tmp318
	movhps	16(%r12), %xmm0	 ; _132->type, tmp318
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;, arg_258->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp389, base
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_258->is_get
 ; D:/TC/src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp318, MEM <vector(2) long unsigned int> [(void *)arg_258]
.L132:
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rdi), %rcx	 ; variable_access_12(D)->content.args, variable_access_12(D)->content.args
 ; D:/TC/src/tac.c:827:         long long arg_count = 0;
	xorl	%edi, %edi	 ; arg_count
 ; D:/TC/src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	call	list_copy	 ;
	movq	.refptr.name_int(%rip), %r12	 ;, tmp350
	movq	%rax, 40(%rsp)	 ; tmp391, %sfp
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L133	 ;
	.p2align 4,,10
	.p2align 3
.L172:
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp412
	cmpq	(%rdx), %rax	 ; name_float, _144
	je	.L135	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp413
	cmpq	(%rdx), %rax	 ; name_string, _144
	je	.L135	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp414
	movl	$1, %r13d	 ;, _16
	cmpq	(%rdx), %rax	 ; name_bool, _144
	je	.L134	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rcx	 ;, tmp327
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_void, _144
	je	.L134	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %edx	 ; _144->kind,
	testl	%edx, %edx	 ;
	jne	.L136	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	 ; _144->ast_node.class, _144->ast_node.class
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	24(%rax), %r13	 ; _290->size, _16
.L134:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:833:             arg_count++;
	addq	$1, %rdi	 ;, arg_count
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_271->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp394, arg
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%r13, (%rax)	 ; _16, arg_271->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	(%r12), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	 ;, arg_271->is_get
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	 ; name_int, arg_271->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	 ; arg, inst_148->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp395, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_148->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	 ; arg, inst_148->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_148->arg3
 ; D:/TC/src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_13(D)->current_block, status_13(D)->current_block
	movq	8(%rax), %rcx	 ; _149->instructions, _149->instructions
	call	list_append	 ;
.L133:
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp396, arg_expr
 ; D:/TC/src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L171	 ;,
 ; D:/TC/src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbx, %rdx	 ; status,
	xorl	%r13d, %r13d	 ; _16
	call	tac_expression	 ;
	movq	%rax, %r15	 ; tmp392, arg
 ; D:/TC/src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rax	 ; arg_143->type, _144
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%rax, %rax	 ; _144
	je	.L134	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%r12), %rax	 ; name_int, _144
	jne	.L172	 ;,
.L135:
	movl	$8, %r13d	 ;, _16
	jmp	.L134	 ;
	.p2align 4,,10
	.p2align 3
.L171:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rsi), %r13	 ; base_443->type, _153
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r15	 ; status_13(D)->temp_count, _329
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp336
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_322->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp397, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp335
	movq	%rax, 72(%rbx)	 ; tmp335, status_13(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _335, var_322->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp398, _335
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _329
	je	.L173	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _329,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp338
	call	sprintf	 ;
.L139:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_13(D)->current_subroutine, status_13(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%r14)	 ; _153, var_322->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r14, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _340->local_vars, _340->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp341
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; var_322->type, tmp341
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_309->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp399, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_309->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp341, MEM <vector(2) long unsigned int> [(void *)arg_309]
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rdi, (%rax)	 ; arg_count, arg_296->value.int_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp400, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_296->kind
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	(%r12), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	 ;, arg_296->is_get
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	 ; name_int, arg_296->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; base, inst_157->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp401, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; <retval>, inst_157->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	 ; arg, inst_157->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$22, 24(%rax)	 ;, inst_157->type
 ; D:/TC/src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_13(D)->current_block, status_13(D)->current_block
	movq	8(%rax), %rcx	 ;, _158->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:839:         return temp;
	jmp	.L104	 ;
	.p2align 4,,10
	.p2align 3
.L167:
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; _57->type, _57->type
	movq	8(%rax), %rsi	 ; _81->name, _82
	movq	8(%rdi), %rax	 ; variable_access_12(D)->content.attr_name, variable_access_12(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _83->name, _84
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _82,
	leaq	.LC11(%rip), %rdx	 ;, tmp275
	movq	24(%rax), %rcx	 ; _85->_stderr, _85->_stderr
	movq	%rbx, %r8	 ; _84,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:784:             return NULL;
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L159:
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:754:         fprintf(stderr, "[warning] Unsupported variable access with NULL base\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rcx	 ;, tmp256
	movq	24(%rax), %r9	 ; _49->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:756:         return NULL;
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L129:
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:841:         fprintf(stderr, "[warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%r12d, %r8d	 ; _56,
	leaq	.LC16(%rip), %rdx	 ;, tmp348
	movq	24(%rax), %rcx	 ; _160->_stderr, _160->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:843:         return NULL;
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L173:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp337
	call	sprintf	 ;
	jmp	.L139	 ;
	.p2align 4,,10
	.p2align 3
.L157:
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:799:             fprintf(stderr, "[warning] Attempting to index non-array type: %s\n", base->type->name);
	movq	%r12, %r8	 ; pretmp_466,
	leaq	.LC12(%rip), %rdx	 ;, tmp296
	movq	24(%rax), %rcx	 ;, _105->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:801:             return NULL;
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L170:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp303
	call	sprintf	 ;
	jmp	.L128	 ;
	.p2align 4,,10
	.p2align 3
.L168:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp278
	call	sprintf	 ;
	jmp	.L120	 ;
	.p2align 4,,10
	.p2align 3
.L166:
 ; D:/TC/src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rdx	 ; attr_69->type, attr_69->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	%rax, %rcx	 ; attr,
	jmp	.L158	 ;
	.p2align 4,,10
	.p2align 3
.L136:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rax), %r13	 ; _144->name, _292
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC4(%rip), %rdx	 ;, tmp330
	movq	24(%rax), %rcx	 ; _293->_stderr, _293->_stderr
	movq	%r13, %r8	 ; _292,
	call	fprintf	 ;
	jmp	.L135	 ;
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _108,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp381, _108
 ; D:/TC/src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	 ; _108
	jne	.L125	 ;,
.L126:
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:805:             fprintf(stderr, "[warning] Failed to generate variable access for index\n");
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rcx	 ;, tmp299
	movq	24(%rax), %r9	 ; _111->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:807:             return NULL;
	jmp	.L109	 ;
	.p2align 4,,10
	.p2align 3
.L164:
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _58->name, _61
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	leaq	.LC9(%rip), %rdx	 ;, tmp261
	movq	24(%rax), %rcx	 ; _62->_stderr, _62->_stderr
	movq	%rbx, %r8	 ; _61,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:768:             return NULL;
	jmp	.L109	 ;
.L165:
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; _57->type, _57->type
	movq	8(%rax), %rsi	 ; _70->name, _71
	movq	8(%rdi), %rax	 ; variable_access_12(D)->content.attr_name, variable_access_12(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _72->name, _73
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _71,
	leaq	.LC10(%rip), %rdx	 ;, tmp267
	movq	24(%rax), %rcx	 ; _74->_stderr, _74->_stderr
	movq	%rbx, %r8	 ; _73,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:777:             return NULL;
	jmp	.L109	 ;
	.section .rdata,"dr"
	.align 8
.LC18:
	.ascii "[warning] Unsupported type for negation: %s\12\0"
	.align 8
.LC19:
	.ascii "[warning] Unsupported primary type for tac_primary: %d\12\0"
	.section	.text.unlikely,"x"
.LCOLDB20:
	.text
.LHOTB20:
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
	movl	8(%rcx), %ebx	 ; primary_36(D)->type,
 ; D:/TC/src/tac.c:676: Arg* tac_primary(Primary* primary, TACStatus* status) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L175	 ;,
	movq	%rdx, %rsi	 ; tmp206, status
	leaq	.L177(%rip), %rdx	 ;, tmp149
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp151
	addq	%rdx, %rax	 ; tmp149, tmp152
	jmp	*%rax	 ; tmp152
	.section .rdata,"dr"
	.align 4
.L177:
	.long	.L185-.L177
	.long	.L184-.L177
	.long	.L183-.L177
	.long	.L182-.L177
	.long	.L181-.L177
	.long	.L180-.L177
	.long	.L179-.L177
	.long	.L178-.L177
	.long	.L176-.L177
	.text
	.p2align 4,,10
	.p2align 3
.L178:
 ; D:/TC/src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand, primary_36(D)->value.operand
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
	movq	%rax, %r12	 ; tmp220, _14
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	 ; _14
	je	.L190	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _14->is_get
	jne	.L202	 ;,
.L191:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%r12), %r13	 ; _88->type, _15
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %rbx	 ; status_37(D)->temp_count, _231
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp182
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_224->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp222, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp181
	movq	%rax, 72(%rsi)	 ; tmp181, status_37(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _237, var_224->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp223, _237
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	 ;, _231
	je	.L203	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _231,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp184
	call	sprintf	 ;
.L193:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_37(D)->current_subroutine, status_37(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rdi)	 ; _15, var_224->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rdi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _242->local_vars, _242->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp187
	movhps	16(%rdi), %xmm0	 ; var_224->type, tmp187
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdi	 ;, tmp189
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_211->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp224, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_211->kind
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp187, MEM <vector(2) long unsigned int> [(void *)arg_211]
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	movq	8(%r12), %rax	 ; _88->type, _16
 ; D:/TC/src/tac.c:718:             if (operand->type == name_int)
	cmpq	(%rdi), %rax	 ; name_int, _16
	je	.L204	 ;,
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %r13	 ;, tmp192
 ; D:/TC/src/tac.c:720:             else if (operand->type == name_float)
	cmpq	0(%r13), %rax	 ; name_float, _16
	je	.L205	 ;,
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _16->name, _21
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	leaq	.LC18(%rip), %rdx	 ;, tmp197
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	movq	%rbx, %r8	 ; _21,
 ; D:/TC/src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:723:                 fprintf(stderr, "[warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L176:
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ;* primary, primary_36(D)->value.var
 ; D:/TC/src/tac.c:739: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
 ; D:/TC/src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:739: }
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
.L185:
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ;* primary, primary_36(D)->value.literal_value
	movl	$10, %r8d	 ;,
	xorl	%edx, %edx	 ;
	call	strtoll	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rsi	 ; tmp207, _3
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; _3, arg_112->value.int_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp208, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_112->kind
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp155
	movq	(%rax), %rax	 ;, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int,
.L174:
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
.L184:
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ;* primary, primary_36(D)->value.literal_value
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movapd	%xmm0, %xmm6	 ; tmp209, _5
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm6, (%rax)	 ; _5, arg_125->value.float_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp210, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_125->kind
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp158
	movq	(%rax), %rax	 ;, name_float
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	%rax, 8(%rbx)	 ; name_float,
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L183:
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %xmm6	 ; primary_36(D)->value.literal_value, _6
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$3, 16(%rax)	 ;, arg_138->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp211, <retval>
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movdqa	%xmm6, %xmm0	 ; _6, tmp160
	movq	.refptr.name_string(%rip), %rax	 ;, tmp161
	movhps	(%rax), %xmm0	 ; name_string, tmp160
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:240:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rbx)	 ; tmp160, MEM <vector(2) long unsigned int> [(void *)arg_138]
 ; D:/TC/src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L182:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	 ;, arg_151->value.bool_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp212, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_151->kind
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp163
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L181:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	 ;, arg_164->value.bool_value
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp213, <retval>
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_164->kind
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp165
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:245:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L180:
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.expr, primary_36(D)->value.expr
 ; D:/TC/src/tac.c:739: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
 ; D:/TC/src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:739: }
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
.L179:
 ; D:/TC/src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand, primary_36(D)->value.operand
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
	movq	%rax, %r12	 ; tmp214, _9
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	 ; _9
	je	.L187	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L206	 ;,
.L187:
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp169
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	(%rax), %r13	 ; name_bool, name_bool.11_10
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %rbx	 ; status_37(D)->temp_count, _197
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp171
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_190->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp216, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rbx), %rax	 ;, tmp170
	movq	%rax, 72(%rsi)	 ; tmp170, status_37(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _203, var_190->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp217, _203
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbx	 ;, _197
	je	.L207	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _197,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp173
	call	sprintf	 ;
.L189:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_37(D)->current_subroutine, status_37(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rdi)	 ; name_bool.11_10, var_190->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rdi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _208->local_vars, _208->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp176
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_190->type, tmp176
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_177->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp218, <retval>
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_177->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp176, MEM <vector(2) long unsigned int> [(void *)arg_177]
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; _9, inst_80->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp219, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_80->arg1
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$13, 24(%rax)	 ;, inst_80->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_80->arg3
 ; D:/TC/src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ;, _11->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:710:             return temp;
	jmp	.L174	 ;
.L175:
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC19(%rip), %rdx	 ;, tmp202
 ; D:/TC/src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:735:             fprintf(stderr, "[warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _27->_stderr, _27->_stderr
	call	fprintf	 ;
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L205:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_258->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp227, arg
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	.LC17(%rip), %rax	 ;, tmp235
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_258->is_get
 ; D:/TC/src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	%rax, (%rdi)	 ; tmp235, arg_258->value.float_value
 ; D:/TC/src/tac.c:237:             arg->type = name_float;
	movq	0(%r13), %rax	 ; name_float, name_float
	movq	%rax, 8(%rdi)	 ; name_float, arg_258->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$2, 24(%rax)	 ;, inst_90->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp228, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_90->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; arg, inst_90->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _14,
.L195:
 ; D:/TC/src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ;, _24->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:729:             return temp;
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L203:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp183
	call	sprintf	 ;
	jmp	.L193	 ;
	.p2align 4,,10
	.p2align 3
.L207:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp172
	call	sprintf	 ;
	jmp	.L189	 ;
	.p2align 4,,10
	.p2align 3
.L206:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _9,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp215, _9
	jmp	.L187	 ;
	.p2align 4,,10
	.p2align 3
.L202:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _14,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp221, _14
	jmp	.L191	 ;
	.p2align 4,,10
	.p2align 3
.L204:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_245->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp225, arg
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_245->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	(%rdi), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_245->is_get
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r13)	 ; name_int, arg_245->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$1, 24(%rax)	 ;, inst_89->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp226, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_89->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_89->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _14,
	jmp	.L195	 ;
	.section	.text.unlikely,"x"
	.def	tac_primary.cold;	.scl	3;	.type	32;	.endef
tac_primary.cold:
.L190:
 ; D:/TC/src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _365
	ud2	
	.text
	.section	.text.unlikely,"x"
.LCOLDE20:
	.text
.LHOTE20:
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "[warning] Left-hand side of assignment is not a variable\12\0"
	.text
	.p2align 4
	.globl	tac_expression
	.def	tac_expression;	.scl	2;	.type	32;	.endef
tac_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp165, expression
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp166, status
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_27(D)->operator
	je	.L233	 ;,
 ; D:/TC/src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_27(D)->right, expression_27(D)->right
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp167, <retval>
 ; D:/TC/src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L210	 ;,
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _4->is_get
	jne	.L234	 ;,
.L210:
 ; D:/TC/src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	 ; expression_27(D)->operator,
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rcx	 ; expression_27(D)->expr_left, pretmp_99
	cmpl	$18, %eax	 ;, _5
	ja	.L211	 ;,
	leaq	CSWTCH.18(%rip), %rdx	 ;, tmp136
	movl	(%rdx,%rax,4), %r13d	 ; CSWTCH.18[_5], _43
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp169, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	 ; expression_27(D)->operator, expression_27(D)->operator
	subl	$13, %eax	 ;, tmp138
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp138
	ja	.L212	 ;,
 ; D:/TC/src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	 ;, _43
	jne	.L222	 ;,
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%rdi), %eax	 ; left_193->kind,
	testl	%eax, %eax	 ;
	jne	.L235	 ;,
.L217:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_53->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp176, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; left, inst_53->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_53->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_53->arg3
 ; D:/TC/src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_193->is_get
	jne	.L236	 ;,
.L218:
 ; D:/TC/src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _16->instructions, _16->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:675: }
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
.L211:
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	 ;, _43
 ; D:/TC/src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp183, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	 ; expression_27(D)->operator, expression_27(D)->operator
	subl	$13, %eax	 ;, tmp163
 ; D:/TC/src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp163
	ja	.L212	 ;,
.L222:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %r12	 ; left_59->type, _8
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r15	 ; status_28(D)->temp_count, _108
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp141
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_101->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp170, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp140
	movq	%rax, 72(%rbx)	 ; tmp140, status_28(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _114, var_101->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp171, _114
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _108
	je	.L237	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _108,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp143
	call	sprintf	 ;
.L215:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r12, 16(%r14)	 ; _8, var_101->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r14, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _119->local_vars, _119->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp146
	movhps	16(%r14), %xmm0	 ; var_101->type, tmp146
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_88->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp172, arg
 ; D:/TC/src/tac.c:280:     return arg;
	movq	%rdi, %r14	 ; left, _50
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_88->kind
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp146, MEM <vector(2) long unsigned int> [(void *)arg_88]
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	 ;, left_59->is_get
	jne	.L238	 ;,
.L216:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _50, inst_48->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp174, inst
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_48->arg3
 ; D:/TC/src/tac.c:660:             right = temp;
	movq	%r12, %rsi	 ; arg, <retval>
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _43, inst_48->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_48->arg1
 ; D:/TC/src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%rdi), %eax	 ; left_193->kind,
	testl	%eax, %eax	 ;
	je	.L217	 ;,
.L235:
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:663:             fprintf(stderr, "[warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp151
	movq	24(%rax), %r9	 ; _12->_stderr,
	call	fwrite	 ;
	jmp	.L217	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rdi), %r12	 ; left_34->type, _15
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r15	 ; status_28(D)->temp_count, _142
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp153
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_135->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp178, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp152
	movq	%rax, 72(%rbx)	 ; tmp152, status_28(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _148, var_135->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp179, _148
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _142
	je	.L239	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _142,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp155
	call	sprintf	 ;
.L220:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r12, 16(%r14)	 ; _15, var_135->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r14, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _153->local_vars, _153->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp158
	movhps	16(%r14), %xmm0	 ; var_135->type, tmp158
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_122->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp180, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_122->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp158, MEM <vector(2) long unsigned int> [(void *)arg_122]
 ; D:/TC/src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	 ;, left_34->is_get
	jne	.L240	 ;,
.L221:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_55->arg3
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp182, inst
 ; D:/TC/src/tac.c:670:         right = temp;
	movq	%r12, %rsi	 ; arg, <retval>
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _43, inst_55->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_55->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; left, inst_55->arg2
	jmp	.L218	 ;
	.p2align 4,,10
	.p2align 3
.L233:
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_27(D)->prim_left, expression_27(D)->prim_left
 ; D:/TC/src/tac.c:675: }
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
	.p2align 4,,10
	.p2align 3
.L239:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp154
	call	sprintf	 ;
	jmp	.L220	 ;
	.p2align 4,,10
	.p2align 3
.L237:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp142
	call	sprintf	 ;
	jmp	.L215	 ;
	.p2align 4,,10
	.p2align 3
.L236:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$24, 24(%rax)	 ;, inst_54->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp177, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; left, inst_54->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_54->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_54->arg3
	jmp	.L218	 ;
	.p2align 4,,10
	.p2align 3
.L234:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; <retval>,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp168, <retval>
	jmp	.L210	 ;
	.p2align 4,,10
	.p2align 3
.L240:
	movq	%rdi, %rcx	 ; left,
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp181, left
	jmp	.L221	 ;
	.p2align 4,,10
	.p2align 3
.L238:
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp173, _50
	jmp	.L216	 ;
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15	 ;
	pushq	%r14	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r14	 ;, tmp221
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r13	 ;
	movq	%rcx, %r13	 ; tmp224, if_
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp225, status
	subq	$72, %rsp	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_52(D)->block_count, _229
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_220->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp226, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp170
	movq	%rax, 80(%rbx)	 ; tmp170, status_52(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _233, var_220->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp227, _233
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _229
	je	.L275	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _229,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp173
	call	sprintf	 ;
.L243:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_220->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_52(D)->block_count, _208
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_199->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp228, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp174
	movq	%rax, 80(%rbx)	 ; tmp174, status_52(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _212, var_199->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp229, _212
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _208
	je	.L276	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _208,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp177
	call	sprintf	 ;
.L245:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rsi)	 ;, var_199->type
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r13), %rcx	 ; if__54(D)->else_if, if__54(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp230
	je	.L250	 ;,
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r13), %rcx	 ; if__54(D)->else_body, if__54(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:469:         end_label = else_label;
	movq	%rsi, 56(%rsp)	 ; var, %sfp
 ; D:/TC/src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp233
	je	.L250	 ;,
.L249:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_107->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp234, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_107->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	56(%rsp), %rax	 ; %sfp, var
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_107->is_get
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	0(%r13), %rcx	 ; if__54(D)->condition, if__54(D)->condition
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, (%r12)	 ; var, arg_107->value.label
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rax, 40(%rsp)	 ; condition, %sfp
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_106->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp236, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_106->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; var, arg_106->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_106->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_105->value.label
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_105->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_105->type
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_105->is_get
	movq	%rax, 32(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	40(%rsp), %r9	 ; %sfp, condition
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	32(%rsp), %r8	 ; %sfp, arg
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp238, inst
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	 ; arg, inst_104->arg3
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r8, 8(%rax)	 ; arg, inst_104->arg2
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r9, (%rax)	 ; condition, inst_104->arg1
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_104->type
 ; D:/TC/src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _6->instructions, _6->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_102->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp239, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp240, block_102->instructions
 ; D:/TC/src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _8->blocks, _8->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:480:     status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r13), %rcx	 ; if__54(D)->body, if__54(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp241, then_statements
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L252	 ;
	.p2align 4,,10
	.p2align 3
.L253:
 ; D:/TC/src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L252:
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp242, statement
 ; D:/TC/src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L253	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_108->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp243, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_108->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_108->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_108->arg3
 ; D:/TC/src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _11->instructions, _11->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r13), %rcx	 ; if__54(D)->else_if, if__54(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp244
	je	.L277	 ;,
.L254:
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r13), %rcx	 ; if__54(D)->else_body, if__54(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp264
	je	.L278	 ;,
.L265:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp270, block
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	56(%rsp), %rax	 ; %sfp, var
	movq	%rax, (%rsi)	 ; var, block_122->label
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp271, block_122->instructions
 ; D:/TC/src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _36->blocks, _36->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:540:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_52(D)->current_block
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
.L250:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_52(D)->block_count, _250
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_241->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	 ; tmp231, var
	movq	%rax, 56(%rsp)	 ; var, %sfp
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp179
	movq	%rax, 80(%rbx)	 ; tmp179, status_52(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	 ; _254, var_241->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp232, _254
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _250
	je	.L279	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _250,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp183
	call	sprintf	 ;
.L251:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	56(%rsp), %rax	 ; %sfp, var
	movq	$0, 16(%rax)	 ;, var_241->type
	jmp	.L249	 ;
	.p2align 4,,10
	.p2align 3
.L279:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp182
	call	sprintf	 ;
	jmp	.L251	 ;
	.p2align 4,,10
	.p2align 3
.L276:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp176
	call	sprintf	 ;
	jmp	.L245	 ;
	.p2align 4,,10
	.p2align 3
.L275:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp172
	call	sprintf	 ;
	jmp	.L243	 ;
	.p2align 4,,10
	.p2align 3
.L278:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; var, block_119->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp265, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp266, block_119->instructions
 ; D:/TC/src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _31->blocks, _31->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:527:         status->current_block = else_block;
	movq	%rdi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r13), %rcx	 ; if__54(D)->else_body, if__54(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp267, else_statements
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L266	 ;
	.p2align 4,,10
	.p2align 3
.L267:
 ; D:/TC/src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L266:
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp268, else_statement
 ; D:/TC/src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L267	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_121->arg1
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp269, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_121->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_121->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_121->arg3
 ; D:/TC/src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _34->instructions, _34->instructions
	call	list_append	 ;
	jmp	.L265	 ;
	.p2align 4,,10
	.p2align 3
.L277:
 ; D:/TC/src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r13), %rcx	 ; if__54(D)->else_if, if__54(D)->else_if
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp245, %sfp
	.p2align 4,,10
	.p2align 3
.L255:
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rbp	 ; tmp263, elif
 ; D:/TC/src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L254	 ;,
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; var, block_111->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp246, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp247, block_111->instructions
 ; D:/TC/src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _16->blocks, _16->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:498:             status->current_block = else_if_block;
	movq	%rdi, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_52(D)->block_count, _292
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_283->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp248, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp196
	movq	%rax, 80(%rbx)	 ; tmp196, status_52(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _296, var_283->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp249, _296
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _292
	je	.L280	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _292,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L257:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_283->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %r15	 ; status_52(D)->block_count, _271
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp221,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_262->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp250, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r15), %rax	 ;, tmp200
	movq	%rax, 80(%rbx)	 ; tmp200, status_52(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _275, var_262->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp251, _275
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _271
	je	.L281	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _271,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L259:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rsi)	 ;, var_262->type
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	0(%rbp), %rcx	 ; elif_71->condition, elif_71->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	32(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	%rax, 40(%rsp)	 ; tmp252, %sfp
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp253
	jne	.L282	 ;,
.L261:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_117->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	 ; tmp255, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_117->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; var, arg_117->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_117->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_116->value.label
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_116->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_116->type
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_116->is_get
	movq	%rax, 48(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	48(%rsp), %r9	 ; %sfp, arg
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp257, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_115->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	40(%rsp), %rax	 ; %sfp, condition
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r9, 8(%rdx)	 ; arg, inst_115->arg2
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rax, (%rdx)	 ; condition, inst_115->arg1
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r15, 16(%rdx)	 ; arg, inst_115->arg3
 ; D:/TC/src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rcx	 ; _22->instructions, _22->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_113->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r15	 ; tmp258, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r15, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r15)	 ; tmp259, block_113->instructions
 ; D:/TC/src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _24->blocks, _24->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:511:             status->current_block = then_block;
	movq	%r15, 16(%rbx)	 ; block, status_52(D)->current_block
 ; D:/TC/src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%rbp), %rcx	 ; elif_71->body, elif_71->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp260, elif_statements
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L262	 ;
	.p2align 4,,10
	.p2align 3
.L263:
 ; D:/TC/src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L262:
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp261, elif_statement
 ; D:/TC/src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L263	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_118->arg1
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp262, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_118->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_118->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_118->arg3
 ; D:/TC/src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rcx	 ; _27->instructions, _27->instructions
	call	list_append	 ;
	jmp	.L255	 ;
	.p2align 4,,10
	.p2align 3
.L281:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L280:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L257	 ;
	.p2align 4,,10
	.p2align 3
.L282:
 ; D:/TC/src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r13), %rcx	 ; if__54(D)->else_body, if__54(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	 ; tmp254
	cmovne	56(%rsp), %rsi	 ; var,, %sfp, var
	jmp	.L261	 ;
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
	ja	.L284	 ;,
	movq	%rdx, %rdi	 ; tmp148, status
	leaq	.L286(%rip), %rdx	 ;, tmp118
	movq	%rcx, %rsi	 ; tmp147, statement
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp120
	addq	%rdx, %rax	 ; tmp118, tmp121
	jmp	*%rax	 ; tmp121
	.section .rdata,"dr"
	.align 4
.L286:
	.long	.L293-.L286
	.long	.L283-.L286
	.long	.L291-.L286
	.long	.L290-.L286
	.long	.L289-.L286
	.long	.L288-.L286
	.long	.L287-.L286
	.long	.L285-.L286
	.text
	.p2align 4,,10
	.p2align 3
.L287:
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rdi), %rcx	 ; status_32(D)->end_labels, status_32(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp152
	jne	.L295	 ;,
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rdi), %rax	 ; status_32(D)->end_labels, status_32(D)->end_labels
 ; D:/TC/src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _11->tail, _11->tail
	movq	8(%rax), %rbx	 ; _12->content, label
 ; D:/TC/src/tac.c:437:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	je	.L295	 ;,
.L309:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;,
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp153, inst
	jmp	.L307	 ;
	.p2align 4,,10
	.p2align 3
.L285:
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rdi), %rcx	 ; status_32(D)->start_labels, status_32(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp155
	jne	.L296	 ;,
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rdi), %rax	 ; status_32(D)->start_labels, status_32(D)->start_labels
 ; D:/TC/src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _19->tail, _19->tail
	movq	8(%rax), %rbx	 ; _20->content, label
 ; D:/TC/src/tac.c:448:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	jne	.L309	 ;,
.L296:
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp144
	movq	24(%rax), %r9	 ; _23->_stderr,
	jmp	.L308	 ;
	.p2align 4,,10
	.p2align 3
.L291:
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
.L293:
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
.L283:
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L289:
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
.L288:
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
	je	.L294	 ;,
 ; D:/TC/src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp150, arg
.L294:
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$21, 24(%rax)	 ;, inst_54->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp151, inst
.L307:
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
.L290:
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
.L295:
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:443:             fprintf(stderr, "[warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp137
	movq	24(%rax), %r9	 ; _15->_stderr,
.L308:
 ; D:/TC/src/tac.c:461: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:454:             fprintf(stderr, "[warning] 'continue' statement used outside of loop\n");
	jmp	fwrite	 ;
.L284:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[warning] Unsupported statement type for tac_statement: %d\n", statement->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC24(%rip), %rdx	 ;, tmp146
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
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r15	 ;, tmp202
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp203, for_
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp204, status
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_41(D)->block_count, _254
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp202,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_245->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	 ; tmp205, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp159
	movq	%rax, 80(%rbx)	 ; tmp159, status_41(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	 ; _258, var_245->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp206, _258
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _254
	je	.L329	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _254,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp162
	call	sprintf	 ;
.L312:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rbp)	 ;, var_245->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_41(D)->block_count, _233
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp202,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_224->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp207, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp163
	movq	%rax, 80(%rbx)	 ; tmp163, status_41(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _237, var_224->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp208, _237
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _233
	je	.L330	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _233,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp166
	call	sprintf	 ;
.L314:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r13)	 ;, var_224->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_41(D)->block_count, _212
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp202,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_203->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp209, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp167
	movq	%rax, 80(%rbx)	 ; tmp167, status_41(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _216, var_203->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp210, _216
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _212
	je	.L331	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _212,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp170
	call	sprintf	 ;
.L316:
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__40(D)->condition
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_203->type
 ; D:/TC/src/tac.c:552:     if (for_->condition != NULL) {
	je	.L317	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp211, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_78->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_78->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp212, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_77->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_77->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_77->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_77->arg3
 ; D:/TC/src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rcx	 ; _2->instructions, _2->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; var, block_75->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp213, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp214, block_75->instructions
 ; D:/TC/src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _4->blocks, _4->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:558:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; block, status_41(D)->current_block
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%rdi), %rcx	 ; for__40(D)->condition, for__40(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	%rax, 40(%rsp)	 ; condition, %sfp
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_74->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp216, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_74->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_74->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_74->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_73->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp217, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_73->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_73->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_73->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	40(%rsp), %r8	 ; %sfp, condition
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_72->arg2
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp218, inst
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_72->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r8, (%rax)	 ; condition, inst_72->arg1
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_72->arg3
 ; D:/TC/src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rcx	 ;, _7->instructions
	call	list_append	 ;
.L318:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; var, block_82->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp221, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp222, block_82->instructions
 ; D:/TC/src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _11->blocks, _11->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:571:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; block, status_41(D)->current_block
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_41(D)->block_count, _275
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp202,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_266->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp223, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp182
	movq	%rax, 80(%rbx)	 ; tmp182, status_41(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _279, var_266->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp224, _279
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _275
	je	.L332	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _275,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp185
	call	sprintf	 ;
.L320:
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__40(D)->increment
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r14)	 ;, var_266->type
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:574:     if (for_->increment != NULL)
	je	.L321	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_41(D)->start_labels, status_41(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp225, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_84->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_84->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; var, arg_84->value.label
 ; D:/TC/src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	list_append	 ;
.L322:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_87->is_get
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_41(D)->end_labels, status_41(D)->end_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp228, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_87->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_87->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_87->value.label
 ; D:/TC/src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__40(D)->body, for__40(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp229, body_statements
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L324	 ;
	.p2align 4,,10
	.p2align 3
.L325:
 ; D:/TC/src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L324:
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp230, statement
 ; D:/TC/src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L325	 ;,
 ; D:/TC/src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_41(D)->start_labels, status_41(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_41(D)->end_labels, status_41(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__40(D)->increment
	je	.L326	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_91->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp231, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_91->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; var, arg_91->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_91->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp232, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_90->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_90->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_90->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_90->arg3
 ; D:/TC/src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rcx	 ; _23->instructions, _23->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	 ; var, block_88->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp233, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp234, block_88->instructions
 ; D:/TC/src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _25->blocks, _25->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:593:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; block, status_41(D)->current_block
 ; D:/TC/src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%rdi), %rcx	 ; for__40(D)->increment, for__40(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
.L326:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_93->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp235, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_93->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_93->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_93->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__40(D)->condition
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_92->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp236, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_92->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_92->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_92->arg3
 ; D:/TC/src/tac.c:598:     if (for_->condition == NULL)
	je	.L333	 ;,
.L327:
 ; D:/TC/src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rcx	 ; _29->instructions, _29->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_96->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp239, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp240, block_96->instructions
 ; D:/TC/src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _31->blocks, _31->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:604:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_41(D)->current_block
 ; D:/TC/src/tac.c:606: }
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
.L321:
 ; D:/TC/src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__40(D)->condition
	je	.L323	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_41(D)->start_labels, status_41(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp226, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_85->value.label
 ; D:/TC/src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
	jmp	.L322	 ;
	.p2align 4,,10
	.p2align 3
.L332:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp184
	call	sprintf	 ;
	jmp	.L320	 ;
	.p2align 4,,10
	.p2align 3
.L331:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp169
	call	sprintf	 ;
	jmp	.L316	 ;
	.p2align 4,,10
	.p2align 3
.L330:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp165
	call	sprintf	 ;
	jmp	.L314	 ;
	.p2align 4,,10
	.p2align 3
.L329:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp161
	call	sprintf	 ;
	jmp	.L312	 ;
	.p2align 4,,10
	.p2align 3
.L317:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_80->value.label
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp219, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_80->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_79->arg1
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp220, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_79->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_79->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_79->arg3
 ; D:/TC/src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rcx	 ;, _9->instructions
	call	list_append	 ;
	jmp	.L318	 ;
	.p2align 4,,10
	.p2align 3
.L333:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_95->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp237, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_95->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_95->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_95->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_94->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp238, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_94->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_94->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_94->arg3
	jmp	.L327	 ;
	.p2align 4,,10
	.p2align 3
.L323:
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_41(D)->start_labels, status_41(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp227, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_86->value.label
 ; D:/TC/src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
	jmp	.L322	 ;
	.p2align 4
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r13	 ;, tmp162
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp163, while_
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp164, status
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_21(D)->block_count, _172
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp162,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_163->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp165, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp132
	movq	%rax, 80(%rbx)	 ; tmp132, status_21(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _176, var_163->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp166, _176
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _172
	je	.L344	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _172,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp135
	call	sprintf	 ;
.L336:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_163->type
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_55->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp167, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_55->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_55->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_55->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp168, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	 ; arg, inst_54->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_54->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_54->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_54->arg3
 ; D:/TC/src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _1->instructions, _1->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_52->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp169, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp170, block_52->instructions
 ; D:/TC/src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _3->blocks, _3->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:615:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	 ; block, status_21(D)->current_block
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_21(D)->block_count, _151
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp162,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_142->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp171, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp140
	movq	%rax, 80(%rbx)	 ; tmp140, status_21(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _155, var_142->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp172, _155
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _151
	je	.L345	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _151,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp143
	call	sprintf	 ;
.L338:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_142->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %r14	 ; status_21(D)->block_count, _130
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp162,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_121->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	 ; tmp173, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	 ;, tmp144
	movq	%rax, 80(%rbx)	 ; tmp144, status_21(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	 ; _134, var_121->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp174, _134
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _130
	je	.L346	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _130,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp147
	call	sprintf	 ;
.L340:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rbp)	 ;, var_121->type
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	(%rsi), %rcx	 ; while__25(D)->condition, while__25(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	%rax, %r15	 ; tmp175, condition
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_49->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp176, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_49->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_49->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_49->is_get
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_48->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp177, arg
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_48->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_48->value.label
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_48->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp178, inst
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_47->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	 ; arg, inst_47->arg3
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_47->type
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; condition, inst_47->arg1
 ; D:/TC/src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _6->instructions, _6->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_45->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r13	 ; tmp179, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r13, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	 ; tmp180, block_45->instructions
 ; D:/TC/src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _8->blocks, _8->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:625:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; block, status_21(D)->current_block
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_44->is_get
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_21(D)->start_labels, status_21(D)->start_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp181, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_44->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_44->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_44->value.label
 ; D:/TC/src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_43->is_get
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_21(D)->end_labels, status_21(D)->end_labels
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp182, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_43->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_43->type
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_43->value.label
 ; D:/TC/src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__25(D)->body, while__25(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp183, body_statements
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L341	 ;
	.p2align 4,,10
	.p2align 3
.L342:
 ; D:/TC/src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L341:
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp184, statement
 ; D:/TC/src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L342	 ;,
 ; D:/TC/src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_21(D)->start_labels, status_21(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_21(D)->end_labels, status_21(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_60->value.label
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp185, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_60->kind
 ; D:/TC/src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_60->type
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_60->is_get
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp186, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_59->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_59->arg2
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_59->type
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_59->arg3
 ; D:/TC/src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rcx	 ; _15->instructions, _15->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; var, block_57->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp187, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp188, block_57->instructions
 ; D:/TC/src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _17->blocks, _17->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:641:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_21(D)->current_block
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
	.p2align 4,,10
	.p2align 3
.L344:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp134
	call	sprintf	 ;
	jmp	.L336	 ;
	.p2align 4,,10
	.p2align 3
.L346:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp146
	call	sprintf	 ;
	jmp	.L340	 ;
	.p2align 4,,10
	.p2align 3
.L345:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp142
	call	sprintf	 ;
	jmp	.L338	 ;
	.p2align 4
	.globl	tac_function
	.def	tac_function;	.scl	2;	.type	32;	.endef
tac_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp138, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)]
 ; D:/TC/src/tac.c:315: void tac_function(Function* function, TACStatus* status) {
	movq	%rcx, 16(%rbp)	 ; tmp137, function
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_43]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp139, subroutine
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp140, subroutine_43->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp141, subroutine_43->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp142, subroutine_43->blocks
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_18(D)->tac, status_18(D)->tac
 ; D:/TC/src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_18(D)->current_subroutine
 ; D:/TC/src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp157
	movq	16(%rax), %rcx	 ; function_15(D)->parameters, function_15(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp143, parameters
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L348	 ;
	.p2align 4,,10
	.p2align 3
.L354:
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_43->parameters, subroutine_43->parameters
	movq	%r15, %rdx	 ; var,
	call	list_append	 ;
.L348:
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L365	 ;,
 ; D:/TC/src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r13	 ; parameter_24->name, _7
	movq	(%rax), %r14	 ; parameter_24->type, _6
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%r13, %r13	 ; _7
	je	.L355	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %edx	 ; _6->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r12d, %r12d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	 ;
	jne	.L352	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	 ; _6->ast_node.class, _6->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r12	 ; status_18(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	 ; _6->ast_node.class, status_18(D)->current_class
.L352:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rdx	 ; status,
	movq	%r13, %rcx	 ; _7,
	call	search_var	 ;
	movq	%rax, %r15	 ; tmp146, var
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %eax	 ; _6->kind,
	testl	%eax, %eax	 ;
	jne	.L353	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r12, 24(%rbx)	 ; current_class, status_18(D)->current_class
.L353:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%r15, %r15	 ; var
	jne	.L354	 ;,
.L355:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rcx	 ;,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%r13, (%rax)	 ; _7, var_55->original_name
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbx), %r13	 ; status_18(D)->param_count, _58
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	 ; tmp144, var
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r13), %rax	 ;, tmp119
	movq	%rax, 56(%rbx)	 ; tmp119, status_18(D)->param_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	 ; _68, var_55->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp145, _68
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r13	 ;, _58
	je	.L366	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r13, %r9	 ; _58,
	movl	$112, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L356:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r14, 16(%r15)	 ; _6, var_55->type
	jmp	.L354	 ;
	.p2align 4,,10
	.p2align 3
.L366:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$112, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L356	 ;
	.p2align 4,,10
	.p2align 3
.L365:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rdi	 ; status_18(D)->block_count, _85
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_76->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp148, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp125
	movq	%rax, 80(%rbx)	 ; tmp125, status_18(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _89, var_76->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp149, _89
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _85
	je	.L367	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _85,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp128
	call	sprintf	 ;
.L359:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r14)	 ;, var_76->type
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	 ; var, block_35->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp150, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_43->blocks, subroutine_43->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp151, block_35->instructions
 ; D:/TC/src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp158
 ; D:/TC/src/tac.c:329:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_18(D)->current_block
 ; D:/TC/src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rax), %rcx	 ; function_15(D)->body, function_15(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp152, statements
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L360	 ;
	.p2align 4,,10
	.p2align 3
.L361:
 ; D:/TC/src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L360:
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp153, statement
 ; D:/TC/src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L361	 ;,
 ; D:/TC/src/tac.c:336:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_18(D)->current_subroutine
 ; D:/TC/src/tac.c:338: }
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
.L367:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp127
	call	sprintf	 ;
	jmp	.L359	 ;
	.p2align 4
	.globl	tac_method
	.def	tac_method;	.scl	2;	.type	32;	.endef
tac_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp170, method
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp171, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_71]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp172, subroutine
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp173, subroutine_71->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp174, subroutine_71->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp175, subroutine_71->blocks
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_33(D)->tac, status_33(D)->tac
 ; D:/TC/src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_33(D)->current_subroutine
 ; D:/TC/src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rcx	 ; method_30(D)->parameters, method_30(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp176, parameters
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L369	 ;
	.p2align 4,,10
	.p2align 3
.L370:
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rdx	 ; parameter_39->type, parameter_39->type
	movq	8(%rax), %rcx	 ; parameter_39->name, parameter_39->name
	movq	%rbx, %r8	 ; status,
	call	create_var.constprop.0	 ;
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_71->parameters, subroutine_71->parameters
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rdx	 ; tmp177, _8
 ; D:/TC/src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	list_append	 ;
.L369:
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	jne	.L370	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r14	 ;, tmp169
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rdi	 ; status_33(D)->block_count, _84
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp169,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_75->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp179, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp142
	movq	%rax, 80(%rbx)	 ; tmp142, status_33(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _88, var_75->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp180, _88
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _84
	je	.L379	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _84,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp145
	call	sprintf	 ;
.L372:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r13)	 ;, var_75->type
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; var, block_55->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp181, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_71->blocks, subroutine_71->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp182, block_55->instructions
 ; D:/TC/src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp147
 ; D:/TC/src/tac.c:353:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_33(D)->current_block
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_33(D)->current_class, status_33(D)->current_class
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _12->name, _12->name
	movq	8(%rax), %rcx	 ; _13->name, _13->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp183, _15
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%r12), %rax	 ; method_30(D)->name, method_30(D)->name
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _16->name, _16->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp184
	je	.L380	 ;,
.L373:
 ; D:/TC/src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r12), %rcx	 ; method_30(D)->body, method_30(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp190, statements
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L376	 ;
	.p2align 4,,10
	.p2align 3
.L377:
 ; D:/TC/src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L376:
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp191, statement
 ; D:/TC/src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L377	 ;,
 ; D:/TC/src/tac.c:364:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_33(D)->current_subroutine
 ; D:/TC/src/tac.c:366: }
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
.L379:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp144
	call	sprintf	 ;
	jmp	.L372	 ;
	.p2align 4,,10
	.p2align 3
.L380:
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	 ; status_33(D)->current_class, status_33(D)->current_class
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	(%rax), %r13	 ; _19->name, _20
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r15	 ; status_33(D)->temp_count, _129
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r14, %rcx	 ; tmp169,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_122->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp185, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r15), %rax	 ;, tmp157
	movq	%rax, 72(%rbx)	 ; tmp157, status_33(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _135, var_122->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp186, _135
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r15	 ;, _129
	je	.L381	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _129,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp160
	call	sprintf	 ;
.L375:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_33(D)->current_subroutine, status_33(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rsi)	 ; _20, var_122->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rsi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _140->local_vars, _140->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rsi, %xmm0	 ; var, tmp163
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rsi), %xmm0	 ; var_122->type, tmp163
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_109->kind
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp187, arg
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_109->is_get
 ; D:/TC/src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp163, MEM <vector(2) long unsigned int> [(void *)arg_109]
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r14	 ; status_33(D)->current_class, _21
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp188, arg
 ; D:/TC/src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_96->kind
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	24(%r14), %rax	 ; MEM[(long long int *)_21 + 24B], _98
 ; D:/TC/src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rsi)	 ;, arg_96->is_get
 ; D:/TC/src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rsi)	 ; _98, arg_96->value.int_value
 ; D:/TC/src/tac.c:233:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp165
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rsi)	 ; name_int, arg_96->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_55->instructions, block_55->instructions
 ; D:/TC/src/tac.c:214:     inst->type = type;
	movl	$18, 24(%rax)	 ;, inst_58->type
 ; D:/TC/src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp189, inst
 ; D:/TC/src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_58->arg1
 ; D:/TC/src/tac.c:216:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg, inst_58->arg2
 ; D:/TC/src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_58->arg3
 ; D:/TC/src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
	jmp	.L373	 ;
	.p2align 4,,10
	.p2align 3
.L381:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp159
	call	sprintf	 ;
	jmp	.L375	 ;
	.section .rdata,"dr"
	.align 8
.LC25:
	.ascii "[warning] Unsupported class member type for tac_class: %d\12\0"
	.text
	.p2align 4
	.globl	tac_class
	.def	tac_class;	.scl	2;	.type	32;	.endef
tac_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp159, class
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp160, status
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
	movq	(%rdi), %xmm6	 ; class_15(D)->name, _2
 ; D:/TC/src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rsi	 ; tmp161, members
 ; D:/TC/src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp162, table
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%r12, %rdx	 ; table,
 ; D:/TC/src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	 ; tmp163, tmp130
	punpcklqdq	%xmm6, %xmm0	 ; _2, tmp130
	movups	%xmm0, (%r12)	 ; tmp130, MEM <vector(2) long unsigned int> [(void *)table_30]
 ; D:/TC/src/tac.c:374:     attr_table->size = class->size;
	movq	24(%rdi), %rax	 ; class_15(D)->size, class_15(D)->size
	movq	%rax, 16(%r12)	 ; class_15(D)->size, table_30->size
 ; D:/TC/src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_14(D)->tac, status_14(D)->tac
	movq	(%rax), %rcx	 ; _4->attribute_tables, _4->attribute_tables
	call	list_append	 ;
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rdi	 ;, tmp156
	.p2align 4,,10
	.p2align 3
.L383:
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L404	 ;,
.L396:
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %r14d	 ; member_24->type, _6
 ; D:/TC/src/tac.c:377:         switch (member->type) {
	testl	%r14d, %r14d	 ; _6
	je	.L384	 ;,
	cmpl	$1, %r14d	 ;, _6
	je	.L385	 ;,
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:385:                 fprintf(stderr, "[warning] Unsupported class member type for tac_class: %d\n", member->type);
	movl	%r14d, %r8d	 ; _6,
	leaq	.LC25(%rip), %rdx	 ;, tmp155
	movq	24(%rax), %rcx	 ; _10->_stderr, _10->_stderr
	call	fprintf	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	jne	.L396	 ;,
.L404:
 ; D:/TC/src/tac.c:389:     status->current_class = NULL;
	movq	$0, 24(%rbx)	 ;, status_14(D)->current_class
 ; D:/TC/src/tac.c:391: }
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
.L385:
 ; D:/TC/src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %r15	 ; member_24->content.variable, _8
 ; D:/TC/src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rbx), %rax	 ; status_14(D)->tac, status_14(D)->tac
	movq	(%rax), %rcx	 ; _42->attribute_tables, _42->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %r14	 ; tmp164, attr_table
 ; D:/TC/src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_14(D)->tac, status_14(D)->tac
	movq	%r14, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _45->attribute_tables, _45->attribute_tables
	call	list_append	 ;
 ; D:/TC/src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%r15), %r12	 ; _8->type, _47
	movq	8(%r15), %r15	 ; _8->name, _48
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%r12, %rdx	 ; _47,
	movq	%r15, %rcx	 ; _48,
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %r13	 ; tmp165, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm1	 ; _47, _47
	movq	%rax, %xmm0	 ; tmp166, tmp139
	punpcklqdq	%xmm1, %xmm0	 ; _47, tmp139
	movups	%xmm0, 0(%r13)	 ; tmp139, MEM <vector(2) long unsigned int> [(void *)attr_51]
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%r14), %rax	 ; attr_table_44->size, prephitmp_34
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%r13)	 ; prephitmp_34, attr_51->offset
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%r12, %r12	 ; _47
	je	.L388	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdi), %r12	 ; name_int, _47
	je	.L402	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp175
	cmpq	(%rdx), %r12	 ; name_float, _47
	je	.L402	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp176
	cmpq	(%rdx), %r12	 ; name_string, _47
	je	.L402	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rcx	 ;, tmp143
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %r12	 ; name_bool, _47
	je	.L403	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rcx	 ;, tmp144
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %r12	 ; name_void, _47
	je	.L403	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edx	 ; _47->kind,
	testl	%edx, %edx	 ;
	jne	.L394	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%r12), %rdx	 ; _47->ast_node.class, _47->ast_node.class
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%r14), %rcx	 ; attr_table_44->attributes, _57
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	 ; _66->size, prephitmp_34
	movq	%rax, 16(%r14)	 ; prephitmp_34, attr_table_44->size
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _57
	jne	.L395	 ;,
	.p2align 4,,10
	.p2align 3
.L405:
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp153
	movq	24(%rax), %r9	 ; _58->_stderr,
	call	fwrite	 ;
 ; D:/TC/src/tac.c:205:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	jmp	.L383	 ;
	.p2align 4,,10
	.p2align 3
.L403:
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	$1, %rax	 ;, prephitmp_34
.L388:
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%r14), %rcx	 ; attr_table_44->attributes, _57
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%rax, 16(%r14)	 ; prephitmp_34, attr_table_44->size
 ; D:/TC/src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _57
	je	.L405	 ;,
.L395:
 ; D:/TC/src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%r13, %rdx	 ; attr,
	call	list_append	 ;
	jmp	.L383	 ;
	.p2align 4,,10
	.p2align 3
.L384:
 ; D:/TC/src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_24->content.method, member_24->content.method
	movq	%rbx, %rdx	 ; status,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:380:                 break;
	jmp	.L383	 ;
	.p2align 4,,10
	.p2align 3
.L394:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%r12), %r15	 ; _47->name, _68
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC4(%rip), %rdx	 ;, tmp150
	movq	24(%rax), %rcx	 ; _69->_stderr, _69->_stderr
	movq	%r15, %r8	 ; _68,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	16(%r14), %rax	 ; attr_table_44->size, tmp177
	.p2align 4,,10
	.p2align 3
.L402:
	addq	$8, %rax	 ;, prephitmp_34
	jmp	.L388	 ;
	.section .rdata,"dr"
.LC26:
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
	leaq	.LC26(%rip), %r13	 ;, tmp115
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
.L407:
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:/TC/src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L415	 ;,
.L413:
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L416	 ;,
 ; D:/TC/src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L417	 ;,
 ; D:/TC/src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L407	 ;,
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
	jne	.L413	 ;,
.L415:
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
.L416:
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
	jne	.L407	 ;,
 ; D:/TC/src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r12)	 ; _5, tac_29->entry_point
	jmp	.L407	 ;
	.p2align 4,,10
	.p2align 3
.L417:
 ; D:/TC/src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L407	 ;
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
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
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
