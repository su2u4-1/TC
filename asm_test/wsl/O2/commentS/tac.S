	.file	"tac.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	create_var, @function
create_var:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rsi, %r13	; tmp189, type
	pushq	%r12	;
	movl	%edx, %r12d	; tmp190, kind
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp188, original_name
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp191, status
	subq	$24, %rsp	;,
; src/tac.c:157:     if (original_name != NULL) {
	testq	%rdi, %rdi	; original_name
	je	.L3	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%rsi), %ecx	; type_34(D)->kind,
; src/tac.c:158:         Class* current_class = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	;
	jne	.L4	;,
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %rax	; status_35(D)->current_class, current_class
	movq	%rax, (%rsp)	; current_class, %sfp
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rsi), %rax	; type_34(D)->ast_node.class, type_34(D)->ast_node.class
	movq	%rax, 24(%rbx)	; type_34(D)->ast_node.class, status_35(D)->current_class
.L4:
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, _59
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	; _59
	je	.L10	;,
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rdi	; _59->local_vars, _59->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	; tmp192
	je	.L8	;,
.L14:
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, _67
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	; _67
	je	.L10	;,
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rdi	; _67->parameters, _67->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	; tmp195
	je	.L58	;,
.L10:
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rbx)	;, status_35(D)->current_class
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	je	.L7	;,
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rdi	; pretmp_17->attribute_tables, pretmp_17->attribute_tables
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	; tmp199
	je	.L52	;,
.L55:
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
.L7:
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	16(%rax), %rdi	; _95->global_vars, _95->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	; tmp198
	jne	.L53	;,
; src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rdi	; _98->global_vars, _98->global_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp205, vars
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L26	;
	.p2align 4,,10
	.p2align 3
.L27:
; src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	(%r15), %rbp	; var_101->original_name, original_name
	je	.L12	;,
.L26:
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp206, <retval>
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L27	;,
.L53:
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %eax	; type_34(D)->kind,
	testl	%eax, %eax	;
	jne	.L3	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	(%rsp), %rax	; %sfp, current_class
	movq	%rax, 24(%rbx)	; current_class, status_35(D)->current_class
.L3:
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:172:     var->original_name = original_name;
	movq	%rbp, (%rax)	; original_name, var_42->original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	; tmp207, <retval>
; src/tac.c:174:     switch (kind) {
	leal	-97(%r12), %eax	;,
	cmpl	$21, %eax	;, tmp160
	ja	.L30	;,
	leaq	.L32(%rip), %rdx	;, tmp162
	movslq	(%rdx,%rax,4), %rax	;, tmp164
	addq	%rdx, %rax	; tmp162, tmp165
	jmp	*%rax	; tmp165
	.section	.rodata
	.align 4
	.align 4
.L32:
	.long	.L37-.L32
	.long	.L36-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L35-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L34-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L30-.L32
	.long	.L33-.L32
	.long	.L30-.L32
	.long	.L31-.L32
	.text
	.p2align 4,,10
	.p2align 3
.L8:
; src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	24(%rax), %rdi	; _62->local_vars, _62->local_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp193, vars
	.p2align 4,,10
	.p2align 3
.L11:
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp194, <retval>
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L14	;,
; src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	(%r15), %rbp	; var_65->original_name, original_name
	jne	.L11	;,
.L12:
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %edx	; type_34(D)->kind,
	testl	%edx, %edx	;
	jne	.L1	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	(%rsp), %rax	; %sfp, current_class
	movq	%rax, 24(%rbx)	; current_class, status_35(D)->current_class
.L1:
; src/tac.c:193: }
	addq	$24, %rsp	;,
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
.L30:
; src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp167
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; _16, var_42->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp208, _16
.L38:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%r12d, %r8d	; kind,
	leaq	.LC1(%rip), %rcx	;, tmp175
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L41:
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %r12d	;, tmp177
; src/tac.c:188:     var->type = type;
	movq	%r13, 16(%r15)	; type, var_42->type
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %r12d	;, tmp177
	jne	.L1	;,
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	%r15, %rsi	; <retval>,
	movq	24(%rax), %rdi	; _20->local_vars, _20->local_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L1	;
	.p2align 4,,10
	.p2align 3
.L52:
; src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
	movq	(%rax), %rdi	; _79->attribute_tables, _79->attribute_tables
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp200, tables
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	jmp	.L20	;
	.p2align 4,,10
	.p2align 3
.L24:
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rbx), %rax	; status_35(D)->current_class, status_35(D)->current_class
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	; _84->name, tmp215
	cmpq	%rax, 8(%r15)	; tmp215, table_82->name
	je	.L59	;,
.L20:
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r14, %rdi	; tables,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp204, table
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	; table
	jne	.L24	;,
	jmp	.L55	;
	.p2align 4,,10
	.p2align 3
.L58:
; src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	16(%rax), %rdi	; _70->parameters, _70->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp196, vars
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L15	;
	.p2align 4,,10
	.p2align 3
.L16:
; src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	(%r15), %rbp	; var_73->original_name, original_name
	je	.L12	;,
.L15:
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp197, <retval>
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L16	;,
	jmp	.L10	;
.L31:
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rbx), %rbp	; status_35(D)->var_count, id
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%rbp), %rax	;, tmp170
	movq	%rax, 64(%rbx)	; tmp170, status_35(D)->var_count
	.p2align 4,,10
	.p2align 3
.L39:
; src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp174
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; _16, var_42->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp209, _16
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %rbp	;, id
	je	.L38	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbp, %r9	; id,
	movl	%r12d, %r8d	; kind,
	leaq	.LC2(%rip), %rcx	;, tmp176
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L41	;
.L33:
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %rbp	; status_35(D)->temp_count, id
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%rbp), %rax	;, tmp171
	movq	%rax, 72(%rbx)	; tmp171, status_35(D)->temp_count
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L39	;
.L34:
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbx), %rbp	; status_35(D)->param_count, id
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%rbp), %rax	;, tmp169
	movq	%rax, 56(%rbx)	; tmp169, status_35(D)->param_count
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L39	;
.L35:
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rbx), %rbp	; status_35(D)->subroutine_count, id
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%rbp), %rax	;, tmp173
	movq	%rax, 88(%rbx)	; tmp173, status_35(D)->subroutine_count
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L39	;
.L36:
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %rbp	; status_35(D)->block_count, id
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%rbp), %rax	;, tmp172
	movq	%rax, 80(%rbx)	; tmp172, status_35(D)->block_count
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L39	;
.L37:
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rbx), %rbp	; status_35(D)->attr_count, id
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%rbp), %rax	;, tmp168
	movq	%rax, 48(%rbx)	; tmp168, status_35(D)->attr_count
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L39	;
	.p2align 4,,10
	.p2align 3
.L59:
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%r15), %rdi	; table_82->attributes, table_82->attributes
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	; tmp201
	jne	.L20	;,
; src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%r15), %rdi	; table_82->attributes, table_82->attributes
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp202, %sfp
	.p2align 4,,10
	.p2align 3
.L22:
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	; attr
	je	.L20	;,
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %r15	; attr_92->var, <retval>
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	(%r15), %rbp	; _93->original_name, original_name
	jne	.L22	;,
	jmp	.L12	;
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[Warning] Unsupported type for size lookup: %s\n"
	.text
	.p2align 4
	.type	get_type_size, @function
get_type_size:
; src/tac.c:19:         result = 0;
	xorl	%eax, %eax	; <retval>
; src/tac.c:18:     if (type == NULL)
	testq	%rdi, %rdi	; type
	je	.L69	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_int(%rip)	; type, name_int
	je	.L70	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_float(%rip)	; type, name_float
	je	.L70	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_string(%rip)	; type, name_string
	je	.L70	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rdi, name_bool(%rip)	; type, name_bool
; src/tac.c:23:         result = 1;
	movl	$1, %eax	;, <retval>
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	je	.L69	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rdi, name_void(%rip)	; type, name_void
	je	.L69	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%rdi), %eax	; type_13(D)->kind,
	testl	%eax, %eax	;
	jne	.L63	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rdi), %rax	; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	; _7->size, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L69:
; src/tac.c:30: }
	ret	
	.p2align 4,,10
	.p2align 3
.L70:
; src/tac.c:21:         result = 8;
	movl	$8, %eax	;, <retval>
	ret	
	.p2align 4,,10
	.p2align 3
.L63:
; src/tac.c:15: static size_t get_type_size(Symbol* type) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdx	;, tmp96
	movq	8(%rdi), %rcx	; type_13(D)->name, type_13(D)->name
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:21:         result = 8;
	movl	$8, %eax	;, <retval>
; src/tac.c:30: }
	addq	$8, %rsp	;,
	ret	
	.size	get_type_size, .-get_type_size
	.p2align 4
	.type	load_rvalue.part.0, @function
load_rvalue.part.0:
	pushq	%r13	;
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$116, %edx	;,
; src/tac.c:269: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	movq	%rdi, %r13	; tmp100, arg
	pushq	%r12	;
	movq	%rsi, %r12	; tmp101, status
	pushq	%rbp	;
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%r12, %rcx	; status,
; src/tac.c:269: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_1(D)->type, arg_1(D)->type
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp102, _4
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _4, tmp95
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _4->type, tmp95
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp103, <retval>
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_19->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp95, MEM <vector(2) long unsigned int> [(void *)arg_19]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_19->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_6->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp104, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_6->arg1
; src/tac.c:215:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_6->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_6->arg3
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%r12), %rax	; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rdi	; _7->instructions, _7->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:283: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	load_rvalue.part.0, .-load_rvalue.part.0
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC5:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC6:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC7:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC8:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC9:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
	.section	.rodata.str1.1
.LC10:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC12:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC13:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC14:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp367, variable_access
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp368, status
	subq	$24, %rsp	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rdi), %ecx	; variable_access_128(D)->type,
	testl	%ecx, %ecx	;
	jne	.L75	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %rdi	; variable_access_128(D)->content.name, _2
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rdi, %rdi	; _2
	je	.L75	;,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rdi), %eax	; _2->kind, _3
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	;, tmp256
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	;, tmp256
	jbe	.L127	;,
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _3
	je	.L128	;,
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _2->type, _2->type
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
.L126:
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rbx	; tmp373, _10
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; _10, tmp263
	movhps	16(%rbx), %xmm0	;, tmp263
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp374, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp263,* <retval>
; src/tac.c:757:             return result;
	jmp	.L74	;
	.p2align 4,,10
	.p2align 3
.L75:
; src/tac.c:760:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rdi	; variable_access_128(D)->base, _11
; src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _11
	je	.L129	;,
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_variable_access	;
	movq	%rax, %r13	; tmp375, base
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; base
	je	.L83	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _13->is_get
	jne	.L130	;,
.L82:
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %ecx	; variable_access_128(D)->type, _15
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _15
	je	.L131	;,
; src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _15
	je	.L132	;,
; src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _15
	jne	.L96	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%r13), %ecx	; _138->kind, _65
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	; _65
	je	.L133	;,
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rcx), %eax	;, tmp334
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	;, tmp334
	jbe	.L99	;,
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r13), %rax	; _138->type, _66
.L98:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; prephitmp_117->name,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC13(%rip), %rdx	;, tmp337
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L80:
; src/tac.c:763:         return NULL;
	xorl	%r12d, %r12d	; <retval>
	jmp	.L74	;
	.p2align 4,,10
	.p2align 3
.L131:
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r13), %rax	; _138->type, _16
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _16->kind, _17
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp269
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp269
	jbe	.L134	;,
; src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _16->ast_node.scope, scope
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _17
	jne	.L86	;,
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_193].class_scope, scope
.L86:
; src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	; variable_access_128(D)->content.attr_name, variable_access_128(D)->content.attr_name
	movq	8(%rax), %rsi	; _21->name, _21->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp377, attr
; src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	; attr
	je	.L135	;,
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	; attr_196->kind, _28
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	;, _28
	je	.L136	;,
; src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _28
	je	.L137	;,
; src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _28
	jne	.L138	;,
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%r12), %rsi	; attr_196->type, attr_196->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %r14	; tmp382, _44
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _44, tmp300
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _44->type, tmp300
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_325->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp383, <retval>
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp300, MEM <vector(2) long unsigned int> [(void *)arg_325]
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %rdi	; variable_access_128(D)->content.attr_name, _45
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_325->kind
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rdi), %rsi	; _45->type, _45->type
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r14	; tmp384, _47
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _47, tmp303
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _47->type, tmp303
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_313->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp385, arg
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_313->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp303, MEM <vector(2) long unsigned int> [(void *)arg_313]
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$15, 24(%rax)	;, inst_210->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp386, inst
.L124:
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rsi)	; <retval>,* inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rsi)	; base,
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rsi)	; _59,
; src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_129(D)->current_block, status_129(D)->current_block
	movq	8(%rax), %rdi	;, _63->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L74:
; src/tac.c:862: }
	addq	$24, %rsp	;,
	movq	%r12, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L128:
; src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rsi, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rdi, %rsi	; _2,
	jmp	.L126	;
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; base,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp376, base
; src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	; base
	jne	.L82	;,
	.p2align 4,,10
	.p2align 3
.L83:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp268
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:769:         return NULL;
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L133:
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%r13), %rax	; _138->type, _66
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %edx	; _66->kind,
	testl	%edx, %edx	;
	jne	.L98	;,
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _66->name, _66->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp393, _70
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r13), %rax	; _138->type, _138->type
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _71->ast_node.class, _71->ast_node.class
	movq	16(%rax), %rdi	; _72->class_scope, _72->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	(%rax), %rsi	; attr_144->type, attr_144->type
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rdi	; tmp394, attr
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %r12	; tmp395, _75
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%r12, %xmm0	; _75, tmp332
	movhps	16(%r12), %xmm0	; _75->type, tmp332
; src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	;, arg_352->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp396, base
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_352->is_get
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp332, MEM <vector(2) long unsigned int> [(void *)arg_352]
.L99:
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%r13)	;, base_418->kind
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	movq	%rax, (%rsp)	; tmp397, %sfp
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	je	.L100	;,
.L102:
; src/tac.c:834:         long long arg_count = 0;
	xorl	%r14d, %r14d	; arg_count
.L101:
; src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rdi	; variable_access_128(D)->content.args, variable_access_128(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp407, %sfp
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L105	;
	.p2align 4,,10
	.p2align 3
.L107:
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rbp), %rdi	; _393->type, _393->type
; src/tac.c:848:             arg_count++;
	addq	$1, %r14	;, arg_count
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	call	get_type_size	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, %r12	; tmp410, _104
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_379->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp411, arg
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	; _104, arg_379->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r15)	;, arg_379->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r15)	; name_int, arg_379->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	(%rsp), %rdi	; %sfp,
; src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_213->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp412, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; arg, inst_213->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; _102, inst_213->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_213->arg3
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L105:
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp413, arg_expr
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L109	;,
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp408, _102
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _102
	je	.L106	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _102->is_get
	je	.L107	;,
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _102,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp409, _102
	jmp	.L107	;
	.p2align 4,,10
	.p2align 3
.L132:
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%r13), %rax	; _138->type, _138->type
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC10(%rip), %rsi	;, tmp312
	movq	8(%rax), %rdi	; _51->name, _51->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp387
	jne	.L139	;,
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rdi	; variable_access_128(D)->content.index, variable_access_128(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp388, _59
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _59
	je	.L95	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _59->is_get
	jne	.L140	;,
.L94:
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	name_int(%rip), %rsi	; name_int,
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %r14	; tmp390, _62
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _62, tmp322
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _62->type, tmp322
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_340->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp391, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_340->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp322, MEM <vector(2) long unsigned int> [(void *)arg_340]
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$16, 24(%rax)	;, inst_211->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp392, inst
	jmp	.L124	;
	.p2align 4,,10
	.p2align 3
.L110:
; src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	; status_129(D)->current_block, status_129(D)->current_block
	movq	8(%rax), %rdi	; _109->instructions, _109->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L109:
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp414, arg
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	; arg
	jne	.L110	;,
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%r13), %rsi	; base_418->type, base_418->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp415, _112
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _112, tmp357
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _112->type, tmp357
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp416, <retval>
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_406->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp357, MEM <vector(2) long unsigned int> [(void *)arg_406]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_406->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r14, (%rax)	; arg_count, arg_394->value.int_value
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp417, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_394->kind
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_394->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbp)	; name_int, arg_394->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_214->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp418, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_214->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_214->arg3
; src/tac.c:215:     inst->type = type;
	movl	$22, 24(%rax)	;, inst_214->type
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	; status_129(D)->current_block, status_129(D)->current_block
	movq	8(%rax), %rdi	;, _114->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:856:         return temp;
	jmp	.L74	;
	.p2align 4,,10
	.p2align 3
.L138:
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _138->type, _138->type
	movq	8(%rbp), %rdx	; variable_access_128(D)->content.attr_name, variable_access_128(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _40->name, _40->name
	movq	8(%rax), %r8	; _38->name,
	leaq	.LC9(%rip), %rdx	;, tmp298
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:795:             return NULL;
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L129:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp266
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:763:         return NULL;
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L127:
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; _2->type, _2->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
.L125:
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	; tmp378, _35
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; _35, tmp288
	movhps	16(%rbx), %xmm0	;, tmp288
; src/tac.c:225:     arg->kind = kind;
	movl	$7, 16(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp379, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp288,* <retval>
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L74	;
	.p2align 4,,10
	.p2align 3
.L96:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC14(%rip), %rdx	;, tmp363
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:860:         return NULL;
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L139:
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	0(%r13), %rax	; _138->value.variable, _138->value.variable
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	.LC11(%rip), %rdx	;, tmp317
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	; _54->original_name, _54->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _55->name, _55->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:808:             return NULL;
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L136:
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _138->type, _138->type
	movq	8(%rbp), %rdx	; variable_access_128(D)->content.attr_name, variable_access_128(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _31->name, _31->name
	movq	8(%rax), %r8	; _29->name,
	leaq	.LC8(%rip), %rdx	;, tmp286
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rsi	; attr_196->type, attr_196->type
	movq	%rbx, %rcx	; status,
	movq	%r12, %rdi	; attr,
	movl	$102, %edx	;,
	jmp	.L125	;
	.p2align 4,,10
	.p2align 3
.L140:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _59,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp389, _59
; src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	; _59
	jne	.L94	;,
.L95:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp320
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:814:             return NULL;
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L137:
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rsi	; attr_196->type, attr_196->type
	movq	%rbx, %rcx	; status,
	movq	%r12, %rdi	; attr,
	movl	$102, %edx	;,
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	; tmp380, _37
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; _37, tmp291
	movhps	16(%rbx), %xmm0	;, tmp291
; src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	;, arg_301->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp381, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp291,* <retval>
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L74	;
	.p2align 4,,10
	.p2align 3
.L100:
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%r13), %rax	; base_418->type, base_418->type
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%rax), %rdi	; _83->name, _83->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp398, _85
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	0(%r13), %rax	; base_418->value.subroutine, base_418->value.subroutine
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	; _86->original_name, _86->original_name
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rdi	; _87->name, _87->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	; tmp399
	je	.L102	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	0(%rbp), %rax	; variable_access_128(D)->base, variable_access_128(D)->base
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$8, %edi	;,
	movq	(%rax), %r8	; _90->base,
	call	*create_primary@GOTPCREL(%rip)	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rdx	; tmp400, _92
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	*create_expression@GOTPCREL(%rip)	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rdi	; tmp401, _93
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	;
	movq	%rax, %r15	; tmp402, _94
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _94
	je	.L103	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _94->is_get
	jne	.L141	;,
.L104:
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%r15), %rdi	; _378->type, _378->type
	call	get_type_size	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 8(%rsp)	; _96, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	8(%rsp), %rdx	; %sfp, _96
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp405, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_364->kind
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	; _96, arg_364->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_364->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_364->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	(%rsp), %rdi	; %sfp,
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_212->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp406, inst
; src/tac.c:840:             arg_count++;
	movl	$1, %r14d	;, arg_count
; src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_212->type
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; _94, inst_212->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_212->arg3
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L134:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _16->name, _16->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC6(%rip), %rdx	;, tmp272
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:775:             return NULL;
	jmp	.L80	;
.L135:
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _138->type, _138->type
	movq	8(%rbp), %rdx	; variable_access_128(D)->content.attr_name, variable_access_128(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _25->name, _25->name
	movq	8(%rax), %r8	; _23->name,
	leaq	.LC7(%rip), %rdx	;, tmp280
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	jmp	.L80	;
.L141:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _94,
	call	load_rvalue.part.0	;
	movq	%rax, %r15	; tmp403, _94
	jmp	.L104	;
	.section	.text.unlikely
	.type	tac_variable_access.cold, @function
tac_variable_access.cold:
.L106:
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _366
	ud2	
.L103:
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _419
	ud2	
	.text
	.size	tac_variable_access, .-tac_variable_access
	.section	.text.unlikely
	.size	tac_variable_access.cold, .-tac_variable_access.cold
.LCOLDE15:
	.text
.LHOTE15:
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"[Warning] Unsupported type for negation: %s\n"
	.align 8
.LC18:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/tac.c:681:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L143	;,
	leaq	.L145(%rip), %rdx	;, tmp137
	movq	%rsi, %rbp	; tmp175, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
	jmp	*%rax	; tmp140
	.section	.rodata
	.align 4
	.align 4
.L145:
	.long	.L153-.L145
	.long	.L152-.L145
	.long	.L151-.L145
	.long	.L150-.L145
	.long	.L149-.L145
	.long	.L148-.L145
	.long	.L147-.L145
	.long	.L146-.L145
	.long	.L144-.L145
	.text
	.p2align 4,,10
	.p2align 3
.L146:
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
	movq	%rax, %r12	; tmp188, _15
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _15
	je	.L156	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _15->is_get
	jne	.L166	;,
.L157:
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; _191->type, _191->type
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp190, _17
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; _17, tmp159
	movhps	16(%r13), %xmm0	; _17->type, tmp159
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_177->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp191, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_177->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp159, MEM <vector(2) long unsigned int> [(void *)arg_177]
; src/tac.c:721:             if (operand->type == name_int)
	movq	8(%r12), %rax	; _191->type, _18
; src/tac.c:721:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L167	;,
; src/tac.c:723:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L168	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC17(%rip), %rdx	;, tmp166
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L170:
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L144:
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.var
; src/tac.c:742: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	;
	.p2align 4,,10
	.p2align 3
.L153:
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	xorl	%esi, %esi	;
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rbp	; tmp176, _3
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_102->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp177, <retval>
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; _3, arg_102->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int,
.L142:
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L152:
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	xorl	%esi, %esi	;
	call	*strtod@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; _5, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	8(%rsp), %xmm0	; %sfp, _5
; src/tac.c:225:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_114->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp179, <retval>
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _5, arg_114->value.float_value
; src/tac.c:238:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:238:             arg->type = name_float;
	movq	%rax, 8(%rbx)	; name_float,
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L151:
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %xmm0	; primary_36(D)->value.literal_value, _6
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%xmm0, 8(%rsp)	; _6, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:241:             arg->value.string_value = (string)value;
	movq	8(%rsp), %xmm0	; %sfp, _6
; src/tac.c:225:     arg->kind = kind;
	movl	$3, 16(%rax)	;, arg_126->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp180, <retval>
; src/tac.c:241:             arg->value.string_value = (string)value;
	movhps	name_string(%rip), %xmm0	; name_string, tmp146
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:241:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rax)	; tmp146, MEM <vector(2) long unsigned int> [(void *)arg_126]
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L150:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_138->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp181, <retval>
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	;, arg_138->value.bool_value
; src/tac.c:246:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:246:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L149:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_150->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp182, <retval>
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	;, arg_150->value.bool_value
; src/tac.c:246:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:246:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L148:
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
; src/tac.c:742: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	;
	.p2align 4,,10
	.p2align 3
.L147:
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
	movq	%rax, %r13	; tmp183, _9
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _9
	je	.L155	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L169	;,
.L155:
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	name_bool(%rip), %rsi	; name_bool,
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %r12	; tmp185, _11
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _11, tmp153
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _11->type, tmp153
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp186, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_162->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp153, MEM <vector(2) long unsigned int> [(void *)arg_162]
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_162->kind
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; _9, inst_82->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp187, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_82->arg1
; src/tac.c:215:     inst->type = type;
	movl	$13, 24(%rax)	;, inst_82->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_82->arg3
; src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L143:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp171
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L170	;
	.p2align 4,,10
	.p2align 3
.L168:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_204->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp194, arg
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	.LC16(%rip), %rax	;, tmp199
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	;, arg_204->is_get
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movq	%rax, 0(%r13)	; tmp199, arg_204->value.float_value
; src/tac.c:238:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%r13)	; name_float, arg_204->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$2, 24(%rax)	;, inst_84->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp195, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg,
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	; _15,
.L159:
; src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:732:             return temp;
	jmp	.L142	;
	.p2align 4,,10
	.p2align 3
.L166:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _15,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp189, _15
	jmp	.L157	;
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _9,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp184, _9
	jmp	.L155	;
	.p2align 4,,10
	.p2align 3
.L167:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_192->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp192, arg
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_192->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	;, arg_192->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r13)	; name_int, arg_192->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$1, 24(%rax)	;, inst_83->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg,
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	; _15,
	jmp	.L159	;
	.section	.text.unlikely
	.type	tac_primary.cold, @function
tac_primary.cold:
.L156:
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _292
	ud2	
	.text
	.size	tac_primary, .-tac_primary
	.section	.text.unlikely
	.size	tac_primary.cold, .-tac_primary.cold
.LCOLDE19:
	.text
.LHOTE19:
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp144, expression
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp145, status
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
	je	.L192	;,
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
	call	tac_expression	;
	movq	%rax, %rbx	; tmp146, <retval>
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L173	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _4->is_get
	jne	.L193	;,
.L173:
; src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	; expression_30(D)->operator,
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_30(D)->expr_left, pretmp_107
	cmpl	$18, %eax	;, _5
	ja	.L174	;,
	leaq	CSWTCH.47(%rip), %rdx	;, tmp125
	movq	%rbp, %rsi	; status,
	movl	(%rdx,%rax,4), %r13d	; CSWTCH.47[_5], _50
	call	tac_expression	;
	movq	%rax, %r14	; tmp148, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp127
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp127
	ja	.L175	;,
; src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	;, _50
	jne	.L181	;,
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_44->kind,
	testl	%eax, %eax	;
	jne	.L194	;,
.L178:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_53->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp153, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_53->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; <retval>, inst_53->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_53->arg3
; src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%r14)	;, left_44->is_get
	jne	.L195	;,
.L179:
; src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:678: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L174:
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	%rbp, %rsi	; status,
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	;, _50
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	;
	movq	%rax, %r14	; tmp159, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp142
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp142
	ja	.L175	;,
.L181:
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r14), %rsi	; left_121->type, left_121->type
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r15	; tmp149, _9
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _9, tmp130
	movhps	16(%r15), %xmm0	; _9->type, tmp130
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_83->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp150, arg
; src/tac.c:282:     return arg;
	movq	%r14, %r15	; left, _81
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_83->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp130, MEM <vector(2) long unsigned int> [(void *)arg_83]
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%r14)	;, left_121->is_get
	jne	.L196	;,
.L177:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; _81, inst_52->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp152, inst
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; <retval>, inst_52->arg3
; src/tac.c:663:             right = temp;
	movq	%r12, %rbx	; arg, <retval>
; src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	; _50, inst_52->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_52->arg1
; src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_44->kind,
	testl	%eax, %eax	;
	je	.L178	;,
.L194:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L178	;
	.p2align 4,,10
	.p2align 3
.L175:
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r14), %rsi	; left_123->type, left_123->type
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r15	; tmp155, _17
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _17, tmp137
	movhps	16(%r15), %xmm0	; _17->type, tmp137
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_98->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp156, arg
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_98->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp137, MEM <vector(2) long unsigned int> [(void *)arg_98]
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%r14)	;, left_123->is_get
	jne	.L197	;,
.L180:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; <retval>, inst_55->arg3
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp158, inst
; src/tac.c:673:         right = temp;
	movq	%r12, %rbx	; arg, <retval>
; src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	; _50, inst_55->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_55->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; left, inst_55->arg2
	jmp	.L179	;
	.p2align 4,,10
	.p2align 3
.L192:
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
; src/tac.c:678: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	;
	.p2align 4,,10
	.p2align 3
.L195:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$24, 24(%rax)	;, inst_54->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp154, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_54->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; <retval>, inst_54->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_54->arg3
	jmp	.L179	;
	.p2align 4,,10
	.p2align 3
.L193:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; <retval>,
	call	load_rvalue.part.0	;
	movq	%rax, %rbx	; tmp147, <retval>
	jmp	.L173	;
	.p2align 4,,10
	.p2align 3
.L197:
	movq	%r14, %rdi	; left,
	movq	%rbp, %rsi	; status,
	call	load_rvalue.part.0	;
	movq	%rax, %r14	; tmp157, left
	jmp	.L180	;
	.p2align 4,,10
	.p2align 3
.L196:
	movq	%rbp, %rsi	; status,
	movq	%r14, %rdi	; left,
	call	load_rvalue.part.0	;
	movq	%rax, %r15	; tmp151, _81
	jmp	.L177	;
	.size	tac_expression, .-tac_expression
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Error: create_attribute received NULL table\n"
	.align 8
.LC22:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.p2align 4
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp137, variable
	pushq	%rbx	;
; src/tac.c:400: void tac_variable(Variable* variable, TACStatus* status, bool is_attr) {
	movq	%rsi, %rbx	; tmp138, status
; src/tac.c:403:     if (is_attr) {
	testb	%dl, %dl	; tmp139
	je	.L199	;,
; src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_12(D)->tac, status_12(D)->tac
	movq	(%rax), %rdi	; _1->attribute_tables, _1->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp140, attr_table
; src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_12(D)->tac, status_12(D)->tac
	movq	%r12, %rsi	; attr_table,
	movq	(%rax), %rdi	; _3->attribute_tables, _3->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	0(%rbp), %r13	; variable_11(D)->type, _5
	movq	8(%rbp), %r14	; variable_11(D)->name, _6
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r13, %rsi	; _5,
	movq	%r14, %rdi	; _6,
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rbp	; tmp141, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r13, %xmm1	; _5, _5
; src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rbp)	;, attr_17->offset
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; tmp142, tmp124
	punpcklqdq	%xmm1, %xmm0	; _5, tmp124
	movups	%xmm0, 0(%rbp)	; tmp124, MEM <vector(2) long unsigned int> [(void *)attr_17]
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%r12, %r12	; attr_table
	jne	.L214	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
.L201:
; src/tac.c:421: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$63, %edx	;,
; src/tac.c:421: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
; src/tac.c:421: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC22(%rip), %rdi	;, tmp129
; src/tac.c:421: }
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L214:
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r12), %rax	; attr_table_14->size, attr_table_14->size
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _5,
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; attr_table_14->size, attr_17->offset
; src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	;
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%r12), %rdi	; attr_table_14->attributes, _27
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%r12)	; tmp143, attr_table_14->size
; src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _27
	je	.L201	;,
; src/tac.c:421: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L199:
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	(%rdi), %rsi	; variable_11(D)->type, variable_11(D)->type
	movq	8(%rdi), %rdi	; variable_11(D)->name, variable_11(D)->name
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	call	create_var	;
; src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rbp), %rdi	; variable_11(D)->value, _32
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	%rax, %r12	; tmp144, var
; src/tac.c:414:         if (variable->value != NULL)
	testq	%rdi, %rdi	; _32
	je	.L203	;,
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp145, arg
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; arg
	je	.L204	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _33->is_get
	jne	.L215	;,
.L204:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; var, tmp133
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; var_31->type, tmp133
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp148, arg
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_56->is_get
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_56->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp133, MEM <vector(2) long unsigned int> [(void *)arg_56]
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg, inst_37->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp149, inst
; src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_37->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_37->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_37->arg3
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
; src/tac.c:421: }
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	8(%rax), %rdi	; _39->instructions, _39->instructions
; src/tac.c:421: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L203:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_44->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp147, arg
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_44->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_44->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbp)	; name_int, arg_44->type
	jmp	.L204	;
	.p2align 4,,10
	.p2align 3
.L215:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; arg,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp146, arg
	jmp	.L204	;
	.size	tac_variable, .-tac_variable
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	movq	%rdi, %r15	; tmp188, if_
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movl	$98, %edx	;,
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	;
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp189, status
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	subq	$56, %rsp	;,
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp190, then_label
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r15), %rdi	; if__63(D)->else_if, if__63(D)->else_if
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp191, else_label
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp192
	je	.L219	;,
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp194
	jne	.L248	;,
.L219:
; src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, 40(%rsp)	; tmp193, %sfp
.L218:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_192->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp195, arg
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_192->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	40(%rsp), %rax	; %sfp, end_label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_192->is_get
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r15), %rdi	; if__63(D)->condition, if__63(D)->condition
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, (%r14)	; end_label, arg_192->value.label
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	;
	movq	%rax, %rcx	; tmp196, _6
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _6
	je	.L220	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _6->is_get
	jne	.L249	;,
.L220:
	movq	%rcx, 16(%rsp)	; _6, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp198, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_177->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_177->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_177->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_177->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; then_label, arg_165->value.label
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_165->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_165->type
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_165->is_get
	movq	%rax, 8(%rsp)	; arg, %sfp
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	16(%rsp), %rcx	; %sfp, _6
; src/tac.c:217:     inst->arg2 = arg2;
	movq	8(%rsp), %rdx	; %sfp, arg
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp200, inst
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; arg, inst_133->arg3
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_133->arg2
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; _6, inst_133->arg1
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_133->type
; src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp201, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; then_label, block_163->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp202, block_163->instructions
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:483:     status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_58(D)->current_block
; src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r15), %rdi	; if__63(D)->body, if__63(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp203, then_statements
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L221	;
	.p2align 4,,10
	.p2align 3
.L222:
; src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L221:
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp204, statement
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L222	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_134->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp205, inst
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_134->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_134->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_134->arg3
; src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r15), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp206
	je	.L250	;,
.L223:
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r15), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp225
	je	.L251	;,
.L231:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp231, block
; src/tac.c:100:     block->label = label;
	movq	40(%rsp), %rax	; %sfp, end_label
	movq	%rax, 0(%rbp)	; end_label, block_237->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp232, block_237->instructions
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _42->blocks, _42->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:543:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_58(D)->current_block
; src/tac.c:545: }
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
.L248:
; src/tac.c:472:         end_label = else_label;
	movq	%rbp, 40(%rsp)	; else_label, %sfp
	jmp	.L218	;
	.p2align 4,,10
	.p2align 3
.L251:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp226, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_235->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp227, block_235->instructions
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _37->blocks, _37->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:530:         status->current_block = else_block;
	movq	%r12, 16(%rbx)	; block, status_58(D)->current_block
; src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp228, else_statements
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L232	;
	.p2align 4,,10
	.p2align 3
.L233:
; src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L232:
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp229, else_statement
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L233	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_137->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp230, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_137->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_137->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_137->arg3
; src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _40->instructions, _40->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L231	;
	.p2align 4,,10
	.p2align 3
.L250:
; src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp207, %sfp
	.p2align 4,,10
	.p2align 3
.L224:
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp224, elif
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L223	;,
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp208, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_207->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp209, block_207->instructions
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _19->blocks, _19->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:501:             status->current_block = else_if_block;
	movq	%r12, 16(%rbx)	; block, status_58(D)->current_block
; src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	xorl	%esi, %esi	;
	movl	$98, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 8(%rsp)	; tmp210, %sfp
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	0(%r13), %rdi	; elif_90->condition, elif_90->condition
	movq	%rbx, %rsi	; status,
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp211, else_label
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	tac_expression	;
	movq	%rax, %r12	; tmp212, _22
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _22
	je	.L225	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _22->is_get
	jne	.L252	;,
.L225:
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp214
	jne	.L253	;,
.L227:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_223->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_223->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_223->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_223->is_get
	movq	%rax, 32(%rsp)	; arg, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	; tmp217, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_211->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_211->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	8(%rsp), %rax	; %sfp, then_label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rcx)	;, arg_211->is_get
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, (%rcx)	; then_label, arg_211->value.label
; src/tac.c:265:     arg->is_get = false;
	movq	%rcx, 24(%rsp)	; arg, %sfp
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	24(%rsp), %rcx	; %sfp, arg
; src/tac.c:218:     inst->arg3 = arg3;
	movq	32(%rsp), %rdx	; %sfp, arg
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp218, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; _22, inst_135->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_135->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rdx, 16(%rax)	; arg, inst_135->arg3
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_135->type
; src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _28->instructions, _28->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp219, block
; src/tac.c:100:     block->label = label;
	movq	8(%rsp), %rax	; %sfp, then_label
	movq	%rax, (%r12)	; then_label, block_209->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp220, block_209->instructions
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _30->blocks, _30->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:514:             status->current_block = then_block;
	movq	%r12, 16(%rbx)	; block, status_58(D)->current_block
; src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r13), %rdi	; elif_90->body, elif_90->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp221, elif_statements
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L228	;
	.p2align 4,,10
	.p2align 3
.L229:
; src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L228:
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp222, elif_statement
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L229	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_136->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp223, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_136->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_136->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_136->arg3
; src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L224	;
	.p2align 4,,10
	.p2align 3
.L253:
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	; tmp215
	cmovne	40(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L227	;
	.p2align 4,,10
	.p2align 3
.L252:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _22,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp213, _22
	jmp	.L225	;
.L249:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _6,
	call	load_rvalue.part.0	;
	movq	%rax, %rcx	; tmp197, _6
	jmp	.L220	;
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC23:
	.string	"[Warning] 'break' statement used outside of loop\n"
	.align 8
.LC24:
	.string	"[Warning] 'continue' statement used outside of loop\n"
	.align 8
.LC25:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.p2align 4
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
; src/tac.c:424:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_31(D)->type,
; src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L255	;,
	leaq	.L257(%rip), %rdx	;, tmp119
; src/tac.c:422: void tac_statement(Statement* statement, TACStatus* status) {
	pushq	%r12	;
; src/tac.c:424:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp121
; src/tac.c:422: void tac_statement(Statement* statement, TACStatus* status) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp149, status
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp148, statement
; src/tac.c:424:     switch (statement->type) {
	addq	%rdx, %rax	; tmp119, tmp122
	jmp	*%rax	; tmp122
	.section	.rodata
	.align 4
	.align 4
.L257:
	.long	.L264-.L257
	.long	.L263-.L257
	.long	.L262-.L257
	.long	.L261-.L257
	.long	.L260-.L257
	.long	.L259-.L257
	.long	.L258-.L257
	.long	.L256-.L257
	.text
	.p2align 4,,10
	.p2align 3
.L258:
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_32(D)->end_labels, status_32(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp155
	jne	.L267	;,
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbp), %rax	; status_32(D)->end_labels, status_32(D)->end_labels
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _14->tail, _14->tail
	movq	8(%rax), %rbx	; _15->content, label
; src/tac.c:440:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	je	.L267	;,
.L288:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp156, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; label,* inst
	jmp	.L287	;
	.p2align 4,,10
	.p2align 3
.L256:
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_32(D)->start_labels, status_32(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp157
	jne	.L268	;,
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbp), %rax	; status_32(D)->start_labels, status_32(D)->start_labels
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _21->tail, _21->tail
	movq	8(%rax), %rbx	; _22->content, label
; src/tac.c:451:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	jne	.L288	;,
.L268:
; src/tac.c:464: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$52, %edx	;,
; src/tac.c:464: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC24(%rip), %rdi	;, tmp145
; src/tac.c:464: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L262:
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_31(D)->stmt.if_stmt, statement_31(D)->stmt.if_stmt
; src/tac.c:464: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	;
	.p2align 4,,10
	.p2align 3
.L264:
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rdi), %rdi	; statement_31(D)->stmt.expr, statement_31(D)->stmt.expr
	call	tac_expression	;
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _3
	je	.L254	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _3->is_get
	jne	.L289	;,
.L254:
; src/tac.c:464: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L263:
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	(%rdi), %rdi	; statement_31(D)->stmt.var, statement_31(D)->stmt.var
; src/tac.c:464: }
	popq	%rbx	;
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	xorl	%edx, %edx	;
; src/tac.c:464: }
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	tac_variable	;
	.p2align 4,,10
	.p2align 3
.L260:
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_31(D)->stmt.for_stmt, statement_31(D)->stmt.for_stmt
; src/tac.c:464: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	;
	.p2align 4,,10
	.p2align 3
.L259:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp151, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$5, 16(%rax)	;, arg_75->kind
; src/tac.c:249:             arg->value.string_value = NULL;
	movq	$0, (%rax)	;, arg_75->value.string_value
; src/tac.c:250:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_75->is_get
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rbx), %rdi	; statement_31(D)->stmt.return_expr, _8
; src/tac.c:250:             arg->type = name_void;
	movq	%rax, 8(%r12)	; name_void, arg_75->type
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _8
	je	.L266	;,
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp152, arg
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; arg
	je	.L266	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L290	;,
.L266:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$21, 24(%rax)	;, inst_51->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp154, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_51->arg1
.L287:
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_32(D)->current_block, status_32(D)->current_block
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;,
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;,
; src/tac.c:464: }
	popq	%rbx	;
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rdi	;, _16->instructions
; src/tac.c:464: }
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L261:
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_31(D)->stmt.while_stmt, statement_31(D)->stmt.while_stmt
; src/tac.c:464: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	;
	.p2align 4,,10
	.p2align 3
.L267:
; src/tac.c:464: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$49, %edx	;,
; src/tac.c:464: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC23(%rip), %rdi	;, tmp138
; src/tac.c:464: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L255:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC25(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L290:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; arg,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp153, arg
	jmp	.L266	;
	.p2align 4,,10
	.p2align 3
.L289:
; src/tac.c:464: }
	popq	%rbx	;
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _3,
	popq	%rbp	;
	popq	%r12	;
	jmp	load_rvalue.part.0	;
	.size	tac_statement, .-tac_statement
	.p2align 4
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp178, for_
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp179, status
	subq	$24, %rsp	;,
; src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rdi), %rdi	; for__55(D)->initializer, _1
; src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L292	;,
; src/tac.c:550:         tac_variable(for_->initializer, status, false);
	xorl	%edx, %edx	;
	call	tac_variable	;
.L292:
; src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	; tmp180, condition_label
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r15	; tmp181, body_label
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__55(D)->condition
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp182, end_label
; src/tac.c:555:     if (for_->condition != NULL) {
	je	.L293	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp183, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_179->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_179->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp184, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_115->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_115->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_115->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_115->arg3
; src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp185, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; condition_label, block_177->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp186, block_177->instructions
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:561:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%r12), %rdi	; for__55(D)->condition, for__55(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rcx	; tmp187, _9
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _9
	je	.L294	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L315	;,
.L294:
	movq	%rcx, 8(%rsp)	; _9, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %rbp	; tmp189, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_162->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_162->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; end_label, arg_162->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_162->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_150->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_150->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_150->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_150->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, _9
; src/tac.c:217:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_114->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp191, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_114->arg2
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; _9, inst_114->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_114->arg3
; src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	;, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L295:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp194, block
; src/tac.c:100:     block->label = label;
	movq	%r15, (%rax)	; body_label, block_203->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp195, block_203->instructions
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _17->blocks, _17->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:574:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__55(D)->increment
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, (%rsp)	; increment_label, %sfp
	movq	%rax, %rbp	; tmp196, increment_label
; src/tac.c:577:     if (for_->increment != NULL)
	je	.L296	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp197, arg
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_205->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_205->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; increment_label, arg_205->value.label
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	*list_append@GOTPCREL(%rip)	;
.L297:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_241->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp200, arg
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_56(D)->end_labels, status_56(D)->end_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_241->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_241->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; end_label, arg_241->value.label
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__55(D)->body, for__55(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp201, body_statements
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L299	;
	.p2align 4,,10
	.p2align 3
.L300:
; src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L299:
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp202, statement
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L300	;,
; src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_56(D)->end_labels, status_56(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__55(D)->increment
	je	.L302	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp203, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_258->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_258->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	(%rsp), %rax	; %sfp, increment_label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_258->is_get
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, 0(%rbp)	; increment_label, arg_258->value.label
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp204, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_117->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_117->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_117->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_117->arg3
; src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _34->instructions, _34->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp205, block
; src/tac.c:100:     block->label = label;
	movq	(%rsp), %rax	; %sfp, increment_label
	movq	%rax, 0(%rbp)	; increment_label, block_256->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp206, block_256->instructions
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _36->blocks, _36->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:596:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%r12), %rdi	; for__55(D)->increment, for__55(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _39
	je	.L302	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _39->is_get
	jne	.L316	;,
.L302:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp208, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_270->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_270->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_270->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_270->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__55(D)->condition
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_118->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp209, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_118->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_118->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_118->arg3
; src/tac.c:601:     if (for_->condition == NULL)
	je	.L317	;,
.L304:
; src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp212, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; end_label, block_294->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp213, block_294->instructions
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _45->blocks, _45->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:607:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:609: }
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
.L296:
; src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__55(D)->condition
	je	.L298	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp198, arg
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_217->value.label
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L297	;
	.p2align 4,,10
	.p2align 3
.L293:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp192, arg
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_191->value.label
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_191->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_116->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_116->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_116->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_116->arg3
; src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	;, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L295	;
	.p2align 4,,10
	.p2align 3
.L316:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _39,
	call	load_rvalue.part.0	;
	jmp	.L302	;
	.p2align 4,,10
	.p2align 3
.L317:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp210, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_282->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_282->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_282->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_282->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_119->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp211, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_119->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_119->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_119->arg3
	jmp	.L304	;
	.p2align 4,,10
	.p2align 3
.L298:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp199, arg
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_229->value.label
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L297	;
	.p2align 4,,10
	.p2align 3
.L315:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _9,
	call	load_rvalue.part.0	;
	movq	%rax, %rcx	; tmp188, _9
	jmp	.L294	;
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15	;
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp142, while_
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp143, status
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	subq	$24, %rsp	;,
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp144, condition_label
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp145, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_142->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_142->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_142->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_142->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp146, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_70->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_70->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_70->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_70->arg3
; src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp147, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; condition_label, block_140->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp148, block_140->instructions
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:618:     status->current_block = condition_block;
	movq	%r13, 16(%rbx)	; block, status_28(D)->current_block
; src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	xorl	%esi, %esi	;
	movl	$98, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp149, body_label
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	0(%rbp), %rdi	; while__41(D)->condition, while__41(D)->condition
	movq	%rbx, %rsi	; status,
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	; tmp150, end_label
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	tac_expression	;
	movq	%rax, %rcx	; tmp151, _7
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _7
	je	.L319	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _7->is_get
	jne	.L326	;,
.L319:
	movq	%rcx, 8(%rsp)	; _7, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp153, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_125->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_125->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; end_label, arg_125->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_125->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_113->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_113->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; body_label, arg_113->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_113->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, _7
; src/tac.c:217:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp155, inst
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	; arg, inst_69->arg3
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_69->arg2
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; _7, inst_69->arg1
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_69->type
; src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _10->instructions, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp156, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; body_label, block_111->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r15, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r15)	; tmp157, block_111->instructions
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rdi	; _12->blocks, _12->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:628:     status->current_block = body_block;
	movq	%r15, 16(%rbx)	; block, status_28(D)->current_block
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_99->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp158, arg
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_99->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_99->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_99->value.label
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_87->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp159, arg
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_87->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_87->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; end_label, arg_87->value.label
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rdi	; while__41(D)->body, while__41(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp160, body_statements
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L320	;
	.p2align 4,,10
	.p2align 3
.L321:
; src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L320:
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp161, statement
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L321	;,
; src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp162, arg
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_156->value.label
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_156->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_156->type
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_156->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp163, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_71->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_71->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_71->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_71->arg3
; src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _22->instructions, _22->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp164, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; end_label, block_154->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp165, block_154->instructions
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rdi	; _24->blocks, _24->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:644:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_28(D)->current_block
; src/tac.c:646: }
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
.L326:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _7,
	call	load_rvalue.part.0	;
	movq	%rax, %rcx	; tmp152, _7
	jmp	.L319	;
	.size	tac_while, .-tac_while
	.p2align 4
	.globl	tac_function
	.type	tac_function, @function
tac_function:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp114, function
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp115, status
	subq	$16, %rsp	;,
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movaps	%xmm0, (%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:89:     subroutine->name = name;
	movdqa	(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp116, subroutine
; src/tac.c:89:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_39]
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp117, subroutine_39->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp118, subroutine_39->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp119, subroutine_39->blocks
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
; src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r13), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp120, parameters
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L328	;
	.p2align 4,,10
	.p2align 3
.L329:
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_39->parameters, subroutine_39->parameters
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp121, _8
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
.L328:
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L329	;,
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	; tmp123, _10
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _10, block_43->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_39->blocks, subroutine_39->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp125, block_43->instructions
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:332:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r13), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp126, statements
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L330	;
	.p2align 4,,10
	.p2align 3
.L331:
; src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L330:
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp127, statement
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L331	;,
; src/tac.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; src/tac.c:341: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_function, .-tac_function
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.p2align 4
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp164, method
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp165, status
	subq	$24, %rsp	;,
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movaps	%xmm0, (%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)], %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:89:     subroutine->name = name;
	movdqa	(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp166, subroutine
; src/tac.c:89:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_42(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_81]
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp167, subroutine_81->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp168, subroutine_81->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp169, subroutine_81->blocks
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_45(D)->tac, status_45(D)->tac
; src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_45(D)->current_subroutine
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r13), %rdi	; method_42(D)->parameters, method_42(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp170, parameters
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L334	;
	.p2align 4,,10
	.p2align 3
.L335:
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_51->type, parameter_51->type
	movq	8(%rax), %rdi	; parameter_51->name, parameter_51->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_81->parameters, subroutine_81->parameters
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp171, _8
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
.L334:
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L335	;,
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	; tmp173, _10
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp174, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _10, block_85->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_81->blocks, subroutine_81->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp175, block_85->instructions
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r13), %rdi	; method_42(D)->body, method_42(D)->body
; src/tac.c:356:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_45(D)->current_block
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	%rax, %rbp	; tmp176, statements
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_45(D)->current_class, status_45(D)->current_class
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _14->name, _14->name
	movq	8(%rax), %rdi	; _15->name, _15->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp177, _17
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%r13), %rax	; method_42(D)->name, method_42(D)->name
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _18->name, _18->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp178
	jne	.L339	;,
	jmp	.L342	;
	.p2align 4,,10
	.p2align 3
.L340:
; src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L339:
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp184, statement
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L340	;,
; src/tac.c:373:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_45(D)->current_subroutine
; src/tac.c:375: }
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
.L342:
; src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	8(%rax), %ecx	; stmt_61->type,
	testl	%ecx, %ecx	;
	jne	.L337	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; stmt_61->stmt.expr, _22
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	;, _22->operator
	jne	.L337	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	; _22->prim_left, _24
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	;, _24->type
	jne	.L337	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; _24->value.var, _26
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	16(%rax), %edx	; _26->type,
	testl	%edx, %edx	;
	je	.L338	;,
.L337:
; src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	0(%r13), %rax	; method_42(D)->name, method_42(D)->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	.LC26(%rip), %rdx	;, tmp158
	movq	8(%rax), %rcx	; _28->name, _28->name
; src/tac.c:375: }
	addq	$24, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
; src/tac.c:375: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L338:
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r15	; status_45(D)->current_class, _31
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r14	; _26->content.name, self
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp180, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_99->kind
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	24(%r15), %rax	; MEM[(long long int *)_31 + 24B], _101
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%r14, %rdi	; self,
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r13)	;, arg_99->is_get
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r14), %rsi	; self_62->type, self_62->type
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rax, 0(%r13)	; _101, arg_99->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
	movq	%rax, 8(%r13)	; name_int, arg_99->type
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_var	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %r15	; tmp181, _35
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _35, tmp161
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r15), %xmm0	; _35->type, tmp161
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp182, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_87->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp161, MEM <vector(2) long unsigned int> [(void *)arg_87]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_87->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r12), %rdi	; block_85->instructions, block_85->instructions
; src/tac.c:215:     inst->type = type;
	movl	$18, 24(%rax)	;, inst_74->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp183, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_74->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_74->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_74->arg3
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L339	;
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp108, class
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp109, status
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:378:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_12(D)->current_class
; src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_13(D)->members, class_13(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%r12), %r13	; class_13(D)->name, _2
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rbx	; tmp110, members
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp111, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%r13, %xmm1	; _2, _2
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%r12, %rsi	; table,
; src/tac.c:11:     table->size = 0;
	movq	$0, 16(%r12)	;, table_26->size
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp112, tmp100
	punpcklqdq	%xmm1, %xmm0	; _2, tmp100
	movups	%xmm0, (%r12)	; tmp100, MEM <vector(2) long unsigned int> [(void *)table_26]
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_12(D)->tac, status_12(D)->tac
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC27(%rip), %r12	;, tmp107
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rdi	; _3->attribute_tables, _3->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L344:
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L352	;,
.L349:
; src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ecx	; member_21->type, _5
; src/tac.c:385:         switch (member->type) {
	testl	%ecx, %ecx	; _5
	je	.L345	;,
	cmpl	$1, %ecx	;, _5
	je	.L346	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	movq	%r12, %rdx	; tmp107,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	jne	.L349	;,
.L352:
; src/tac.c:397:     status->current_class = NULL;
	movq	$0, 24(%rbp)	;, status_12(D)->current_class
; src/tac.c:399: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L346:
; src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rdi	; member_21->content.variable, member_21->content.variable
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; status,
	call	tac_variable	;
; src/tac.c:391:                 break;
	jmp	.L344	;
	.p2align 4,,10
	.p2align 3
.L345:
; src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_21->content.method, member_21->content.method
	movq	%rbp, %rsi	; status,
	call	tac_method	;
; src/tac.c:388:                 break;
	jmp	.L344	;
	.size	tac_class, .-tac_class
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%rbx	;
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rdi	; import_14(D)->name, _1
; src/tac.c:305: void tac_import(Import* import, TAC* tac, TACStatus* status) {
	movq	%rsi, %rbx	; tmp105, tac
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rdi), %ecx	; _1->kind, _2
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L359	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp98
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp98
	jbe	.L360	;,
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L356	;,
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rdi), %rdi	; _1->ast_node.class, _1->ast_node.class
	movq	%rdx, %rsi	; status,
; src/tac.c:317: }
	popq	%rbx	;
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	jmp	tac_class	;
	.p2align 4,,10
	.p2align 3
.L356:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:317: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %rdx	;, tmp103
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L360:
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
.L358:
	call	create_var	;
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbx), %rdi	; tac_18(D)->global_vars, tac_18(D)->global_vars
; src/tac.c:317: }
	popq	%rbx	;
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp108, _8
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L359:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rdx, %rcx	; status,
	movq	(%rdi), %rsi	; _1->type, _1->type
	movl	$118, %edx	;,
	jmp	.L358	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC29:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC29(%rip), %r14	;, tmp115
; src/tac.c:285: TAC* tac_code(Code* code) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:285: TAC* tac_code(Code* code) {
	movq	%rdi, %rbx	; tmp116, code
; src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp117, <retval>
; src/tac.c:62:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:63:     tac->entry_point = NULL;
	movq	$0, 8(%r13)	;, tac_29->entry_point
; src/tac.c:62:     tac->attribute_tables = create_list();
	movq	%rax, 0(%r13)	; tmp118, tac_29->attribute_tables
; src/tac.c:64:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:64:     tac->global_vars = create_list();
	movq	%rax, 16(%r13)	; tmp119, tac_29->global_vars
; src/tac.c:65:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %edi	;,
; src/tac.c:65:     tac->subroutines = create_list();
	movq	%rax, 24(%r13)	; tmp120, tac_29->subroutines
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp121, status
; src/tac.c:72:     status->tac = tac;
	movq	%r13, (%rax)	; <retval>, status_26->tac
; src/tac.c:73:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	;, status_26->current_subroutine
; src/tac.c:74:     status->current_block = NULL;
	movq	$0, 16(%rax)	;, status_26->current_block
; src/tac.c:75:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:75:     status->end_labels = create_list();
	movq	%rax, 32(%rbp)	; tmp122, status_26->end_labels
; src/tac.c:76:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:77:     status->attr_count = 0;
	pxor	%xmm0, %xmm0	; tmp101
; src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rdi	; code_17(D)->members, code_17(D)->members
; src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rbp)	; tmp123, status_26->start_labels
; src/tac.c:77:     status->attr_count = 0;
	movups	%xmm0, 48(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 48B]
	movups	%xmm0, 64(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 64B]
	movups	%xmm0, 80(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 80B]
; src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, members
	.p2align 4,,10
	.p2align 3
.L362:
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, code_member
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L370	;,
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L371	;,
; src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L372	;,
; src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L362	;,
; src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L362	;
	.p2align 4,,10
	.p2align 3
.L371:
; src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rdi	; code_member_21->content.function, code_member_21->content.function
	movq	%rbp, %rsi	; status,
	call	tac_function	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	; code_member_21->content.function, code_member_21->content.function
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r14, %rsi	; tmp115,
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rbx	; _4->name, _5
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rdi	; _5->name, _5->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp125
	jne	.L362	;,
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L362	;
	.p2align 4,,10
	.p2align 3
.L372:
; src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	tac_class	;
	jmp	.L362	;
	.p2align 4,,10
	.p2align 3
.L370:
; src/tac.c:304: }
	popq	%rbx	;
	movq	%r13, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 32
	.type	CSWTCH.47, @object
	.size	CSWTCH.47, 76
CSWTCH.47:
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
.LC16:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
