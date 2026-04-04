	.file	"tac.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.type	create_instruction, @function
create_instruction:
	pushq	%r13	;
	movl	%edi, %r13d	; tmp88, type
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:211: static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, arg1
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, arg2
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, arg3
	pushq	%rax	;
; src/tac.c:213:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
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
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_instruction, .-create_instruction
	.type	create_subroutine, @function
create_subroutine:
	pushq	%r12	;
	movq	%rdi, %r12	; tmp89, name
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
	movl	$40, %edi	;,
; src/tac.c:86: static Subroutine* create_subroutine(Symbol* name, Symbol* return_type) {
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp90, return_type
	pushq	%rbx	;
; src/tac.c:88:     Subroutine* subroutine = (Subroutine*)alloc_memory(sizeof(Subroutine));
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
	movq	%rdi, %rbp	; tmp86, label
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
	movl	$16, %edi	;,
; src/tac.c:97: static Block* create_block(Var* label) {
	pushq	%rbx	;
	pushq	%rax	;
; src/tac.c:99:     Block* block = (Block*)alloc_memory(sizeof(Block));
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
	popq	%rdx	;
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
	movq	%rsi, %r13	; tmp170, type
	pushq	%r12	;
	movq	%rdi, %r12	; tmp169, original_name
	pushq	%rbp	;
	movl	%edx, %ebp	; tmp171, kind
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp172, status
	subq	$24, %rsp	;,
; src/tac.c:157:     if (original_name != NULL) {
	testq	%rdi, %rdi	; original_name
	jne	.L8	;,
.L41:
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:172:     var->original_name = original_name;
	movq	%r12, (%rax)	; original_name, var_42->original_name
; src/tac.c:171:     Var* var = (Var*)alloc_memory(sizeof(Var));
	movq	%rax, %r15	; tmp173, <retval>
; src/tac.c:174:     switch (kind) {
	cmpl	$112, %ebp	;, kind
	je	.L9	;,
	ja	.L10	;,
	cmpl	$98, %ebp	;, kind
	je	.L11	;,
	cmpl	$102, %ebp	;, kind
	je	.L12	;,
	cmpl	$97, %ebp	;, kind
	je	.L13	;,
	jmp	.L50	;
.L10:
	cmpl	$116, %ebp	;, kind
	je	.L15	;,
	cmpl	$118, %ebp	;, kind
	je	.L16	;,
.L50:
	orq	$-1, %r9	;, id
	jmp	.L14	;
.L8:
; src/tac.c:158:         Class* current_class = NULL;
	xorl	%eax, %eax	;
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rsi)	;, type_34(D)->kind
; src/tac.c:158:         Class* current_class = NULL;
	movq	%rax, (%rsp)	;, %sfp
; src/tac.c:159:         if (type->kind == SYMBOL_CLASS) {
	jne	.L17	;,
; src/tac.c:160:             current_class = status->current_class;
	movq	24(%rcx), %rax	; status_35(D)->current_class, current_class
	movq	%rax, (%rsp)	; current_class, %sfp
; src/tac.c:161:             status->current_class = type->ast_node.class;
	movq	24(%rsi), %rax	; type_34(D)->ast_node.class, type_34(D)->ast_node.class
	movq	%rax, 24(%rcx)	; type_34(D)->ast_node.class, status_35(D)->current_class
.L17:
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, _59
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testq	%rax, %rax	; _59
	jne	.L18	;,
.L21:
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, _67
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testq	%rax, %rax	; _67
	jne	.L19	;,
	jmp	.L20	;
.L18:
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	movq	24(%rax), %rdi	; _59->local_vars, _59->local_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:107:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->local_vars)) {
	testb	%al, %al	; tmp174
	jne	.L21	;,
; src/tac.c:108:         list(Var*) vars = list_copy(status->current_subroutine->local_vars);
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	24(%rax), %rdi	; _62->local_vars, _62->local_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp175, vars
.L22:
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp176, <retval>
; src/tac.c:110:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	je	.L21	;,
; src/tac.c:111:             if (var->original_name == original_name) {
	cmpq	(%r15), %r12	; var_65->original_name, original_name
	jne	.L22	;,
	jmp	.L23	;
.L19:
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	movq	16(%rax), %rdi	; _67->parameters, _67->parameters
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:117:     if (status->current_subroutine != NULL && !list_is_empty(status->current_subroutine->parameters)) {
	testb	%al, %al	; tmp177
	jne	.L20	;,
; src/tac.c:118:         list(Var*) vars = list_copy(status->current_subroutine->parameters);
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	16(%rax), %rdi	; _70->parameters, _70->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp178, vars
.L27:
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp179, <retval>
; src/tac.c:120:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L28	;,
.L20:
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	cmpq	$0, 24(%rbx)	;, status_35(D)->current_class
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rbx), %rax	; status_35(D)->tac, pretmp_17
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	jne	.L25	;,
	jmp	.L26	;
.L28:
; src/tac.c:121:             if (var->original_name == original_name) {
	cmpq	(%r15), %r12	; var_73->original_name, original_name
	jne	.L27	;,
	jmp	.L23	;
.L25:
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	movq	(%rax), %rdi	; pretmp_17->attribute_tables,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:127:     if (status->current_class != NULL && !list_is_empty(status->tac->attribute_tables)) {
	testb	%al, %al	; tmp181
	jne	.L26	;,
; src/tac.c:128:         list(AttributeTable*) tables = list_copy(status->tac->attribute_tables);
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
	movq	(%rax), %rdi	; _79->attribute_tables,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp182, %sfp
.L32:
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp186, table
; src/tac.c:130:         while ((table = (AttributeTable*)list_pop(tables)) != NULL) {
	testq	%rax, %rax	; table
	jne	.L36	;,
.L26:
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rdi	; _95->global_vars, _95->global_vars
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:142:     if (!list_is_empty(status->tac->global_vars)) {
	testb	%al, %al	; tmp180
	je	.L29	;,
	jmp	.L30	;
.L36:
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	24(%rbx), %rax	; status_35(D)->current_class, status_35(D)->current_class
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%rax), %rax	; _84->name, tmp193
	cmpq	%rax, 8(%r14)	; tmp193, table_82->name
	jne	.L32	;,
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	movq	(%r14), %rdi	; table_82->attributes,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:131:             if (table->name == status->current_class->name && !list_is_empty(table->attributes)) {
	testb	%al, %al	; tmp183
	jne	.L32	;,
; src/tac.c:132:                 list(Attribute*) attributes = list_copy(table->attributes);
	movq	(%r14), %rdi	; table_82->attributes,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp184, attributes
.L34:
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	movq	%r14, %rdi	; attributes,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:134:                 while ((attr = (Attribute*)list_pop(attributes)) != NULL)
	testq	%rax, %rax	; attr
	je	.L32	;,
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	movq	(%rax), %r15	; attr_92->var, <retval>
; src/tac.c:135:                     if (attr->var->original_name == original_name) {
	cmpq	(%r15), %r12	; _93->original_name, original_name
	jne	.L34	;,
	jmp	.L23	;
.L29:
; src/tac.c:143:         list(Var*) vars = list_copy(status->tac->global_vars);
	movq	(%rbx), %rax	; status_35(D)->tac, status_35(D)->tac
	movq	16(%rax), %rdi	; _98->global_vars, _98->global_vars
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp187, vars
.L37:
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	movq	%r14, %rdi	; vars,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp188, <retval>
; src/tac.c:145:         while ((var = (Var*)list_pop(vars)) != NULL) {
	testq	%rax, %rax	; <retval>
	jne	.L38	;,
.L30:
; src/tac.c:153:     return NULL;
	xorl	%r15d, %r15d	; <retval>
	jmp	.L23	;
.L38:
; src/tac.c:146:             if (var->original_name == original_name) {
	cmpq	(%r15), %r12	; var_101->original_name, original_name
	jne	.L37	;,
.L23:
; src/tac.c:164:         if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%r13)	;, type_34(D)->kind
	jne	.L39	;,
; src/tac.c:165:             status->current_class = current_class;
	movq	(%rsp), %rax	; %sfp, current_class
	movq	%rax, 24(%rbx)	; current_class, status_35(D)->current_class
.L39:
; src/tac.c:166:         if (var != NULL) {
	testq	%r15, %r15	; <retval>
	jne	.L7	;,
	jmp	.L41	;
.L13:
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	movq	48(%rbx), %r9	; status_35(D)->attr_count, id
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	leaq	1(%r9), %rax	;, tmp154
	movq	%rax, 48(%rbx)	; tmp154, status_35(D)->attr_count
; src/tac.c:175:         case VAR_ATTR: id = status->attr_count++; break;
	jmp	.L14	;
.L9:
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	movq	56(%rbx), %r9	; status_35(D)->param_count, id
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	leaq	1(%r9), %rax	;, tmp155
	movq	%rax, 56(%rbx)	; tmp155, status_35(D)->param_count
; src/tac.c:176:         case VAR_PARAM: id = status->param_count++; break;
	jmp	.L14	;
.L16:
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	movq	64(%rbx), %r9	; status_35(D)->var_count, id
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	leaq	1(%r9), %rax	;, tmp156
	movq	%rax, 64(%rbx)	; tmp156, status_35(D)->var_count
; src/tac.c:177:         case VAR_VAR: id = status->var_count++; break;
	jmp	.L14	;
.L15:
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	movq	72(%rbx), %r9	; status_35(D)->temp_count, id
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	leaq	1(%r9), %rax	;, tmp157
	movq	%rax, 72(%rbx)	; tmp157, status_35(D)->temp_count
; src/tac.c:178:         case VAR_TEMP: id = status->temp_count++; break;
	jmp	.L14	;
.L11:
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	movq	80(%rbx), %r9	; status_35(D)->block_count, id
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	leaq	1(%r9), %rax	;, tmp158
	movq	%rax, 80(%rbx)	; tmp158, status_35(D)->block_count
; src/tac.c:179:         case VAR_BLOCK: id = status->block_count++; break;
	jmp	.L14	;
.L12:
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	movq	88(%rbx), %r9	; status_35(D)->subroutine_count, id
; src/tac.c:180:         case VAR_SUBROUTINE: id = status->subroutine_count++; break;
	leaq	1(%r9), %rax	;, tmp159
	movq	%rax, 88(%rbx)	; tmp159, status_35(D)->subroutine_count
.L14:
	movq	%r9, (%rsp)	; id, %sfp
; src/tac.c:183:     var->name = create_string("", 32);
	leaq	.LC0(%rip), %rdi	;, tmp160
	movl	$32, %esi	;,
	call	*create_string@GOTPCREL(%rip)	;
; src/tac.c:184:     if (id == (size_t)-1)
	movq	(%rsp), %r9	; %sfp, id
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movl	%ebp, %r8d	; kind,
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, 8(%r15)	; _16, var_42->name
; src/tac.c:183:     var->name = create_string("", 32);
	movq	%rax, %rdi	; tmp189, _16
; src/tac.c:184:     if (id == (size_t)-1)
	cmpq	$-1, %r9	;, id
	jne	.L42	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC1(%rip), %rcx	;, tmp161
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	jmp	.L43	;
.L42:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC2(%rip), %rcx	;, tmp162
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
.L43:
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	andl	$-3, %ebp	;, tmp163
; src/tac.c:188:     var->type = type;
	movq	%r13, 16(%r15)	; type, var_42->type
; src/tac.c:189:     if (kind == VAR_TEMP || kind == VAR_VAR)
	cmpl	$116, %ebp	;, tmp163
	jne	.L7	;,
; src/tac.c:190:         list_append(status->current_subroutine->local_vars, (pointer)var);
	movq	8(%rbx), %rax	; status_35(D)->current_subroutine, status_35(D)->current_subroutine
	movq	%r15, %rsi	; <retval>,
	movq	24(%rax), %rdi	; _20->local_vars, _20->local_vars
	call	*list_append@GOTPCREL(%rip)	;
.L7:
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
	.size	create_var, .-create_var
	.section	.rodata.str1.1
.LC3:
	.string	"[warning] Unsupported type for size lookup: %s\n"
	.text
	.type	get_type_size, @function
get_type_size:
; src/tac.c:19:         result = 0;
	xorl	%eax, %eax	; <retval>
; src/tac.c:18:     if (type == NULL)
	testq	%rdi, %rdi	; type
	je	.L60	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_int(%rip)	; type, name_int
	je	.L61	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_float(%rip)	; type, name_float
	je	.L61	;,
; src/tac.c:20:     else if (type == name_int || type == name_float || type == name_string)
	cmpq	%rdi, name_string(%rip)	; type, name_string
	je	.L61	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rdi, name_bool(%rip)	; type, name_bool
; src/tac.c:23:         result = 1;
	movl	$1, %eax	;, <retval>
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	je	.L60	;,
; src/tac.c:22:     else if (type == name_bool || type == name_void)
	cmpq	%rdi, name_void(%rip)	; type, name_void
	je	.L60	;,
; src/tac.c:24:     else if (type->kind == SYMBOL_CLASS)
	cmpl	$0, 32(%rdi)	;, type_13(D)->kind
	jne	.L55	;,
; src/tac.c:25:         result = type->ast_node.class->size;
	movq	24(%rdi), %rax	; type_13(D)->ast_node.class, type_13(D)->ast_node.class
	movq	24(%rax), %rax	; _7->size, <retval>
	ret	
.L55:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC3(%rip), %rdx	;, tmp96
	movl	$2, %esi	;,
; src/tac.c:15: static size_t get_type_size(Symbol* type) {
	pushq	%rax	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	movq	8(%rdi), %rcx	; type_13(D)->name, type_13(D)->name
	movq	stderr(%rip), %rdi	; stderr,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:21:         result = 8;
	movl	$8, %eax	;, <retval>
; src/tac.c:30: }
	popq	%rdx	;
	ret	
.L61:
; src/tac.c:21:         result = 8;
	movl	$8, %eax	;, <retval>
	ret	
.L60:
; src/tac.c:30: }
	ret	
	.size	get_type_size, .-get_type_size
	.type	create_arg, @function
create_arg:
	pushq	%rbp	;
	movl	%edi, %ebp	; tmp110, kind
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:221: static Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, value
	pushq	%r8	;
; src/tac.c:223:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:225:     arg->type = NULL;
	xorl	%r9d, %r9d	;
; src/tac.c:224:     arg->kind = kind;
	movl	%ebp, 16(%rax)	; kind, arg_15->kind
; src/tac.c:226:     switch (kind) {
	decl	%ebp	;
; src/tac.c:225:     arg->type = NULL;
	movq	%r9, 8(%rax)	;, arg_15->type
; src/tac.c:226:     switch (kind) {
	cmpl	$6, %ebp	;, tmp95
	ja	.L65	;,
	leaq	.L66(%rip), %rcx	;, tmp97
	movslq	(%rcx,%rbp,4), %rdx	;, tmp99
	addq	%rcx, %rdx	; tmp97, tmp100
	jmp	*%rdx	; tmp100
	.section	.rodata
	.align 4
	.align 4
.L66:
	.long	.L72-.L66
	.long	.L71-.L66
	.long	.L70-.L66
	.long	.L69-.L66
	.long	.L68-.L66
	.long	.L67-.L66
	.long	.L65-.L66
	.text
.L72:
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	; MEM[(long long int *)value_19(D)], _2
; src/tac.c:232:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	; _2, arg_15->value.int_value
; src/tac.c:233:             arg->type = name_int;
	movq	name_int(%rip), %rdx	; name_int, name_int
	jmp	.L75	;
.L71:
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	; MEM[(double *)value_19(D)], _4
; src/tac.c:237:             arg->type = name_float;
	movq	name_float(%rip), %rdx	; name_float, name_float
; src/tac.c:236:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _4, arg_15->value.float_value
	jmp	.L75	;
.L70:
; src/tac.c:240:             arg->value.string_value = (string)value;
	movq	%rbx, (%rax)	; value, arg_15->value.string_value
; src/tac.c:241:             arg->type = name_string;
	movq	name_string(%rip), %rdx	; name_string, name_string
	jmp	.L75	;
.L69:
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	(%rbx), %dl	; MEM[(char *)value_19(D)], _7
; src/tac.c:244:             arg->value.bool_value = *(bool*)value;
	movb	%dl, (%rax)	; _7, arg_15->value.bool_value
; src/tac.c:245:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	; name_bool, name_bool
	jmp	.L75	;
.L68:
; src/tac.c:248:             arg->value.string_value = NULL;
	xorl	%ecx, %ecx	;
; src/tac.c:249:             arg->type = name_void;
	movq	name_void(%rip), %rdx	; name_void, name_void
; src/tac.c:248:             arg->value.string_value = NULL;
	movq	%rcx, (%rax)	;, arg_15->value.string_value
	jmp	.L75	;
.L67:
; src/tac.c:252:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	; value, arg_15->value.label
; src/tac.c:253:             break;
	jmp	.L73	;
.L65:
; src/tac.c:255:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	; value,* <retval>
; src/tac.c:256:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	; MEM[(struct Var *)value_19(D)].type, MEM[(struct Var *)value_19(D)].type
.L75:
	movq	%rdx, 8(%rax)	; MEM[(struct Var *)value_19(D)].type, arg_15->type
.L73:
; src/tac.c:263:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_15->is_get
; src/tac.c:266: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_arg, .-create_arg
	.type	load_rvalue, @function
load_rvalue:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:267: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	movq	%rdi, %rbx	; tmp96, arg
; src/tac.c:269:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L77	;,
; src/tac.c:273:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_3(D)->is_get
	je	.L77	;,
	movq	%rsi, %r12	; tmp97, status
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_3(D)->type, arg_3(D)->type
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	%r12, %rcx	; status,
	call	create_var	;
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp98, _10
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %rdx	; arg,
	xorl	%ecx, %ecx	;
	movl	$23, %edi	;,
	movq	%rax, %rsi	; temp,
; src/tac.c:274:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp99, temp
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	;
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbp, %rbx	; temp, arg
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rsi	; tmp100, _12
; src/tac.c:275:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%r12), %rax	; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L77:
; src/tac.c:281: }
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC4:
	.string	"[warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%r12	;
	movq	%rsi, %r12	; tmp104, tac
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rbp	; import_15(D)->name, _1
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rbp), %ecx	; _1->kind, _2
; src/tac.c:305:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %ecx	;, _2
	jne	.L83	;,
; src/tac.c:306:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movq	%rdx, %rcx	; status,
	movl	$118, %edx	;,
	jmp	.L87	;
.L83:
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rcx), %eax	;, tmp99
; src/tac.c:307:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %eax	;, tmp99
	ja	.L84	;,
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rdx, %rcx	; status,
	movl	$102, %edx	;,
.L87:
	movq	0(%rbp), %rsi	; _1->type,
	movq	%rbp, %rdi	; _1,
	call	create_var	;
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%r12), %rdi	; tac_17(D)->global_vars, tac_17(D)->global_vars
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp107, _8
.L88:
; src/tac.c:314: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
.L84:
; src/tac.c:309:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%ecx, %ecx	; _2
	jne	.L85	;,
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp108, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:10:     table->name = name;
	movq	%rbp, 8(%rbx)	; _1, table_25->name
; src/tac.c:310:         list_append(tac->attribute_tables, (pointer)create_attribute_table(import->name));
	movq	(%r12), %rdi	; tac_17(D)->attribute_tables,
	movq	%rbx, %rsi	; table,
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, (%rbx)	; tmp109, table_25->attributes
; src/tac.c:11:     table->size = 0;
	xorl	%eax, %eax	;
	movq	%rax, 16(%rbx)	;, table_25->size
	jmp	.L88	;
.L85:
; src/tac.c:314: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:314: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC4(%rip), %rdx	;, tmp102
; src/tac.c:314: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC5:
	.string	"Error: create_attribute received NULL table or attributes list\n"
.LC6:
	.string	"[warning] Unsupported variable type for tac_variable: %d\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp126, variable
	pushq	%rbx	;
; src/tac.c:392: void tac_variable(Variable* variable, TACStatus* status, VarType type) {
	movq	%rsi, %rbx	; tmp127, status
; src/tac.c:395:     switch (type) {
	cmpl	$112, %edx	;, type
	je	.L90	;,
	movl	%edx, %ecx	; tmp128, type
	ja	.L91	;,
	cmpl	$97, %edx	;, type
	je	.L92	;,
	cmpl	$102, %edx	;, type
	jne	.L94	;,
; src/tac.c:403:             var = create_var(variable->name, variable->type, type, status);
	movq	%rsi, %rcx	; status,
	movq	8(%rdi), %rdi	; variable_19(D)->name, variable_19(D)->name
	movq	0(%rbp), %rsi	; variable_19(D)->type,
	movl	$102, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp130, var
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	jmp	.L98	;
.L91:
; src/tac.c:395:     switch (type) {
	movl	%edx, %eax	; type, tmp112
	andl	$-3, %eax	;, tmp112
	cmpl	$116, %eax	;, tmp112
	jne	.L94	;,
	jmp	.L100	;
.L90:
; src/tac.c:397:             var = create_var(variable->name, variable->type, type, status);
	movq	%rsi, %rcx	; status,
	movq	8(%rdi), %rdi	; variable_19(D)->name, variable_19(D)->name
	movq	0(%rbp), %rsi	; variable_19(D)->type,
	movl	$112, %edx	;,
	call	create_var	;
	movq	%rax, %rsi	; tmp129, var
; src/tac.c:398:             list_append(status->current_subroutine->parameters, (pointer)var);
	movq	8(%rbx), %rax	; status_20(D)->current_subroutine, status_20(D)->current_subroutine
.L98:
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	movq	16(%rax), %rdi	;, _7->global_vars
.L99:
; src/tac.c:418: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:404:             list_append(status->tac->global_vars, (pointer)var);
	jmp	*list_append@GOTPCREL(%rip)	;
.L92:
; src/tac.c:407:             AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	(%rax), %rdi	; _9->attribute_tables,
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp131, attr_table
; src/tac.c:408:             list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_20(D)->tac, status_20(D)->tac
	movq	%r12, %rsi	; attr_table,
	movq	(%rax), %rdi	; _11->attribute_tables,
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
	movq	%rax, %rbp	; tmp132, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	;
; src/tac.c:198:     attr->type = type;
	movq	%r13, 8(%rbp)	; _13, attr_32->type
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _13,
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, 0(%rbp)	; tmp133, attr_32->var
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%r12), %rax	; attr_table_28->size, attr_table_28->size
	movq	%rax, 16(%rbp)	; attr_table_28->size, attr_32->offset
; src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	;
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	movq	(%r12), %rdi	; attr_table_28->attributes, _38
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%r12)	; tmp134, attr_table_28->size
; src/tac.c:207:         list_append(table->attributes, (pointer)attr);
	movq	%rbp, %rsi	; attr,
; src/tac.c:204:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _38
	jne	.L99	;,
; src/tac.c:418: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC5(%rip), %rdi	;, tmp123
; src/tac.c:418: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L94:
; src/tac.c:418: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
; src/tac.c:418: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC6(%rip), %rdx	;, tmp125
; src/tac.c:418: }
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L100:
; src/tac.c:418: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_variable, .-tac_variable
	.section	.rodata.str1.1
.LC7:
	.string	"[warning] Unsupported variable access with NULL base\n"
.LC8:
	.string	"[warning] Failed to generate variable access for base\n"
.LC9:
	.string	"[warning] Attempting to access attribute of non-object type: %s\n"
.LC10:
	.string	"[warning] Attribute '%s' not found in type '%s'\n"
.LC11:
	.string	"[warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC12:
	.string	"[warning] Attempting to index non-array type: %s\n"
.LC13:
	.string	"arr"
.LC14:
	.string	"[warning] Failed to generate variable access for index\n"
.LC15:
	.string	"[warning] Attempting to call non-function, kind: %u, type name: %s\n"
.LC16:
	.string	"[warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp246, variable_access
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp247, status
	pushq	%rbx	;
	subq	$32, %rsp	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rdi)	;, variable_access_99(D)->type
	jne	.L102	;,
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %rdi	; variable_access_99(D)->content.name, _2
; src/tac.c:742:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rdi, %rdi	; _2
	je	.L102	;,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	movl	32(%rdi), %eax	; _2->kind, tmp280
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _2->type, pretmp_8
	movq	%rbp, %rcx	; status,
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	decl	%eax	; tmp183
; src/tac.c:743:         if (variable_access->content.name->kind != SYMBOL_FUNCTION && variable_access->content.name->kind != SYMBOL_METHOD) {
	cmpl	$1, %eax	;, tmp183
	jbe	.L103	;,
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movl	$118, %edx	;,
	call	create_var	;
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	xorl	%edi, %edi	;
; src/tac.c:744:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rsi	; tmp248, _6
	jmp	.L134	;
.L103:
; src/tac.c:748:             Arg* result = create_arg(ARG_SUBROUTINE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movl	$102, %edx	;,
	jmp	.L135	;
.L102:
; src/tac.c:753:     if (variable_access->base == NULL) {
	movq	0(%r13), %rdi	; variable_access_99(D)->base, _10
; src/tac.c:753:     if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _10
	jne	.L104	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC7(%rip), %rdi	;, tmp186
	jmp	.L128	;
.L104:
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbp, %rsi	; status,
	call	tac_variable_access	;
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	; tmp250, _12
; src/tac.c:758:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	;
	movq	%rax, %rbx	; tmp251, base
; src/tac.c:759:     if (base == NULL) {
	testq	%rax, %rax	; base
	jne	.L106	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC8(%rip), %rdi	;, tmp188
.L128:
	call	*fputs@GOTPCREL(%rip)	;
; src/tac.c:762:         return NULL;
	jmp	.L133	;
.L106:
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%r13), %ecx	; variable_access_99(D)->type, _14
; src/tac.c:764:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _14
	jne	.L108	;,
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	; base_109->type, _15
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _15->kind, _16
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp189
; src/tac.c:765:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp189
	ja	.L109	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _15->name, _15->name
	leaq	.LC9(%rip), %rdx	;, tmp192
	jmp	.L129	;
.L109:
; src/tac.c:770:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _15->ast_node.scope, scope
; src/tac.c:771:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _16
	jne	.L110	;,
; src/tac.c:772:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_149].class_scope, scope
.L110:
; src/tac.c:773:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%r13), %rax	; variable_access_99(D)->content.attr_name, variable_access_99(D)->content.attr_name
	movq	8(%rax), %rsi	; _20->name, _20->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp252, attr
; src/tac.c:774:         if (attr == NULL) {
	testq	%rax, %rax	; attr
	jne	.L111	;,
; src/tac.c:775:             fprintf(stderr, "[warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rdx	; variable_access_99(D)->content.attr_name, variable_access_99(D)->content.attr_name
	movq	8(%rbx), %rax	; base_109->type, base_109->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _24->name, _24->name
	movq	8(%rax), %r8	; _22->name,
	leaq	.LC10(%rip), %rdx	;, tmp200
	jmp	.L130	;
.L111:
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	movl	32(%rax), %eax	; attr_152->kind, _27
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	leal	-1(%rax), %edx	;, tmp201
; src/tac.c:779:         if (attr->kind == SYMBOL_METHOD || attr->kind == SYMBOL_FUNCTION)
	cmpl	$1, %edx	;, tmp201
	ja	.L112	;,
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; attr_152->type,
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
.L135:
	call	create_var	;
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp253, _30
.L134:
; src/tac.c:845: }
	addq	$32, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:780:             return create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	create_arg	;
.L112:
; src/tac.c:781:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _27
	je	.L113	;,
; src/tac.c:782:             fprintf(stderr, "[warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbx), %rax	; base_109->type, base_109->type
	movq	8(%r13), %rdx	; variable_access_99(D)->content.attr_name, variable_access_99(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; _31->name,
	movq	8(%rdx), %rcx	; _33->name, _33->name
	leaq	.LC11(%rip), %rdx	;, tmp207
.L130:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:784:             return NULL;
	jmp	.L133	;
.L113:
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%rdi), %rsi	; attr_152->type,
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp254, _37
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%r13), %rdi	; variable_access_99(D)->content.attr_name, _38
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbp, %rcx	; status,
	movl	$97, %edx	;,
; src/tac.c:786:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp255, <retval>
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rdi), %rsi	; _38->type,
	call	create_var	;
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	xorl	%edi, %edi	;
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rsi	; tmp256, _40
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	call	create_arg	;
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %rdx	; base,
	movq	%r12, %rsi	; <retval>,
	movl	$15, %edi	;,
; src/tac.c:787:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rcx	; tmp257, _41
	jmp	.L136	;
.L108:
; src/tac.c:792:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _14
	jne	.L114	;,
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movq	8(%rax), %rax	; base_109->type, _44
; src/tac.c:766:             fprintf(stderr, "[warning] Attempting to access attribute of non-object type: %s\n", base->type->name);
	movq	8(%rax), %rcx	; _44->name, pretmp_175
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	movl	32(%rax), %eax	; _44->kind, _44->kind
	subl	$3, %eax	;, tmp210
; src/tac.c:793:         if (base->type->kind != SYMBOL_VARIABLE && base->type->kind != SYMBOL_PARAM && base->type->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$2, %eax	;, tmp210
	ja	.L131	;,
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	%rcx, 8(%rsp)	; pretmp_175, %sfp
	movq	%rcx, %rdi	; pretmp_175,
	leaq	.LC13(%rip), %rsi	;, tmp215
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:798:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rsp), %rcx	; %sfp, pretmp_175
	testl	%eax, %eax	; tmp259
	je	.L116	;,
.L131:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC12(%rip), %rdx	;, tmp217
.L129:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:801:             return NULL;
	jmp	.L133	;
.L116:
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%r13), %rdi	; variable_access_99(D)->content.index, variable_access_99(D)->content.index
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rdi	; tmp260, _53
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC14(%rip), %rdi	;, tmp220
; src/tac.c:803:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %r13	; tmp261, index
; src/tac.c:804:         if (index == NULL) {
	testq	%rax, %rax	; index
	je	.L128	;,
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	8(%rbx), %rax	; base_109->type, base_109->type
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	(%rax), %rsi	; _55->type,
	call	create_var	;
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp262, _57
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%r13, %rcx	; index,
	movq	%rbx, %rdx	; base,
	movl	$16, %edi	;,
; src/tac.c:809:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp263, <retval>
; src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rsi	; <retval>,
.L136:
	call	create_instruction	;
; src/tac.c:811:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:810:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rsi	; tmp264, inst
	jmp	.L132	;
.L114:
; src/tac.c:815:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _14
	jne	.L118	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 16(%rax)	;, base_109->kind
	jne	.L119	;,
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	; base_109->type, _61
; src/tac.c:816:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	;, _61->kind
	jne	.L119	;,
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _61->name, _61->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp265, _65
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rbx), %rax	; base_109->type, base_109->type
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _66->ast_node.class, _66->ast_node.class
	movq	16(%rax), %rdi	; _67->class_scope, _67->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbp, %rcx	; status,
	movl	$102, %edx	;,
	movq	(%rax), %rsi	; attr_112->type,
; src/tac.c:817:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rdi	; tmp266, attr
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	;
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp267, _70
; src/tac.c:818:             base = create_arg(ARG_SUBROUTINE, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_arg	;
	movq	%rax, %rbx	; tmp268, base
.L119:
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	movl	16(%rbx), %ecx	; base_90->kind, _71
; src/tac.c:820:         if (base->kind != ARG_SUBROUTINE) {
	cmpl	$7, %ecx	;, _71
	je	.L120	;,
; src/tac.c:821:             fprintf(stderr, "[warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rbx), %rax	; base_90->type, base_90->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	.LC15(%rip), %rdx	;, tmp232
	movq	8(%rax), %r8	; _72->name,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L133:
; src/tac.c:823:             return NULL;
	xorl	%r12d, %r12d	; <retval>
	jmp	.L101	;
.L120:
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%r13), %rdi	; variable_access_99(D)->content.args, variable_access_99(D)->content.args
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	leaq	24(%rsp), %r13	;, tmp245
; src/tac.c:825:         list(Expression*) args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp269, args
; src/tac.c:827:         long long arg_count = 0;
	xorl	%eax, %eax	;
	movq	%rax, 16(%rsp)	;, arg_count
.L122:
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp274, arg_expr
; src/tac.c:828:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L137	;,
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rbp, %rsi	; status,
	call	tac_expression	;
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rdi	; arg_129->type, arg_129->type
; src/tac.c:829:             Arg* arg = tac_expression(arg_expr, status);
	movq	%rax, %r14	; tmp270, arg
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	call	get_type_size	;
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	%r13, %rsi	; tmp245,
	movl	$1, %edi	;,
; src/tac.c:830:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 24(%rsp)	; tmp271, size
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	call	create_arg	;
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	xorl	%ecx, %ecx	;
	movq	%r14, %rdx	; arg,
	movl	$17, %edi	;,
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	movq	%rax, %rsi	; tmp272, _79
; src/tac.c:831:             Instruction* inst = create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp273, inst
; src/tac.c:832:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_100(D)->current_block, status_100(D)->current_block
	movq	8(%rax), %rdi	; _80->instructions, _80->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:833:             arg_count++;
	incq	16(%rsp)	; arg_count
	jmp	.L122	;
.L137:
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rbx), %rsi	; base_90->type, base_90->type
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	call	create_var	;
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp275, _85
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	leaq	16(%rsp), %rsi	;, tmp239
	movl	$1, %edi	;,
; src/tac.c:835:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp276, <retval>
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	call	create_arg	;
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%r12, %rsi	; <retval>,
	movq	%rbx, %rdx	; base,
	movl	$22, %edi	;,
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	movq	%rax, %rcx	; tmp277, _86
; src/tac.c:836:         Instruction* inst = create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp278, inst
.L132:
; src/tac.c:837:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_100(D)->current_block, status_100(D)->current_block
	movq	8(%rax), %rdi	;, _87->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:839:         return temp;
	jmp	.L101	;
.L118:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC16(%rip), %rdx	;, tmp243
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:843:         return NULL;
	jmp	.L133	;
.L101:
; src/tac.c:845: }
	addq	$32, %rsp	;,
	movq	%r12, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.1
.LC18:
	.string	"[warning] Unsupported type for negation: %s\n"
.LC19:
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
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; src/tac.c:678:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L139	;,
	leaq	.L141(%rip), %rdx	;, tmp118
	movq	%rsi, %rbp	; tmp143, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp120
	addq	%rdx, %rax	; tmp118, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L141:
	.long	.L149-.L141
	.long	.L148-.L141
	.long	.L147-.L141
	.long	.L146-.L141
	.long	.L145-.L141
	.long	.L144-.L141
	.long	.L143-.L141
	.long	.L142-.L141
	.long	.L140-.L141
	.text
.L149:
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value,
	xorl	%esi, %esi	;
	movl	$10, %edx	;,
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:682:             return create_arg(ARG_INT, &t);
	leaq	8(%rsp), %rsi	;, tmp123
	movl	$1, %edi	;,
; src/tac.c:680:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 8(%rsp)	; tmp144, MEM[(long long int *)_90]
	jmp	.L158	;
.L148:
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value,
	xorl	%esi, %esi	;
	call	*strtod@GOTPCREL(%rip)	;
; src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	leaq	8(%rsp), %rsi	;, tmp124
	movl	$2, %edi	;,
; src/tac.c:685:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; tmp146, MEM[(double *)_90]
.L158:
; src/tac.c:686:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	;
	movq	%rax, %rbx	; tmp147, <retval>
	jmp	.L138	;
.L147:
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %rsi	; primary_36(D)->value.literal_value,
; src/tac.c:739: }
	addq	$16, %rsp	;,
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %edi	;,
; src/tac.c:739: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:690:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	;
.L146:
; src/tac.c:692:             bool t = true;
	movb	$1, 8(%rsp)	;, MEM[(char *)_90]
	jmp	.L159	;
.L145:
; src/tac.c:697:             bool t = false;
	movb	$0, 8(%rsp)	;, MEM[(char *)_90]
.L159:
; src/tac.c:699:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp126
	movl	$4, %edi	;,
	jmp	.L158	;
.L144:
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr,
; src/tac.c:739: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:703:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	;
.L143:
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand,
	call	tac_primary	;
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp150, _9
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	name_bool(%rip), %rsi	; name_bool,
; src/tac.c:705:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r12	; tmp151, operand
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_var	;
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp152, _11
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; operand,
	movl	$13, %edi	;,
; src/tac.c:706:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp153, <retval>
; src/tac.c:707:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rsi	; <retval>,
	jmp	.L156	;
.L142:
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand,
	call	tac_primary	;
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp155, _15
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
; src/tac.c:713:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r12	; tmp156, operand
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	;
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp157, _17
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:716:             long long zero_int = 0;
	xorl	%r10d, %r10d	;
; src/tac.c:714:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp158, <retval>
; src/tac.c:717:             double neg_one_float = -1.0;
	movq	.LC17(%rip), %rax	;, tmp164
; src/tac.c:716:             long long zero_int = 0;
	movq	%r10, (%rsp)	;, zero_int
; src/tac.c:717:             double neg_one_float = -1.0;
	movq	%rax, 8(%rsp)	; tmp164, MEM[(double *)_90]
; src/tac.c:718:             if (operand->type == name_int)
	movq	8(%r12), %rax	; operand_42->type, _18
; src/tac.c:718:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	jne	.L151	;,
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rsp, %rsi	;, tmp132
	movl	$1, %edi	;,
	call	create_arg	;
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbx, %rsi	; <retval>,
	movl	$1, %edi	;,
; src/tac.c:719:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %rdx	; tmp159, _20
	jmp	.L156	;
.L151:
; src/tac.c:720:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	jne	.L153	;,
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	8(%rsp), %rsi	;, tmp133
	movl	$2, %edi	;,
	call	create_arg	;
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbx, %rsi	; <retval>,
	movl	$2, %edi	;,
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %rdx	; tmp161, _22
.L156:
; src/tac.c:721:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp162, inst
; src/tac.c:727:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:729:             return temp;
	jmp	.L138	;
.L153:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC18(%rip), %rdx	;, tmp136
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L157	;
.L140:
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.var,
; src/tac.c:739: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:733:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	;
.L139:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC19(%rip), %rdx	;, tmp140
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L157:
; src/tac.c:737:             return NULL;
	xorl	%ebx, %ebx	; <retval>
.L138:
; src/tac.c:739: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.1
.LC20:
	.string	"[warning] Left-hand side of assignment is not a variable\n"
	.text
	.globl	tac_expression
	.type	tac_expression, @function
tac_expression:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp128, expression
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
; src/tac.c:644: Arg* tac_expression(Expression* expression, TACStatus* status) {
	movq	%rsi, %rbx	; tmp129, status
; src/tac.c:646:     if (expression->operator == OP_NONE) {
	jne	.L161	;,
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
; src/tac.c:675: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:647:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	;
.L161:
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
; src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r14d	;, _65
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	tac_expression	;
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rdi	; tmp130, _4
; src/tac.c:651:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	;
	movq	%rax, %r12	; tmp131, <retval>
; src/tac.c:652:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r13), %eax	; expression_30(D)->operator,
	cmpl	$18, %eax	;, _5
	ja	.L162	;,
	leaq	CSWTCH.43(%rip), %rdx	;, tmp115
	movzbl	(%rdx,%rax), %r14d	; CSWTCH.43[_5], _65
.L162:
; src/tac.c:653:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%r13), %rdi	; expression_30(D)->expr_left,
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp132, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r13), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp117
; src/tac.c:655:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp117
	ja	.L163	;,
; src/tac.c:656:         if (op != INST_ASSIGN) {
	cmpl	$14, %r14d	;, _65
	je	.L164	;,
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; left_38->type, left_38->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp133, _9
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; left,
; src/tac.c:657:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp134, temp
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %rcx	; <retval>,
	movq	%r13, %rsi	; temp,
	movl	%r14d, %edi	; _65,
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %rdx	; tmp135, _10
; src/tac.c:660:             right = temp;
	movq	%r13, %r12	; temp, <retval>
; src/tac.c:658:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp136, inst
; src/tac.c:659:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L164:
; src/tac.c:662:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rbp)	;, left_38->kind
	je	.L165	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC20(%rip), %rdi	;, tmp123
	call	*fputs@GOTPCREL(%rip)	;
.L165:
; src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%ecx, %ecx	;
	movq	%rbp, %rsi	; left,
	movq	%r12, %rdx	; <retval>,
	movl	$14, %edi	;,
	call	create_instruction	;
; src/tac.c:665:         if (left->is_get)
	cmpb	$0, 20(%rbp)	;, left_38->is_get
; src/tac.c:664:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rsi	; tmp137, inst
; src/tac.c:665:         if (left->is_get)
	je	.L166	;,
; src/tac.c:666:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rbp, %rsi	; left,
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; <retval>,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp138, inst
	jmp	.L166	;
.L163:
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; left_38->type, left_38->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp139, _17
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; left,
; src/tac.c:668:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp140, temp
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %rcx	; <retval>,
	movq	%r13, %rsi	; temp,
	movl	%r14d, %edi	; _65,
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %rdx	; tmp141, _18
; src/tac.c:670:         right = temp;
	movq	%r13, %r12	; temp, <retval>
; src/tac.c:669:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp142, inst
.L166:
; src/tac.c:672:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:675: }
	popq	%rbx	;
	movq	%r12, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_expression, .-tac_expression
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp179, if_
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp180, status
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:462: void tac_if(If* if_, TACStatus* status) {
	subq	$40, %rsp	;,
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:465:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp181, then_label
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r12), %rdi	; if__61(D)->else_if, if__61(D)->else_if
; src/tac.c:466:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp182, else_label
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp183
	jne	.L173	;,
.L175:
; src/tac.c:471:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %r13	; tmp184, end_label
	jmp	.L174	;
.L173:
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:468:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp185
	je	.L175	;,
; src/tac.c:469:         end_label = else_label;
	movq	%rbp, %r13	; else_label, end_label
.L174:
; src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r13, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	(%r12), %rdi	; if__61(D)->condition,
	movq	%rbx, %rsi	; status,
; src/tac.c:472:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, (%rsp)	; tmp186, %sfp
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	call	tac_expression	;
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
; src/tac.c:474:     Arg* condition = tac_expression(if_->condition, status);
	movq	%rax, %r15	; tmp187, condition
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rsi	; then_label,
	movl	$6, %edi	;,
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 8(%rsp)	; _6, %sfp
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	8(%rsp), %rcx	; %sfp, _6
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %rdx	; tmp189, _7
; src/tac.c:475:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp190, inst
; src/tac.c:476:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _8->instructions, _8->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:478:     Block* then_block = create_block(then_label);
	movq	%r14, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r14	; tmp191, then_block
; src/tac.c:479:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rsi	; then_block,
	movq	32(%rax), %rdi	; _10->blocks, _10->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:480:     status->current_block = then_block;
	movq	%r14, 16(%rbx)	; then_block, status_56(D)->current_block
; src/tac.c:482:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r12), %rdi	; if__61(D)->body, if__61(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp192, then_statements
.L176:
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r14, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp193, statement
; src/tac.c:484:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L196	;,
; src/tac.c:485:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L176	;
.L196:
; src/tac.c:487:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp194, jump_to_end
; src/tac.c:488:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r12), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:490:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp195
	jne	.L178	;,
; src/tac.c:492:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r12), %rdi	; if__61(D)->else_if, if__61(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp196, %sfp
.L179:
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp210, elif
; src/tac.c:494:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L178	;,
; src/tac.c:496:             Block* else_if_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp197, else_if_block
; src/tac.c:497:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; else_if_block,
	movq	32(%rax), %rdi	; _18->blocks, _18->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:498:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	; else_if_block, status_56(D)->current_block
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
	movq	%rax, 16(%rsp)	; tmp198, %sfp
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	(%r14), %rdi	; elif_90->condition,
	movq	%rbx, %rsi	; status,
; src/tac.c:501:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp199, else_label
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	call	tac_expression	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	8(%rsp), %rdi	; %sfp,
; src/tac.c:503:             condition = tac_expression(elif->condition, status);
	movq	%rax, %r15	; tmp200, condition
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp201
	je	.L181	;,
; src/tac.c:504:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:505:                 else_label = end_label;
	testb	%al, %al	; tmp202
	cmovne	%r13, %rbp	; else_label,, end_label, else_label
.L181:
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	16(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 24(%rsp)	; _24, %sfp
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	24(%rsp), %rcx	; %sfp, _24
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %rdx	; tmp204, _25
; src/tac.c:506:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp205, inst
; src/tac.c:507:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _26->instructions, _26->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:509:             then_block = create_block(then_label);
	movq	16(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %r15	; tmp206, then_block
; src/tac.c:510:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r15, %rsi	; then_block,
	movq	32(%rax), %rdi	; _28->blocks, _28->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r14), %rdi	; elif_90->body, elif_90->body
; src/tac.c:511:             status->current_block = then_block;
	movq	%r15, 16(%rbx)	; then_block, status_56(D)->current_block
; src/tac.c:513:             list(Statement*) elif_statements = list_copy(elif->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp207, elif_statements
.L182:
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r14, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp208, elif_statement
; src/tac.c:515:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	je	.L197	;,
; src/tac.c:516:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L182	;
.L197:
; src/tac.c:518:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp209, jump_to_end
; src/tac.c:519:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _31->instructions, _31->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L179	;
.L178:
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:523:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp211
	jne	.L185	;,
; src/tac.c:525:         Block* else_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp212, else_block
; src/tac.c:526:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; else_block,
	movq	32(%rax), %rdi	; _35->blocks, _35->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:527:         status->current_block = else_block;
	movq	%rbp, 16(%rbx)	; else_block, status_56(D)->current_block
; src/tac.c:529:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rdi	; if__61(D)->else_body, if__61(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp213, else_statements
.L186:
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp214, else_statement
; src/tac.c:531:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	je	.L198	;,
; src/tac.c:532:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L186	;
.L198:
; src/tac.c:534:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	create_instruction	;
	movq	%rax, %rsi	; tmp215, jump_to_end
; src/tac.c:535:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _38->instructions, _38->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L185:
; src/tac.c:538:     Block* end_block = create_block(end_label);
	movq	%r13, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp216, end_block
; src/tac.c:539:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _40->blocks, _40->blocks
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
	.size	tac_if, .-tac_if
	.section	.rodata.str1.1
.LC21:
	.string	"[warning] 'break' statement used outside of loop\n"
.LC22:
	.string	"[warning] 'continue' statement used outside of loop\n"
.LC23:
	.string	"[warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
; src/tac.c:421:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_29(D)->type,
; src/tac.c:421:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L200	;,
	leaq	.L202(%rip), %rdx	;, tmp114
; src/tac.c:419: void tac_statement(Statement* statement, TACStatus* status) {
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp137, statement
	pushq	%rbx	;
	pushq	%rbx	;
; src/tac.c:421:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp116
	movq	%rsi, %rbx	; tmp138, status
	addq	%rdx, %rax	; tmp114, tmp117
	jmp	*%rax	; tmp117
	.section	.rodata
	.align 4
	.align 4
.L202:
	.long	.L209-.L202
	.long	.L199-.L202
	.long	.L207-.L202
	.long	.L206-.L202
	.long	.L205-.L202
	.long	.L204-.L202
	.long	.L203-.L202
	.long	.L201-.L202
	.text
.L209:
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	movq	(%rdi), %rdi	; statement_29(D)->stmt.expr,
; src/tac.c:461: }
	popq	%r11	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:422:         case EXPRESSION_STATEMENT: tac_expression(statement->stmt.expr, status); break;
	jmp	tac_expression	;
.L207:
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_29(D)->stmt.if_stmt,
; src/tac.c:461: }
	popq	%r10	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:424:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	;
.L206:
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_29(D)->stmt.while_stmt,
; src/tac.c:461: }
	popq	%r9	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:425:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	;
.L205:
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_29(D)->stmt.for_stmt,
; src/tac.c:461: }
	popq	%r8	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:426:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	;
.L204:
; src/tac.c:428:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$5, %edi	;,
	xorl	%esi, %esi	;
	call	create_arg	;
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	movq	0(%rbp), %rdi	; statement_29(D)->stmt.return_expr, _6
; src/tac.c:429:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _6
	je	.L210	;,
; src/tac.c:430:                 return_value = tac_expression(statement->stmt.return_expr, status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
.L210:
; src/tac.c:431:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	%rax, %rsi	; return_value,
	movl	$21, %edi	;,
	jmp	.L225	;
.L203:
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_30(D)->end_labels, status_30(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:435:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp142
	jne	.L211	;,
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbx), %rax	; status_30(D)->end_labels, status_30(D)->end_labels
; src/tac.c:436:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _12->tail, _12->tail
	movq	8(%rax), %rsi	; _13->content, label
; src/tac.c:437:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L211	;,
.L227:
; src/tac.c:438:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
.L225:
	call	create_instruction	;
	movq	%rax, %rsi	; tmp143, inst
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_30(D)->current_block, status_30(D)->current_block
	movq	8(%rax), %rdi	;, _14->instructions
; src/tac.c:461: }
	popq	%rcx	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:439:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
.L211:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC21(%rip), %rdi	;, tmp127
	jmp	.L226	;
.L201:
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_30(D)->start_labels, status_30(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:446:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp144
	jne	.L212	;,
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbx), %rax	; status_30(D)->start_labels, status_30(D)->start_labels
; src/tac.c:447:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _19->tail, _19->tail
	movq	8(%rax), %rsi	; _20->content, label
; src/tac.c:448:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	jne	.L227	;,
.L212:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC22(%rip), %rdi	;, tmp134
.L226:
; src/tac.c:461: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L200:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC23(%rip), %rdx	;, tmp136
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L199:
; src/tac.c:461: }
	popq	%rax	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	tac_statement, .-tac_statement
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
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp170, for_
; src/tac.c:549:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:543: void tac_for(For* for_, TACStatus* status) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp171, status
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
	movq	%rax, %r13	; tmp172, condition_label
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:550:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp173, body_label
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:552:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rbp)	;, for__51(D)->condition
; src/tac.c:551:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 8(%rsp)	; tmp174, %sfp
; src/tac.c:552:     if (for_->condition != NULL) {
	je	.L229	;,
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp175, _2
; src/tac.c:554:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp176, inst
; src/tac.c:555:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _3->instructions, _3->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:556:         Block* condition_block = create_block(condition_label);
	movq	%r13, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r14	; tmp177, condition_block
; src/tac.c:557:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%r14, %rsi	; condition_block,
	movq	32(%rax), %rdi	; _5->blocks, _5->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:558:         status->current_block = condition_block;
	movq	%r14, 16(%rbx)	; condition_block, status_52(D)->current_block
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	8(%rbp), %rdi	; for__51(D)->condition, for__51(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
; src/tac.c:560:         Arg* condition = tac_expression(for_->condition, status);
	movq	%rax, %r14	; tmp178, condition
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r15	; tmp179, _8
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rcx	; _8,
	movq	%r14, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:561:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	; tmp180, _9
	jmp	.L239	;
.L229:
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rsi	; tmp182, _12
.L239:
; src/tac.c:565:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp183, inst
; src/tac.c:566:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	;, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:569:     Block* body_block = create_block(body_label);
	movq	%r12, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp184, body_block
; src/tac.c:570:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%r14, %rsi	; body_block,
	movq	32(%rax), %rdi	; _15->blocks, _15->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:571:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_52(D)->current_block
; src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:574:     if (for_->increment != NULL)
	cmpq	$0, 16(%rbp)	;, for__51(D)->increment
; src/tac.c:573:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp185, increment_label
; src/tac.c:575:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rsi	; increment_label,
; src/tac.c:574:     if (for_->increment != NULL)
	jne	.L240	;,
; src/tac.c:576:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rbp)	;, for__51(D)->condition
; src/tac.c:577:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%r13, %rsi	; condition_label,
; src/tac.c:576:     else if (for_->condition != NULL)
	jne	.L240	;,
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r12, %rsi	; body_label,
.L240:
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_52(D)->start_labels, status_52(D)->start_labels
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rsi	; tmp188, _23
; src/tac.c:579:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_52(D)->end_labels, status_52(D)->end_labels
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rsi	; tmp189, _25
; src/tac.c:580:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:581:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rbp), %rdi	; for__51(D)->body, for__51(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp190, body_statements
.L234:
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r15, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp191, statement
; src/tac.c:583:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L241	;,
; src/tac.c:584:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L234	;
.L241:
; src/tac.c:585:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_52(D)->start_labels, status_52(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:586:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_52(D)->end_labels, status_52(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:587:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rbp)	;, for__51(D)->increment
	je	.L236	;,
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rsi	; tmp192, _31
; src/tac.c:589:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:590:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_52(D)->current_block, status_52(D)->current_block
	movq	8(%rax), %rdi	; _32->instructions, _32->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:591:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rdi	; increment_label,
	call	create_block	;
	movq	%rax, %r14	; tmp194, increment_block
; src/tac.c:592:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%r14, %rsi	; increment_block,
	movq	32(%rax), %rdi	; _34->blocks, _34->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:593:         status->current_block = increment_block;
	movq	%r14, 16(%rbx)	; increment_block, status_52(D)->current_block
; src/tac.c:594:         tac_expression(for_->increment, status);
	movq	16(%rbp), %rdi	; for__51(D)->increment, for__51(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
.L236:
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp195, _37
; src/tac.c:597:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
; src/tac.c:598:     if (for_->condition == NULL)
	cmpq	$0, 8(%rbp)	;, for__51(D)->condition
	jne	.L237	;,
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rsi	; tmp197, _39
; src/tac.c:599:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	;
.L237:
; src/tac.c:600:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rdx	; status_52(D)->current_block, status_52(D)->current_block
	movq	%rax, %rsi	; inst,
	movq	8(%rdx), %rdi	; _40->instructions, _40->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:602:     Block* end_block = create_block(end_label);
	movq	8(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %rbp	; tmp199, end_block
; src/tac.c:603:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_52(D)->current_subroutine, status_52(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _42->blocks, _42->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:604:     status->current_block = end_block;
	movq	%rbp, 16(%rbx)	; end_block, status_52(D)->current_block
; src/tac.c:606: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	tac_for, .-tac_for
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
	movq	%rdi, %r13	; tmp137, while_
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp138, status
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:607: void tac_while(While* while_, TACStatus* status) {
	subq	$24, %rsp	;,
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %edi	;,
	movq	%rax, %rsi	; condition_label,
; src/tac.c:610:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp139, condition_label
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	;
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp140, _1
; src/tac.c:611:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp141, inst
; src/tac.c:612:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:613:     Block* condition_block = create_block(condition_label);
	movq	%rbp, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r12	; tmp142, condition_block
; src/tac.c:614:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%r12, %rsi	; condition_block,
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:615:     status->current_block = condition_block;
	movq	%r12, 16(%rbx)	; condition_block, status_27(D)->current_block
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
	movq	%rax, %r14	; tmp143, body_label
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	0(%r13), %rdi	; while__42(D)->condition,
	movq	%rbx, %rsi	; status,
; src/tac.c:618:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp144, end_label
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	call	tac_expression	;
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
; src/tac.c:619:     Arg* condition = tac_expression(while_->condition, status);
	movq	%rax, %r15	; tmp145, condition
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; body_label,
	movl	$6, %edi	;,
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 8(%rsp)	; _7, %sfp
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rcx	; %sfp, _7
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	; tmp147, _8
; src/tac.c:620:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp148, inst
; src/tac.c:621:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:623:     Block* body_block = create_block(body_label);
	movq	%r14, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp149, body_block
; src/tac.c:624:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%r14, %rsi	; body_block,
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:625:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_27(D)->current_block
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_27(D)->start_labels, status_27(D)->start_labels
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rsi	; tmp150, _13
; src/tac.c:627:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_27(D)->end_labels, status_27(D)->end_labels
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rsi	; tmp151, _15
; src/tac.c:628:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:629:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r13), %rdi	; while__42(D)->body, while__42(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp152, body_statements
.L243:
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r13, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp153, statement
; src/tac.c:631:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L246	;,
; src/tac.c:632:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L243	;
.L246:
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
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp154, _20
; src/tac.c:636:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp155, inst
; src/tac.c:637:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_27(D)->current_block, status_27(D)->current_block
	movq	8(%rax), %rdi	; _21->instructions, _21->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:639:     Block* end_block = create_block(end_label);
	movq	%r12, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp156, end_block
; src/tac.c:640:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_27(D)->current_subroutine, status_27(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _23->blocks, _23->blocks
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
	movq	%rdi, %rbp	; tmp110, function
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, status
	pushq	%rcx	;
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rdi), %rsi	; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rdi), %rdi	; function_16(D)->name,
	call	create_subroutine	;
; src/tac.c:319:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; src/tac.c:318:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %r12	; tmp112, subroutine
; src/tac.c:320:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	%r12, %rsi	; subroutine,
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:322:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp113, parameters
.L248:
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:324:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L253	;,
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	(%rax), %rsi	; parameter_25->type,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_18->parameters, subroutine_18->parameters
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp114, _8
; src/tac.c:325:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L248	;
.L253:
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %rdi	; tmp116, _10
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_18->blocks, subroutine_18->blocks
; src/tac.c:327:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	; tmp117, block
; src/tac.c:328:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rbp), %rdi	; function_16(D)->body, function_16(D)->body
; src/tac.c:329:     status->current_block = block;
	movq	%r13, 16(%rbx)	; block, status_19(D)->current_block
; src/tac.c:331:     list(Statement*) statements = list_copy(function->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp118, statements
.L250:
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp119, statement
; src/tac.c:333:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L254	;,
; src/tac.c:334:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L250	;
.L254:
; src/tac.c:336:     status->current_subroutine = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbx)	;, status_19(D)->current_subroutine
; src/tac.c:338: }
	popq	%rdx	;
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
	movq	%rdi, %rbp	; tmp139, method
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp140, status
	pushq	%rcx	;
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rdi), %rsi	; method_33(D)->return_type, method_33(D)->return_type
	movq	(%rdi), %rdi	; method_33(D)->name,
	call	create_subroutine	;
; src/tac.c:343:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_36(D)->current_subroutine
; src/tac.c:342:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %r12	; tmp141, subroutine
; src/tac.c:344:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_36(D)->tac, status_36(D)->tac
	movq	%r12, %rsi	; subroutine,
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:346:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rdi	; method_33(D)->parameters, method_33(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp142, parameters
.L256:
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:348:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L262	;,
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rdi	; parameter_42->name, parameter_42->name
	movq	(%rax), %rsi	; parameter_42->type,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_35->parameters, subroutine_35->parameters
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp143, _8
; src/tac.c:349:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L256	;
.L262:
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %rdi	; tmp145, _10
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_35->blocks, subroutine_35->blocks
; src/tac.c:351:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	; tmp146, block
; src/tac.c:352:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_36(D)->current_class, status_36(D)->current_class
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:353:     status->current_block = block;
	movq	%r13, 16(%rbx)	; block, status_36(D)->current_block
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _13->name, _13->name
	movq	8(%rax), %rdi	; _14->name, _14->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp147, _16
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%rbp), %rax	; method_33(D)->name, method_33(D)->name
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _17->name, _17->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:354:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp148
	jne	.L258	;,
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	24(%rbx), %rax	; status_36(D)->current_class, status_36(D)->current_class
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	(%rax), %rsi	; _20->name,
	call	create_var	;
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp149, _22
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %edi	;,
; src/tac.c:355:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, status->current_class->name, VAR_TEMP, status));
	movq	%rax, %r12	; tmp150, temp
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	; status_36(D)->current_class, tmp156
	leaq	24(%rax), %rsi	;, tmp135
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	;
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%r12, %rsi	; temp,
	movl	$18, %edi	;,
	xorl	%ecx, %ecx	;
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rdx	; tmp151, _25
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_instruction	;
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r13), %rdi	; block_45->instructions, block_45->instructions
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; tmp152, _26
; src/tac.c:356:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, temp, create_arg(ARG_INT, &status->current_class->size), NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L258:
; src/tac.c:359:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rbp), %rdi	; method_33(D)->body, method_33(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp153, statements
.L259:
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp154, statement
; src/tac.c:361:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L263	;,
; src/tac.c:362:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L259	;
.L263:
; src/tac.c:364:     status->current_subroutine = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbx)	;, status_36(D)->current_subroutine
; src/tac.c:366: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_method, .-tac_method
	.section	.rodata.str1.1
.LC24:
	.string	"[warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp103, class
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:367: void tac_class(Class* class, TACStatus* status) {
	movq	%rsi, %rbx	; tmp104, status
; src/tac.c:369:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_13(D)->current_class
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_14(D)->members, class_14(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; src/tac.c:372:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%r13), %r14	; class_14(D)->name, _2
; src/tac.c:370:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %r12	; tmp105, members
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp106, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:10:     table->name = name;
	movq	%r14, 8(%rbp)	; _2, table_28->name
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rbp, %rsi	; table,
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, 0(%rbp)	; tmp107, table_28->attributes
; src/tac.c:374:     attr_table->size = class->size;
	movq	24(%r13), %rax	; class_14(D)->size, class_14(D)->size
	movq	%rax, 16(%rbp)	; class_14(D)->size, table_28->size
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_13(D)->tac, status_13(D)->tac
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC24(%rip), %rbp	;, tmp102
; src/tac.c:375:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rdi	; _4->attribute_tables,
	call	*list_append@GOTPCREL(%rip)	;
.L265:
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:376:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L273	;,
; src/tac.c:377:         switch (member->type) {
	movl	8(%rax), %ecx	; member_23->type, _6
; src/tac.c:377:         switch (member->type) {
	testl	%ecx, %ecx	; _6
	je	.L266	;,
	cmpl	$1, %ecx	;, _6
	jne	.L274	;,
; src/tac.c:382:                 tac_variable(member->content.variable, status, VAR_ATTR);
	movq	(%rax), %rdi	; member_23->content.variable,
	movl	$97, %edx	;,
	movq	%rbx, %rsi	; status,
	call	tac_variable	;
; src/tac.c:383:                 break;
	jmp	.L265	;
.L266:
; src/tac.c:379:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_23->content.method,
	movq	%rbx, %rsi	; status,
	call	tac_method	;
; src/tac.c:380:                 break;
	jmp	.L265	;
.L274:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbp, %rdx	; tmp102,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L265	;
.L273:
; src/tac.c:389:     status->current_class = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 24(%rbx)	;, status_13(D)->current_class
; src/tac.c:391: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC25:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC25(%rip), %r14	;, tmp108
; src/tac.c:283: TAC* tac_code(Code* code) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp109, code
; src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
; src/tac.c:283: TAC* tac_code(Code* code) {
	pushq	%rbp	;
	pushq	%rbx	;
; src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp110, <retval>
; src/tac.c:62:     tac->attribute_tables = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:62:     tac->attribute_tables = create_list();
	movq	%rax, 0(%rbp)	; tmp111, tac_29->attribute_tables
; src/tac.c:63:     tac->entry_point = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbp)	;, tac_29->entry_point
; src/tac.c:64:     tac->global_vars = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:64:     tac->global_vars = create_list();
	movq	%rax, 16(%rbp)	; tmp112, tac_29->global_vars
; src/tac.c:65:     tac->subroutines = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movl	$96, %edi	;,
; src/tac.c:65:     tac->subroutines = create_list();
	movq	%rax, 24(%rbp)	; tmp113, tac_29->subroutines
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:74:     status->current_block = NULL;
	xorl	%edx, %edx	;
; src/tac.c:71:     TACStatus* status = (TACStatus*)alloc_memory(sizeof(TACStatus));
	movq	%rax, %rbx	; tmp114, status
; src/tac.c:74:     status->current_block = NULL;
	movq	%rdx, 8(%rax)	;, status_26->current_subroutine
	movq	%rdx, 16(%rax)	;, status_26->current_block
; src/tac.c:72:     status->tac = tac;
	movq	%rbp, (%rax)	; <retval>, status_26->tac
; src/tac.c:75:     status->end_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:75:     status->end_labels = create_list();
	movq	%rax, 32(%rbx)	; tmp115, status_26->end_labels
; src/tac.c:76:     status->start_labels = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:80:     status->temp_count = 0;
	xorl	%ecx, %ecx	;
; src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	movq	(%r12), %rdi	; code_17(D)->members,
; src/tac.c:76:     status->start_labels = create_list();
	movq	%rax, 40(%rbx)	; tmp116, status_26->start_labels
; src/tac.c:80:     status->temp_count = 0;
	movq	%rcx, 48(%rbx)	;, status_26->attr_count
	movq	%rcx, 56(%rbx)	;, status_26->param_count
	movq	%rcx, 64(%rbx)	;, status_26->var_count
; src/tac.c:82:     status->subroutine_count = 0;
	movq	%rcx, 72(%rbx)	;, status_26->temp_count
	movq	%rcx, 80(%rbx)	;, status_26->block_count
	movq	%rcx, 88(%rbx)	;, status_26->subroutine_count
; src/tac.c:288:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp117, members
.L276:
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r13, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp119, code_member
; src/tac.c:290:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L284	;,
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%r12), %eax	; code_member_21->type, _2
; src/tac.c:291:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	jne	.L277	;,
; src/tac.c:292:             tac_function(code_member->content.function, status);
	movq	(%r12), %rdi	; code_member_21->content.function,
	movq	%rbx, %rsi	; status,
	call	tac_function	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%r12), %rax	; code_member_21->content.function, code_member_21->content.function
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r14, %rsi	; tmp108,
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %r12	; _4->name, _5
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%r12), %rdi	; _5->name, _5->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:293:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp118
	jne	.L276	;,
; src/tac.c:294:                 tac->entry_point = code_member->content.function->name;
	movq	%r12, 8(%rbp)	; _5, tac_29->entry_point
	jmp	.L276	;
.L277:
; src/tac.c:295:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	jne	.L280	;,
; src/tac.c:296:             tac_class(code_member->content.class, status);
	movq	(%r12), %rdi	; code_member_21->content.class,
	movq	%rbx, %rsi	; status,
	call	tac_class	;
	jmp	.L276	;
.L280:
; src/tac.c:297:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L276	;,
; src/tac.c:298:             tac_import(code_member->content.import, tac, status);
	movq	(%r12), %rdi	; code_member_21->content.import,
	movq	%rbx, %rdx	; status,
	movq	%rbp, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L276	;
.L284:
; src/tac.c:302: }
	popq	%rbx	;
	movq	%rbp, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_code, .-tac_code
	.section	.rodata
	.align 16
	.type	CSWTCH.43, @object
	.size	CSWTCH.43, 19
CSWTCH.43:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	14
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC17:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
