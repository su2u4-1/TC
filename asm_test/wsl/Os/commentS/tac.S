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
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
	movl	$32, %edi	;,
; src/tac.c:212: static Instruction* create_instruction(InstructionType type, Arg* arg1, Arg* arg2, Arg* arg3) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, arg1
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, arg2
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, arg3
	pushq	%rax	;
; src/tac.c:214:     Instruction* inst = (Instruction*)alloc_memory(sizeof(Instruction));
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
	.string	"[Warning] Unsupported type for size lookup: %s\n"
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
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	movl	$24, %edi	;,
; src/tac.c:222: static Arg* create_arg(ArgType kind, void* value) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, value
	pushq	%r8	;
; src/tac.c:224:     Arg* arg = (Arg*)alloc_memory(sizeof(Arg));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:226:     arg->type = NULL;
	xorl	%r9d, %r9d	;
; src/tac.c:225:     arg->kind = kind;
	movl	%ebp, 16(%rax)	; kind, arg_15->kind
; src/tac.c:227:     switch (kind) {
	decl	%ebp	;
; src/tac.c:226:     arg->type = NULL;
	movq	%r9, 8(%rax)	;, arg_15->type
; src/tac.c:227:     switch (kind) {
	cmpl	$7, %ebp	;, tmp95
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
	.long	.L65-.L66
	.text
.L72:
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	(%rbx), %rdx	; MEM[(long long int *)value_19(D)], _2
; src/tac.c:233:             arg->value.int_value = *(long long*)value;
	movq	%rdx, (%rax)	; _2, arg_15->value.int_value
; src/tac.c:234:             arg->type = name_int;
	movq	name_int(%rip), %rdx	; name_int, name_int
	jmp	.L75	;
.L71:
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	(%rbx), %xmm0	; MEM[(double *)value_19(D)], _4
; src/tac.c:238:             arg->type = name_float;
	movq	name_float(%rip), %rdx	; name_float, name_float
; src/tac.c:237:             arg->value.float_value = *(double*)value;
	movsd	%xmm0, (%rax)	; _4, arg_15->value.float_value
	jmp	.L75	;
.L70:
; src/tac.c:241:             arg->value.string_value = (string)value;
	movq	%rbx, (%rax)	; value, arg_15->value.string_value
; src/tac.c:242:             arg->type = name_string;
	movq	name_string(%rip), %rdx	; name_string, name_string
	jmp	.L75	;
.L69:
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	(%rbx), %dl	; MEM[(char *)value_19(D)], _7
; src/tac.c:245:             arg->value.bool_value = *(bool*)value;
	movb	%dl, (%rax)	; _7, arg_15->value.bool_value
; src/tac.c:246:             arg->type = name_bool;
	movq	name_bool(%rip), %rdx	; name_bool, name_bool
	jmp	.L75	;
.L68:
; src/tac.c:249:             arg->value.string_value = NULL;
	xorl	%ecx, %ecx	;
; src/tac.c:250:             arg->type = name_void;
	movq	name_void(%rip), %rdx	; name_void, name_void
; src/tac.c:249:             arg->value.string_value = NULL;
	movq	%rcx, (%rax)	;, arg_15->value.string_value
	jmp	.L75	;
.L67:
; src/tac.c:253:             arg->value.label = (Var*)value;
	movq	%rbx, (%rax)	; value, arg_15->value.label
; src/tac.c:254:             break;
	jmp	.L73	;
.L65:
; src/tac.c:257:             arg->value.subroutine = (Var*)value;
	movq	%rbx, (%rax)	; value,* <retval>
; src/tac.c:258:             arg->type = arg->value.subroutine->type;
	movq	16(%rbx), %rdx	; MEM[(struct Var *)value_19(D)].type, MEM[(struct Var *)value_19(D)].type
.L75:
	movq	%rdx, 8(%rax)	; MEM[(struct Var *)value_19(D)].type, arg_15->type
.L73:
; src/tac.c:265:     arg->is_get = false;
	movb	$0, 20(%rax)	;, arg_15->is_get
; src/tac.c:268: }
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
; src/tac.c:269: static Arg* load_rvalue(Arg* arg, TACStatus* status) {
	movq	%rdi, %rbx	; tmp96, arg
; src/tac.c:271:     if (arg == NULL) {
	testq	%rdi, %rdi	; arg
	je	.L77	;,
; src/tac.c:275:     if (arg->is_get) {
	cmpb	$0, 20(%rdi)	;, arg_3(D)->is_get
	je	.L77	;,
	movq	%rsi, %r12	; tmp97, status
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	8(%rdi), %rsi	; arg_3(D)->type, arg_3(D)->type
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	%r12, %rcx	; status,
	call	create_var	;
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp98, _10
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbx, %rdx	; arg,
	xorl	%ecx, %ecx	;
	movl	$23, %edi	;,
	movq	%rax, %rsi	; temp,
; src/tac.c:276:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, arg->type, VAR_TEMP, status));
	movq	%rax, %rbp	; tmp99, temp
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	call	create_instruction	;
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rbp, %rbx	; temp, arg
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	%rax, %rsi	; tmp100, _12
; src/tac.c:277:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_LOAD, temp, arg, NULL));
	movq	16(%r12), %rax	; status_6(D)->current_block, status_6(D)->current_block
	movq	8(%rax), %rdi	; _13->instructions, _13->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L77:
; src/tac.c:283: }
	movq	%rbx, %rax	; arg,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	load_rvalue, .-load_rvalue
	.section	.rodata.str1.1
.LC4:
	.string	"[Warning] Unsupported variable access with NULL base\n"
.LC5:
	.string	"[Warning] Failed to generate variable access for base\n"
.LC6:
	.string	"[Warning] Attempting to access attribute of non-object type: %s\n"
.LC7:
	.string	"[Warning] Attribute '%s' not found in type '%s'\n"
.LC8:
	.string	"[Warning] Attempting to access function '%s' as attribute of type '%s'\n"
.LC9:
	.string	"[Warning] Symbol '%s' in type '%s' is not an attribute\n"
.LC10:
	.string	"arr"
.LC11:
	.string	"[Warning] Attempting to index non-array type: %s\n"
.LC12:
	.string	"[Warning] Failed to generate variable access for index\n"
.LC13:
	.string	"[Warning] Attempting to call non-function, kind: %u, type name: %s\n"
.LC14:
	.string	"[Warning] Unsupported variable access type for tac_variable_access: %u\n"
	.text
	.globl	tac_variable_access
	.type	tac_variable_access, @function
tac_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	movq	%rdi, %r13	; tmp299, variable_access
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp300, status
	subq	$24, %rsp	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	cmpl	$0, 16(%rdi)	;, variable_access_131(D)->type
	jne	.L83	;,
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	movq	8(%rdi), %rdi	; variable_access_131(D)->content.name, _2
; src/tac.c:745:     if (variable_access->type == VAR_NAME && variable_access->content.name != NULL) {
	testq	%rdi, %rdi	; _2
	je	.L83	;,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	movl	32(%rdi), %eax	; _2->kind, _3
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	%rsi, %rcx	; status,
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	leal	-1(%rax), %edx	;, tmp216
; src/tac.c:746:         if (variable_access->content.name->kind == SYMBOL_FUNCTION || variable_access->content.name->kind == SYMBOL_METHOD) {
	cmpl	$1, %edx	;, tmp216
	ja	.L84	;,
; src/tac.c:747:             Arg* result = create_arg(ARG_FUNCTION, create_var(variable_access->content.name, variable_access->content.name->type, VAR_SUBROUTINE, status));
	movq	(%rdi), %rsi	; _2->type,
	movl	$102, %edx	;,
	jmp	.L124	;
.L84:
; src/tac.c:751:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name, VAR_VAR, status));
	movl	$118, %edx	;,
	movq	%rdi, %rsi	; _2,
; src/tac.c:750:         } else if (variable_access->content.name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	; _3
	je	.L125	;,
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	(%rdi), %rsi	; _2->type,
.L125:
	call	create_var	;
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	xorl	%edi, %edi	;
; src/tac.c:755:             Arg* result = create_arg(ARG_VARIABLE, create_var(variable_access->content.name, variable_access->content.name->type, VAR_VAR, status));
	movq	%rax, %rsi	; tmp303, _10
	jmp	.L123	;
.L83:
; src/tac.c:760:     if (variable_access->base == NULL) {
	movq	0(%r13), %rdi	; variable_access_131(D)->base, _11
; src/tac.c:760:     if (variable_access->base == NULL) {
	testq	%rdi, %rdi	; _11
	jne	.L86	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC4(%rip), %rdi	;, tmp218
	jmp	.L118	;
.L86:
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_variable_access	;
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	movq	%rax, %rdi	; tmp304, _13
; src/tac.c:765:     Arg* base = load_rvalue(tac_variable_access(variable_access->base, status), status);
	call	load_rvalue	;
	movq	%rax, %rbp	; tmp305, base
; src/tac.c:766:     if (base == NULL) {
	testq	%rax, %rax	; base
	jne	.L88	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC5(%rip), %rdi	;, tmp220
.L118:
	call	*fputs@GOTPCREL(%rip)	;
; src/tac.c:769:         return NULL;
	jmp	.L122	;
.L88:
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	movl	16(%r13), %ecx	; variable_access_131(D)->type, _15
; src/tac.c:771:     if (variable_access->type == VAR_GET_ATTR) {
	cmpl	$2, %ecx	;, _15
	jne	.L90	;,
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movq	8(%rax), %rax	; base_144->type, _16
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	movl	32(%rax), %edx	; _16->kind, _17
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	leal	-1(%rdx), %ecx	;, tmp221
; src/tac.c:772:         if (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_METHOD) {
	cmpl	$1, %ecx	;, tmp221
	ja	.L91	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _16->name, _16->name
	leaq	.LC6(%rip), %rdx	;, tmp224
	jmp	.L119	;
.L91:
; src/tac.c:777:         SymbolTable* scope = base->type->ast_node.scope;
	movq	24(%rax), %rdi	; _16->ast_node.scope, scope
; src/tac.c:778:         if (base->type->kind == SYMBOL_CLASS)
	testl	%edx, %edx	; _17
	jne	.L92	;,
; src/tac.c:779:             scope = base->type->ast_node.class->class_scope;
	movq	16(%rdi), %rdi	; MEM[(struct Class *)scope_201].class_scope, scope
.L92:
; src/tac.c:780:         Symbol* attr = search_name_use_strcmp(scope, variable_access->content.attr_name->name);
	movq	8(%r13), %rax	; variable_access_131(D)->content.attr_name, variable_access_131(D)->content.attr_name
	movq	8(%rax), %rsi	; _21->name, _21->name
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp306, attr
; src/tac.c:781:         if (attr == NULL) {
	testq	%rax, %rax	; attr
	jne	.L93	;,
; src/tac.c:782:             fprintf(stderr, "[Warning] Attribute '%s' not found in type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%r13), %rdx	; variable_access_131(D)->content.attr_name, variable_access_131(D)->content.attr_name
	movq	8(%rbp), %rax	; base_144->type, base_144->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rdx), %rcx	; _25->name, _25->name
	movq	8(%rax), %r8	; _23->name,
	leaq	.LC7(%rip), %rdx	;, tmp232
	jmp	.L120	;
.L93:
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	movl	32(%rax), %eax	; attr_204->kind, _28
; src/tac.c:786:         if (attr->kind == SYMBOL_FUNCTION) {
	cmpl	$1, %eax	;, _28
	jne	.L94	;,
; src/tac.c:787:             fprintf(stderr, "[Warning] Attempting to access function '%s' as attribute of type '%s'\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	; base_144->type, base_144->type
	movq	8(%r13), %rdx	; variable_access_131(D)->content.attr_name, variable_access_131(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movq	8(%rdx), %rcx	; _31->name, _31->name
	movq	8(%rax), %r8	; _29->name,
	leaq	.LC8(%rip), %rdx	;, tmp238
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rsi	; attr_204->type,
	movq	%rbx, %rcx	; status,
	movq	%r12, %rdi	; attr,
	movl	$102, %edx	;,
.L124:
	call	create_var	;
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$7, %edi	;,
; src/tac.c:788:             return create_arg(ARG_FUNCTION, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp307, _35
	jmp	.L123	;
.L94:
; src/tac.c:790:         if (attr->kind == SYMBOL_METHOD)
	cmpl	$2, %eax	;, _28
	jne	.L95	;,
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	(%r12), %rsi	; attr_204->type,
	movq	%r12, %rdi	; attr,
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	call	create_var	;
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %edi	;,
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp308, _37
.L123:
; src/tac.c:862: }
	addq	$24, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/tac.c:791:             return create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	jmp	create_arg	;
.L95:
; src/tac.c:792:         if (attr->kind != SYMBOL_ATTRIBUTE) {
	cmpl	$5, %eax	;, _28
	je	.L96	;,
; src/tac.c:793:             fprintf(stderr, "[Warning] Symbol '%s' in type '%s' is not an attribute\n", variable_access->content.attr_name->name, base->type->name);
	movq	8(%rbp), %rax	; base_144->type, base_144->type
	movq	8(%r13), %rdx	; variable_access_131(D)->content.attr_name, variable_access_131(D)->content.attr_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %r8	; _38->name,
	movq	8(%rdx), %rcx	; _40->name, _40->name
	leaq	.LC9(%rip), %rdx	;, tmp244
.L120:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:795:             return NULL;
	jmp	.L122	;
.L96:
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	(%r12), %rsi	; attr_204->type,
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp309, _44
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	8(%r13), %rdi	; variable_access_131(D)->content.attr_name, _45
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
; src/tac.c:797:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, attr->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp310, <retval>
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	(%rdi), %rsi	; _45->type,
	call	create_var	;
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	xorl	%edi, %edi	;
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rsi	; tmp311, _47
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	call	create_arg	;
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rbp, %rdx	; base,
	movq	%r12, %rsi	; <retval>,
	movl	$15, %edi	;,
; src/tac.c:798:         Instruction* inst = create_instruction(INST_GET_ATTR, temp, base, create_arg(ARG_VARIABLE, create_var(variable_access->content.attr_name, variable_access->content.attr_name->type, VAR_ATTR, status)));
	movq	%rax, %rcx	; tmp312, _48
	jmp	.L126	;
.L90:
; src/tac.c:803:     } else if (variable_access->type == VAR_GET_SEQ) {
	cmpl	$3, %ecx	;, _15
	jne	.L97	;,
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	movq	8(%rax), %rax	; base_144->type, base_144->type
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	leaq	.LC10(%rip), %rsi	;, tmp252
	movq	8(%rax), %rdi	; _51->name, _51->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:805:         if (strcmp(base->type->name, "arr") != 0) {
	testl	%eax, %eax	; tmp314
	je	.L98	;,
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	0(%rbp), %rax	; base_144->value.variable, base_144->value.variable
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC11(%rip), %rdx	;, tmp257
; src/tac.c:806:             fprintf(stderr, "[Warning] Attempting to index non-array type: %s\n", base->value.variable->original_name->name);
	movq	(%rax), %rax	; _54->original_name, _54->original_name
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _55->name, _55->name
.L119:
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:808:             return NULL;
	jmp	.L122	;
.L98:
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	8(%r13), %rdi	; variable_access_131(D)->content.index, variable_access_131(D)->content.index
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %rdi	; tmp315, _59
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	call	load_rvalue	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC12(%rip), %rdi	;, tmp260
; src/tac.c:810:         Arg* index = load_rvalue(tac_expression(variable_access->content.index, status), status);
	movq	%rax, %r13	; tmp316, index
; src/tac.c:811:         if (index == NULL) {
	testq	%rax, %rax	; index
	je	.L118	;,
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	name_int(%rip), %rsi	; name_int,
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp317, _62
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%r13, %rcx	; index,
	movq	%rbp, %rdx	; base,
	movl	$16, %edi	;,
; src/tac.c:818:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_int, VAR_TEMP, status));
	movq	%rax, %r12	; tmp318, <retval>
; src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rsi	; <retval>,
.L126:
	call	create_instruction	;
; src/tac.c:820:         temp->is_get = true;
	movb	$1, 20(%r12)	;,
; src/tac.c:819:         Instruction* inst = create_instruction(INST_GET_ELEM, temp, base, index);
	movq	%rax, %rsi	; tmp319, inst
	jmp	.L121	;
.L97:
; src/tac.c:824:     } else if (variable_access->type == VAR_FUNC_CALL) {
	cmpl	$1, %ecx	;, _15
	jne	.L100	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 16(%rax)	;, base_144->kind
	jne	.L101	;,
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	movq	8(%rax), %rax	; base_144->type, _66
; src/tac.c:825:         if (base->kind == ARG_VARIABLE && base->type->kind == SYMBOL_CLASS) {
	cmpl	$0, 32(%rax)	;, _66->kind
	jne	.L101	;,
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rax), %rdi	; _66->name, _66->name
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp320, _70
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	8(%rbp), %rax	; base_144->type, base_144->type
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	24(%rax), %rax	; _71->ast_node.class, _71->ast_node.class
	movq	16(%rax), %rdi	; _72->class_scope, _72->class_scope
	call	*search_name_use_strcmp@GOTPCREL(%rip)	;
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rbx, %rcx	; status,
	movl	$102, %edx	;,
	movq	(%rax), %rsi	; attr_147->type,
; src/tac.c:826:             Symbol* attr = search_name_use_strcmp(base->type->ast_node.class->class_scope, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME));
	movq	%rax, %rdi	; tmp321, attr
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_var	;
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movl	$8, %edi	;,
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp322, _75
; src/tac.c:827:             base = create_arg(ARG_METHOD, create_var(attr, attr->type, VAR_SUBROUTINE, status));
	call	create_arg	;
	movq	%rax, %rbp	; tmp323, base
.L101:
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	movl	16(%rbp), %ecx	; base_120->kind, _76
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	leal	-7(%rcx), %eax	;, tmp269
; src/tac.c:829:         if (base->kind != ARG_METHOD && base->kind != ARG_FUNCTION) {
	cmpl	$1, %eax	;, tmp269
	jbe	.L102	;,
; src/tac.c:830:             fprintf(stderr, "[Warning] Attempting to call non-function, kind: %u, type name: %s\n", base->kind, base->type->name);
	movq	8(%rbp), %rax	; base_120->type, base_120->type
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	leaq	.LC13(%rip), %rdx	;, tmp273
	movq	8(%rax), %r8	; _78->name,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L122:
; src/tac.c:832:             return NULL;
	xorl	%r12d, %r12d	; <retval>
	jmp	.L82	;
.L102:
; src/tac.c:834:         long long arg_count = 0;
	xorl	%eax, %eax	;
	movq	%rax, (%rsp)	;, arg_count
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	cmpl	$8, 16(%rbp)	;, base_120->kind
; src/tac.c:835:         list(Instruction*) arguments = create_list();
	movq	%rax, %r12	; tmp324, arguments
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	jne	.L105	;,
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rbp), %rax	; base_120->type, base_120->type
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
	movq	8(%rax), %rdi	; _83->name, _83->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp325, _85
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	0(%rbp), %rax	; base_120->value.subroutine, base_120->value.subroutine
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	(%rax), %rax	; _86->original_name, _86->original_name
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	movq	8(%rax), %rdi	; _87->name, _87->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:836:         if (base->kind == ARG_METHOD && strcmp(base->value.subroutine->original_name->name, make_method_name(base->type->name, DEFAULT_CONSTRUCTOR_NAME)) != 0) {
	testl	%eax, %eax	; tmp326
	je	.L105	;,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	0(%r13), %rax	; variable_access_131(D)->base, variable_access_131(D)->base
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
	movq	%rax, %rdx	; tmp327, _92
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	*create_expression@GOTPCREL(%rip)	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rdi	; tmp328, _93
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	tac_expression	;
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %rdi	; tmp329, _94
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	call	load_rvalue	;
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	8(%rax), %rdi	; self_159->type, self_159->type
; src/tac.c:837:             Arg* self = load_rvalue(tac_expression(create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, variable_access->base->base), NULL), status), status);
	movq	%rax, %r14	; tmp330, self
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	call	get_type_size	;
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	leaq	8(%rsp), %rsi	;, tmp285
	movl	$1, %edi	;,
; src/tac.c:838:             long long size = (long long)get_type_size(self->type);
	movq	%rax, 8(%rsp)	; tmp331, MEM[(long long int *)_7]
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	create_arg	;
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	xorl	%ecx, %ecx	;
	movq	%r14, %rdx	; self,
	movl	$17, %edi	;,
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rax, %rsi	; tmp332, _98
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	create_instruction	;
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%r12, %rdi	; arguments,
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	movq	%rax, %rsi	; tmp333, _99
; src/tac.c:839:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), self, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:840:             arg_count++;
	incq	(%rsp)	; arg_count
.L105:
; src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	movq	8(%r13), %rdi	; variable_access_131(D)->content.args, variable_access_131(D)->content.args
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	leaq	8(%rsp), %r14	;, tmp298
; src/tac.c:842:         list(Expression*) args = list_copy(variable_access->content.args);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp334, args
.L107:
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	movq	%r13, %rdi	; args,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp340, arg_expr
; src/tac.c:844:         while ((arg_expr = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	; arg_expr
	je	.L109	;,
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rax, %rdi	; tmp335, _103
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	call	load_rvalue	;
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	8(%rax), %rdi	; arg_182->type, arg_182->type
; src/tac.c:845:             Arg* arg = load_rvalue(tac_expression(arg_expr, status), status);
	movq	%rax, %r15	; tmp336, arg
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	call	get_type_size	;
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r14, %rsi	; tmp298,
	movl	$1, %edi	;,
; src/tac.c:846:             long long size = (long long)get_type_size(arg->type);
	movq	%rax, 8(%rsp)	; tmp337, MEM[(long long int *)_7]
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	create_arg	;
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	xorl	%ecx, %ecx	;
	movq	%r15, %rdx	; arg,
	movl	$17, %edi	;,
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rax, %rsi	; tmp338, _107
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	create_instruction	;
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%r12, %rdi	; arguments,
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	movq	%rax, %rsi	; tmp339, _108
; src/tac.c:847:             list_append(arguments, (pointer)create_instruction(INST_PARAM, create_arg(ARG_INT, &size), arg, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:848:             arg_count++;
	incq	(%rsp)	; arg_count
	jmp	.L107	;
.L109:
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	movq	%r12, %rdi	; arguments,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp341, arg
; src/tac.c:851:         while ((arg = (Instruction*)list_pop(arguments)) != NULL)
	testq	%rax, %rax	; arg
	je	.L127	;,
; src/tac.c:852:             list_append(status->current_block->instructions, (pointer)arg);
	movq	16(%rbx), %rax	; status_132(D)->current_block, status_132(D)->current_block
	movq	8(%rax), %rdi	; _111->instructions, _111->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L109	;
.L127:
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; base_120->type, base_120->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp342, _114
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rsp, %rsi	;, tmp292
	movl	$1, %edi	;,
; src/tac.c:853:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, base->type, VAR_TEMP, status));
	movq	%rax, %r12	; tmp343, <retval>
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	call	create_arg	;
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%r12, %rsi	; <retval>,
	movq	%rbp, %rdx	; base,
	movl	$22, %edi	;,
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	%rax, %rcx	; tmp344, _115
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp345, _116
.L121:
; src/tac.c:854:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_CALL, temp, base, create_arg(ARG_INT, &arg_count)));
	movq	16(%rbx), %rax	; status_132(D)->current_block, status_132(D)->current_block
	movq	8(%rax), %rdi	;, _117->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:856:         return temp;
	jmp	.L82	;
.L100:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC14(%rip), %rdx	;, tmp296
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/tac.c:860:         return NULL;
	jmp	.L122	;
.L82:
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
	.size	tac_variable_access, .-tac_variable_access
	.section	.rodata.str1.1
.LC16:
	.string	"[Warning] Unsupported type for negation: %s\n"
.LC17:
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
	movl	8(%rdi), %ecx	; primary_36(D)->type,
; src/tac.c:681:     switch (primary->type) {
	cmpl	$8, %ecx	;, _1
	ja	.L129	;,
	leaq	.L131(%rip), %rdx	;, tmp118
	movq	%rsi, %rbp	; tmp143, status
	movslq	(%rdx,%rcx,4), %rax	;, tmp120
	addq	%rdx, %rax	; tmp118, tmp121
	jmp	*%rax	; tmp121
	.section	.rodata
	.align 4
	.align 4
.L131:
	.long	.L139-.L131
	.long	.L138-.L131
	.long	.L137-.L131
	.long	.L136-.L131
	.long	.L135-.L131
	.long	.L134-.L131
	.long	.L133-.L131
	.long	.L132-.L131
	.long	.L130-.L131
	.text
.L139:
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value,
	xorl	%esi, %esi	;
	movl	$10, %edx	;,
	call	*strtoll@GOTPCREL(%rip)	;
; src/tac.c:685:             return create_arg(ARG_INT, &t);
	leaq	8(%rsp), %rsi	;, tmp123
	movl	$1, %edi	;,
; src/tac.c:683:             long long t = strtoll(primary->value.literal_value, NULL, 10);
	movq	%rax, 8(%rsp)	; tmp144, MEM[(long long int *)_90]
	jmp	.L148	;
.L138:
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movq	(%rdi), %rdi	; primary_36(D)->value.literal_value,
	xorl	%esi, %esi	;
	call	*strtod@GOTPCREL(%rip)	;
; src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	leaq	8(%rsp), %rsi	;, tmp124
	movl	$2, %edi	;,
; src/tac.c:688:             double t = strtod(primary->value.literal_value, NULL);
	movsd	%xmm0, 8(%rsp)	; tmp146, MEM[(double *)_90]
.L148:
; src/tac.c:689:             return create_arg(ARG_FLOAT, &t);
	call	create_arg	;
	movq	%rax, %rbx	; tmp147, <retval>
	jmp	.L128	;
.L137:
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movq	(%rdi), %rsi	; primary_36(D)->value.literal_value,
; src/tac.c:742: }
	addq	$16, %rsp	;,
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	movl	$3, %edi	;,
; src/tac.c:742: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:693:             return create_arg(ARG_STRING, primary->value.literal_value);
	jmp	create_arg	;
.L136:
; src/tac.c:695:             bool t = true;
	movb	$1, 8(%rsp)	;, MEM[(char *)_90]
	jmp	.L149	;
.L135:
; src/tac.c:700:             bool t = false;
	movb	$0, 8(%rsp)	;, MEM[(char *)_90]
.L149:
; src/tac.c:702:             return create_arg(ARG_BOOL, &t);
	leaq	8(%rsp), %rsi	;, tmp126
	movl	$4, %edi	;,
	jmp	.L148	;
.L134:
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.expr,
; src/tac.c:742: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:706:             return tac_expression(primary->value.expr, status);
	jmp	tac_expression	;
.L133:
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand,
	call	tac_primary	;
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp150, _9
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	movq	name_bool(%rip), %rsi	; name_bool,
; src/tac.c:708:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r12	; tmp151, operand
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_var	;
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp152, _11
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; operand,
	movl	$13, %edi	;,
; src/tac.c:709:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, name_bool, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp153, <retval>
; src/tac.c:710:             Instruction* inst = create_instruction(INST_NOT, temp, operand, NULL);
	movq	%rax, %rsi	; <retval>,
	jmp	.L146	;
.L132:
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	(%rdi), %rdi	; primary_36(D)->value.operand,
	call	tac_primary	;
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rbp, %rsi	; status,
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %rdi	; tmp155, _15
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	call	load_rvalue	;
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
	movq	%rbp, %rcx	; status,
	movl	$116, %edx	;,
	movq	8(%rax), %rsi	; operand_42->type, operand_42->type
; src/tac.c:716:             Arg* operand = load_rvalue(tac_primary(primary->value.operand, status), status);
	movq	%rax, %r12	; tmp156, operand
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_var	;
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp157, _17
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:719:             long long zero_int = 0;
	xorl	%r10d, %r10d	;
; src/tac.c:717:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, operand->type, VAR_TEMP, status));
	movq	%rax, %rbx	; tmp158, <retval>
; src/tac.c:720:             double neg_one_float = -1.0;
	movq	.LC15(%rip), %rax	;, tmp164
; src/tac.c:719:             long long zero_int = 0;
	movq	%r10, (%rsp)	;, zero_int
; src/tac.c:720:             double neg_one_float = -1.0;
	movq	%rax, 8(%rsp)	; tmp164, MEM[(double *)_90]
; src/tac.c:721:             if (operand->type == name_int)
	movq	8(%r12), %rax	; operand_42->type, _18
; src/tac.c:721:             if (operand->type == name_int)
	cmpq	name_int(%rip), %rax	; name_int, _18
	jne	.L141	;,
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rsp, %rsi	;, tmp132
	movl	$1, %edi	;,
	call	create_arg	;
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbx, %rsi	; <retval>,
	movl	$1, %edi	;,
; src/tac.c:722:                 inst = create_instruction(INST_SUB, temp, create_arg(ARG_INT, &zero_int), operand);
	movq	%rax, %rdx	; tmp159, _20
	jmp	.L146	;
.L141:
; src/tac.c:723:             else if (operand->type == name_float)
	cmpq	name_float(%rip), %rax	; name_float, _18
	jne	.L143	;,
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	leaq	8(%rsp), %rsi	;, tmp133
	movl	$2, %edi	;,
	call	create_arg	;
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%r12, %rcx	; operand,
	movq	%rbx, %rsi	; <retval>,
	movl	$2, %edi	;,
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	movq	%rax, %rdx	; tmp161, _22
.L146:
; src/tac.c:724:                 inst = create_instruction(INST_MUL, temp, create_arg(ARG_FLOAT, &neg_one_float), operand);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp162, inst
; src/tac.c:730:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbp), %rax	; status_37(D)->current_block, status_37(D)->current_block
	movq	8(%rax), %rdi	;, _25->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:732:             return temp;
	jmp	.L128	;
.L143:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _18->name, _18->name
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC16(%rip), %rdx	;, tmp136
	xorl	%eax, %eax	;
	movl	$2, %esi	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L147	;
.L130:
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	movq	(%rdi), %rdi	; primary_36(D)->value.var,
; src/tac.c:742: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
; src/tac.c:736:             return tac_variable_access(primary->value.var, status);
	jmp	tac_variable_access	;
.L129:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC17(%rip), %rdx	;, tmp140
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
.L147:
; src/tac.c:740:             return NULL;
	xorl	%ebx, %ebx	; <retval>
.L128:
; src/tac.c:742: }
	addq	$16, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	tac_primary, .-tac_primary
	.section	.rodata.str1.1
.LC18:
	.string	"[Warning] Left-hand side of assignment is not a variable\n"
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
; src/tac.c:649:     if (expression->operator == OP_NONE) {
	cmpl	$19, 24(%rdi)	;, expression_30(D)->operator
; src/tac.c:647: Arg* tac_expression(Expression* expression, TACStatus* status) {
	movq	%rsi, %rbx	; tmp129, status
; src/tac.c:649:     if (expression->operator == OP_NONE) {
	jne	.L151	;,
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	movq	8(%rdi), %rdi	; expression_30(D)->prim_left, expression_30(D)->prim_left
; src/tac.c:678: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:650:         Arg* result = tac_primary(expression->prim_left, status);
	jmp	tac_primary	;
.L151:
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	16(%rdi), %rdi	; expression_30(D)->right, expression_30(D)->right
; src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	$25, %r14d	;, _65
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	tac_expression	;
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	movq	%rax, %rdi	; tmp130, _4
; src/tac.c:654:     Arg* right = load_rvalue(tac_expression(expression->right, status), status);
	call	load_rvalue	;
	movq	%rax, %r12	; tmp131, <retval>
; src/tac.c:655:     InstructionType op = get_instruction_type(expression->operator);
	movl	24(%r13), %eax	; expression_30(D)->operator,
	cmpl	$18, %eax	;, _5
	ja	.L152	;,
	leaq	CSWTCH.47(%rip), %rdx	;, tmp115
	movzbl	(%rdx,%rax), %r14d	; CSWTCH.47[_5], _65
.L152:
; src/tac.c:656:     Arg* left = tac_expression(expression->expr_left, status);
	movq	0(%r13), %rdi	; expression_30(D)->expr_left,
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
	movq	%rax, %rbp	; tmp132, left
; src/tac.c:32:     return op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN;
	movl	24(%r13), %eax	; expression_30(D)->operator, expression_30(D)->operator
	subl	$13, %eax	;, tmp117
; src/tac.c:658:     if (is_assignment_operator(expression->operator)) {
	cmpl	$5, %eax	;, tmp117
	ja	.L153	;,
; src/tac.c:659:         if (op != INST_ASSIGN) {
	cmpl	$14, %r14d	;, _65
	je	.L154	;,
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; left_38->type, left_38->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp133, _9
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; left,
; src/tac.c:660:             Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp134, temp
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %rcx	; <retval>,
	movq	%r13, %rsi	; temp,
	movl	%r14d, %edi	; _65,
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %rdx	; tmp135, _10
; src/tac.c:663:             right = temp;
	movq	%r13, %r12	; temp, <retval>
; src/tac.c:661:             inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp136, inst
; src/tac.c:662:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _11->instructions, _11->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L154:
; src/tac.c:665:         if (left->kind != ARG_VARIABLE)
	cmpl	$0, 16(%rbp)	;, left_38->kind
	je	.L155	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC18(%rip), %rdi	;, tmp123
	call	*fputs@GOTPCREL(%rip)	;
.L155:
; src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	xorl	%ecx, %ecx	;
	movq	%rbp, %rsi	; left,
	movq	%r12, %rdx	; <retval>,
	movl	$14, %edi	;,
	call	create_instruction	;
; src/tac.c:668:         if (left->is_get)
	cmpb	$0, 20(%rbp)	;, left_38->is_get
; src/tac.c:667:         inst = create_instruction(INST_ASSIGN, left, right, NULL);
	movq	%rax, %rsi	; tmp137, inst
; src/tac.c:668:         if (left->is_get)
	je	.L156	;,
; src/tac.c:669:             inst = create_instruction(INST_STORE, left, right, NULL);
	movq	%rbp, %rsi	; left,
	xorl	%ecx, %ecx	;
	movq	%r12, %rdx	; <retval>,
	movl	$24, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp138, inst
	jmp	.L156	;
.L153:
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	8(%rbp), %rsi	; left_38->type, left_38->type
	movq	%rbx, %rcx	; status,
	movl	$116, %edx	;,
	xorl	%edi, %edi	;
	call	create_var	;
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	xorl	%edi, %edi	;
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %rsi	; tmp139, _17
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	call	create_arg	;
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rbx, %rsi	; status,
	movq	%rbp, %rdi	; left,
; src/tac.c:671:         Arg* temp = create_arg(ARG_VARIABLE, create_var(NULL, left->type, VAR_TEMP, status));
	movq	%rax, %r13	; tmp140, temp
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	load_rvalue	;
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%r12, %rcx	; <retval>,
	movq	%r13, %rsi	; temp,
	movl	%r14d, %edi	; _65,
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	movq	%rax, %rdx	; tmp141, _18
; src/tac.c:673:         right = temp;
	movq	%r13, %r12	; temp, <retval>
; src/tac.c:672:         inst = create_instruction(op, temp, load_rvalue(left, status), right);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp142, inst
.L156:
; src/tac.c:675:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_31(D)->current_block, status_31(D)->current_block
	movq	8(%rax), %rdi	; _19->instructions, _19->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:678: }
	popq	%rbx	;
	movq	%r12, %rax	; <retval>,
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_expression, .-tac_expression
	.section	.rodata.str1.1
.LC19:
	.string	"Error: create_attribute received NULL table\n"
.LC20:
	.string	"Error: create_attribute received NULL table or attributes list\n"
	.text
	.globl	tac_variable
	.type	tac_variable, @function
tac_variable:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp123, variable
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp124, status
	subq	$16, %rsp	;,
; src/tac.c:403:     if (is_attr) {
	testb	%dl, %dl	; tmp125
	je	.L163	;,
; src/tac.c:404:         AttributeTable* attr_table = (AttributeTable*)list_pop_back(status->tac->attribute_tables);
	movq	(%rsi), %rax	; status_12(D)->tac, status_12(D)->tac
	movq	(%rax), %rdi	; _1->attribute_tables,
	call	*list_pop_back@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp126, attr_table
; src/tac.c:405:         list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_12(D)->tac, status_12(D)->tac
	movq	%rbp, %rsi	; attr_table,
	movq	(%rax), %rdi	; _3->attribute_tables,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:406:         create_attribute(variable->name, variable->type, attr_table, 0, status);
	movq	(%r12), %r13	; variable_11(D)->type, _5
	movq	8(%r12), %r14	; variable_11(D)->name, _6
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rbx, %rcx	; status,
	movl	$97, %edx	;,
	movq	%r13, %rsi	; _5,
	movq	%r14, %rdi	; _6,
; src/tac.c:196:     Attribute* attr = (Attribute*)alloc_memory(sizeof(Attribute));
	movq	%rax, %r12	; tmp127, attr
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	call	create_var	;
; src/tac.c:199:     attr->offset = offset;
	xorl	%r10d, %r10d	;
; src/tac.c:198:     attr->type = type;
	movq	%r13, 8(%r12)	; _5, attr_17->type
; src/tac.c:197:     attr->var = create_var(var, type, VAR_ATTR, status);
	movq	%rax, (%r12)	; tmp128, attr_17->var
; src/tac.c:199:     attr->offset = offset;
	movq	%r10, 16(%r12)	;, attr_17->offset
; src/tac.c:200:     if (offset == 0 && table != NULL) {
	testq	%rbp, %rbp	; attr_table
	je	.L164	;,
; src/tac.c:201:         attr->offset = table->size;
	movq	16(%rbp), %rax	; attr_table_14->size, attr_table_14->size
; src/tac.c:202:         table->size += get_type_size(type);
	movq	%r13, %rdi	; _5,
; src/tac.c:201:         attr->offset = table->size;
	movq	%rax, 16(%r12)	; attr_table_14->size, attr_17->offset
; src/tac.c:202:         table->size += get_type_size(type);
	call	get_type_size	;
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	movq	0(%rbp), %rdi	; attr_table_14->attributes, _27
; src/tac.c:202:         table->size += get_type_size(type);
	addq	%rax, 16(%rbp)	; tmp129, attr_table_14->size
; src/tac.c:208:         list_append(table->attributes, (pointer)attr);
	movq	%r12, %rsi	; attr,
; src/tac.c:205:     if (table == NULL || table->attributes == NULL)
	testq	%rdi, %rdi	; _27
	jne	.L175	;,
	jmp	.L165	;
.L164:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC19(%rip), %rdi	;, tmp116
	call	*fputs@GOTPCREL(%rip)	;
.L165:
	movq	stderr(%rip), %rsi	; stderr,
; src/tac.c:421: }
	addq	$16, %rsp	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC20(%rip), %rdi	;, tmp118
; src/tac.c:421: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L163:
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	8(%rdi), %rdi	; variable_11(D)->name, variable_11(D)->name
	movq	%rsi, %rcx	; status,
	movq	(%r12), %rsi	; variable_11(D)->type,
	movl	$118, %edx	;,
	call	create_var	;
; src/tac.c:414:         if (variable->value != NULL)
	movq	16(%r12), %rdi	; variable_11(D)->value, _32
; src/tac.c:408:         var = create_var(variable->name, variable->type, VAR_VAR, status);
	movq	%rax, %r13	; tmp130, var
; src/tac.c:414:         if (variable->value != NULL)
	testq	%rdi, %rdi	; _32
	je	.L167	;,
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	movq	%rax, %rdi	; tmp131, _33
; src/tac.c:415:             value = load_rvalue(tac_expression(variable->value, status), status);
	call	load_rvalue	;
	jmp	.L174	;
.L167:
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	xorl	%ecx, %ecx	;
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	leaq	8(%rsp), %rsi	;, tmp120
	movl	$1, %edi	;,
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	%rcx, 8(%rsp)	;, D.6669
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	call	create_arg	;
.L174:
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%r13, %rsi	; var,
	xorl	%edi, %edi	;
; src/tac.c:417:             value = create_arg(ARG_INT, &(long long){0});
	movq	%rax, %rbp	; tmp133, value
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	call	create_arg	;
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movl	$14, %edi	;,
	xorl	%ecx, %ecx	;
	movq	%rbp, %rdx	; value,
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	%rax, %rsi	; tmp134, _36
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp135, _38
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	movq	16(%rbx), %rax	; status_12(D)->current_block, status_12(D)->current_block
	movq	8(%rax), %rdi	; _39->instructions, _39->instructions
.L175:
; src/tac.c:421: }
	addq	$16, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
; src/tac.c:418:         list_append(status->current_block->instructions, (pointer)create_instruction(INST_ASSIGN, create_arg(ARG_VARIABLE, var), value, NULL));
	jmp	*list_append@GOTPCREL(%rip)	;
	.size	tac_variable, .-tac_variable
	.globl	tac_if
	.type	tac_if, @function
tac_if:
	pushq	%r15	;
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rsi, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp181, if_
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp182, status
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:465: void tac_if(If* if_, TACStatus* status) {
	subq	$40, %rsp	;,
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
	xorl	%esi, %esi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:468:     Var* then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp183, then_label
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	16(%r12), %rdi	; if__63(D)->else_if, if__63(D)->else_if
; src/tac.c:469:     Var* else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp184, else_label
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp185
	jne	.L177	;,
.L179:
; src/tac.c:474:         end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %r13	; tmp186, end_label
	jmp	.L178	;
.L177:
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	movq	24(%r12), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:471:     if (list_is_empty(if_->else_if) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp187
	je	.L179	;,
; src/tac.c:472:         end_label = else_label;
	movq	%rbp, %r13	; else_label, end_label
.L178:
; src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%r13, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	(%r12), %rdi	; if__63(D)->condition,
	movq	%rbx, %rsi	; status,
; src/tac.c:475:     Arg* end_block_arg = create_arg(ARG_LABEL, end_label);
	movq	%rax, (%rsp)	; tmp188, %sfp
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	tac_expression	;
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rax, %rdi	; tmp189, _6
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	call	load_rvalue	;
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
; src/tac.c:477:     Arg* condition = load_rvalue(tac_expression(if_->condition, status), status);
	movq	%rax, %r15	; tmp190, condition
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%r14, %rsi	; then_label,
	movl	$6, %edi	;,
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 8(%rsp)	; _7, %sfp
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	8(%rsp), %rcx	; %sfp, _7
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %rdx	; tmp192, _8
; src/tac.c:478:     Instruction* inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp193, inst
; src/tac.c:479:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _9->instructions, _9->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:481:     Block* then_block = create_block(then_label);
	movq	%r14, %rdi	; then_label,
	call	create_block	;
	movq	%rax, %r14	; tmp194, then_block
; src/tac.c:482:     list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%r14, %rsi	; then_block,
	movq	32(%rax), %rdi	; _11->blocks, _11->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:483:     status->current_block = then_block;
	movq	%r14, 16(%rbx)	; then_block, status_58(D)->current_block
; src/tac.c:485:     list(Statement*) then_statements = list_copy(if_->body);
	movq	8(%r12), %rdi	; if__63(D)->body, if__63(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp195, then_statements
.L180:
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	movq	%r14, %rdi	; then_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp196, statement
; src/tac.c:487:     while ((statement = (Statement*)list_pop(then_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L200	;,
; src/tac.c:488:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L180	;
.L200:
; src/tac.c:490:     Instruction* jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp197, jump_to_end
; src/tac.c:491:     list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _14->instructions, _14->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	movq	16(%r12), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:493:     if (!list_is_empty(if_->else_if)) {
	testb	%al, %al	; tmp198
	jne	.L182	;,
; src/tac.c:495:         list(ElseIf*) elif_list = list_copy(if_->else_if);
	movq	16(%r12), %rdi	; if__63(D)->else_if, if__63(D)->else_if
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, 8(%rsp)	; tmp199, %sfp
.L183:
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	movq	8(%rsp), %rdi	; %sfp,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp214, elif
; src/tac.c:497:         while ((elif = (ElseIf*)list_pop(elif_list)) != NULL) {
	testq	%rax, %rax	; elif
	je	.L182	;,
; src/tac.c:499:             Block* else_if_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp200, else_if_block
; src/tac.c:500:             list_append(status->current_subroutine->blocks, (pointer)else_if_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%rbp, %rsi	; else_if_block,
	movq	32(%rax), %rdi	; _19->blocks, _19->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:501:             status->current_block = else_if_block;
	movq	%rbp, 16(%rbx)	; else_if_block, status_58(D)->current_block
; src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
; src/tac.c:503:             then_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 16(%rsp)	; tmp201, %sfp
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	(%r14), %rdi	; elif_93->condition,
	movq	%rbx, %rsi	; status,
; src/tac.c:504:             else_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp202, else_label
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	tac_expression	;
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rax, %rdi	; tmp203, _22
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	call	load_rvalue	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	8(%rsp), %rdi	; %sfp,
; src/tac.c:506:             condition = load_rvalue(tac_expression(elif->condition, status), status);
	movq	%rax, %r15	; tmp204, condition
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	testb	%al, %al	; tmp205
	je	.L185	;,
; src/tac.c:507:             if (list_is_empty(elif_list) && list_is_empty(if_->else_body))
	movq	24(%r12), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:508:                 else_label = end_label;
	testb	%al, %al	; tmp206
	cmovne	%r13, %rbp	; else_label,, end_label, else_label
.L185:
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rbp, %rsi	; else_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	16(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, 24(%rsp)	; _26, %sfp
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_arg	;
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	24(%rsp), %rcx	; %sfp, _26
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	movq	%rax, %rdx	; tmp208, _27
; src/tac.c:509:             inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, then_label), create_arg(ARG_LABEL, else_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp209, inst
; src/tac.c:510:             list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _28->instructions, _28->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:512:             then_block = create_block(then_label);
	movq	16(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %r15	; tmp210, then_block
; src/tac.c:513:             list_append(status->current_subroutine->blocks, (pointer)then_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%r15, %rsi	; then_block,
	movq	32(%rax), %rdi	; _30->blocks, _30->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	movq	8(%r14), %rdi	; elif_93->body, elif_93->body
; src/tac.c:514:             status->current_block = then_block;
	movq	%r15, 16(%rbx)	; then_block, status_58(D)->current_block
; src/tac.c:516:             list(Statement*) elif_statements = list_copy(elif->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp211, elif_statements
.L186:
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	movq	%r14, %rdi	; elif_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp212, elif_statement
; src/tac.c:518:             while ((elif_statement = (Statement*)list_pop(elif_statements)) != NULL)
	testq	%rax, %rax	; elif_statement
	je	.L201	;,
; src/tac.c:519:                 tac_statement(elif_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L186	;
.L201:
; src/tac.c:521:             jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
	call	create_instruction	;
	movq	%rax, %rsi	; tmp213, jump_to_end
; src/tac.c:522:             list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _33->instructions, _33->instructions
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L183	;
.L182:
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	movq	24(%r12), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:526:     if (!list_is_empty(if_->else_body)) {
	testb	%al, %al	; tmp215
	jne	.L189	;,
; src/tac.c:528:         Block* else_block = create_block(else_label);
	movq	%rbp, %rdi	; else_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp216, else_block
; src/tac.c:529:         list_append(status->current_subroutine->blocks, (pointer)else_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%rbp, %rsi	; else_block,
	movq	32(%rax), %rdi	; _37->blocks, _37->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:530:         status->current_block = else_block;
	movq	%rbp, 16(%rbx)	; else_block, status_58(D)->current_block
; src/tac.c:532:         list(Statement*) else_statements = list_copy(if_->else_body);
	movq	24(%r12), %rdi	; if__63(D)->else_body, if__63(D)->else_body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp217, else_statements
.L190:
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	movq	%rbp, %rdi	; else_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp218, else_statement
; src/tac.c:534:         while ((else_statement = (Statement*)list_pop(else_statements)) != NULL)
	testq	%rax, %rax	; else_statement
	je	.L202	;,
; src/tac.c:535:             tac_statement(else_statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L190	;
.L202:
; src/tac.c:537:         jump_to_end = create_instruction(INST_JMP, end_block_arg, NULL, NULL);
	movq	(%rsp), %rsi	; %sfp,
	movl	$20, %edi	;,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	create_instruction	;
	movq	%rax, %rsi	; tmp219, jump_to_end
; src/tac.c:538:         list_append(status->current_block->instructions, (pointer)jump_to_end);
	movq	16(%rbx), %rax	; status_58(D)->current_block, status_58(D)->current_block
	movq	8(%rax), %rdi	; _40->instructions, _40->instructions
	call	*list_append@GOTPCREL(%rip)	;
.L189:
; src/tac.c:541:     Block* end_block = create_block(end_label);
	movq	%r13, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp220, end_block
; src/tac.c:542:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_58(D)->current_subroutine, status_58(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _42->blocks, _42->blocks
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
	.size	tac_if, .-tac_if
	.section	.rodata.str1.1
.LC21:
	.string	"[Warning] 'break' statement used outside of loop\n"
.LC22:
	.string	"[Warning] 'continue' statement used outside of loop\n"
.LC23:
	.string	"[Warning] Unsupported statement type for tac_statement: %d\n"
	.text
	.globl	tac_statement
	.type	tac_statement, @function
tac_statement:
; src/tac.c:424:     switch (statement->type) {
	movl	8(%rdi), %ecx	; statement_32(D)->type,
; src/tac.c:424:     switch (statement->type) {
	cmpl	$7, %ecx	;, _1
	ja	.L204	;,
	leaq	.L206(%rip), %rdx	;, tmp117
; src/tac.c:422: void tac_statement(Statement* statement, TACStatus* status) {
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp140, statement
	pushq	%rbx	;
	pushq	%rbx	;
; src/tac.c:424:     switch (statement->type) {
	movslq	(%rdx,%rcx,4), %rax	;, tmp119
	movq	%rsi, %rbx	; tmp141, status
	addq	%rdx, %rax	; tmp117, tmp120
	jmp	*%rax	; tmp120
	.section	.rodata
	.align 4
	.align 4
.L206:
	.long	.L213-.L206
	.long	.L212-.L206
	.long	.L211-.L206
	.long	.L210-.L206
	.long	.L209-.L206
	.long	.L208-.L206
	.long	.L207-.L206
	.long	.L205-.L206
	.text
.L213:
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.expr,
	call	tac_expression	;
; src/tac.c:464: }
	popq	%r11	;
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rbx, %rsi	; status,
; src/tac.c:464: }
	popq	%rbx	;
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	movq	%rax, %rdi	; tmp142, _3
; src/tac.c:464: }
	popq	%rbp	;
; src/tac.c:425:         case EXPRESSION_STATEMENT: load_rvalue(tac_expression(statement->stmt.expr, status), status); break;
	jmp	load_rvalue	;
.L212:
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.var,
	xorl	%edx, %edx	;
; src/tac.c:464: }
	popq	%r10	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:426:         case VARIABLE_STATEMENT: tac_variable(statement->stmt.var, status, false); break;
	jmp	tac_variable	;
.L211:
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.if_stmt,
; src/tac.c:464: }
	popq	%r9	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:427:         case IF_STATEMENT: tac_if(statement->stmt.if_stmt, status); break;
	jmp	tac_if	;
.L210:
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.while_stmt,
; src/tac.c:464: }
	popq	%r8	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:428:         case WHILE_STATEMENT: tac_while(statement->stmt.while_stmt, status); break;
	jmp	tac_while	;
.L209:
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	movq	(%rdi), %rdi	; statement_32(D)->stmt.for_stmt,
; src/tac.c:464: }
	popq	%rcx	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:429:         case FOR_STATEMENT: tac_for(statement->stmt.for_stmt, status); break;
	jmp	tac_for	;
.L208:
; src/tac.c:431:             Arg* return_value = create_arg(ARG_VOID, NULL);
	movl	$5, %edi	;,
	xorl	%esi, %esi	;
	call	create_arg	;
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	movq	0(%rbp), %rdi	; statement_32(D)->stmt.return_expr, _8
; src/tac.c:432:             if (statement->stmt.return_expr != NULL)
	testq	%rdi, %rdi	; _8
	je	.L214	;,
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	movq	%rax, %rdi	; tmp144, _9
; src/tac.c:433:                 return_value = load_rvalue(tac_expression(statement->stmt.return_expr, status), status);
	call	load_rvalue	;
.L214:
; src/tac.c:434:             list_append(status->current_block->instructions, (pointer)create_instruction(INST_RET, return_value, NULL, NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	%rax, %rsi	; return_value,
	movl	$21, %edi	;,
	jmp	.L229	;
.L207:
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	movq	32(%rsi), %rdi	; status_33(D)->end_labels, status_33(D)->end_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:438:             if (!list_is_empty(status->end_labels)) {
	testb	%al, %al	; tmp147
	jne	.L215	;,
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	32(%rbx), %rax	; status_33(D)->end_labels, status_33(D)->end_labels
; src/tac.c:439:                 Arg* label = (Arg*)status->end_labels->tail->content;
	movq	8(%rax), %rax	; _15->tail, _15->tail
	movq	8(%rax), %rsi	; _16->content, label
; src/tac.c:440:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	je	.L215	;,
.L231:
; src/tac.c:441:                     Instruction* inst = create_instruction(INST_JMP, label, NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
.L229:
	call	create_instruction	;
	movq	%rax, %rsi	; tmp148, inst
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_33(D)->current_block, status_33(D)->current_block
	movq	8(%rax), %rdi	;, _17->instructions
; src/tac.c:464: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
; src/tac.c:442:                     list_append(status->current_block->instructions, (pointer)inst);
	jmp	*list_append@GOTPCREL(%rip)	;
.L215:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC21(%rip), %rdi	;, tmp130
	jmp	.L230	;
.L205:
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	movq	40(%rsi), %rdi	; status_33(D)->start_labels, status_33(D)->start_labels
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/tac.c:449:             if (!list_is_empty(status->start_labels)) {
	testb	%al, %al	; tmp149
	jne	.L216	;,
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	40(%rbx), %rax	; status_33(D)->start_labels, status_33(D)->start_labels
; src/tac.c:450:                 Arg* label = (Arg*)status->start_labels->tail->content;
	movq	8(%rax), %rax	; _22->tail, _22->tail
	movq	8(%rax), %rsi	; _23->content, label
; src/tac.c:451:                 if (label != NULL) {
	testq	%rsi, %rsi	; label
	jne	.L231	;,
.L216:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC22(%rip), %rdi	;, tmp137
.L230:
; src/tac.c:464: }
	popq	%rax	;
	popq	%rbx	;
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*fputs@GOTPCREL(%rip)	;
.L204:
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC23(%rip), %rdx	;, tmp139
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	tac_statement, .-tac_statement
	.globl	tac_for
	.type	tac_for, @function
tac_for:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp173, for_
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp174, status
	subq	$24, %rsp	;,
; src/tac.c:549:     if (for_->initializer != NULL)
	movq	(%rdi), %rdi	; for__55(D)->initializer, _1
; src/tac.c:549:     if (for_->initializer != NULL)
	testq	%rdi, %rdi	; _1
	je	.L233	;,
; src/tac.c:550:         tac_variable(for_->initializer, status, false);
	xorl	%edx, %edx	;
	call	tac_variable	;
.L233:
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
	movq	%rax, %r13	; tmp175, condition_label
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
; src/tac.c:553:     Var* body_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp176, body_label
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:555:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rbp)	;, for__55(D)->condition
; src/tac.c:554:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, 8(%rsp)	; tmp177, %sfp
; src/tac.c:555:     if (for_->condition != NULL) {
	je	.L234	;,
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp178, _3
; src/tac.c:557:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp179, inst
; src/tac.c:558:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _4->instructions, _4->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:559:         Block* condition_block = create_block(condition_label);
	movq	%r13, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r14	; tmp180, condition_block
; src/tac.c:560:         list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rsi	; condition_block,
	movq	32(%rax), %rdi	; _6->blocks, _6->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:561:         status->current_block = condition_block;
	movq	%r14, 16(%rbx)	; condition_block, status_56(D)->current_block
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	8(%rbp), %rdi	; for__55(D)->condition, for__55(D)->condition
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rax, %rdi	; tmp181, _9
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	call	load_rvalue	;
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
; src/tac.c:563:         Arg* condition = load_rvalue(tac_expression(for_->condition, status), status);
	movq	%rax, %r14	; tmp182, condition
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %r15	; tmp183, _10
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r15, %rcx	; _10,
	movq	%r14, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:564:         inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	; tmp184, _11
	jmp	.L247	;
.L234:
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rsi	; tmp186, _14
.L247:
; src/tac.c:568:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp187, inst
; src/tac.c:569:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	;, _15->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:572:     Block* body_block = create_block(body_label);
	movq	%r12, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp188, body_block
; src/tac.c:573:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rsi	; body_block,
	movq	32(%rax), %rdi	; _17->blocks, _17->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:574:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_56(D)->current_block
; src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	call	create_var	;
; src/tac.c:577:     if (for_->increment != NULL)
	cmpq	$0, 16(%rbp)	;, for__55(D)->increment
; src/tac.c:576:     Var* increment_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r14	; tmp189, increment_label
; src/tac.c:578:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, increment_label));
	movq	%rax, %rsi	; increment_label,
; src/tac.c:577:     if (for_->increment != NULL)
	jne	.L248	;,
; src/tac.c:579:     else if (for_->condition != NULL)
	cmpq	$0, 8(%rbp)	;, for__55(D)->condition
; src/tac.c:580:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%r13, %rsi	; condition_label,
; src/tac.c:579:     else if (for_->condition != NULL)
	jne	.L248	;,
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%r12, %rsi	; body_label,
.L248:
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	movq	%rax, %rsi	; tmp192, _25
; src/tac.c:582:         list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, body_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rsi	; %sfp,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_56(D)->end_labels, status_56(D)->end_labels
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rsi	; tmp193, _27
; src/tac.c:583:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:584:     list(Statement*) body_statements = list_copy(for_->body);
	movq	24(%rbp), %rdi	; for__55(D)->body, for__55(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp194, body_statements
.L239:
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r15, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp195, statement
; src/tac.c:586:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L249	;,
; src/tac.c:587:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L239	;
.L249:
; src/tac.c:588:     list_pop_back(status->start_labels);
	movq	40(%rbx), %rdi	; status_56(D)->start_labels, status_56(D)->start_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:589:     list_pop_back(status->end_labels);
	movq	32(%rbx), %rdi	; status_56(D)->end_labels, status_56(D)->end_labels
	call	*list_pop_back@GOTPCREL(%rip)	;
; src/tac.c:590:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rbp)	;, for__55(D)->increment
	je	.L241	;,
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%r14, %rsi	; increment_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	movq	%rax, %rsi	; tmp196, _33
; src/tac.c:592:         Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, increment_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp197, inst
; src/tac.c:593:         list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_56(D)->current_block, status_56(D)->current_block
	movq	8(%rax), %rdi	; _34->instructions, _34->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:594:         Block* increment_block = create_block(increment_label);
	movq	%r14, %rdi	; increment_label,
	call	create_block	;
	movq	%rax, %r14	; tmp198, increment_block
; src/tac.c:595:         list_append(status->current_subroutine->blocks, (pointer)increment_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%r14, %rsi	; increment_block,
	movq	32(%rax), %rdi	; _36->blocks, _36->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:596:         status->current_block = increment_block;
	movq	%r14, 16(%rbx)	; increment_block, status_56(D)->current_block
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	16(%rbp), %rdi	; for__55(D)->increment, for__55(D)->increment
	movq	%rbx, %rsi	; status,
	call	tac_expression	;
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	movq	%rax, %rdi	; tmp199, _39
; src/tac.c:597:         load_rvalue(tac_expression(for_->increment, status), status);
	call	load_rvalue	;
.L241:
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%r13, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp200, _40
; src/tac.c:600:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
; src/tac.c:601:     if (for_->condition == NULL)
	cmpq	$0, 8(%rbp)	;, for__55(D)->condition
	jne	.L242	;,
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%r12, %rsi	; body_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	movq	%rax, %rsi	; tmp202, _42
; src/tac.c:602:         inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, body_label), NULL, NULL);
	call	create_instruction	;
.L242:
; src/tac.c:603:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rdx	; status_56(D)->current_block, status_56(D)->current_block
	movq	%rax, %rsi	; inst,
	movq	8(%rdx), %rdi	; _43->instructions, _43->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:605:     Block* end_block = create_block(end_label);
	movq	8(%rsp), %rdi	; %sfp,
	call	create_block	;
	movq	%rax, %rbp	; tmp204, end_block
; src/tac.c:606:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_56(D)->current_subroutine, status_56(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _45->blocks, _45->blocks
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
	.size	tac_for, .-tac_for
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
	movq	%rdi, %r13	; tmp138, while_
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%edi, %edi	;
; src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp139, status
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	xorl	%esi, %esi	;
; src/tac.c:610: void tac_while(While* while_, TACStatus* status) {
	subq	$24, %rsp	;,
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movl	$6, %edi	;,
	movq	%rax, %rsi	; condition_label,
; src/tac.c:613:     Var* condition_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %rbp	; tmp140, condition_label
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_arg	;
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp141, _1
; src/tac.c:614:     Instruction* inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp142, inst
; src/tac.c:615:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _2->instructions, _2->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:616:     Block* condition_block = create_block(condition_label);
	movq	%rbp, %rdi	; condition_label,
	call	create_block	;
	movq	%rax, %r12	; tmp143, condition_block
; src/tac.c:617:     list_append(status->current_subroutine->blocks, (pointer)condition_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	%r12, %rsi	; condition_block,
	movq	32(%rax), %rdi	; _4->blocks, _4->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:618:     status->current_block = condition_block;
	movq	%r12, 16(%rbx)	; condition_block, status_28(D)->current_block
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
	movq	%rax, %r14	; tmp144, body_label
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	call	create_var	;
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	0(%r13), %rdi	; while__43(D)->condition,
	movq	%rbx, %rsi	; status,
; src/tac.c:621:     Var* end_label = create_var(NULL, NULL, VAR_BLOCK, status);
	movq	%rax, %r12	; tmp145, end_label
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	tac_expression	;
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rbx, %rsi	; status,
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rax, %rdi	; tmp146, _7
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	call	load_rvalue	;
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
; src/tac.c:622:     Arg* condition = load_rvalue(tac_expression(while_->condition, status), status);
	movq	%rax, %r15	; tmp147, condition
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%r14, %rsi	; body_label,
	movl	$6, %edi	;,
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, 8(%rsp)	; _8, %sfp
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_arg	;
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	8(%rsp), %rcx	; %sfp, _8
	movq	%r15, %rsi	; condition,
	movl	$19, %edi	;,
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	movq	%rax, %rdx	; tmp149, _9
; src/tac.c:623:     inst = create_instruction(INST_JMP_C, condition, create_arg(ARG_LABEL, body_label), create_arg(ARG_LABEL, end_label));
	call	create_instruction	;
	movq	%rax, %rsi	; tmp150, inst
; src/tac.c:624:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _10->instructions, _10->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:626:     Block* body_block = create_block(body_label);
	movq	%r14, %rdi	; body_label,
	call	create_block	;
	movq	%rax, %r14	; tmp151, body_block
; src/tac.c:627:     list_append(status->current_subroutine->blocks, (pointer)body_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	%r14, %rsi	; body_block,
	movq	32(%rax), %rdi	; _12->blocks, _12->blocks
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:628:     status->current_block = body_block;
	movq	%r14, 16(%rbx)	; body_block, status_28(D)->current_block
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rbp, %rsi	; condition_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	40(%rbx), %rdi	; status_28(D)->start_labels, status_28(D)->start_labels
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	movq	%rax, %rsi	; tmp152, _14
; src/tac.c:630:     list_append(status->start_labels, (pointer)create_arg(ARG_LABEL, condition_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%r12, %rsi	; end_label,
	movl	$6, %edi	;,
	call	create_arg	;
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	32(%rbx), %rdi	; status_28(D)->end_labels, status_28(D)->end_labels
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	movq	%rax, %rsi	; tmp153, _16
; src/tac.c:631:     list_append(status->end_labels, (pointer)create_arg(ARG_LABEL, end_label));
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:632:     list(Statement*) body_statements = list_copy(while_->body);
	movq	8(%r13), %rdi	; while__43(D)->body, while__43(D)->body
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp154, body_statements
.L251:
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	movq	%r13, %rdi	; body_statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp155, statement
; src/tac.c:634:     while ((statement = (Statement*)list_pop(body_statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L254	;,
; src/tac.c:635:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L251	;
.L254:
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
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$20, %edi	;,
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	movq	%rax, %rsi	; tmp156, _21
; src/tac.c:639:     inst = create_instruction(INST_JMP, create_arg(ARG_LABEL, condition_label), NULL, NULL);
	call	create_instruction	;
	movq	%rax, %rsi	; tmp157, inst
; src/tac.c:640:     list_append(status->current_block->instructions, (pointer)inst);
	movq	16(%rbx), %rax	; status_28(D)->current_block, status_28(D)->current_block
	movq	8(%rax), %rdi	; _22->instructions, _22->instructions
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:642:     Block* end_block = create_block(end_label);
	movq	%r12, %rdi	; end_label,
	call	create_block	;
	movq	%rax, %rbp	; tmp158, end_block
; src/tac.c:643:     list_append(status->current_subroutine->blocks, (pointer)end_block);
	movq	8(%rbx), %rax	; status_28(D)->current_subroutine, status_28(D)->current_subroutine
	movq	%rbp, %rsi	; end_block,
	movq	32(%rax), %rdi	; _24->blocks, _24->blocks
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
	movq	%rdi, %rbp	; tmp110, function
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp111, status
	pushq	%rcx	;
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	8(%rdi), %rsi	; function_16(D)->return_type, function_16(D)->return_type
	movq	(%rdi), %rdi	; function_16(D)->name,
	call	create_subroutine	;
; src/tac.c:322:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_19(D)->current_subroutine
; src/tac.c:321:     Subroutine* subroutine = create_subroutine(function->name, function->return_type);
	movq	%rax, %r12	; tmp112, subroutine
; src/tac.c:323:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_19(D)->tac, status_19(D)->tac
	movq	%r12, %rsi	; subroutine,
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:325:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rdi	; function_16(D)->parameters, function_16(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp113, parameters
.L256:
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:327:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L261	;,
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rdi	; parameter_25->name, parameter_25->name
	movq	(%rax), %rsi	; parameter_25->type,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_18->parameters, subroutine_18->parameters
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp114, _8
; src/tac.c:328:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L256	;
.L261:
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %rdi	; tmp116, _10
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_18->blocks, subroutine_18->blocks
; src/tac.c:330:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	; tmp117, block
; src/tac.c:331:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	movq	24(%rbp), %rdi	; function_16(D)->body, function_16(D)->body
; src/tac.c:332:     status->current_block = block;
	movq	%r13, 16(%rbx)	; block, status_19(D)->current_block
; src/tac.c:334:     list(Statement*) statements = list_copy(function->body);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp118, statements
.L258:
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%rbp, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp119, statement
; src/tac.c:336:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L262	;,
; src/tac.c:337:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L258	;
.L262:
; src/tac.c:339:     status->current_subroutine = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbx)	;, status_19(D)->current_subroutine
; src/tac.c:341: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_function, .-tac_function
	.section	.rodata.str1.1
.LC24:
	.string	"[Warning] Constructor '%s' does not start with 'self' initialization\n"
	.text
	.globl	tac_method
	.type	tac_method, @function
tac_method:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp153, method
	pushq	%rbx	;
; src/tac.c:342: void tac_method(Method* method, TACStatus* status) {
	movq	%rsi, %rbx	; tmp154, status
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	8(%rdi), %rsi	; method_43(D)->return_type, method_43(D)->return_type
	movq	(%rdi), %rdi	; method_43(D)->name,
	call	create_subroutine	;
; src/tac.c:346:     status->current_subroutine = subroutine;
	movq	%rax, 8(%rbx)	; subroutine, status_46(D)->current_subroutine
; src/tac.c:345:     Subroutine* subroutine = create_subroutine(method->name, method->return_type);
	movq	%rax, %r12	; tmp155, subroutine
; src/tac.c:347:     list_append(status->tac->subroutines, (pointer)subroutine);
	movq	(%rbx), %rax	; status_46(D)->tac, status_46(D)->tac
	movq	%r12, %rsi	; subroutine,
	movq	24(%rax), %rdi	; _3->subroutines, _3->subroutines
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:349:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rdi	; method_43(D)->parameters, method_43(D)->parameters
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp156, parameters
.L264:
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	movq	%r13, %rdi	; parameters,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:351:     while ((parameter = (Variable*)list_pop(parameters)) != NULL)
	testq	%rax, %rax	; parameter
	je	.L272	;,
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	8(%rax), %rdi	; parameter_52->name, parameter_52->name
	movq	(%rax), %rsi	; parameter_52->type,
	movq	%rbx, %rcx	; status,
	movl	$112, %edx	;,
	call	create_var	;
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	16(%r12), %rdi	; subroutine_45->parameters, subroutine_45->parameters
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	movq	%rax, %rsi	; tmp157, _8
; src/tac.c:352:         list_append(subroutine->parameters, (pointer)create_var(parameter->name, parameter->type, VAR_PARAM, status));
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L264	;
.L272:
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rbx, %rcx	; status,
	movl	$98, %edx	;,
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_var	;
	movq	%rax, %rdi	; tmp159, _10
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	call	create_block	;
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	32(%r12), %rdi	; subroutine_45->blocks, subroutine_45->blocks
; src/tac.c:354:     Block* block = create_block(create_var(NULL, NULL, VAR_BLOCK, status));
	movq	%rax, %r13	; tmp160, block
; src/tac.c:355:     list_append(subroutine->blocks, (pointer)block);
	movq	%rax, %rsi	; block,
	call	*list_append@GOTPCREL(%rip)	;
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	24(%rbp), %rdi	; method_43(D)->body, method_43(D)->body
; src/tac.c:356:     status->current_block = block;
	movq	%r13, 16(%rbx)	; block, status_46(D)->current_block
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	DEFAULT_CONSTRUCTOR_NAME(%rip), %rsi	; DEFAULT_CONSTRUCTOR_NAME,
; src/tac.c:358:     list(Statement*) statements = list_copy(method->body);
	movq	%rax, %r12	; tmp161, statements
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	24(%rbx), %rax	; status_46(D)->current_class, status_46(D)->current_class
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	(%rax), %rax	; _14->name, _14->name
	movq	8(%rax), %rdi	; _15->name, _15->name
	call	*make_method_name@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp162, _17
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	0(%rbp), %rax	; method_43(D)->name, method_43(D)->name
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	movq	8(%rax), %rdi	; _18->name, _18->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:359:     if (strcmp(method->name->name, make_method_name(status->current_class->name->name, DEFAULT_CONSTRUCTOR_NAME)) == 0) {
	testl	%eax, %eax	; tmp163
	jne	.L269	;,
; src/tac.c:360:         Statement* stmt = (Statement*)list_pop(statements);
	movq	%r12, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 8(%rax)	;, stmt_62->type
	jne	.L267	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; stmt_62->stmt.expr, _22
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$19, 24(%rax)	;, _22->operator
	jne	.L267	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	8(%rax), %rax	; _22->prim_left, _24
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$8, 8(%rax)	;, _24->type
	jne	.L267	;,
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	movq	(%rax), %rax	; _24->value.var, _26
; src/tac.c:361:         if (stmt->type != EXPRESSION_STATEMENT || stmt->stmt.expr->operator != OP_NONE || stmt->stmt.expr->prim_left->type != PRIM_VARIABLE_ACCESS || stmt->stmt.expr->prim_left->value.var->type != VAR_NAME) {
	cmpl	$0, 16(%rax)	;, _26->type
	je	.L268	;,
.L267:
; src/tac.c:362:             fprintf(stderr, "[Warning] Constructor '%s' does not start with 'self' initialization\n", method->name->name);
	movq	0(%rbp), %rax	; method_43(D)->name, method_43(D)->name
; src/tac.c:375: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC24(%rip), %rdx	;, tmp149
	movl	$2, %esi	;,
; src/tac.c:375: }
	popq	%rbp	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/tac.c:375: }
	popq	%r12	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	8(%rax), %rcx	; _28->name, _28->name
	xorl	%eax, %eax	;
; src/tac.c:375: }
	popq	%r13	;
	popq	%r14	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
.L268:
; src/tac.c:365:         Symbol* self = stmt->stmt.expr->prim_left->value.var->content.name;
	movq	8(%rax), %r14	; _26->content.name, self
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	24(%rbx), %rax	; status_46(D)->current_class, tmp171
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$1, %edi	;,
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	leaq	24(%rax), %rsi	;, tmp150
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	(%r14), %rsi	; self_63->type,
	movq	%rbx, %rcx	; status,
	movl	$118, %edx	;,
	movq	%r14, %rdi	; self,
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rbp	; tmp165, _33
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_var	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	xorl	%edi, %edi	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; tmp166, _35
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_arg	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movl	$18, %edi	;,
	xorl	%ecx, %ecx	;
	movq	%rbp, %rdx	; _33,
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; tmp167, _36
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	create_instruction	;
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	8(%r13), %rdi	; block_55->instructions, block_55->instructions
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	movq	%rax, %rsi	; tmp168, _37
; src/tac.c:366:         list_append(block->instructions, (pointer)create_instruction(INST_ALLOC, create_arg(ARG_VARIABLE, create_var(self, self->type, VAR_VAR, status)), create_arg(ARG_INT, &status->current_class->size), NULL));
	call	*list_append@GOTPCREL(%rip)	;
.L269:
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	movq	%r12, %rdi	; statements,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %rdi	; tmp169, statement
; src/tac.c:370:     while ((statement = (Statement*)list_pop(statements)) != NULL)
	testq	%rax, %rax	; statement
	je	.L273	;,
; src/tac.c:371:         tac_statement(statement, status);
	movq	%rbx, %rsi	; status,
	call	tac_statement	;
	jmp	.L269	;
.L273:
; src/tac.c:373:     status->current_subroutine = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 8(%rbx)	;, status_46(D)->current_subroutine
; src/tac.c:375: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	tac_method, .-tac_method
	.section	.rodata.str1.1
.LC25:
	.string	"[Warning] Unsupported class member type for tac_class: %d\n"
	.text
	.globl	tac_class
	.type	tac_class, @function
tac_class:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp101, class
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp102, status
	pushq	%rcx	;
; src/tac.c:378:     status->current_class = class;
	movq	%rdi, 24(%rsi)	; class, status_12(D)->current_class
; src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rdi), %rdi	; class_13(D)->members, class_13(D)->members
	call	*list_copy@GOTPCREL(%rip)	;
; src/tac.c:381:     AttributeTable* attr_table = create_attribute_table(class->name);
	movq	0(%rbp), %r13	; class_13(D)->name, _2
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	movl	$24, %edi	;,
; src/tac.c:379:     list(ClassMember*) members = list_copy(class->members);
	movq	%rax, %r12	; tmp103, members
; src/tac.c:8:     AttributeTable* table = (AttributeTable*)alloc_memory(sizeof(AttributeTable));
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp104, table
; src/tac.c:9:     table->attributes = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/tac.c:11:     table->size = 0;
	xorl	%esi, %esi	;
; src/tac.c:10:     table->name = name;
	movq	%r13, 8(%rbp)	; _2, table_26->name
; src/tac.c:9:     table->attributes = create_list();
	movq	%rax, 0(%rbp)	; tmp105, table_26->attributes
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rbx), %rax	; status_12(D)->tac, status_12(D)->tac
; src/tac.c:11:     table->size = 0;
	movq	%rsi, 16(%rbp)	;, table_26->size
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	%rbp, %rsi	; table,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC25(%rip), %rbp	;, tmp100
; src/tac.c:383:     list_append(status->tac->attribute_tables, (pointer)attr_table);
	movq	(%rax), %rdi	; _3->attribute_tables,
	call	*list_append@GOTPCREL(%rip)	;
.L275:
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	movq	%r12, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
; src/tac.c:384:     while ((member = (ClassMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; member
	je	.L283	;,
; src/tac.c:385:         switch (member->type) {
	movl	8(%rax), %ecx	; member_21->type, _5
; src/tac.c:385:         switch (member->type) {
	testl	%ecx, %ecx	; _5
	je	.L276	;,
	cmpl	$1, %ecx	;, _5
	jne	.L284	;,
; src/tac.c:390:                 tac_variable(member->content.variable, status, true);
	movq	(%rax), %rdi	; member_21->content.variable,
	movl	$1, %edx	;,
	movq	%rbx, %rsi	; status,
	call	tac_variable	;
; src/tac.c:391:                 break;
	jmp	.L275	;
.L276:
; src/tac.c:387:                 tac_method(member->content.method, status);
	movq	(%rax), %rdi	; member_21->content.method,
	movq	%rbx, %rsi	; status,
	call	tac_method	;
; src/tac.c:388:                 break;
	jmp	.L275	;
.L284:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbp, %rdx	; tmp100,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
	jmp	.L275	;
.L283:
; src/tac.c:397:     status->current_class = NULL;
	xorl	%eax, %eax	;
	movq	%rax, 24(%rbx)	;, status_12(D)->current_class
; src/tac.c:399: }
	popq	%rdx	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	tac_class, .-tac_class
	.section	.rodata.str1.1
.LC26:
	.string	"[Warning] Unsupported symbol kind for import: %d\n"
	.text
	.globl	tac_import
	.type	tac_import, @function
tac_import:
	pushq	%rbx	;
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movq	(%rdi), %rdi	; import_14(D)->name, _1
; src/tac.c:305: void tac_import(Import* import, TAC* tac, TACStatus* status) {
	movq	%rdx, %rcx	; tmp104, status
	movq	%rsi, %rbx	; tmp103, tac
; src/tac.c:308:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_VAR, status));
	movl	$118, %edx	;,
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	movl	32(%rdi), %eax	; _1->kind, _2
; src/tac.c:307:     if (import->name->kind == SYMBOL_VARIABLE)
	cmpl	$3, %eax	;, _2
	je	.L290	;,
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	leal	-1(%rax), %edx	;, tmp97
; src/tac.c:309:     else if (import->name->kind == SYMBOL_FUNCTION || import->name->kind == SYMBOL_METHOD)
	cmpl	$1, %edx	;, tmp97
	ja	.L287	;,
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movl	$102, %edx	;,
.L290:
	movq	(%rdi), %rsi	; _1->type,
	call	create_var	;
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	16(%rbx), %rdi	; tac_18(D)->global_vars, tac_18(D)->global_vars
; src/tac.c:317: }
	popq	%rbx	;
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	movq	%rax, %rsi	; tmp106, _8
; src/tac.c:310:         list_append(tac->global_vars, (pointer)create_var(import->name, import->name->type, VAR_SUBROUTINE, status));
	jmp	*list_append@GOTPCREL(%rip)	;
.L287:
; src/tac.c:311:     else if (import->name->kind == SYMBOL_CLASS)
	testl	%eax, %eax	; _2
	jne	.L288	;,
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	movq	24(%rdi), %rdi	; _1->ast_node.class, _1->ast_node.class
	movq	%rcx, %rsi	; status,
; src/tac.c:317: }
	popq	%rbx	;
; src/tac.c:313:         tac_class(import->name->ast_node.class, status);
	jmp	tac_class	;
.L288:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%eax, %ecx	; _2,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	leaq	.LC26(%rip), %rdx	;, tmp101
; src/tac.c:317: }
	popq	%rbx	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	*__fprintf_chk@GOTPCREL(%rip)	;
	.size	tac_import, .-tac_import
	.section	.rodata.str1.1
.LC27:
	.string	"main"
	.text
	.globl	tac_code
	.type	tac_code, @function
tac_code:
	pushq	%r14	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	leaq	.LC27(%rip), %r14	;, tmp108
; src/tac.c:285: TAC* tac_code(Code* code) {
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp109, code
; src/tac.c:61:     TAC* tac = (TAC*)alloc_memory(sizeof(TAC));
	movl	$32, %edi	;,
; src/tac.c:285: TAC* tac_code(Code* code) {
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
; src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
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
; src/tac.c:290:     list(CodeMember*) members = list_copy(code->members);
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp117, members
.L292:
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	movq	%r13, %rdi	; members,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp119, code_member
; src/tac.c:292:     while ((code_member = (CodeMember*)list_pop(members)) != NULL) {
	testq	%rax, %rax	; code_member
	je	.L300	;,
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	movl	8(%r12), %eax	; code_member_21->type, _2
; src/tac.c:293:         if (code_member->type == CODE_FUNCTION) {
	cmpl	$1, %eax	;, _2
	jne	.L293	;,
; src/tac.c:294:             tac_function(code_member->content.function, status);
	movq	(%r12), %rdi	; code_member_21->content.function,
	movq	%rbx, %rsi	; status,
	call	tac_function	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%r12), %rax	; code_member_21->content.function, code_member_21->content.function
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	%r14, %rsi	; tmp108,
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	(%rax), %r12	; _4->name, _5
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	movq	8(%r12), %rdi	; _5->name, _5->name
	call	*strcmp@GOTPCREL(%rip)	;
; src/tac.c:295:             if (strcmp(code_member->content.function->name->name, "main") == 0)
	testl	%eax, %eax	; tmp118
	jne	.L292	;,
; src/tac.c:296:                 tac->entry_point = code_member->content.function->name;
	movq	%r12, 8(%rbp)	; _5, tac_29->entry_point
	jmp	.L292	;
.L293:
; src/tac.c:297:         } else if (code_member->type == CODE_CLASS)
	cmpl	$2, %eax	;, _2
	jne	.L296	;,
; src/tac.c:298:             tac_class(code_member->content.class, status);
	movq	(%r12), %rdi	; code_member_21->content.class,
	movq	%rbx, %rsi	; status,
	call	tac_class	;
	jmp	.L292	;
.L296:
; src/tac.c:299:         else if (code_member->type == CODE_IMPORT)
	testl	%eax, %eax	; _2
	jne	.L292	;,
; src/tac.c:300:             tac_import(code_member->content.import, tac, status);
	movq	(%r12), %rdi	; code_member_21->content.import,
	movq	%rbx, %rdx	; status,
	movq	%rbp, %rsi	; <retval>,
	call	tac_import	;
	jmp	.L292	;
.L300:
; src/tac.c:304: }
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
	.type	CSWTCH.47, @object
	.size	CSWTCH.47, 19
CSWTCH.47:
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
.LC15:
	.long	0
	.long	-1074790400
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
