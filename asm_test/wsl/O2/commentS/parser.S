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
	.string	"[warning] Unsupported type for size lookup: %s\n"
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
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp102, arg
	subq	$8, %rsp	;,
; src/tac.c:269:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L73	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_4(D)->is_get
	jne	.L78	;,
.L73:
; src/tac.c:281: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L78:
	movq	%rsi, %rbp	; tmp103, status
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_4(D)->type, arg_4(D)->type
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp104, _10
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; _10, tmp97
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	; _10->type, tmp97
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp105, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_16->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp97, MEM <vector(2) long unsigned int> [(void *)arg_16]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_16->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; arg, inst_12->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp106, inst
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%r12, %rbx	; arg, arg
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_12->arg1
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_12->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_12->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_7(D)->current_block, status_7(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:281: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp111, tac
	pushq	%rbx	;
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbx	; import_15(D)->name, _1
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbx), %ecx	; _1->kind, _2
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L85	;,
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp103
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp103
	jbe	.L86	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L82	;,
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp115, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%rbx, %xmm1	; _1, _1
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%r12, %rsi	; table,
; src/tac.c:11:     table->size = 0;
	movq	$0, 16(%r12)	;, table_25->size
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp116, tmp106
	punpcklqdq	%xmm1, %xmm0	; _1, tmp106
	movups	%xmm0, (%r12)	; tmp106, MEM <vector(2) long unsigned int> [(void *)table_25]
; src/tac.c:314: }
	popq	%rbx	;
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	0(%rbp), %rdi	; tac_17(D)->attribute_tables, tac_17(D)->attribute_tables
; src/tac.c:314: }
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L82:
; src/tac.c:314: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:314: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC4(%rip), %rdx	;, tmp109
; src/tac.c:314: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L86:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rbx), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
.L84:
	movq	%rbx, %rdi	; _1,
	call	create_var	;
; src/tac.c:314: }
	popq	%rbx	;
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbp), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp114, _8
; src/tac.c:314: }
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L85:
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rdx, %rcx	; status,
	movq	(%rbx), %rsi	; _1->type, _1->type
	movl	$118, %edx	;,
	jmp	.L84	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC6:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
	.p2align 4
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
; src/tac.c:395:     switch (type) {
	leal	-97(%rdx), %eax	;,
; src/tac.c:392: void tac_variable(Variable* variable, TACStatus* status, VarType type) {
	pushq	%r14	;
	movl	%edx, %ecx	; tmp141, type
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:395:     switch (type) {
	cmpl	$21, %eax	;, tmp114
	ja	.L88	;,
	leaq	.L90(%rip), %rdx	;, tmp116
	movq	%rdi, %rbp	; tmp139, variable
	movq	%rsi, %rbx	; tmp140, status
	movslq	(%rdx,%rax,4), %rax	;, tmp118
	addq	%rdx, %rax	; tmp116, tmp119
	jmp	*%rax	; tmp119
	.section	.rodata
	.align 4
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
	.p2align 4,,10
	.p2align 3
.L88:
; src/tac.c:418: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:418: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC6(%rip), %rdx	;, tmp138
; src/tac.c:418: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L87:
; src/tac.c:418: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L91:
; src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rsi	; variable_19(D)->type, variable_19(D)->type
	movq	8(%rdi), %rdi	; variable_19(D)->name, variable_19(D)->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp142, var
; src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	; status_20(D)->current_subroutine, status_20(D)->current_subroutine
.L96:
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rdi	;, _7->global_vars
.L97:
; src/tac.c:418: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L92:
; src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rsi	; variable_19(D)->type, variable_19(D)->type
	movq	8(%rdi), %rdi	; variable_19(D)->name, variable_19(D)->name
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp143, var
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	jmp	.L96	;
	.p2align 4,,10
	.p2align 3
.L93:
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rdi	; _9->attribute_tables, _9->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp144, attr_table
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	%r12, %rsi	; attr_table,
	movq	(%rax), %rdi	; _11->attribute_tables, _11->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	0(%rbp), %r13	; variable_19(D)->type, _13
	movq	8(%rbp), %r14	; variable_19(D)->name, _14
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r13, %rsi	; _13,
	movq	%r14, %rdi	; _14,
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %rbp	; tmp145, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r13, %xmm1	; _13, _13
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _13,
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; tmp146, tmp133
	punpcklqdq	%xmm1, %xmm0	; _13, tmp133
	movups	%xmm0, 0(%rbp)	; tmp133, MEM <vector(2) long unsigned int> [(void *)attr_32]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r12), %rax	; attr_table_28->size, attr_table_28->size
	movq	%rax, 16(%rbp)	; attr_table_28->size, attr_32->offset
; src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	;
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%r12), %rdi	; attr_table_28->attributes, _38
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%r12)	; tmp147, attr_table_28->size
; src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _38
	jne	.L97	;,
; src/tac.c:418: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$63, %edx	;,
; src/tac.c:418: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
; src/tac.c:418: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC5(%rip), %rdi	;, tmp136
; src/tac.c:418: }
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.size	tac_variable, .-tac_variable
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"[warning] Unsupported variable access with NULL base\n"
	.align 8
.LC8:
	.string	"[warning] Failed to generate variable access for base\n"
	.align 8
.LC9:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC10:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC11:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
	.align 8
.LC12:
	.string	"[warning] Attempting to index non-array type: %s\n"
	.section	.rodata.str1.1
.LC13:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"[warning] Failed to generate variable access for index\n"
	.align 8
.LC15:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC16:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.p2align 4
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp296, variable_access
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp297, status
	subq	$24, %rsp	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rdi), %ecx	; variable_access_99(D)->type,
	testl	%ecx, %ecx	;
	jne	.L99	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %rdi	; variable_access_99(D)->content.name, _2
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rdi, %rdi	; _2
	je	.L99	;,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rdi), %eax	; _2->kind, tmp333
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _2->type, pretmp_385
	movq	%rbx, %rcx	; status,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	subl	$1, %eax	;, tmp214
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	;, tmp214
	jbe	.L100	;,
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$118, %edx	;,
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rbx	; tmp298, _6
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; _6, tmp216
	movhps	16(%rbx), %xmm0	;, tmp216
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_191->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp299, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp216,* <retval>
.L98:
; src/tac.c:845: }
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
.L99:
; src/tac.c:753:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rdi	; variable_access_99(D)->base, _10
; src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _10
	je	.L130	;,
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_variable_access	;
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	; tmp302, _12
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	;
	movq	%rax, %r13	; tmp303, arg
; src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	; arg
	je	.L131	;,
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %ecx	; variable_access_99(D)->type, _14
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _14
	je	.L132	;,
; src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _14
	je	.L133	;,
; src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _14
	jne	.L115	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %ecx	; base_109->kind, _60
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	; _60
	je	.L134	;,
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %ecx	;, _60
	je	.L118	;,
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	; base_109->type, _61
.L117:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; prephitmp_94->name,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC15(%rip), %rdx	;, tmp281
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L103:
; src/tac.c:756:         return NULL;
	xorl	%r12d, %r12d	; <retval>
	jmp	.L98	;
	.p2align 4,,10
	.p2align 3
.L132:
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	; base_109->type, _15
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _15->kind, _16
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp224
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp224
	jbe	.L135	;,
; src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _15->ast_node.scope, scope
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _16
	jne	.L107	;,
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_143].class_scope, scope
.L107:
; src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	; variable_access_99(D)->content.attr_name, variable_access_99(D)->content.attr_name
	movq	8(%rax), %rsi	; _20->name, _20->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	; attr
	je	.L136	;,
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %edx	; attr_146->kind, _27
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rdx), %ecx	;, tmp236
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %ecx	;, tmp236
	jbe	.L137	;,
; src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %edx	;, _27
	jne	.L138	;,
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rax), %rsi	; attr_146->type, attr_146->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %r14	; tmp307, _37
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _37, tmp247
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _37->type, tmp247
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_239->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp308, <retval>
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp247, MEM <vector(2) long unsigned int> [(void *)arg_239]
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %rdi	; variable_access_99(D)->content.attr_name, _38
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_239->kind
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rdi), %rsi	; _38->type, _38->type
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %r14	; tmp309, _40
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _40, tmp250
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _40->type, tmp250
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp310, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_227->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp250, MEM <vector(2) long unsigned int> [(void *)arg_227]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_227->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_157->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp311, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_157->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_157->arg3
; src/tac.c:214:     inst->type = type;
	movl	$15, 24(%rax)	;, inst_157->type
; src/tac.c:788:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_100(D)->current_block, status_100(D)->current_block
	movq	8(%rax), %rdi	;, _42->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:791:         return temp;
	jmp	.L98	;
	.p2align 4,,10
	.p2align 3
.L134:
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	; base_109->type, _61
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %edx	; _61->kind,
	testl	%edx, %edx	;
	jne	.L117	;,
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _61->name, _61->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp318, _65
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r13), %rax	; base_109->type, base_109->type
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _66->ast_node.class, _66->ast_node.class
	movq	16(%rax), %rdi	; _67->class_scope, _67->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	(%rax), %rsi	; attr_112->type, attr_112->type
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rdi	; tmp319, attr
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %r12	; tmp320, _70
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%r12, %xmm0	; _70, tmp277
	movhps	16(%r12), %xmm0	; _70->type, tmp277
; src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	;, arg_263->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp321, arg
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_263->is_get
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp277, MEM <vector(2) long unsigned int> [(void *)arg_263]
.L118:
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rdi	; variable_access_99(D)->content.args, variable_access_99(D)->content.args
; src/tac.c:827:         long long arg_count = 0;
	xorl	%ebp, %ebp	; arg_count
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp322, %sfp
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L119	;
	.p2align 4,,10
	.p2align 3
.L120:
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbx, %rsi	; status,
; src/tac.c:833:             arg_count++;
	addq	$1, %rbp	;, arg_count
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	call	tac_expression	;
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rdi	; arg_127->type, arg_127->type
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rax, %r15	; tmp323, arg
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	call	get_type_size	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, %r12	; tmp324, _77
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_275->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp325, arg
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	; _77, arg_275->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_275->is_get
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_275->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; arg, inst_159->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp326, inst
; src/tac.c:214:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_159->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_159->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_159->arg3
; src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_100(D)->current_block, status_100(D)->current_block
	movq	8(%rax), %rdi	; _80->instructions, _80->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L119:
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp327, arg_expr
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	jne	.L120	;,
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%r13), %rsi	; base_334->type, base_334->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %r14	; tmp328, _85
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _85, tmp288
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _85->type, tmp288
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp329, <retval>
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_299->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp288, MEM <vector(2) long unsigned int> [(void *)arg_299]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_299->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; arg_count, arg_287->value.int_value
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp330, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_287->kind
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_287->is_get
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_287->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_160->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp331, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_160->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	; arg, inst_160->arg3
; src/tac.c:214:     inst->type = type;
	movl	$22, 24(%rax)	;, inst_160->type
; src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_100(D)->current_block, status_100(D)->current_block
	movq	8(%rax), %rdi	;, _87->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:839:         return temp;
	jmp	.L98	;
	.p2align 4,,10
	.p2align 3
.L100:
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$102, %edx	;,
.L129:
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rbx	; tmp305, _30
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rbx, %xmm0	; _30, tmp238
	movhps	16(%rbx), %xmm0	;, tmp238
; src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp306, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp238,* <retval>
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L98	;
	.p2align 4,,10
	.p2align 3
.L133:
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rax), %rax	; base_109->type, _44
; src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %r12	; _44->name, pretmp_376
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	; _44->kind, _44->kind
	subl	$3, %eax	;, tmp254
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	;, tmp254
	ja	.L128	;,
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC13(%rip), %rsi	;, tmp259
	movq	%r12, %rdi	; pretmp_376,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp312
	jne	.L128	;,
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rdi	; variable_access_99(D)->content.index, variable_access_99(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rdi	; tmp313, _53
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	;
	movq	%rax, %r14	; tmp314, index
; src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	; index
	je	.L139	;,
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%r13), %rax	; base_109->type, base_109->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	(%rax), %rsi	; _55->type, _55->type
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp315, _57
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _57, tmp267
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _57->type, tmp267
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp316, <retval>
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_251->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp267, MEM <vector(2) long unsigned int> [(void *)arg_251]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_251->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_158->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp317, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_158->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	; index, inst_158->arg3
; src/tac.c:214:     inst->type = type;
	movl	$16, 24(%rax)	;, inst_158->type
; src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_100(D)->current_block, status_100(D)->current_block
	movq	8(%rax), %rdi	;, _58->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:814:         return temp;
	jmp	.L98	;
	.p2align 4,,10
	.p2align 3
.L138:
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_109->type, base_109->type
	movq	8(%rbp), %rdx	; variable_access_99(D)->content.attr_name, variable_access_99(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _33->name, _33->name
	movq	8(%rax), %r8	; _31->name,
	leaq	.LC11(%rip), %rdx	;, tmp245
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L130:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp221
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:756:         return NULL;
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L115:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC16(%rip), %rdx	;, tmp294
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:843:         return NULL;
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L128:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r12, %rcx	; pretmp_376,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC12(%rip), %rdx	;, tmp261
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:801:             return NULL;
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L137:
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; attr_146->type, attr_146->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rax, %rdi	; attr,
	jmp	.L129	;
	.p2align 4,,10
	.p2align 3
.L131:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp223
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:762:         return NULL;
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L139:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rdi	;, tmp264
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:807:             return NULL;
	jmp	.L103	;
	.p2align 4,,10
	.p2align 3
.L135:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _15->name, _15->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC9(%rip), %rdx	;, tmp227
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:768:             return NULL;
	jmp	.L103	;
.L136:
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_109->type, base_109->type
	movq	8(%rbp), %rdx	; variable_access_99(D)->content.attr_name, variable_access_99(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _24->name, _24->name
	movq	8(%rax), %r8	; _22->name,
	leaq	.LC10(%rip), %rdx	;, tmp235
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:777:             return NULL;
	jmp	.L103	;
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC19:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.p2align 4
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/tac.c:678:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L141	;,
	leaq	.L143(%rip), %rdx	;, tmp136
	movq	%rsi, %rbp	; tmp173, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp138
	addq	%rdx, %rax	; tmp136, tmp139
	jmp	*%rax	; tmp139
	.section	.rodata
	.align 4
	.align 4
.L143:
	.long	.L151-.L143
	.long	.L150-.L143
	.long	.L149-.L143
	.long	.L148-.L143
	.long	.L147-.L143
	.long	.L146-.L143
	.long	.L145-.L143
	.long	.L144-.L143
	.long	.L142-.L143
	.text
	.p2align 4,,10
	.p2align 3
.L144:
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp186, _15
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r13	; tmp187, operand
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp188, _17
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _17, tmp158
	movhps	16(%r12), %xmm0	; _17->type, tmp158
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_174->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp189, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_174->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp158, MEM <vector(2) long unsigned int> [(void *)arg_174]
; src/tac.c:718:             if (operand->type == name_int)
	movq	8(%r13), %rax	; operand_42->type, _18
; src/tac.c:718:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L158	;,
; src/tac.c:720:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L159	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp165
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L160:
; src/tac.c:739: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L142:
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.var
; src/tac.c:739: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	;
	.p2align 4,,10
	.p2align 3
.L151:
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	xorl	%esi, %esi	;
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rbp	; tmp174, _3
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_102->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp175, <retval>
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; _3, arg_102->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int,
.L140:
; src/tac.c:739: }
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
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	;* primary, primary_36(D)->value.literal_value
	xorl	%esi, %esi	;
	call	*strtod@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; _5, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	8(%rsp), %xmm0	; %sfp, _5
; src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_114->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp177, <retval>
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _5, arg_114->value.float_value
; src/tac.c:237:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:237:             arg->type = name_float;
	movq	%rax, 8(%rbx)	; name_float,
; src/tac.c:739: }
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
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %xmm0	; primary_36(D)->value.literal_value, _6
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%xmm0, 8(%rsp)	; _6, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:240:             arg->value.string_value = (string)value;
	movq	8(%rsp), %xmm0	; %sfp, _6
; src/tac.c:224:     arg->kind = kind;
	movl	$3, 16(%rax)	;, arg_126->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp178, <retval>
; src/tac.c:240:             arg->value.string_value = (string)value;
	movhps	name_string(%rip), %xmm0	; name_string, tmp145
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:240:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rax)	; tmp145, MEM <vector(2) long unsigned int> [(void *)arg_126]
; src/tac.c:739: }
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
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_138->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp179, <retval>
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	;, arg_138->value.bool_value
; src/tac.c:245:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:245:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; src/tac.c:739: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L147:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_150->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp180, <retval>
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	;, arg_150->value.bool_value
; src/tac.c:245:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:245:             arg->type = name_bool;
	movq	%rax, 8(%rbx)	; name_bool,
; src/tac.c:739: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L146:
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
; src/tac.c:739: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	;
	.p2align 4,,10
	.p2align 3
.L145:
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp181, _9
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	name_bool(%rip), %rsi	; name_bool,
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r13	; tmp182, operand
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %r12	; tmp183, _11
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _11, tmp152
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _11->type, tmp152
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp184, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_162->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp152, MEM <vector(2) long unsigned int> [(void *)arg_162]
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_162->kind
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; operand, inst_82->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp185, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_82->arg1
; src/tac.c:214:     inst->type = type;
	movl	$13, 24(%rax)	;, inst_82->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_82->arg3
; src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:739: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L141:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp170
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L160	;
	.p2align 4,,10
	.p2align 3
.L159:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_198->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp192, arg
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	.LC17(%rip), %rax	;, tmp197
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_198->is_get
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	%rax, (%r12)	; tmp197, arg_198->value.float_value
; src/tac.c:237:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%r12)	; name_float, arg_198->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$2, 24(%rax)	;, inst_84->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg,
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; operand,
.L154:
; src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:729:             return temp;
	jmp	.L140	;
	.p2align 4,,10
	.p2align 3
.L158:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_186->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp190, arg
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_186->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_186->is_get
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r12)	; name_int, arg_186->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$1, 24(%rax)	;, inst_83->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp191, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg,
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; operand,
	jmp	.L154	;
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.p2align 4
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp146, expression
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp147, status
	subq	$8, %rsp	;,
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
	je	.L175	;,
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
	call	tac_expression	;
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rdi	; tmp148, _4
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	;
	movq	%rax, %rbp	; tmp149, <retval>
; src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	; expression_30(D)->operator,
	cmpl	$18, %eax	;, _5
	ja	.L163	;,
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	leaq	CSWTCH.43(%rip), %rdx	;, tmp125
	movq	%rbx, %rsi	; status,
	movl	(%rdx,%rax,4), %r13d	; CSWTCH.43[_5], _50
	call	tac_expression	;
	movq	%rax, %r14	; tmp150, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp128
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp128
	ja	.L164	;,
; src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	;, _50
	jne	.L168	;,
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_96->kind,
	testl	%eax, %eax	;
	jne	.L176	;,
.L166:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_53->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp155, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_53->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_53->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_53->arg3
; src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%r14)	;, left_96->is_get
	jne	.L177	;,
.L167:
; src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:675: }
	addq	$8, %rsp	;,
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L163:
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	;, _50
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	;
	movq	%rax, %r14	; tmp161, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp144
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp144
	ja	.L164	;,
.L168:
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r14), %rsi	; left_98->type, left_98->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r15	; tmp151, _9
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _9, tmp131
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r14, %rdi	; left,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r15), %xmm0	; _9->type, tmp131
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_77->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp152, arg
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_77->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp131, MEM <vector(2) long unsigned int> [(void *)arg_77]
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r15	; tmp153, _10
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; _10, inst_52->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp154, inst
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_52->arg3
; src/tac.c:660:             right = temp;
	movq	%r12, %rbp	; arg, <retval>
; src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	; _50, inst_52->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_52->arg1
; src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_96->kind,
	testl	%eax, %eax	;
	je	.L166	;,
.L176:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp136
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L166	;
	.p2align 4,,10
	.p2align 3
.L164:
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r14), %rsi	; left_97->type, left_97->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r15	; tmp157, _17
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _17, tmp138
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r14, %rdi	; left,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r15), %xmm0	; _17->type, tmp138
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_89->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp158, arg
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_89->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp138, MEM <vector(2) long unsigned int> [(void *)arg_89]
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %r14	; tmp159, _18
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_55->arg3
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp160, inst
; src/tac.c:670:         right = temp;
	movq	%r12, %rbp	; arg, <retval>
; src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	; _50, inst_55->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_55->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; _18, inst_55->arg2
	jmp	.L167	;
	.p2align 4,,10
	.p2align 3
.L175:
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
; src/tac.c:675: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	;
	.p2align 4,,10
	.p2align 3
.L177:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$24, 24(%rax)	;, inst_54->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp156, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_54->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_54->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_54->arg3
	jmp	.L167	;
	.size	tac_expression, .-tac_expression
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	movq	%rdi, %r15	; tmp186, if_
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movl	$98, %edx	;,
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	;
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp187, status
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	subq	$56, %rsp	;,
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp188, then_label
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r15), %rdi	; if__61(D)->else_if, if__61(D)->else_if
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp189, else_label
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp190
	je	.L181	;,
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp192
	jne	.L202	;,
.L181:
; src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, 40(%rsp)	; tmp191, %sfp
.L180:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rbx, %rsi	; status,
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_185->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp193, arg
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_185->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	40(%rsp), %rax	; %sfp, end_label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_185->is_get
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%r15), %rdi	; if__61(D)->condition, if__61(D)->condition
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, (%r14)	; end_label, arg_185->value.label
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	call	tac_expression	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rax, 16(%rsp)	; condition, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp195, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_173->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_173->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_173->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_173->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; then_label, arg_161->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_161->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_161->type
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_161->is_get
	movq	%rax, 8(%rsp)	; arg, %sfp
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	16(%rsp), %rcx	; %sfp, condition
; src/tac.c:216:     inst->arg2 = arg2;
	movq	8(%rsp), %rdx	; %sfp, arg
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp197, inst
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; arg, inst_129->arg3
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_129->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_129->arg1
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_129->type
; src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp198, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; then_label, block_159->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp199, block_159->instructions
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _10->blocks, _10->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:480:     status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r15), %rdi	; if__61(D)->body, if__61(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp200, then_statements
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L182	;
	.p2align 4,,10
	.p2align 3
.L183:
; src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L182:
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp201, statement
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L183	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_130->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp202, inst
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_130->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_130->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_130->arg3
; src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r15), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp203
	je	.L203	;,
.L184:
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp221
	je	.L204	;,
.L191:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp227, block
; src/tac.c:100:     block->label = label;
	movq	40(%rsp), %rax	; %sfp, end_label
	movq	%rax, 0(%rbp)	; end_label, block_227->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp228, block_227->instructions
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _40->blocks, _40->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:540:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:542: }
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
.L202:
; src/tac.c:469:         end_label = else_label;
	movq	%rbp, 40(%rsp)	; else_label, %sfp
	jmp	.L180	;
	.p2align 4,,10
	.p2align 3
.L204:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp222, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_225->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp223, block_225->instructions
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:527:         status->current_block = else_block;
	movq	%r12, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp224, else_statements
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L192	;
	.p2align 4,,10
	.p2align 3
.L193:
; src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L192:
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp225, else_statement
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L193	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_133->arg1
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp226, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_133->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_133->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_133->arg3
; src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _38->instructions, _38->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L191	;
	.p2align 4,,10
	.p2align 3
.L203:
; src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp204, %sfp
	.p2align 4,,10
	.p2align 3
.L185:
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp220, elif
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L184	;,
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp205, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_197->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp206, block_197->instructions
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:498:             status->current_block = else_if_block;
	movq	%r13, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 8(%rsp)	; tmp207, %sfp
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%r12), %rdi	; elif_87->condition, elif_87->condition
	movq	%rbx, %rsi	; status,
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp208, else_label
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	call	tac_expression	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rsp), %rdi	; %sfp,
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	%rax, 24(%rsp)	; tmp209, %sfp
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp210
	jne	.L205	;,
.L187:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp212, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_213->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_213->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_213->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_213->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	; tmp213, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_201->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_201->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	8(%rsp), %rax	; %sfp, then_label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rcx)	;, arg_201->is_get
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, (%rcx)	; then_label, arg_201->value.label
; src/tac.c:263:     arg->is_get = false;
	movq	%rcx, 32(%rsp)	; arg, %sfp
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	24(%rsp), %rdx	; %sfp, condition
; src/tac.c:216:     inst->arg2 = arg2;
	movq	32(%rsp), %rcx	; %sfp, arg
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp214, inst
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r13, 16(%rax)	; arg, inst_131->arg3
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_131->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdx, (%rax)	; condition, inst_131->arg1
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_131->type
; src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _26->instructions, _26->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp215, block
; src/tac.c:100:     block->label = label;
	movq	8(%rsp), %rax	; %sfp, then_label
	movq	%rax, 0(%r13)	; then_label, block_199->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp216, block_199->instructions
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _28->blocks, _28->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rdi	; elif_87->body, elif_87->body
; src/tac.c:511:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_56(D)->current_block
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp217, elif_statements
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L188	;
	.p2align 4,,10
	.p2align 3
.L189:
; src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L188:
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp218, elif_statement
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L189	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_132->arg1
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp219, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_132->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_132->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_132->arg3
; src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _31->instructions, _31->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L185	;
	.p2align 4,,10
	.p2align 3
.L205:
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	; tmp211
	cmovne	40(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L187	;
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC22:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC23:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.p2align 4
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
; src/tac.c:421:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_28(D)->type,
; src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L207	;,
	leaq	.L209(%rip), %rdx	;, tmp115
; src/tac.c:419: void tac_statement(Statement* statement, TACStatus* status) {
	pushq	%r12	;
; src/tac.c:421:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp117
; src/tac.c:419: void tac_statement(Statement* statement, TACStatus* status) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp144, status
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp143, statement
; src/tac.c:421:     switch (statement->type) {
	addq	%rdx, %rax	; tmp115, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
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
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_29(D)->end_labels, status_29(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp148
	jne	.L218	;,
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbp), %rax	; status_29(D)->end_labels, status_29(D)->end_labels
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _11->tail, _11->tail
	movq	8(%rax), %rbx	; _12->content, label
; src/tac.c:437:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	je	.L218	;,
.L233:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp149, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; label,* inst
	jmp	.L232	;
	.p2align 4,,10
	.p2align 3
.L208:
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_29(D)->start_labels, status_29(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp150
	jne	.L219	;,
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbp), %rax	; status_29(D)->start_labels, status_29(D)->start_labels
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _18->tail, _18->tail
	movq	8(%rax), %rbx	; _19->content, label
; src/tac.c:448:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	jne	.L233	;,
.L219:
; src/tac.c:461: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$52, %edx	;,
; src/tac.c:461: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC22(%rip), %rdi	;, tmp140
; src/tac.c:461: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L214:
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_28(D)->stmt.if_stmt, statement_28(D)->stmt.if_stmt
; src/tac.c:461: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	;
	.p2align 4,,10
	.p2align 3
.L216:
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_28(D)->stmt.expr, statement_28(D)->stmt.expr
; src/tac.c:461: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	jmp	tac_expression	;
	.p2align 4,,10
	.p2align 3
.L206:
; src/tac.c:461: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L212:
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_28(D)->stmt.for_stmt, statement_28(D)->stmt.for_stmt
; src/tac.c:461: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	;
	.p2align 4,,10
	.p2align 3
.L211:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp145, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$5, 16(%rax)	;, arg_66->kind
; src/tac.c:248:             arg->value.string_value = NULL;
	movq	$0, (%rax)	;, arg_66->value.string_value
; src/tac.c:249:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_66->is_get
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	(%rbx), %rdi	; statement_28(D)->stmt.return_expr, _6
; src/tac.c:249:             arg->type = name_void;
	movq	%rax, 8(%r12)	; name_void, arg_66->type
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _6
	je	.L217	;,
; src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp146, arg
.L217:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$21, 24(%rax)	;, inst_45->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp147, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_45->arg1
.L232:
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_29(D)->current_block, status_29(D)->current_block
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rsi)	;,
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rsi)	;,
; src/tac.c:461: }
	popq	%rbx	;
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	8(%rax), %rdi	;, _13->instructions
; src/tac.c:461: }
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L213:
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_28(D)->stmt.while_stmt, statement_28(D)->stmt.while_stmt
; src/tac.c:461: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	;
	.p2align 4,,10
	.p2align 3
.L218:
; src/tac.c:461: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$49, %edx	;,
; src/tac.c:461: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC21(%rip), %rdi	;, tmp133
; src/tac.c:461: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L207:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC23(%rip), %rdx	;, tmp142
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	tac_statement, .-tac_statement
	.p2align 4
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15	;
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp174, for_
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp175, status
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	subq	$24, %rsp	;,
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	; tmp176, condition_label
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r15	; tmp177, body_label
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__51(D)->condition
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp178, end_label
; src/tac.c:552:     if (for_->condition != NULL) {
	je	.L235	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp179, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_169->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_169->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp180, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_108->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_108->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_108->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_108->arg3
; src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _3->instructions, _3->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp181, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; condition_label, block_167->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp182, block_167->instructions
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _5->blocks, _5->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:558:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%r12), %rdi	; for__51(D)->condition, for__51(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %rbp	; tmp184, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_155->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_155->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; end_label, arg_155->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_155->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_143->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_143->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_143->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_143->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, condition
; src/tac.c:216:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_107->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp186, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_107->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_107->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_107->arg3
; src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	;, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L236:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp189, block
; src/tac.c:100:     block->label = label;
	movq	%r15, (%rax)	; body_label, block_193->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp190, block_193->instructions
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _15->blocks, _15->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:571:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__51(D)->increment
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, (%rsp)	; increment_label, %sfp
	movq	%rax, %rbp	; tmp191, increment_label
; src/tac.c:574:     if (for_->increment != NULL)
	je	.L237	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp192, arg
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rdi	; status_52(D)->start_labels, status_52(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_195->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_195->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; increment_label, arg_195->value.label
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	*list_append@GOTPCREL(%rip)	;
.L238:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_231->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp195, arg
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_52(D)->end_labels, status_52(D)->end_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_231->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_231->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; end_label, arg_231->value.label
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__51(D)->body, for__51(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp196, body_statements
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L240	;
	.p2align 4,,10
	.p2align 3
.L241:
; src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L240:
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp197, statement
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L241	;,
; src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_52(D)->start_labels, status_52(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_52(D)->end_labels, status_52(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__51(D)->increment
	je	.L242	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp198, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_245->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_245->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	(%rsp), %rax	; %sfp, increment_label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_245->is_get
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, 0(%rbp)	; increment_label, arg_245->value.label
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp199, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_110->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_110->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_110->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_110->arg3
; src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _32->instructions, _32->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp200, block
; src/tac.c:100:     block->label = label;
	movq	(%rsp), %rax	; %sfp, increment_label
	movq	%rax, 0(%rbp)	; increment_label, block_243->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp201, block_243->instructions
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _34->blocks, _34->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:593:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%r12), %rdi	; for__51(D)->increment, for__51(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
.L242:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp202, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_257->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_257->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_257->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_257->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__51(D)->condition
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_111->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp203, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_111->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_111->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_111->arg3
; src/tac.c:598:     if (for_->condition == NULL)
	je	.L245	;,
.L243:
; src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _40->instructions, _40->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp206, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; end_label, block_281->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp207, block_281->instructions
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _42->blocks, _42->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:604:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:606: }
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
.L237:
; src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__51(D)->condition
	je	.L239	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp193, arg
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_52(D)->start_labels, status_52(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; condition_label, arg_207->value.label
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L238	;
	.p2align 4,,10
	.p2align 3
.L235:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp187, arg
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_181->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_181->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_109->arg1
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp188, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_109->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_109->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_109->arg3
; src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	;, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L236	;
	.p2align 4,,10
	.p2align 3
.L245:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp204, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_269->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_269->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_269->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_269->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_112->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp205, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_112->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_112->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_112->arg3
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L239:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp194, arg
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_52(D)->start_labels, status_52(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; body_label, arg_219->value.label
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L238	;
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15	;
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp141, while_
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp142, status
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	subq	$24, %rsp	;,
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp143, condition_label
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp144, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_137->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_137->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_137->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_137->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp145, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_68->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_68->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_68->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_68->arg3
; src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp146, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; condition_label, block_135->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp147, block_135->instructions
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:615:     status->current_block = condition_block;
	movq	%r13, 16(%rbx)	; block, status_27(D)->current_block
; src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	xorl	%esi, %esi	;
	movl	$98, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp148, body_label
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	0(%rbp), %rdi	; while__40(D)->condition, while__40(D)->condition
	movq	%rbx, %rsi	; status,
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r13	; tmp149, end_label
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	call	tac_expression	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp151, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_123->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_123->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; end_label, arg_123->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_123->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_111->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_111->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; body_label, arg_111->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_111->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, condition
; src/tac.c:216:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp153, inst
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	; arg, inst_67->arg3
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_67->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_67->arg1
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_67->type
; src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp154, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; body_label, block_109->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r15, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r15)	; tmp155, block_109->instructions
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:625:     status->current_block = body_block;
	movq	%r15, 16(%rbx)	; block, status_27(D)->current_block
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_97->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp156, arg
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_97->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_97->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_97->value.label
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_85->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp157, arg
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_85->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_85->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; end_label, arg_85->value.label
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rdi	; while__40(D)->body, while__40(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp158, body_statements
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L247	;
	.p2align 4,,10
	.p2align 3
.L248:
; src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L247:
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp159, statement
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L248	;,
; src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp160, arg
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; condition_label, arg_151->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_151->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_151->type
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_151->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp161, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_69->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_69->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_69->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_69->arg3
; src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp162, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; end_label, block_149->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp163, block_149->instructions
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _23->blocks, _23->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:641:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_27(D)->current_block
; src/tac.c:643: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
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
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_16(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
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
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp119, subroutine_39->blocks
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
; src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r13), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp120, parameters
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L251	;
	.p2align 4,,10
	.p2align 3
.L252:
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_39->parameters, subroutine_39->parameters
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp121, _8
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
.L251:
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L252	;,
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	; tmp123, _10
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _10, block_43->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_39->blocks, subroutine_39->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp125, block_43->instructions
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:329:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r13), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp126, statements
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L253	;
	.p2align 4,,10
	.p2align 3
.L254:
; src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L253:
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp127, statement
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L254	;,
; src/tac.c:336:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; src/tac.c:338: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_function, .-tac_function
	.p2align 4
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp150, method
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp151, status
	subq	$24, %rsp	;,
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movaps	%xmm0, (%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)], %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:89:     subroutine->name = name;
	movdqa	(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp152, subroutine
; src/tac.c:89:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_32(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_67]
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp153, subroutine_67->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp154, subroutine_67->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp155, subroutine_67->blocks
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
; src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_35(D)->current_subroutine
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r13), %rdi	; method_32(D)->parameters, method_32(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp156, parameters
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L257	;
	.p2align 4,,10
	.p2align 3
.L258:
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_41->type, parameter_41->type
	movq	8(%rax), %rdi	; parameter_41->name, parameter_41->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_67->parameters, subroutine_67->parameters
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp157, _8
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
.L257:
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L258	;,
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r14	; tmp159, _10
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp160, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _10, block_71->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_67->blocks, subroutine_67->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp161, block_71->instructions
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_35(D)->current_class, status_35(D)->current_class
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:353:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_35(D)->current_block
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _13->name, _13->name
	movq	8(%rax), %rdi	; _14->name, _14->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp162, _16
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%r13), %rax	; method_32(D)->name, method_32(D)->name
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _17->name, _17->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp163
	je	.L263	;,
.L259:
; src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r13), %rdi	; method_32(D)->body, method_32(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp168, statements
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L260	;
	.p2align 4,,10
	.p2align 3
.L261:
; src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L260:
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp169, statement
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L261	;,
; src/tac.c:364:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_35(D)->current_subroutine
; src/tac.c:366: }
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
.L263:
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	; status_35(D)->current_class, status_35(D)->current_class
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	(%rax), %rsi	; _20->name, _20->name
	call	create_var	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp164, _22
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _22, tmp145
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _22->type, tmp145
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_85->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp165, arg
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp145, MEM <vector(2) long unsigned int> [(void *)arg_85]
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r15	; status_35(D)->current_class, _23
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_85->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp166, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_73->kind
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	24(%r15), %rax	; MEM[(long long int *)_23 + 24B], _75
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_73->is_get
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rax, 0(%rbp)	; _75, arg_73->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
	movq	%rax, 8(%rbp)	; name_int, arg_73->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r12), %rdi	; block_71->instructions, block_71->instructions
; src/tac.c:214:     inst->type = type;
	movl	$18, 24(%rax)	;, inst_61->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp167, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_61->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg, inst_61->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_61->arg3
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L259	;
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC24:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp110, class
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp111, status
	pushq	%rbx	;
; src/tac.c:369:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_13(D)->current_class
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_14(D)->members, class_14(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%r12), %r14	; class_14(D)->name, _2
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %rbx	; tmp112, members
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp113, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%r14, %xmm1	; _2, _2
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%r13, %rsi	; table,
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp114, tmp101
	punpcklqdq	%xmm1, %xmm0	; _2, tmp101
	movups	%xmm0, 0(%r13)	; tmp101, MEM <vector(2) long unsigned int> [(void *)table_28]
; src/tac.c:374:     attr_table->size = class->size;
	movq	24(%r12), %rax	; class_14(D)->size, class_14(D)->size
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC24(%rip), %r12	;, tmp109
; src/tac.c:374:     attr_table->size = class->size;
	movq	%rax, 16(%r13)	; class_14(D)->size, table_28->size
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_13(D)->tac, status_13(D)->tac
	movq	(%rax), %rdi	; _4->attribute_tables, _4->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L265:
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L273	;,
.L270:
; src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %ecx	; member_23->type, _6
; src/tac.c:377:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L266	;,
	cmpl	$1, %ecx	;, _6
	je	.L267	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	movq	%r12, %rdx	; tmp109,
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	jne	.L270	;,
.L273:
; src/tac.c:389:     status->current_class = NULL;
	movq	$0, 24(%rbp)	;, status_13(D)->current_class
; src/tac.c:391: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L267:
; src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_23->content.variable, member_23->content.variable
	movl	$97, %edx	;,
	movq	%rbp, %rsi	; status,
	call	tac_variable	;
; src/tac.c:383:                 break;
	jmp	.L265	;
	.p2align 4,,10
	.p2align 3
.L266:
; src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_23->content.method, member_23->content.method
	movq	%rbp, %rsi	; status,
	call	tac_method	;
; src/tac.c:380:                 break;
	jmp	.L265	;
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC25:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC25(%rip), %r14	;, tmp115
; src/tac.c:283: TAC* tac_code(Code* code) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:283: TAC* tac_code(Code* code) {
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
; src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rdi	; code_17(D)->members, code_17(D)->members
; src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rbp)	; tmp123, status_26->start_labels
; src/tac.c:77:     status->attr_count = 0;
	movups	%xmm0, 48(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 48B]
	movups	%xmm0, 64(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 64B]
	movups	%xmm0, 80(%rbp)	; tmp101, MEM <vector(2) long unsigned int> [(long unsigned int *)status_26 + 80B]
; src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp124, members
	.p2align 4,,10
	.p2align 3
.L275:
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, code_member
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L283	;,
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L284	;,
; src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L285	;,
; src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L275	;,
; src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L275	;
	.p2align 4,,10
	.p2align 3
.L284:
; src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rdi	; code_member_21->content.function, code_member_21->content.function
	movq	%rbp, %rsi	; status,
	call	tac_function	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	; code_member_21->content.function, code_member_21->content.function
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r14, %rsi	; tmp115,
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %rbx	; _4->name, _5
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rdi	; _5->name, _5->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp125
	jne	.L275	;,
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L275	;
	.p2align 4,,10
	.p2align 3
.L285:
; src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	tac_class	;
	jmp	.L275	;
	.p2align 4,,10
	.p2align 3
.L283:
; src/tac.c:302: }
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
	.type	CSWTCH.43, @object
	.size	CSWTCH.43, 76
CSWTCH.43:
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
.LC17:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
