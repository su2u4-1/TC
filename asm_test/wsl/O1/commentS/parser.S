	.file	"tac.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	create_instruction, @function
create_instruction:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %r13d	; tmp88, type
	movq	%rsi, %r12	; tmp89, arg1
	movq	%rdx, %rbp	; tmp90, arg2
	movq	%rcx, %rbx	; tmp91, arg3
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:214:     inst->type = type;
	movl	%r13d, 24(%rax)	; type, inst_3->type
; src/tac.c:215:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg1, inst_3->arg1
; src/tac.c:216:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg2, inst_3->arg2
; src/tac.c:217:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; arg3, inst_3->arg3
; src/tac.c:220: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_instruction, .-create_instruction
	.type	create_subroutine, @function
create_subroutine:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r12	; tmp89, name
	movq	%rsi, %rbp	; tmp90, return_type
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp91, <retval>
; src/tac.c:89:     subroutine->name = name;
	movq	%r12, (%rax)	; name, subroutine_6->name
; src/tac.c:90:     subroutine->return_type = return_type;
	movq	%rbp, 8(%rax)	; return_type, subroutine_6->return_type
; src/tac.c:91:     subroutine->parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:91:     subroutine->parameters = create_list();
	movq	%rax, 16(%rbx)	; tmp92, subroutine_6->parameters
; src/tac.c:92:     subroutine->local_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:92:     subroutine->local_vars = create_list();
	movq	%rax, 24(%rbx)	; tmp93, subroutine_6->local_vars
; src/tac.c:93:     subroutine->blocks = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:93:     subroutine->blocks = create_list();
	movq	%rax, 32(%rbx)	; tmp94, subroutine_6->blocks
; src/tac.c:96: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_subroutine, .-create_subroutine
	.type	create_block, @function
create_block:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, label
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp87, <retval>
; src/tac.c:100:     block->label = label;
	movq	%rbp, (%rax)	; label, block_4->label
; src/tac.c:101:     block->instructions = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:101:     block->instructions = create_list();
	movq	%rax, 8(%rbx)	; tmp88, block_4->instructions
; src/tac.c:104: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_block, .-create_block
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	""
.LC1:
	.string	"$%d-error"
.LC2:
	.string	"$%c%zu"
	.text
	.type	create_var, @function
create_var:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp180, original_name
	movq	%rsi, %r14	; tmp181, type
	movl	%edx, %r13d	; tmp182, kind
	movq	%rcx, %rbp	; tmp183, status
; src/tac.c:157:     if (original_name != NULL) {
	testq	%rdi, %rdi	; original_name
	je	.L8	;,
; src/tac.c:158:         Class* current_class = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rsi)	;, type_33(D)->kind
	jne	.L9	;,
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rcx), %rax	; status_34(D)->current_class, current_class
	movq	%rax, (%rsp)	; current_class, %sfp
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rsi), %rax	; type_33(D)->ast_node.class, _2
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	%rax, 24(%rcx)	; _2, status_34(D)->current_class
.L9:
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rbp), %rax	; status_34(D)->current_subroutine, _58
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	; _58
	je	.L10	;,
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rdi	; _58->local_vars, _58->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	; tmp184
	je	.L46	;,
.L11:
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rbp), %rax	; status_34(D)->current_subroutine, _66
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	; _66
	je	.L10	;,
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rdi	; _66->parameters, _66->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	; tmp187
	je	.L47	;,
.L10:
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rbp)	;, status_34(D)->current_class
	je	.L17	;,
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	0(%rbp), %rax	; status_34(D)->tac, status_34(D)->tac
	movq	(%rax), %rdi	; _75->attribute_tables, _75->attribute_tables
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	; tmp190
	je	.L48	;,
.L17:
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	0(%rbp), %rax	; status_34(D)->tac, status_34(D)->tac
	movq	16(%rax), %rdi	; _92->global_vars, _92->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	; tmp196
	jne	.L24	;,
; src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	0(%rbp), %rax	; status_34(D)->tac, status_34(D)->tac
	movq	16(%rax), %rdi	; _95->global_vars, _95->global_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp197, vars
.L25:
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r15, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp198, <retval>
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L24	;,
; src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	(%rbx), %r12	; var_98->original_name, original_name
	jne	.L25	;,
.L13:
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, type_33(D)->kind
	je	.L40	;,
	jmp	.L7	;
.L46:
; src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rbp), %rax	; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	24(%rax), %rdi	; _61->local_vars, _61->local_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp185, vars
.L12:
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r15, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp186, <retval>
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L11	;,
; src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	(%rbx), %r12	; var_64->original_name, original_name
	jne	.L12	;,
	jmp	.L13	;
.L47:
; src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rbp), %rax	; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	16(%rax), %rdi	; _69->parameters, _69->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp188, vars
.L15:
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r15, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp189, <retval>
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L10	;,
; src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	(%rbx), %r12	; var_72->original_name, original_name
	jne	.L15	;,
	jmp	.L13	;
.L48:
; src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	0(%rbp), %rax	; status_34(D)->tac, status_34(D)->tac
	movq	(%rax), %rdi	; _78->attribute_tables, _78->attribute_tables
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp191, tables
.L19:
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	%r15, %rdi	; tables,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp195, table
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	; table
	je	.L17	;,
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rbp), %rax	; status_34(D)->current_class, status_34(D)->current_class
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	; _83->name, tmp204
	cmpq	%rax, 8(%rbx)	; tmp204, table_81->name
	jne	.L19	;,
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rbx), %rdi	; table_81->attributes, table_81->attributes
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	; tmp192
	jne	.L19	;,
; src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%rbx), %rdi	; table_81->attributes, table_81->attributes
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp193, %sfp
.L21:
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	; attr
	je	.L19	;,
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %rbx	; attr_89->var, <retval>
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	(%rbx), %r12	; _90->original_name, original_name
	jne	.L21	;,
	jmp	.L13	;
.L42:
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	movl	$0, %ebx	;, <retval>
.L40:
; src/tac.c:165:             status->current_class = current_class;
	movq	(%rsp), %rax	; %sfp, current_class
	movq	%rax, 24(%rbp)	; current_class, status_34(D)->current_class
; src/tac.c:166:         if (var != NULL) {
	testq	%rbx, %rbx	; <retval>
	jne	.L7	;,
	jmp	.L8	;
.L28:
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rbp), %r12	; status_34(D)->attr_count, id
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r12), %rax	;, tmp159
	movq	%rax, 48(%rbp)	; tmp159, status_34(D)->attr_count
.L29:
; src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp165
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp199, _16
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _16, var_130->name
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r12	;, id
	je	.L38	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r12, %r9	; id,
	movl	%r13d, %r8d	; kind,
	leaq	.LC2(%rip), %rcx	;, tmp167
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L36:
; src/tac.c:188:     var->type = type;
	movq	%r14, 16(%rbx)	; type, var_130->type
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %r13d	;, tmp168
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %r13d	;, tmp168
	je	.L49	;,
.L7:
; src/tac.c:193: }
	movq	%rbx, %rax	; <retval>,
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L30:
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbp), %r12	; status_34(D)->param_count, id
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r12), %rax	;, tmp160
	movq	%rax, 56(%rbp)	; tmp160, status_34(D)->param_count
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L29	;
.L31:
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rbp), %r12	; status_34(D)->var_count, id
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r12), %rax	;, tmp161
	movq	%rax, 64(%rbp)	; tmp161, status_34(D)->var_count
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L29	;
.L32:
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbp), %r12	; status_34(D)->temp_count, id
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r12), %rax	;, tmp162
	movq	%rax, 72(%rbp)	; tmp162, status_34(D)->temp_count
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L29	;
.L33:
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbp), %r12	; status_34(D)->block_count, id
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r12), %rax	;, tmp163
	movq	%rax, 80(%rbp)	; tmp163, status_34(D)->block_count
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L29	;
.L34:
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rbp), %r12	; status_34(D)->subroutine_count, id
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r12), %rax	;, tmp164
	movq	%rax, 88(%rbp)	; tmp164, status_34(D)->subroutine_count
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	jmp	.L29	;
.L49:
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbp), %rax	; status_34(D)->current_subroutine, status_34(D)->current_subroutine
	movq	24(%rax), %rdi	; _20->local_vars, _20->local_vars
	movq	%rbx, %rsi	; <retval>,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L7	;
.L37:
; src/tac.c:183:     var->name = create_string("", 32);
	movl	$32, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp172
	call	*create_string@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp200, _16
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%rbx)	; _16, var_130->name
.L38:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%r13d, %r8d	; kind,
	leaq	.LC1(%rip), %rcx	;, tmp166
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movl	$0, %eax	;,
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L36	;
.L24:
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r14)	;, type_33(D)->kind
	je	.L42	;,
.L8:
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp201, <retval>
; src/tac.c:172:     var->original_name = original_name;
	movq	%r12, (%rax)	; original_name, var_130->original_name
; src/tac.c:174:     switch (kind) {
	leal	-97(%r13), %eax	;, tmp173
	cmpl	$21, %eax	;, tmp173
	ja	.L37	;,
	movl	%eax, %eax	; tmp173, tmp174
	leaq	.L39(%rip), %rdx	;, tmp175
	movslq	(%rdx,%rax,4), %rax	;, tmp177
	addq	%rdx, %rax	; tmp175, tmp178
	jmp	*%rax	; tmp178
	.section	.rodata
	.align 4
	.align 4
.L39:
	.long	.L28-.L39
	.long	.L33-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L34-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L30-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L37-.L39
	.long	.L32-.L39
	.long	.L37-.L39
	.long	.L31-.L39
	.text
	.size	create_var, .-create_var
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
; src/tac.c:19:         result = 0;
	movl	$0, %eax	;, <retval>
; src/tac.c:18:     if (type == NULL)
	testq	%rdi, %rdi	; type
	je	.L60	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_int(%rip)	; type, name_int
	je	.L54	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_float(%rip)	; type, name_float
	je	.L55	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_string(%rip)	; type, name_string
	je	.L56	;,
; src/tac.c:23:         result = 1;
	movl	$1, %eax	;, <retval>
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rdi, name_bool(%rip)	; type, name_bool
	je	.L60	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rdi, name_void(%rip)	; type, name_void
	je	.L60	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rdi)	;, type_12(D)->kind
	jne	.L52	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rdi), %rax	; type_12(D)->ast_node.class, type_12(D)->ast_node.class
	movq	24(%rax), %rax	; _7->size, <retval>
	ret	
.L52:
; src/tac.c:15: static size_t get_type_size(Symbol* type) {
	subq	$8, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdi), %rcx	; type_12(D)->name, type_12(D)->name
	leaq	.LC3(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:17:     size_t result = 8;
	movl	$8, %eax	;, <retval>
; src/tac.c:30: }
	addq	$8, %rsp	;,
	ret	
.L54:
; src/tac.c:21:         result = 8;
	movl	$8, %eax	;, <retval>
	ret	
.L55:
	movl	$8, %eax	;, <retval>
	ret	
.L56:
	movl	$8, %eax	;, <retval>
	ret	
.L60:
; src/tac.c:30: }
	ret	
	.size	get_type_size, .-get_type_size
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"[warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebp	; tmp110, kind
	movq	%rsi, %r12	; tmp111, value
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp112, <retval>
; src/tac.c:224:     arg->kind = kind;
	movl	%ebp, 16(%rax)	; kind, arg_15->kind
; src/tac.c:225:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_15->type
; src/tac.c:226:     switch (kind) {
	cmpl	$7, %ebp	;, kind
	ja	.L63	;,
	movl	%ebp, %ebp	; kind, kind
	leaq	.L65(%rip), %rdx	;, tmp97
	movslq	(%rdx,%rbp,4), %rax	;, tmp99
	addq	%rdx, %rax	; tmp97, tmp100
	jmp	*%rax	; tmp100
	.section	.rodata
	.align 4
	.align 4
.L65:
	.long	.L72-.L65
	.long	.L71-.L65
	.long	.L70-.L65
	.long	.L69-.L65
	.long	.L68-.L65
	.long	.L67-.L65
	.long	.L66-.L65
	.long	.L64-.L65
	.text
.L72:
; src/tac.c:228:             arg->value.variable = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.variable
; src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	16(%r12), %rax	; MEM[(struct Var *)value_19(D)].type, _1
; src/tac.c:229:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	; _1, arg_15->type
.L73:
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rbx)	;, arg_15->is_get
; src/tac.c:266: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L71:
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	(%r12), %rax	; MEM[(long long int *)value_19(D)], _2
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	; _2, arg_15->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
	movq	%rax, 8(%rbx)	; name_int, arg_15->type
; src/tac.c:234:             break;
	jmp	.L73	;
.L70:
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	(%r12), %xmm0	; MEM[(double *)value_19(D)], _4
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	; _4, arg_15->value.float_value
; src/tac.c:237:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%rbx)	; name_float, arg_15->type
; src/tac.c:238:             break;
	jmp	.L73	;
.L69:
; src/tac.c:240:             arg->value.string_value = (string)value;
	movq	%r12, (%rbx)	; value, arg_15->value.string_value
; src/tac.c:241:             arg->type = name_string;
	movq	name_string(%rip), %rax	; name_string, name_string
	movq	%rax, 8(%rbx)	; name_string, arg_15->type
; src/tac.c:242:             break;
	jmp	.L73	;
.L68:
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movzbl	(%r12), %eax	; MEM[(char *)value_19(D)], _7
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	%al, (%rbx)	; _7, arg_15->value.bool_value
; src/tac.c:245:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
	movq	%rax, 8(%rbx)	; name_bool, arg_15->type
; src/tac.c:246:             break;
	jmp	.L73	;
.L67:
; src/tac.c:248:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	;, arg_15->value.string_value
; src/tac.c:249:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void
	movq	%rax, 8(%rbx)	; name_void, arg_15->type
; src/tac.c:250:             break;
	jmp	.L73	;
.L66:
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.label
; src/tac.c:253:             break;
	jmp	.L73	;
.L64:
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.subroutine
; src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	16(%r12), %rax	; MEM[(struct Var *)value_19(D)].type, _10
; src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	; _10, arg_15->type
; src/tac.c:257:             break;
	jmp	.L73	;
.L63:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebp, %ecx	; kind,
	leaq	.LC4(%rip), %rdx	;, tmp108
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L73	;
	.size	create_arg, .-create_arg
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp96, arg
; src/tac.c:269:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L76	;,
	movq	%rsi, %rbp	; tmp97, status
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_9(D)->is_get
	jne	.L78	;,
.L76:
; src/tac.c:281: }
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L78:
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_9(D)->type, arg_9(D)->type
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp98, _3
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %r12	; tmp99, temp
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %ecx	;,
	movq	%rbx, %rdx	; arg,
	movq	%rax, %rsi	; temp,
	movl	$23, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp100, _4
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rdi	; _5->instructions, _5->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:277:         return temp;
	movq	%r12, %rbx	; temp, arg
	jmp	.L76	;
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp107, tac
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbp	; import_15(D)->name, _1
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbp), %ecx	; _1->kind, _2
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L85	;,
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp100
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp100
	jbe	.L86	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L83	;,
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp111, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%r12)	; tmp112, table_25->attributes
; src/tac.c:10:     table->name = name;
	movq	%rbp, 8(%r12)	; _1, table_25->name
; src/tac.c:11:     table->size = 0;
	movq	$0, 16(%r12)	;, table_25->size
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%rbx), %rdi	; tac_17(D)->attribute_tables, tac_17(D)->attribute_tables
	movq	%r12, %rsi	; table,
	call	*list_append@GOTPCREL(%rip)	;
.L79:
; src/tac.c:314: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L85:
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	0(%rbp), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var	;
	movq	%rax, %rsi	; tmp109, _4
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rbx), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L79	;
.L86:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; _1,
	call	create_var	;
	movq	%rax, %rsi	; tmp110, _8
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbx), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L79	;
.L83:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC5(%rip), %rdx	;, tmp105
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:314: }
	jmp	.L79	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.align 8
.LC7:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edx, %ecx	; tmp136, type
; src/tac.c:395:     switch (type) {
	leal	-97(%rdx), %eax	;, tmp111
	cmpl	$21, %eax	;, tmp111
	ja	.L88	;,
	movq	%rdi, %rbp	; tmp134, variable
	movq	%rsi, %rbx	; tmp135, status
	movl	%eax, %eax	; tmp111, tmp112
	leaq	.L90(%rip), %rdx	;, tmp113
	movslq	(%rdx,%rax,4), %rax	;, tmp115
	addq	%rdx, %rax	; tmp113, tmp116
	jmp	*%rax	; tmp116
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
.L91:
; src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rsi	; variable_19(D)->type, variable_19(D)->type
	movq	8(%rdi), %rdi	; variable_19(D)->name, variable_19(D)->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp137, var
; src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	; status_20(D)->current_subroutine, status_20(D)->current_subroutine
	movq	16(%rax), %rdi	; _3->parameters, _3->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L87:
; src/tac.c:418: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L92:
; src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	(%rdi), %rsi	; variable_19(D)->type, variable_19(D)->type
	movq	8(%rdi), %rdi	; variable_19(D)->name, variable_19(D)->name
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp138, var
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	16(%rax), %rdi	; _7->global_vars, _7->global_vars
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:405:             break;
	jmp	.L87	;
.L93:
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rdi	; _9->attribute_tables, _9->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp139, attr_table
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rdi	; _11->attribute_tables, _11->attribute_tables
	movq	%r12, %rsi	; attr_table,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:409:             create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	0(%rbp), %r13	; variable_19(D)->type, _13
	movq	8(%rbp), %r14	; variable_19(D)->name, _14
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp140, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r13, %rsi	; _13,
	movq	%r14, %rdi	; _14,
	call	create_var	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, 0(%rbp)	; tmp141, attr_32->var
; src/tac.c:198:     attr->type = type;
	movq	%r13, 8(%rbp)	; _13, attr_32->type
; src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rbp)	;, attr_32->offset
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r12), %rax	; attr_table_28->size, _34
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; _34, attr_32->offset
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _13,
	call	get_type_size	;
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%r12)	; tmp142, attr_table_28->size
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%r12), %rdi	; attr_table_28->attributes, _38
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _38
	je	.L96	;,
; src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L87	;
.L96:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L87	;
.L88:
	leaq	.LC7(%rip), %rdx	;, tmp133
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:418: }
	jmp	.L87	;
	.size	tac_variable, .-tac_variable
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"[warning] Unsupported variable access with NULL base\n"
	.align 8
.LC9:
	.string	"[warning] Failed to generate variable access for base\n"
	.align 8
.LC10:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC11:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC12:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
	.align 8
.LC13:
	.string	"[warning] Attempting to index non-array type: %s\n"
	.section	.rodata.str1.1
.LC14:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"[warning] Failed to generate variable access for index\n"
	.align 8
.LC16:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC17:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
	movq	%rdi, %r12	; tmp253, variable_access
	movq	%rsi, %rbx	; tmp254, status
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rdi)	;, variable_access_98(D)->type
	jne	.L98	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %rdi	; variable_access_98(D)->content.name, _2
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rdi, %rdi	; _2
	je	.L98	;,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rdi), %eax	; _2->kind, tmp290
	subl	$1, %eax	;, tmp182
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	;, tmp182
	jbe	.L99	;,
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _2->type, _2->type
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp255, _6
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp256, <retval>
.L97:
; src/tac.c:845: }
	movq	%rbp, %rax	; <retval>,
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L99:
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; _2->type, _2->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp257, _8
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp258, <retval>
; src/tac.c:750:             return result;
	jmp	.L97	;
.L98:
; src/tac.c:753:     if (variable_access->base == NULL) {
	movq	(%r12), %rbp	; variable_access_98(D)->base, <retval>
; src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rbp, %rbp	; <retval>
	je	.L121	;,
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; <retval>,
	call	tac_variable_access	;
	movq	%rax, %rdi	; tmp259, _11
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r13	; tmp260, base
; src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	; base
	je	.L122	;,
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%r12), %ecx	; variable_access_98(D)->type, _13
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _13
	je	.L123	;,
; src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _13
	je	.L124	;,
; src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _13
	jne	.L113	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %ecx	; base_108->kind, _59
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	; _59
	jne	.L114	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	; base_108->type, _60
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	;, _60->kind
	je	.L125	;,
.L115:
; src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%r13), %rax	; base_178->type, base_178->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; _71->name,
	leaq	.LC16(%rip), %rdx	;, tmp239
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:823:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L97	;
.L121:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp187
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:756:         return NULL;
	jmp	.L97	;
.L122:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp189
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:762:         return NULL;
	movq	%r13, %rbp	; base, <retval>
	jmp	.L97	;
.L123:
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	; base_108->type, _14
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _14->kind, _15
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp190
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp190
	jbe	.L126	;,
; src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _14->ast_node.scope, scope
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _15
	jne	.L105	;,
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_148].class_scope, scope
.L105:
; src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%r12), %rax	; variable_access_98(D)->content.attr_name, variable_access_98(D)->content.attr_name
	movq	8(%rax), %rsi	; _19->name, _19->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp261, <retval>
; src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L127	;,
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %eax	; attr_151->kind, _26
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rax), %edx	;, tmp202
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %edx	;, tmp202
	jbe	.L128	;,
; src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _26
	jne	.L129	;,
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	0(%rbp), %rsi	; attr_151->type, attr_151->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp264, _36
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp265, <retval>
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%r12), %rdi	; variable_access_98(D)->content.attr_name, _37
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rdi), %rsi	; _37->type, _37->type
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp266, _39
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	; tmp267, _40
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%r13, %rdx	; base,
	movq	%rbp, %rsi	; <retval>,
	movl	$15, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp268, inst
; src/tac.c:788:         temp->is_get = true;
	movb	$1, 20(%rbp)	;, temp_154->is_get
; src/tac.c:789:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_99(D)->current_block, status_99(D)->current_block
	movq	8(%rax), %rdi	; _41->instructions, _41->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:791:         return temp;
	jmp	.L97	;
.L126:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _14->name, _14->name
	leaq	.LC10(%rip), %rdx	;, tmp193
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:768:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L97	;
.L127:
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_108->type, base_108->type
	movq	8(%r12), %rdx	; variable_access_98(D)->content.attr_name, variable_access_98(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _23->name, _23->name
	movq	8(%rax), %r8	; _21->name,
	leaq	.LC11(%rip), %rdx	;, tmp201
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:777:             return NULL;
	jmp	.L97	;
.L128:
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %rsi	; attr_151->type, attr_151->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; <retval>,
	call	create_var	;
	movq	%rax, %rsi	; tmp262, _29
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp263, <retval>
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L97	;
.L129:
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_108->type, base_108->type
	movq	8(%r12), %rdx	; variable_access_98(D)->content.attr_name, variable_access_98(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _32->name, _32->name
	movq	8(%rax), %r8	; _30->name,
	leaq	.LC12(%rip), %rdx	;, tmp209
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L97	;
.L124:
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rax), %rdx	; base_108->type, _43
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rdx), %eax	; _43->kind, tmp291
	subl	$3, %eax	;, tmp214
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	;, tmp214
	ja	.L130	;,
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rdx), %rbp	; _43->name, _48
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC14(%rip), %rsi	;, tmp220
	movq	%rbp, %rdi	; _48,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp269
	jne	.L131	;,
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%r12), %rdi	; variable_access_98(D)->content.index, variable_access_98(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp270, _52
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp271, index
; src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	; index
	je	.L132	;,
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%r13), %rax	; base_108->type, base_108->type
	movq	(%rax), %rsi	; _54->type, _54->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp272, _56
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp273, <retval>
; src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%r12, %rcx	; index,
	movq	%r13, %rdx	; base,
	movq	%rax, %rsi	; <retval>,
	movl	$16, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp274, inst
; src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%rbp)	;, temp_143->is_get
; src/tac.c:812:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_99(D)->current_block, status_99(D)->current_block
	movq	8(%rax), %rdi	; _57->instructions, _57->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:814:         return temp;
	jmp	.L97	;
.L130:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _43->name, _43->name
	leaq	.LC13(%rip), %rdx	;, tmp218
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:796:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L97	;
.L131:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rbp, %rcx	; _48,
	leaq	.LC13(%rip), %rdx	;, tmp222
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:801:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L97	;
.L132:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rdi	;, tmp225
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:807:             return NULL;
	movq	%r12, %rbp	; index, <retval>
	jmp	.L97	;
.L125:
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _60->name, _60->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp275, _64
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r13), %rax	; base_108->type, base_108->type
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _65->ast_node.class, _65->ast_node.class
	movq	16(%rax), %rdi	; _66->class_scope, _66->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp276, attr
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; attr_111->type, attr_111->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp277, _69
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %r13	; tmp278, base
.L114:
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	movl	16(%r13), %ecx	; base_89->kind, _59
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %ecx	;, _59
	jne	.L115	;,
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%r12), %rdi	; variable_access_98(D)->content.args, variable_access_98(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp279, args
; src/tac.c:827:         long long arg_count = 0;
	movq	$0, (%rsp)	;, arg_count
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	leaq	8(%rsp), %r12	;, tmp252
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L118	;
.L119:
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r14	; tmp280, arg
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rdi	; arg_128->type, arg_128->type
	call	get_type_size	;
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 8(%rsp)	; tmp281, size
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	%r12, %rsi	; tmp252,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp282, _78
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movl	$0, %ecx	;,
	movq	%r14, %rdx	; arg,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp283, inst
; src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_99(D)->current_block, status_99(D)->current_block
	movq	8(%rax), %rdi	; _79->instructions, _79->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:833:             arg_count++;
	addq	$1, (%rsp)	;, arg_count
.L118:
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%rbp, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp284, arg_expr
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	jne	.L119	;,
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%r13), %rsi	; base_89->type, base_89->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp285, _84
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp286, <retval>
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%rsp, %rsi	;, tmp246
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	; tmp287, _85
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%r13, %rdx	; base,
	movq	%rbp, %rsi	; <retval>,
	movl	$22, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp288, inst
; src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_99(D)->current_block, status_99(D)->current_block
	movq	8(%rax), %rdi	; _86->instructions, _86->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:839:         return temp;
	jmp	.L97	;
.L113:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC17(%rip), %rdx	;, tmp250
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:843:         return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L97	;
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"[warning] Unsupported type for negation: %s\n"
	.align 8
.LC20:
	.string	"[warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; src/tac.c:678:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type, _1
; src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L134	;,
	movq	%rsi, %rbx	; tmp150, status
	movl	%ecx, %ecx	; _1, _1
	leaq	.L136(%rip), %rdx	;, tmp118
	movslq	(%rdx,%rcx,4), %rax	;, tmp120
	addq	%rdx, %rax	; tmp118, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L136:
	.long	.L144-.L136
	.long	.L143-.L136
	.long	.L142-.L136
	.long	.L141-.L136
	.long	.L140-.L136
	.long	.L139-.L136
	.long	.L138-.L136
	.long	.L137-.L136
	.long	.L135-.L136
	.text
.L144:
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	movl	$0, %esi	;,
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 8(%rsp)	; tmp151, MEM[(long long int *)_91]
; src/tac.c:682:             return create_arg(ARG_INT, &t);
	leaq	8(%rsp), %rsi	;, tmp124
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp152, <retval>
.L133:
; src/tac.c:739: }
	movq	%rbp, %rax	; <retval>,
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L143:
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$0, %esi	;,
	call	*strtod@GOTPCREL(%rip)	;
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; tmp153, MEM[(double *)_91]
; src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	leaq	8(%rsp), %rsi	;, tmp126
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp154, <retval>
	jmp	.L133	;
.L142:
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %rsi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$3, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp155, <retval>
	jmp	.L133	;
.L141:
; src/tac.c:692:             bool t = true;
	movb	$1, 8(%rsp)	;, MEM[(char *)_91]
; src/tac.c:694:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp128
	movl	$4, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp156, <retval>
	jmp	.L133	;
.L140:
; src/tac.c:697:             bool t = false;
	movb	$0, 8(%rsp)	;, MEM[(char *)_91]
; src/tac.c:699:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp129
	movl	$4, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp157, <retval>
	jmp	.L133	;
.L139:
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
	call	tac_expression	;
	movq	%rax, %rbp	; tmp158, <retval>
	jmp	.L133	;
.L138:
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
	movq	%rax, %rdi	; tmp159, _9
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp160, operand
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movq	name_bool(%rip), %rsi	; name_bool,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp161, _11
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp162, <retval>
; src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %ecx	;,
	movq	%r12, %rdx	; operand,
	movq	%rax, %rsi	; <retval>,
	movl	$13, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp163, inst
; src/tac.c:708:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	; _12->instructions, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:710:             return temp;
	jmp	.L133	;
.L137:
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
	movq	%rax, %rdi	; tmp164, _15
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp165, operand
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp166, _17
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp167, <retval>
; src/tac.c:716:             long long zero_int = 0;
	movq	$0, (%rsp)	;, zero_int
; src/tac.c:717:             double neg_one_float = -1.0;
	movq	.LC18(%rip), %rax	;, tmp174
	movq	%rax, 8(%rsp)	; tmp174, MEM[(double *)_91]
; src/tac.c:718:             if (operand->type == name_int)
	movq	8(%r12), %rax	; operand_42->type, _18
; src/tac.c:718:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L151	;,
; src/tac.c:720:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L152	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	leaq	.LC19(%rip), %rdx	;, tmp142
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:725:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L133	;
.L151:
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rsp, %rsi	;, tmp138
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp168, _20
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbp, %rsi	; <retval>,
	movl	$1, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp169, inst
	jmp	.L147	;
.L152:
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	8(%rsp), %rsi	;, tmp139
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp170, _22
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbp, %rsi	; <retval>,
	movl	$2, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp171, inst
.L147:
; src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	; _25->instructions, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:729:             return temp;
	jmp	.L133	;
.L135:
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.var, primary_36(D)->value.var
	call	tac_variable_access	;
	movq	%rax, %rbp	; tmp172, <retval>
	jmp	.L133	;
.L134:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC20(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:737:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L133	;
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbp	; tmp142, expression
	movq	%rsi, %rbx	; tmp143, status
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
	je	.L181	;,
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
	call	tac_expression	;
	movq	%rax, %rdi	; tmp145, _4
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r14	; tmp146, right
; src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %r13d	; expression_30(D)->operator, _61
; src/tac.c:35:     switch (op) {
	cmpl	$18, %r13d	;, _61
	ja	.L156	;,
	movl	%r13d, %eax	; _61, _61
	leaq	.L158(%rip), %rdx	;, tmp119
	movslq	(%rdx,%rax,4), %rax	;, tmp121
	addq	%rdx, %rax	; tmp119, tmp122
	jmp	*%rax	; tmp122
	.section	.rodata
	.align 4
	.align 4
.L158:
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L177-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L160-.L158
	.long	.L163-.L158
	.long	.L162-.L158
	.long	.L161-.L158
	.long	.L177-.L158
	.long	.L159-.L158
	.long	.L157-.L158
	.text
.L181:
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
	call	tac_primary	;
	movq	%rax, %rbp	; tmp144, <retval>
; src/tac.c:649:         return result;
	jmp	.L153	;
.L159:
; src/tac.c:43:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %r13d	;, _61
.L160:
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp158, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp137
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp137
	jbe	.L175	;,
.L172:
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; left_76->type, left_76->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp154, _17
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp155, <retval>
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue	;
	movq	%rax, %rdx	; tmp156, _18
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r14, %rcx	; right,
	movq	%rbp, %rsi	; <retval>,
	movl	%r13d, %edi	; _61,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp157, inst
	jmp	.L174	;
.L157:
; src/tac.c:45:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %r13d	;, _61
	jmp	.L160	;
.L156:
; src/tac.c:56:         default: return INST_NONE;
	movl	$25, %r13d	;, _61
	jmp	.L160	;
.L162:
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp147, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp125
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp125
	ja	.L178	;,
	movl	$0, %r13d	;, _61
.L175:
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; left_74->type, left_74->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp148, _9
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp149, <retval>
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue	;
	movq	%rax, %rdx	; tmp150, _10
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r14, %rcx	; right,
	movq	%rbp, %rsi	; <retval>,
	movl	%r13d, %edi	; _61,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, inst
; src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L176:
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%r12)	;, left_75->kind
	jne	.L182	;,
.L173:
; src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; <retval>,
	movq	%r12, %rsi	; left,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp152, inst
; src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%r12)	;, left_75->is_get
	jne	.L183	;,
.L174:
; src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L153:
; src/tac.c:675: }
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L182:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L173	;
.L183:
; src/tac.c:666:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; <retval>,
	movq	%r12, %rsi	; left,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp153, inst
	jmp	.L174	;
.L178:
	movl	$0, %r13d	;, _61
	jmp	.L172	;
.L161:
; src/tac.c:39:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %r13d	;, _61
	jmp	.L160	;
.L177:
; src/tac.c:35:     switch (op) {
	movl	$2, %r13d	;, _61
	jmp	.L160	;
.L163:
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp159, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp140
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp140
	ja	.L184	;,
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%r14, %rbp	; right, <retval>
	jmp	.L176	;
.L184:
; src/tac.c:46:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %r13d	;, _61
	jmp	.L172	;
	.size	tac_expression, .-tac_expression
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
	movq	%rdi, %r14	; tmp181, if_
	movq	%rsi, %rbx	; tmp182, status
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r12	; tmp183, then_label
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp184, else_label
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp185
	je	.L186	;,
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:469:         end_label = else_label;
	movq	%rbp, 24(%rsp)	; else_label, %sfp
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp186
	jne	.L187	;,
.L186:
; src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, 24(%rsp)	; tmp187, %sfp
.L187:
; src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	24(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, 16(%rsp)	; tmp188, %sfp
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%r14), %rdi	; if__61(D)->condition, if__61(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r15	; tmp189, condition
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %r13	; tmp190, _6
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rsi	; then_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp191, _7
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %rcx	; _6,
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp192, inst
; src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:478:     Block* then_block = create_block(then_label);
	movq	%r12, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r12	; tmp193, then_block
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _10->blocks, _10->blocks
	movq	%r12, %rsi	; then_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:480:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	; then_block, status_56(D)->current_block
; src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rdi	; if__61(D)->body, if__61(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp194, then_statements
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L188	;
.L189:
; src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L188:
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp195, statement
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L189	;,
; src/tac.c:487:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp196, jump_to_end
; src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp197
	je	.L202	;,
.L190:
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp213
	je	.L203	;,
.L196:
; src/tac.c:538:     Block* end_block = create_block(end_label);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %rbp	; tmp218, end_block
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _40->blocks, _40->blocks
	movq	%rbp, %rsi	; end_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:540:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_56(D)->current_block
; src/tac.c:542: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L202:
; src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp198, elif_list
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L191	;
.L204:
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	; tmp204
	cmovne	24(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L192	;
.L194:
; src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L193:
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp210, elif_statement
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L194	;,
; src/tac.c:518:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp211, jump_to_end
; src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _31->instructions, _31->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L191:
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r15, %rdi	; elif_list,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp212, elif
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L190	;,
; src/tac.c:496:             Block* else_if_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp199, else_if_block
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	movq	%rbp, %rsi	; else_if_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:498:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	; else_if_block, status_56(D)->current_block
; src/tac.c:500:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r13	; tmp200, then_label
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp201, else_label
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%r12), %rdi	; elif_90->condition, elif_90->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, 8(%rsp)	; tmp202, %sfp
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r15, %rdi	; elif_list,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp203
	jne	.L204	;,
.L192:
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, (%rsp)	; tmp205, %sfp
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %rsi	; then_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp206, _25
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp207, inst
; src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _26->instructions, _26->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:509:             then_block = create_block(then_label);
	movq	%r13, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r13	; tmp208, then_block
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _28->blocks, _28->blocks
	movq	%r13, %rsi	; then_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:511:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	; then_block, status_56(D)->current_block
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rdi	; elif_90->body, elif_90->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp209, elif_statements
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L193	;
.L203:
; src/tac.c:525:         Block* else_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp214, else_block
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	movq	%rbp, %rsi	; else_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:527:         status->current_block = else_block;
	movq	%rbp, 16(%rbx)	; else_block, status_56(D)->current_block
; src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp215, else_statements
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L197	;
.L198:
; src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L197:
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp216, else_statement
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L198	;,
; src/tac.c:534:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp217, jump_to_end
; src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _38->instructions, _38->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L196	;
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
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:421:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_30(D)->type, _1
; src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L206	;,
	movq	%rdi, %rbx	; tmp143, statement
	movq	%rsi, %rbp	; tmp144, status
	movl	%ecx, %ecx	; _1, _1
	leaq	.L208(%rip), %rdx	;, tmp115
	movslq	(%rdx,%rcx,4), %rax	;, tmp117
	addq	%rdx, %rax	; tmp115, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
	.align 4
.L208:
	.long	.L215-.L208
	.long	.L214-.L208
	.long	.L213-.L208
	.long	.L212-.L208
	.long	.L211-.L208
	.long	.L210-.L208
	.long	.L209-.L208
	.long	.L207-.L208
	.text
.L215:
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_30(D)->stmt.expr, statement_30(D)->stmt.expr
	call	tac_expression	;
.L205:
; src/tac.c:461: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L214:
; src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	movq	(%rdi), %rdi	; statement_30(D)->stmt.var, statement_30(D)->stmt.var
	movl	$118, %edx	;,
	call	tac_variable	;
; src/tac.c:423:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, VAR_VAR); break;
	jmp	.L205	;
.L213:
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_30(D)->stmt.if_stmt, statement_30(D)->stmt.if_stmt
	call	tac_if	;
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L205	;
.L212:
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_30(D)->stmt.while_stmt, statement_30(D)->stmt.while_stmt
	call	tac_while	;
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L205	;
.L211:
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_30(D)->stmt.for_stmt, statement_30(D)->stmt.for_stmt
	call	tac_for	;
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L205	;
.L210:
; src/tac.c:428:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_arg	;
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	(%rbx), %rdi	; statement_30(D)->stmt.return_expr, _7
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _7
	je	.L217	;,
; src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
.L217:
; src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; return_value,
	movl	$21, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp147, _8
; src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	16(%rbp), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:432:             break;
	jmp	.L205	;
.L209:
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_31(D)->end_labels, status_31(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp148
	jne	.L218	;,
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbp), %rax	; status_31(D)->end_labels, status_31(D)->end_labels
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _13->tail, _13->tail
	movq	8(%rax), %rsi	; _14->content, label
; src/tac.c:437:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L218	;,
; src/tac.c:438:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp149, inst
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _15->instructions, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:440:                     break;
	jmp	.L205	;
.L218:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp133
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L205	;
.L207:
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_31(D)->start_labels, status_31(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp150
	jne	.L219	;,
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbp), %rax	; status_31(D)->start_labels, status_31(D)->start_labels
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _20->tail, _20->tail
	movq	8(%rax), %rsi	; _21->content, label
; src/tac.c:448:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L219	;,
; src/tac.c:449:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, inst
; src/tac.c:450:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _22->instructions, _22->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:451:                     break;
	jmp	.L205	;
.L219:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp140
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L205	;
.L206:
	leaq	.LC24(%rip), %rdx	;, tmp142
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:461: }
	jmp	.L205	;
	.size	tac_statement, .-tac_statement
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp171, for_
	movq	%rsi, %rbx	; tmp172, status
; src/tac.c:546:     if (for_->initializer != NULL)
	movq	(%rdi), %rdi	; for__53(D)->initializer, _1
; src/tac.c:546:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L222	;,
; src/tac.c:547:         tac_variable(for_->initializer, status, VAR_VAR);
	movl	$118, %edx	;,
	call	tac_variable	;
.L222:
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r13	; tmp173, condition_label
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r15	; tmp174, body_label
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r14	; tmp175, end_label
; src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L223	;,
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp176, _3
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp177, inst
; src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:556:         Block* condition_block = create_block(condition_label);
	movq	%r13, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp178, condition_block
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	movq	%rbp, %rsi	; condition_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:558:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; condition_block, status_54(D)->current_block
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%r12), %rdi	; for__53(D)->condition, for__53(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, 8(%rsp)	; tmp179, %sfp
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp180, _9
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp181, _10
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rcx	; _9,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp182, inst
; src/tac.c:562:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L224:
; src/tac.c:569:     Block* body_block = create_block(body_label);
	movq	%r15, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp185, body_block
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _16->blocks, _16->blocks
	movq	%rbp, %rsi	; body_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:571:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; body_block, status_54(D)->current_block
; src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, 8(%rsp)	; increment_label, %sfp
; src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__53(D)->increment
	je	.L225	;,
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp187, _19
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
.L226:
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp190, _26
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__53(D)->body, for__53(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp191, body_statements
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L228	;
.L223:
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp183, _13
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp184, inst
; src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L224	;
.L225:
; src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L227	;,
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp188, _22
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L226	;
.L227:
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp189, _24
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L226	;
.L229:
; src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L228:
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp192, statement
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L229	;,
; src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_54(D)->start_labels, status_54(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_54(D)->end_labels, status_54(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__53(D)->increment
	je	.L230	;,
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	8(%rsp), %rbp	; %sfp, increment_label
	movq	%rbp, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp193, _32
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp194, inst
; src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:591:         Block* increment_block = create_block(increment_label);
	movq	%rbp, %rdi	; increment_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp195, increment_block
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	movq	%rbp, %rsi	; increment_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:593:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; increment_block, status_54(D)->current_block
; src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%r12), %rdi	; for__53(D)->increment, for__53(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
.L230:
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp196, _38
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp197, inst
; src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__53(D)->condition
	je	.L233	;,
.L231:
; src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_54(D)->current_block, status_54(D)->current_block
	movq	8(%rax), %rdi	; _41->instructions, _41->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:602:     Block* end_block = create_block(end_label);
	movq	%r14, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp200, end_block
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_54(D)->current_subroutine, status_54(D)->current_subroutine
	movq	32(%rax), %rdi	; _43->blocks, _43->blocks
	movq	%rbp, %rsi	; end_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:604:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_54(D)->current_block
; src/tac.c:606: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L233:
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp198, _40
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp199, inst
	jmp	.L231	;
	.size	tac_for, .-tac_for
	.globl	tac_while
	.type	tac_while, @function
tac_while:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r13	; tmp138, while_
	movq	%rsi, %rbx	; tmp139, status
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp140, condition_label
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp141, _1
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp142, inst
; src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:613:     Block* condition_block = create_block(condition_label);
	movq	%rbp, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r12	; tmp143, condition_block
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	movq	%r12, %rsi	; condition_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:615:     status->current_block = condition_block;
	movq	%r12, 16(%rbx)	; condition_block, status_27(D)->current_block
; src/tac.c:617:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r14	; tmp144, body_label
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r12	; tmp145, end_label
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	0(%r13), %rdi	; while__42(D)->condition, while__42(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, 8(%rsp)	; tmp146, %sfp
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %r15	; tmp147, _7
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp148, _8
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rcx	; _7,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp149, inst
; src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:623:     Block* body_block = create_block(body_label);
	movq	%r14, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp150, body_block
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	movq	%r14, %rsi	; body_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:625:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_27(D)->current_block
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp151, _13
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp152, _15
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r13), %rdi	; while__42(D)->body, while__42(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp153, body_statements
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L235	;
.L236:
; src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L235:
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r13, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp154, statement
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L236	;,
; src/tac.c:633:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:634:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp155, _20
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp156, inst
; src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:639:     Block* end_block = create_block(end_label);
	movq	%r12, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp157, end_block
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	32(%rax), %rdi	; _23->blocks, _23->blocks
	movq	%rbp, %rsi	; end_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:641:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_27(D)->current_block
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
	.globl	tac_function
	.type	tac_function, @function
tac_function:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp112, function
	movq	%rsi, %rbx	; tmp113, status
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rdi), %rsi	; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rdi), %rdi	; function_16(D)->name, function_16(D)->name
	call	create_subroutine	;
	movq	%rax, %rbp	; tmp114, subroutine
; src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	movq	%rbp, %rsi	; subroutine,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r13), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp115, parameters
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L239	;
.L240:
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp116, _8
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_18->parameters, subroutine_18->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L239:
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L240	;,
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rdi	; tmp118, _10
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
	movq	%rax, %r12	; tmp119, block
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:329:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r13), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp120, statements
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L241	;
.L242:
; src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L241:
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp121, statement
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L242	;,
; src/tac.c:336:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; src/tac.c:338: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_function, .-tac_function
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp142, method
	movq	%rsi, %rbx	; tmp143, status
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rdi), %rsi	; method_33(D)->return_type, method_33(D)->return_type
	movq	(%rdi), %rdi	; method_33(D)->name, method_33(D)->name
	call	create_subroutine	;
	movq	%rax, %rbp	; tmp144, subroutine
; src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_36(D)->current_subroutine
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_36(D)->tac, status_36(D)->tac
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	movq	%rbp, %rsi	; subroutine,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r13), %rdi	; method_33(D)->parameters, method_33(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp145, parameters
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L245	;
.L246:
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_42->type, parameter_42->type
	movq	8(%rax), %rdi	; parameter_42->name, parameter_42->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp146, _8
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_35->parameters, subroutine_35->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L245:
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L246	;,
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rdi	; tmp148, _10
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
	movq	%rax, %r12	; tmp149, block
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_35->blocks, subroutine_35->blocks
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:353:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_36(D)->current_block
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_36(D)->current_class, status_36(D)->current_class
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _13->name, _13->name
	movq	8(%rax), %rdi	; _14->name, _14->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp150, _16
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%r13), %rax	; method_33(D)->name, method_33(D)->name
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _17->name, _17->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp151
	je	.L251	;,
.L247:
; src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r13), %rdi	; method_33(D)->body, method_33(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp156, statements
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L248	;
.L251:
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	; status_36(D)->current_class, status_36(D)->current_class
	movq	(%rax), %rsi	; _20->name, _20->name
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp152, _22
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp153, temp
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	; status_36(D)->current_class, tmp159
	leaq	24(%rax), %rsi	;, tmp138
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp154, _25
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %ecx	;,
	movq	%rbp, %rsi	; temp,
	movl	$18, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp155, _26
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r12), %rdi	; block_45->instructions, block_45->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L247	;
.L249:
; src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L248:
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp157, statement
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L249	;,
; src/tac.c:364:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_36(D)->current_subroutine
; src/tac.c:366: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r13	; tmp105, class
	movq	%rsi, %rbp	; tmp106, status
; src/tac.c:369:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_12(D)->current_class
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_13(D)->members, class_13(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp107, members
; src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%r13), %r14	; class_13(D)->name, _2
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp108, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%r12)	; tmp109, table_28->attributes
; src/tac.c:10:     table->name = name;
	movq	%r14, 8(%r12)	; _2, table_28->name
; src/tac.c:11:     table->size = 0;
	movq	$0, 16(%r12)	;, table_28->size
; src/tac.c:374:     attr_table->size = class->size;
	movq	24(%r13), %rax	; class_13(D)->size, _3
; src/tac.c:374:     attr_table->size = class->size;
	movq	%rax, 16(%r12)	; _3, table_28->size
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_12(D)->tac, status_12(D)->tac
	movq	(%rax), %rdi	; _4->attribute_tables, _4->attribute_tables
	movq	%r12, %rsi	; table,
	call	*list_append@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC25(%rip), %r12	;, tmp104
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L253	;
.L254:
; src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_22->content.method, member_22->content.method
	movq	%rbp, %rsi	; status,
	call	tac_method	;
.L253:
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L261	;,
; src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %ecx	; member_22->type, _6
; src/tac.c:377:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L254	;,
	cmpl	$1, %ecx	;, _6
	je	.L255	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdx	; tmp104,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L253	;
.L255:
; src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_22->content.variable, member_22->content.variable
	movl	$97, %edx	;,
	movq	%rbp, %rsi	; status,
	call	tac_variable	;
; src/tac.c:383:                 break;
	jmp	.L253	;
.L261:
; src/tac.c:389:     status->current_class = NULL;
	movq	$0, 24(%rbp)	;, status_12(D)->current_class
; src/tac.c:391: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC26:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp113, code
; src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp114, <retval>
; src/tac.c:62:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:62:     tac->attribute_tables = create_list();
	movq	%rax, 0(%r13)	; tmp115, tac_29->attribute_tables
; src/tac.c:63:     tac->entry_point = NULL;
	movq	$0, 8(%r13)	;, tac_29->entry_point
; src/tac.c:64:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:64:     tac->global_vars = create_list();
	movq	%rax, 16(%r13)	; tmp116, tac_29->global_vars
; src/tac.c:65:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:65:     tac->subroutines = create_list();
	movq	%rax, 24(%r13)	; tmp117, tac_29->subroutines
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp118, status
; src/tac.c:72:     status->tac = tac;
	movq	%r13, (%rax)	; <retval>, status_26->tac
; src/tac.c:73:     status->current_subroutine = NULL;
	movq	$0, 8(%rax)	;, status_26->current_subroutine
; src/tac.c:74:     status->current_block = NULL;
	movq	$0, 16(%rax)	;, status_26->current_block
; src/tac.c:75:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:75:     status->end_labels = create_list();
	movq	%rax, 32(%rbp)	; tmp119, status_26->end_labels
; src/tac.c:76:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rbp)	; tmp120, status_26->start_labels
; src/tac.c:77:     status->attr_count = 0;
	movq	$0, 48(%rbp)	;, status_26->attr_count
; src/tac.c:78:     status->param_count = 0;
	movq	$0, 56(%rbp)	;, status_26->param_count
; src/tac.c:79:     status->var_count = 0;
	movq	$0, 64(%rbp)	;, status_26->var_count
; src/tac.c:80:     status->temp_count = 0;
	movq	$0, 72(%rbp)	;, status_26->temp_count
; src/tac.c:81:     status->block_count = 0;
	movq	$0, 80(%rbp)	;, status_26->block_count
; src/tac.c:82:     status->subroutine_count = 0;
	movq	$0, 88(%rbp)	;, status_26->subroutine_count
; src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rdi	; code_17(D)->members, code_17(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp121, members
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC26(%rip), %r14	;, tmp112
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L263	;
.L270:
; src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rdi	; code_member_21->content.function, code_member_21->content.function
	movq	%rbp, %rsi	; status,
	call	tac_function	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	; code_member_21->content.function, code_member_21->content.function
	movq	(%rax), %rbx	; _4->name, _5
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rdi	; _5->name, _5->name
	movq	%r14, %rsi	; tmp112,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp122
	jne	.L263	;,
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L263	;
.L271:
; src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	tac_class	;
.L263:
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp123, code_member
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L269	;,
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L270	;,
; src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L271	;,
; src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L263	;,
; src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L263	;
.L269:
; src/tac.c:302: }
	movq	%r13, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_code, .-tac_code
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC18:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
