	.file	"tac.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.p2align 4
	.type	search_var, @function
search_var:
	pushq	%r13	;
	pushq	%r12	;
	movq	%rsi, %r12	; tmp143, status
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp142, original_name
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rsi), %rax	; status_46(D)->current_subroutine, _1
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	; _1
	je	.L7	;,
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rdi	; _1->local_vars, _1->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	; tmp144
	je	.L5	;,
.L11:
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%r12), %rax	; status_46(D)->current_subroutine, _8
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	; _8
	je	.L7	;,
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rdi	; _8->parameters, _8->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	; tmp147
	je	.L31	;,
.L7:
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%r12)	;, status_46(D)->current_class
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%r12), %rax	; status_46(D)->tac, status_46(D)->tac
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	je	.L4	;,
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rdi	; pretmp_79->attribute_tables, pretmp_79->attribute_tables
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	; tmp151
	je	.L27	;,
.L29:
	movq	(%r12), %rax	; status_46(D)->tac, status_46(D)->tac
.L4:
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	16(%rax), %rdi	; _29->global_vars, _29->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	; tmp150
	jne	.L15	;,
; src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%r12), %rax	; status_46(D)->tac, status_46(D)->tac
	movq	16(%rax), %rdi	; _32->global_vars, _32->global_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp157, vars
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L22	;
	.p2align 4,,10
	.p2align 3
.L23:
; src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	%rbp, (%rax)	; original_name, var_74->original_name
	je	.L1	;,
.L22:
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%rbx, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L23	;,
.L15:
; src/tac.c:153:     return NULL;
	xorl	%eax, %eax	; <retval>
.L1:
; src/tac.c:154: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L27:
; src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%r12), %rax	; status_46(D)->tac, status_46(D)->tac
	movq	(%rax), %rdi	; _19->attribute_tables, _19->attribute_tables
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp152, tables
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	jmp	.L17	;
	.p2align 4,,10
	.p2align 3
.L21:
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%r12), %rax	; status_46(D)->current_class, status_46(D)->current_class
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	; _22->name, tmp160
	cmpq	%rax, 8(%rbx)	; tmp160, table_64->name
	je	.L32	;,
.L17:
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r13, %rdi	; tables,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp156, table
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	; table
	jne	.L21	;,
	jmp	.L29	;
	.p2align 4,,10
	.p2align 3
.L5:
; src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%r12), %rax	; status_46(D)->current_subroutine, status_46(D)->current_subroutine
	movq	24(%rax), %rdi	; _5->local_vars, _5->local_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp145, vars
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L8	;
	.p2align 4,,10
	.p2align 3
.L10:
; src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	%rbp, (%rax)	; original_name, var_51->original_name
	je	.L1	;,
.L8:
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%rbx, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L10	;,
	jmp	.L11	;
	.p2align 4,,10
	.p2align 3
.L31:
; src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%r12), %rax	; status_46(D)->current_subroutine, status_46(D)->current_subroutine
	movq	16(%rax), %rdi	; _12->parameters, _12->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp148, vars
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	jmp	.L12	;
	.p2align 4,,10
	.p2align 3
.L13:
; src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	%rbp, (%rax)	; original_name, var_58->original_name
	je	.L1	;,
.L12:
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%rbx, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L13	;,
	jmp	.L7	;
	.p2align 4,,10
	.p2align 3
.L32:
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rbx), %rdi	; table_64->attributes, table_64->attributes
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	; tmp153
	jne	.L17	;,
; src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%rbx), %rdi	; table_64->attributes, table_64->attributes
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp154, attributes
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	jmp	.L19	;
	.p2align 4,,10
	.p2align 3
.L20:
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rax	; attr_69->var, <retval>
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	%rbp, (%rax)	; original_name, _27->original_name
	je	.L1	;,
.L19:
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%rbx, %rdi	; attributes,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	; attr
	jne	.L20	;,
	jmp	.L17	;
	.size	search_var, .-search_var
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.p2align 4
	.type	create_var.part.0, @function
create_var.part.0:
	pushq	%r14	;
	movq	%rdi, %r14	; tmp119, original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; src/tac.c:155: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	pushq	%r13	;
	movq	%rsi, %r13	; tmp120, type
	pushq	%r12	;
	movq	%rcx, %r12	; tmp122, status
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:155: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	movl	%edx, %ebx	; tmp121, kind
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:172:     var->original_name = original_name;
	movq	%r14, (%rax)	; original_name, var_1->original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	; tmp123, <retval>
; src/tac.c:174:     switch (kind) {
	leal	-97(%rbx), %eax	;,
	cmpl	$21, %eax	;, tmp98
	ja	.L34	;,
	leaq	.L36(%rip), %rdx	;, tmp100
	movslq	(%rdx,%rax,4), %rax	;, tmp102
	addq	%rdx, %rax	; tmp100, tmp103
	jmp	*%rax	; tmp103
	.section	.rodata
	.align 4
	.align 4
.L36:
	.long	.L41-.L36
	.long	.L40-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L39-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L38-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L34-.L36
	.long	.L37-.L36
	.long	.L34-.L36
	.long	.L35-.L36
	.text
	.p2align 4,,10
	.p2align 3
.L34:
; src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp105
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _17, var_1->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp124, _17
.L42:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%ebx, %r8d	; kind,
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebx	;, tmp115
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC1(%rip), %rcx	;, tmp113
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rbp)	; type, var_1->type
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebx	;, tmp115
	je	.L48	;,
.L33:
; src/tac.c:193: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L41:
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%r12), %r14	; status_4(D)->attr_count, id
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r14), %rax	;, tmp106
	movq	%rax, 48(%r12)	; tmp106, status_4(D)->attr_count
	.p2align 4,,10
	.p2align 3
.L43:
; src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp112
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _17, var_1->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp125, _17
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, id
	je	.L42	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%ebx, %r8d	; kind,
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebx	;, tmp115
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; id,
	movq	$-1, %rdx	;,
	leaq	.LC2(%rip), %rcx	;, tmp114
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rbp)	; type, var_1->type
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebx	;, tmp115
	jne	.L33	;,
.L48:
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%r12), %rax	; status_4(D)->current_subroutine, status_4(D)->current_subroutine
	movq	%rbp, %rsi	; <retval>,
	movq	24(%rax), %rdi	; _25->local_vars, _25->local_vars
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:193: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L40:
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%r12), %r14	; status_4(D)->block_count, id
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r14), %rax	;, tmp110
	movq	%rax, 80(%r12)	; tmp110, status_4(D)->block_count
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L43	;
	.p2align 4,,10
	.p2align 3
.L39:
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%r12), %r14	; status_4(D)->subroutine_count, id
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r14), %rax	;, tmp111
	movq	%rax, 88(%r12)	; tmp111, status_4(D)->subroutine_count
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L43	;
	.p2align 4,,10
	.p2align 3
.L38:
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%r12), %r14	; status_4(D)->param_count, id
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r14), %rax	;, tmp107
	movq	%rax, 56(%r12)	; tmp107, status_4(D)->param_count
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L43	;
	.p2align 4,,10
	.p2align 3
.L37:
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%r12), %r14	; status_4(D)->temp_count, id
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	;, tmp109
	movq	%rax, 72(%r12)	; tmp109, status_4(D)->temp_count
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L43	;
	.p2align 4,,10
	.p2align 3
.L35:
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%r12), %r14	; status_4(D)->var_count, id
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r14), %rax	;, tmp108
	movq	%rax, 64(%r12)	; tmp108, status_4(D)->var_count
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L43	;
	.size	create_var.part.0, .-create_var.part.0
	.p2align 4
	.type	create_var.part.0.constprop.0, @function
create_var.part.0.constprop.0:
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp92, status
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; src/tac.c:155: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	pushq	%rbx	;
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbp), %r12	; status_2(D)->block_count, _11
; src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp88
; src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_1->original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp93, <retval>
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	;, tmp87
	movq	%rax, 80(%rbp)	; tmp87, status_2(D)->block_count
; src/tac.c:183:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _15, var_1->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp94, _15
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _11
	je	.L53	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _11,
	movl	$98, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC2(%rip), %rcx	;, tmp90
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:188:     var->type = type;
	movq	$0, 16(%rbx)	;, var_1->type
; src/tac.c:193: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L53:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$98, %r8d	;,
	leaq	.LC1(%rip), %rcx	;, tmp89
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:188:     var->type = type;
	movq	$0, 16(%rbx)	;, var_1->type
; src/tac.c:193: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_var.part.0.constprop.0, .-create_var.part.0.constprop.0
	.p2align 4
	.type	create_var.part.0.constprop.1, @function
create_var.part.0.constprop.1:
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp97, type
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
; src/tac.c:155: static Var* create_var(Symbol* original_name, Symbol* type, VarType kind, TACStatus* status) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp98, status
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbp), %r13	; status_2(D)->temp_count, _9
; src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp91
; src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_1->original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp99, <retval>
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r13), %rax	;, tmp90
	movq	%rax, 72(%rbp)	; tmp90, status_2(D)->temp_count
; src/tac.c:183:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _15, var_1->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp100, _15
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r13	;, _9
	je	.L58	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r13, %r9	; _9,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC2(%rip), %rcx	;, tmp93
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L56:
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbp), %rax	; status_2(D)->current_subroutine, status_2(D)->current_subroutine
; src/tac.c:188:     var->type = type;
	movq	%r12, 16(%rbx)	; type, var_1->type
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	%rbx, %rsi	; <retval>,
	movq	24(%rax), %rdi	; _23->local_vars, _23->local_vars
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:193: }
	addq	$8, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L58:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC1(%rip), %rcx	;, tmp92
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L56	;
	.size	create_var.part.0.constprop.1, .-create_var.part.0.constprop.1
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.p2align 4
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rsi, %r12	; tmp123, tac
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbp	; import_15(D)->name, _1
; src/tac.c:303: void tac_import(Import* import, TAC* tac, TACStatus* status) {
	movq	%rdx, %rbx	; tmp124, status
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbp), %ecx	; _1->kind, _2
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L73	;,
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp111
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp111
	jbe	.L74	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L68	;,
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp129, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%rbp, %xmm1	; _1, _1
; src/tac.c:11:     table->size = 0;
	movq	$0, 16(%rbx)	;, table_41->size
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	%rbx, %rsi	; table,
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp130, tmp114
	punpcklqdq	%xmm1, %xmm0	; _1, tmp114
	movups	%xmm0, (%rbx)	; tmp114, MEM <vector(2) long unsigned int> [(void *)table_41]
; src/tac.c:314: }
	popq	%rbx	;
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%r12), %rdi	; tac_17(D)->attribute_tables, tac_17(D)->attribute_tables
; src/tac.c:314: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L68:
; src/tac.c:314: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:314: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdx	;, tmp117
; src/tac.c:314: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L74:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %r13	; _1->type, _10
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %edx	; _10->kind,
	testl	%edx, %edx	;
	je	.L75	;,
.L65:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; _1,
	call	search_var	;
	movq	%rax, %rsi	; tmp127, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %eax	; _10->kind,
	testl	%eax, %eax	;
	jne	.L66	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_19(D)->current_class
.L66:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L67	;,
	movq	%r13, %rsi	; _10,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp128, var
.L67:
; src/tac.c:314: }
	popq	%rbx	;
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
; src/tac.c:314: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L73:
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	0(%rbp), %r13	; _1->type, _66
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %esi	; _66->kind,
	testl	%esi, %esi	;
	je	.L76	;,
.L61:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; _1,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %ecx	; _66->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rsi	; tmp125, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	;
	jne	.L62	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_19(D)->current_class
.L62:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L67	;,
	movq	%r13, %rsi	; _66,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp126, var
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L75:
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; _10->ast_node.class, _10->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r14	; status_19(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _10->ast_node.class, status_19(D)->current_class
	jmp	.L65	;
	.p2align 4,,10
	.p2align 3
.L76:
	movq	24(%r13), %rax	; _66->ast_node.class, _66->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rdx), %r14	; status_19(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rdx)	; _66->ast_node.class, status_19(D)->current_class
	jmp	.L61	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported type for size lookup: %s\n"
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
	pushq	%r15	;
; src/tac.c:395:     switch (type) {
	leal	-97(%rdx), %eax	;,
; src/tac.c:392: void tac_variable(Variable* variable, TACStatus* status, VarType type) {
	movl	%edx, %ecx	; tmp189, type
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:395:     switch (type) {
	cmpl	$21, %eax	;, tmp144
	ja	.L78	;,
	leaq	.L80(%rip), %rdx	;, tmp146
	movq	%rdi, %rbp	; tmp187, variable
	movq	%rsi, %rbx	; tmp188, status
	movslq	(%rdx,%rax,4), %rax	;, tmp148
	addq	%rdx, %rax	; tmp146, tmp149
	jmp	*%rax	; tmp149
	.section	.rodata
	.align 4
	.align 4
.L80:
	.long	.L83-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L82-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L81-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L78-.L80
	.long	.L77-.L80
	.long	.L78-.L80
	.long	.L77-.L80
	.text
	.p2align 4,,10
	.p2align 3
.L78:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/tac.c:418: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC6(%rip), %rdx	;, tmp179
	xorl	%eax, %eax	;
; src/tac.c:418: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/tac.c:418: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L77:
; src/tac.c:418: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L81:
; src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	8(%rdi), %r12	; variable_19(D)->name, _2
	movq	(%rdi), %r13	; variable_19(D)->type, _1
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r12, %r12	; _2
	je	.L90	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %r10d	; _1->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%r10d, %r10d	;
	jne	.L87	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; _1->ast_node.class, _1->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rsi), %r14	; status_20(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rsi)	; _1->ast_node.class, status_20(D)->current_class
.L87:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; _2,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %r9d	; _1->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp192, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r9d, %r9d	;
	jne	.L88	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_20(D)->current_class
.L88:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	je	.L90	;,
.L89:
; src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	; status_20(D)->current_subroutine, status_20(D)->current_subroutine
	movq	%rbp, %rsi	; var,
	movq	16(%rax), %rdi	; _3->parameters, _3->parameters
	jmp	.L123	;
	.p2align 4,,10
	.p2align 3
.L82:
; src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	8(%rdi), %rbp	; variable_19(D)->name, _6
	movq	(%rdi), %r12	; variable_19(D)->type, _5
; src/tac.c:157:     if (original_name != NULL) {
	testq	%rbp, %rbp	; _6
	je	.L96	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r12), %r8d	; _5->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%r8d, %r8d	;
	jne	.L94	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r12), %rax	; _5->ast_node.class, _5->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rsi), %r13	; status_20(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rsi)	; _5->ast_node.class, status_20(D)->current_class
.L94:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; _6,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edi	; _5->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rsi	; tmp194, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%edi, %edi	;
	jne	.L95	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rbx)	; current_class, status_20(D)->current_class
.L95:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	je	.L96	;,
.L93:
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	16(%rax), %rdi	; _7->global_vars, _7->global_vars
.L123:
; src/tac.c:418: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L83:
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rdi	; _9->attribute_tables, _9->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp195, attr_table
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	%r13, %rsi	; attr_table,
	movq	(%rax), %rdi	; _11->attribute_tables, _11->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	8(%rbp), %r14	; variable_19(D)->name, _14
	movq	0(%rbp), %r12	; variable_19(D)->type, _13
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp196, attr
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r14, %r14	; _14
	je	.L97	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r12), %esi	; _13->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r15d, %r15d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%esi, %esi	;
	jne	.L98	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r12), %rax	; _13->ast_node.class, _13->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r15	; status_20(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _13->ast_node.class, status_20(D)->current_class
.L98:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r14, %rdi	; _14,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %ecx	; _13->kind,
	testl	%ecx, %ecx	;
	jne	.L99	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r15, 24(%rbx)	; current_class, status_20(D)->current_class
.L99:
; src/tac.c:166:         if (var != NULL) {
	testq	%rax, %rax	; var
	je	.L100	;,
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; var, tmp166
	movq	%r12, %xmm1	; _13, _13
	punpcklqdq	%xmm1, %xmm0	; _13, tmp166
	movups	%xmm0, 0(%rbp)	; tmp166, MEM <vector(2) long unsigned int> [(void *)attr_71]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r13), %rax	; attr_table_28->size, prephitmp_47
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; prephitmp_47, attr_71->offset
.L101:
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %r12	; name_int, _13
	je	.L121	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %r12	; name_float, _13
	je	.L121	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %r12	; name_string, _13
	je	.L121	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %r12	; name_bool, _13
	je	.L122	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %r12	; name_void, _13
	je	.L122	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %edx	; _13->kind,
	testl	%edx, %edx	;
	jne	.L108	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%r12), %rdx	; _13->ast_node.class, _13->ast_node.class
; src/tac.c:202:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	; _93->size, prephitmp_47
	jmp	.L102	;
	.p2align 4,,10
	.p2align 3
.L96:
	movq	%r12, %rsi	; _5,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; _6,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp193, var
	jmp	.L93	;
	.p2align 4,,10
	.p2align 3
.L90:
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp152
	movl	$32, %esi	;,
; src/tac.c:172:     var->original_name = original_name;
	movq	%r12, (%rax)	; _2, var_40->original_name
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbx), %r12	; status_20(D)->param_count, _43
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbp	; tmp190, var
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r12), %rax	;, tmp151
	movq	%rax, 56(%rbx)	; tmp151, status_20(D)->param_count
; src/tac.c:183:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbp)	; _53, var_40->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp191, _53
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, _43
	je	.L124	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; _43,
	movl	$112, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC2(%rip), %rcx	;, tmp155
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L91:
; src/tac.c:188:     var->type = type;
	movq	%r13, 16(%rbp)	; _1, var_40->type
	jmp	.L89	;
	.p2align 4,,10
	.p2align 3
.L97:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r12, %rsi	; _13,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm2	; _13, _13
	movq	%rax, %xmm0	; tmp198, tmp167
	punpcklqdq	%xmm2, %xmm0	; _13, tmp167
	movups	%xmm0, 0(%rbp)	; tmp167, MEM <vector(2) long unsigned int> [(void *)attr_71]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r13), %rax	; attr_table_28->size, prephitmp_47
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; prephitmp_47, attr_71->offset
; src/tac.c:18:     if (type == NULL)
	testq	%r12, %r12	; _13
	jne	.L101	;,
.L102:
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	0(%r13), %rdi	; attr_table_28->attributes, _77
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%rax, 16(%r13)	; prephitmp_47, attr_table_28->size
; src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _77
	jne	.L123	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
; src/tac.c:418: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
; src/tac.c:418: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC5(%rip), %rdi	;, tmp177
; src/tac.c:418: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L108:
	movq	8(%r12), %rcx	; _13->name, _13->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC4(%rip), %rdx	;, tmp174
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:202:         table->size += get_type_size(type);
	movq	16(%r13), %rax	; attr_table_28->size, tmp208
	.p2align 4,,10
	.p2align 3
.L121:
	addq	$8, %rax	;, prephitmp_47
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L102	;
	.p2align 4,,10
	.p2align 3
.L122:
; src/tac.c:202:         table->size += get_type_size(type);
	addq	$1, %rax	;, prephitmp_47
	jmp	.L102	;
	.p2align 4,,10
	.p2align 3
.L100:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r12, %rsi	; _13,
	movq	%r14, %rdi	; _14,
	call	create_var.part.0	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm3	; _13, _13
	movq	%rax, %xmm0	; tmp199, tmp180
	punpcklqdq	%xmm3, %xmm0	; _13, tmp180
	movups	%xmm0, 0(%rbp)	; tmp180, MEM <vector(2) long unsigned int> [(void *)attr_71]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r13), %rax	; attr_table_28->size, prephitmp_47
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; prephitmp_47, attr_71->offset
	jmp	.L101	;
	.p2align 4,,10
	.p2align 3
.L124:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$112, %r8d	;,
	leaq	.LC1(%rip), %rcx	;, tmp154
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L91	;
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
	movq	%rdi, %rbp	; tmp375, variable_access
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp376, status
	subq	$24, %rsp	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rdi), %eax	; variable_access_11(D)->type,
	testl	%eax, %eax	;
	jne	.L126	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %r12	; variable_access_11(D)->content.name, _2
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%r12, %r12	; _2
	je	.L126	;,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%r12), %eax	; _2->kind, tmp425
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%r12), %r13	; _2->type, pretmp_473
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	subl	$1, %eax	;, tmp262
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %edx	; pretmp_473->kind, pretmp_428
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	;, tmp262
	jbe	.L127	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	; pretmp_428
	je	.L189	;,
.L128:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; _2,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %r15d	; pretmp_473->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp377, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r15d, %r15d	;
	jne	.L129	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_12(D)->current_class
.L129:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	jne	.L130	;,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%r13, %rsi	; pretmp_473,
	movq	%r12, %rdi	; _2,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp378, var
.L130:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp265
	movhps	16(%rbp), %xmm0	;, tmp265
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_22->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp379, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp265,* <retval>
; src/tac.c:746:             return result;
	jmp	.L125	;
	.p2align 4,,10
	.p2align 3
.L126:
; src/tac.c:753:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rdi	; variable_access_11(D)->base, _62
; src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _62
	je	.L190	;,
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_variable_access	;
	movq	%rax, %r13	; tmp383, base
; src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	; base
	je	.L137	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _64->is_get
	jne	.L191	;,
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %ecx	; variable_access_11(D)->type, _68
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _68
	je	.L192	;,
.L139:
; src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _68
	je	.L193	;,
; src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _68
	jne	.L156	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%r13), %ecx	; _69->kind, _127
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	; _127
	jne	.L157	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%r13), %rax	; _69->type, _128
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %edi	; _128->kind,
	testl	%edi, %edi	;
	je	.L194	;,
.L158:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; prephitmp_533->name,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC15(%rip), %rdx	;, tmp341
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L136:
; src/tac.c:756:         return NULL;
	xorl	%r12d, %r12d	; <retval>
.L125:
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
.L192:
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r13), %rax	; _69->type, _70
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _70->kind, _71
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp279
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp279
	jbe	.L195	;,
; src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _70->ast_node.scope, scope
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _71
	jne	.L141	;,
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_75].class_scope, scope
.L141:
; src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	; variable_access_11(D)->content.attr_name, variable_access_11(D)->content.attr_name
	movq	8(%rax), %rsi	; _77->name, _77->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp387, attr
; src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	; attr
	je	.L196	;,
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %eax	; attr_80->kind, _86
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rax), %edx	;, tmp291
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %edx	;, tmp291
	jbe	.L197	;,
; src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _86
	jne	.L198	;,
	movq	(%r12), %rdi	; attr_80->type, attr_80->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp391, _97
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _97, tmp302
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%edx, %edx	; current_class
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _97->type, tmp302
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_227->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp392, <retval>
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp302, MEM <vector(2) long unsigned int> [(void *)arg_227]
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %r15	; variable_access_11(D)->content.attr_name, _99
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_227->kind
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%r15), %r14	; _99->type, _100
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %r9d	; _100->kind,
	testl	%r9d, %r9d	;
	jne	.L148	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _100->ast_node.class, _100->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %rdx	; status_12(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _100->ast_node.class, status_12(D)->current_class
.L148:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r15, %rdi	; _99,
	movq	%rdx, 8(%rsp)	; current_class, %sfp
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %r8d	; _100->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp393, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r8d, %r8d	;
	jne	.L149	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	8(%rsp), %rdx	; %sfp, current_class
	movq	%rdx, 24(%rbx)	; current_class, status_12(D)->current_class
.L149:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	je	.L199	;,
.L150:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp305
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _226->type, tmp305
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp395, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_207->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp305, MEM <vector(2) long unsigned int> [(void *)arg_207]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_207->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_103->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp396, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_103->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	; arg, inst_103->arg3
; src/tac.c:214:     inst->type = type;
	movl	$15, 24(%rax)	;, inst_103->type
; src/tac.c:788:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	;, _104->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:791:         return temp;
	jmp	.L125	;
	.p2align 4,,10
	.p2align 3
.L191:
	movq	8(%rax), %rdi	; _64->type, _64->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp384, _169
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _169, tmp273
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _169->type, tmp273
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp385, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_175->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp273, MEM <vector(2) long unsigned int> [(void *)arg_175]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_175->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_171->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp386, inst
	movq	%r12, %r13	; arg, base
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_171->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_171->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_171->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	; _172->instructions, _172->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %ecx	; variable_access_11(D)->type, _68
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _68
	jne	.L139	;,
	jmp	.L192	;
	.p2align 4,,10
	.p2align 3
.L189:
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; pretmp_473->ast_node.class, pretmp_473->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rsi), %r14	; status_12(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rsi)	; pretmp_473->ast_node.class, status_12(D)->current_class
	jmp	.L128	;
	.p2align 4,,10
	.p2align 3
.L127:
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	; pretmp_428
	jne	.L144	;,
.L188:
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	;, _88->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r14	; status_12(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _88->ast_node.class, status_12(D)->current_class
.L144:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; attr,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %r10d	;,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp388, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r10d, %r10d	;
	jne	.L145	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_12(D)->current_class
.L145:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	jne	.L146	;,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r13, %rsi	; _88,
	movq	%r12, %rdi	; attr,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp389, var
.L146:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp293
	movhps	16(%rbp), %xmm0	;, tmp293
; src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp390, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp293,* <retval>
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L125	;
	.p2align 4,,10
	.p2align 3
.L193:
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%r13), %rax	; _69->type, _106
; src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %r12	; _106->name, pretmp_440
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	; _106->kind, _106->kind
	subl	$3, %eax	;, tmp309
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	;, tmp309
	ja	.L184	;,
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC13(%rip), %rsi	;, tmp314
	movq	%r12, %rdi	; pretmp_440,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp397
	jne	.L184	;,
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rdi	; variable_access_11(D)->content.index, variable_access_11(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp398, _115
; src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	; _115
	je	.L154	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _115->is_get
	jne	.L200	;,
.L155:
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%r13), %rax	; _69->type, _69->type
	movq	%rbx, %rsi	; status,
	movq	(%rax), %rdi	; _119->type, _119->type
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp402, _121
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _121, tmp327
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _121->type, tmp327
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp403, <retval>
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_258->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp327, MEM <vector(2) long unsigned int> [(void *)arg_258]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_258->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_123->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp404, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_123->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; _115, inst_123->arg3
; src/tac.c:214:     inst->type = type;
	movl	$16, 24(%rax)	;, inst_123->type
; src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	;, _125->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:814:         return temp;
	jmp	.L125	;
	.p2align 4,,10
	.p2align 3
.L157:
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %ecx	;, _127
	je	.L162	;,
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r13), %rax	; _69->type, _128
	jmp	.L158	;
	.p2align 4,,10
	.p2align 3
.L194:
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _128->name, _128->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r15d, %r15d	; current_class
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp405, _132
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r13), %rax	; _69->type, _69->type
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _133->ast_node.class, _133->ast_node.class
	movq	16(%rax), %rdi	; _134->class_scope, _134->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %r14	; attr_136->type, _137
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %r13	; tmp406, attr
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %esi	; _137->kind,
	testl	%esi, %esi	;
	jne	.L159	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _137->ast_node.class, _137->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r15	; status_12(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _137->ast_node.class, status_12(D)->current_class
.L159:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r13, %rdi	; attr,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %ecx	; _137->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %r12	; tmp407, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	;
	jne	.L160	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r15, 24(%rbx)	; current_class, status_12(D)->current_class
.L160:
; src/tac.c:166:         if (var != NULL) {
	testq	%r12, %r12	; var
	jne	.L161	;,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r14, %rsi	; _137,
	movq	%r13, %rdi	; attr,
	call	create_var.part.0	;
	movq	%rax, %r12	; tmp408, var
.L161:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%r12, %xmm0	; var, tmp337
	movhps	16(%r12), %xmm0	; _289->type, tmp337
; src/tac.c:224:     arg->kind = kind;
	movl	$7, 16(%rax)	;, arg_270->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp409, base
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_270->is_get
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp337, MEM <vector(2) long unsigned int> [(void *)arg_270]
.L162:
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rdi	; variable_access_11(D)->content.args, variable_access_11(D)->content.args
; src/tac.c:827:         long long arg_count = 0;
	xorl	%ebp, %ebp	; arg_count
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp410, %sfp
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L163	;
	.p2align 4,,10
	.p2align 3
.L202:
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, _149
	je	.L165	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, _149
	je	.L165	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, _149
	movl	$1, %r12d	;, prephitmp_458
	je	.L164	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, _149
	je	.L164	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %edx	; _149->kind,
	testl	%edx, %edx	;
	jne	.L166	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	; _149->ast_node.class, _149->ast_node.class
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	24(%rax), %r12	; _308->size, prephitmp_458
.L164:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:833:             arg_count++;
	addq	$1, %rbp	;, arg_count
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_290->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp412, arg
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	; prephitmp_458, arg_290->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_290->is_get
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_290->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; arg, inst_153->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp413, inst
; src/tac.c:214:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_153->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_153->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_153->arg3
; src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	; _154->instructions, _154->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L163:
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp414, arg_expr
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L201	;,
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbx, %rsi	; status,
	xorl	%r12d, %r12d	; prephitmp_458
	call	tac_expression	;
	movq	%rax, %r15	; tmp411, arg
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rax	; arg_148->type, _149
; src/tac.c:18:     if (type == NULL)
	testq	%rax, %rax	; _149
	je	.L164	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, _149
	jne	.L202	;,
.L165:
	movl	$8, %r12d	;, prephitmp_458
	jmp	.L164	;
	.p2align 4,,10
	.p2align 3
.L201:
	movq	8(%r13), %rdi	; base_364->type, base_364->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp415, _159
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _159, tmp351
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _159->type, tmp351
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp416, <retval>
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_325->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp351, MEM <vector(2) long unsigned int> [(void *)arg_325]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_325->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; arg_count, arg_313->value.int_value
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp417, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_313->kind
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_313->is_get
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_313->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_162->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp418, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_162->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	; arg, inst_162->arg3
; src/tac.c:214:     inst->type = type;
	movl	$22, 24(%rax)	;, inst_162->type
; src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	;, _163->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:839:         return temp;
	jmp	.L125	;
	.p2align 4,,10
	.p2align 3
.L198:
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _69->type, _69->type
	movq	8(%rbp), %rdx	; variable_access_11(D)->content.attr_name, variable_access_11(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _93->name, _93->name
	movq	8(%rax), %r8	; _91->name,
	leaq	.LC11(%rip), %rdx	;, tmp300
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L137:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp278
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:762:         return NULL;
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L190:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp271
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:756:         return NULL;
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L156:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC16(%rip), %rdx	;, tmp357
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:843:         return NULL;
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L199:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r14, %rsi	; _100,
	movq	%r15, %rdi	; _99,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp394, var
	jmp	.L150	;
	.p2align 4,,10
	.p2align 3
.L184:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r12, %rcx	; pretmp_440,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC12(%rip), %rdx	;, tmp316
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:801:             return NULL;
	jmp	.L136	;
	.p2align 4,,10
	.p2align 3
.L197:
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %r13	; attr_80->type, _88
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %r11d	; _88->kind,
	testl	%r11d, %r11d	;
	jne	.L144	;,
	jmp	.L188	;
	.p2align 4,,10
	.p2align 3
.L166:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _149->name, _149->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC4(%rip), %rdx	;, tmp346
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L165	;
	.p2align 4,,10
	.p2align 3
.L200:
	movq	8(%rax), %rdi	; _115->type, _115->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp399, _240
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _240, tmp319
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _240->type, tmp319
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp400, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_246->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp319, MEM <vector(2) long unsigned int> [(void *)arg_246]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_246->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; _115, inst_242->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp401, inst
	movq	%r12, %rbp	; arg, _115
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_242->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_242->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_242->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	; _243->instructions, _243->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L155	;
	.p2align 4,,10
	.p2align 3
.L195:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _70->name, _70->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC9(%rip), %rdx	;, tmp282
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:768:             return NULL;
	jmp	.L136	;
.L154:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rdi	;, tmp324
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:807:             return NULL;
	jmp	.L136	;
.L196:
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _69->type, _69->type
	movq	8(%rbp), %rdx	; variable_access_11(D)->content.attr_name, variable_access_11(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _83->name, _83->name
	movq	8(%rax), %r8	; _81->name,
	leaq	.LC10(%rip), %rdx	;, tmp290
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:777:             return NULL;
	jmp	.L136	;
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC18:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC19:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB20:
	.text
.LHOTB20:
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
	movl	8(%rdi), %ecx	; primary_34(D)->type,
; src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L204	;,
	leaq	.L206(%rip), %rdx	;, tmp157
	movq	%rsi, %rbp	; tmp205, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp159
	addq	%rdx, %rax	; tmp157, tmp160
	jmp	*%rax	; tmp160
	.section	.rodata
	.align 4
	.align 4
.L206:
	.long	.L214-.L206
	.long	.L213-.L206
	.long	.L212-.L206
	.long	.L211-.L206
	.long	.L210-.L206
	.long	.L209-.L206
	.long	.L208-.L206
	.long	.L207-.L206
	.long	.L205-.L206
	.text
	.p2align 4,,10
	.p2align 3
.L207:
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_34(D)->value.operand, primary_34(D)->value.operand
	call	tac_primary	;
	movq	%rax, %r12	; tmp220, _14
; src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	; _14
	je	.L217	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _14->is_get
	jne	.L227	;,
.L218:
	movq	8(%r12), %rdi	; _82->type, _82->type
	movq	%rbp, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp224, _79
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; _79, tmp189
	movhps	16(%r13), %xmm0	; _79->type, tmp189
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_218->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp225, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_218->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp189, MEM <vector(2) long unsigned int> [(void *)arg_218]
; src/tac.c:718:             if (operand->type == name_int)
	movq	8(%r12), %rax	; _82->type, _16
; src/tac.c:718:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _16
	je	.L228	;,
; src/tac.c:720:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _16
	je	.L229	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _16->name, _16->name
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp196
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L231:
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
.L205:
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	;* primary, primary_34(D)->value.var
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
.L214:
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	;* primary, primary_34(D)->value.literal_value
	movl	$10, %edx	;,
	xorl	%esi, %esi	;
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, %rbp	; tmp206, _3
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_108->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp207, <retval>
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; _3, arg_108->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int,
.L203:
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
.L213:
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	;* primary, primary_34(D)->value.literal_value
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
	movl	$2, 16(%rax)	;, arg_120->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp209, <retval>
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _5, arg_120->value.float_value
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
.L212:
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %xmm0	; primary_34(D)->value.literal_value, _6
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%xmm0, 8(%rsp)	; _6, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:240:             arg->value.string_value = (string)value;
	movq	8(%rsp), %xmm0	; %sfp, _6
; src/tac.c:224:     arg->kind = kind;
	movl	$3, 16(%rax)	;, arg_132->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp210, <retval>
; src/tac.c:240:             arg->value.string_value = (string)value;
	movhps	name_string(%rip), %xmm0	; name_string, tmp166
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:240:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rax)	; tmp166, MEM <vector(2) long unsigned int> [(void *)arg_132]
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
.L211:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_144->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp211, <retval>
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	;, arg_144->value.bool_value
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
.L210:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:224:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_156->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp212, <retval>
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	;, arg_156->value.bool_value
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
.L209:
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_34(D)->value.expr, primary_34(D)->value.expr
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
.L208:
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_34(D)->value.operand, primary_34(D)->value.operand
	call	tac_primary	;
	movq	%rax, %r13	; tmp213, _9
; src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	; _9
	je	.L216	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L230	;,
.L216:
	movq	name_bool(%rip), %rdi	; name_bool,
	movq	%rbp, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r12	; tmp217, _75
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _75, tmp178
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _75->type, tmp178
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp218, <retval>
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_187->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp178, MEM <vector(2) long unsigned int> [(void *)arg_187]
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_187->kind
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; _9, inst_74->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp219, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_74->arg1
; src/tac.c:214:     inst->type = type;
	movl	$13, 24(%rax)	;, inst_74->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_74->arg3
; src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_35(D)->current_block, status_35(D)->current_block
	movq	8(%rax), %rdi	;, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:739: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L204:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp201
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L231	;
	.p2align 4,,10
	.p2align 3
.L229:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$2, 16(%rax)	;, arg_242->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp228, arg
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	.LC17(%rip), %rax	;, tmp235
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r13)	;, arg_242->is_get
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movq	%rax, 0(%r13)	; tmp235, arg_242->value.float_value
; src/tac.c:237:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%r13)	; name_float, arg_242->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$2, 24(%rax)	;, inst_84->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp229, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg,
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	; _14,
.L220:
; src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_35(D)->current_block, status_35(D)->current_block
	movq	8(%rax), %rdi	;, _23->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:729:             return temp;
	jmp	.L203	;
	.p2align 4,,10
	.p2align 3
.L227:
	movq	8(%rax), %rdi	; _14->type, _14->type
	movq	%rbp, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp221, _200
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; _200, tmp184
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r13), %xmm0	; _200->type, tmp184
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp222, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_206->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp184, MEM <vector(2) long unsigned int> [(void *)arg_206]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_206->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; _14, inst_202->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp223, inst
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %r12	; arg, _14
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_202->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; arg, inst_202->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_202->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_35(D)->current_block, status_35(D)->current_block
	movq	8(%rax), %rdi	; _203->instructions, _203->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L218	;
	.p2align 4,,10
	.p2align 3
.L230:
	movq	8(%rax), %rdi	; _9->type, _9->type
	movq	%rbp, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r12	; tmp214, _169
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _169, tmp173
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _169->type, tmp173
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp215, arg
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_175->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp173, MEM <vector(2) long unsigned int> [(void *)arg_175]
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_175->kind
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; _9, inst_171->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp216, inst
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %r13	; arg, _9
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_171->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; arg, inst_171->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_171->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_35(D)->current_block, status_35(D)->current_block
	movq	8(%rax), %rdi	; _172->instructions, _172->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L216	;
	.p2align 4,,10
	.p2align 3
.L228:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_230->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp226, arg
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_230->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r13)	;, arg_230->is_get
; src/tac.c:233:             arg->type = name_int;
	movq	%rax, 8(%r13)	; name_int, arg_230->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$1, 24(%rax)	;, inst_83->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp227, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>,* inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg,
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%r12, 16(%rax)	; _14,
	jmp	.L220	;
	.section	.text.unlikely
	.type	tac_primary.cold, @function
tac_primary.cold:
.L217:
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _354
	ud2	
	.text
	.size	tac_primary, .-tac_primary
	.section	.text.unlikely
	.size	tac_primary.cold, .-tac_primary.cold
.LCOLDE20:
	.text
.LHOTE20:
	.section	.rodata.str1.8
	.align 8
.LC21:
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
	movq	%rdi, %r12	; tmp188, expression
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp189, status
	subq	$24, %rsp	;,
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_26(D)->operator
	je	.L253	;,
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_26(D)->right, expression_26(D)->right
	call	tac_expression	;
	movq	%rax, %rbp	; tmp190, <retval>
; src/tac.c:269:     if (arg == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L234	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _4->is_get
	jne	.L254	;,
.L234:
; src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	; expression_26(D)->operator,
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_26(D)->expr_left, pretmp_188
	cmpl	$18, %eax	;, _5
	ja	.L235	;,
	leaq	CSWTCH.43(%rip), %rdx	;, tmp159
	movq	%rbx, %rsi	; status,
	movl	(%rdx,%rax,4), %r13d	; CSWTCH.43[_5], _40
	call	tac_expression	;
	movq	%rax, %r14	; tmp194, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_26(D)->operator, expression_26(D)->operator
	subl	$13, %eax	;, tmp161
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp161
	ja	.L236	;,
; src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	;, _40
	jne	.L242	;,
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_210->kind,
	testl	%eax, %eax	;
	jne	.L255	;,
.L239:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_50->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp201, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_50->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_50->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_50->arg3
; src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%r14)	;, left_210->is_get
	jne	.L256	;,
.L240:
; src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _15->instructions, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:675: }
	addq	$24, %rsp	;,
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
.L235:
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	%rbx, %rsi	; status,
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	;, _40
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	;
	movq	%rax, %r14	; tmp209, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_26(D)->operator, expression_26(D)->operator
	subl	$13, %eax	;, tmp186
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp186
	ja	.L236	;,
.L242:
	movq	8(%r14), %rdi	; left_43->type, left_43->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r12	; tmp195, _49
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _49, tmp164
	movhps	16(%r12), %xmm0	; _49->type, tmp164
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_105->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp196, arg
; src/tac.c:280:     return arg;
	movq	%r14, %r12	; left, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_105->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp164, MEM <vector(2) long unsigned int> [(void *)arg_105]
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%r14)	;, left_43->is_get
	jne	.L257	;,
.L238:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r12, 8(%rax)	; arg, inst_45->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp200, inst
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_45->arg3
; src/tac.c:660:             right = temp;
	movq	%r15, %rbp	; arg, <retval>
; src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	; _40, inst_45->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; arg, inst_45->arg1
; src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_210->kind,
	testl	%eax, %eax	;
	je	.L239	;,
.L255:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp174
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L239	;
	.p2align 4,,10
	.p2align 3
.L236:
	movq	8(%r14), %rdi	; left_33->type, left_33->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp203, _56
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _56, tmp176
	movhps	16(%r15), %xmm0	; _56->type, tmp176
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_136->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp204, arg
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_136->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp176, MEM <vector(2) long unsigned int> [(void *)arg_136]
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%r14)	;, left_33->is_get
	jne	.L258	;,
.L241:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; <retval>, inst_52->arg3
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp208, inst
; src/tac.c:670:         right = temp;
	movq	%r12, %rbp	; arg, <retval>
; src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	; _40, inst_52->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_52->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; left, inst_52->arg2
	jmp	.L240	;
	.p2align 4,,10
	.p2align 3
.L253:
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_26(D)->prim_left, expression_26(D)->prim_left
; src/tac.c:675: }
	addq	$24, %rsp	;,
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
.L256:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$24, 24(%rax)	;, inst_51->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp202, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_51->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_51->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_51->arg3
	jmp	.L240	;
	.p2align 4,,10
	.p2align 3
.L254:
	movq	8(%rax), %rdi	; _4->type, _4->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp191, _87
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _87, tmp155
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _87->type, tmp155
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp192, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_93->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp155, MEM <vector(2) long unsigned int> [(void *)arg_93]
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_93->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; <retval>, inst_89->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%r13, %rbp	; arg, <retval>
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_89->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_89->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_89->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _90->instructions, _90->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L234	;
	.p2align 4,,10
	.p2align 3
.L258:
	movq	8(%r14), %rdi	; left_33->type, left_33->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, 8(%rsp)	; _149, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	8(%rsp), %rdx	; %sfp, _149
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp206, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_155->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdx, %xmm0	; _149, tmp179
	movhps	16(%rdx), %xmm0	; _149->type, tmp179
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_155->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp179, MEM <vector(2) long unsigned int> [(void *)arg_155]
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; left, inst_151->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp207, inst
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%r15, %r14	; arg, left
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_151->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; arg, inst_151->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_151->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _152->instructions, _152->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L241	;
	.p2align 4,,10
	.p2align 3
.L257:
	movq	8(%r14), %rdi	; left_43->type, left_43->type
	movq	%rbx, %rsi	; status,
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, 8(%rsp)	; _118, %sfp
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	8(%rsp), %rdx	; %sfp, _118
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp198, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_124->kind
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rdx, %xmm0	; _118, tmp167
	movhps	16(%rdx), %xmm0	; _118->type, tmp167
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_124->is_get
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp167, MEM <vector(2) long unsigned int> [(void *)arg_124]
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; left, inst_120->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp199, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_120->arg1
; src/tac.c:214:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_120->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_120->arg3
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _121->instructions, _121->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L238	;
	.size	tac_expression, .-tac_expression
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp186, if_
	movq	%rsi, %rdi	; status,
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp187, status
	subq	$56, %rsp	;,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r12	; tmp188, _100
	call	create_var.part.0.constprop.0	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r15), %rdi	; if__54(D)->else_if, if__54(D)->else_if
	movq	%rax, %rbp	; tmp189, else_label
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp190
	je	.L262	;,
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__54(D)->else_body, if__54(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp192
	jne	.L283	;,
.L262:
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rax, 40(%rsp)	; tmp191, %sfp
.L261:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rbx, %rsi	; status,
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_107->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp193, arg
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_107->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	40(%rsp), %rax	; %sfp, end_label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_107->is_get
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%r15), %rdi	; if__54(D)->condition, if__54(D)->condition
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, (%r14)	; end_label, arg_107->value.label
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
	movl	$6, 16(%rax)	;, arg_106->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_106->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_106->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_106->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _100, arg_105->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_105->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_105->type
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_105->is_get
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
	movq	%r13, 16(%rax)	; arg, inst_104->arg3
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_104->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_104->arg1
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_104->type
; src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _6->instructions, _6->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp198, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; _100, block_102->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp199, block_102->instructions
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _8->blocks, _8->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:480:     status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r15), %rdi	; if__54(D)->body, if__54(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp200, then_statements
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L263	;
	.p2align 4,,10
	.p2align 3
.L264:
; src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L263:
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp201, statement
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L264	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_108->arg2
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp202, inst
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_108->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_108->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_108->arg3
; src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r15), %rdi	; if__54(D)->else_if, if__54(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp203
	je	.L284	;,
.L265:
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r15), %rdi	; if__54(D)->else_body, if__54(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp221
	je	.L285	;,
.L272:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp227, block
; src/tac.c:100:     block->label = label;
	movq	40(%rsp), %rax	; %sfp, end_label
	movq	%rax, 0(%rbp)	; end_label, block_122->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp228, block_122->instructions
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _36->blocks, _36->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:540:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_52(D)->current_block
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
.L283:
; src/tac.c:469:         end_label = else_label;
	movq	%rbp, 40(%rsp)	; else_label, %sfp
	jmp	.L261	;
	.p2align 4,,10
	.p2align 3
.L285:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp222, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_119->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp223, block_119->instructions
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _31->blocks, _31->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:527:         status->current_block = else_block;
	movq	%r12, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; if__54(D)->else_body, if__54(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp224, else_statements
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L273	;
	.p2align 4,,10
	.p2align 3
.L274:
; src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L273:
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp225, else_statement
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L274	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_121->arg1
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp226, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_121->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_121->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_121->arg3
; src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _34->instructions, _34->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L272	;
	.p2align 4,,10
	.p2align 3
.L284:
; src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; if__54(D)->else_if, if__54(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp204, %sfp
	.p2align 4,,10
	.p2align 3
.L266:
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp220, elif
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L265	;,
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp205, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_111->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp206, block_111->instructions
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _16->blocks, _16->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:498:             status->current_block = else_if_block;
	movq	%r13, 16(%rbx)	; block, status_52(D)->current_block
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, 8(%rsp)	; tmp207, %sfp
	call	create_var.part.0.constprop.0	;
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%r12), %rdi	; elif_71->condition, elif_71->condition
	movq	%rbx, %rsi	; status,
	movq	%rax, %rbp	; tmp208, else_label
	call	tac_expression	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rsp), %rdi	; %sfp,
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	%rax, 24(%rsp)	; tmp209, %sfp
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp210
	jne	.L286	;,
.L268:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp212, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_117->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_117->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_117->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_117->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	; tmp213, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_116->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_116->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	8(%rsp), %rax	; %sfp, _110
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rcx)	;, arg_116->is_get
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, (%rcx)	; _110, arg_116->value.label
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
	movq	%r13, 16(%rax)	; arg, inst_115->arg3
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_115->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rdx, (%rax)	; condition, inst_115->arg1
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_115->type
; src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _22->instructions, _22->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp215, block
; src/tac.c:100:     block->label = label;
	movq	8(%rsp), %rax	; %sfp, _110
	movq	%rax, 0(%r13)	; _110, block_113->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp216, block_113->instructions
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	32(%rax), %rdi	; _24->blocks, _24->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rdi	; elif_71->body, elif_71->body
; src/tac.c:511:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_52(D)->current_block
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp217, elif_statements
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L269	;
	.p2align 4,,10
	.p2align 3
.L270:
; src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L269:
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp218, elif_statement
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L270	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_118->arg1
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp219, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_118->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_118->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_118->arg3
; src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _27->instructions, _27->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L266	;
	.p2align 4,,10
	.p2align 3
.L286:
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__54(D)->else_body, if__54(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	; tmp211
	cmovne	40(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L268	;
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"[warning] 'break' statement used outside of loop\n"
	.align 8
.LC23:
	.string	"[warning] 'continue' statement used outside of loop\n"
	.align 8
.LC24:
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
	ja	.L288	;,
	leaq	.L290(%rip), %rdx	;, tmp115
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
.L290:
	.long	.L297-.L290
	.long	.L287-.L290
	.long	.L295-.L290
	.long	.L294-.L290
	.long	.L293-.L290
	.long	.L292-.L290
	.long	.L291-.L290
	.long	.L289-.L290
	.text
	.p2align 4,,10
	.p2align 3
.L291:
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_29(D)->end_labels, status_29(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp148
	jne	.L299	;,
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbp), %rax	; status_29(D)->end_labels, status_29(D)->end_labels
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _11->tail, _11->tail
	movq	8(%rax), %rbx	; _12->content, label
; src/tac.c:437:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	je	.L299	;,
.L314:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;,
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp149, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; label,* inst
	jmp	.L313	;
	.p2align 4,,10
	.p2align 3
.L289:
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_29(D)->start_labels, status_29(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp150
	jne	.L300	;,
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbp), %rax	; status_29(D)->start_labels, status_29(D)->start_labels
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _18->tail, _18->tail
	movq	8(%rax), %rbx	; _19->content, label
; src/tac.c:448:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	jne	.L314	;,
.L300:
; src/tac.c:461: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$52, %edx	;,
; src/tac.c:461: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC23(%rip), %rdi	;, tmp140
; src/tac.c:461: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L295:
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
.L297:
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
.L287:
; src/tac.c:461: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L293:
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
.L292:
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
	je	.L298	;,
; src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp146, arg
.L298:
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$21, 24(%rax)	;, inst_45->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp147, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_45->arg1
.L313:
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
.L294:
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
.L299:
; src/tac.c:461: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$49, %edx	;,
; src/tac.c:461: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$1, %esi	;,
	movq	stderr(%rip), %rcx	; stderr,
	leaq	.LC22(%rip), %rdi	;, tmp133
; src/tac.c:461: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
.L288:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC24(%rip), %rdx	;, tmp142
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	tac_statement, .-tac_statement
	.p2align 4
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp174, for_
	movq	%rsi, %rdi	; status,
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp175, status
	subq	$24, %rsp	;,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r13	; tmp176, _71
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r15	; tmp177, _70
	call	create_var.part.0.constprop.0	;
; src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__40(D)->condition
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp178, _69
; src/tac.c:552:     if (for_->condition != NULL) {
	je	.L316	;,
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
	movq	%r13, (%rax)	; _71, arg_78->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_78->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp180, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_77->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_77->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_77->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_77->arg3
; src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp181, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; _71, block_75->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp182, block_75->instructions
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:558:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; block, status_41(D)->current_block
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%r12), %rdi	; for__40(D)->condition, for__40(D)->condition
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
	movl	$6, 16(%rax)	;, arg_74->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_74->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; _69, arg_74->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_74->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_73->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_73->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _70, arg_73->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_73->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, condition
; src/tac.c:216:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_72->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp186, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_72->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_72->arg1
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_72->arg3
; src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rdi	;, _7->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L317:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp189, block
; src/tac.c:100:     block->label = label;
	movq	%r15, (%rax)	; _70, block_82->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp190, block_82->instructions
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:571:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; block, status_41(D)->current_block
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
; src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__40(D)->increment
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, (%rsp)	; _81, %sfp
	movq	%rax, %rbp	; tmp191, _81
; src/tac.c:574:     if (for_->increment != NULL)
	je	.L318	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp192, arg
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rdi	; status_41(D)->start_labels, status_41(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_84->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_84->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; _81, arg_84->value.label
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	*list_append@GOTPCREL(%rip)	;
.L319:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_87->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp195, arg
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_41(D)->end_labels, status_41(D)->end_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_87->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_87->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; _69, arg_87->value.label
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__40(D)->body, for__40(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp196, body_statements
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L321	;
	.p2align 4,,10
	.p2align 3
.L322:
; src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L321:
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp197, statement
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L322	;,
; src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_41(D)->start_labels, status_41(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_41(D)->end_labels, status_41(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__40(D)->increment
	je	.L323	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp198, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_91->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_91->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	(%rsp), %rax	; %sfp, _81
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_91->is_get
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rax, 0(%rbp)	; _81, arg_91->value.label
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp199, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_90->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_90->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_90->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_90->arg3
; src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rdi	; _23->instructions, _23->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp200, block
; src/tac.c:100:     block->label = label;
	movq	(%rsp), %rax	; %sfp, _81
	movq	%rax, 0(%rbp)	; _81, block_88->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp201, block_88->instructions
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rdi	; _25->blocks, _25->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:593:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; block, status_41(D)->current_block
; src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%r12), %rdi	; for__40(D)->increment, for__40(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
.L323:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp202, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_93->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_93->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _71, arg_93->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_93->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__40(D)->condition
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_92->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp203, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_92->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_92->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_92->arg3
; src/tac.c:598:     if (for_->condition == NULL)
	je	.L326	;,
.L324:
; src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rdi	; _29->instructions, _29->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp206, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _69, block_96->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp207, block_96->instructions
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_41(D)->current_subroutine, status_41(D)->current_subroutine
	movq	32(%rax), %rdi	; _31->blocks, _31->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:604:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_41(D)->current_block
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
.L318:
; src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__40(D)->condition
	je	.L320	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp193, arg
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_41(D)->start_labels, status_41(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _71, arg_85->value.label
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L319	;
	.p2align 4,,10
	.p2align 3
.L316:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp187, arg
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _70, arg_80->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_80->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_79->arg1
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp188, inst
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_79->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_79->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_79->arg3
; src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_41(D)->current_block, status_41(D)->current_block
	movq	8(%rax), %rdi	;, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L317	;
	.p2align 4,,10
	.p2align 3
.L326:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp204, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_95->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_95->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _70, arg_95->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_95->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_94->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp205, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_94->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_94->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_94->arg3
	jmp	.L324	;
	.p2align 4,,10
	.p2align 3
.L320:
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp194, arg
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_41(D)->start_labels, status_41(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _70, arg_86->value.label
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L319	;
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp141, while_
	movq	%rsi, %rdi	; status,
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp142, status
	subq	$24, %rsp	;,
	call	create_var.part.0.constprop.0	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r12	; tmp143, _56
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp144, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_55->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_55->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _56, arg_55->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_55->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp145, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_54->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_54->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_54->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_54->arg3
; src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _1->instructions, _1->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp146, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; _56, block_52->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp147, block_52->instructions
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rdi	; _3->blocks, _3->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:615:     status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; block, status_21(D)->current_block
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %rbp	; tmp148, _51
	call	create_var.part.0.constprop.0	;
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	(%r15), %rdi	; while__25(D)->condition, while__25(D)->condition
	movq	%rbx, %rsi	; status,
	movq	%rax, %r13	; tmp149, _50
	call	tac_expression	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp151, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_49->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_49->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _50, arg_49->value.label
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_49->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; _51, arg_48->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_48->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_48->type
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_48->is_get
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
	movq	%r14, 16(%rax)	; arg, inst_47->arg3
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_47->arg2
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; condition, inst_47->arg1
; src/tac.c:214:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_47->type
; src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _6->instructions, _6->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp154, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; _51, block_45->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r14, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r14)	; tmp155, block_45->instructions
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rdi	; _8->blocks, _8->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:625:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; block, status_21(D)->current_block
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_44->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp156, arg
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_21(D)->start_labels, status_21(D)->start_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_44->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_44->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _56, arg_44->value.label
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_43->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp157, arg
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_21(D)->end_labels, status_21(D)->end_labels
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_43->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_43->type
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _50, arg_43->value.label
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r15), %rdi	; while__25(D)->body, while__25(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp158, body_statements
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L328	;
	.p2align 4,,10
	.p2align 3
.L329:
; src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L328:
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp159, statement
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L329	;,
; src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_21(D)->start_labels, status_21(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_21(D)->end_labels, status_21(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp160, arg
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _56, arg_60->value.label
; src/tac.c:224:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_60->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_60->type
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_60->is_get
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp161, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_59->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_59->arg2
; src/tac.c:214:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_59->type
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_59->arg3
; src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _15->instructions, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp162, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; _50, block_57->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp163, block_57->instructions
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_21(D)->current_subroutine, status_21(D)->current_subroutine
	movq	32(%rax), %rdi	; _17->blocks, _17->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:641:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_21(D)->current_block
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
	pushq	%r15	;
	movq	%rdi, %r15	; tmp120, function
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp121, status
	subq	$40, %rsp	;,
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)]
; src/tac.c:315: void tac_function(Function* function, TACStatus* status) {
	movq	%rdi, 8(%rsp)	; function, %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movaps	%xmm0, 16(%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:89:     subroutine->name = name;
	movdqa	16(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp122, subroutine
; src/tac.c:89:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_43]
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp123, subroutine_43->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp124, subroutine_43->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp125, subroutine_43->blocks
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_18(D)->tac, status_18(D)->tac
; src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_18(D)->current_subroutine
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r15), %rdi	; function_15(D)->parameters, function_15(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp126, parameters
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L332	;
	.p2align 4,,10
	.p2align 3
.L334:
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_43->parameters, subroutine_43->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L332:
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L346	;,
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	; parameter_24->name, _7
	movq	(%rax), %r14	; parameter_24->type, _6
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r15, %r15	; _7
	je	.L337	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %edx	; _6->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	;
	jne	.L335	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _6->ast_node.class, _6->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r13	; status_18(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _6->ast_node.class, status_18(D)->current_class
.L335:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r15, %rdi	; _7,
	call	search_var	;
	movq	%rax, %rsi	; tmp128, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %eax	; _6->kind,
	testl	%eax, %eax	;
	jne	.L336	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rbx)	; current_class, status_18(D)->current_class
.L336:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L334	;,
.L337:
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	movq	%r15, %rdi	; _7,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp127, var
	jmp	.L334	;
	.p2align 4,,10
	.p2align 3
.L346:
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	movq	%rax, %r14	; tmp130, _37
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp131, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _37, block_35->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_43->blocks, subroutine_43->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp132, block_35->instructions
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	8(%rsp), %rax	; %sfp, function
; src/tac.c:329:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_18(D)->current_block
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rax), %rdi	; function_15(D)->body, function_15(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp133, statements
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L339	;
	.p2align 4,,10
	.p2align 3
.L340:
; src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L339:
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp134, statement
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L340	;,
; src/tac.c:336:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_18(D)->current_subroutine
; src/tac.c:338: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	tac_function, .-tac_function
	.p2align 4
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp156, method
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp157, status
	subq	$40, %rsp	;,
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)]
; src/tac.c:339: void tac_method(Method* method, TACStatus* status) {
	movq	%rdi, 8(%rsp)	; method, %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movaps	%xmm0, 16(%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)], %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:89:     subroutine->name = name;
	movdqa	16(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %rbp	; tmp158, subroutine
; src/tac.c:89:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_30(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_71]
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbp)	; tmp159, subroutine_71->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbp)	; tmp160, subroutine_71->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp161, subroutine_71->blocks
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_33(D)->tac, status_33(D)->tac
; src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_33(D)->current_subroutine
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r15), %rdi	; method_30(D)->parameters, method_30(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp162, parameters
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L348	;
	.p2align 4,,10
	.p2align 3
.L350:
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_71->parameters, subroutine_71->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L348:
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L363	;,
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	; parameter_39->name, _7
	movq	(%rax), %r14	; parameter_39->type, _6
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r15, %r15	; _7
	je	.L353	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %edx	; _6->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	;
	jne	.L351	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _6->ast_node.class, _6->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r13	; status_33(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _6->ast_node.class, status_33(D)->current_class
.L351:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r15, %rdi	; _7,
	call	search_var	;
	movq	%rax, %rsi	; tmp164, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %eax	; _6->kind,
	testl	%eax, %eax	;
	jne	.L352	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rbx)	; current_class, status_33(D)->current_class
.L352:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L350	;,
.L353:
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	movq	%r15, %rdi	; _7,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp163, var
	jmp	.L350	;
	.p2align 4,,10
	.p2align 3
.L363:
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	movq	%rax, %r14	; tmp166, _57
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp167, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _57, block_55->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_71->blocks, subroutine_71->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp168, block_55->instructions
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_33(D)->current_class, status_33(D)->current_class
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:353:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_33(D)->current_block
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _12->name, _12->name
	movq	8(%rax), %rdi	; _13->name, _13->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp169, _15
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rsp), %rax	; %sfp, method
	movq	(%rax), %rax	; method_30(D)->name, method_30(D)->name
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _16->name, _16->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp170
	je	.L364	;,
.L355:
; src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	8(%rsp), %rax	; %sfp, method
	movq	24(%rax), %rdi	; method_30(D)->body, method_30(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp175, statements
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L356	;
	.p2align 4,,10
	.p2align 3
.L357:
; src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L356:
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp176, statement
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L357	;,
; src/tac.c:364:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_33(D)->current_subroutine
; src/tac.c:366: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L364:
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	; status_33(D)->current_class, status_33(D)->current_class
	movq	%rbx, %rsi	; status,
	movq	(%rax), %rdi	; _19->name, _19->name
	call	create_var.part.0.constprop.1	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %rbp	; tmp171, _59
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _59, tmp148
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _59->type, tmp148
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_95->is_get
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp172, arg
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp148, MEM <vector(2) long unsigned int> [(void *)arg_95]
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %r15	; status_33(D)->current_class, _21
; src/tac.c:224:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_95->kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp173, arg
; src/tac.c:224:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_83->kind
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	24(%r15), %rax	; MEM[(long long int *)_21 + 24B], _85
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_83->is_get
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rax, 0(%rbp)	; _85, arg_83->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
	movq	%rax, 8(%rbp)	; name_int, arg_83->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r12), %rdi	; block_55->instructions, block_55->instructions
; src/tac.c:214:     inst->type = type;
	movl	$18, 24(%rax)	;, inst_58->type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp174, inst
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_58->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg, inst_58->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_58->arg3
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L355	;
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.p2align 4
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp168, class
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp169, status
	subq	$24, %rsp	;,
; src/tac.c:369:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_13(D)->current_class
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_14(D)->members, class_14(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%rbp), %r14	; class_14(D)->name, _2
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %r12	; tmp170, members
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp171, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%r14, %xmm2	; _2, _2
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%r13, %rsi	; table,
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, %xmm0	; tmp172, tmp138
	punpcklqdq	%xmm2, %xmm0	; _2, tmp138
	movups	%xmm0, 0(%r13)	; tmp138, MEM <vector(2) long unsigned int> [(void *)table_28]
; src/tac.c:374:     attr_table->size = class->size;
	movq	24(%rbp), %rax	; class_14(D)->size, class_14(D)->size
	movq	%rax, 16(%r13)	; class_14(D)->size, table_28->size
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_13(D)->tac, status_13(D)->tac
	movq	(%rax), %rdi	; _4->attribute_tables, _4->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L366:
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L394	;,
.L384:
; src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %ecx	; member_23->type, _6
; src/tac.c:377:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L367	;,
	cmpl	$1, %ecx	;, _6
	je	.L368	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	leaq	.LC25(%rip), %rdx	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	jne	.L384	;,
.L394:
; src/tac.c:389:     status->current_class = NULL;
	movq	$0, 24(%rbx)	;, status_13(D)->current_class
; src/tac.c:391: }
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
.L368:
; src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %r13	; member_23->content.variable, _8
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rbx), %rax	; status_13(D)->tac, status_13(D)->tac
	movq	(%rax), %rdi	; _40->attribute_tables, _40->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp173, attr_table
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_13(D)->tac, status_13(D)->tac
	movq	%rbp, %rsi	; attr_table,
	movq	(%rax), %rdi	; _43->attribute_tables, _43->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	0(%r13), %r14	; _8->type, _45
	movq	8(%r13), %r13	; _8->name, _46
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp174, attr
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r13, %r13	; _46
	je	.L371	;,
; src/tac.c:158:         Class* current_class = NULL;
	movq	$0, 8(%rsp)	;, %sfp
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %esi	; _45->kind,
	testl	%esi, %esi	;
	jne	.L372	;,
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %rax	; status_13(D)->current_class, current_class
	movq	%rax, 8(%rsp)	; current_class, %sfp
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _45->ast_node.class, _45->ast_node.class
	movq	%rax, 24(%rbx)	; _45->ast_node.class, status_13(D)->current_class
.L372:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r13, %rdi	; _46,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %ecx	; _45->kind,
	testl	%ecx, %ecx	;
	jne	.L373	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	8(%rsp), %rdx	; %sfp, current_class
	movq	%rdx, 24(%rbx)	; current_class, status_13(D)->current_class
.L373:
; src/tac.c:166:         if (var != NULL) {
	testq	%rax, %rax	; var
	je	.L374	;,
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; var, tmp148
	movq	%r14, %xmm1	; _45, _45
	punpcklqdq	%xmm1, %xmm0	; _45, tmp148
	movups	%xmm0, (%r15)	; tmp148, MEM <vector(2) long unsigned int> [(void *)attr_48]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%rbp), %rax	; attr_table_42->size, prephitmp_18
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%r15)	; prephitmp_18, attr_48->offset
.L375:
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %r14	; name_int, _45
	je	.L392	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %r14	; name_float, _45
	je	.L392	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %r14	; name_string, _45
	je	.L392	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %r14	; name_bool, _45
	je	.L393	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %r14	; name_void, _45
	je	.L393	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %edx	; _45->kind,
	testl	%edx, %edx	;
	jne	.L382	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%r14), %rdx	; _45->ast_node.class, _45->ast_node.class
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	0(%rbp), %rdi	; attr_table_42->attributes, _54
; src/tac.c:202:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	; _70->size, prephitmp_18
	movq	%rax, 16(%rbp)	; prephitmp_18, attr_table_42->size
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _54
	jne	.L383	;,
	.p2align 4,,10
	.p2align 3
.L395:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L366	;
	.p2align 4,,10
	.p2align 3
.L393:
; src/tac.c:202:         table->size += get_type_size(type);
	addq	$1, %rax	;, prephitmp_18
.L376:
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	0(%rbp), %rdi	; attr_table_42->attributes, _54
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%rax, 16(%rbp)	; prephitmp_18, attr_table_42->size
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _54
	je	.L395	;,
.L383:
; src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%r15, %rsi	; attr,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L366	;
	.p2align 4,,10
	.p2align 3
.L367:
; src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_23->content.method, member_23->content.method
	movq	%rbx, %rsi	; status,
	call	tac_method	;
; src/tac.c:380:                 break;
	jmp	.L366	;
	.p2align 4,,10
	.p2align 3
.L382:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r14), %rcx	; _45->name, _45->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC4(%rip), %rdx	;, tmp156
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:202:         table->size += get_type_size(type);
	movq	16(%rbp), %rax	; attr_table_42->size, tmp189
	.p2align 4,,10
	.p2align 3
.L392:
	addq	$8, %rax	;, prephitmp_18
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L376	;
	.p2align 4,,10
	.p2align 3
.L371:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r14, %rsi	; _45,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r14, %xmm3	; _45, _45
	movq	%rax, %xmm0	; tmp176, tmp149
	punpcklqdq	%xmm3, %xmm0	; _45, tmp149
	movups	%xmm0, (%r15)	; tmp149, MEM <vector(2) long unsigned int> [(void *)attr_48]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%rbp), %rax	; attr_table_42->size, prephitmp_18
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%r15)	; prephitmp_18, attr_48->offset
; src/tac.c:18:     if (type == NULL)
	testq	%r14, %r14	; _45
	je	.L376	;,
	jmp	.L375	;
	.p2align 4,,10
	.p2align 3
.L374:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r14, %rsi	; _45,
	movq	%r13, %rdi	; _46,
	call	create_var.part.0	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r14, %xmm4	; _45, _45
	movq	%rax, %xmm0	; tmp178, tmp162
	punpcklqdq	%xmm4, %xmm0	; _45, tmp162
	movups	%xmm0, (%r15)	; tmp162, MEM <vector(2) long unsigned int> [(void *)attr_48]
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%rbp), %rax	; attr_table_42->size, prephitmp_18
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%r15)	; prephitmp_18, attr_48->offset
	jmp	.L375	;
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC26:
	.string	"main"
	.text
	.p2align 4
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC26(%rip), %r14	;, tmp115
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
.L397:
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, code_member
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L405	;,
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L406	;,
; src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L407	;,
; src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L397	;,
; src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L397	;
	.p2align 4,,10
	.p2align 3
.L406:
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
	jne	.L397	;,
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L397	;
	.p2align 4,,10
	.p2align 3
.L407:
; src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	tac_class	;
	jmp	.L397	;
	.p2align 4,,10
	.p2align 3
.L405:
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
