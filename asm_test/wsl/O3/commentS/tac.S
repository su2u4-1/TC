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
	.type	load_rvalue.part.0, @function
load_rvalue.part.0:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp110, arg
	pushq	%r12	;
	movq	%rsi, %r12	; tmp111, status
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rbp	; arg_1(D)->type, _2
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%r12), %r14	; status_3(D)->temp_count, _38
; src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp100
; src/tac.c:172:     var->original_name = original_name;
	movq	$0, (%rax)	;, var_31->original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %rbx	; tmp112, var
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r14), %rax	;, tmp99
	movq	%rax, 72(%r12)	; tmp99, status_3(D)->temp_count
; src/tac.c:183:     var->name = create_string("", 32);
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _44, var_31->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp113, _44
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r14	;, _38
	je	.L58	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %r9	; _38,
	movl	$116, %r8d	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC2(%rip), %rcx	;, tmp102
	movq	$-1, %rdx	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L56:
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%r12), %rax	; status_3(D)->current_subroutine, status_3(D)->current_subroutine
	movq	%rbx, %rsi	; var,
; src/tac.c:188:     var->type = type;
	movq	%rbp, 16(%rbx)	; _2, var_31->type
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	24(%rax), %rdi	; _51->local_vars, _51->local_vars
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbx, %xmm0	; var, tmp105
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rbx), %xmm0	; var_31->type, tmp105
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp114, <retval>
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_19->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp105, MEM <vector(2) long unsigned int> [(void *)arg_19]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_19->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; arg, inst_6->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp115, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; <retval>, inst_6->arg1
; src/tac.c:215:     inst->type = type;
	movl	$23, 24(%rax)	;, inst_6->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_6->arg3
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%r12), %rax	; status_3(D)->current_block, status_3(D)->current_block
	movq	8(%rax), %rdi	; _7->instructions, _7->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:283: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L58:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	$116, %r8d	;,
	leaq	.LC1(%rip), %rcx	;, tmp101
	movq	$-1, %rdx	;,
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L56	;
	.size	load_rvalue.part.0, .-load_rvalue.part.0
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC4:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC5:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC6:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC7:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC8:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
	.section	.rodata.str1.1
.LC9:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC11:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC12:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC13:
	.string	"[Warning] Unsupported type for size lookup: %s\n"
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
	movq	%rdi, %rbp	; tmp441, variable_access
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp442, status
	subq	$24, %rsp	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movl	16(%rdi), %eax	; variable_access_127(D)->type,
	testl	%eax, %eax	;
	jne	.L60	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %r12	; variable_access_127(D)->content.name, _2
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%r12, %r12	; _2
	je	.L60	;,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%r12), %eax	; _2->kind, _3
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	;, tmp301
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	;, tmp301
	jbe	.L154	;,
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _3
	je	.L155	;,
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%r12), %r13	; _2->type, _8
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %eax	; _8->kind,
	testl	%eax, %eax	;
	jne	.L69	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; _8->ast_node.class, _8->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rsi), %r14	; status_128(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rsi)	; _8->ast_node.class, status_128(D)->current_class
.L69:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; _2,
	call	search_var	;
	movq	%rax, %rbp	; tmp449, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %eax	; _8->kind,
	testl	%eax, %eax	;
	jne	.L70	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_128(D)->current_class
.L70:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	jne	.L71	;,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%r13, %rsi	; _8,
	movq	%r12, %rdi	; _2,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp450, var
.L71:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp309
	movhps	16(%rbp), %xmm0	;, tmp309
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp451, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp309,* <retval>
; src/tac.c:757:             return result;
	jmp	.L59	;
	.p2align 4,,10
	.p2align 3
.L60:
; src/tac.c:760:     if (variable_access->base == NULL) {
	movq	0(%rbp), %rdi	; variable_access_127(D)->base, _10
; src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _10
	je	.L156	;,
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_variable_access	;
	movq	%rax, %r13	; tmp452, base
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; base
	je	.L76	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _12->is_get
	jne	.L157	;,
.L75:
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%rbp), %ecx	; variable_access_127(D)->type, _14
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _14
	je	.L158	;,
; src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _14
	je	.L159	;,
; src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _14
	jne	.L98	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%r13), %ecx	; _248->kind, _62
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	; _62
	jne	.L99	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%r13), %rax	; _248->type, _63
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	32(%rax), %edi	; _63->kind,
	testl	%edi, %edi	;
	je	.L160	;,
.L100:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; prephitmp_561->name,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC12(%rip), %rdx	;, tmp383
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L73:
; src/tac.c:763:         return NULL;
	xorl	%r12d, %r12d	; <retval>
.L59:
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
.L158:
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r13), %rax	; _248->type, _15
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _15->kind, _16
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp315
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp315
	jbe	.L161	;,
; src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _15->ast_node.scope, scope
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _16
	jne	.L79	;,
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_183].class_scope, scope
.L79:
; src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%rbp), %rax	; variable_access_127(D)->content.attr_name, variable_access_127(D)->content.attr_name
	movq	8(%rax), %rsi	; _20->name, _20->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp454, attr
; src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	; attr
	je	.L162	;,
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	; attr_186->kind, _27
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	;, _27
	je	.L163	;,
; src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _27
	je	.L164	;,
; src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _27
	jne	.L165	;,
	movq	(%r12), %rsi	; attr_186->type, attr_186->type
	movl	$116, %edx	;,
	movq	%rbx, %rcx	; status,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp461, _202
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _202, tmp346
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%edx, %edx	; current_class
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _202->type, tmp346
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_384->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp462, <retval>
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp346, MEM <vector(2) long unsigned int> [(void *)arg_384]
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%rbp), %r15	; variable_access_127(D)->content.attr_name, _43
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_384->kind
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%r15), %r14	; _43->type, _44
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %r9d	; _44->kind,
	testl	%r9d, %r9d	;
	jne	.L90	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _44->ast_node.class, _44->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %rdx	; status_128(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _44->ast_node.class, status_128(D)->current_class
.L90:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r15, %rdi	; _43,
	movq	%rdx, (%rsp)	; current_class, %sfp
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %r8d	; _44->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp463, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r8d, %r8d	;
	jne	.L91	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	(%rsp), %rdx	; %sfp, current_class
	movq	%rdx, 24(%rbx)	; current_class, status_128(D)->current_class
.L91:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	je	.L166	;,
.L92:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp349
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _383->type, tmp349
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp465, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_364->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp349, MEM <vector(2) long unsigned int> [(void *)arg_364]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_364->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_201->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp466, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_201->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%r14, 16(%rax)	; arg, inst_201->arg3
; src/tac.c:215:     inst->type = type;
	movl	$15, 24(%rax)	;, inst_201->type
; src/tac.c:799:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_128(D)->current_block, status_128(D)->current_block
	movq	8(%rax), %rdi	;, _47->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:802:         return temp;
	jmp	.L59	;
	.p2align 4,,10
	.p2align 3
.L155:
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r12), %rax	; _2->ast_node.class, _2->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rsi), %r13	; status_128(D)->current_class, current_class
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%r12, %rdi	; _2,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rsi)	; _2->ast_node.class, status_128(D)->current_class
; src/tac.c:163:         Var* var = search_var(original_name, status);
	call	search_var	;
	movq	%rax, %rbp	; tmp446, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %eax	; _2->kind,
	testl	%eax, %eax	;
	jne	.L67	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rbx)	; current_class, status_128(D)->current_class
.L67:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	jne	.L71	;,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%r12, %rsi	; _2,
	movq	%r12, %rdi	; _2,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp447, var
	jmp	.L71	;
	.p2align 4,,10
	.p2align 3
.L157:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; base,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp453, base
; src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	; base
	jne	.L75	;,
	.p2align 4,,10
	.p2align 3
.L76:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp314
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:769:         return NULL;
	jmp	.L73	;
	.p2align 4,,10
	.p2align 3
.L159:
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%r13), %rax	; _248->type, _248->type
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC9(%rip), %rsi	;, tmp358
	movq	8(%rax), %rdi	; _49->name, _49->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp467
	jne	.L167	;,
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%rbp), %rdi	; variable_access_127(D)->content.index, variable_access_127(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp468, _57
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _57
	je	.L97	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _57->is_get
	jne	.L168	;,
.L96:
	movq	name_int(%rip), %rsi	; name_int,
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp470, _206
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r14, %xmm0	; _206, tmp368
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r14), %xmm0	; _206->type, tmp368
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp471, <retval>
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_396->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp368, MEM <vector(2) long unsigned int> [(void *)arg_396]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_396->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_205->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp472, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_205->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; _57, inst_205->arg3
; src/tac.c:215:     inst->type = type;
	movl	$16, 24(%rax)	;, inst_205->type
; src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_128(D)->current_block, status_128(D)->current_block
	movq	8(%rax), %rdi	;, _60->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:823:         return temp;
	jmp	.L59	;
	.p2align 4,,10
	.p2align 3
.L99:
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rcx), %eax	;, tmp380
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	;, tmp380
	jbe	.L104	;,
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%r13), %rax	; _248->type, _63
	jmp	.L100	;
	.p2align 4,,10
	.p2align 3
.L160:
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _63->name, _63->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r15d, %r15d	; current_class
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp473, _67
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r13), %rax	; _248->type, _248->type
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _68->ast_node.class, _68->ast_node.class
	movq	16(%rax), %rdi	; _69->class_scope, _69->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %r14	; attr_141->type, _71
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %r13	; tmp474, attr
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %esi	; _71->kind,
	testl	%esi, %esi	;
	jne	.L101	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _71->ast_node.class, _71->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r15	; status_128(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _71->ast_node.class, status_128(D)->current_class
.L101:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r13, %rdi	; attr,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %ecx	; _71->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %r12	; tmp475, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	;
	jne	.L102	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r15, 24(%rbx)	; current_class, status_128(D)->current_class
.L102:
; src/tac.c:166:         if (var != NULL) {
	testq	%r12, %r12	; var
	jne	.L103	;,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r14, %rsi	; _71,
	movq	%r13, %rdi	; attr,
	call	create_var.part.0	;
	movq	%rax, %r12	; tmp476, var
.L103:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%r12, %xmm0	; var, tmp378
	movhps	16(%r12), %xmm0	; _427->type, tmp378
; src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	;, arg_408->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp477, base
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_408->is_get
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp378, MEM <vector(2) long unsigned int> [(void *)arg_408]
.L104:
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%r13)	;, base_528->kind
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	movq	%rax, (%rsp)	; tmp478, %sfp
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	je	.L105	;,
.L107:
; src/tac.c:834:         long long arg_count = 0;
	xorl	%r14d, %r14d	; arg_count
.L106:
; src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%rbp), %rdi	; variable_access_127(D)->content.args, variable_access_127(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp487, %sfp
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L113	;
	.p2align 4,,10
	.p2align 3
.L115:
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rbp), %rax	; _214->type, _101
	xorl	%r12d, %r12d	; _9
; src/tac.c:18:     if (type == NULL)
	testq	%rax, %rax	; _101
	je	.L116	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, _101
	je	.L117	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, _101
	je	.L117	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, _101
	je	.L117	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, _101
	movl	$1, %r12d	;, _9
	je	.L116	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, _101
	je	.L116	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %edx	; _101->kind,
	testl	%edx, %edx	;
	jne	.L118	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	; _101->ast_node.class, _101->ast_node.class
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	24(%rax), %r12	; _469->size, _9
.L116:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:848:             arg_count++;
	addq	$1, %r14	;, arg_count
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_451->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r15	; tmp490, arg
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r12, (%rax)	; _9, arg_451->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r15)	;, arg_451->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r15)	; name_int, arg_451->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	(%rsp), %rdi	; %sfp,
; src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_211->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp491, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r15, (%rax)	; arg, inst_211->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; _100, inst_211->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_211->arg3
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L113:
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp492, arg_expr
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L120	;,
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp488, _100
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _100
	je	.L114	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _100->is_get
	je	.L115	;,
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _100,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp489, _100
	jmp	.L115	;
	.p2align 4,,10
	.p2align 3
.L121:
; src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	; status_128(D)->current_block, status_128(D)->current_block
	movq	8(%rax), %rdi	; _107->instructions, _107->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L120:
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp493, arg
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	; arg
	jne	.L121	;,
	movq	8(%r13), %rsi	; base_528->type, base_528->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %rbp	; tmp494, _216
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rbp, %xmm0	; _216, tmp409
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%rbp), %xmm0	; _216->type, tmp409
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp495, <retval>
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_486->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp409, MEM <vector(2) long unsigned int> [(void *)arg_486]
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_486->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%r14, (%rax)	; arg_count, arg_474->value.int_value
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp496, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_474->kind
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_474->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbp)	; name_int, arg_474->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; base, inst_215->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp497, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; <retval>, inst_215->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_215->arg3
; src/tac.c:215:     inst->type = type;
	movl	$22, 24(%rax)	;, inst_215->type
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	; status_128(D)->current_block, status_128(D)->current_block
	movq	8(%rax), %rdi	;, _113->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:856:         return temp;
	jmp	.L59	;
	.p2align 4,,10
	.p2align 3
.L163:
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _248->type, _248->type
	movq	8(%rbp), %rdx	; variable_access_127(D)->content.attr_name, variable_access_127(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _30->name, _30->name
	movq	8(%rax), %r8	; _28->name,
	leaq	.LC7(%rip), %rdx	;, tmp332
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L154:
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %r13	;* attr, _33
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %eax	;,
	testl	%eax, %eax	;
	jne	.L82	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	;, _33->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r14	; status_128(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _33->ast_node.class, status_128(D)->current_class
.L82:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; attr,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %r15d	;,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp455, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r15d, %r15d	;
	jne	.L83	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_128(D)->current_class
.L83:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	je	.L169	;,
.L84:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp334
	movhps	16(%rbp), %xmm0	;, tmp334
; src/tac.c:225:     arg->kind = kind;
	movl	$7, 16(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp457, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp334,* <retval>
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L59	;
	.p2align 4,,10
	.p2align 3
.L165:
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _248->type, _248->type
	movq	8(%rbp), %rdx	; variable_access_127(D)->content.attr_name, variable_access_127(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _39->name, _39->name
	movq	8(%rax), %r8	; _37->name,
	leaq	.LC8(%rip), %rdx	;, tmp344
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:795:             return NULL;
	jmp	.L73	;
	.p2align 4,,10
	.p2align 3
.L156:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp312
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:763:         return NULL;
	jmp	.L73	;
	.p2align 4,,10
	.p2align 3
.L98:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC14(%rip), %rdx	;, tmp415
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:860:         return NULL;
	jmp	.L73	;
	.p2align 4,,10
	.p2align 3
.L169:
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r13, %rsi	; _33,
	movq	%r12, %rdi	; attr,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp456, var
	jmp	.L84	;
	.p2align 4,,10
	.p2align 3
.L166:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r14, %rsi	; _44,
	movq	%r15, %rdi	; _43,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp464, var
	jmp	.L92	;
	.p2align 4,,10
	.p2align 3
.L118:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _101->name, _101->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC13(%rip), %rdx	;, tmp404
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L117:
	movl	$8, %r12d	;, _9
	jmp	.L116	;
	.p2align 4,,10
	.p2align 3
.L167:
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	0(%r13), %rax	; _248->value.variable, _248->value.variable
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	.LC10(%rip), %rdx	;, tmp363
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	; _52->original_name, _52->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _53->name, _53->name
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:808:             return NULL;
	jmp	.L73	;
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _57,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp469, _57
; src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	; _57
	jne	.L96	;,
.L97:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp366
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:814:             return NULL;
	jmp	.L73	;
	.p2align 4,,10
	.p2align 3
.L164:
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %r13	; attr_186->type, _35
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %r11d	; _35->kind,
	testl	%r11d, %r11d	;
	jne	.L86	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; _35->ast_node.class, _35->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r14	; status_128(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _35->ast_node.class, status_128(D)->current_class
.L86:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; attr,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %r10d	; _35->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rbp	; tmp458, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%r10d, %r10d	;
	jne	.L87	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_128(D)->current_class
.L87:
; src/tac.c:166:         if (var != NULL) {
	testq	%rbp, %rbp	; var
	jne	.L88	;,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%r13, %rsi	; _35,
	movq	%r12, %rdi	; attr,
	call	create_var.part.0	;
	movq	%rax, %rbp	; tmp459, var
.L88:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbp, %xmm0	; var, tmp337
	movhps	16(%rbp), %xmm0	;, tmp337
; src/tac.c:225:     arg->kind = kind;
	movl	$8, 16(%rax)	;, arg_344->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp460, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movups	%xmm0, (%rax)	; tmp337,* <retval>
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L59	;
	.p2align 4,,10
	.p2align 3
.L105:
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%r13), %rax	; base_528->type, base_528->type
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%rax), %rdi	; _80->name, _80->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp479, _82
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	0(%r13), %rax	; base_528->value.subroutine, base_528->value.subroutine
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	; _83->original_name, _83->original_name
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rdi	; _84->name, _84->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	; tmp480
	je	.L107	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	0(%rbp), %rax	; variable_access_127(D)->base, variable_access_127(D)->base
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$8, %edi	;,
	movq	(%rax), %r8	; _87->base,
	call	*create_primary@GOTPCREL(%rip)	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rdx	; tmp481, _89
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	*create_expression@GOTPCREL(%rip)	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rdi	; tmp482, _90
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	;
	movq	%rax, %r15	; tmp483, _91
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _91
	je	.L108	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _91->is_get
	jne	.L170	;,
.L109:
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%r15), %rax	; _210->type, _92
	xorl	%edx, %edx	; prephitmp_502
; src/tac.c:18:     if (type == NULL)
	testq	%rax, %rax	; _92
	je	.L110	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %rax	; name_int, _92
	je	.L111	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %rax	; name_float, _92
	je	.L111	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %rax	; name_string, _92
	je	.L111	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %rax	; name_bool, _92
	movl	$1, %edx	;, prephitmp_502
	je	.L110	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %rax	; name_void, _92
	je	.L110	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rax)	;, _92->kind
	jne	.L112	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rax), %rax	; _92->ast_node.class, _92->ast_node.class
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	24(%rax), %rdx	; _446->size, prephitmp_502
.L110:
	movq	%rdx, 8(%rsp)	; prephitmp_502, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	8(%rsp), %rdx	; %sfp, prephitmp_502
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp485, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_428->kind
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	; prephitmp_502, arg_428->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_428->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_428->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	(%rsp), %rdi	; %sfp,
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_207->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp486, inst
; src/tac.c:840:             arg_count++;
	movl	$1, %r14d	;, arg_count
; src/tac.c:215:     inst->type = type;
	movl	$17, 24(%rax)	;, inst_207->type
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; _91, inst_207->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_207->arg3
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L106	;
	.p2align 4,,10
	.p2align 3
.L161:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _15->name, _15->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC5(%rip), %rdx	;, tmp318
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:775:             return NULL;
	jmp	.L73	;
.L162:
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; _248->type, _248->type
	movq	8(%rbp), %rdx	; variable_access_127(D)->content.attr_name, variable_access_127(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _24->name, _24->name
	movq	8(%rax), %r8	; _22->name,
	leaq	.LC6(%rip), %rdx	;, tmp326
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	jmp	.L73	;
.L170:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _91,
	call	load_rvalue.part.0	;
	movq	%rax, %r15	; tmp484, _91
	jmp	.L109	;
.L112:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _92->name, _92->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC13(%rip), %rdx	;, tmp398
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L111:
	movl	$8, %edx	;, prephitmp_502
	jmp	.L110	;
	.section	.text.unlikely
	.type	tac_variable_access.cold, @function
tac_variable_access.cold:
.L108:
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _516
	ud2	
.L114:
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _632
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
	movl	8(%rdi), %ecx	; primary_34(D)->type,
; src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L172	;,
	leaq	.L174(%rip), %rdx	;, tmp137
	movq	%rsi, %rbp	; tmp175, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp139
	addq	%rdx, %rax	; tmp137, tmp140
	jmp	*%rax	; tmp140
	.section	.rodata
	.align 4
	.align 4
.L174:
	.long	.L182-.L174
	.long	.L181-.L174
	.long	.L180-.L174
	.long	.L179-.L174
	.long	.L178-.L174
	.long	.L177-.L174
	.long	.L176-.L174
	.long	.L175-.L174
	.long	.L173-.L174
	.text
	.p2align 4,,10
	.p2align 3
.L175:
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_34(D)->value.operand, primary_34(D)->value.operand
	call	tac_primary	;
	movq	%rax, %r12	; tmp188, _14
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _14
	je	.L185	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _14->is_get
	jne	.L195	;,
.L186:
	movq	8(%r12), %rsi	; _82->type, _82->type
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp190, _79
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r13, %xmm0	; _79, tmp159
	movhps	16(%r13), %xmm0	; _79->type, tmp159
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_180->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp191, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_180->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp159, MEM <vector(2) long unsigned int> [(void *)arg_180]
; src/tac.c:721:             if (operand->type == name_int)
	movq	8(%r12), %rax	; _82->type, _16
; src/tac.c:721:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _16
	je	.L196	;,
; src/tac.c:723:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _16
	je	.L197	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _16->name, _16->name
	movq	stderr(%rip), %rdi	; stderr,
	xorl	%eax, %eax	;
; src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC17(%rip), %rdx	;, tmp166
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L199:
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
.L173:
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	;* primary, primary_34(D)->value.var
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
.L182:
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	;* primary, primary_34(D)->value.literal_value
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
	movl	$1, 16(%rax)	;, arg_108->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp177, <retval>
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rbp, (%rax)	; _3, arg_108->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	;,
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbx)	; name_int,
.L171:
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
.L181:
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	;* primary, primary_34(D)->value.literal_value
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
	movl	$2, 16(%rax)	;, arg_120->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp179, <retval>
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _5, arg_120->value.float_value
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
.L180:
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %xmm0	; primary_34(D)->value.literal_value, _6
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	%xmm0, 8(%rsp)	; _6, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:241:             arg->value.string_value = (string)value;
	movq	8(%rsp), %xmm0	; %sfp, _6
; src/tac.c:225:     arg->kind = kind;
	movl	$3, 16(%rax)	;, arg_132->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp180, <retval>
; src/tac.c:241:             arg->value.string_value = (string)value;
	movhps	name_string(%rip), %xmm0	; name_string, tmp146
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:241:             arg->value.string_value = (string)value;
	movups	%xmm0, (%rax)	; tmp146, MEM <vector(2) long unsigned int> [(void *)arg_132]
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
.L179:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_144->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp181, <retval>
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$1, (%rax)	;, arg_144->value.bool_value
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
.L178:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$4, 16(%rax)	;, arg_156->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp182, <retval>
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	$0, (%rax)	;, arg_156->value.bool_value
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
.L177:
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_34(D)->value.expr, primary_34(D)->value.expr
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
.L176:
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_34(D)->value.operand, primary_34(D)->value.operand
	call	tac_primary	;
	movq	%rax, %r13	; tmp183, _9
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _9
	je	.L184	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L198	;,
.L184:
	movq	name_bool(%rip), %rsi	; name_bool,
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r12	; tmp185, _75
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; _75, tmp153
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _75->type, tmp153
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp186, <retval>
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_168->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp153, MEM <vector(2) long unsigned int> [(void *)arg_168]
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_168->kind
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r13, 8(%rax)	; _9, inst_74->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp187, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; <retval>, inst_74->arg1
; src/tac.c:215:     inst->type = type;
	movl	$13, 24(%rax)	;, inst_74->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_74->arg3
; src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_35(D)->current_block, status_35(D)->current_block
	movq	8(%rax), %rdi	;, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:742: }
	addq	$24, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L172:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	; <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp171
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L199	;
	.p2align 4,,10
	.p2align 3
.L197:
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
	movq	%r12, 16(%rax)	; _14,
.L188:
; src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_35(D)->current_block, status_35(D)->current_block
	movq	8(%rax), %rdi	;, _23->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:732:             return temp;
	jmp	.L171	;
	.p2align 4,,10
	.p2align 3
.L195:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _14,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp189, _14
	jmp	.L186	;
	.p2align 4,,10
	.p2align 3
.L198:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; _9,
	call	load_rvalue.part.0	;
	movq	%rax, %r13	; tmp184, _9
	jmp	.L184	;
	.p2align 4,,10
	.p2align 3
.L196:
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
	movq	%r12, 16(%rax)	; _14,
	jmp	.L188	;
	.section	.text.unlikely
	.type	tac_primary.cold, @function
tac_primary.cold:
.L185:
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8, %rax	; MEM[(struct Arg *)0B].type, _286
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
	cmpl	$19, 24(%rdi)	;, expression_26(D)->operator
	je	.L221	;,
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_26(D)->right, expression_26(D)->right
	call	tac_expression	;
	movq	%rax, %rbx	; tmp146, <retval>
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L202	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _4->is_get
	jne	.L222	;,
.L202:
; src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r12), %eax	; expression_26(D)->operator,
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	(%r12), %rdi	; expression_26(D)->expr_left, pretmp_101
	cmpl	$18, %eax	;, _5
	ja	.L203	;,
	leaq	CSWTCH.47(%rip), %rdx	;, tmp125
	movq	%rbp, %rsi	; status,
	movl	(%rdx,%rax,4), %r13d	; CSWTCH.47[_5], _40
	call	tac_expression	;
	movq	%rax, %r14	; tmp148, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_26(D)->operator, expression_26(D)->operator
	subl	$13, %eax	;, tmp127
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp127
	ja	.L204	;,
; src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, %r13d	;, _40
	jne	.L210	;,
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_105->kind,
	testl	%eax, %eax	;
	jne	.L223	;,
.L207:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_50->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp153, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_50->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; <retval>, inst_50->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_50->arg3
; src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%r14)	;, left_105->is_get
	jne	.L224	;,
.L208:
; src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _15->instructions, _15->instructions
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
.L203:
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	%rbp, %rsi	; status,
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	movl	$25, %r13d	;, _40
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	call	tac_expression	;
	movq	%rax, %r14	; tmp159, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r12), %eax	; expression_26(D)->operator, expression_26(D)->operator
	subl	$13, %eax	;, tmp142
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp142
	ja	.L204	;,
.L210:
	movq	8(%r14), %rsi	; left_107->type, left_107->type
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp149, _49
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _49, tmp130
	movhps	16(%r15), %xmm0	; _49->type, tmp130
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_86->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp150, arg
; src/tac.c:282:     return arg;
	movq	%r14, %r15	; left, _47
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_86->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp130, MEM <vector(2) long unsigned int> [(void *)arg_86]
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%r14)	;, left_107->is_get
	jne	.L225	;,
.L206:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r15, 8(%rax)	; _47, inst_45->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp152, inst
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; <retval>, inst_45->arg3
; src/tac.c:663:             right = temp;
	movq	%r12, %rbx	; arg, <retval>
; src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	; _40, inst_45->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_45->arg1
; src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	movl	16(%r14), %eax	; left_105->kind,
	testl	%eax, %eax	;
	je	.L207	;,
.L223:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L207	;
	.p2align 4,,10
	.p2align 3
.L204:
	movq	8(%r14), %rsi	; left_106->type, left_106->type
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var.part.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp155, _56
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r15, %xmm0	; _56, tmp137
	movhps	16(%r15), %xmm0	; _56->type, tmp137
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_98->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r12	; tmp156, arg
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_98->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp137, MEM <vector(2) long unsigned int> [(void *)arg_98]
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%r14)	;, left_106->is_get
	jne	.L226	;,
.L209:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; <retval>, inst_52->arg3
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp158, inst
; src/tac.c:673:         right = temp;
	movq	%r12, %rbx	; arg, <retval>
; src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	; _40, inst_52->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_52->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; left, inst_52->arg2
	jmp	.L208	;
	.p2align 4,,10
	.p2align 3
.L221:
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_26(D)->prim_left, expression_26(D)->prim_left
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
.L224:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$24, 24(%rax)	;, inst_51->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp154, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; left, inst_51->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbx, 8(%rax)	; <retval>, inst_51->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_51->arg3
	jmp	.L208	;
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; <retval>,
	call	load_rvalue.part.0	;
	movq	%rax, %rbx	; tmp147, <retval>
	jmp	.L202	;
	.p2align 4,,10
	.p2align 3
.L226:
	movq	%r14, %rdi	; left,
	movq	%rbp, %rsi	; status,
	call	load_rvalue.part.0	;
	movq	%rax, %r14	; tmp157, left
	jmp	.L209	;
	.p2align 4,,10
	.p2align 3
.L225:
	movq	%rbp, %rsi	; status,
	movq	%r14, %rdi	; left,
	call	load_rvalue.part.0	;
	movq	%rax, %r15	; tmp151, _47
	jmp	.L206	;
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp174, variable
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp175, status
	subq	$8, %rsp	;,
; src/tac.c:403:     if (is_attr) {
	testb	%dl, %dl	; tmp176
	je	.L228	;,
; src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_10(D)->tac, status_10(D)->tac
	movq	(%rax), %rdi	; _1->attribute_tables, _1->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp177, attr_table
; src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_10(D)->tac, status_10(D)->tac
	movq	%r14, %rsi	; attr_table,
	movq	(%rax), %rdi	; _3->attribute_tables, _3->attribute_tables
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	8(%rbp), %r13	; variable_9(D)->name, _6
	movq	0(%rbp), %r12	; variable_9(D)->type, _5
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp178, attr
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r13, %r13	; _6
	je	.L275	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r12), %edi	; _5->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r15d, %r15d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edi, %edi	;
	jne	.L232	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r12), %rax	; _5->ast_node.class, _5->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r15	; status_10(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _5->ast_node.class, status_10(D)->current_class
.L232:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r13, %rdi	; _6,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %esi	; _5->kind,
	testl	%esi, %esi	;
	jne	.L233	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r15, 24(%rbx)	; current_class, status_10(D)->current_class
.L233:
; src/tac.c:166:         if (var != NULL) {
	testq	%rax, %rax	; var
	je	.L276	;,
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; var, tmp168
	movq	%r12, %xmm1	; _5, _5
; src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rbp)	;, attr_17->offset
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	punpcklqdq	%xmm1, %xmm0	; _5, tmp168
	movups	%xmm0, 0(%rbp)	; tmp168, MEM <vector(2) long unsigned int> [(void *)attr_17]
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%r14, %r14	; attr_table
	jne	.L254	;,
.L231:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp159
	call	*fwrite@GOTPCREL(%rip)	;
.L243:
	movq	stderr(%rip), %rcx	; stderr,
; src/tac.c:421: }
	addq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
; src/tac.c:421: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC22(%rip), %rdi	;, tmp161
; src/tac.c:421: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fwrite@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L228:
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	8(%rdi), %r14	; variable_9(D)->name, _49
	movq	(%rdi), %r13	; variable_9(D)->type, _48
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r14, %r14	; _49
	je	.L249	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %edx	; _48->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r15d, %r15d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	;
	jne	.L247	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; _48->ast_node.class, _48->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rsi), %r15	; status_10(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rsi)	; _48->ast_node.class, status_10(D)->current_class
.L247:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r14, %rdi	; _49,
	call	search_var	;
	movq	%rax, %r12	; tmp182, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %eax	; _48->kind,
	testl	%eax, %eax	;
	jne	.L248	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r15, 24(%rbx)	; current_class, status_10(D)->current_class
.L248:
; src/tac.c:166:         if (var != NULL) {
	testq	%r12, %r12	; var
	je	.L249	;,
; src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rbp), %rdi	; variable_9(D)->value, _51
; src/tac.c:414:         if (variable->value != NULL)
	testq	%rdi, %rdi	; _51
	je	.L250	;,
.L278:
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp183, arg
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; arg
	je	.L251	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _52->is_get
	jne	.L277	;,
.L251:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, %xmm0	; var, tmp164
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movhps	16(%r12), %xmm0	; _68->type, tmp164
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp186, arg
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_81->is_get
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_81->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp164, MEM <vector(2) long unsigned int> [(void *)arg_81]
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg, inst_57->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp187, inst
; src/tac.c:215:     inst->type = type;
	movl	$14, 24(%rax)	;, inst_57->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_57->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_57->arg3
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	; status_10(D)->current_block, status_10(D)->current_block
	movq	8(%rax), %rdi	; _59->instructions, _59->instructions
.L274:
; src/tac.c:421: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L249:
	movq	%r14, %rdi	; _49,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%r13, %rsi	; _48,
	call	create_var.part.0	;
; src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rbp), %rdi	; variable_9(D)->value, _51
	movq	%rax, %r12	; tmp181, var
; src/tac.c:414:         if (variable->value != NULL)
	testq	%rdi, %rdi	; _51
	jne	.L278	;,
.L250:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_69->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp185, arg
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	$0, (%rax)	;, arg_69->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_69->is_get
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%rbp)	; name_int, arg_69->type
	jmp	.L251	;
	.p2align 4,,10
	.p2align 3
.L275:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r12, %rsi	; _5,
	xorl	%edi, %edi	;
	call	create_var.part.0	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm3	; _5, _5
; src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rbp)	;, attr_17->offset
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; tmp179, tmp148
	punpcklqdq	%xmm3, %xmm0	; _5, tmp148
	movups	%xmm0, 0(%rbp)	; tmp148, MEM <vector(2) long unsigned int> [(void *)attr_17]
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%r14, %r14	; attr_table
	je	.L231	;,
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r14), %rax	; attr_table_12->size, _22
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; _22, attr_17->offset
; src/tac.c:18:     if (type == NULL)
	testq	%r12, %r12	; _5
	je	.L236	;,
	jmp	.L252	;
	.p2align 4,,10
	.p2align 3
.L276:
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r12, %rsi	; _5,
	movq	%r13, %rdi	; _6,
	call	create_var.part.0	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%r12, %xmm2	; _5, _5
; src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rbp)	;, attr_17->offset
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, %xmm0	; tmp188, tmp169
	punpcklqdq	%xmm2, %xmm0	; _5, tmp169
	movups	%xmm0, 0(%rbp)	; tmp169, MEM <vector(2) long unsigned int> [(void *)attr_17]
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%r14, %r14	; attr_table
	je	.L231	;,
.L254:
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r14), %rax	; attr_table_12->size, _22
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; _22, attr_17->offset
.L252:
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_int(%rip), %r12	; name_int, _5
	je	.L272	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_float(%rip), %r12	; name_float, _5
	je	.L272	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	name_string(%rip), %r12	; name_string, _5
	je	.L272	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_bool(%rip), %r12	; name_bool, _5
	je	.L273	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	name_void(%rip), %r12	; name_void, _5
	je	.L273	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	movl	32(%r12), %ecx	; _5->kind,
	testl	%ecx, %ecx	;
	jne	.L242	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%r12), %rdx	; _5->ast_node.class, _5->ast_node.class
; src/tac.c:202:         table->size += get_type_size(type);
	addq	24(%rdx), %rax	; _43->size, _22
	jmp	.L236	;
	.p2align 4,,10
	.p2align 3
.L277:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; arg,
	call	load_rvalue.part.0	;
	movq	%rax, %rbp	; tmp184, arg
	jmp	.L251	;
.L242:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%r12), %rcx	; _5->name, _5->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC13(%rip), %rdx	;, tmp156
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:202:         table->size += get_type_size(type);
	movq	16(%r14), %rax	; attr_table_12->size, tmp194
	.p2align 4,,10
	.p2align 3
.L272:
	addq	$8, %rax	;, _22
.L236:
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%r14), %rdi	; attr_table_12->attributes, _27
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%rax, 16(%r14)	; _22, attr_table_12->size
; src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _27
	jne	.L274	;,
	jmp	.L243	;
	.p2align 4,,10
	.p2align 3
.L273:
; src/tac.c:202:         table->size += get_type_size(type);
	addq	$1, %rax	;, _22
	jmp	.L236	;
	.size	tac_variable, .-tac_variable
	.p2align 4
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
	movq	%rdi, %r15	; tmp188, if_
	movq	%rsi, %rdi	; status,
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp189, status
	subq	$56, %rsp	;,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r12	; tmp190, _100
	call	create_var.part.0.constprop.0	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r15), %rdi	; if__56(D)->else_if, if__56(D)->else_if
	movq	%rax, %rbp	; tmp191, else_label
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp192
	je	.L282	;,
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__56(D)->else_body, if__56(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp194
	jne	.L311	;,
.L282:
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rax, 40(%rsp)	; tmp193, %sfp
.L281:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_110->kind
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp195, arg
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_110->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	40(%rsp), %rax	; %sfp, end_label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_110->is_get
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r15), %rdi	; if__56(D)->condition, if__56(D)->condition
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, (%r14)	; end_label, arg_110->value.label
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	;
	movq	%rax, %rcx	; tmp196, _6
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _6
	je	.L283	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _6->is_get
	jne	.L312	;,
.L283:
	movq	%rcx, 16(%rsp)	; _6, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r13	; tmp198, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_106->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_106->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_106->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_106->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _100, arg_105->value.label
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_105->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_105->type
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_105->is_get
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
	movq	%r13, 16(%rax)	; arg, inst_104->arg3
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_104->arg2
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; _6, inst_104->arg1
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_104->type
; src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _7->instructions, _7->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp201, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; _100, block_102->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp202, block_102->instructions
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _9->blocks, _9->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:483:     status->current_block = then_block;
	movq	%r13, 16(%rbx)	; block, status_54(D)->current_block
; src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r15), %rdi	; if__56(D)->body, if__56(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp203, then_statements
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L284	;
	.p2align 4,,10
	.p2align 3
.L285:
; src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L284:
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp204, statement
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L285	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_111->arg2
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp205, inst
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_111->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_111->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_111->arg3
; src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _12->instructions, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r15), %rdi	; if__56(D)->else_if, if__56(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp206
	je	.L313	;,
.L286:
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r15), %rdi	; if__56(D)->else_body, if__56(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp225
	je	.L314	;,
.L294:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp231, block
; src/tac.c:100:     block->label = label;
	movq	40(%rsp), %rax	; %sfp, end_label
	movq	%rax, 0(%rbp)	; end_label, block_128->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp232, block_128->instructions
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _38->blocks, _38->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:543:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_54(D)->current_block
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
.L311:
; src/tac.c:472:         end_label = else_label;
	movq	%rbp, 40(%rsp)	; else_label, %sfp
	jmp	.L281	;
	.p2align 4,,10
	.p2align 3
.L314:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp226, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_125->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp227, block_125->instructions
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _33->blocks, _33->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:530:         status->current_block = else_block;
	movq	%r12, 16(%rbx)	; block, status_54(D)->current_block
; src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r15), %rdi	; if__56(D)->else_body, if__56(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp228, else_statements
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L295	;
	.p2align 4,,10
	.p2align 3
.L296:
; src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L295:
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp229, else_statement
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L296	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_127->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp230, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_127->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_127->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_127->arg3
; src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _36->instructions, _36->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L294	;
	.p2align 4,,10
	.p2align 3
.L313:
; src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r15), %rdi	; if__56(D)->else_if, if__56(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp207, %sfp
	.p2align 4,,10
	.p2align 3
.L287:
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp224, elif
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L286	;,
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp208, block
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; else_label, block_117->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp209, block_117->instructions
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _17->blocks, _17->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:501:             status->current_block = else_if_block;
	movq	%r12, 16(%rbx)	; block, status_54(D)->current_block
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, 8(%rsp)	; tmp210, %sfp
	call	create_var.part.0.constprop.0	;
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	0(%r13), %rdi	; elif_72->condition, elif_72->condition
	movq	%rbx, %rsi	; status,
	movq	%rax, %rbp	; tmp211, else_label
	call	tac_expression	;
	movq	%rax, %r12	; tmp212, _20
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _20
	je	.L288	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _20->is_get
	jne	.L315	;,
.L288:
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	16(%rsp), %rdi	; %sfp,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp214
	jne	.L316	;,
.L290:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_123->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_123->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; else_label, arg_123->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_123->is_get
	movq	%rax, 32(%rsp)	; arg, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rcx	; tmp217, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_122->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_122->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	8(%rsp), %rax	; %sfp, _116
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rcx)	;, arg_122->is_get
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, (%rcx)	; _116, arg_122->value.label
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
	movq	%r12, (%rax)	; _20, inst_121->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rcx, 8(%rax)	; arg, inst_121->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rdx, 16(%rax)	; arg, inst_121->arg3
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_121->type
; src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _24->instructions, _24->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp219, block
; src/tac.c:100:     block->label = label;
	movq	8(%rsp), %rax	; %sfp, _116
	movq	%rax, (%r12)	; _116, block_119->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp220, block_119->instructions
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _26->blocks, _26->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:514:             status->current_block = then_block;
	movq	%r12, 16(%rbx)	; block, status_54(D)->current_block
; src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r13), %rdi	; elif_72->body, elif_72->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp221, elif_statements
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L291	;
	.p2align 4,,10
	.p2align 3
.L292:
; src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L291:
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp222, elif_statement
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L292	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r14, (%rax)	; arg, inst_124->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp223, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_124->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_124->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_124->arg3
; src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _29->instructions, _29->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L287	;
	.p2align 4,,10
	.p2align 3
.L316:
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r15), %rdi	; if__56(D)->else_body, if__56(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	; tmp215
	cmovne	40(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L290	;
	.p2align 4,,10
	.p2align 3
.L315:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _20,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp213, _20
	jmp	.L288	;
.L312:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _6,
	call	load_rvalue.part.0	;
	movq	%rax, %rcx	; tmp197, _6
	jmp	.L283	;
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
	ja	.L318	;,
	leaq	.L320(%rip), %rdx	;, tmp119
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
.L320:
	.long	.L327-.L320
	.long	.L326-.L320
	.long	.L325-.L320
	.long	.L324-.L320
	.long	.L323-.L320
	.long	.L322-.L320
	.long	.L321-.L320
	.long	.L319-.L320
	.text
	.p2align 4,,10
	.p2align 3
.L321:
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_32(D)->end_labels, status_32(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp155
	jne	.L330	;,
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbp), %rax	; status_32(D)->end_labels, status_32(D)->end_labels
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _14->tail, _14->tail
	movq	8(%rax), %rbx	; _15->content, label
; src/tac.c:440:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	je	.L330	;,
.L351:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;,
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp156, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; label,* inst
	jmp	.L350	;
	.p2align 4,,10
	.p2align 3
.L319:
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_32(D)->start_labels, status_32(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp157
	jne	.L331	;,
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbp), %rax	; status_32(D)->start_labels, status_32(D)->start_labels
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _21->tail, _21->tail
	movq	8(%rax), %rbx	; _22->content, label
; src/tac.c:451:                 if (label != NULL) {
	testq	%rbx, %rbx	; label
	jne	.L351	;,
.L331:
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
.L325:
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
.L327:
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rdi), %rdi	; statement_31(D)->stmt.expr, statement_31(D)->stmt.expr
	call	tac_expression	;
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _3
	je	.L317	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _3->is_get
	jne	.L352	;,
.L317:
; src/tac.c:464: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L326:
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
.L323:
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
.L322:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp151, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$5, 16(%rax)	;, arg_74->kind
; src/tac.c:249:             arg->value.string_value = NULL;
	movq	$0, (%rax)	;, arg_74->value.string_value
; src/tac.c:250:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r12)	;, arg_74->is_get
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rbx), %rdi	; statement_31(D)->stmt.return_expr, _8
; src/tac.c:250:             arg->type = name_void;
	movq	%rax, 8(%r12)	; name_void, arg_74->type
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _8
	je	.L329	;,
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp152, arg
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; arg
	je	.L329	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _9->is_get
	jne	.L353	;,
.L329:
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$21, 24(%rax)	;, inst_51->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp154, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg, inst_51->arg1
.L350:
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
.L324:
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
.L330:
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
.L318:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC25(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L353:
	movq	%rbp, %rsi	; status,
	movq	%rax, %rdi	; arg,
	call	load_rvalue.part.0	;
	movq	%rax, %r12	; tmp153, arg
	jmp	.L329	;
	.p2align 4,,10
	.p2align 3
.L352:
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
	movq	(%rdi), %rdi	; for__44(D)->initializer, _1
; src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L355	;,
; src/tac.c:550:         tac_variable(for_->initializer, status, false);
	xorl	%edx, %edx	;
	call	tac_variable	;
.L355:
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r13	; tmp180, _75
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r15	; tmp181, _74
	call	create_var.part.0.constprop.0	;
; src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__44(D)->condition
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r14	; tmp182, _73
; src/tac.c:555:     if (for_->condition != NULL) {
	je	.L356	;,
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
	movq	%r13, (%rax)	; _75, arg_85->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_85->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp184, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_84->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_84->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_84->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_84->arg3
; src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rdi	; _3->instructions, _3->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp185, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; _75, block_82->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp186, block_82->instructions
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rdi	; _5->blocks, _5->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:561:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; block, status_45(D)->current_block
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%r12), %rdi	; for__44(D)->condition, for__44(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rcx	; tmp187, _8
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _8
	je	.L357	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _8->is_get
	jne	.L378	;,
.L357:
	movq	%rcx, 8(%rsp)	; _8, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %rbp	; tmp189, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_78->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_78->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; _73, arg_78->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_78->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_77->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_77->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _74, arg_77->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_77->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, _8
; src/tac.c:217:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_76->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp191, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_76->arg2
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; _8, inst_76->arg1
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbp, 16(%rax)	; arg, inst_76->arg3
; src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rdi	;, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L358:
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp194, block
; src/tac.c:100:     block->label = label;
	movq	%r15, (%rax)	; _74, block_89->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp195, block_89->instructions
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rdi	; _13->blocks, _13->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:574:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; block, status_45(D)->current_block
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
; src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__44(D)->increment
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, (%rsp)	; _88, %sfp
	movq	%rax, %rbp	; tmp196, _88
; src/tac.c:577:     if (for_->increment != NULL)
	je	.L359	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp197, arg
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rdi	; status_45(D)->start_labels, status_45(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_91->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_91->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbp, (%rax)	; _88, arg_91->value.label
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	call	*list_append@GOTPCREL(%rip)	;
.L360:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_94->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp200, arg
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_45(D)->end_labels, status_45(D)->end_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_94->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_94->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; _73, arg_94->value.label
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__44(D)->body, for__44(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp201, body_statements
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L362	;
	.p2align 4,,10
	.p2align 3
.L363:
; src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L362:
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp202, statement
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L363	;,
; src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_45(D)->start_labels, status_45(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_45(D)->end_labels, status_45(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__44(D)->increment
	je	.L365	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp203, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_99->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_99->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	(%rsp), %rax	; %sfp, _88
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbp)	;, arg_99->is_get
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rax, 0(%rbp)	; _88, arg_99->value.label
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp204, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_98->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_98->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_98->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_98->arg3
; src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rdi	; _25->instructions, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp205, block
; src/tac.c:100:     block->label = label;
	movq	(%rsp), %rax	; %sfp, _88
	movq	%rax, 0(%rbp)	; _88, block_96->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp206, block_96->instructions
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rdi	; _27->blocks, _27->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:596:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; block, status_45(D)->current_block
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%r12), %rdi	; for__44(D)->increment, for__44(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _30
	je	.L365	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _30->is_get
	jne	.L379	;,
.L365:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp208, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_101->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_101->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _75, arg_101->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_101->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__44(D)->condition
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_100->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp209, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_100->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_100->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_100->arg3
; src/tac.c:601:     if (for_->condition == NULL)
	je	.L380	;,
.L367:
; src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rdi	; _32->instructions, _32->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp212, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _73, block_104->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp213, block_104->instructions
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_45(D)->current_subroutine, status_45(D)->current_subroutine
	movq	32(%rax), %rdi	; _34->blocks, _34->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:607:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_45(D)->current_block
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
.L359:
; src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__44(D)->condition
	je	.L361	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp198, arg
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_45(D)->start_labels, status_45(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _75, arg_92->value.label
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L360	;
	.p2align 4,,10
	.p2align 3
.L356:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp192, arg
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _74, arg_87->value.label
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_87->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_86->arg1
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_86->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_86->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_86->arg3
; src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_45(D)->current_block, status_45(D)->current_block
	movq	8(%rax), %rdi	;, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L358	;
	.p2align 4,,10
	.p2align 3
.L379:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _30,
	call	load_rvalue.part.0	;
	jmp	.L365	;
	.p2align 4,,10
	.p2align 3
.L380:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp210, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_103->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_103->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _74, arg_103->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_103->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_102->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp211, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_102->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_102->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_102->arg3
	jmp	.L367	;
	.p2align 4,,10
	.p2align 3
.L361:
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp199, arg
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_45(D)->start_labels, status_45(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;,
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;,
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r15, (%rax)	; _74, arg_93->value.label
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L360	;
	.p2align 4,,10
	.p2align 3
.L378:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _8,
	call	load_rvalue.part.0	;
	movq	%rax, %rcx	; tmp188, _8
	jmp	.L357	;
	.size	tac_for, .-tac_for
	.p2align 4
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp142, while_
	movq	%rsi, %rdi	; status,
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp143, status
	subq	$24, %rsp	;,
	call	create_var.part.0.constprop.0	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	movq	%rax, %r12	; tmp144, _59
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r13	; tmp145, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_58->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_58->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _59, arg_58->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_58->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp146, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r13, (%rax)	; arg, inst_57->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_57->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_57->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_57->arg3
; src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_22(D)->current_block, status_22(D)->current_block
	movq	8(%rax), %rdi	; _1->instructions, _1->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp147, block
; src/tac.c:100:     block->label = label;
	movq	%r12, (%rax)	; _59, block_55->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp148, block_55->instructions
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	32(%rax), %rdi	; _3->blocks, _3->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:618:     status->current_block = condition_block;
	movq	%r13, 16(%rbx)	; block, status_22(D)->current_block
	movq	%rbx, %rdi	; status,
	call	create_var.part.0.constprop.0	;
	movq	%rbx, %rdi	; status,
	movq	%rax, %r14	; tmp149, _54
	call	create_var.part.0.constprop.0	;
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	0(%rbp), %rdi	; while__26(D)->condition, while__26(D)->condition
	movq	%rbx, %rsi	; status,
	movq	%rax, %r13	; tmp150, _53
	call	tac_expression	;
	movq	%rax, %rcx	; tmp151, _6
; src/tac.c:271:     if (arg == NULL) {
	testq	%rax, %rax	; _6
	je	.L382	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rax)	;, _6->is_get
	jne	.L389	;,
.L382:
	movq	%rcx, 8(%rsp)	; _6, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movl	$24, %edi	;,
	movq	%rax, %r15	; tmp153, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_49->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_49->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _53, arg_49->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_49->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_48->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_48->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r14, (%rax)	; _54, arg_48->value.label
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_48->is_get
	movq	%rax, (%rsp)	; arg, %sfp
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:216:     inst->arg1 = arg1;
	movq	8(%rsp), %rcx	; %sfp, _6
; src/tac.c:217:     inst->arg2 = arg2;
	movq	(%rsp), %rdx	; %sfp, arg
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp155, inst
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%r15, 16(%rax)	; arg, inst_47->arg3
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rdx, 8(%rax)	; arg, inst_47->arg2
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rcx, (%rax)	; _6, inst_47->arg1
; src/tac.c:215:     inst->type = type;
	movl	$19, 24(%rax)	;, inst_47->type
; src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_22(D)->current_block, status_22(D)->current_block
	movq	8(%rax), %rdi	; _7->instructions, _7->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp156, block
; src/tac.c:100:     block->label = label;
	movq	%r14, (%rax)	; _54, block_45->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	%r15, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r15)	; tmp157, block_45->instructions
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	32(%rax), %rdi	; _9->blocks, _9->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:628:     status->current_block = body_block;
	movq	%r15, 16(%rbx)	; block, status_22(D)->current_block
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_44->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp158, arg
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_22(D)->start_labels, status_22(D)->start_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_44->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_44->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _59, arg_44->value.label
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_43->is_get
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rsi	; tmp159, arg
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_22(D)->end_labels, status_22(D)->end_labels
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_43->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_43->type
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r13, (%rax)	; _53, arg_43->value.label
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%rbp), %rdi	; while__26(D)->body, while__26(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp160, body_statements
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L383	;
	.p2align 4,,10
	.p2align 3
.L384:
; src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L383:
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp161, statement
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L384	;,
; src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_22(D)->start_labels, status_22(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_22(D)->end_labels, status_22(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbp	; tmp162, arg
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rax)	; _59, arg_63->value.label
; src/tac.c:225:     arg->kind = kind;
	movl	$6, 16(%rax)	;, arg_63->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_63->type
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_63->is_get
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp163, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbp, (%rax)	; arg, inst_62->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	$0, 8(%rax)	;, inst_62->arg2
; src/tac.c:215:     inst->type = type;
	movl	$20, 24(%rax)	;, inst_62->type
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_62->arg3
; src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_22(D)->current_block, status_22(D)->current_block
	movq	8(%rax), %rdi	; _16->instructions, _16->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp164, block
; src/tac.c:100:     block->label = label;
	movq	%r13, (%rax)	; _53, block_60->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	%rbp, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbp)	; tmp165, block_60->instructions
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_22(D)->current_subroutine, status_22(D)->current_subroutine
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:644:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; block, status_22(D)->current_block
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
.L389:
	movq	%rbx, %rsi	; status,
	movq	%rax, %rdi	; _6,
	call	load_rvalue.part.0	;
	movq	%rax, %rcx	; tmp152, _6
	jmp	.L382	;
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
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)function_15(D)]
; src/tac.c:318: void tac_function(Function* function, TACStatus* status) {
	movq	%rdi, 8(%rsp)	; function, %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
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
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%rbp, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbp)	; tmp125, subroutine_43->blocks
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_18(D)->tac, status_18(D)->tac
; src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rbp, 8(%rbx)	; subroutine, status_18(D)->current_subroutine
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r15), %rdi	; function_15(D)->parameters, function_15(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp126, parameters
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L391	;
	.p2align 4,,10
	.p2align 3
.L393:
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_43->parameters, subroutine_43->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L391:
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L405	;,
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %r15	; parameter_24->name, _7
	movq	(%rax), %r14	; parameter_24->type, _6
; src/tac.c:157:     if (original_name != NULL) {
	testq	%r15, %r15	; _7
	je	.L396	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r14), %edx	; _6->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	;
	jne	.L394	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r14), %rax	; _6->ast_node.class, _6->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r13	; status_18(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _6->ast_node.class, status_18(D)->current_class
.L394:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%r15, %rdi	; _7,
	call	search_var	;
	movq	%rax, %rsi	; tmp128, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r14), %eax	; _6->kind,
	testl	%eax, %eax	;
	jne	.L395	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rbx)	; current_class, status_18(D)->current_class
.L395:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L393	;,
.L396:
	movq	%r14, %rsi	; _6,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	movq	%r15, %rdi	; _7,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp127, var
	jmp	.L393	;
	.p2align 4,,10
	.p2align 3
.L405:
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
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_43->blocks, subroutine_43->blocks
	movq	%r12, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r12)	; tmp132, block_35->instructions
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	8(%rsp), %rax	; %sfp, function
; src/tac.c:332:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_18(D)->current_block
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rax), %rdi	; function_15(D)->body, function_15(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp133, statements
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L398	;
	.p2align 4,,10
	.p2align 3
.L399:
; src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L398:
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp134, statement
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L399	;,
; src/tac.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_18(D)->current_subroutine
; src/tac.c:341: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
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
	movq	%rdi, %r14	; tmp175, method
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp176, status
	pushq	%rbx	;
	subq	$24, %rsp	;,
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movdqu	(%rdi), %xmm0	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_41(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)method_41(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movaps	%xmm0, (%rsp)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_41(D)], %sfp
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:89:     subroutine->name = name;
	movdqa	(%rsp), %xmm0	; %sfp, MEM <vector(2) long unsigned int> [(struct Symbol * *)method_41(D)]
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movq	%rax, %r12	; tmp177, subroutine
; src/tac.c:89:     subroutine->name = name;
	movups	%xmm0, (%rax)	; MEM <vector(2) long unsigned int> [(struct Symbol * *)method_41(D)], MEM <vector(2) long unsigned int> [(struct Symbol * *)subroutine_85]
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%r12)	; tmp178, subroutine_85->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%r12)	; tmp179, subroutine_85->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	%r12, %rsi	; subroutine,
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%r12)	; tmp180, subroutine_85->blocks
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	0(%rbp), %rax	; status_44(D)->tac, status_44(D)->tac
; src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%r12, 8(%rbp)	; subroutine, status_44(D)->current_subroutine
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r14), %rdi	; method_41(D)->parameters, method_41(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, (%rsp)	; tmp181, %sfp
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L407	;
	.p2align 4,,10
	.p2align 3
.L409:
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_85->parameters, subroutine_85->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L407:
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp184, current_class
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; current_class
	je	.L427	;,
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rbx), %r15	; parameter_50->type, _6
	movq	8(%rbx), %rbx	; parameter_50->name, _7
; src/tac.c:157:     if (original_name != NULL) {
	testq	%rbx, %rbx	; _7
	je	.L412	;,
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r15), %r8d	; _6->kind,
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r13d, %r13d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%r8d, %r8d	;
	jne	.L410	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r15), %rax	; _6->ast_node.class, _6->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbp), %r13	; status_44(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbp)	; _6->ast_node.class, status_44(D)->current_class
.L410:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbp, %rsi	; status,
	movq	%rbx, %rdi	; _7,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r15), %edi	; _6->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rsi	; tmp183, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%edi, %edi	;
	jne	.L411	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r13, 24(%rbp)	; current_class, status_44(D)->current_class
.L411:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L409	;,
.L412:
	movq	%r15, %rsi	; _6,
	movq	%rbp, %rcx	; status,
	movl	$112, %edx	;,
	movq	%rbx, %rdi	; _7,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp182, var
	jmp	.L409	;
	.p2align 4,,10
	.p2align 3
.L427:
	movq	%rbp, %rdi	; status,
	call	create_var.part.0.constprop.0	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	movq	%rax, %r15	; tmp185, _72
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp186, block
; src/tac.c:100:     block->label = label;
	movq	%r15, (%rax)	; _72, block_70->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_85->blocks, subroutine_85->blocks
	movq	%r13, %rsi	; block,
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%r13)	; tmp187, block_70->instructions
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r14), %rdi	; method_41(D)->body, method_41(D)->body
; src/tac.c:356:     status->current_block = block;
	movq	%r13, 16(%rbp)	; block, status_44(D)->current_block
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	%rax, %r12	; tmp188, statements
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbp), %rax	; status_44(D)->current_class, status_44(D)->current_class
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _13->name, _13->name
	movq	8(%rax), %rdi	; _14->name, _14->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp189, _16
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%r14), %rax	; method_41(D)->name, method_41(D)->name
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _17->name, _17->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp190
	jne	.L420	;,
	jmp	.L428	;
	.p2align 4,,10
	.p2align 3
.L421:
; src/tac.c:371:         tac_statement(statement, status);
	movq	%rbp, %rsi	; status,
	call	tac_statement	;
.L420:
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%r12, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp197, statement
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L421	;,
; src/tac.c:373:     status->current_subroutine = NULL;
	movq	$0, 8(%rbp)	;, status_44(D)->current_subroutine
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
.L428:
; src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%r12, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	8(%rax), %esi	; stmt_57->type,
	testl	%esi, %esi	;
	jne	.L415	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; stmt_57->stmt.expr, _21
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	;, _21->operator
	jne	.L415	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	; _21->prim_left, _23
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	;, _23->type
	jne	.L415	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; _23->value.var, _25
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movl	16(%rax), %ecx	; _25->type,
	testl	%ecx, %ecx	;
	je	.L416	;,
.L415:
; src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	(%r14), %rax	; method_41(D)->name, method_41(D)->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	.LC26(%rip), %rdx	;, tmp164
	movq	8(%rax), %rcx	; _27->name, _27->name
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
.L416:
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbp), %rdx	; status_44(D)->current_class, _30
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r15	; _25->content.name, self
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rdx, (%rsp)	; _30, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	(%rsp), %rdx	; %sfp, _30
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %r14	; tmp192, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$1, 16(%rax)	;, arg_117->kind
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	24(%rdx), %rax	; MEM[(long long int *)_30 + 24B], _119
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%r14)	;, arg_117->is_get
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r15), %r8	; self_58->type, _33
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%r14)	; _119, arg_117->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r8), %edx	; _33->kind,
; src/tac.c:234:             arg->type = name_int;
	movq	%rax, 8(%r14)	; name_int, arg_117->type
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	testl	%edx, %edx	;
	jne	.L417	;,
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r8), %rax	; _33->ast_node.class, _33->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbp), %rbx	; status_44(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbp)	; _33->ast_node.class, status_44(D)->current_class
.L417:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbp, %rsi	; status,
	movq	%r15, %rdi	; self,
	movq	%r8, (%rsp)	; _33, %sfp
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movq	(%rsp), %r8	; %sfp, _33
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rdx	; tmp193, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r8), %eax	; _33->kind,
	testl	%eax, %eax	;
	jne	.L418	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%rbx, 24(%rbp)	; current_class, status_44(D)->current_class
.L418:
; src/tac.c:166:         if (var != NULL) {
	testq	%rdx, %rdx	; var
	jne	.L419	;,
	movl	$118, %edx	;,
	movq	%rbp, %rcx	; status,
	movq	%r8, %rsi	; _33,
	movq	%r15, %rdi	; self,
	call	create_var.part.0	;
	movq	%rax, %rdx	; tmp194, var
.L419:
	movq	%rdx, (%rsp)	; var, %sfp
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	(%rsp), %rdx	; %sfp, var
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movq	%rax, %rbx	; tmp195, arg
; src/tac.c:225:     arg->kind = kind;
	movl	$0, 16(%rax)	;, arg_97->kind
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%rdx, %xmm0	; var, tmp167
	movhps	16(%rdx), %xmm0	; _116->type, tmp167
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_97->is_get
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movups	%xmm0, (%rax)	; tmp167, MEM <vector(2) long unsigned int> [(void *)arg_97]
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r13), %rdi	; block_70->instructions, block_70->instructions
; src/tac.c:215:     inst->type = type;
	movl	$18, 24(%rax)	;, inst_73->type
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movq	%rax, %rsi	; tmp196, inst
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%rbx, (%rax)	; arg, inst_73->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%r14, 8(%rax)	; arg, inst_73->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	$0, 16(%rax)	;, inst_73->arg3
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L420	;
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
.L430:
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L438	;,
.L435:
; src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ecx	; member_21->type, _5
; src/tac.c:385:         switch (member->type) {
	testl	%ecx, %ecx	; _5
	je	.L431	;,
	cmpl	$1, %ecx	;, _5
	je	.L432	;,
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
	jne	.L435	;,
.L438:
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
.L432:
; src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rdi	; member_21->content.variable, member_21->content.variable
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; status,
	call	tac_variable	;
; src/tac.c:391:                 break;
	jmp	.L430	;
	.p2align 4,,10
	.p2align 3
.L431:
; src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_21->content.method, member_21->content.method
	movq	%rbp, %rsi	; status,
	call	tac_method	;
; src/tac.c:388:                 break;
	jmp	.L430	;
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rsi, %r12	; tmp117, tac
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbp	; import_14(D)->name, _1
; src/tac.c:305: void tac_import(Import* import, TAC* tac, TACStatus* status) {
	movq	%rdx, %rbx	; tmp118, status
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbp), %ecx	; _1->kind, _2
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L452	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp106
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp106
	jbe	.L453	;,
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L448	;,
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rbp), %rdi	; _1->ast_node.class, _1->ast_node.class
; src/tac.c:317: }
	popq	%rbx	;
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	%rdx, %rsi	; status,
; src/tac.c:317: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	jmp	tac_class	;
	.p2align 4,,10
	.p2align 3
.L448:
; src/tac.c:317: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:317: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC28(%rip), %rdx	;, tmp111
; src/tac.c:317: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L453:
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %r13	; _1->type, _8
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %edx	; _8->kind,
	testl	%edx, %edx	;
	je	.L454	;,
.L445:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; _1,
	call	search_var	;
	movq	%rax, %rsi	; tmp121, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %eax	; _8->kind,
	testl	%eax, %eax	;
	jne	.L446	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_15(D)->current_class
.L446:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L447	;,
	movq	%r13, %rsi	; _8,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp122, var
.L447:
; src/tac.c:317: }
	popq	%rbx	;
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rdi	; tac_18(D)->global_vars, tac_18(D)->global_vars
; src/tac.c:317: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
	.p2align 4,,10
	.p2align 3
.L452:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	0(%rbp), %r13	; _1->type, _56
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%r14d, %r14d	; current_class
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	movl	32(%r13), %esi	; _56->kind,
	testl	%esi, %esi	;
	je	.L455	;,
.L441:
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; _1,
	call	search_var	;
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	32(%r13), %ecx	; _56->kind,
; src/tac.c:163:         Var* var = search_var(original_name, status);
	movq	%rax, %rsi	; tmp119, var
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	;
	jne	.L442	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	%r14, 24(%rbx)	; current_class, status_15(D)->current_class
.L442:
; src/tac.c:166:         if (var != NULL) {
	testq	%rsi, %rsi	; var
	jne	.L447	;,
	movq	%r13, %rsi	; _56,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var.part.0	;
	movq	%rax, %rsi	; tmp120, var
	jmp	.L447	;
	.p2align 4,,10
	.p2align 3
.L454:
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%r13), %rax	; _8->ast_node.class, _8->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rbx), %r14	; status_15(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rbx)	; _8->ast_node.class, status_15(D)->current_class
	jmp	.L445	;
	.p2align 4,,10
	.p2align 3
.L455:
	movq	24(%r13), %rax	; _56->ast_node.class, _56->ast_node.class
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rdx), %r14	; status_15(D)->current_class, current_class
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rdx)	; _56->ast_node.class, status_15(D)->current_class
	jmp	.L441	;
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
.L457:
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp126, code_member
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L465	;,
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L466	;,
; src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L467	;,
; src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L457	;,
; src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L457	;
	.p2align 4,,10
	.p2align 3
.L466:
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
	jne	.L457	;,
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L457	;
	.p2align 4,,10
	.p2align 3
.L467:
; src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	tac_class	;
	jmp	.L457	;
	.p2align 4,,10
	.p2align 3
.L465:
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
