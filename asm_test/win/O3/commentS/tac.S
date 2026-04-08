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
	je	.L46	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%rdx), %edx	 ; type_14(D)->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	 ;
	jne	.L43	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rdi), %rax	 ; type_14(D)->ast_node.class, type_14(D)->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%r9), %r13	 ; status_15(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%r9)	 ; type_14(D)->ast_node.class, status_15(D)->current_class
.L43:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rsi, %rdx	 ; status,
	movq	%r12, %rcx	 ; original_name,
	call	search_var	 ;
	movq	%rax, %rbx	 ; tmp133, <retval>
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%rdi), %eax	 ; type_14(D)->kind,
	testl	%eax, %eax	 ;
	jne	.L44	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rsi)	 ; current_class, status_15(D)->current_class
.L44:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%rbx, %rbx	 ; <retval>
	je	.L46	 ;,
.L33:
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
.L46:
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
	ja	.L35	 ;,
	leaq	.L37(%rip), %rdx	 ;, tmp105
	movslq	(%rdx,%rax,4), %rax	 ;, tmp107
	addq	%rdx, %rax	 ; tmp105, tmp108
	jmp	*%rax	 ; tmp108
	.section .rdata,"dr"
	.align 4
.L37:
	.long	.L42-.L37
	.long	.L41-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L40-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L39-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L35-.L37
	.long	.L38-.L37
	.long	.L35-.L37
	.long	.L36-.L37
	.text
	.p2align 4,,10
	.p2align 3
.L35:
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
	jmp	.L33	 ;
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rsi), %r12	 ; status_15(D)->var_count, id
 ; D:/TC/src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	 ;, tmp115
	movq	%rax, 64(%rsi)	 ; tmp115, status_15(D)->var_count
	.p2align 4,,10
	.p2align 3
.L48:
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
	je	.L53	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r12, %r9	 ; id,
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC2(%rip), %rdx	 ;, tmp121
	call	sprintf	 ;
.L50:
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebp	 ;, tmp122
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rdi, 16(%rbx)	 ; type, var_22->type
 ; D:/TC/src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebp	 ;, tmp122
	jne	.L33	 ;,
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
.L38:
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rsi), %r12	 ; status_15(D)->temp_count, id
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r12), %rax	 ;, tmp116
	movq	%rax, 72(%rsi)	 ; tmp116, status_15(D)->temp_count
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L39:
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rsi), %r12	 ; status_15(D)->param_count, id
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r12), %rax	 ;, tmp114
	movq	%rax, 56(%rsi)	 ; tmp114, status_15(D)->param_count
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L40:
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rsi), %r12	 ; status_15(D)->subroutine_count, id
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r12), %rax	 ;, tmp118
	movq	%rax, 88(%rsi)	 ; tmp118, status_15(D)->subroutine_count
 ; D:/TC/src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L41:
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rsi), %r12	 ; status_15(D)->block_count, id
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	 ;, tmp117
	movq	%rax, 80(%rsi)	 ; tmp117, status_15(D)->block_count
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rsi), %r12	 ; status_15(D)->attr_count, id
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r12), %rax	 ;, tmp113
	movq	%rax, 48(%rsi)	 ; tmp113, status_15(D)->attr_count
 ; D:/TC/src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	%ebp, %r8d	 ; kind,
	leaq	.LC1(%rip), %rdx	 ;, tmp120
	call	sprintf	 ;
	jmp	.L50	 ;
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
 ; D:/TC/src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
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
	je	.L58	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _39,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp102
	call	sprintf	 ;
.L56:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rdi), %rax	 ; status_3(D)->current_subroutine, status_3(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rbx)	 ; _2, var_32->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rbx, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _50->local_vars, _50->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; var, tmp105
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	 ; var_32->type, tmp105
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_19->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp114, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_19->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp105, MEM <vector(2) long unsigned int> [(void *)arg_19]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_6->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp115, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; <retval>, inst_6->arg1
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$23, 24(%rax)	 ;, inst_6->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_6->arg3
 ; D:/TC/src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rdi), %rax	 ; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rcx	 ; _7->instructions, _7->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:283: }
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
.L58:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp101
	call	sprintf	 ;
	jmp	.L56	 ;
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "[Warning] Unsupported variable access with NULL base\12\0"
	.align 8
.LC4:
	.ascii "[Warning] Failed to generate variable access for base\12\0"
	.align 8
.LC5:
	.ascii "[Warning] Attempting to access attribute of non-object type: %s\12\0"
	.align 8
.LC6:
	.ascii "[Warning] Attribute '%s' not found in type '%s'\12\0"
	.align 8
.LC7:
	.ascii "[Warning] Attempting to access function '%s' as attribute of type '%s'\12\0"
	.align 8
.LC8:
	.ascii "[Warning] Symbol '%s' in type '%s' is not an attribute\12\0"
.LC9:
	.ascii "arr\0"
	.align 8
.LC10:
	.ascii "[Warning] Attempting to index non-array type: %s\12\0"
	.align 8
.LC11:
	.ascii "[Warning] Failed to generate variable access for index\12\0"
	.align 8
.LC12:
	.ascii "[Warning] Attempting to call non-function, kind: %u, type name: %s\12\0"
	.align 8
.LC13:
	.ascii "[Warning] Unsupported type for size lookup: %s\12\0"
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
	movq	%rcx, %r13	 ; tmp442, variable_access
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp443, status
	andq	$-16, %rsp	 ;,
	subq	$64, %rsp	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rcx), %r8d	 ; variable_access_137(D)->type,
	testl	%r8d, %r8d	 ;
	jne	.L60	 ;,
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rcx), %rcx	 ; variable_access_137(D)->content.name, _2
 ; D:/TC/src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rcx, %rcx	 ; _2
	je	.L60	 ;,
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rcx), %eax	 ; _2->kind, _3
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	 ;, tmp301
 ; D:/TC/src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	 ;, tmp301
	jbe	.L130	 ;,
 ; D:/TC/src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _3
	je	.L131	 ;,
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
.L129:
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rbx	 ; tmp448, _9
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	 ; _9, tmp308
	movhps	16(%rbx), %xmm0	 ;, tmp308
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp449, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp308,* <retval>
.L59:
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
.L60:
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	movq	0(%r13), %rcx	 ; variable_access_137(D)->base, _10
 ; D:/TC/src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rcx, %rcx	 ; _10
	je	.L132	 ;,
 ; D:/TC/src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_variable_access	 ;
	movq	%rax, %rsi	 ; tmp451, base
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; base
	je	.L68	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _13->is_get
	jne	.L133	 ;,
.L67:
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%r13), %edi	 ; variable_access_137(D)->type, _16
 ; D:/TC/src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %edi	 ;, _16
	je	.L134	 ;,
 ; D:/TC/src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %edi	 ;, _16
	je	.L135	 ;,
 ; D:/TC/src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %edi	 ;, _16
	jne	.L85	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rsi), %edi	 ; _269->kind, _70
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%edi, %edi	 ; _70
	jne	.L86	 ;,
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rsi), %rax	 ; _269->type, _71
 ; D:/TC/src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %ecx	 ; _71->kind,
	testl	%ecx, %ecx	 ;
	je	.L136	 ;,
.L87:
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rax), %rbx	 ; prephitmp_147->name, _84
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movl	%edi, %r8d	 ; _70,
	leaq	.LC12(%rip), %rdx	 ;, tmp385
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	24(%rax), %rcx	 ; _85->_stderr, _85->_stderr
	movq	%rbx, %r9	 ; _84,
	call	fprintf	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L134:
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rsi), %rax	 ; _269->type, _17
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	 ; _17->kind, _18
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	 ;, tmp314
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	 ;, tmp314
	jbe	.L137	 ;,
 ; D:/TC/src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rcx	 ; _17->ast_node.scope, scope
 ; D:/TC/src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	 ; _18
	jne	.L71	 ;,
 ; D:/TC/src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rcx), %rcx	 ; MEM[(struct Class *)scope_201].class_scope, scope
.L71:
 ; D:/TC/src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%r13), %rax	 ; variable_access_137(D)->content.attr_name, variable_access_137(D)->content.attr_name
	movq	8(%rax), %rdx	 ; _23->name, _23->name
	call	search_name_use_strcmp	 ;
	movq	%rax, %rdi	 ; tmp455, attr
 ; D:/TC/src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	 ; attr
	je	.L138	 ;,
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	 ; attr_204->kind, _31
 ; D:/TC/src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	 ;, _31
	je	.L139	 ;,
 ; D:/TC/src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	 ;, _31
	je	.L140	 ;,
 ; D:/TC/src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	 ;, _31
	jne	.L141	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rdi), %rdi	 ; attr_204->type, _48
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r14	 ; status_138(D)->temp_count, _382
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp338
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_375->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp463, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	 ;, tmp337
	movq	%rax, 72(%rbx)	 ; tmp337, status_138(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _388, var_375->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp464, _388
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _382
	je	.L142	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _382,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp340
	call	sprintf	 ;
.L77:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_138(D)->current_subroutine, status_138(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rdi, 16(%r12)	 ; _48, var_375->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r12, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _393->local_vars, _393->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	 ; var, tmp343
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	 ; var_375->type, tmp343
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_362->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp465, <retval>
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp343, MEM <vector(2) long unsigned int> [(void *)arg_362]
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%r13), %rcx	 ; variable_access_137(D)->content.attr_name, _49
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_362->kind
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rcx), %rdx	 ; _49->type, _49->type
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r13	 ; tmp466, _51
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; _51, tmp346
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; _51->type, tmp346
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_349->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp467, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_349->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp346, MEM <vector(2) long unsigned int> [(void *)arg_349]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$15, 24(%rax)	 ;, inst_231->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp468, inst
	jmp	.L127	 ;
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:/TC/src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	movq	%rcx, %rdx	 ; _2,
	jmp	.L129	 ;
	.p2align 4,,10
	.p2align 3
.L133:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; base,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp453, base
 ; D:/TC/src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	 ; base
	jne	.L67	 ;,
	.p2align 4,,10
	.p2align 3
.L68:
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movl	$54, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:767:         fprintf(stderr, "[Warning] Failed to generate variable access for base\n");
	movq	24(%rax), %r9	 ; _14->_stderr,
	leaq	.LC4(%rip), %rcx	 ;, tmp313
	call	fwrite	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rsi), %rax	 ; _269->type, _269->type
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC9(%rip), %rdx	 ;, tmp355
	movq	8(%rax), %rcx	 ; _55->name, _55->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	 ; tmp469
	jne	.L143	 ;,
 ; D:/TC/src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%r13), %rcx	 ; variable_access_137(D)->content.index, variable_access_137(D)->content.index
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp471, _64
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _64
	je	.L82	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _64->is_get
	jne	.L144	 ;,
.L81:
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	.refptr.name_int(%rip), %rax	 ;, tmp363
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	(%rax), %rdi	 ; name_int, name_int.14_67
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r14	 ; status_138(D)->temp_count, _416
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp365
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_409->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp474, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	 ;, tmp364
	movq	%rax, 72(%rbx)	 ; tmp364, status_138(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _422, var_409->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp475, _422
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _416
	je	.L145	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _416,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp367
	call	sprintf	 ;
.L84:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_138(D)->current_subroutine, status_138(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rdi, 16(%r13)	 ; name_int.14_67, var_409->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r13, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _427->local_vars, _427->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; var, tmp370
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; var_409->type, tmp370
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_396->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp476, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_396->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp370, MEM <vector(2) long unsigned int> [(void *)arg_396]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$16, 24(%rax)	 ;, inst_235->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp477, inst
.L127:
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rdx)	 ; <retval>,* inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rdx)	 ; base,
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r12, 16(%rdx)	 ; _64,
 ; D:/TC/src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%rdi)	 ;,
 ; D:/TC/src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_138(D)->current_block, status_138(D)->current_block
	movq	8(%rax), %rcx	 ;, _68->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:823:         return temp;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L86:
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rdi), %eax	 ;, tmp383
 ; D:/TC/src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	 ;, tmp383
	jbe	.L88	 ;,
 ; D:/TC/src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rsi), %rax	 ; _269->type, _71
	jmp	.L87	 ;
	.p2align 4,,10
	.p2align 3
.L136:
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rdx	 ;, tmp374
	movq	8(%rax), %rcx	 ; _71->name, _71->name
	movq	(%rdx), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp478, _75
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rsi), %rax	 ; _269->type, _269->type
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	 ; _76->ast_node.class, _76->ast_node.class
	movq	16(%rax), %rcx	 ; _77->class_scope, _77->class_scope
	call	search_name_use_strcmp	 ;
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
	movq	(%rax), %rdx	 ; attr_153->type, attr_153->type
 ; D:/TC/src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rcx	 ; tmp479, attr
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rdi	 ; tmp480, _80
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rdi, %xmm0	 ; _80, tmp381
	movhps	16(%rdi), %xmm0	 ; _80->type, tmp381
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	 ;, arg_430->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp481, base
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_430->is_get
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp381, MEM <vector(2) long unsigned int> [(void *)arg_430]
.L88:
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%rsi)	 ;, base_621->kind
 ; D:/TC/src/tac.c:835:         list(Instruction*) arguments = create_list();
	movq	%rax, 56(%rsp)	 ; tmp483, %sfp
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	je	.L89	 ;,
.L91:
 ; D:/TC/src/tac.c:834:         long long arg_count = 0;
	xorl	%r12d, %r12d	 ; arg_count
.L90:
 ; D:/TC/src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%r13), %rcx	 ; variable_access_137(D)->content.args, variable_access_137(D)->content.args
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; tmp493, %sfp
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L97	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %r15	 ;, tmp438
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%r15), %rax	 ; name_int, _110
	je	.L101	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdi	 ;, tmp518
	cmpq	(%rdi), %rax	 ; name_float, _110
	je	.L101	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp411
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_string, _110
	je	.L101	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp412
	movl	$1, %r13d	 ;, _104
	cmpq	(%rdx), %rax	 ; name_bool, _110
	je	.L100	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp413
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %rax	 ; name_void, _110
	je	.L100	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %edx	 ; _110->kind,
	testl	%edx, %edx	 ;
	jne	.L102	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	 ; _110->ast_node.class, _110->ast_node.class
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	24(%rax), %r13	 ; _487->size, _104
.L100:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:848:             arg_count++;
	addq	$1, %r12	 ;, arg_count
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_468->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp497, arg
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r13, (%rax)	 ; _104, arg_468->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%r15), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_468->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rdi)	 ; name_int, arg_468->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_241->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp498, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; arg, inst_241->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _109, inst_241->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_241->arg3
 ; D:/TC/src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	list_append	 ;
.L97:
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp499, arg_expr
 ; D:/TC/src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg_expr
	je	.L104	 ;,
 ; D:/TC/src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r14	 ; tmp494, _109
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _109
	je	.L98	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _109->is_get
	jne	.L146	 ;,
.L99:
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%r14), %rax	 ; _244->type, _110
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%rax, %rax	 ; _110
	jne	.L147	 ;,
	movq	.refptr.name_int(%rip), %r15	 ;, tmp438
	xorl	%r13d, %r13d	 ; _104
	jmp	.L100	 ;
	.p2align 4,,10
	.p2align 3
.L105:
 ; D:/TC/src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	 ; status_138(D)->current_block, status_138(D)->current_block
	movq	8(%rax), %rcx	 ; _116->instructions, _116->instructions
	call	list_append	 ;
.L104:
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rdx	 ; tmp500, arg
 ; D:/TC/src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	 ; arg
	jne	.L105	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rsi), %rdi	 ; base_621->type, _118
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r14	 ; status_138(D)->temp_count, _526
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp422
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_519->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp501, var
 ; D:/TC/src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	 ;, tmp421
	movq	%rax, 72(%rbx)	 ; tmp421, status_138(D)->temp_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _532, var_519->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp502, _532
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _526
	je	.L148	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _526,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp424
	call	sprintf	 ;
.L107:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_138(D)->current_subroutine, status_138(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%rdi, 16(%r13)	 ; _118, var_519->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r13, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _537->local_vars, _537->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	 ; var, tmp427
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	 ; var_519->type, tmp427
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_506->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp503, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_506->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp427, MEM <vector(2) long unsigned int> [(void *)arg_506]
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	 ; arg_count, arg_493->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp504, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_493->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp429
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_493->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%r13)	 ; name_int, arg_493->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; base, inst_245->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp505, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; <retval>, inst_245->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	 ; arg, inst_245->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$22, 24(%rax)	 ;, inst_245->type
 ; D:/TC/src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	 ; status_138(D)->current_block, status_138(D)->current_block
	movq	8(%rax), %rcx	 ;, _122->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:856:         return temp;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L146:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _109,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp495, _109
	jmp	.L99	 ;
	.p2align 4,,10
	.p2align 3
.L141:
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; _269->type, _269->type
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _42->name, _43
	movq	8(%r13), %rax	 ; variable_access_137(D)->content.attr_name, variable_access_137(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _44->name, _45
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _43,
	leaq	.LC8(%rip), %rdx	 ;, tmp336
	movq	24(%rax), %rcx	 ; _46->_stderr, _46->_stderr
	movq	%rbx, %r8	 ; _45,
	call	fprintf	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:761:         fprintf(stderr, "[Warning] Unsupported variable access with NULL base\n");
	movq	24(%rax), %r9	 ; _11->_stderr,
	leaq	.LC3(%rip), %rcx	 ;, tmp311
	call	fwrite	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:/TC/src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _2->type, _2->type
	movq	%rbx, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L128:
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp458, _39
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _39, tmp328
	movhps	16(%rbx), %xmm0	 ;, tmp328
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$7, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp459, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp328,* <retval>
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movl	%edi, %r8d	 ; _16,
	leaq	.LC14(%rip), %rdx	 ;, tmp434
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:858:         fprintf(stderr, "[Warning] Unsupported variable access type for tac_variable_access: %u\n", variable_access->type);
	movq	24(%rax), %rcx	 ; _124->_stderr, _124->_stderr
	call	fprintf	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L142:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp339
	call	sprintf	 ;
	jmp	.L77	 ;
	.p2align 4,,10
	.p2align 3
.L145:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp366
	call	sprintf	 ;
	jmp	.L84	 ;
	.p2align 4,,10
	.p2align 3
.L148:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp423
	call	sprintf	 ;
	jmp	.L107	 ;
	.p2align 4,,10
	.p2align 3
.L102:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rax), %r13	 ; _110->name, _489
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC13(%rip), %rdx	 ;, tmp416
	movq	24(%rax), %rcx	 ; _490->_stderr, _490->_stderr
	movq	%r13, %r8	 ; _489,
	call	fprintf	 ;
	.p2align 4,,10
	.p2align 3
.L101:
	movl	$8, %r13d	 ;, _104
	jmp	.L100	 ;
	.p2align 4,,10
	.p2align 3
.L143:
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rsi), %rax	 ; _269->value.variable, _269->value.variable
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	 ; _58->original_name, _58->original_name
	movq	8(%rax), %rbx	 ; _59->name, _60
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	leaq	.LC10(%rip), %rdx	 ;, tmp359
	movq	24(%rax), %rcx	 ; _61->_stderr, _61->_stderr
	movq	%rbx, %r8	 ; _60,
	call	fprintf	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L139:
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; _269->type, _269->type
	movq	8(%rax), %r12	 ; _32->name, _33
	movq	8(%r13), %rax	 ; variable_access_137(D)->content.attr_name, variable_access_137(D)->content.attr_name
	movq	8(%rax), %rsi	 ; _34->name, _35
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%r12, %r9	 ; _33,
	leaq	.LC7(%rip), %rdx	 ;, tmp326
	movq	24(%rax), %rcx	 ; _36->_stderr, _36->_stderr
	movq	%rsi, %r8	 ; _35,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_204->type, attr_204->type
	movq	%rbx, %r9	 ; status,
	movq	%rdi, %rcx	 ; attr,
	movl	$102, %r8d	 ;,
	jmp	.L128	 ;
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _64,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp473, _64
 ; D:/TC/src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	 ; _64
	jne	.L81	 ;,
.L82:
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movl	$55, %r8d	 ;,
	movl	$1, %edx	 ;,
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:812:             fprintf(stderr, "[Warning] Failed to generate variable access for index\n");
	movq	24(%rax), %r9	 ; _65->_stderr,
	leaq	.LC11(%rip), %rcx	 ;, tmp362
	call	fwrite	 ;
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L140:
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rdx	 ; attr_204->type, attr_204->type
	movq	%rbx, %r9	 ; status,
	movq	%rdi, %rcx	 ; attr,
	movl	$102, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	 ; tmp460, _41
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	 ; _41, tmp331
	movhps	16(%rbx), %xmm0	 ;, tmp331
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	 ;, arg_336->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp461, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp331,* <retval>
 ; D:/TC/src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L59	 ;
	.p2align 4,,10
	.p2align 3
.L89:
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp386
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	movq	8(%rsi), %rax	 ; base_621->type, base_621->type
	movq	8(%rax), %rcx	 ; _89->name, _89->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp484, _91
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rsi), %rax	 ; base_621->value.subroutine, base_621->value.subroutine
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	 ; _92->original_name, _92->original_name
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rcx	 ; _93->name, _93->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	 ; tmp485
	je	.L91	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	0(%r13), %rax	 ; variable_access_137(D)->base, variable_access_137(D)->base
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$8, %ecx	 ;,
	movq	(%rax), %rax	 ; _96->base, _96->base
	movq	%rax, 32(%rsp)	 ; _96->base,
	call	create_primary	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %r8	 ;, tmp486
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	create_expression	 ;
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rcx	 ; tmp487, _99
 ; D:/TC/src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	 ;
	movq	%rax, %r14	 ; tmp488, _100
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _100
	je	.L92	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _100->is_get
	jne	.L149	 ;,
.L93:
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%r14), %rax	 ; _240->type, _101
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%rax, %rax	 ; _101
	je	.L108	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %r15	 ;, tmp438
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%r15), %rax	 ; name_int, _101
	je	.L95	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp399
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_float, _101
	je	.L95	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp400
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %rax	 ; name_string, _101
	je	.L95	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp401
	movl	$1, %edi	 ;, prephitmp_102
	cmpq	(%rdx), %rax	 ; name_bool, _101
	je	.L94	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp402
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %rax	 ; name_void, _101
	je	.L94	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	 ;, _101->kind
	jne	.L96	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	 ; _101->ast_node.class, _101->ast_node.class
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	24(%rax), %rdi	 ; _462->size, prephitmp_102
.L94:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp491, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_443->kind
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rdi, (%rax)	 ; prephitmp_102, arg_443->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%r15), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_443->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r12)	 ; name_int, arg_443->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_237->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp492, inst
 ; D:/TC/src/tac.c:840:             arg_count++;
	movl	$1, %r12d	 ;, arg_count
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	 ;, inst_237->type
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _100, inst_237->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_237->arg3
 ; D:/TC/src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	list_append	 ;
	jmp	.L90	 ;
	.p2align 4,,10
	.p2align 3
.L137:
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rbx	 ; _17->name, _20
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:773:             fprintf(stderr, "[Warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	leaq	.LC5(%rip), %rdx	 ;, tmp316
	movq	24(%rax), %rcx	 ; _21->_stderr, _21->_stderr
	movq	%rbx, %r8	 ; _20,
	call	fprintf	 ;
	jmp	.L59	 ;
.L138:
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rsi), %rax	 ; _269->type, _269->type
 ; D:/TC/src/tac.c:763:         return NULL;
	xorl	%edi, %edi	 ; <retval>
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rax), %rsi	 ; _25->name, _26
	movq	8(%r13), %rax	 ; variable_access_137(D)->content.attr_name, variable_access_137(D)->content.attr_name
	movq	8(%rax), %rbx	 ; _27->name, _28
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	%rsi, %r9	 ; _26,
	leaq	.LC6(%rip), %rdx	 ;, tmp322
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
	movq	%rbx, %r8	 ; _28,
	call	fprintf	 ;
	jmp	.L59	 ;
.L108:
	movq	.refptr.name_int(%rip), %r15	 ;, tmp438
	xorl	%edi, %edi	 ; prephitmp_102
	jmp	.L94	 ;
.L149:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _100,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp489, _100
	jmp	.L93	 ;
.L96:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%rax), %r12	 ; _101->name, _464
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC13(%rip), %rdx	 ;, tmp405
	movq	24(%rax), %rcx	 ; _465->_stderr, _465->_stderr
	movq	%r12, %r8	 ; _464,
	call	fprintf	 ;
.L95:
	movl	$8, %edi	 ;, prephitmp_102
	jmp	.L94	 ;
	.section	.text.unlikely,"x"
	.def	tac_variable_access.cold;	.scl	3;	.type	32;	.endef
tac_variable_access.cold:
.L92:
 ; D:/TC/src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _648
	ud2	
.L98:
 ; D:/TC/src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _580
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
	movl	8(%rcx), %ebx	 ; primary_36(D)->type,
 ; D:/TC/src/tac.c:679: Arg* tac_primary(Primary* primary, TACStatus* status) {
	movaps	%xmm6, 32(%rsp)	 ;,
 ; D:/TC/src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ebx	 ;, _1
	ja	.L151	 ;,
	movq	%rdx, %rsi	 ; tmp206, status
	leaq	.L153(%rip), %rdx	 ;, tmp149
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp151
	addq	%rdx, %rax	 ; tmp149, tmp152
	jmp	*%rax	 ; tmp152
	.section .rdata,"dr"
	.align 4
.L153:
	.long	.L161-.L153
	.long	.L160-.L153
	.long	.L159-.L153
	.long	.L158-.L153
	.long	.L157-.L153
	.long	.L156-.L153
	.long	.L155-.L153
	.long	.L154-.L153
	.long	.L152-.L153
	.text
	.p2align 4,,10
	.p2align 3
.L154:
 ; D:/TC/src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand, primary_36(D)->value.operand
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
	movq	%rax, %r12	 ; tmp220, _14
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _14
	je	.L166	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _14->is_get
	jne	.L178	 ;,
.L167:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
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
	je	.L179	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _231,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp184
	call	sprintf	 ;
.L169:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_37(D)->current_subroutine, status_37(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rdi)	 ; _15, var_224->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rdi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _242->local_vars, _242->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp187
	movhps	16(%rdi), %xmm0	 ; var_224->type, tmp187
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	.refptr.name_int(%rip), %rdi	 ;, tmp189
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_211->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp224, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_211->kind
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp187, MEM <vector(2) long unsigned int> [(void *)arg_211]
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	movq	8(%r12), %rax	 ; _88->type, _16
 ; D:/TC/src/tac.c:721:             if (operand->type == name_int)
	cmpq	(%rdi), %rax	 ; name_int, _16
	je	.L180	 ;,
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	movq	.refptr.name_float(%rip), %r13	 ;, tmp192
 ; D:/TC/src/tac.c:723:             else if (operand->type == name_float)
	cmpq	0(%r13), %rax	 ; name_float, _16
	je	.L181	 ;,
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	movq	8(%rax), %rbx	 ; _16->name, _21
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	leaq	.LC17(%rip), %rdx	 ;, tmp197
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	movq	%rbx, %r8	 ; _21,
 ; D:/TC/src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:726:                 fprintf(stderr, "[Warning] Unsupported type for negation: %s\n", operand->type->name);
	call	fprintf	 ;
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L152:
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rcx), %rcx	 ;* primary, primary_36(D)->value.var
 ; D:/TC/src/tac.c:742: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
 ; D:/TC/src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:742: }
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
.L161:
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rcx), %rcx	 ;* primary, primary_36(D)->value.literal_value
	movl	$10, %r8d	 ;,
	xorl	%edx, %edx	 ;
	call	strtoll	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rsi	 ; tmp207, _3
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rsi, (%rax)	 ; _3, arg_112->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp208, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_112->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp155
	movq	(%rax), %rax	 ;, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbx)	 ; name_int,
.L150:
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
.L160:
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rcx), %rcx	 ;* primary, primary_36(D)->value.literal_value
	xorl	%edx, %edx	 ;
	call	strtod	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movapd	%xmm0, %xmm6	 ; tmp209, _5
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm6, (%rax)	 ; _5, arg_125->value.float_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp210, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_125->kind
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	.refptr.name_float(%rip), %rax	 ;, tmp158
	movq	(%rax), %rax	 ;, name_float
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	%rax, 8(%rbx)	 ; name_float,
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L159:
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rcx), %xmm6	 ; primary_36(D)->value.literal_value, _6
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$3, 16(%rax)	 ;, arg_138->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp211, <retval>
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movdqa	%xmm6, %xmm0	 ; _6, tmp160
	movq	.refptr.name_string(%rip), %rax	 ;, tmp161
	movhps	(%rax), %xmm0	 ; name_string, tmp160
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:241:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rbx)	 ; tmp160, MEM <vector(2) long unsigned int> [(void *)arg_138]
 ; D:/TC/src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L158:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	 ;, arg_151->value.bool_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp212, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_151->kind
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp163
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L157:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	 ;, arg_164->value.bool_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp213, <retval>
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	 ;, arg_164->kind
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp165
	movq	(%rax), %rax	 ;, name_bool
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;,
 ; D:/TC/src/tac.c:246:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	 ; name_bool,
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L156:
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.expr, primary_36(D)->value.expr
 ; D:/TC/src/tac.c:742: }
	movaps	32(%rsp), %xmm6	 ;,
	leaq	-40(%rbp), %rsp	 ;,
 ; D:/TC/src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	%rsi, %rdx	 ; status,
 ; D:/TC/src/tac.c:742: }
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
.L155:
 ; D:/TC/src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rcx), %rcx	 ; primary_36(D)->value.operand, primary_36(D)->value.operand
	movq	%rsi, %rdx	 ; status,
	call	tac_primary	 ;
	movq	%rax, %r12	 ; tmp214, _9
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _9
	je	.L163	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L182	 ;,
.L163:
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	.refptr.name_bool(%rip), %rax	 ;, tmp169
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
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
	je	.L183	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbx, %r9	 ; _197,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp173
	call	sprintf	 ;
.L165:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rsi), %rax	 ; status_37(D)->current_subroutine, status_37(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rdi)	 ; name_bool.11_10, var_190->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rdi, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _208->local_vars, _208->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp176
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_190->type, tmp176
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_177->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp218, <retval>
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_177->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp176, MEM <vector(2) long unsigned int> [(void *)arg_177]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; _9, inst_80->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp219, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_80->arg1
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$13, 24(%rax)	 ;, inst_80->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_80->arg3
 ; D:/TC/src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ;, _11->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:713:             return temp;
	jmp	.L150	 ;
.L151:
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movl	%ebx, %r8d	 ; _1,
	leaq	.LC18(%rip), %rdx	 ;, tmp202
 ; D:/TC/src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	 ; <retval>
 ; D:/TC/src/tac.c:738:             fprintf(stderr, "[Warning] Unsupported primary type for tac_primary: %d\n", primary->type);
	movq	24(%rax), %rcx	 ; _27->_stderr, _27->_stderr
	call	fprintf	 ;
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L181:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$2, 16(%rax)	 ;, arg_258->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdi	 ; tmp227, arg
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	.LC16(%rip), %rax	 ;, tmp235
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rdi)	 ;, arg_258->is_get
 ; D:/TC/src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	%rax, (%rdi)	 ; tmp235, arg_258->value.float_value
 ; D:/TC/src/tac.c:238:             arg->type = name_float;
	movq	0(%r13), %rax	 ; name_float, name_float
	movq	%rax, 8(%rdi)	 ; name_float, arg_258->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$2, 24(%rax)	 ;, inst_90->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp228, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_90->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; arg, inst_90->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _14,
.L171:
 ; D:/TC/src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rsi), %rax	 ; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rcx	 ;, _24->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:732:             return temp;
	jmp	.L150	 ;
	.p2align 4,,10
	.p2align 3
.L179:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp183
	call	sprintf	 ;
	jmp	.L169	 ;
	.p2align 4,,10
	.p2align 3
.L183:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp172
	call	sprintf	 ;
	jmp	.L165	 ;
	.p2align 4,,10
	.p2align 3
.L182:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _9,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp215, _9
	jmp	.L163	 ;
	.p2align 4,,10
	.p2align 3
.L178:
	movq	%rsi, %rdx	 ; status,
	movq	%rax, %rcx	 ; _14,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp221, _14
	jmp	.L167	 ;
	.p2align 4,,10
	.p2align 3
.L180:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_245->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp225, arg
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_245->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%rdi), %rax	 ; name_int, name_int
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_245->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r13)	 ; name_int, arg_245->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$1, 24(%rax)	 ;, inst_89->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp226, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	 ; <retval>, inst_89->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	 ; arg, inst_89->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	 ; _14,
	jmp	.L171	 ;
	.section	.text.unlikely,"x"
	.def	tac_primary.cold;	.scl	3;	.type	32;	.endef
tac_primary.cold:
.L166:
 ; D:/TC/src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	 ; MEM[(struct Arg *)0B].type, _365
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
 ; D:/TC/src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rcx)	 ;, expression_27(D)->operator
	je	.L209	 ;,
 ; D:/TC/src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rcx), %rcx	 ; expression_27(D)->right, expression_27(D)->right
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp167, <retval>
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L186	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _4->is_get
	jne	.L210	 ;,
.L186:
 ; D:/TC/src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	 ; expression_27(D)->operator,
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rcx	 ; expression_27(D)->expr_left, pretmp_99
	cmpl	$18, %eax	 ;, _5
	ja	.L187	 ;,
	leaq	CSWTCH.21(%rip), %rdx	 ;, tmp136
	movl	(%rdx,%rax,4), %r13d	 ; CSWTCH.21[_5], _43
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp169, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	 ; expression_27(D)->operator, expression_27(D)->operator
	subl	$13, %eax	 ;, tmp138
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp138
	ja	.L188	 ;,
 ; D:/TC/src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	 ;, _43
	jne	.L198	 ;,
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%rdi), %eax	 ; left_193->kind,
	testl	%eax, %eax	 ;
	jne	.L211	 ;,
.L193:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_53->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp176, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; left, inst_53->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_53->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_53->arg3
 ; D:/TC/src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%rdi)	 ;, left_193->is_get
	jne	.L212	 ;,
.L194:
 ; D:/TC/src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _16->instructions, _16->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:678: }
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
.L187:
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	 ;, _43
 ; D:/TC/src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	 ;
	movq	%rax, %rdi	 ; tmp183, left
 ; D:/TC/src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	 ; expression_27(D)->operator, expression_27(D)->operator
	subl	$13, %eax	 ;, tmp163
 ; D:/TC/src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	 ;, tmp163
	ja	.L188	 ;,
.L198:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
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
	je	.L213	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _108,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp143
	call	sprintf	 ;
.L191:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r12, 16(%r14)	 ; _8, var_101->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r14, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _119->local_vars, _119->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp146
	movhps	16(%r14), %xmm0	 ; var_101->type, tmp146
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_88->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp172, arg
 ; D:/TC/src/tac.c:282:     return arg;
	movq	%rdi, %r14	 ; left, _50
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_88->kind
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp146, MEM <vector(2) long unsigned int> [(void *)arg_88]
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	 ;, left_59->is_get
	jne	.L214	 ;,
.L192:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; _50, inst_48->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp174, inst
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_48->arg3
 ; D:/TC/src/tac.c:663:             right = temp;
	movq	%r12, %rsi	 ; arg, <retval>
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _43, inst_48->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_48->arg1
 ; D:/TC/src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rcx	 ; _9->instructions, _9->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%rdi), %eax	 ; left_193->kind,
	testl	%eax, %eax	 ;
	je	.L193	 ;,
.L211:
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:666:             fprintf(stderr, "[Warning] Left-hand side of assignment is not a variable\n");
	movl	$57, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rcx	 ;, tmp151
	movq	24(%rax), %r9	 ; _12->_stderr,
	call	fwrite	 ;
	jmp	.L193	 ;
	.p2align 4,,10
	.p2align 3
.L188:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
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
	je	.L215	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r15, %r9	 ; _142,
	movl	$116, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp155
	call	sprintf	 ;
.L196:
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	 ; status_28(D)->current_subroutine, status_28(D)->current_subroutine
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r12, 16(%r14)	 ; _15, var_135->type
 ; D:/TC/src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%r14, %rdx	 ; var,
	movq	24(%rax), %rcx	 ; _153->local_vars, _153->local_vars
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; var, tmp158
	movhps	16(%r14), %xmm0	 ; var_135->type, tmp158
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_122->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp180, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_122->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp158, MEM <vector(2) long unsigned int> [(void *)arg_122]
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	 ;, left_34->is_get
	jne	.L216	 ;,
.L197:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; <retval>, inst_55->arg3
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp182, inst
 ; D:/TC/src/tac.c:673:         right = temp;
	movq	%r12, %rsi	 ; arg, <retval>
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	 ; _43, inst_55->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_55->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdi, 8(%rax)	 ; left, inst_55->arg2
	jmp	.L194	 ;
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rcx), %rcx	 ; expression_27(D)->prim_left, expression_27(D)->prim_left
 ; D:/TC/src/tac.c:678: }
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	 ;
	.p2align 4,,10
	.p2align 3
.L215:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp154
	call	sprintf	 ;
	jmp	.L196	 ;
	.p2align 4,,10
	.p2align 3
.L213:
	movl	$116, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp142
	call	sprintf	 ;
	jmp	.L191	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$24, 24(%rax)	 ;, inst_54->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp177, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rdi, (%rax)	 ; left, inst_54->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; <retval>, inst_54->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_54->arg3
	jmp	.L194	 ;
	.p2align 4,,10
	.p2align 3
.L210:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; <retval>,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp168, <retval>
	jmp	.L186	 ;
	.p2align 4,,10
	.p2align 3
.L216:
	movq	%rdi, %rcx	 ; left,
	movq	%rbx, %rdx	 ; status,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rdi	 ; tmp181, left
	jmp	.L197	 ;
	.p2align 4,,10
	.p2align 3
.L214:
	movq	%rbx, %rdx	 ; status,
	movq	%rdi, %rcx	 ; left,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r14	 ; tmp173, _50
	jmp	.L192	 ;
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
	movq	%rcx, %rsi	 ; tmp160, variable
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp161, status
	andq	$-16, %rsp	 ;,
	subq	$32, %rsp	 ;,
 ; D:/TC/src/tac.c:403:     if (is_attr) {
	testb	%r8b, %r8b	 ; tmp162
	je	.L218	 ;,
 ; D:/TC/src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rdx), %rax	 ; status_10(D)->tac, status_10(D)->tac
	movq	(%rax), %rcx	 ; _1->attribute_tables, _1->attribute_tables
	call	list_pop_back	 ;
	movq	%rax, %rdi	 ; tmp163, attr_table
 ; D:/TC/src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	 ; status_10(D)->tac, status_10(D)->tac
	movq	%rdi, %rdx	 ; attr_table,
	movq	(%rax), %rcx	 ; _3->attribute_tables, _3->attribute_tables
	call	list_append	 ;
 ; D:/TC/src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%rsi), %r12	 ; variable_9(D)->type, _5
	movq	8(%rsi), %r13	 ; variable_9(D)->name, _6
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %r9	 ; status,
	movl	$97, %r8d	 ;,
	movq	%r12, %rdx	 ; _5,
	movq	%r13, %rcx	 ; _6,
 ; D:/TC/src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rsi	 ; tmp164, attr
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	 ;
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm1	 ; _5, _5
 ; D:/TC/src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rsi)	 ;, attr_17->offset
 ; D:/TC/src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	 ; tmp165, tmp135
	punpcklqdq	%xmm1, %xmm0	 ; _5, tmp135
	movups	%xmm0, (%rsi)	 ; tmp135, MEM <vector(2) long unsigned int> [(void *)attr_17]
 ; D:/TC/src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%rdi, %rdi	 ; attr_table
	jne	.L245	 ;,
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:204:         fprintf(stderr, "Error: create_attribute received NULL table\n");
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rcx	 ;, tmp149
	movq	24(%rax), %r9	 ; _26->_stderr,
	call	fwrite	 ;
.L227:
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:206:         fprintf(stderr, "Error: create_attribute received NULL table or attributes list\n");
	movl	$63, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rcx	 ;, tmp151
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
.L218:
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	(%rcx), %rdx	 ; variable_9(D)->type, variable_9(D)->type
	movq	8(%rcx), %rcx	 ; variable_9(D)->name, variable_9(D)->name
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
	call	create_var	 ;
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rsi), %rcx	 ; variable_9(D)->value, _46
 ; D:/TC/src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	%rax, %rdi	 ; tmp169, var
 ; D:/TC/src/tac.c:414:         if (variable->value != NULL)
	testq	%rcx, %rcx	 ; _46
	je	.L229	 ;,
 ; D:/TC/src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rsi	 ; tmp170, arg
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; arg
	je	.L230	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _47->is_get
	jne	.L246	 ;,
.L230:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdi, %xmm0	 ; var, tmp156
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rdi), %xmm0	 ; var_45->type, tmp156
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_69->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp173, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_69->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp156, MEM <vector(2) long unsigned int> [(void *)arg_69]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%rsi, 8(%rax)	 ; arg, inst_52->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp174, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	 ;, inst_52->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; arg, inst_52->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_52->arg3
 ; D:/TC/src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	 ; status_10(D)->current_block, status_10(D)->current_block
	movq	8(%rax), %rcx	 ; _54->instructions, _54->instructions
.L244:
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
.L245:
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	16(%rdi), %rax	 ; attr_table_12->size, _22
 ; D:/TC/src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rsi)	 ; _22, attr_17->offset
 ; D:/TC/src/tac.c:18:     if (type == NULL)
	testq	%r12, %r12	 ; _5
	je	.L220	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp136
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %r12	 ; name_int, _5
	je	.L242	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp137
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %r12	 ; name_float, _5
	je	.L242	 ;,
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp138
 ; D:/TC/src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rdx), %r12	 ; name_string, _5
	je	.L242	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp139
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %r12	 ; name_bool, _5
	je	.L243	 ;,
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp140
 ; D:/TC/src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	(%rdx), %r12	 ; name_void, _5
	je	.L243	 ;,
 ; D:/TC/src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edx	 ; _5->kind,
	testl	%edx, %edx	 ;
	jne	.L226	 ;,
 ; D:/TC/src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%r12), %rdx	 ; _5->ast_node.class, _5->ast_node.class
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	 ; _37->size, _22
	.p2align 4,,10
	.p2align 3
.L220:
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%rdi), %rcx	 ; attr_table_12->attributes, _28
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	%rax, 16(%rdi)	 ; _22, attr_table_12->size
 ; D:/TC/src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rsi, %rdx	 ; attr,
 ; D:/TC/src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rcx, %rcx	 ; _28
	jne	.L244	 ;,
	jmp	.L227	 ;
	.p2align 4,,10
	.p2align 3
.L229:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	 ;, arg_56->value.int_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp172, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_56->kind
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp154
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rsi)	 ;, arg_56->is_get
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%rsi)	 ; name_int, arg_56->type
	jmp	.L230	 ;
	.p2align 4,,10
	.p2align 3
.L246:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; arg,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rsi	 ; tmp171, arg
	jmp	.L230	 ;
.L226:
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	movq	8(%r12), %rbx	 ; _5->name, _39
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:27:         fprintf(stderr, "[Warning] Unsupported type for size lookup: %s\n", type->name);
	leaq	.LC13(%rip), %rdx	 ;, tmp146
	movq	24(%rax), %rcx	 ; _40->_stderr, _40->_stderr
	movq	%rbx, %r8	 ; _39,
	call	fprintf	 ;
 ; D:/TC/src/tac.c:202:         table->size += get_type_size(type);
	movq	16(%rdi), %rax	 ; attr_table_12->size, tmp178
	.p2align 4,,10
	.p2align 3
.L242:
	addq	$8, %rax	 ;, _22
	jmp	.L220	 ;
	.p2align 4,,10
	.p2align 3
.L243:
	addq	$1, %rax	 ;, _22
	jmp	.L220	 ;
	.p2align 4
	.globl	tac_if
	.def	tac_if;	.scl	2;	.type	32;	.endef
tac_if:
	pushq	%r15	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r15	 ;, tmp223
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp226, if_
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp227, status
	subq	$72, %rsp	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_54(D)->block_count, _239
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp223,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_230->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp228, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp172
	movq	%rax, 80(%rbx)	 ; tmp172, status_54(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _243, var_230->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp229, _243
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _239
	je	.L289	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _239,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp175
	call	sprintf	 ;
.L249:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_230->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_54(D)->block_count, _218
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp223,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_209->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp230, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp176
	movq	%rax, 80(%rbx)	 ; tmp176, status_54(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _222, var_209->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp231, _222
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _218
	je	.L290	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _218,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp179
	call	sprintf	 ;
.L251:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rsi)	 ;, var_209->type
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rcx	 ; if__56(D)->else_if, if__56(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp232
	je	.L256	 ;,
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__56(D)->else_body, if__56(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:472:         end_label = else_label;
	movq	%rsi, 56(%rsp)	 ; var, %sfp
 ; D:/TC/src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp235
	je	.L256	 ;,
.L255:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rdx	 ; status,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_110->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp236, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_110->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	56(%rsp), %rax	 ; %sfp, var
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	 ;, arg_110->is_get
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r14), %rcx	 ; if__56(D)->condition, if__56(D)->condition
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, 0(%r13)	 ; var, arg_110->value.label
 ; D:/TC/src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	 ;
	movq	%rax, %r12	 ; tmp237, _6
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _6
	je	.L258	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _6->is_get
	jne	.L291	 ;,
.L258:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_106->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp239, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_106->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; var, arg_106->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_106->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_105->value.label
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_105->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_105->type
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_105->is_get
	movq	%rax, 32(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	32(%rsp), %r8	 ; %sfp, arg
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp241, inst
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	 ; arg, inst_104->arg3
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r8, 8(%rax)	 ; arg, inst_104->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_104->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	 ; _6, inst_104->arg1
 ; D:/TC/src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _7->instructions, _7->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_102->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp242, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp243, block_102->instructions
 ; D:/TC/src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _9->blocks, _9->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:483:     status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:/TC/src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rcx	 ; if__56(D)->body, if__56(D)->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp244, then_statements
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L260:
 ; D:/TC/src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L259:
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%rdi, %rcx	 ; then_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp245, statement
 ; D:/TC/src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L260	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_111->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp246, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_111->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_111->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_111->arg3
 ; D:/TC/src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _12->instructions, _12->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rcx	 ; if__56(D)->else_if, if__56(D)->else_if
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	 ; tmp247
	je	.L292	 ;,
.L261:
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rcx	 ; if__56(D)->else_body, if__56(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	 ; tmp268
	je	.L293	 ;,
.L273:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp274, block
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	56(%rsp), %rax	 ; %sfp, var
	movq	%rax, (%rsi)	 ; var, block_128->label
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp275, block_128->instructions
 ; D:/TC/src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _38->blocks, _38->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:543:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_54(D)->current_block
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
.L256:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_54(D)->block_count, _260
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp223,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_251->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp233, var
	movq	%rax, 56(%rsp)	 ; var, %sfp
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp181
	movq	%rax, 80(%rbx)	 ; tmp181, status_54(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _264, var_251->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp234, _264
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _260
	je	.L294	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _260,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp185
	call	sprintf	 ;
.L257:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	56(%rsp), %rax	 ; %sfp, var
	movq	$0, 16(%rax)	 ;, var_251->type
	jmp	.L255	 ;
	.p2align 4,,10
	.p2align 3
.L294:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp184
	call	sprintf	 ;
	jmp	.L257	 ;
	.p2align 4,,10
	.p2align 3
.L290:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp178
	call	sprintf	 ;
	jmp	.L251	 ;
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp174
	call	sprintf	 ;
	jmp	.L249	 ;
	.p2align 4,,10
	.p2align 3
.L293:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; var, block_125->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp269, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp270, block_125->instructions
 ; D:/TC/src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _33->blocks, _33->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:530:         status->current_block = else_block;
	movq	%rdi, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:/TC/src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rcx	 ; if__56(D)->else_body, if__56(D)->else_body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp271, else_statements
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L274	 ;
	.p2align 4,,10
	.p2align 3
.L275:
 ; D:/TC/src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L274:
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rsi, %rcx	 ; else_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp272, else_statement
 ; D:/TC/src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	 ; else_statement
	jne	.L275	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_127->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp273, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_127->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_127->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_127->arg3
 ; D:/TC/src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _36->instructions, _36->instructions
	call	list_append	 ;
	jmp	.L273	 ;
	.p2align 4,,10
	.p2align 3
.L292:
 ; D:/TC/src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rcx	 ; if__56(D)->else_if, if__56(D)->else_if
	call	list_copy	 ;
	movq	%rax, 32(%rsp)	 ; tmp248, %sfp
	.p2align 4,,10
	.p2align 3
.L262:
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp267, elif
 ; D:/TC/src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	 ; elif
	je	.L261	 ;,
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rsi, (%rax)	 ; var, block_117->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp249, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp250, block_117->instructions
 ; D:/TC/src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _17->blocks, _17->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:501:             status->current_block = else_if_block;
	movq	%rdi, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_54(D)->block_count, _302
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp223,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_293->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp251, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp198
	movq	%rax, 80(%rbx)	 ; tmp198, status_54(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _306, var_293->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp252, _306
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _302
	je	.L295	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _302,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L264:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_293->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_54(D)->block_count, _281
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp223,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_272->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rsi	 ; tmp253, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp202
	movq	%rax, 80(%rbx)	 ; tmp202, status_54(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rsi)	 ; _285, var_272->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp254, _285
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _281
	je	.L296	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _281,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L266:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rsi)	 ;, var_272->type
 ; D:/TC/src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	(%r12), %rcx	 ; elif_72->condition, elif_72->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rbp	 ; tmp255, _20
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _20
	je	.L267	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _20->is_get
	jne	.L297	 ;,
.L267:
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	32(%rsp), %rcx	 ; %sfp,
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	 ; tmp257
	jne	.L298	 ;,
.L269:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_123->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_123->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rsi, (%rax)	 ; var, arg_123->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_123->is_get
	movq	%rax, 48(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_122->value.label
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_122->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_122->type
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_122->is_get
	movq	%rax, 40(%rsp)	 ; arg, %sfp
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	40(%rsp), %r9	 ; %sfp, arg
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	48(%rsp), %r8	 ; %sfp, arg
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp261, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	 ; _20, inst_121->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r9, 8(%rax)	 ; arg, inst_121->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r8, 16(%rax)	 ; arg, inst_121->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_121->type
 ; D:/TC/src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _24->instructions, _24->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_119->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp262, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp263, block_119->instructions
 ; D:/TC/src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	 ; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _26->blocks, _26->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:514:             status->current_block = then_block;
	movq	%rbp, 16(%rbx)	 ; block, status_54(D)->current_block
 ; D:/TC/src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rcx	 ; elif_72->body, elif_72->body
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp264, elif_statements
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L270	 ;
	.p2align 4,,10
	.p2align 3
.L271:
 ; D:/TC/src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L270:
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%rdi, %rcx	 ; elif_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp265, elif_statement
 ; D:/TC/src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	 ; elif_statement
	jne	.L271	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_124->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp266, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_124->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_124->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_124->arg3
 ; D:/TC/src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	 ; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rcx	 ; _29->instructions, _29->instructions
	call	list_append	 ;
	jmp	.L262	 ;
	.p2align 4,,10
	.p2align 3
.L296:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L266	 ;
	.p2align 4,,10
	.p2align 3
.L295:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L264	 ;
	.p2align 4,,10
	.p2align 3
.L298:
 ; D:/TC/src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rcx	 ; if__56(D)->else_body, if__56(D)->else_body
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	 ; tmp258
	cmovne	56(%rsp), %rsi	 ; var,, %sfp, var
	jmp	.L269	 ;
	.p2align 4,,10
	.p2align 3
.L297:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _20,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rbp	 ; tmp256, _20
	jmp	.L267	 ;
.L291:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _6,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r12	 ; tmp238, _6
	jmp	.L258	 ;
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
	ja	.L300	 ;,
	movq	%rdx, %rdi	 ; tmp153, status
	leaq	.L302(%rip), %rdx	 ;, tmp122
	movq	%rcx, %rsi	 ; tmp152, statement
	movslq	(%rdx,%rbx,4), %rax	 ;, tmp124
	addq	%rdx, %rax	 ; tmp122, tmp125
	jmp	*%rax	 ; tmp125
	.section .rdata,"dr"
	.align 4
.L302:
	.long	.L309-.L302
	.long	.L308-.L302
	.long	.L307-.L302
	.long	.L306-.L302
	.long	.L305-.L302
	.long	.L304-.L302
	.long	.L303-.L302
	.long	.L301-.L302
	.text
	.p2align 4,,10
	.p2align 3
.L303:
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rdi), %rcx	 ; status_35(D)->end_labels, status_35(D)->end_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	 ; tmp159
	jne	.L312	 ;,
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rdi), %rax	 ; status_35(D)->end_labels, status_35(D)->end_labels
 ; D:/TC/src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	 ; _14->tail, _14->tail
	movq	8(%rax), %rbx	 ; _15->content, label
 ; D:/TC/src/tac.c:440:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	je	.L312	 ;,
.L332:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;,
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp160, inst
	jmp	.L330	 ;
	.p2align 4,,10
	.p2align 3
.L301:
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rdi), %rcx	 ; status_35(D)->start_labels, status_35(D)->start_labels
	call	list_is_empty	 ;
 ; D:/TC/src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	 ; tmp162
	jne	.L313	 ;,
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rdi), %rax	 ; status_35(D)->start_labels, status_35(D)->start_labels
 ; D:/TC/src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	 ; _22->tail, _22->tail
	movq	8(%rax), %rbx	 ; _23->content, label
 ; D:/TC/src/tac.c:451:                 if (label != NULL) {
	testq	%rbx, %rbx	 ; label
	jne	.L332	 ;,
.L313:
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rcx	 ;, tmp149
	movq	24(%rax), %r9	 ; _26->_stderr,
	jmp	.L331	 ;
	.p2align 4,,10
	.p2align 3
.L307:
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
.L309:
 ; D:/TC/src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rcx), %rcx	 ; statement_34(D)->stmt.expr, statement_34(D)->stmt.expr
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _3
	je	.L299	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _3->is_get
	jne	.L333	 ;,
.L299:
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L308:
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
.L305:
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
.L304:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:249:             arg->value.string_value = NULL;
	movq	$0, (%rax)	 ;, arg_80->value.string_value
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	 ; tmp155, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$5, 16(%rax)	 ;, arg_80->kind
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	.refptr.name_void(%rip), %rax	 ;, tmp132
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	 ;, arg_80->is_get
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rsi), %rcx	 ; statement_34(D)->stmt.return_expr, _8
 ; D:/TC/src/tac.c:250:             arg->type = name_void;
	movq	(%rax), %rax	 ; name_void, name_void
	movq	%rax, 8(%rbx)	 ; name_void, arg_80->type
 ; D:/TC/src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rcx, %rcx	 ; _8
	je	.L311	 ;,
 ; D:/TC/src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rdi, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %rbx	 ; tmp156, arg
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; arg
	je	.L311	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _9->is_get
	jne	.L334	 ;,
.L311:
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$21, 24(%rax)	 ;, inst_60->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp158, inst
.L330:
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
.L306:
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
.L312:
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	call	__getreent	 ;
 ; D:/TC/src/tac.c:446:             fprintf(stderr, "[Warning] 'break' statement used outside of loop\n");
	movl	$49, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rcx	 ;, tmp142
	movq	24(%rax), %r9	 ; _18->_stderr,
.L331:
 ; D:/TC/src/tac.c:464: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
 ; D:/TC/src/tac.c:457:             fprintf(stderr, "[Warning] 'continue' statement used outside of loop\n");
	jmp	fwrite	 ;
.L300:
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
.L334:
	movq	%rdi, %rdx	 ; status,
	movq	%rax, %rcx	 ; arg,
	call	load_rvalue.part.0	 ;
	movq	%rax, %rbx	 ; tmp157, arg
	jmp	.L311	 ;
	.p2align 4,,10
	.p2align 3
.L333:
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
	movq	%rcx, %rdi	 ; tmp207, for_
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp208, status
	subq	$56, %rsp	 ;,
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rcx), %rcx	 ; for__44(D)->initializer, _1
 ; D:/TC/src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rcx, %rcx	 ; _1
	je	.L336	 ;,
 ; D:/TC/src/tac.c:550:         tac_variable(for_->initializer, status, false);
	xorl	%r8d, %r8d	 ;
	call	tac_variable	 ;
.L336:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r15	 ;, tmp206
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_45(D)->block_count, _265
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp206,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_256->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	 ; tmp209, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp163
	movq	%rax, 80(%rbx)	 ; tmp163, status_45(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	 ; _269, var_256->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp210, _269
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _265
	je	.L367	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _265,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp166
	call	sprintf	 ;
.L338:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rbp)	 ;, var_256->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_45(D)->block_count, _244
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp206,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_235->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r13	 ; tmp211, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp167
	movq	%rax, 80(%rbx)	 ; tmp167, status_45(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r13)	 ; _248, var_235->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp212, _248
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _244
	je	.L368	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _244,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp170
	call	sprintf	 ;
.L340:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r13)	 ;, var_235->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_45(D)->block_count, _223
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp206,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_214->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp213, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp171
	movq	%rax, 80(%rbx)	 ; tmp171, status_45(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _227, var_214->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp214, _227
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _223
	je	.L369	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _223,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp174
	call	sprintf	 ;
.L342:
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rdi)	 ;, for__44(D)->condition
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_214->type
 ; D:/TC/src/tac.c:555:     if (for_->condition != NULL) {
	je	.L343	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp215, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_85->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_85->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp216, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_84->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_84->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_84->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_84->arg3
 ; D:/TC/src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rcx	 ; _3->instructions, _3->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; var, block_82->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp217, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp218, block_82->instructions
 ; D:/TC/src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _5->blocks, _5->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:561:         status->current_block = condition_block;
	movq	%rsi, 16(%rbx)	 ; block, status_45(D)->current_block
 ; D:/TC/src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rdi), %rcx	 ; for__44(D)->condition, for__44(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r8	 ; tmp219, _8
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _8
	je	.L344	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _8->is_get
	jne	.L370	 ;,
.L344:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ; _8, %sfp
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_78->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp221, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_78->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_78->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_78->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_77->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp222, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_77->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_77->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_77->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	40(%rsp), %r8	 ; %sfp, _8
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_76->arg2
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp223, inst
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_76->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r8, (%rax)	 ; _8, inst_76->arg1
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%rsi, 16(%rax)	 ; arg, inst_76->arg3
 ; D:/TC/src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rcx	 ;, _9->instructions
	call	list_append	 ;
.L345:
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	 ; var, block_89->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp226, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp227, block_89->instructions
 ; D:/TC/src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _13->blocks, _13->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:574:     status->current_block = body_block;
	movq	%rsi, 16(%rbx)	 ; block, status_45(D)->current_block
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rsi	 ; status_45(D)->block_count, _286
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r15, %rcx	 ; tmp206,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_277->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp228, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rsi), %rax	 ;, tmp186
	movq	%rax, 80(%rbx)	 ; tmp186, status_45(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _290, var_277->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp229, _290
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rsi	 ;, _286
	je	.L371	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rsi, %r9	 ; _286,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp189
	call	sprintf	 ;
.L347:
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%rdi)	 ;, for__44(D)->increment
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r14)	 ;, var_277->type
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:577:     if (for_->increment != NULL)
	je	.L348	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rcx	 ; status_45(D)->start_labels, status_45(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp230, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_91->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_91->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; var, arg_91->value.label
 ; D:/TC/src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	list_append	 ;
.L349:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_94->is_get
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_45(D)->end_labels, status_45(D)->end_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp233, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_94->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_94->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_94->value.label
 ; D:/TC/src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rdi), %rcx	 ; for__44(D)->body, for__44(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp234, body_statements
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L351	 ;
	.p2align 4,,10
	.p2align 3
.L352:
 ; D:/TC/src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L351:
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp235, statement
 ; D:/TC/src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L352	 ;,
 ; D:/TC/src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_45(D)->start_labels, status_45(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_45(D)->end_labels, status_45(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rdi)	 ;, for__44(D)->increment
	je	.L354	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_99->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp236, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_99->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	 ; var, arg_99->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_99->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp237, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_98->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_98->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_98->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_98->arg3
 ; D:/TC/src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rcx	 ; _25->instructions, _25->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	 ; var, block_96->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp238, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp239, block_96->instructions
 ; D:/TC/src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	 ; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _27->blocks, _27->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:596:         status->current_block = increment_block;
	movq	%rsi, 16(%rbx)	 ; block, status_45(D)->current_block
 ; D:/TC/src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rdi), %rcx	 ; for__44(D)->increment, for__44(D)->increment
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _30
	je	.L354	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _30->is_get
	jne	.L372	 ;,
.L354:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_101->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp241, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_101->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_101->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_101->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%rdi)	 ;, for__44(D)->condition
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_100->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp242, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_100->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_100->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_100->arg3
 ; D:/TC/src/tac.c:601:     if (for_->condition == NULL)
	je	.L373	 ;,
.L356:
 ; D:/TC/src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rcx	 ; _32->instructions, _32->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_104->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp245, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp246, block_104->instructions
 ; D:/TC/src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _34->blocks, _34->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:607:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_45(D)->current_block
 ; D:/TC/src/tac.c:609: }
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
.L348:
 ; D:/TC/src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rdi)	 ;, for__44(D)->condition
	je	.L350	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_45(D)->start_labels, status_45(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp231, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_92->value.label
 ; D:/TC/src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
	jmp	.L349	 ;
	.p2align 4,,10
	.p2align 3
.L371:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp188
	call	sprintf	 ;
	jmp	.L347	 ;
	.p2align 4,,10
	.p2align 3
.L369:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp173
	call	sprintf	 ;
	jmp	.L342	 ;
	.p2align 4,,10
	.p2align 3
.L368:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp169
	call	sprintf	 ;
	jmp	.L340	 ;
	.p2align 4,,10
	.p2align 3
.L367:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp165
	call	sprintf	 ;
	jmp	.L338	 ;
	.p2align 4,,10
	.p2align 3
.L343:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_87->value.label
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp224, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_87->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_86->arg1
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp225, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_86->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_86->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_86->arg3
 ; D:/TC/src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rcx	 ;, _11->instructions
	call	list_append	 ;
	jmp	.L345	 ;
	.p2align 4,,10
	.p2align 3
.L372:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _30,
	call	load_rvalue.part.0	 ;
	jmp	.L354	 ;
	.p2align 4,,10
	.p2align 3
.L373:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_103->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp243, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_103->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_103->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_103->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_102->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp244, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_102->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_102->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_102->arg3
	jmp	.L356	 ;
	.p2align 4,,10
	.p2align 3
.L350:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;,
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rcx	 ; status_45(D)->start_labels, status_45(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp232, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;,
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	 ; var, arg_93->value.label
 ; D:/TC/src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	list_append	 ;
	jmp	.L349	 ;
	.p2align 4,,10
	.p2align 3
.L370:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _8,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r8	 ; tmp220, _8
	jmp	.L344	 ;
	.p2align 4
	.globl	tac_while
	.def	tac_while;	.scl	2;	.type	32;	.endef
tac_while:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %r13	 ;, tmp163
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp164, while_
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp165, status
	subq	$40, %rsp	 ;,
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_22(D)->block_count, _177
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp163,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_168->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rdi	 ; tmp166, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp133
	movq	%rax, 80(%rbx)	 ; tmp133, status_22(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rdi)	 ; _181, var_168->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp167, _181
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _177
	je	.L388	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _177,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp136
	call	sprintf	 ;
.L376:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rdi)	 ;, var_168->type
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_58->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	 ; tmp168, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_58->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_58->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_58->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp169, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	 ; arg, inst_57->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_57->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_57->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_57->arg3
 ; D:/TC/src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_22(D)->current_block, status_22(D)->current_block
	movq	8(%rax), %rcx	 ; _1->instructions, _1->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rdi, (%rax)	 ; var, block_55->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rbp	 ; tmp170, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	 ; tmp171, block_55->instructions
 ; D:/TC/src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	 ; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _3->blocks, _3->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:618:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	 ; block, status_22(D)->current_block
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	 ; status_22(D)->block_count, _156
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp163,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_147->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r12	 ; tmp172, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	 ;, tmp141
	movq	%rax, 80(%rbx)	 ; tmp141, status_22(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r12)	 ; _160, var_147->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp173, _160
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	 ;, _156
	je	.L389	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rbp, %r9	 ; _156,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp144
	call	sprintf	 ;
.L378:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r12)	 ;, var_147->type
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %r14	 ; status_22(D)->block_count, _135
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%r13, %rcx	 ; tmp163,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_126->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	 ; tmp174, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	 ;, tmp145
	movq	%rax, 80(%rbx)	 ; tmp145, status_22(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	 ; _139, var_126->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp175, _139
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	 ;, _135
	je	.L390	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r14, %r9	 ; _135,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp148
	call	sprintf	 ;
.L380:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%rbp)	 ;, var_126->type
 ; D:/TC/src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	(%rsi), %rcx	 ; while__26(D)->condition, while__26(D)->condition
	movq	%rbx, %rdx	 ; status,
	call	tac_expression	 ;
	movq	%rax, %r15	 ; tmp176, _6
 ; D:/TC/src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	 ; _6
	je	.L381	 ;,
 ; D:/TC/src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	 ;, _6->is_get
	jne	.L391	 ;,
.L381:
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_49->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp178, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_49->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_49->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_49->is_get
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_48->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	 ; tmp179, arg
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_48->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	 ; var, arg_48->value.label
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_48->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp180, inst
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	 ; arg, inst_47->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	 ; arg, inst_47->arg3
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	 ;, inst_47->type
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r15, (%rax)	 ; _6, inst_47->arg1
 ; D:/TC/src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_22(D)->current_block, status_22(D)->current_block
	movq	8(%rax), %rcx	 ; _7->instructions, _7->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	 ; var, block_45->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %r13	 ; tmp181, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r13, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	 ; tmp182, block_45->instructions
 ; D:/TC/src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	 ; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _9->blocks, _9->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:628:     status->current_block = body_block;
	movq	%r13, 16(%rbx)	 ; block, status_22(D)->current_block
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_44->is_get
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rcx	 ; status_22(D)->start_labels, status_22(D)->start_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp183, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_44->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_44->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_44->value.label
 ; D:/TC/src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_43->is_get
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rcx	 ; status_22(D)->end_labels, status_22(D)->end_labels
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rdx	 ; tmp184, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_43->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_43->type
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	 ; var, arg_43->value.label
 ; D:/TC/src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	list_append	 ;
 ; D:/TC/src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rsi), %rcx	 ; while__26(D)->body, while__26(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp185, body_statements
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L382	 ;
	.p2align 4,,10
	.p2align 3
.L383:
 ; D:/TC/src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L382:
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rsi, %rcx	 ; body_statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp186, statement
 ; D:/TC/src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L383	 ;,
 ; D:/TC/src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rcx	 ; status_22(D)->start_labels, status_22(D)->start_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rcx	 ; status_22(D)->end_labels, status_22(D)->end_labels
	call	list_pop_back	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rdi, (%rax)	 ; var, arg_63->value.label
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	 ; tmp187, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	 ;, arg_63->kind
 ; D:/TC/src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	 ;, arg_63->type
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_63->is_get
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
	movq	%rax, %rdx	 ; tmp188, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%rsi, (%rax)	 ; arg, inst_62->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	 ;, inst_62->arg2
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	 ;, inst_62->type
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_62->arg3
 ; D:/TC/src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	 ; status_22(D)->current_block, status_22(D)->current_block
	movq	8(%rax), %rcx	 ; _16->instructions, _16->instructions
	call	list_append	 ;
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	 ; var, block_60->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rsi	 ; tmp189, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rsi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rsi)	 ; tmp190, block_60->instructions
 ; D:/TC/src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	 ; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	32(%rax), %rcx	 ; _18->blocks, _18->blocks
	call	list_append	 ;
 ; D:/TC/src/tac.c:644:     status->current_block = end_block;
	movq	%rsi, 16(%rbx)	 ; block, status_22(D)->current_block
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
.L388:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp135
	call	sprintf	 ;
	jmp	.L376	 ;
	.p2align 4,,10
	.p2align 3
.L390:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp147
	call	sprintf	 ;
	jmp	.L380	 ;
	.p2align 4,,10
	.p2align 3
.L389:
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp143
	call	sprintf	 ;
	jmp	.L378	 ;
	.p2align 4,,10
	.p2align 3
.L391:
	movq	%rbx, %rdx	 ; status,
	movq	%rax, %rcx	 ; _6,
	call	load_rvalue.part.0	 ;
	movq	%rax, %r15	 ; tmp177, _6
	jmp	.L381	 ;
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
 ; D:/TC/src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)]
 ; D:/TC/src/tac.c:318: void tac_function(Function* function, TACStatus* status) {
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
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp142, subroutine_43->blocks
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_18(D)->tac, status_18(D)->tac
 ; D:/TC/src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_18(D)->current_subroutine
 ; D:/TC/src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp157
	movq	16(%rax), %rcx	 ; function_15(D)->parameters, function_15(D)->parameters
	call	list_copy	 ;
	movq	%rax, %rdi	 ; tmp143, parameters
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L393	 ;
	.p2align 4,,10
	.p2align 3
.L399:
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_43->parameters, subroutine_43->parameters
	movq	%r15, %rdx	 ; var,
	call	list_append	 ;
.L393:
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%rdi, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L410	 ;,
 ; D:/TC/src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r13	 ; parameter_24->name, _7
	movq	(%rax), %r14	 ; parameter_24->type, _6
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%r13, %r13	 ; _7
	je	.L400	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %edx	 ; _6->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%r12d, %r12d	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	 ;
	jne	.L397	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	 ; _6->ast_node.class, _6->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r12	 ; status_18(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	 ; _6->ast_node.class, status_18(D)->current_class
.L397:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rdx	 ; status,
	movq	%r13, %rcx	 ; _7,
	call	search_var	 ;
	movq	%rax, %r15	 ; tmp146, var
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %eax	 ; _6->kind,
	testl	%eax, %eax	 ;
	jne	.L398	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%r12, 24(%rbx)	 ; current_class, status_18(D)->current_class
.L398:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%r15, %r15	 ; var
	jne	.L399	 ;,
.L400:
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
	je	.L411	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r13, %r9	 ; _58,
	movl	$112, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L401:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r14, 16(%r15)	 ; _6, var_55->type
	jmp	.L399	 ;
	.p2align 4,,10
	.p2align 3
.L411:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$112, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L401	 ;
	.p2align 4,,10
	.p2align 3
.L410:
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
	je	.L412	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _85,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp128
	call	sprintf	 ;
.L404:
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
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_43->blocks, subroutine_43->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp151, block_35->instructions
 ; D:/TC/src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp158
 ; D:/TC/src/tac.c:332:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_18(D)->current_block
 ; D:/TC/src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rax), %rcx	 ; function_15(D)->body, function_15(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp152, statements
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L405	 ;
	.p2align 4,,10
	.p2align 3
.L406:
 ; D:/TC/src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L405:
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp153, statement
 ; D:/TC/src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L406	 ;,
 ; D:/TC/src/tac.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_18(D)->current_subroutine
 ; D:/TC/src/tac.c:341: }
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
.L412:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp127
	call	sprintf	 ;
	jmp	.L404	 ;
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
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%rcx, %r12	 ; tmp189, method
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp190, status
	subq	$16, %rsp	 ;,
	andq	$-16, %rsp	 ;,
	subq	$48, %rsp	 ;,
	movaps	%xmm6, 48(%rsp)	 ;,
 ; D:/TC/src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rcx), %xmm6	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:89:     subroutine->name = name;
	movups	%xmm6, (%rax)	 ; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_87]
 ; D:/TC/src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rsi	 ; tmp191, subroutine
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rsi)	 ; tmp192, subroutine_87->parameters
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rsi)	 ; tmp193, subroutine_87->local_vars
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rsi, %rdx	 ; subroutine,
 ; D:/TC/src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rsi)	 ; tmp194, subroutine_87->blocks
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	 ; status_45(D)->tac, status_45(D)->tac
 ; D:/TC/src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rsi, 8(%rbx)	 ; subroutine, status_45(D)->current_subroutine
 ; D:/TC/src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rcx	 ; _3->subroutines, _3->subroutines
	call	list_append	 ;
 ; D:/TC/src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r12), %rcx	 ; method_42(D)->parameters, method_42(D)->parameters
	call	list_copy	 ;
	movq	%rax, 40(%rsp)	 ; tmp195, %sfp
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L414	 ;
	.p2align 4,,10
	.p2align 3
.L420:
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rsi), %rcx	 ; subroutine_87->parameters, subroutine_87->parameters
	movq	%r15, %rdx	 ; var,
	call	list_append	 ;
.L414:
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	40(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	 ; parameter
	je	.L434	 ;,
 ; D:/TC/src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r13	 ; parameter_51->name, _7
	movq	(%rax), %r14	 ; parameter_51->type, _6
 ; D:/TC/src/tac.c:157:     if (original_name != NULL) {
	testq	%r13, %r13	 ; _7
	je	.L421	 ;,
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %r9d	 ; _6->kind,
 ; D:/TC/src/tac.c:158:         Class* current_class = NULL;
	xorl	%edi, %edi	 ; current_class
 ; D:/TC/src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%r9d, %r9d	 ;
	jne	.L418	 ;,
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	 ; _6->ast_node.class, _6->ast_node.class
 ; D:/TC/src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %rdi	 ; status_45(D)->current_class, current_class
 ; D:/TC/src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	 ; _6->ast_node.class, status_45(D)->current_class
.L418:
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rdx	 ; status,
	movq	%r13, %rcx	 ; _7,
	call	search_var	 ;
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %r8d	 ; _6->kind,
 ; D:/TC/src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %r15	 ; tmp198, var
 ; D:/TC/src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r8d, %r8d	 ;
	jne	.L419	 ;,
 ; D:/TC/src/tac.c:165:             status->current_class = current_class;
	movq	%rdi, 24(%rbx)	 ; current_class, status_45(D)->current_class
.L419:
 ; D:/TC/src/tac.c:166:         if (var != NULL) {
	testq	%r15, %r15	 ; var
	jne	.L420	 ;,
.L421:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rcx	 ;,
	movl	$32, %edx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	%r13, (%rax)	 ; _7, var_99->original_name
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbx), %r13	 ; status_45(D)->param_count, _102
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	 ; tmp196, var
 ; D:/TC/src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r13), %rax	 ;, tmp153
	movq	%rax, 56(%rbx)	 ; tmp153, status_45(D)->param_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	 ; _112, var_99->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp197, _112
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r13	 ;, _102
	je	.L435	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%r13, %r9	 ; _102,
	movl	$112, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;,
	call	sprintf	 ;
.L422:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	%r14, 16(%r15)	 ; _6, var_99->type
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L435:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$112, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;,
	call	sprintf	 ;
	jmp	.L422	 ;
	.p2align 4,,10
	.p2align 3
.L434:
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rdi	 ; status_45(D)->block_count, _129
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;,
 ; D:/TC/src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	 ;, var_120->original_name
 ; D:/TC/src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r14	 ; tmp200, var
 ; D:/TC/src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rdi), %rax	 ;, tmp159
	movq	%rax, 80(%rbx)	 ; tmp159, status_45(D)->block_count
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	call	create_string	 ;
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r14)	 ; _133, var_120->name
 ; D:/TC/src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rcx	 ; tmp201, _133
 ; D:/TC/src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rdi	 ;, _129
	je	.L436	 ;,
 ; D:/TC/src/tac.c:187:         sprintf(var->name, "$%c%zu", kind, id);
	movq	%rdi, %r9	 ; _129,
	movl	$98, %r8d	 ;,
	leaq	.LC2(%rip), %rdx	 ;, tmp162
	call	sprintf	 ;
.L425:
 ; D:/TC/src/tac.c:188:     var->type = type;
	movq	$0, 16(%r14)	 ;, var_120->type
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	 ; var, block_73->label
 ; D:/TC/src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movq	%rax, %rdi	 ; tmp202, block
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	call	create_list	 ;
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rsi), %rcx	 ; subroutine_87->blocks, subroutine_87->blocks
	movq	%rdi, %rdx	 ; block,
 ; D:/TC/src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rdi)	 ; tmp203, block_73->instructions
 ; D:/TC/src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	call	list_append	 ;
 ; D:/TC/src/tac.c:356:     status->current_block = block;
	movq	%rdi, 16(%rbx)	 ; block, status_45(D)->current_block
 ; D:/TC/src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r12), %rcx	 ; method_42(D)->body, method_42(D)->body
	call	list_copy	 ;
	movq	%rax, %rsi	 ; tmp204, statements
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp165
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	 ; status_45(D)->current_class, status_45(D)->current_class
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	 ; _13->name, _13->name
	movq	8(%rax), %rcx	 ; _14->name, _14->name
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp205, _16
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%r12), %rax	 ; method_42(D)->name, method_42(D)->name
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rcx	 ; _17->name, _17->name
	call	strcmp	 ;
 ; D:/TC/src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	 ; tmp206
	jne	.L429	 ;,
	jmp	.L437	 ;
	.p2align 4,,10
	.p2align 3
.L430:
 ; D:/TC/src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rdx	 ; status,
	call	tac_statement	 ;
.L429:
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp213, statement
 ; D:/TC/src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	 ; statement
	jne	.L430	 ;,
 ; D:/TC/src/tac.c:373:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	 ;, status_45(D)->current_subroutine
 ; D:/TC/src/tac.c:375: }
	movaps	48(%rsp), %xmm6	 ;,
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
.L436:
 ; D:/TC/src/tac.c:185:         sprintf(var->name, "$%d-error", kind);
	movl	$98, %r8d	 ;,
	leaq	.LC1(%rip), %rdx	 ;, tmp161
	call	sprintf	 ;
	jmp	.L425	 ;
	.p2align 4,,10
	.p2align 3
.L437:
 ; D:/TC/src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rsi, %rcx	 ; statements,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	8(%rax), %ecx	 ; stmt_58->type,
	testl	%ecx, %ecx	 ;
	jne	.L427	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; stmt_58->stmt.expr, _21
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	 ;, _21->operator
	jne	.L427	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	 ; _21->prim_left, _23
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	 ;, _23->type
	jne	.L427	 ;,
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	 ; _23->value.var, _25
 ; D:/TC/src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	16(%rax), %edx	 ; _25->type,
	testl	%edx, %edx	 ;
	je	.L428	 ;,
.L427:
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	(%r12), %rax	 ; method_42(D)->name, method_42(D)->name
	movq	8(%rax), %rbx	 ; _27->name, _28
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	call	__getreent	 ;
 ; D:/TC/src/tac.c:375: }
	movaps	48(%rsp), %xmm6	 ;,
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	leaq	.LC26(%rip), %rdx	 ;, tmp176
	movq	24(%rax), %rcx	 ; _29->_stderr, _29->_stderr
 ; D:/TC/src/tac.c:375: }
	leaq	-56(%rbp), %rsp	 ;,
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	%rbx, %r8	 ; _28,
 ; D:/TC/src/tac.c:375: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
 ; D:/TC/src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	jmp	fprintf	 ;
.L428:
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r14	 ; status_45(D)->current_class, _31
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r13	 ; _25->content.name, self
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rbx, %r9	 ; status,
	movl	$118, %r8d	 ;,
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	 ; tmp209, arg
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	 ;, arg_154->kind
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	24(%r14), %rax	 ; MEM[(long long int *)_31 + 24B], _156
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%r13, %rcx	 ; self,
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r12)	 ;, arg_154->is_get
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	0(%r13), %rdx	 ; self_59->type, self_59->type
 ; D:/TC/src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%r12)	 ; _156, arg_154->value.int_value
 ; D:/TC/src/tac.c:234:             arg->type = name_int;
	movq	.refptr.name_int(%rip), %rax	 ;, tmp177
	movq	(%rax), %rax	 ; name_int, name_int
	movq	%rax, 8(%r12)	 ; name_int, arg_154->type
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_var	 ;
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %ecx	 ;,
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %r14	 ; tmp210, _35
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	 ; _35, tmp180
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %ecx	 ;,
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	 ; _35->type, tmp180
 ; D:/TC/src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	 ;, arg_141->kind
 ; D:/TC/src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	 ; tmp211, arg
 ; D:/TC/src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	 ;, arg_141->is_get
 ; D:/TC/src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	 ; tmp180, MEM <vector(2) long unsigned int> [(void *)arg_141]
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	alloc_memory	 ;
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%rdi), %rcx	 ; block_73->instructions, block_73->instructions
 ; D:/TC/src/tac.c:215:     inst->type = type;
	movl	$18, 24(%rax)	 ;, inst_76->type
 ; D:/TC/src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rdx	 ; tmp212, inst
 ; D:/TC/src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	 ; arg, inst_76->arg1
 ; D:/TC/src/tac.c:217:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	 ; arg, inst_76->arg2
 ; D:/TC/src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	 ;, inst_76->arg3
 ; D:/TC/src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	list_append	 ;
	jmp	.L429	 ;
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
.L439:
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rsi, %rcx	 ; members,
	call	list_pop	 ;
 ; D:/TC/src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; member
	je	.L447	 ;,
.L444:
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ebx	 ; member_22->type, _5
 ; D:/TC/src/tac.c:385:         switch (member->type) {
	testl	%ebx, %ebx	 ; _5
	je	.L440	 ;,
	cmpl	$1, %ebx	 ;, _5
	je	.L441	 ;,
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
	jne	.L444	 ;,
.L447:
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
.L441:
 ; D:/TC/src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rcx	 ; member_22->content.variable, member_22->content.variable
	movl	$1, %r8d	 ;,
	movq	%rdi, %rdx	 ; status,
	call	tac_variable	 ;
 ; D:/TC/src/tac.c:391:                 break;
	jmp	.L439	 ;
	.p2align 4,,10
	.p2align 3
.L440:
 ; D:/TC/src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rcx	 ; member_22->content.method, member_22->content.method
	movq	%rdi, %rdx	 ; status,
	call	tac_method	 ;
 ; D:/TC/src/tac.c:388:                 break;
	jmp	.L439	 ;
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
	je	.L454	 ;,
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rbx), %eax	 ;, tmp99
 ; D:/TC/src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	 ;, tmp99
	jbe	.L455	 ;,
 ; D:/TC/src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ebx, %ebx	 ; _2
	jne	.L451	 ;,
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
.L451:
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
.L455:
 ; D:/TC/src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rcx), %rdx	 ; _1->type, _1->type
	movq	%r8, %r9	 ; status,
	movl	$102, %r8d	 ;,
.L453:
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
.L454:
 ; D:/TC/src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%r8, %r9	 ; status,
	movq	(%rcx), %rdx	 ; _1->type, _1->type
	movl	$118, %r8d	 ;,
	jmp	.L453	 ;
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
.L457:
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%rdi, %rcx	 ; members,
	call	list_pop	 ;
	movq	%rax, %rbx	 ; tmp126, code_member
 ; D:/TC/src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	 ; code_member
	je	.L465	 ;,
.L463:
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	 ; code_member_21->type, _2
 ; D:/TC/src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	 ;, _2
	je	.L466	 ;,
 ; D:/TC/src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	 ;, _2
	je	.L467	 ;,
 ; D:/TC/src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	 ; _2
	jne	.L457	 ;,
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
	jne	.L463	 ;,
.L465:
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
.L466:
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
	jne	.L457	 ;,
 ; D:/TC/src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r12)	 ; _5, tac_29->entry_point
	jmp	.L457	 ;
	.p2align 4,,10
	.p2align 3
.L467:
 ; D:/TC/src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rcx	 ; code_member_21->content.class, code_member_21->content.class
	movq	%rsi, %rdx	 ; status,
	call	tac_class	 ;
	jmp	.L457	 ;
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
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	strtoll;	.scl	2;	.type	32;	.endef
	.def	strtod;	.scl	2;	.type	32;	.endef
	.def	list_pop_back;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
