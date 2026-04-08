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
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:215:     inst->type = type;
	movl	%r13d, 24(%rax)	; type, inst_3->type
; src/tac.c:216:     inst->arg1 = arg1;
	movq	%r12, (%rax)	; arg1, inst_3->arg1
; src/tac.c:217:     inst->arg2 = arg2;
	movq	%rbp, 8(%rax)	; arg2, inst_3->arg2
; src/tac.c:218:     inst->arg3 = arg3;
	movq	%rbx, 16(%rax)	; arg3, inst_3->arg3
; src/tac.c:221: }
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
	.string	"[Warning] Unsupported type for size lookup: %s\n"
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
	.string	"[Warning] Unsupported argument type for create_arg: %d\n"
	.text
	.type	create_arg, @function
create_arg:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebp	; tmp110, kind
	movq	%rsi, %r12	; tmp111, value
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp112, <retval>
; src/tac.c:225:     arg->kind = kind;
	movl	%ebp, 16(%rax)	; kind, arg_15->kind
; src/tac.c:226:     arg->type = NULL;
	movq	$0, 8(%rax)	;, arg_15->type
; src/tac.c:227:     switch (kind) {
	cmpl	$8, %ebp	;, kind
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
	.long	.L64-.L65
	.text
.L72:
; src/tac.c:229:             arg->value.variable = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.variable
; src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	16(%r12), %rax	; MEM[(struct Var *)value_19(D)].type, _1
; src/tac.c:230:             arg->type = arg->value.variable->type;
	movq	%rax, 8(%rbx)	; _1, arg_15->type
.L73:
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rbx)	;, arg_15->is_get
; src/tac.c:268: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L71:
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	(%r12), %rax	; MEM[(long long int *)value_19(D)], _2
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rax, (%rbx)	; _2, arg_15->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rax	; name_int, name_int
	movq	%rax, 8(%rbx)	; name_int, arg_15->type
; src/tac.c:235:             break;
	jmp	.L73	;
.L70:
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	(%r12), %xmm0	; MEM[(double *)value_19(D)], _4
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rbx)	; _4, arg_15->value.float_value
; src/tac.c:238:             arg->type = name_float;
	movq	name_float(%rip), %rax	; name_float, name_float
	movq	%rax, 8(%rbx)	; name_float, arg_15->type
; src/tac.c:239:             break;
	jmp	.L73	;
.L69:
; src/tac.c:241:             arg->value.string_value = (string)value;
	movq	%r12, (%rbx)	; value, arg_15->value.string_value
; src/tac.c:242:             arg->type = name_string;
	movq	name_string(%rip), %rax	; name_string, name_string
	movq	%rax, 8(%rbx)	; name_string, arg_15->type
; src/tac.c:243:             break;
	jmp	.L73	;
.L68:
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movzbl	(%r12), %eax	; MEM[(char *)value_19(D)], _7
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	%al, (%rbx)	; _7, arg_15->value.bool_value
; src/tac.c:246:             arg->type = name_bool;
	movq	name_bool(%rip), %rax	; name_bool, name_bool
	movq	%rax, 8(%rbx)	; name_bool, arg_15->type
; src/tac.c:247:             break;
	jmp	.L73	;
.L67:
; src/tac.c:249:             arg->value.string_value = NULL;
	movq	$0, (%rbx)	;, arg_15->value.string_value
; src/tac.c:250:             arg->type = name_void;
	movq	name_void(%rip), %rax	; name_void, name_void
	movq	%rax, 8(%rbx)	; name_void, arg_15->type
; src/tac.c:251:             break;
	jmp	.L73	;
.L66:
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.label
; src/tac.c:254:             break;
	jmp	.L73	;
.L64:
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%r12, (%rbx)	; value, arg_15->value.subroutine
; src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	16(%r12), %rax	; MEM[(struct Var *)value_19(D)].type, _10
; src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	%rax, 8(%rbx)	; _10, arg_15->type
; src/tac.c:259:             break;
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
; src/tac.c:271:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L76	;,
	movq	%rsi, %rbp	; tmp97, status
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_9(D)->is_get
	jne	.L78	;,
.L76:
; src/tac.c:283: }
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L78:
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_9(D)->type, arg_9(D)->type
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp98, _3
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %r12	; tmp99, temp
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movl	$0, %ecx	;,
	movq	%rbx, %rdx	; arg,
	movq	%rax, %rsi	; temp,
	movl	$23, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp100, _4
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%rbp), %rax	; status_11(D)->current_block, status_11(D)->current_block
	movq	8(%rax), %rdi	; _5->instructions, _5->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:279:         return temp;
	movq	%r12, %rbx	; temp, arg
	jmp	.L76	;
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"[Warning] Unsupported variable access with NULL base\n"
	.align 8
.LC6:
	.string	"[Warning] Failed to generate variable access for base\n"
	.align 8
.LC7:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
	.align 8
.LC8:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
	.align 8
.LC9:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
	.align 8
.LC10:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
	.section	.rodata.str1.1
.LC11:
	.string	"arr"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"[Warning] Attempting to index non-array type: %s\n"
	.align 8
.LC13:
	.string	"[Warning] Failed to generate variable access for index\n"
	.align 8
.LC14:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
	.align 8
.LC15:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$24, %rsp	;,
	movq	%rdi, %r12	; tmp304, variable_access
	movq	%rsi, %rbx	; tmp305, status
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rdi)	;, variable_access_130(D)->type
	jne	.L80	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %rdi	; variable_access_130(D)->content.name, _2
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rdi, %rdi	; _2
	je	.L80	;,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rdi), %eax	; _2->kind, _3
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	;, tmp213
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	;, tmp213
	jbe	.L107	;,
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _3
	jne	.L83	;,
; src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movq	%rsi, %rcx	; status,
	movl	$118, %edx	;,
	movq	%rdi, %rsi	; _2,
	call	create_var	;
	movq	%rax, %rsi	; tmp308, _7
; src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp309, <retval>
.L79:
; src/tac.c:862: }
	movq	%rbp, %rax	; <retval>,
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L107:
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; _2->type, _2->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp306, _6
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp307, <retval>
; src/tac.c:749:             return result;
	jmp	.L79	;
.L83:
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _2->type, _2->type
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp310, _9
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp311, <retval>
; src/tac.c:757:             return result;
	jmp	.L79	;
.L80:
; src/tac.c:760:     if (variable_access->base == NULL) {
	movq	(%r12), %rbp	; variable_access_130(D)->base, <retval>
; src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rbp, %rbp	; <retval>
	je	.L108	;,
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; <retval>,
	call	tac_variable_access	;
	movq	%rax, %rdi	; tmp312, _12
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r13	; tmp313, base
; src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	; base
	je	.L109	;,
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%r12), %ecx	; variable_access_130(D)->type, _14
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _14
	je	.L110	;,
; src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _14
	je	.L111	;,
; src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _14
	jne	.L96	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movl	16(%rax), %ecx	; base_143->kind, _64
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	testl	%ecx, %ecx	; _64
	jne	.L97	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	; base_143->type, _65
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	;, _65->kind
	je	.L112	;,
.L98:
; src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%r13), %rax	; base_234->type, base_234->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; _77->name,
	leaq	.LC14(%rip), %rdx	;, tmp277
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:832:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L79	;
.L108:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp217
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:763:         return NULL;
	jmp	.L79	;
.L109:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$54, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC6(%rip), %rdi	;, tmp219
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:769:         return NULL;
	movq	%r13, %rbp	; base, <retval>
	jmp	.L79	;
.L110:
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	; base_143->type, _15
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _15->kind, _16
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp220
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp220
	jbe	.L113	;,
; src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _15->ast_node.scope, scope
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _16
	jne	.L88	;,
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_200].class_scope, scope
.L88:
; src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%r12), %rax	; variable_access_130(D)->content.attr_name, variable_access_130(D)->content.attr_name
	movq	8(%rax), %rsi	; _20->name, _20->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp314, <retval>
; src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L114	;,
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	; attr_203->kind, _27
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	;, _27
	je	.L115	;,
; src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _27
	je	.L116	;,
; src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _27
	jne	.L117	;,
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	0(%rbp), %rsi	; attr_203->type, attr_203->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp319, _43
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp320, <retval>
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%r12), %rdi	; variable_access_130(D)->content.attr_name, _44
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rdi), %rsi	; _44->type, _44->type
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp321, _46
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	; tmp322, _47
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%r13, %rdx	; base,
	movq	%rbp, %rsi	; <retval>,
	movl	$15, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp323, inst
; src/tac.c:799:         temp->is_get = true;
	movb	$1, 20(%rbp)	;, temp_206->is_get
; src/tac.c:800:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_131(D)->current_block, status_131(D)->current_block
	movq	8(%rax), %rdi	; _48->instructions, _48->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:802:         return temp;
	jmp	.L79	;
.L113:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _15->name, _15->name
	leaq	.LC7(%rip), %rdx	;, tmp223
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:775:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L79	;
.L114:
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_143->type, base_143->type
	movq	8(%r12), %rdx	; variable_access_130(D)->content.attr_name, variable_access_130(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _24->name, _24->name
	movq	8(%rax), %r8	; _22->name,
	leaq	.LC8(%rip), %rdx	;, tmp231
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	jmp	.L79	;
.L115:
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_143->type, base_143->type
	movq	8(%r12), %rdx	; variable_access_130(D)->content.attr_name, variable_access_130(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _30->name, _30->name
	movq	8(%rax), %r8	; _28->name,
	leaq	.LC9(%rip), %rdx	;, tmp237
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %rsi	; attr_203->type, attr_203->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; <retval>,
	call	create_var	;
	movq	%rax, %rsi	; tmp315, _34
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp316, <retval>
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L79	;
.L116:
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	0(%rbp), %rsi	; attr_203->type, attr_203->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	%rbp, %rdi	; <retval>,
	call	create_var	;
	movq	%rax, %rsi	; tmp317, _36
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp318, <retval>
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	.L79	;
.L117:
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rax	; base_143->type, base_143->type
	movq	8(%r12), %rdx	; variable_access_130(D)->content.attr_name, variable_access_130(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _39->name, _39->name
	movq	8(%rax), %r8	; _37->name,
	leaq	.LC10(%rip), %rdx	;, tmp245
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:795:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L79	;
.L111:
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	; base_143->type, base_143->type
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rdi	; _50->name, _50->name
	leaq	.LC11(%rip), %rsi	;, tmp255
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp324
	jne	.L118	;,
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%r12), %rdi	; variable_access_130(D)->content.index, variable_access_130(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp325, _58
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp326, index
; src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	; index
	je	.L119	;,
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movq	name_int(%rip), %rsi	; name_int,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp327, _61
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp328, <retval>
; src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%r12, %rcx	; index,
	movq	%r13, %rdx	; base,
	movq	%rax, %rsi	; <retval>,
	movl	$16, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp329, inst
; src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%rbp)	;, temp_195->is_get
; src/tac.c:821:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_131(D)->current_block, status_131(D)->current_block
	movq	8(%rax), %rdi	; _62->instructions, _62->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:823:         return temp;
	jmp	.L79	;
.L118:
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	0(%r13), %rax	; base_143->value.variable, base_143->value.variable
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	; _53->original_name, _53->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _54->name, _54->name
	leaq	.LC12(%rip), %rdx	;, tmp260
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:808:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L79	;
.L119:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$55, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC13(%rip), %rdi	;, tmp263
	call	*fwrite@GOTPCREL(%rip)	;
; src/tac.c:814:             return NULL;
	movq	%r12, %rbp	; index, <retval>
	jmp	.L79	;
.L112:
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _65->name, _65->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp330, _69
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%r13), %rax	; base_143->type, base_143->type
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _70->ast_node.class, _70->ast_node.class
	movq	16(%rax), %rdi	; _71->class_scope, _71->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp331, attr
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rax), %rsi	; attr_146->type, attr_146->type
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp332, _74
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %edi	;,
	call	create_arg	;
	movq	%rax, %r13	; tmp333, base
.L97:
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movl	16(%r13), %ecx	; base_119->kind, _64
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rcx), %eax	;, tmp273
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	;, tmp273
	ja	.L98	;,
; src/tac.c:834:         long long arg_count = 0;
	movq	$0, (%rsp)	;, arg_count
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp334, arguments
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%r13)	;, base_119->kind
	je	.L120	;,
.L101:
; src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%r12), %rdi	; variable_access_130(D)->content.args, variable_access_130(D)->content.args
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp344, args
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	8(%rsp), %r14	;, tmp303
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	jmp	.L102	;
.L120:
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%r13), %rax	; base_119->type, base_119->type
	movq	8(%rax), %rdi	; _82->name, _82->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp335, _84
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	0(%r13), %rax	; base_119->value.subroutine, base_119->value.subroutine
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	; _85->original_name, _85->original_name
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rdi	; _86->name, _86->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	; tmp336
	je	.L101	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	(%r12), %rax	; variable_access_130(D)->base, variable_access_130(D)->base
	movq	(%rax), %r8	; _89->base,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$8, %edi	;,
	call	*create_primary@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp337, _91
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp338, _92
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp339, _93
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r14	; tmp340, self
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%rax), %rdi	; self_158->type, self_158->type
	call	get_type_size	;
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 8(%rsp)	; tmp341, MEM[(long long int *)_230]
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	8(%rsp), %rsi	;, tmp290
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp342, _97
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movl	$0, %ecx	;,
	movq	%r14, %rdx	; self,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp343, _98
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rbp, %rdi	; arguments,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:840:             arg_count++;
	addq	$1, (%rsp)	;, arg_count
	jmp	.L101	;
.L103:
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp345, _102
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r15	; tmp346, arg
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rdi	; arg_181->type, arg_181->type
	call	get_type_size	;
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 8(%rsp)	; tmp347, MEM[(long long int *)_230]
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r14, %rsi	; tmp303,
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp348, _106
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movl	$0, %ecx	;,
	movq	%r15, %rdx	; arg,
	movl	$17, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp349, _107
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rbp, %rdi	; arguments,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:848:             arg_count++;
	addq	$1, (%rsp)	;, arg_count
.L102:
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp350, arg_expr
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	jne	.L103	;,
	jmp	.L104	;
.L105:
; src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	; status_131(D)->current_block, status_131(D)->current_block
	movq	8(%rax), %rdi	; _110->instructions, _110->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L104:
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	%rbp, %rdi	; arguments,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp351, arg
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	; arg
	jne	.L105	;,
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%r13), %rsi	; base_119->type, base_119->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp352, _113
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp353, <retval>
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rsp, %rsi	;, tmp297
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rcx	; tmp354, _114
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%r13, %rdx	; base,
	movq	%rbp, %rsi	; <retval>,
	movl	$22, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp355, _115
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	; status_131(D)->current_block, status_131(D)->current_block
	movq	8(%rax), %rdi	; _116->instructions, _116->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:856:         return temp;
	jmp	.L79	;
.L96:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC15(%rip), %rdx	;, tmp301
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:860:         return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L79	;
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"[Warning] Unsupported type for negation: %s\n"
	.align 8
.LC18:
	.string	"[Warning] Unsupported primary type for tac_primary: %d\n"
	.text
	.globl	tac_primary
	.type	tac_primary, @function
tac_primary:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
; src/tac.c:681:     switch (primary->type) {
	movl	8(%rdi), %ecx	; primary_36(D)->type, _1
; src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L122	;,
	movq	%rsi, %rbx	; tmp150, status
	movl	%ecx, %ecx	; _1, _1
	leaq	.L124(%rip), %rdx	;, tmp118
	movslq	(%rdx,%rcx,4), %rax	;, tmp120
	addq	%rdx, %rax	; tmp118, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L124:
	.long	.L132-.L124
	.long	.L131-.L124
	.long	.L130-.L124
	.long	.L129-.L124
	.long	.L128-.L124
	.long	.L127-.L124
	.long	.L126-.L124
	.long	.L125-.L124
	.long	.L123-.L124
	.text
.L132:
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$10, %edx	;,
	movl	$0, %esi	;,
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 8(%rsp)	; tmp151, MEM[(long long int *)_91]
; src/tac.c:685:             return create_arg(ARG_INT, &t);
	leaq	8(%rsp), %rsi	;, tmp124
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp152, <retval>
.L121:
; src/tac.c:742: }
	movq	%rbp, %rax	; <retval>,
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L131:
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$0, %esi	;,
	call	*strtod@GOTPCREL(%rip)	;
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; tmp153, MEM[(double *)_91]
; src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	leaq	8(%rsp), %rsi	;, tmp126
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp154, <retval>
	jmp	.L121	;
.L130:
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %rsi	; primary_36(D)->value.literal_value, primary_36(D)->value.literal_value
	movl	$3, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp155, <retval>
	jmp	.L121	;
.L129:
; src/tac.c:695:             bool t = true;
	movb	$1, 8(%rsp)	;, MEM[(char *)_91]
; src/tac.c:697:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp128
	movl	$4, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp156, <retval>
	jmp	.L121	;
.L128:
; src/tac.c:700:             bool t = false;
	movb	$0, 8(%rsp)	;, MEM[(char *)_91]
; src/tac.c:702:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp129
	movl	$4, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp157, <retval>
	jmp	.L121	;
.L127:
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr, primary_36(D)->value.expr
	call	tac_expression	;
	movq	%rax, %rbp	; tmp158, <retval>
	jmp	.L121	;
.L126:
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
	movq	%rax, %rdi	; tmp159, _9
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp160, operand
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movq	name_bool(%rip), %rsi	; name_bool,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp161, _11
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp162, <retval>
; src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movl	$0, %ecx	;,
	movq	%r12, %rdx	; operand,
	movq	%rax, %rsi	; <retval>,
	movl	$13, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp163, inst
; src/tac.c:711:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	; _12->instructions, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:713:             return temp;
	jmp	.L121	;
.L125:
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand, primary_36(D)->value.operand
	call	tac_primary	;
	movq	%rax, %rdi	; tmp164, _15
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r12	; tmp165, operand
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp166, _17
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp167, <retval>
; src/tac.c:719:             long long zero_int = 0;
	movq	$0, (%rsp)	;, zero_int
; src/tac.c:720:             double neg_one_float = -1.0;
	movq	.LC16(%rip), %rax	;, tmp174
	movq	%rax, 8(%rsp)	; tmp174, MEM[(double *)_91]
; src/tac.c:721:             if (operand->type == name_int)
	movq	8(%r12), %rax	; operand_42->type, _18
; src/tac.c:721:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	je	.L139	;,
; src/tac.c:723:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	je	.L140	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	leaq	.LC17(%rip), %rdx	;, tmp142
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:728:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L121	;
.L139:
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rsp, %rsi	;, tmp138
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp168, _20
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbp, %rsi	; <retval>,
	movl	$1, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp169, inst
	jmp	.L135	;
.L140:
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	8(%rsp), %rsi	;, tmp139
	movl	$2, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp170, _22
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbp, %rsi	; <retval>,
	movl	$2, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp171, inst
.L135:
; src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	; _25->instructions, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:732:             return temp;
	jmp	.L121	;
.L123:
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.var, primary_36(D)->value.var
	call	tac_variable_access	;
	movq	%rax, %rbp	; tmp172, <retval>
	jmp	.L121	;
.L122:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC18(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:740:             return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L121	;
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
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
; src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
	je	.L169	;,
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
	call	tac_expression	;
	movq	%rax, %rdi	; tmp145, _4
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r14	; tmp146, right
; src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%rbp), %r13d	; expression_30(D)->operator, _61
; src/tac.c:35:     switch (op) {
	cmpl	$18, %r13d	;, _61
	ja	.L144	;,
	movl	%r13d, %eax	; _61, _61
	leaq	.L146(%rip), %rdx	;, tmp119
	movslq	(%rdx,%rax,4), %rax	;, tmp121
	addq	%rdx, %rax	; tmp119, tmp122
	jmp	*%rax	; tmp122
	.section	.rodata
	.align 4
	.align 4
.L146:
	.long	.L150-.L146
	.long	.L149-.L146
	.long	.L165-.L146
	.long	.L147-.L146
	.long	.L145-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L148-.L146
	.long	.L151-.L146
	.long	.L150-.L146
	.long	.L149-.L146
	.long	.L165-.L146
	.long	.L147-.L146
	.long	.L145-.L146
	.text
.L169:
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
	call	tac_primary	;
	movq	%rax, %rbp	; tmp144, <retval>
; src/tac.c:652:         return result;
	jmp	.L141	;
.L147:
; src/tac.c:43:         case OP_DIV_ASSIGN: return INST_DIV;
	movl	$3, %r13d	;, _61
.L148:
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp158, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp137
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp137
	jbe	.L163	;,
.L160:
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; left_76->type, left_76->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp154, _17
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp155, <retval>
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue	;
	movq	%rax, %rdx	; tmp156, _18
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r14, %rcx	; right,
	movq	%rbp, %rsi	; <retval>,
	movl	%r13d, %edi	; _61,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp157, inst
	jmp	.L162	;
.L145:
; src/tac.c:45:         case OP_MOD_ASSIGN: return INST_MOD;
	movl	$4, %r13d	;, _61
	jmp	.L148	;
.L144:
; src/tac.c:56:         default: return INST_NONE;
	movl	$25, %r13d	;, _61
	jmp	.L148	;
.L150:
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp147, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp125
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp125
	ja	.L166	;,
	movl	$0, %r13d	;, _61
.L163:
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%r12), %rsi	; left_74->type, left_74->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp148, _9
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp149, <retval>
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%r12, %rdi	; left,
	call	load_rvalue	;
	movq	%rax, %rdx	; tmp150, _10
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r14, %rcx	; right,
	movq	%rbp, %rsi	; <retval>,
	movl	%r13d, %edi	; _61,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, inst
; src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L164:
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%r12)	;, left_75->kind
	jne	.L170	;,
.L161:
; src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; <retval>,
	movq	%r12, %rsi	; left,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp152, inst
; src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%r12)	;, left_75->is_get
	jne	.L171	;,
.L162:
; src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L141:
; src/tac.c:678: }
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L170:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$57, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L161	;
.L171:
; src/tac.c:669:             inst = create_instruction(INST_STORE, left, right, NULL);
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; <retval>,
	movq	%r12, %rsi	; left,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp153, inst
	jmp	.L162	;
.L166:
	movl	$0, %r13d	;, _61
	jmp	.L160	;
.L149:
; src/tac.c:39:         case OP_SUB_ASSIGN: return INST_SUB;
	movl	$1, %r13d	;, _61
	jmp	.L148	;
.L165:
; src/tac.c:35:     switch (op) {
	movl	$2, %r13d	;, _61
	jmp	.L148	;
.L151:
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%rbp), %rdi	; expression_30(D)->expr_left, expression_30(D)->expr_left
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %r12	; tmp159, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%rbp), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp140
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp140
	ja	.L172	;,
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%r14, %rbp	; right, <retval>
	jmp	.L164	;
.L172:
; src/tac.c:46:         case OP_ASSIGN: return INST_ASSIGN;
	movl	$14, %r13d	;, _61
	jmp	.L160	;
	.size	tac_expression, .-tac_expression
	.section	.rodata.str1.8
	.align 8
.LC20:
	.string	"Error: create_attribute received NULL table\n"
	.align 8
.LC21:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$16, %rsp	;,
	movq	%rdi, %rbp	; tmp125, variable
	movq	%rsi, %rbx	; tmp126, status
; src/tac.c:403:     if (is_attr) {
	testb	%dl, %dl	; tmp127
	je	.L174	;,
; src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rdi	; _1->attribute_tables, _1->attribute_tables
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp128, attr_table
; src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_21(D)->tac, status_21(D)->tac
	movq	(%rax), %rdi	; _3->attribute_tables, _3->attribute_tables
	movq	%r12, %rsi	; attr_table,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	0(%rbp), %r13	; variable_20(D)->type, _5
	movq	8(%rbp), %r14	; variable_20(D)->name, _6
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp129, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r13, %rsi	; _5,
	movq	%r14, %rdi	; _6,
	call	create_var	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, 0(%rbp)	; tmp130, attr_38->var
; src/tac.c:198:     attr->type = type;
	movq	%r13, 8(%rbp)	; _5, attr_38->type
; src/tac.c:199:     attr->offset = offset;
	movq	$0, 16(%rbp)	;, attr_38->offset
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%r12, %r12	; attr_table
	jne	.L183	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp117
	call	*fwrite@GOTPCREL(%rip)	;
.L176:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$63, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rdi	;, tmp119
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L173	;
.L183:
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r12), %rax	; attr_table_35->size, _43
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%rbp)	; _43, attr_38->offset
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _5,
	call	get_type_size	;
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%r12)	; tmp131, attr_table_35->size
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	(%r12), %rdi	; attr_table_35->attributes, _48
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _48
	je	.L176	;,
; src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L173	;
.L174:
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	(%rdi), %rsi	; variable_20(D)->type, variable_20(D)->type
	movq	8(%rdi), %rdi	; variable_20(D)->name, variable_20(D)->name
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	call	create_var	;
	movq	%rax, %r12	; tmp132, var
; src/tac.c:414:         if (variable->value != NULL)
	movq	16(%rbp), %rdi	; variable_20(D)->value, _9
; src/tac.c:414:         if (variable->value != NULL)
	testq	%rdi, %rdi	; _9
	je	.L179	;,
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp133, _10
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %rbp	; tmp134, value
.L180:
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%r12, %rsi	; var,
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp136, _11
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; value,
	movl	$14, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp137, _12
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	; status_21(D)->current_block, status_21(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L173:
; src/tac.c:421: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L179:
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	$0, 8(%rsp)	;, D.6055
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	leaq	8(%rsp), %rsi	;, tmp122
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp135, value
	jmp	.L180	;
	.size	tac_variable, .-tac_variable
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
	movq	%rdi, %r14	; tmp183, if_
	movq	%rsi, %rbx	; tmp184, status
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r12	; tmp185, then_label
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp186, else_label
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r14), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp187
	je	.L185	;,
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r14), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:472:         end_label = else_label;
	movq	%rbp, 24(%rsp)	; else_label, %sfp
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp188
	jne	.L186	;,
.L185:
; src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, 24(%rsp)	; tmp189, %sfp
.L186:
; src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	24(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, 16(%rsp)	; tmp190, %sfp
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r14), %rdi	; if__63(D)->condition, if__63(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp191, _6
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, %r15	; tmp192, condition
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %r13	; tmp193, _7
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r12, %rsi	; then_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp194, _8
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %rcx	; _7,
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp195, inst
; src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:481:     Block* then_block = create_block(then_label);
	movq	%r12, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r12	; tmp196, then_block
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	movq	%r12, %rsi	; then_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:483:     status->current_block = then_block;
	movq	%r12, 16(%rbx)	; then_block, status_58(D)->current_block
; src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r14), %rdi	; if__63(D)->body, if__63(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp197, then_statements
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	jmp	.L187	;
.L188:
; src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L187:
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r12, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp198, statement
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L188	;,
; src/tac.c:490:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp199, jump_to_end
; src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r14), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp200
	je	.L201	;,
.L189:
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r14), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp217
	je	.L202	;,
.L195:
; src/tac.c:541:     Block* end_block = create_block(end_label);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %rbp	; tmp222, end_block
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _42->blocks, _42->blocks
	movq	%rbp, %rsi	; end_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:543:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_58(D)->current_block
; src/tac.c:545: }
	addq	$40, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L201:
; src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r14), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp201, elif_list
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	jmp	.L190	;
.L203:
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r14), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	; tmp208
	cmovne	24(%rsp), %rbp	; else_label,, %sfp, else_label
	jmp	.L191	;
.L193:
; src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L192:
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r12, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp214, elif_statement
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	jne	.L193	;,
; src/tac.c:521:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp215, jump_to_end
; src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L190:
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	%r15, %rdi	; elif_list,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp216, elif
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L189	;,
; src/tac.c:499:             Block* else_if_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp202, else_if_block
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _19->blocks, _19->blocks
	movq	%rbp, %rsi	; else_if_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:501:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	; else_if_block, status_58(D)->current_block
; src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r13	; tmp203, then_label
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp204, else_label
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	(%r12), %rdi	; elif_93->condition, elif_93->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp205, _22
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, 8(%rsp)	; tmp206, %sfp
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	%r15, %rdi	; elif_list,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp207
	jne	.L203	;,
.L191:
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, (%rsp)	; tmp209, %sfp
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r13, %rsi	; then_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp210, _27
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	(%rsp), %rcx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp211, inst
; src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _28->instructions, _28->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:512:             then_block = create_block(then_label);
	movq	%r13, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r13	; tmp212, then_block
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _30->blocks, _30->blocks
	movq	%r13, %rsi	; then_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:514:             status->current_block = then_block;
	movq	%r13, 16(%rbx)	; then_block, status_58(D)->current_block
; src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r12), %rdi	; elif_93->body, elif_93->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp213, elif_statements
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	jmp	.L192	;
.L202:
; src/tac.c:528:         Block* else_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp218, else_block
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	32(%rax), %rdi	; _37->blocks, _37->blocks
	movq	%rbp, %rsi	; else_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:530:         status->current_block = else_block;
	movq	%rbp, 16(%rbx)	; else_block, status_58(D)->current_block
; src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r14), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp219, else_statements
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	jmp	.L196	;
.L197:
; src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L196:
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp220, else_statement
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	jne	.L197	;,
; src/tac.c:537:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	16(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp221, jump_to_end
; src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _40->instructions, _40->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L195	;
	.size	tac_if, .-tac_if
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"[Warning] 'break' statement used outside of loop\n"
	.align 8
.LC23:
	.string	"[Warning] 'continue' statement used outside of loop\n"
	.align 8
.LC24:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/tac.c:424:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_32(D)->type, _1
; src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L205	;,
	movq	%rdi, %rbx	; tmp145, statement
	movq	%rsi, %rbp	; tmp146, status
	movl	%ecx, %ecx	; _1, _1
	leaq	.L207(%rip), %rdx	;, tmp117
	movslq	(%rdx,%rcx,4), %rax	;, tmp119
	addq	%rdx, %rax	; tmp117, tmp120
	jmp	*%rax	; tmp120
	.section	.rodata
	.align 4
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
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.expr, statement_32(D)->stmt.expr
	call	tac_expression	;
	movq	%rax, %rdi	; tmp147, _3
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rbp, %rsi	; status,
	call	load_rvalue	;
.L204:
; src/tac.c:464: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L213:
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.var, statement_32(D)->stmt.var
	movl	$0, %edx	;,
	call	tac_variable	;
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	.L204	;
.L212:
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.if_stmt, statement_32(D)->stmt.if_stmt
	call	tac_if	;
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	.L204	;
.L211:
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.while_stmt, statement_32(D)->stmt.while_stmt
	call	tac_while	;
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	.L204	;
.L210:
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.for_stmt, statement_32(D)->stmt.for_stmt
	call	tac_for	;
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	.L204	;
.L209:
; src/tac.c:431:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_arg	;
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	(%rbx), %rdi	; statement_32(D)->stmt.return_expr, _8
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _8
	je	.L216	;,
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp149, _9
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbp, %rsi	; status,
	call	load_rvalue	;
.L216:
; src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	%rax, %rsi	; return_value,
	movl	$21, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, _10
; src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	movq	16(%rbp), %rax	; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:435:             break;
	jmp	.L204	;
.L208:
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_33(D)->end_labels, status_33(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp152
	jne	.L217	;,
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbp), %rax	; status_33(D)->end_labels, status_33(D)->end_labels
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _15->tail, _15->tail
	movq	8(%rax), %rsi	; _16->content, label
; src/tac.c:440:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L217	;,
; src/tac.c:441:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp153, inst
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rdi	; _17->instructions, _17->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:443:                     break;
	jmp	.L204	;
.L217:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$49, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rdi	;, tmp135
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L204	;
.L206:
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_33(D)->start_labels, status_33(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp154
	jne	.L218	;,
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbp), %rax	; status_33(D)->start_labels, status_33(D)->start_labels
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _22->tail, _22->tail
	movq	8(%rax), %rsi	; _23->content, label
; src/tac.c:451:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L218	;,
; src/tac.c:452:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp155, inst
; src/tac.c:453:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rdi	; _24->instructions, _24->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:454:                     break;
	jmp	.L204	;
.L218:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rdi	;, tmp142
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L204	;
.L205:
	leaq	.LC24(%rip), %rdx	;, tmp144
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:464: }
	jmp	.L204	;
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
	movq	%rdi, %r12	; tmp173, for_
	movq	%rsi, %rbx	; tmp174, status
; src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rdi), %rdi	; for__55(D)->initializer, _1
; src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L221	;,
; src/tac.c:550:         tac_variable(for_->initializer, status, false);
	movl	$0, %edx	;,
	call	tac_variable	;
.L221:
; src/tac.c:552:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r13	; tmp175, condition_label
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r15	; tmp176, body_label
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r14	; tmp177, end_label
; src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%r12)	;, for__55(D)->condition
	je	.L222	;,
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp178, _3
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp179, inst
; src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:559:         Block* condition_block = create_block(condition_label);
	movq	%r13, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp180, condition_block
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	movq	%rbp, %rsi	; condition_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:561:         status->current_block = condition_block;
	movq	%rbp, 16(%rbx)	; condition_block, status_56(D)->current_block
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%r12), %rdi	; for__55(D)->condition, for__55(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp181, _9
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, 8(%rsp)	; tmp182, %sfp
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rbp	; tmp183, _10
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp184, _11
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rbp, %rcx	; _10,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp185, inst
; src/tac.c:565:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _12->instructions, _12->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L223:
; src/tac.c:572:     Block* body_block = create_block(body_label);
	movq	%r15, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp188, body_block
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _17->blocks, _17->blocks
	movq	%rbp, %rsi	; body_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:574:     status->current_block = body_block;
	movq	%rbp, 16(%rbx)	; body_block, status_56(D)->current_block
; src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, 8(%rsp)	; increment_label, %sfp
; src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%r12)	;, for__55(D)->increment
	je	.L224	;,
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp190, _20
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
.L225:
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp193, _27
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_56(D)->end_labels, status_56(D)->end_labels
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%r12), %rdi	; for__55(D)->body, for__55(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp194, body_statements
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L227	;
.L222:
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp186, _14
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp187, inst
; src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _15->instructions, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L223	;
.L224:
; src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%r12)	;, for__55(D)->condition
	je	.L226	;,
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp191, _23
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L225	;
.L226:
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp192, _25
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L225	;
.L228:
; src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L227:
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%rbp, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp195, statement
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L228	;,
; src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_56(D)->end_labels, status_56(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%r12)	;, for__55(D)->increment
	je	.L229	;,
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	8(%rsp), %rbp	; %sfp, increment_label
	movq	%rbp, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp196, _33
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp197, inst
; src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _34->instructions, _34->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:594:         Block* increment_block = create_block(increment_label);
	movq	%rbp, %rdi	; increment_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp198, increment_block
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _36->blocks, _36->blocks
	movq	%rbp, %rsi	; increment_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:596:         status->current_block = increment_block;
	movq	%rbp, 16(%rbx)	; increment_block, status_56(D)->current_block
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%r12), %rdi	; for__55(D)->increment, for__55(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp199, _39
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
.L229:
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp200, _40
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp201, inst
; src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%r12)	;, for__55(D)->condition
	je	.L232	;,
.L230:
; src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:605:     Block* end_block = create_block(end_label);
	movq	%r14, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp204, end_block
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	32(%rax), %rdi	; _45->blocks, _45->blocks
	movq	%rbp, %rsi	; end_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:607:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_56(D)->current_block
; src/tac.c:609: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L232:
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r15, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp202, _42
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp203, inst
	jmp	.L230	;
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
	movq	%rdi, %r13	; tmp139, while_
	movq	%rsi, %rbx	; tmp140, status
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rbp	; tmp141, condition_label
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp142, _1
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp143, inst
; src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:616:     Block* condition_block = create_block(condition_label);
	movq	%rbp, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r12	; tmp144, condition_block
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	movq	%r12, %rsi	; condition_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:618:     status->current_block = condition_block;
	movq	%r12, 16(%rbx)	; condition_block, status_28(D)->current_block
; src/tac.c:620:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r14	; tmp145, body_label
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %r12	; tmp146, end_label
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	0(%r13), %rdi	; while__43(D)->condition, while__43(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rdi	; tmp147, _7
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rbx, %rsi	; status,
	call	load_rvalue	;
	movq	%rax, 8(%rsp)	; tmp148, %sfp
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %r15	; tmp149, _8
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rdx	; tmp150, _9
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rcx	; _8,
	movq	8(%rsp), %rsi	; %sfp,
	movl	$19, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp151, inst
; src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _10->instructions, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:626:     Block* body_block = create_block(body_label);
	movq	%r14, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp152, body_block
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rdi	; _12->blocks, _12->blocks
	movq	%r14, %rsi	; body_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:628:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_28(D)->current_block
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp153, _14
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp154, _16
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r13), %rdi	; while__43(D)->body, while__43(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp155, body_statements
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	jmp	.L234	;
.L235:
; src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L234:
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r13, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp156, statement
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L235	;,
; src/tac.c:636:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:637:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp157, _21
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp158, inst
; src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _22->instructions, _22->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:642:     Block* end_block = create_block(end_label);
	movq	%r12, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp159, end_block
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	32(%rax), %rdi	; _24->blocks, _24->blocks
	movq	%rbp, %rsi	; end_block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:644:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_28(D)->current_block
; src/tac.c:646: }
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
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rdi), %rsi	; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rdi), %rdi	; function_16(D)->name, function_16(D)->name
	call	create_subroutine	;
	movq	%rax, %rbp	; tmp114, subroutine
; src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	movq	%rbp, %rsi	; subroutine,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%r13), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp115, parameters
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L238	;
.L239:
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_25->type, parameter_25->type
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp116, _8
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_18->parameters, subroutine_18->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L238:
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L239	;,
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rdi	; tmp118, _10
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
	movq	%rax, %r12	; tmp119, block
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_18->blocks, subroutine_18->blocks
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:332:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_19(D)->current_block
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%r13), %rdi	; function_16(D)->body, function_16(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp120, statements
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	jmp	.L240	;
.L241:
; src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L240:
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp121, statement
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L241	;,
; src/tac.c:339:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_19(D)->current_subroutine
; src/tac.c:341: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_function, .-tac_function
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %r13	; tmp156, method
	movq	%rsi, %rbx	; tmp157, status
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rdi), %rsi	; method_43(D)->return_type, method_43(D)->return_type
	movq	(%rdi), %rdi	; method_43(D)->name, method_43(D)->name
	call	create_subroutine	;
	movq	%rax, %rbp	; tmp158, subroutine
; src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_46(D)->current_subroutine
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_46(D)->tac, status_46(D)->tac
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	movq	%rbp, %rsi	; subroutine,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%r13), %rdi	; method_43(D)->parameters, method_43(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp159, parameters
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	jmp	.L244	;
.L245:
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	(%rax), %rsi	; parameter_52->type, parameter_52->type
	movq	8(%rax), %rdi	; parameter_52->name, parameter_52->name
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp160, _8
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%rbp), %rdi	; subroutine_45->parameters, subroutine_45->parameters
	call	*list_append@GOTPCREL(%rip)	;
.L244:
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r12, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	jne	.L245	;,
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_var	;
	movq	%rax, %rdi	; tmp162, _10
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
	movq	%rax, %r12	; tmp163, block
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%rbp), %rdi	; subroutine_45->blocks, subroutine_45->blocks
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:356:     status->current_block = block;
	movq	%r12, 16(%rbx)	; block, status_46(D)->current_block
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%r13), %rdi	; method_43(D)->body, method_43(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp164, statements
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_46(D)->current_class, status_46(D)->current_class
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _14->name, _14->name
	movq	8(%rax), %rdi	; _15->name, _15->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp165, _17
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%r13), %rax	; method_43(D)->name, method_43(D)->name
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _18->name, _18->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp166
	jne	.L250	;,
; src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 8(%rax)	;, stmt_62->type
	jne	.L247	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; stmt_62->stmt.expr, _22
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	;, _22->operator
	jne	.L247	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	; _22->prim_left, _24
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	;, _24->type
	jne	.L247	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; _24->value.var, _26
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 16(%rax)	;, _26->type
	je	.L248	;,
.L247:
; src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	0(%r13), %rax	; method_43(D)->name, method_43(D)->name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _28->name, _28->name
	leaq	.LC25(%rip), %rdx	;, tmp151
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:363:             return;
	jmp	.L243	;
.L248:
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r14	; _26->content.name, self
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	; status_46(D)->current_class, tmp174
	leaq	24(%rax), %rsi	;, tmp152
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %edi	;,
	call	create_arg	;
	movq	%rax, %r13	; tmp168, _33
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r14), %rsi	; self_63->type, self_63->type
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%r14, %rdi	; self,
	call	create_var	;
	movq	%rax, %rsi	; tmp169, _35
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %edi	;,
	call	create_arg	;
	movq	%rax, %rsi	; tmp170, _36
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$0, %ecx	;,
	movq	%r13, %rdx	; _33,
	movl	$18, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp171, _37
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r12), %rdi	; block_55->instructions, block_55->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L250	;
.L251:
; src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
.L250:
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp172, statement
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	jne	.L251	;,
; src/tac.c:373:     status->current_subroutine = NULL;
	movq	$0, 8(%rbx)	;, status_46(D)->current_subroutine
.L243:
; src/tac.c:375: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_method, .-tac_method
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r12	; tmp104, class
	movq	%rsi, %rbp	; tmp105, status
; src/tac.c:378:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_11(D)->current_class
; src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_12(D)->members, class_12(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp106, members
; src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	(%r12), %r13	; class_12(D)->name, _2
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp107, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%r12)	; tmp108, table_26->attributes
; src/tac.c:10:     table->name = name;
	movq	%r13, 8(%r12)	; _2, table_26->name
; src/tac.c:11:     table->size = 0;
	movq	$0, 16(%r12)	;, table_26->size
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	0(%rbp), %rax	; status_11(D)->tac, status_11(D)->tac
	movq	(%rax), %rdi	; _3->attribute_tables, _3->attribute_tables
	movq	%r12, %rsi	; table,
	call	*list_append@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC26(%rip), %r12	;, tmp103
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	jmp	.L254	;
.L255:
; src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_20->content.method, member_20->content.method
	movq	%rbp, %rsi	; status,
	call	tac_method	;
.L254:
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%rbx, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L262	;,
; src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ecx	; member_20->type, _5
; src/tac.c:385:         switch (member->type) {
	testl	%ecx, %ecx	; _5
	je	.L255	;,
	cmpl	$1, %ecx	;, _5
	je	.L256	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%r12, %rdx	; tmp103,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L254	;
.L256:
; src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rdi	; member_20->content.variable, member_20->content.variable
	movl	$1, %edx	;,
	movq	%rbp, %rsi	; status,
	call	tac_variable	;
; src/tac.c:391:                 break;
	jmp	.L254	;
.L262:
; src/tac.c:397:     status->current_class = NULL;
	movq	$0, 24(%rbp)	;, status_11(D)->current_class
; src/tac.c:399: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_class, .-tac_class
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp105, tac
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rdi	; import_14(D)->name, _1
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rdi), %ecx	; _1->kind, _2
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	je	.L269	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp98
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp98
	jbe	.L270	;,
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L267	;,
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rdi), %rdi	; _1->ast_node.class, _1->ast_node.class
	movq	%rdx, %rsi	; status,
	call	tac_class	;
.L263:
; src/tac.c:317: }
	popq	%rbx	;
	ret	
.L269:
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$118, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp107, _4
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	16(%rbx), %rdi	; tac_18(D)->global_vars, tac_18(D)->global_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L263	;
.L270:
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; _1->type, _1->type
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp108, _8
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbx), %rdi	; tac_18(D)->global_vars, tac_18(D)->global_vars
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L263	;
.L267:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC27(%rip), %rdx	;, tmp103
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:317: }
	jmp	.L263	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC28:
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
; src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rbx), %rdi	; code_17(D)->members, code_17(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp121, members
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC28(%rip), %r14	;, tmp112
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	jmp	.L272	;
.L279:
; src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	(%rbx), %rdi	; code_member_21->content.function, code_member_21->content.function
	movq	%rbp, %rsi	; status,
	call	tac_function	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rbx), %rax	; code_member_21->content.function, code_member_21->content.function
	movq	(%rax), %rbx	; _4->name, _5
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%rbx), %rdi	; _5->name, _5->name
	movq	%r14, %rsi	; tmp112,
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp122
	jne	.L272	;,
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%rbx, 8(%r13)	; _5, tac_29->entry_point
	jmp	.L272	;
.L280:
; src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%rbx), %rdi	; code_member_21->content.class, code_member_21->content.class
	movq	%rbp, %rsi	; status,
	call	tac_class	;
.L272:
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp123, code_member
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L278	;,
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%rbx), %eax	; code_member_21->type, _2
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	je	.L279	;,
; src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	je	.L280	;,
; src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L272	;,
; src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%rbx), %rdi	; code_member_21->content.import, code_member_21->content.import
	movq	%rbp, %rdx	; status,
	movq	%r13, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L272	;
.L278:
; src/tac.c:304: }
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
.LC16:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
